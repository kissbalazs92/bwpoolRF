*** Settings ***
Library    SeleniumLibrary
Library    ../utils/webdriver_helper.py
Library    RequestsLibrary
Library    OperatingSystem

Resource   ../components/grid_dialog.resource
Resource   ../components/navbar.resource
Resource   ../utils/utils.resource
Resource   ../components/grid.resource
Resource   ../pages/Location.resource
Resource   ../utils/validations.resource
Resource   ../pages/Tool.resource

*** Variables ***
${BROWSER}      Chrome
${MAIN_PAGE}    https://bwpool.azurewebsites.net/
${DOWNLOAD_DIRECTORY}  \\..\\resources

*** Keywords ***
Setup Chrome
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${download_path}=    Normalize Path    ${CURDIR}${DOWNLOAD_DIRECTORY}
    ${prefs} =    Create Dictionary    download.default_directory=${download_path}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Open Browser    about:blank    ${BROWSER}    options=${chrome_options}
    Set Window Size    1920    1080

Common Test Teardown 
    Close All Browsers