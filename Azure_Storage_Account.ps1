cls
'
  ___                            _   _____  _                                       ___                                    _   
 / _ \                          | | /  ___|| |                                     / _ \                                  | |  
/ /_\ \ ____ _   _  _ __   ___  | | \ `--. | |_   ___   _ __   __ _   __ _   ___  / /_\ \  ___   ___   ___   _   _  _ __  | |_ 
|  _  ||_  /| | | ||  __| / _ \ | |  `--. \| __| / _ \ |  __| / _` | / _` | / _ \ |  _  | / __| / __| / _ \ | | | ||  _ \ | __|
| | | | / / | |_| || |   |  __/ | | /\__/ /| |_ | (_) || |   | (_| || (_| ||  __/ | | | || (__ | (__ | (_) || |_| || | | || |_ 
\_| |_//___| \__,_||_|    \___| | | \____/  \__| \___/ |_|    \__,_| \__, | \___| \_| |_/ \___| \___| \___/  \__,_||_| |_| \__|
                                | |                                   __/ |                                                    
                                |_|                                  |___/                                                     



               #########################################################################
               #                                                                       #
               #          Desenvolvido por: Gustavo Magella - gustavomagella.com       #
               #                                                                       #
               #                               V .1.0                                  #
               #########################################################################

                          
                          #  CRIAÇÃO DE UMA STORAGE ACCOUNT  #
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
'DIGITE A LOCALIZACAO ("LOCATION") DO GRUPO DE RECURSOS:

'
$loc=Read-Host
''
''
''
'DIGITE O NOME DA "STORAGE ACCOUNT" A SER CRIADA:

'
$sa=Read-Host
''
''
''
'OBS.: TIPO DA "STORAGE ACCOUNT" A SER CRIADA (Use letra minuscula, e nao use nenhum caracter especial):


[Standard] Os dados serao salvos em discos magneticos, logo esta opcao e a mais BARATA


Standard_LRS    | Locally-redundant storage.           | replica os dados três vezes em uma unidade de escala de armazenamento, que é hospedada em um datacenter na região.
Standard_ZRS    | Zone-redundant storage.              | replica os dados de modo assíncrono entre datacenters em uma ou duas regiões, além de armazenar três réplicas semelhantes ao LRS, fornecendo assim maior durabilidade que o LRS.
Standard_GRS    | Geo-redundant storage.               | replica seus dados para uma região secundária a centenas de quilômetros da região primária. Se sua conta de armazenamento tem GRS habilitado, seus dados serão duráveis mesmo no caso de uma interrupção regional completa ou um desastre no qual a região principal não possa ser recuperada.
Standard_RAGRS  | Read access geo-redundant storage.   | maximiza a disponibilidade da sua conta de armazenamento, fornecendo acesso somente leitura aos dados no local secundário, além de replicação em duas regiões fornecido por GRS.



[Premium] Os dados serao salvos em discos solidos (SSD), logo esta opcao e a mais CARA.


Premium_LRS     | Premium locally-redundant storage.   | replica os dados três vezes em uma unidade de escala de armazenamento, que é hospedada em um datacenter na região.


DIGITE O TIPO DA "STORAGE ACCOUNT" A SER CRIADA:

'
$tp=Read-Host
''
''
''
'                    #######################################################################
                     #                                                                     #
                     #                    CRIANDO A STORAGE ACCOUNT                        #
                     #                                                                     #
                     #                      (Aguarde um momento! )                         #
                     #                                                                     #
                     #######################################################################


'
New-AzureRmStorageAccount -ResourceGroupName $rg -AccountName $sa -Location $loc -Type $tp
''
''
''
cd c:/
mkdir C:\azure_logs
cd .\azure_logs\
Get-AzureRmStorageAccount -ResourceGroupName $rg -AccountName $sa >> vNet_StorageAccount.txt
"cls"
'

                                   ############################################
                                       STORAGE ACCOUNT CRIADA COM SUCESSO ! ! !
                                   ############################################
                                   
                                   
Para mais informacoes e Logs, acesse: c:\azure_logs\vNet_Subnets.txt

Boa sorte e um forte abraço!

Desenvolvido por: Gustavo Magella | # gustavomagella.com #
'
PAUSE