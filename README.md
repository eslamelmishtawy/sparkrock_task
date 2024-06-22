# To-Do List App Test Automation

This repository contains automated test cases for the task creation functionality of a To-Do List application using Robot Framework.

## Folder Structure

- **tests/**: Contains the Robot Framework test cases.
  - `test_task_creation.robot`: Test cases for task creation.

- **resources/**: Contains reusable keywords and variables.
  - **keywords/**: Custom keywords used in the tests.
    - `task_creation_keywords.robot`
  - **variables/**: Constant variables used in the tests.
    - `task_creation_variables.robot`

- **results/**: Directory to store test results and reports.

## Getting Started

### Prerequisites

- Python 3.11
- Robot Framework
- SeleniumLibrary

### Installation

1. Clone the repository:
    ```sh
    git clone <repository_url>
    cd todo_list_app_tests
    ```

2. Install the required packages:
    ```sh
    pip install -r requirements.txt
    ```

### Running Tests

To run the tests, execute the following command in the root directory:

```sh
robot -d results tests/
