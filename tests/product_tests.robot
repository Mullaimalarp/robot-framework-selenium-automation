*** Settings ***
Resource         ../resources/common.robot
Resource         ../resources/pages/LoginPage.robot
Resource         ../resources/pages/ProductsPage.robot
Variables        ../variables/test_data.py

Suite Setup      Open Test Browser    ${BASE_URL}
Suite Teardown   Close Test Browser
Test Setup       Go To    ${BASE_URL}


*** Test Cases ***
Verify Products Page After Login
    [Tags]    smoke    products
    Login Page Should Be Displayed
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Products Page Should Be Displayed

