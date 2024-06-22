# To-Do List App Test Cases: Task Creation

This markdown file outlines test cases for creating tasks in a To-Do List application.

## Test Cases:

These test cases cover adding tasks with different attributes and verifying expected behavior.

### 1. Task Creation

#### Test Case 1: Add a Simple Task

- **Priority:** High
- **Tags:** Basic Functionality, Manual, Automated
- **Description:** Verify adding a basic task with a title.
- **Pre-Conditions:** App is launched and user is logged in (if applicable).
- **Steps:**
  1. Click "Add Task" button.
  2. Enter "Buy groceries" in the title field.
  3. Click "Save" button.
- **Expected Result:** Task is added to the list with title "Buy groceries".
- **Test Data:** 
  - Title: Buy groceries

#### Test Case 2: Add Task with Long Title

- **Priority:** Medium
- **Tags:** Edge Case, Manual, Automated
- **Description:** Verify adding a task with a title exceeding the character limit (if applicable).
- **Pre-Conditions:** App is launched and user is logged in (if applicable).
- **Steps:**
  1. Click "Add Task" button.
  2. Enter a title exceeding character limit (adjust length based on app).
  3. Click "Save" button.
- **Expected Result:** 
  - Task is added with truncated title (if applicable).
  - OR
  - An error message is displayed indicating character limit exceeded.
- **Test Data:** 
  - Title: This is a very long title that may exceed the character limit. (Adjust length based on app)

#### Test Case 3: Add Task with Due Date

- **Priority:** Medium
- **Tags:** Extended Functionality, Manual, Automated
- **Description:** Verify adding a task with a due date in the future.
- **Pre-Conditions:** App is launched and user is logged in (if applicable).
- **Steps:**
  1. Click "Add Task" button.
  2. Enter "Finish report" in the title field.
  3. Select a future date from the due date picker.
  4. Click "Save" button.
- **Expected Result:** Task is added to the list with title "Finish report" and the selected due date displayed.
- **Test Data:** 
  - Title: Finish report
  - Due Date: 2024-07-04 (or any future date)

#### Test Case 4: Add Task with Special Characters

- **Priority:** Medium
- **Tags:** Edge Case, Manual, Automated
- **Description:** Verify adding a task with special characters in the title and description (if allowed).
- **Pre-Conditions:** App is launched and user is logged in (if applicable).
- **Steps:**
  1. Click "Add Task" button.
  2. Enter "Clean website (includes ® symbol)" in the title field.
  3. Click "Save" button.
- **Expected Result:** Task is added to the list with title "Clean website (includes ® symbol)" and the special character preserved.
- **Test Data:** 
  - Title: Clean website (includes ® symbol)

#### Test Case 5: Add Task with Empty Title

- **Priority:** High
- **Tags:** Error Handling, Manual, Automated
- **Description:** Verify adding a task with an empty title is not allowed.
- **Pre-Conditions:** App is launched and user is logged in (if applicable).
- **Steps:**
  1. Click "Add Task" button.
  2. Leave the title field empty.
  3. Click "Save" button.
- **Expected Result:** An error message is displayed indicating a title is required.
- **Test Data:** 
  - Title: (Empty)
