*** Settings ***
Library     Collections
Library     RequestsLibrary

*** Variables ***

${base_URI}     https://rahulshettyacademy.com


*** Keywords ***
Sample disctionary
    &{data}     Create Dictionary       name=jansi   course=robot    website=rahushetty.com
    log to console      ${data}
    Dictionary Should Contain Key       ${data}     name
    ${text}     Get From Dictionary     ${data}     name
    log to console    ${text}

Add Book Into Library Database
    ${json_create}      Create Dictionary      name=robotframeworkapi     isbn=jansibook      aisle=78978    author=jansi
    ${response}     POST    ${base_URI}/Library/Addbook.php     json=${json_create}     expected_status=200
    log to console     ${response.json()}
    Dictionary Should Contain Key     ${response.json()}      ID
    ${book_id}      Get From Dictionary     ${response.json()}      ID
    log     Book id is:${book_id}       console=${True}
    RETURN   ${book_id}

Get Book Details
    [Arguments]     ${book_dtl}


