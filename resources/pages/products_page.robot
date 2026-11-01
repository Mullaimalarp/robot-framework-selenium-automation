*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${PRODUCTS_TITLE}       css=.title
${INVENTORY_CONTAINER}  id=inventory_container
${SHOPPING_CART}        css=.shopping_cart_link


*** Keywords ***
Products Page Should Be Displayed
    Wait Until Element Is Visible    ${INVENTORY_CONTAINER}
    Element Text Should Be    ${PRODUCTS_TITLE}    Products
    Location Should Contain    inventory.html
    Element Should Be Visible    ${SHOPPING_CART}

Add Backpack To Cart
    Wait Until Element Is Visible
    ...    id:add-to-cart-sauce-labs-backpack
    ...    timeout=10s

    Click Button    id:add-to-cart-sauce-labs-backpack

Purchase Sauce Labs Backpack
    [Tags]    functional    checkout    purchase

    Add Backpack To Cart
    Open Shopping Cart
    Click Checkout

    Enter Checkout Information
    ...    Mullaimalar
    ...    Sekar
    ...    3026

    Complete Purchase
    Verify Purchase Successful
