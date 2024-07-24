*** Settings ***
Documentation   To declare all the variables

*** Variables ***


${HOME_PAGE_LOAD_SCREEN}        //div[@id='login-box']
${DEFAULT_TIMEOUT}              30s
#${INPUT_FIELD}                  //input[@class='input_error form_input'
${INPUT_FIELD_TEXT}             //input[@id='username']
${INPUT_FIELD_PASWWORD}         //input[@id='password']
${INPUT_FIELD_DROPDOWN}         //select[@class='form-control']
${INPUT_FIELD_SIGNIN}           //input[@type='submit']
${SELECT_CHECKBOX}              //input[@type='checkbox']
${TEXT_ELEMENT_FIELD}           //div[contains(@class,'alert-danger')]
${ALERT_POP_UP}                 //div[@class='modal-body']/p
