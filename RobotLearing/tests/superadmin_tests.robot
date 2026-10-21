*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    https://devtesting.chandanaitsolutions.com/
${BROWSER}                Chrome

# Super Admin credentials
${SUPERADMIN_ID}          superadmin
${SUPERADMIN_PASSWORD}    Superadmin@123


*** Keywords ***
Login As Super Admin
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text
    ...    xpath=//input[@placeholder='enter username/employee ID']
    ...    ${SUPERADMIN_ID}

    Input Password
    ...    xpath=//input[@type='password']
    ...    ${SUPERADMIN_PASSWORD}

    Click Button
    ...    xpath=//button[normalize-space()='Login']

    Wait Until Page Contains    Dashboard    60s


*** Test Cases ***

Employee Details - Filter By Place
    Login As Super Admin

    # Open Employee Details
    Wait Until Page Contains    Total Employees    20s
    Click Element
    ...    xpath=//*[normalize-space()='Employees Details']

    # Wait for Employee View
    Wait Until Page Contains    Employee View    20s

    # Select Mysuru from Place filter
    Select From List By Label
    ...    xpath=(//select)[1]
    ...    Mysuru

    # Verify filtered result
    Wait Until Page Contains    Mysuru    10s
    Page Should Contain    Mysuru

    Close Browser


Employee Details - Filter By Employee ID
    Login As Super Admin

    # Open Employee Details
    Wait Until Page Contains    Total Employees    20s
    Click Element
    ...    xpath=//*[normalize-space()='Employees Details']

    # Wait for Employee View
    Wait Until Page Contains    Employee View    20s

    # Search by Employee ID
    Input Text
    ...    xpath=//input[@placeholder='Enter employee name or EmpID...']
    ...    BEN15080995

    # Verify filtered employee
    Wait Until Page Contains    BEN15080995    10s
    Page Should Contain    BEN15080995

    Close Browser


Employee Details - Filter By Status
    Login As Super Admin

    # Open Employee Details
    Wait Until Page Contains    Total Employees    20s
    Click Element
    ...    xpath=//*[normalize-space()='Employees Details']

    # Wait for Employee View
    Wait Until Page Contains    Employee View    20s

    # Select Approved status
    Select From List By Label
    ...    xpath=(//select)[2]
    ...    Approved

    # Verify filtered result
    Wait Until Page Contains    Approved    10s
    Page Should Contain    Approved

    Close Browser