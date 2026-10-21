*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    file:///C:/Users/harsh/RobotLearing/registration/registration.html
${BROWSER}    Chrome


*** Test Cases ***

Successful Registration
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    sleep    1 seconds

    Input Text    id=name        Harshitha
    sleep    1 seconds
    Input Text    id=email       harshitha@gmail.com
    sleep    1 seconds
    Input Password    id=password    Test@123
    sleep    1 seconds
    Input Text    id=phone       9876543210
    sleep    1 seconds
    Select From List By Label    id=gender    Female
    sleep    1 seconds

    Click Button    Register

    Wait Until Page Contains    Registration Successful    10s
    Page Should Contain    Registration Successful
    sleep    1 seconds

    Close Browser