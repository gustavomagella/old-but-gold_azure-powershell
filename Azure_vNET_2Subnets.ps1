cls
'
                      ___                            _          _   _  _____  _____ 
                     / _ \                          | |        | \ | ||  ___||_   _|
                    / /_\ \ ____ _   _  _ __   ___  | | __   __|  \| || |__    | |  
                    |  _  ||_  /| | | ||  __| / _ \ | | \ \ / /| . ` ||  __|   | |  
                    | | | | / / | |_| || |   |  __/ | |  \ V / | |\  || |___   | |  
                    \_| |_//___| \__,_||_|    \___| | |   \_/  \_| \_/\____/   \_/  
                                                    | |                             
                                                    |_|                             


               #########################################################################
               #                                                                       #
               #          Desenvolvido por: Gustavo Magella - gustavomagella.com       #
               #                                                                       #
               #                               V .1.0                                  #
               #########################################################################

                          
                          #  CRIAÇÃO DE UMA vNET NO AZURE E 2 SUBNETS  #
'
PAUSE
''
''
'                    ############################################################
                     #                                                          #
                     #       EFETUANDO O LOGIN EM SUA CONTA MICROSOFT AZURE     #
                     #                                                          #
                     #           GENTILEZA FORNECER SUAS CREDENCIAIS ;)         #
                     #                                                          #
                     ############################################################
'
Login-AzureRmAccount
PAUSE
'                    #######################################################################
                     #                                                                     #
                     #         OBTENDO LISTA DE GRUPOS DE RECURSOS DISPONIVEIS             #
                     #                                                                     #
                     #   (Verifique abaixo, qual o Grupo de Recursos voce ira utilizar)    #
                     #                                                                     #
                     #######################################################################
'

Get-AzureRmResourceGroup | Select ResourceGroupName,Location

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
'DIGITE UM NOME E A CLASSE DE IP (COM MASCARA), PARA A PRIMEIRA SUBNET A SER CRIADA:
(Ex: GatewaySubnet, Subnet1, ServersSubnet)

NOME:'
$subname1=Read-Host
''
''
''
''
'CLASSE DE IP
(Ex: 10.0.0.0/28, 172.16.0.0/28):'
$subipclass1=Read-Host
''
'DIGITE UM NOME E A CLASSE DE IP (COM MASCARA), PARA A SEGUNDA SUBNET A SER CRIADA:
(Ex: GatewaySubnet, Subnet1, ServersSubnet)

NOME:'
$subname2=Read-Host
''
''
''
''
'CLASSE DE IP
(Ex: 10.0.1.0/28, 172.16.1.0/28):'
$subipclass2=Read-Host
''
$subnet1 = New-AzureRmVirtualNetworkSubnetConfig -Name $subname1 -AddressPrefix $subipclass1
$subnet2 = New-AzureRmVirtualNetworkSubnetConfig -Name $subname2 -AddressPrefix $subipclass2
''
''
''
#CRIAR UMA VNET COM 2 SUBNETS USANDO AS VARIAVEIS DE CIMA

'DIGITE UM NOME E A CLASSE DE IP (COM MASCARA), PARA A vNET A SER CRIADA:
(Ex: vNET Azure, vNET Pessoal, etc.)

NOME:'
$vnet=Read-Host
''
''
''
''
' CLASSE DE IP (Recomendado usar uma mascara /16)
(Ex: 10.0.0.0/16, 172.16.0.0/16):'
$vnetipclass=Read-Host
''
''
''
''
'                    #######################################################################
                     #                                                                     #
                     #                    CRIANDO A VNET E 2 SUBNETS                       #
                     #                                                                     #
                     #                      (Aguarde um momento! )                         #
                     #                                                                     #
                     #######################################################################


'
New-AzureRmVirtualNetwork -Name $vnet -ResourceGroupName $rg -Location $loc -AddressPrefix $vnetipclass -Subnet $subnet1, $subnet2
''
''
''
''
cd c:/
mkdir C:\azure_logs
cd .\azure_logs\
Get-AzureRmVirtualNetwork >> vNet_Subnets.txt
'

                                   ############################################
                                       vNet e Subnets Criadas com Sucesso ! ! !
                                   ############################################
                                   


Para mais informacoes e Logs, acesse: c:\azure_logs\vNet_Subnets.txt

Boa sorte e um forte abraço!

Desenvolvido por: Gustavo Magella | # gustavomagella.com #'
PAUSE
exit