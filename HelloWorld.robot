*** Settings ***
Library    Selenium2Library
Library    Collections

*** Variables ***
${APP}            uftHelp
${URL}            https://www.google.ca
${BROWSER}        Ie
${CHROME}         Chrome

*** Test Cases ***
test1
	Specifying Path To GeckoDriver
    Go To    https://stackoverflow.com
    Sleep    2 s
[TC-001]-Launching the browser and search and launch the 'uftHelp' Application on Google.com
    Launch Browser
    Search Application On Google
    Launch Application
[TC-002]-Launching the browser and search and launch the 'uftHelp' Application on Google.com
    Launch Chrome
    Search Application On Google
    Launch Application

*** Keywords ***
Launch Browser
    Open Browser    ${URL}  ${BROWSER}
Launch Chrome
    Open Browser    ${URL}  ${CHROME}
Search Application On Google
    Input Text    id=lst-ib    ${APP}
    Click Button    name=btnG
Launch Application
    Wait Until Element Is Visible    link=User-Friendly Techy-Help      20 Seconds
    Click Element     link=User-Friendly Techy-Help
Specifying Path To GeckoDriver
    ${ff default caps}    Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys,selenium.webdriver
    Set To Dictionary    ${ff default caps}    marionette=${True}
    Create Webdriver    Firefox    executable_path=C:\\Python27\\geckodriver.exe