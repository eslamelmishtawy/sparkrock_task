*** Settings ***
Resource    ../resources/task_creation_keywords.robot
Test Setup    Open Browser To Do List App
Test Teardown    Teardown Delete Task And Close All Browsers    ${todo_name_simple}

*** Test Cases ***
Add a Simple Task
    [Tags]    Basic Functionality
    Add Task   ${todo_name_simple}
    Verify Task Is Added    ${todo_name_simple}

Add Task with Long Title
    [Tags]    Edge Case
    ${title}    Generate Long Title
    Add Task   ${title}
    Verify Task Is Added    ${title}

Add Task with Due Date
    [Tags]    Extended Functionality   test
    Add Task With Due Date     30
    Verify Task Is Added    ${todo_name_simple}

Add Task with Special Characters
    [Tags]    Edge Case
    Add Task    ${special_task_title}
    Verify Task Added    ${special_task_title}

Add Task with Empty Title
    [Tags]    Error Handling
    Add Task    ${empty_task_title}
    Verify Error Message    ${error_message}
