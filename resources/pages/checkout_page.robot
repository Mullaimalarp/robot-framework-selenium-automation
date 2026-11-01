*** settings ***
Library    SeleniumLibrary


*** Keywords ***
Open Shopping Cart
    Click Element    class:shopping_cart_link
    Wait Until Location Contains    cart.html    timeout=10s


Click Checkout
    Wait Until Element Is Visible    id:checkout    timeout=10s
    Click Button    id:checkout
    Wait Until Location Contains    checkout-step-one.html    timeout=10s


Enter Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}

    Input Text    id:first-name    ${first_name}
    Input Text    id:last-name     ${last_name}
    Input Text    id:postal-code   ${postal_code}

    Click Button    id:continue
    Wait Until Location Contains    checkout-step-two.html    timeout=10s


Complete Purchase
    Wait Until Element Is Visible    id:finish    timeout=10s
    Click Button    id:finish
    Wait Until Location Contains    checkout-complete.html    timeout=10s


Verify Purchase Successful
    Wait Until Element Is Visible    class:complete-header    timeout=10s
    Element Text Should Be
    ...    class:complete-header
    ...    Thank you for your order!
