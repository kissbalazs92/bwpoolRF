*** Settings ***
Resource    ../base/base.resource

*** Variables ***
${EMPTY_TD_TEXT}=    ${SPACE}

*** Keywords ***
Request Test Data From API
    [Arguments]    ${URI}
    Create Session    jsonplaceholder    https://random-data-api.com
    ${response}=    GET On Session    jsonplaceholder    ${URI}
    ${body}    Set Variable    ${response.json()}
    RETURN    ${body}

Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Wait And Input
    [Arguments]    ${locator}    ${text}    ${timeout}=15
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}

Wait Until Element Count
    [Arguments]    ${locator}    ${expected_count}    ${timeout}=10    ${error_message}=Element count did not reach expected value within timeout
    ${start_time}    Set Variable    0
    ${elapsed}    Set Variable    0
    FOR    ${index}    IN RANGE    1    ${timeout}
        ${elements}=    Get WebElements    ${locator}
        ${count}=    Get Length    ${elements}
        Exit For Loop If    '${count}' == '${expected_count}'
        Run Keyword If    '${elapsed}' > '${timeout}'    Fail    ${error_message}
        Sleep    1
        ${elapsed}    Set Variable    ${elapsed} + 1   
        ${elements}=    Get WebElements    ${locator} 
        ${count}=    Get Length    ${elements}
        Exit For Loop If    '${count}' == '${expected_count}'
    END
    ${final_count}=    Get Length    ${elements}
    Should Be Equal As Numbers    ${final_count}    ${expected_count}    ${error_message}