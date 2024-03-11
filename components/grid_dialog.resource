*** Settings ***
Resource    ../base/base.resource

*** Variables ***
${NAME_INPUT}                    //input[@name='name']
${EMAIL_INPUT}                   //input[@name='email']
${PHONE_INPUT}                   //input[@id[contains(., 'numeric')]]
${COMMENT_INPUT}                 //input[@id='comment']

${LOCATION_DIALOG_NAME_INPUT}    //input[@id[contains(., 'combobox')]]
${CITY_INPUT}                    //input[@name='varos']
${ZIP_INPUT}                     //input[@name='zip']
${STREET_INPUT}                  //input[@name='utca']
${HOUSE_NUMBER_INPUT}            //input[@name='szam']

${TOOL_NAME_INPUT}               //input[@name='name']
${COSTUMER_INPUT}                //input[@placeholder='Ügyfél']
${LOCATION_INPUT}                //input[@placeholder='Telephely']
${DESCRIPTION_INPUT}             //textarea[@id='Desc']
${TOOL_COMMENT_INPUT}                 //textarea[@id='Comm']
${CUSTOMER_LIST_POPUP}           //div[contains(@class, 'e-ddl')]
${CUSTOMER_NAME_DROPDOWN_BUTTON}    //span[contains(@class, 'e-input-group-icon e-ddl-icon')][1]

${SAVE_BUTTON}                   //button[text()='Save']

*** Keywords ***
Fill Customer Grid Dialog Form
    [Arguments]    ${NAME}    ${EMAIL}    ${PHONE}    ${COMMENT}
    Wait And Input    ${NAME_INPUT}    ${NAME}
    Wait And Input    ${EMAIL_INPUT}    ${EMAIL}
    Wait And Input    ${PHONE_INPUT}    ${PHONE}
    Wait And Input    ${COMMENT_INPUT}    ${COMMENT}
    Wait And Click    ${SAVE_BUTTON}

Fill Location Grid Dialog Form
    [Arguments]    ${NAME}    ${CITY}    ${ZIP}    ${STREET}    ${HOUSE_NUMBER}
    Wait And Input    ${LOCATION_DIALOG_NAME_INPUT}     ${NAME}
    Wait And Input    ${CITY_INPUT}    ${CITY}
    Wait And Input    ${ZIP_INPUT}    ${ZIP}
    Wait And Input    ${STREET_INPUT}    ${STREET}
    Wait And Input    ${HOUSE_NUMBER_INPUT}    ${HOUSE_NUMBER}
    Wait And Click    ${SAVE_BUTTON}

Fill Tool Grid Dialog Form
    [Arguments]    ${NAME}    ${COSTUMER}    ${LOCATION}    ${DESCRIPTION}    ${COMMENT}
    Wait And Input    ${TOOL_NAME_INPUT}    ${NAME}
    Wait And Input    ${COSTUMER_INPUT}    ${COSTUMER}
    Wait Until Element Is Visible    ${CUSTOMER_LIST_POPUP}
    Click Element    ${CUSTOMER_NAME_DROPDOWN_BUTTON}
    Wait And Input    ${LOCATION_INPUT}    ${LOCATION}
    Wait And Input    ${DESCRIPTION_INPUT}    ${DESCRIPTION}
    Wait And Input    ${TOOL_COMMENT_INPUT}    ${COMMENT}
    Wait And Click    ${SAVE_BUTTON}
    Sleep    1

Add Multiple Tools To Grid
    [Arguments]    ${TOOLS_JSON}    ${CUSTOMER_NAME}   ${LOCATION_NAME}
    ${TOOLS_JSON_LENGHT}    Get Length    ${TOOLS_JSON}
    FOR    ${counter}    IN RANGE    0    ${TOOLS_JSON_LENGHT}
        Wait And Click    ${ADD_BUTTON}
        ${TOOL_NAME}    Catenate    ${TOOLS_JSON}[${counter}][manufacturer]    ${TOOLS_JSON}[${counter}][model]
        Fill Tool Grid Dialog Form    ${TOOL_NAME}    ${CUSTOMER_NAME}    ${EMPTY}    ${TOOLS_JSON}[${counter}][platform]    ${TOOLS_JSON}[${counter}][serial_number]
    END