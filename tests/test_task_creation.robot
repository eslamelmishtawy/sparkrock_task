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
    [Teardown]    Teardown Delete Task And Close All Browsers    ${title}

Add Task with Special Characters
    [Tags]    Edge Case
    ${title}    Generate Special Character Title
    Add Task   ${title}
    Verify Task Is Added    ${title}
    [Teardown]    Teardown Delete Task And Close All Browsers    ${title}

Add Task with Empty Title
    [Tags]    Error Handling
    Verify Cannot Add Task With Empty Title
    [Teardown]    Close Browser
