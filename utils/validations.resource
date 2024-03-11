*** Settings ***
Resource    ../base/base.resource

*** Variables ***
${FIRST_ROW_LOCATOR}    //tr[@aria-rowindex='1']

*** Keywords ***
Customer Should Appear In Grid
    [Arguments]    ${NAME}    ${EMAIL}    ${PHONE}    ${COMMENT}    ${LOCATION}
    Wait Until Element Is Visible    ${FIRST_ROW_LOCATOR}//td[text() = '${NAME}']
    ${ACTUAL_NAME}       Get Text    ${FIRST_ROW_LOCATOR}//td[2]
    ${ACTUAL_EMAIL}      Get Text    ${FIRST_ROW_LOCATOR}//td[3]
    ${ACTUAL_PHONE}      Get Text    ${FIRST_ROW_LOCATOR}//td[4]
    Log To Console       actual phone: '${ACTUAL_PHONE}'
    Log To Console       emptyyyyyyyy: '${EMPTY}'
    Log To Console       spaceeeeeeee: '${SPACE}'
    ${ACTUAL_COMMENT}    Get Text    ${FIRST_ROW_LOCATOR}//td[5]
    ${ACTUAL_LOCATION}   Get Text    ${FIRST_ROW_LOCATOR}//td[6]
    Should Be Equal As Strings    ${ACTUAL_NAME}        ${NAME}
    Should Be Equal As Strings    ${ACTUAL_EMAIL}       ${EMAIL}
    Should Be Equal As Strings    ${ACTUAL_PHONE}       ${PHONE}
    Should Be Equal As Strings    ${ACTUAL_COMMENT}     ${COMMENT}
    Should Be Equal As Strings    ${ACTUAL_LOCATION}    ${LOCATION}

Location Should Appear In Grid
    [Arguments]    ${NAME}    ${CITY}    ${ZIP}    ${STREET}    ${HOUSE_NUMBER}
    Wait Until Element Is Visible    ${FIRST_ROW_LOCATOR}//td[text() = '${NAME}']
    ${ACTUAL_NAME}            Get Text    ${FIRST_ROW_LOCATOR}//td[2]
    ${ACTUAL_CITY}            Get Text    ${FIRST_ROW_LOCATOR}//td[3]
    ${ACTUAL_ZIP}             Get Text    ${FIRST_ROW_LOCATOR}//td[4]
    ${ACTUAL_STREET}          Get Text    ${FIRST_ROW_LOCATOR}//td[5]
    ${ACTUAL_HOUSE_NUMBER}    Get Text    ${FIRST_ROW_LOCATOR}//td[6]'
    Should Be Equal As Strings    ${ACTUAL_NAME}          ${NAME}
    Should Be Equal As Strings    ${ACTUAL_CITY}          ${CITY}
    Should Be Equal As Strings    ${ACTUAL_ZIP}           ${ZIP}
    Should Be Equal As Strings    ${ACTUAL_STREET}        ${STREET}
    Should Be Equal As Strings    ${ACTUAL_HOUSE_NUMBER}  ${HOUSE_NUMBER}

Row Count Should Be
    [Arguments]    ${EXPECTED_COUNT}
    ${EXPECTED_COUNT}    Convert To Integer    ${EXPECTED_COUNT}
    ${ACTUAL_COUNT}    Get Grid Rows Count
    Should Be Equal    ${ACTUAL_COUNT}    ${EXPECTED_COUNT}

Location Info Page Should Open
    ${ACTUAL_URL}    Get Location
    Should Contain    ${ACTUAL_URL}   LocationInfo
    