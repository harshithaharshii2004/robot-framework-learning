*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    https://devtesting.chandanaitsolutions.com/
${BROWSER}                Chrome

${SUPERADMIN_USERNAME}    superadmin
${SUPERADMIN_PASSWORD}    Superadmin@123

*** Test Cases ***

Valid Super Admin Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    sleep    1 seconds

    Input Text        xpath=//input[@placeholder='enter username/employee ID']    ${SUPERADMIN_USERNAME}
    sleep    1 seconds
    Input Password    xpath=//input[@type='password']    ${SUPERADMIN_PASSWORD}
    sleep    1 seconds

    Click Button    xpath=//button[normalize-space()='Login']

    Wait Until Page Contains    Dashboard   60s
    sleep    1 seconds

    Close Browser

Valid Manager Login
    Open Browser    ${URL}    ${BROWSER}
    sleep    1 seconds
    Maximize Browser Window

    Input Text    xpath=//input[@placeholder='enter username/employee ID']    MG1003025
    Input Password    xpath=//input[@type='password']    MG1003025
    sleep    1 seconds

    Click Button    xpath=//button[normalize-space()='Login']

    Wait Until Page Contains    Dashboard    60s
    sleep    1 seconds
    Close Browser    

Valid Employee Login
    Open Browser    ${URL}    ${BROWSER}
    sleep    1 seconds
    Maximize Browser Window

    Input Text    xpath=//input[@placeholder='enter username/employee ID']    BEN15080989
    Input Password    xpath=//input[@type='password']    BEN15080989
    sleep  1 seconds

    Click Button    xpath=//button[normalize-space()='Login']

    # Download Our App popup
    Wait Until Page Contains    Download Our App    10s
    sleep    1 seconds
    Click Button    xpath=//button[normalize-space()='Maybe Later']

    # Employee profile page
    Wait Until Page Contains    Confirm    10s
    sleep    1 seconds
    Click Button    xpath=//button[normalize-space()='Confirm']

    # Profile confirmation dialogue
    Wait Until Element Is Visible    xpath=//button[contains(.,'Yes, Continue')]    10s
    sleep    1 seconds
    Click Element    xpath=//button[contains(.,'Yes, Continue')]

    # Verify Employee Dashboard
    Wait Until Location Contains    /employee/views/dashboard.php    20s
    Page Should Contain    Welcome
    Page Should Contain    Employee ID
    sleep    1 seconds

    Close Browser