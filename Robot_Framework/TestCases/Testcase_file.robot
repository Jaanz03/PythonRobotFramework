*** Settings ***
Documentation   To initialize browser

Resource    ../Initialize.robot

#Test Setup
#Test Teardown       Close Browser


*** Test Cases ***
Shop Product at E-com App
    [Tags]  SMOKE
#    Login with user username and password       rahulshettyacademy      learning
    Login To E-commerce Application Page        rahulshettyacademy      learning
    Shop products available in dashboard        Blackberry
#    Perform Checkout at Checkout Page




