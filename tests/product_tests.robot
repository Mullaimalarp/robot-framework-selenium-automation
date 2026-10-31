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
Verify Navigation Links And Buttons
    [Tags]    smoke    navigation    ui-elements
    # 1. Login first since Sauce Demo requires authentication to view products
    Input Text    id:user-name    ${VALID_USERNAME}
    Input Text    id:password    ${VALID_PASSWORD}
    Click Button    id:login-button
    
    # 2. Verify and interact with a Button (e.g., Add to Cart button)
    Element Should Be Visible    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-backpack
    
    # 3. Verify Cart Badge updates (Link / Button check)
    Element Text Should Be    class:shopping_cart_badge    1
    Click Element    class:shopping_cart_link
    Location Should Be    https://www.saucedemo.com/cart.html

Verify Dropdown Selections And Product Lists
    [Tags]    functional    dropdown    lists
    # 1. Log in
    Go To    ${BASE_URL}
    Input Text    id:user-name    ${VALID_USERNAME}
    Input Text    id:password    ${VALID_PASSWORD}
    Click Button    id:login-button
    
    # 2. Verify Product List Count
    ${product_count}=    Get Element Count    class:inventory_item
    Should Be True    ${product_count} > 0
    
    # 3. Verify and interact with a Dropdown (Product sorting: Price low to high)
    Select From List By Value    class:product_sort_container    lohi
    
    # 4. Verify specific sorted element text (First item when sorted low-to-high is Sauce Labs Onesie)
    ${first_product}=    Get Text    (//*[contains(@class, 'inventory_item_name')])[1]
    Should Be Equal    ${first_product}    Sauce Labs Onesie

Verify Side Menu Navigation Links
    [Tags]    functional    menu    links
    # 1. Log in and explicitly wait for inventory page
    Go To    ${BASE_URL}
    Input Text    id:user-name    ${VALID_USERNAME}
    Input Text    id:password    ${VALID_PASSWORD}
    Click Button    id:login-button
    Run Keyword And Ignore Error    Press Keys    None    RETURN
    Wait Until Location Is    https://www.saucedemo.com/inventory.html    timeout=10s
    
    # 2. Open Burger Menu
    Wait Until Element Is Visible    id:react-burger-menu-btn    timeout=10s
    Click Button    id:react-burger-menu-btn
    
    # 3. Verify and click Logout link
    Wait Until Element Is Visible    id:logout_sidebar_link    timeout=5s
    Click Element    id:logout_sidebar_link
    
    # 4. Use Wait Until Location Is instead of instant check
    Wait Until Location Is    https://www.saucedemo.com/    timeout=10s