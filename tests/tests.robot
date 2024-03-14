*** Settings ***
Resource    ../base/base.resource

Test Setup    Setup Chrome
Test Teardown    Common Test Teardown

*** Test Cases ***
test_sceanrio_1
    Go To        ${MAIN_PAGE}
    Wait And Click    ${PARTNEREK_BUTTON}
    Sleep    2
    Wait And Click    ${ADD_BUTTON}
    ${user_response}    Request Test Data From API    /api/users/random_user?size=1
    ${full_name}    Catenate    ${user_response}[0][first_name]    ${user_response}[0][last_name]
    Fill Customer Grid Dialog Form     ${full_name}    ${user_response}[0][email]    ${EMPTY}    ${user_response}[0][id]
    #Customer Should Appear In Grid     ${FULL_NAME}    ${BODY}[0][email]    ${EMPTY}    ${BODY}[0][id]    ${EMPTY}
    Wait And Click    ${LOCATION_BUTTON}
    Sleep    1
    Wait And Click    ${ADD_BUTTON}
    Fill Location Grid Dialog Form    ${full_name}    ${user_response}[0][address][city]    ${user_response}[0][address][zip_code]    ${user_response}[0][address][street_address]    ${EMPTY}
    #Location Should Appear In Grid    ${FULL_NAME}    ${BODY}[0][address][city]    ${BODY}[0][address][zip_code]    ${BODY}[0][street_address][city]    ${SPACE}${SPACE}
    ${tool_response}    Request Test Data From API    /api/device/random_device?size=2
    Wait And Click    ${TOOL_BUTTON}
    Sleep    1
    Add Multiple Tools To Grid    ${tool_response}    ${full_name}    ${user_response}[0][address][city]
    #Tool Should Appear In Grid
    Wait And Click    ${EXCEL_EXPORT}
    Sleep    1
    Wait And Click    ${LOCATION_BUTTON}
    Sleep    1
    Wait And Input    ${SEARCH_INPUT}    ${full_name}
    Wait And Click    ${SEARCH_ICON}
    Row Count Should Be    1
    Wait And Click    ${STREET_TD_LOCATION_GRID}
    Location Info Page Should Open




    
