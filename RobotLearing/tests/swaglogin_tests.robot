*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Timeout    10 seconds

*** Variables ***
${URL}        https://www.saucedemo.com/
${BROWSER}    Chrome
${USERNAME}   standard_user
${PASSWORD}   secret_sauce

*** Test Cases ***
Login With Valid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    1 seconds
    Input Text    id=user-name    ${USERNAME}
    Sleep    1 seconds
    Input Password    id=password    ${PASSWORD}
    Sleep    1 seconds
    Click Button    id=login-button
    Sleep    1 seconds
    Wait Until Page Contains    Products
    Sleep    1 seconds
    Close Browser