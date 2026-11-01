*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/pages/common.robot
Resource        ../resources/pages/login_page.robot
Resource        ../resources/pages/products_page.robot
Resource        ../resources/pages/checkout_page.robot

Variables       ../variables/test_data.py

Suite Setup     Open Test Browser    ${BASE_URL}
Suite Teardown  Close Test Browser
Test Setup      Login Before Each Test


*** Keywords ***
Login Before Each Test
    Go To    ${BASE_URL}
    Delete All Cookies
    Execute JavaScript    window.localStorage.clear(); window.sessionStorage.clear()
    Reload Page    
    Login With Valid User
    Wait Until Location Contains    inventory.html    timeout=10s
    Wait Until Element Is Visible   id:add-to-cart-sauce-labs-backpack    timeout=10s


*** Test Cases ***
Verify Navigation Links And Buttons
    [Tags]    smoke    navigation    ui-elements
    Element Should Be Visible    id:add-to-cart-sauce-labs-backpack
    Click Button                 id:add-to-cart-sauce-labs-backpack
    Element Text Should Be       class:shopping_cart_badge    1
    Click Element                class:shopping_cart_link
    Location Should Be           https://www.saucedemo.com/cart.html

Verify Dropdown Selections And Product Lists
    [Tags]    functional    dropdown    lists
    ${product_count}=    Get Element Count    class:inventory_item
    Should Be True       ${product_count} > 0
    Select From List By Value    class:product_sort_container    lohi
    ${first_product}=    Get Text    (//*[contains(@class, 'inventory_item_name')])[1]
    Should Be Equal      ${first_product}    Sauce Labs Onesie

Verify Side Menu Navigation Links
    [Tags]    functional    menu    links
    Wait Until Element Is Visible    id:react-burger-menu-btn    timeout=10s
    Click Button                     id:react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link     timeout=5s
    Click Element                    id:logout_sidebar_link
    Wait Until Location Is           https://www.saucedemo.com/  timeout=10s

Purchase Sauce Labs Backpack
    [Tags]    functional    checkout    purchase
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-backpack    timeout=10s
    Click Button                     id:add-to-cart-sauce-labs-backpack
    Element Text Should Be           class:shopping_cart_badge    1
    Open Shopping Cart
    Click Checkout
    Enter Checkout Information       Xyz    Aus    300
    Complete Purchase
    Verify Purchase Successful