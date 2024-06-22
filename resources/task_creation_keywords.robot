*** Settings ***
Resource    task_creation_variables.robot
Library    SeleniumLibrary
Library    String

*** Variables ***
${id_email_textfield}    element-0
${id_password_textfield}    element-3
${xpath_login_button}    //button[@data-gtm-id="start-email-login"]
${xpath_add_task_button}    //button[@class="plus_add_button"]
${xpath_task_name}    //div[contains(@class,"tiptap") and @aria-label="Task name"]
${xpath_task_description}   //div[contains(@class,"tiptap") and @aria-label="Description"]
${xpath_cancel_button}   //button[@aria-label="Cancel"]
${xpath_add_task_submit_button}    //button[@data-testid="task-editor-submit-button"]
${xpath_add_task_submit_button_disabled}    //button[@data-testid="task-editor-submit-button"][[@aria-disabled="true"]]
${xpath_task_content_added}    //div[@class="task_content"][text()="__REPLACE__"]
${xpath_task_overflow_menu}    //div[@data-index=2]//button[@data-testid="more_menu"]
${xpath_task_overflow_menu_delete}    //button[@data-action-hint="task-overflow-menu-delete"]
${xpath_submit_button}    //button[@type="submit"]
${xpath_due_date_button}    //span[@class="date date_today"]
${xpath_select_due_Date}    //span[@class="calendar__day__date__number"][text()="_REPLACE_"]

*** Keywords ***
Open Browser To Do List App
    Open Browser    ${DEFAULT_URL}    ${BROWSER}
    Maximize Browser Window
    Login To Todoist

Login To Todoist
    Wait Until Page Contains Element    ${id_email_textfield}    timeout=20
    Input Text    ${id_email_textfield}    ${email}
    Wait Until Page Contains Element    ${id_password_textfield}
    Input Text    ${id_password_textfield}    ${password}
    Click Element    ${xpath_login_button}

Add Task
    [Arguments]    ${task_name}
    Wait Until Element Is Visible    ${xpath_add_task_button}    timeout=20
    sleep    1
    Click Element    ${xpath_add_task_button}
    Wait Until Page Contains Element    ${xpath_task_name}
    Input Text    ${xpath_task_name}    ${task_name}
    Input text    ${xpath_task_description}    ${todo_description}
    Click Element    ${xpath_add_task_submit_button}

Verify Cannot Add Task With Empty Title
    Wait Until Element Is Visible    ${xpath_add_task_button}    timeout=20
    sleep    1
    Click Element    ${xpath_add_task_button}
    Wait Until Page Contains Element    ${xpath_task_name}
    Input Text    ${xpath_task_name}    ${EMPTY}
    Input text    ${xpath_task_description}    ${todo_description}
    Wait Until Page Contains Element   ${xpath_add_task_submit_button}

Add Task With Due Date
    [Arguments]    ${date}
    Wait Until Element Is Visible    ${xpath_add_task_button}    timeout=20
    sleep    1
    Click Element    ${xpath_add_task_button}
    Wait Until Page Contains Element    ${xpath_task_name}
    Input Text    ${xpath_task_name}    ${todo_name_simple}
    Input text    ${xpath_task_description}    ${todo_description}
    Set Task Due Date    ${date}
    Click Element    ${xpath_add_task_submit_button}

Set Task Due Date
    [Arguments]    ${date}
    Wait Until Page Contains Element    ${xpath_due_date_button}
    Click Element    ${xpath_due_date_button}
    ${locator}    Replace String    ${xpath_select_due_Date}    _REPLACE_    ${date}
    Wait Until Page COntains Element    ${date}
    Click Element    ${locator}

Generate Long Title
    ${long_title}    Generate Random String    100    chars=[LETTERS]
    RETURN    ${long_title}

Generate Special Character Title
    ${title}    Generate Random String    10    chars=[LETTERS][NUMBERS]$#@
    RETURN    ${title}

Verify Task Is Added
    [Arguments]    ${title}
    ${locator}    Replace String    ${xpath_task_content_added}    __REPLACE__    ${title}
    Wait Until Page Contains Element    ${locator}

Teardown Delete Task And Close All Browsers
    [Arguments]    ${title}
    Delete the Added Task    ${title}
    Verify Task Is Deleted    ${title}
    Close Browser

Delete the Added Task
    [Arguments]    ${title}
    ${locator}    Replace String    ${xpath_task_content_added}    __REPLACE__    ${title}
    Wait Until Page Contains Element    ${locator}
    Mouse Over    ${locator}
    Wait Until Page Contains Element    ${xpath_task_overflow_menu}
    Click Element    ${xpath_task_overflow_menu}
    Wait Until Element Is Visible    ${xpath_task_overflow_menu_delete}
    Click Element    ${xpath_task_overflow_menu_delete}
    Wait Until Element Is Visible    ${xpath_submit_button}
    Click Element    ${xpath_submit_button}

Verify Task Is Deleted
    [Arguments]    ${title}
    ${locator}    Replace String    ${xpath_task_content_added}    __REPLACE__    ${title}
    Wait Until Element Is Not Visible    ${locator} 

Close Browser
    Close All Browsers
