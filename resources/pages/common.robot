*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Open Test Browser
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    # Disable password manager, autofill, and breach alert prompts
    ${prefs}=    Create Dictionary    credentials_enable_service=${False}    profile.password_manager_enabled=${False}
    # Launch Chrome in Incognito mode to completely block password alerts & prompts
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --disable-notifications
    # Launch browser with the customized options
    Create Webdriver    Chrome    options=${options}
    Go To    ${url}
    Maximize Browser Window

Close Test Browser
    Close All Browsers
