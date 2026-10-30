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


