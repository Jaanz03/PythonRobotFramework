*** Settings ***
Library         SeleniumLibrary
Library         String
Library         ../CustomLibraries/Customlib.py


#Library         DataDriver      file=readingcsv.csv     encoding=utf_8
#Test Template       Login with user username and password



*** Keywords ***
Login with user username and password
    [Arguments]   ${username}   ${password}
    Open Browser
    Enter username and password     ${username}     ${password}
    Select dropdown and accept terms and conditions
    Sign-in and verify sign-in

Open Browser
    Create Webdriver    ${browser_name}
    Go To   ${url}
    Maximize Browser Window
    wait until element is visible   ${HOME_PAGE_LOAD_SCREEN}    timeout=${DEFAULT_TIMEOUT}

Enter username and password
    [Arguments]     ${username}         ${password}
    set log level   NONE
    Input Text      ${INPUT_FIELD_TEXT}         ${username}
    Input Password  ${INPUT_FIELD_PASWWORD}      ${password}
    set log level   INFO

Capture Screenshot
    Capture Page Screenshot         ../Screenshots/selenium-screenshot-{index}.png

Select dropdown and accept terms and conditions
    Page Should Contain Element         ${INPUT_FIELD_DROPDOWN}
    click element       ${INPUT_FIELD_DROPDOWN}
    Select Radio Button     radio       user
    Accept message popup
#    ${dropdown_option}      replace string      ${SELECT_DROPDOWN_FIELD}    helloworld      ${user}
    Select From List By Value       ${INPUT_FIELD_DROPDOWN}         stud
    Select Checkbox     ${SELECT_CHECKBOX}

Accept message popup
    wait until element is visible       ${ALERT_POP_UP}       timeout=10s
    ${element_text}     Get Text        ${ALERT_POP_UP}
    click button        //button[@id='okayBtn']
    Wait Until Element Is Not Visible       ${ALERT_POP_UP}     timeout=10s


Sign-in and verify sign-in
    TRY
        click element       ${INPUT_FIELD_SIGNIN}
        ${staus}    Run Keyword And Return Status       wait until element is visible       ${TEXT_ELEMENT_FIELD}       timeout=10s
            IF  '${staus}'=='True'
                ${element_text}     Get Text        ${TEXT_ELEMENT_FIELD}
                log to console      "Login unsuccessfull"
            ELSE
                log to console      "Login successfull"
            END
        capture screenshot
    EXCEPT  AS  ${error}
        log     ERROR:${error}      ERROR   console=${True}
    END


Check Blinking Link
       wait until element is visible        //a[@class='blinkingText']        timeout=10s
       click element         //a[@class='blinkingText']
       ${child_window}  	Get Window Titles
       Switch Window        ${child_window}[1]
       ${header_text}       Get Text         //div[@class='inner-box']/h1
       Should be equal as strings       ${header_text.lower()}      documents request
       ${email}     Get Email Id from Child Window


Get Email Id from Child Window
        ${text}         Get Text        css:.red
        @{words}        Split String     ${text}    at
        ${split_text}   Get From List       ${words}    1
        @{new_list}     Split String     ${split_text}
        ${email}        Get From List       ${new_list}    0
        RETURN          ${email}
















