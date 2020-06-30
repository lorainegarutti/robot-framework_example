*** Settings ***
Library          AppiumLibrary

*** Variables ***
### Setup do device
${REMOTE_URL}          http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}       Android
${PLATFORM_VERSION}    10.0
${DEVICE_NAME}         Pixel XL API 29
${AVD}                 Pixel_XL_API_29
${APP_PACKAGE}         com.google.android.youtube
${APP_ACTIVITY}        com.google.android.apps.youtube.app.WatchWhileActivity
#${APP_PACKAGE}         br.com.gsgroup.zoombox.jauserve
#${APP_ACTIVITY}        br.com.gsgroup.zoombox.jauserve.MainActivity
${AUTOMATION_NAME}     appium
${ARGUMENTO}           café especial 

*** Keywords ***
### Setup e Teardown
Começando teste
    Open Application                 ${REMOTE_URL}    platformName=${PLATFORM_NAME}   platformVersion=${PLATFORM_VERSION}    avd=${AVD}
    ...                                 deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}	appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}

Finalizando teste
    Capture Page Screenshot
    Close Application

Abrir campo de busca
    Click Element                    accessibility_id=Search     

Digitar as palavras
    [Arguments]   ${ARGUMENTO}                      
    Input Text                       com.google.android.youtube:id/search_edit_text   ${ARGUMENTO}

Clicar na tecla "Enter"
    Press Keycode                    66

Verei pelo menos um resultado com a palavra chave     
    [Arguments]   ${ARGUMENTO}                      
    Page Should Contain Text         ${ARGUMENTO}