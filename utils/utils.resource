*** Settings ***
Resource    ../base/base.resource

*** Variables ***
${first_row_locator}    //tr[@aria-rowindex='1']

*** Keywords ***
Customer Should Appear In Grid
    [Arguments]    ${name}    ${email}    ${phone}    ${comment}    ${location}
    Wait Until Element Is Visible    ${first_row_locator}//td[text() = '${name}']
    ${actual_name}       Get Text    ${first_row_locator}//td[2]
    ${actual_email}      Get Text    ${first_row_locator}//td[3]
    ${actual_phone}      Get Text    ${first_row_locator}//td[4]
    Log To Console       actual phone: '${actual_phone}'
    Log To Console       emptyyyyyyyy: '${empty}'
    Log To Console       spaceeeeeeee: '${space}'
    ${actual_comment}    Get Text    ${first_row_locator}//td[5]
    ${actual_location}   Get Text    ${first_row_locator}//td[6]
    Should Be Equal As Strings    ${actual_name}        ${name}
    Should Be Equal As Strings    ${actual_email}       ${email}
    Should Be Equal As Strings    ${actual_phone}       ${phone}
    Should Be Equal As Strings    ${actual_comment}     ${comment}
    Should Be Equal As Strings    ${actual_location}    ${location}

Location Should Appear In Grid
    [Arguments]    ${name}    ${city}    ${zip}    ${street}    ${house_number}
    Wait Until Element Is Visible    ${first_row_locator}//td[text() = '${name}']
    ${actual_name}            Get Text    ${first_row_locator}//td[2]
    ${actual_city}            Get Text    ${first_row_locator}//td[3]
    ${actual_zip}             Get Text    ${first_row_locator}//td[4]
    ${actual_street}          Get Text    ${first_row_locator}//td[5]
    ${actual_house_number}    Get Text    ${first_row_locator}//td[6]
    Should Be Equal As Strings    ${actual_name}          ${name}
    Should Be Equal As Strings    ${actual_city}          ${city}
    Should Be Equal As Strings    ${actual_zip}           ${zip}
    Should Be Equal As Strings    ${actual_street}        ${street}
    Should Be Equal As Strings    ${actual_house_number}  ${house_number}

Row Count Should Be
    [Arguments]    ${expected_count}
    ${expected_count}    Convert To Integer    ${expected_count}
    ${actual_count}    Get Grid Rows Count
    Should Be Equal    ${actual_count}    ${expected_count}

Location Info Page Should Open
    ${actual_url}    Get Location
    Should Contain    ${actual_url}   LocationInfo
