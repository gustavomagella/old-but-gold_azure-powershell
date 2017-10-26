cls
'                     ___                             _    _   _ ______  _   _ 
                     / _ \                           | |  | | | || ___ \| \ | |
                    / /_\ \ ____ _   _  _ __   ___   | |  | | | || |_/ /|  \| |
                    |  _  ||_  /| | | ||  __| / _ \  | |  | | | ||  __/ | . ` |
                    | | | | / / | |_| || |   |  __/  | |  \ \_/ /| |    | |\  |
                    \_| |_//___| \__,_||_|    \___|  | |   \___/ \_|    \_| \_/
                                                     | |                       
                                                     |_|                       


               #########################################################################
               #          Desenvolvido por: Gustavo Magella - gustavomagella.com       #
               #                                                                       #
               #                               V .1.0                                  #
               #########################################################################

                          
                          # CRIAÇÃO DE VPN (SITE-TO-SITE) NO MICROSOFT AZURE #
                          
'
''
PAUSE
''
''
'                    
                     ############################################################
                     #                                                          #
                     #       EFETUANDO O LOGIN EM SUA CONTA MICROSOFT AZURE     #
                     #                                                          #
                     #           GENTILEZA FORNECER SUAS CREDENCIAIS ;)         #
                     #                                                          #
                     ############################################################
'
''
Login-AzureRmAccount
PAUSE
'                    
                     #######################################################################
                     #                                                                     #
                     #         OBTENDO LISTA DE GRUPOS DE RECURSOS DISPONIVEIS             #
                     #                                                                     #
                     #   (Verifique abaixo, qual o Grupo de Recursos voce ira utilizar)    #
                     #                                                                     #
                     #######################################################################
'
Get-AzureRmResourceGroup | Select ResourceGroupName,Location
''
''
'ATENCAO! GRAVE BEM O NOME DO GRUPO DE RECURSOS E A LOCATION, ESSES SERAO SOLICITADOS NO SCRIPT!'
''
''
PAUSE
'

DIGITE O NOME DO GRUPO DE RECURSOS QUE DESEJA UTILIZAR:

'
$rg=Read-Host
''
''
''
'DIGITE A "LOCATION" DO GRUPO DE RECURSOS:

'
$loc=Read-Host
''
''
''
'                    
                     #######################################################################
                     #                                                                     #
                     #           OBTENDO LISTA DE vNETs DISPONIVEIS PARA USO               #
                     #                                                                     #
                     #   (Verifique abaixo, qual o Grupo de Recursos voce ira utilizar)    #
                     #                                                                     #
                     #######################################################################

'
Get-AzureRmVirtualNetwork | select name
''
''
'

DIGITE O NOME DA vNET QUE VC DESEJA UTILIZAR:

'
$namevnet=Read-Host
$vnet = Get-AzureRmVirtualNetwork -Name $namevnet -ResourceGroupName $rg
''
''
'
                     #######################################################################
                     #                                                                     #
                     #           OBTENDO LISTA DE SUBNETS DISPONIVEIS PARA USO             #
                     #                                                                     #
                     #         (Verifique abaixo, qual subnet voce ira utilizar)           #
                     #                                                                     #
                     #######################################################################

'
Get-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet | select Name, AddressPrefix
'

DIGITE O NOME DA SUBNET QUE VOCE IRA UTILIZAR PARA FECHAR A VPN:

'
$subnetvpn=Read-Host
''
''
'
DIGITE O IP/MASCARA DA SUBNET ESCOLHIDA:

'
$ipsubnetvpn=Read-Host
''
''
''
'
                     #######################################################################
                     #                                                                     #
                     #           PASSO ( 1 )  CRIAÇÃO DO GATEWAY LOCAL                     #
                     #                                                                     #
                     #    Voce devera criar um nome para gateway local, informar o         #
                     #    ip publico de sua organizacao (qual vai ser usado para a VPN) e  #
                     #    a rede interna com mascara (Ex.: 172.16.0.0/16)                  #
                     #                                                                     #
                     #######################################################################

'
''
''
'

DIGITE UM NOME PARA O GATEWAY LOCAL:

'
$gwloc=Read-Host
''
''
'

DIGITE O IP PUBLICO QUE SERA USADO (IP DO LINK DEDICADO DA EMPRESA):

'
$ippubloc=Read-Host
''
''
'

DIGITE A REDE INTERNA QUE COMUNICARA VIA VPN (EX.: 172.16.0.0/16):

'
$netinter=Read-Host
''
''
'
                     #######################################################################
                     #                                                                     #
                     #       PASSO ( 2 ) CRIANDO O GATEWAY DE REDE LOCAL NO AZURE          #
                     #                                                                     #
                     #                      (Aguarde um momento! )                         #
                     #                                                                     #
                     #######################################################################


'
'

DIGITE UM NOME PARA O IP PUBLICO NO AZURE:

'
$azrpubipname=Read-Host
''
''
New-AzureRmLocalNetworkGateway -Name $gwloc -ResourceGroupName $rg -Location $loc -GatewayIpAddress $ippubloc -AddressPrefix $netinter
''
''
'
                     #######################################################################
                     #                                                                     #
                     #       PASSO ( 3 )  CRIANDO O IP PUBLICO [DINAMICO] NO AZURE         #
                     #                                                                     #
                     #                      (Aguarde um momento! )                         #
                     #                                                                     #
                     #######################################################################

'
$azrpubip= New-AzureRmPublicIpAddress -Name $azrpubipname -ResourceGroupName $rg -Location $loc -AllocationMethod Dynamic
''
''
'

                                   ############################################
                                              Criado com Sucesso ! ! !
                                   ############################################
'
''
''
'

DIGITE UM NOME PARA O GATEWAY DE REDE VIRTUAL NO AZURE:

'
$gwvirt=Read-Host
''
''
'
                     #######################################################################
                     #                                                                     #
                     #      PASSO ( 4 )  CRIANDO O GATEWAY DE REDE VIRTUAL NO AZURE        #  
                     #                                                                     #
                     #                 [TIPO: BASICO] [ROUTE BASED]                       #
                     #                                                                     #
                     #         (Esse processo demora até 40 minutos! Aguarde! )            #
                     #                                                                     #
                     #######################################################################

'
$subnet = Get-AzureRmVirtualNetworkSubnetConfig -Name $subnetvpn -VirtualNetwork $vnet
$gwipconfig = New-AzureRmVirtualNetworkGatewayIpConfig -Name GWIPConfig -SubnetId $subnet.Id -PublicIpAddressId $azrpubip.Id
New-AzureRmVirtualNetworkGateway -Name $gwvirt -ResourceGroupName $rg -Location $loc -IpConfigurations $gwipconfig -GatewayType Vpn -VpnType RouteBased -GatewaySku Basic
''
'

                                   ############################################
                                              Criado com Sucesso ! ! !
                                   ############################################
'
''
'

                                   ############################################
                                           SEU IP PÚBLICO DO AZURE É:
                                   ############################################
'
''
Get-AzureRmPublicIpAddress | Select Name,ResourceGroupName,Location,PublicIpAllocationMethod,IpAddress
''
'

                                   #############################################
                                     INFORME NO SEU ROTEADOR PARA FECHAR A VPN
                                   #############################################
'
''
'

DIGITE UM NOME PARA A CONEXAO VPN:

'
$vpncon=Read-Host
''
'

ATENCAO! A VPN FECHADA E DO TIPO [IPSEC]

DIGITE UMA SENHA PARA A VPN (CONTENDO APENAS LETRAS E NUMEROS):

'
$vpnpass=Read-Host
''
'
                     #######################################################################
                     #                                                                     #
                     #          PASSO ( 5 )   CRIANDO A CONEXÃO VPN NO AZURE               #  
                     #                                                                     #
                     #                          ( Aguarde! )                               #
                     #                                                                     #
                     #######################################################################

'
$gateway1 = Get-AzureRmVirtualNetworkGateway -Name $gwvirt -ResourceGroupName $rg
$local = Get-AzureRmLocalNetworkGateway -Name $gwloc -ResourceGroupName $rg
New-AzureRmVirtualNetworkGatewayConnection -Name $vpncon -ResourceGroupName $rg -Location $loc -VirtualNetworkGateway1 $gateway1 -LocalNetworkGateway2 $local -ConnectionType IPsec -RoutingWeight 10 -SharedKey $vpnpass
''
'
                                   ############################################
                                              Criada com Sucesso ! ! !
                                   ############################################

                                   ############################################
                                             VPN CRIADA COM SUCESSO ! ! !
                                   ############################################
'
cd c:/
mkdir C:\azure_logs\vpn
cd .\azure_logs\vpn
Get-AzureRmVirtualNetworkGatewayConnection -Name $vpncon -ResourceGroupName $rg >> VPN_Connection.txt
'
Para mais informacoes e Logs, acesse: c:\azure_logs\vpn\VPN_Connection.txt

Boa sorte e um forte abraço!

Desenvolvido por: Gustavo Magella | # gustavomagella.com #'
PAUSE
exit
#Mudando o SKU do Gateway: Get-AzureRmVirtualNetworkGateway -Name 'Nome_do_Gateway_Virtual' -ResourceGroupName 'Resource_Group_do_Gateway' | Resize-AzureRmVirtualNetworkGateway -GatewaySku 'Standard'