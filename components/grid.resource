*** Settings ***
Resource    ../utils/utils.resource
*** Variables ***
${ADD_BUTTON}    //*[text()='Add']
${EXCEL_EXPORT}    //*[text()='Excel Export']
${SEARCH_INPUT}   id=Grid_ToolbarSearchBox
${SEARCH_ICON}    //span[contains(@class, 'e-searchclear')]
${GRID_LOCATOR}    //tbody[not(contains(@class, 'hide'))]
${STREET_TD_LOCATION_GRID}    //*[contains(@href, 'LocationInfo')]


*** Keywords ***
Get Grid Rows Count 
    Wait Until Element Count     ${GRID_LOCATOR}//tr    1
    ${ROWS}    Get WebElements    ${GRID_LOCATOR}//tr
    ${ROWS_LENGHT}    Get Length    ${ROWS}
    Log To Console    ${ROWS_LENGHT}
    [Return]    ${ROWS_LENGHT}