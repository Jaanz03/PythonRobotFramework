*** Settings ***
Documentation   Login to Webpage


*** Keywords ***
Login To E-commerce Application Page
	[Documentation]  This keyword is used to login to application
	[Arguments]     ${username}     ${password}
#	Open Browser
#	Check Blinking Link
	Login with user username and password   ${username}     ${password}
#	Select dropdown and accept terms and conditions
	Sign-in and verify sign-in



