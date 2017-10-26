cls
'

  ___   ______ _   _ ______  _____   _  ______  _____  _____  _____  _   _ ______  _____  _____   _____ ______  _____  _   _ ______ 
 / _ \ |___  /| | | || ___ \|  ___| | | | ___ \|  ___|/  ___||  _  || | | || ___ \/  __ \|  ___| |  __ \| ___ \|  _  || | | || ___ \
/ /_\ \   / / | | | || |_/ /| |__   | | | |_/ /| |__  \ `--. | | | || | | || |_/ /| /  \/| |__   | |  \/| |_/ /| | | || | | || |_/ /
|  _  |  / /  | | | ||    / |  __|  | | |    / |  __|  `--. \| | | || | | ||    / | |    |  __|  | | __ |    / | | | || | | ||  __/ 
| | | |./ /___| |_| || |\ \ | |___  | | | |\ \ | |___ /\__/ /\ \_/ /| |_| || |\ \ | \__/\| |___  | |_\ \| |\ \ \ \_/ /| |_| || |    
\_| |_/\_____/ \___/ \_| \_|\____/  | | \_| \_|\____/ \____/  \___/  \___/ \_| \_| \____/\____/   \____/\_| \_| \___/  \___/ \_|    
                                    | |                                                                                             
                                    |_|                                                                                             



               #########################################################################
               #          Desenvolvido por: Gustavo Magella - gustavomagella.com       #
               #                                                                       #
               #                               V .1.0                                  #
               #########################################################################

                          
                               # CRIAÇÃO DE GRUPO DE RECURSOS NO AZURE #
                          
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
                     #             OBTENDO LISTA DE LOCALIZAÇÕES DISPONÍVEIS               #
                     #                                                                     #
                     #           (Verifique abaixo, qual location será utilizada)          #
                     #                                                                     #
                     #######################################################################
'
Get-AzureRmLocation | Select Location
PAUSE
'

DIGITE O NOME DO GRUPO DE RECURSOS A SER CRIADO:

'
$rg=Read-Host
''
''
''
'

DIGITE O NOME DO GRUPO DA LOCALIZAÇÃO ONDE O GRUPO DE RECURSOS SERÁ CRIADO:

'
$loc=Read-Host
''
''
''
''
'
                     #######################################################################
                     #                                                                     #
                     #                      CRIANDO O GRUPO DE RECUSOS                     #
                     #                                                                     #
                     #                        (Aguarde um momento! )                       #
                     #                                                                     #
                     #######################################################################


'
New-AzureRmResourceGroup -Name $rg -Location $loc

'
                                   ############################################
                                          GRUPO DE RECURSOS COM SUCESSO ! ! !
                                   ############################################
'

cd c:/
mkdir C:\azure_logs\resourcegroup
cd .\azure_logs\resourcegroup
Get-AzureRmResourceGroup -Name $rg >> ResourceGroup.txt
'
Para mais informacoes e Logs, acesse: c:\azure_logs\vpn\VPN_Connection.txt

Boa sorte e um forte abraço!

Desenvolvido por: Gustavo Magella | # gustavomagella.com #'
PAUSE
exit
                    
