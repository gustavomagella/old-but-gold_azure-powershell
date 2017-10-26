cls
'

                     ___   ______ _   _ ______  _____    _   _      _____  _____  _____  _   _ 
                    / _ \ |___  /| | | || ___ \|  ___|  | | | |    |  _  ||  __ \|_   _|| \ | |
                   / /_\ \   / / | | | || |_/ /| |__    | | | |    | | | || |  \/  | |  |  \| |
                   |  _  |  / /  | | | ||    / |  __|   | | | |    | | | || | __   | |  | . ` |
                   | | | |./ /___| |_| || |\ \ | |___   | | | |____\ \_/ /| |_\ \ _| |_ | |\  |
                   \_| |_/\_____/ \___/ \_| \_|\____/   | | \_____/ \___/  \____/ \___/ \_| \_/
                                                        | |                                    
                                                        |_|                                    


                 #########################################################################
                 #                                                                       #
                 #          Desenvolvido por: Gustavo Magella - gustavomagella.com       #
                 #                                                                       #
                 #                               V .1.0                                  #
                 #########################################################################

                                   
                                   # AZURE LOGIN AUTOM¡TICO COM JSON #
'
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
Login-AzureRmAccount
'
                            #                                                  #
                            #         CRIANDO UM DIRET”RIO [ c:\azrpfl ]       #
                            #                                                  #

'
cd c:\
mkdir c:\azrpfl
'
                        #                                                           #
                        #     SALVANDO A SESS√O DO SEU PERFIL EM UM ARQUIVO JSON    #
                        #                                                           #
                        #               c:\azrpfl\azureprofile.json                 #
                        #                                                           #

'

Save-AzureRmContext -Path "c:\azrpfl\azureprofile.json"
'

                                   ######################################
                                      CREDENCIAL SALVA COM SUCESSO ! ! !
                                   ######################################
'
pause
'
PR”XIMO PASSO:

A prÛxima vez que precisar logar no Azure automaticamente, seja para executar um script 
ou atÈ mesmo para administraÁ„o, utilize o seguinte comando:

'
''
''
Write-Host '#     Import-AzureRmContext -Path "c:\azrpfl\azureprofile.json"ù | Out-Null' -ForegroundColor Green
Write-Host '#     Write-Host "Logado com sucesso, usando seu perfil salvo em: c:\azrpfl\azureprofile.json"' -ForegroundColor Green
''
''
''
Write-Host '#     Get-AzureRmSubscription -SubscriptionName "Visual Studio Enterprise com MSDN" | Select-AzureRmSubscription -SubscriptionName "Visual Studio Enterprise com MSDN" | Out-Null' -ForegroundColor Cyan
Write-Host '#     Write-Host "Set Azure Subscription for session complete"'  -ForegroundColor Cyan

'
''
''
''
Boa sorte e um forte abraÁo!

Desenvolvido por: Gustavo Magella - gustavomagella.com
'
pause