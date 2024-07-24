*** Settings ***
Documentation   To initialize browser
Library      SeleniumLibrary
Library      Collections
Library     String

*** Variables ***
@{listofprods}      Blackberry      Nokia Edge

*** Keywords ***
Verify number of products in shop page
    [Documentation]     This keyword is used to fetch number of products in shop page
    @{phonelist}    Create List     iphone X       Samsung Note 8      Nokia Edge   Blackberry
    ${elements}     Get WebElements     ${PRODUCT_BODY_FIELDS}
    @{actual_list}   Create List

    FOR     ${i}    IN  @{elements}
        Scroll Element Into View        ${i}
        ${product_name}     Get Text    ${i}
        log to console      "product names are:${product_name}"
        Append To List      ${actual_list}      ${product_name}
    END
    Lists Should Be Equal        ${actual_list}      ${phonelist}

Select User Defined Product in Cart
    [Arguments]     ${product}
    ${index}    Set Variable    1
    ${elements}     Get WebElements     ${PRODUCT_BODY_FIELDS}
    FOR     ${i}    IN  @{elements}
        Scroll Element Into View        ${i}
        ${product_name}     Get Text    ${i}
        Exit For Loop If     '${product}' == '${product_name}'
            ${index}    Evaluate    ${index} + 1
    END
    ${index}    convert to string   ${index}
    ${product_add}      replace string      ${PRODUCT_ADD_BUTTON}   HelloWorld   ${index}
    Scroll Element Into View            ${product_add}
    click button       ${product_add}

Verify Product is added successfully in the cart
    [Arguments]     ${product}
    Scroll Element Into View        ${PRODUCT_CHECKOUT_BUTTON}
    Click Element      ${PRODUCT_CHECKOUT_BUTTON}
    wait until element is visible       ${PRODUCT_CHECKOUT_BODY}        timeout=30s
    ${product_checkout}     Get Text        ${PRODUCT_NAME_AT_CHECKOUT}
        IF    '${product_checkout.lower()}'=='${product.lower()}'
            log to console      "${product} added to cart successfully"
        END


Select defined list of products in shopping cart
    add items to cart at checkout       ${listofprods}
    Scroll Element Into View        ${PRODUCT_CHECKOUT_BUTTON}
    Capture Screenshot