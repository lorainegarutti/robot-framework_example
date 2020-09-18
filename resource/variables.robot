*** Settings ***
Library          AppiumLibrary

*** Variables ***
### Setup do device
${REMOTE_URL}          http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}       Android
${PLATFORM_VERSION}    10.0
${DEVICE_NAME}         Pixel API 30
${AVD}                 Pixel_API_30
${APP_PACKAGE}         com.google.android.youtube
${APP_ACTIVITY}        com.google.android.apps.youtube.app.WatchWhileActivity
#${APP_PACKAGE}         br.com.gsgroup.zoombox.jauserve
#${APP_ACTIVITY}        br.com.gsgroup.zoombox.jauserve.MainActivity
${AUTOMATION_NAME}     appium
${ARGUMENTO}           café especial 

*** Keywords ***
### Setup e Teardown

### Cenário 01
Começando teste
    Open Application                 ${REMOTE_URL}    platformName=${PLATFORM_NAME}   platformVersion=${PLATFORM_VERSION}    avd=${AVD}
    ...                                 deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}	appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}

Ir para a aba Explorar
    Click Element                    accessibility_id=Explore     

Abrir campo de busca
    Click Element                    accessibility_id=Search     

Digitar as palavras
    [Arguments]   ${ARGUMENTO}                      
    Input Text                       id=com.google.android.youtube:id/search_edit_text   ${ARGUMENTO}

Clicar na tecla "Enter"
    Press Keycode                    66

Verei pelo menos um resultado com a palavra chave     
    [Arguments]   ${ARGUMENTO}                      
    Page Should Contain Text         ${ARGUMENTO}



### Cenário 02
Abrir o segundo vídeo
    Swipe	500	 100  100  0 	1000
    Click Element                   accessibility_id=Entenda de uma vez por todas o que é café especial, café gourmet, café superior e café tradicional - 8 minutes, 13 seconds - Go to channel - Coffee and Joy - 9.5K views - 1 year ago - play video

Verei que ele tem a palavra chave utilizada na busca 
    [Arguments]   ${ARGUMENTO}                      
    Element Should Contain Text     id=com.google.android.youtube:id/title        ${ARGUMENTO} 

Finalizando teste
    Capture Page Screenshot
    Close Application
                  