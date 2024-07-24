*** Settings ***
Library     SeleniumLibrary
Library    String

# Open url and read table data row by row and print the values of each cell

*** Test Cases ***
Fetch data from table
#    Read values from DataWebtable
    Read Values from Static WebTable

*** Variables ***

${movie_year}           //div/h2[contains(text(),'Fully editable')]/parent::div//div[@aria-colindex = '3']
${movie_name}           //div/h2[contains(text(),'Fully editable')]/parent::div//div[ @aria-colindex = '2']
${table_element}        //table[@id='customers']//tr[helloworld]/td/span

*** Keywords ***
Read values from DataWebtable

   Create Webdriver    Chrome
   Go To   https://webix.com/widget/datatable/
   wait until element is visible    //div[@class='container-flex']
   Scroll Element Into View     //div/h2[contains(text(),'Sortable')]

   ${mvoie_dates}       Get WebElements         ${movie_year}
   ${element_count}     get length   ${mvoie_dates}
   ${mvoie_title}       Get WebElements     ${movie_name}
   ${element_count}     get length   ${mvoie_title}
    FOR    ${year}  ${title}  IN ZIP    ${mvoie_dates}   ${mvoie_title}
        ${year_text}     Get Text    ${year}
        ${title_text}     Get Text    ${title}
    END

Read Values from Static WebTable
    Create Webdriver    Chrome
    Go To               https://www.techlistic.com/2017/02/automate-demo-web-table-with-selenium.html
    Maximize Browser Window
    Scroll Element Into View            //span[contains(text(),'Demo Webtable 2')]
    wait until element is visible       id:customers

    @{company}      Get WebElements     //table[@id='customers']//tr/td[1]/span
    @{contact}      Get WebElements     //table[@id='customers']//tr/td[2]/span
    @{country}      Get WebElements     //table[@id='customers']//tr/td[3]/span

#     #get length of rows
#     ${no_of_rows}      Get WebElements        //table[@id='customers']//tr
#     ${row_count}   get length     ${no_of_rows}

    FOR     ${company_name}     ${contact_info}     ${country_name}      IN ZIP     ${company}     ${contact}      ${country}
        ${company_text}     Get Text    ${company_name}
        ${contact_text}     Get Text    ${contact_info}
        ${country_text}     Get Text    ${country_name}
        Log     "company name is:"${company_text}-contact name is:"${contact_text}-Country name is:"${country_text}       console=${True}
    END
























