*** Settings ***
Resource    ../base/base.resource

Test Setup    Setup Chrome
Test Teardown    Common Test Teardown

*** Test Cases ***
test_sceanrio_1
    Go To        ${MAIN_PAGE}
    Wait And Click    ${PARTNEREK_BUTTON}
    Wait And Click    ${ADD_BUTTON}
    ${USER_RESPONSE}    Request Test Data From API    /api/users/random_user?size=1
    ${FULL_NAME}    Catenate    ${USER_RESPONSE}[0][first_name]    ${USER_RESPONSE}[0][last_name]
    Fill Customer Grid Dialog Form     ${FULL_NAME}    ${USER_RESPONSE}[0][email]    ${EMPTY}    ${USER_RESPONSE}[0][id]
    #Customer Should Appear In Grid     ${FULL_NAME}    ${BODY}[0][email]    ${EMPTY}    ${BODY}[0][id]    ${EMPTY}
    Wait And Click    ${LOCATION_BUTTON}
    Sleep    1
    Wait And Click    ${ADD_BUTTON}
    Fill Location Grid Dialog Form    ${FULL_NAME}    ${USER_RESPONSE}[0][address][city]    ${USER_RESPONSE}[0][address][zip_code]    ${USER_RESPONSE}[0][address][street_address]    ${EMPTY}
    #Location Should Appear In Grid    ${FULL_NAME}    ${BODY}[0][address][city]    ${BODY}[0][address][zip_code]    ${BODY}[0][street_address][city]    ${SPACE}${SPACE}
    ${TOOL_RESPONSE}    Request Test Data From API    /api/device/random_device?size=2
    Wait And Click    ${TOOL_BUTTON}
    Sleep    1
    Add Multiple Tools To Grid    ${TOOL_RESPONSE}    ${FULL_NAME}    ${USER_RESPONSE}[0][address][city]
    #Tool Should Appear In Grid
    Wait And Click    ${EXCEL_EXPORT}
    Sleep    1
    Wait And Click    ${LOCATION_BUTTON}
    Sleep    1
    Wait And Input    ${SEARCH_INPUT}    ${FULL_NAME}
    Wait And Click    ${SEARCH_ICON}
    Row Count Should Be    1
    Wait And Click    ${STREET_TD_LOCATION_GRID}
    Location Info Page Should Open




    
