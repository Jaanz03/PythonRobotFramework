*** Settings ***
Resource     ../../SeleniumWebrdriver/Actions/ShopPageActions.robot


*** Keywords ***
Shop products available in dashboard
    [Documentation]  This keyword is used to shop products in dashboard
    [Arguments]     ${product_name}
    Verify number of products in shop page
    Select User Defined Product in Cart     ${product_name}
    Select list of Products in Cart
#    Verify Product is added successfully in the cart      ${product_name}

Select list of Products in Cart
    Select defined list of products in shopping cart