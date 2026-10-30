*** Settings ***
Library          SeleniumLibrary
Resource         ../resources/pages/common.robot
Resource         ../resources/pages/login_page.robot
Resource         ../resources/pages/products_page.robot
Variables        ../variables/test_data.py

Suite Setup      Open Test Browser    ${BASE_URL}
Suite Teardown   Close Test Browser
Test Setup       Go To    ${BASE_URL}


*** Test Cases ***
Valid User Can Log In
    [Tags]    smoke    login    positive
    Login Page Should Be Displayed
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Products Page Should Be Displayed

Invalid User Cannot Log In
    [Tags]    regression    login    negative
    Login Page Should Be Displayed
    Login With Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Login Error Should Be    ${INVALID_LOGIN_ERROR}
