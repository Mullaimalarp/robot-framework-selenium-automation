*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${USERNAME_INPUT}     id=user-name
${PASSWORD_INPUT}     id=password
${LOGIN_BUTTON}       id=login-button
${LOGIN_ERROR}        css=[data-test="error"]


*** Keywords ***
Login Page Should Be Displayed
    Wait Until Element Is Visible    ${USERNAME_INPUT}
    Element Should Be Visible    ${LOGIN_BUTTON}

Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button

Login Error Should Be
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${LOGIN_ERROR}
    Element Text Should Be    ${LOGIN_ERROR}    ${expected_message}


