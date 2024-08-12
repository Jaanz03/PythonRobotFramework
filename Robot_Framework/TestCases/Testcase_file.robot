*** Settings ***
Documentation   To Build robot framework

Resource    ../Initialize.robot

Test Setup          Test initialize
Test Teardown       Test CleanUp


*** Test Cases ***
Shop Product at E-com App
    [Tags]  SMOKE
#    Login To E-commerce Application Page        rahulshettyacademy      learning
#    Shop products available in dashboard        Blackberry
#    Perform Checkout at Checkout Page
    ${book_id}      Add Book Into Library Database
    Get Book Details    ${book_id}


