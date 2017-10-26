cls
'              
                      ___                            _   _   _                _  _   
                     / _ \                          | | | | | |              | || |  
                    / /_\ \ ____ _   _  _ __   ___  | | | | | |  __ _  _   _ | || |_ 
                    |  _  ||_  /| | | ||  __| / _ \ | | | | | | / _  || | | || || __|
                    | | | | / / | |_| || |   |  __/ | | \ \_/ /| (_| || |_| || || |_ 
                    \_| |_//___| \__,_||_|    \___| | |  \___/  \__,_| \__,_||_| \__|
                                                    | |                              
                                                    |_|                              




               #########################################################################
               #                                                                       #
               #          Desenvolvido por: Gustavo Magella - gustavomagella.com       #
               #                                                                       #
               #                               V .1.0                                  #
               #########################################################################

                               # AZURE BACKUP - CRIAÇÃO DO COFRE DE BACKUP #
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

#PARTE 1 - Criação de Cofre de Credencial
#A Primeira Vez que for criar um cofre, vc tem que registrar o Azure Recovery Service provedor com sua subscrição.
Register-AzureRmResourceProvider -ProviderNamespace "Microsoft.RecoveryServices"

#Criação do Cofre de Backup
#Lista de Locations disponíveis onde os recursos podem ser criados
PAUSE
'                    #######################################################################
                     #                                                                     #
                     #                OBTENDO LISTA DE LOCAIS (LOCATION LIST)              #
                     #                                                                     #
                     #  Lista de Locations disponíveis onde os recursos podem ser criados  #
                     #                                                                     #
                     #######################################################################
'

Get-AzureRmLocation | sort Location | Select Location
PAUSE
'                    #######################################################################
                     #                                                                     #
                     #                     CRIANDO UM GRUPO DE RECURSOS                    #
                     #                                                                     #
                     #       Utilize uma das localizações listadas anteriormente acima,    #
                     #        para criar seu novo grupo de recursos.                       #
                     #                                                                     #
                     #######################################################################
'
PAUSE
'Digite o nome do Grupo de Recursos que você deseja criar: (Ex.: CLIENTE-LOCATION | PADARIADOZE-WESTUS)
'
#Criar um novo Grupo de Recursos com a devida localização
$rg=Read-Host
'Digite a Location onde você deseja criar: (Ex.: westus,centralus,brazilsouth)
'
$loc=Read-Host
'                                  ######################################
                                    CRIANDO O GRUPO NA REGIÃO ESPECÍFICA
                                   ######################################
'
New-AzureRmResourceGroup –Name $rg –Location $loc
''
''
'                                  ######################################
                                            CRIADO COM SUCESSO ! ! !
                                   ######################################
'
#Criar o cofre (Vault) na devida localização do RG já criado
'

                     #######################################################################
                     #                                                                     #
                     #                  CRIANDO O COFRE DE BACKUP AZURE                    #
                     #                                                                     #
                     #######################################################################

'
'Digite o nome do Cofre que você deseja criar: (Ex.: CLIENTE-KEEP-BKP | PAD-KEEP-BKP)

'
$name_vault=Read-Host
'                   
                                   #####################################
                                               CRIANDO O COFRE 
                                   #####################################
'
New-AzureRmRecoveryServicesVault -Name $name_vault -ResourceGroupName $rg -Location $loc
'

                                   ######################################
                                            CRIADO COM SUCESSO ! ! !
                                   ######################################

'
# Especificar se vc quer usar:
# LRS (Local Redundance Storage - Redundância Local e 1 cópia Local) - Parêmetro LocallyRedundant
# GRS (Geo Redundant Storage - Redundância Geográfia, 3 cópias espalhadas pelos datacenteres Geo Redundantes Obs:. + Caro) - Parâmetro GeoRedundant
'

                     #######################################################################
                     #                                                                     #
                     #         SETANDO REDUNDÂNCIA | LRS ou GRS | (DEFAULT LRS)            #
                     #                                                                     #
                     #######################################################################

'
$vault1=Get-AzureRmRecoveryServicesVault -Name $name_vault
Set-AzureRmRecoveryServicesBackupProperties -vault $vault1 -BackupStorageRedundancy LocallyRedundant
'

                                   ######################################
                                            SETADA COM SUCESSO ! ! !
                                   ######################################

'
#PARTE 2 - Instalar o Agent de Backup 

# Opções: - MARS Agent (Windows Client e Server): http://aka.ms/azurebackup_agent (MARSAgentInstaller.exe /q)
#          - MABS - Microsoft Azure Backup Server (Windows Client, Windows Server, Linux (if hosted Hyper-V)): Arquivos + BIN Files | https://www.microsoft.com/en-us/download/details.aspx?id=49170
#          - System Center Data Protection Manager (DPM): Acquiring and Install System Center DPM
		  
#PARTE 3 - Fazer o download da Chave

#Faça o download do arquivo de credencial vault no portal e armazene em: c:\azure_cred (se precisar crie uma pasta)
#Obs.: O arquivo de credencial pode mudar (e com certeza vai) para evitar com que 
'

                     #######################################################################
                     #                                                                     #
                     #                  EFETUANDO O DOWNLOAD DA CHAVE VAULT                #
                     #                                                                     #
                     #######################################################################

'
cd c:/
mkdir C:\azure_cred
$pasta = "C:\azure_cred"
$arquivo_cred = Get-AzureRmRecoveryServicesVaultSettingsFile -Backup -Vault $vault1 -Path  $pasta
'

                                   ######################################
                                       DOWNLOAD FEITO COM SUCESSO ! ! !
                                   ######################################
                                   
'
'
* A chave está salva em C:\azure_cred
* A mesma é de uso obrigatório e contém uma credencial de acesso ao seu Cofre de Backup, portanto, cuide bem dela.
* Próximo passo? Faça o Download de um dos Agentes de Backup (MABS, MARS, DPM) e prossiga com o agendamento criação de jobs. 

Boa sorte e um forte abraço!

Desenvolvido por: Gustavo Magella - gustavomagella.com


'
pause
