# Robot Framework Selenium Automation

A web UI test automation portfolio project built using **Robot Framework, SeleniumLibrary, and Python**.

This project demonstrates a structured approach to browser-based test automation using reusable page resources, test data separation, functional test scenarios, and automated Robot Framework reporting.

The project is part of my continued development in modern test automation, building on my professional experience in **manual testing, automation testing, API testing, and software quality assurance**.

## Technologies

- Robot Framework
- SeleniumLibrary
- Python
- Selenium WebDriver
- Git
- GitHub

## Test Coverage

The project includes automated test scenarios covering:

- Login functionality
- Product page validation
- Product selection
- Add product to shopping cart
- Checkout workflow
- Purchase workflow
- Page element validation
- Reusable Robot Framework keywords
- Functional test tagging

## Framework Features

- Page-based reusable Robot Framework resources
- Separation of test cases and reusable keywords
- Centralized test data using Python
- SeleniumLibrary browser automation
- Explicit waits for UI elements
- Robot Framework test tags
- Automated HTML reports and logs

## Project Structure

```text
robot-framework-selenium-automation/
|-- .github/                    # GitHub configuration and workflows
|-- resources/
|   `-- pages/                  # Reusable page keywords and locators
|       |-- checkout_page.robot
|       |-- common.robot
|       |-- login_page.robot
|       `-- products_page.robot
|-- results/                    # Test execution results
|-- tests/                      # Robot Framework test suites
|   |-- login_tests.robot
|   `-- product_tests.robot
|-- variables/                  # Test data and variables
|   `-- test_data.py
|-- .gitignore                  # Git ignored files
|-- README.md                   # Project documentation
|-- log.html                    # Robot Framework execution log
|-- output.xml                  # Robot Framework execution output
|-- report.html                 # Robot Framework test report
`-- requirements.txt            # Python dependencies
```

## Prerequisites

Before running the tests, install:

- Python
- pip
- Google Chrome or another supported browser
- Git

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/Mullaimalarp/robot-framework-selenium-automation.git
```

### 2. Navigate to the project

```bash
cd robot-framework-selenium-automation
```

### 3. Create a virtual environment (recommended)

```bash
python -m venv .venv
```

On Windows, activate it with:

```bash
.venv\\Scripts\\activate
```

### 4. Install project dependencies

```bash
pip install -r requirements.txt
```

## Running Tests

Run all Robot Framework tests:

```bash
robot tests/
```

Run the login tests:

```bash
robot tests/login_tests.robot
```

Run the product tests:

```bash
robot tests/product_tests.robot
```

Run tests using a tag, for example `purchase`:

```bash
robot --include purchase tests/
```

## Test Reports

Robot Framework generates execution artifacts such as:

- `report.html` - High-level test execution report
- `log.html` - Detailed execution log
- `output.xml` - Machine-readable execution results

After running the tests, open `report.html` or `log.html` in a browser to review the results.

## Page Resource Design

Reusable page resources are stored under `resources/pages/`.

Examples include:

- `login_page.robot` - Login page actions and validation
- `products_page.robot` - Product page validation, cart actions, and purchase flow
- `checkout_page.robot` - Checkout-related actions
- `common.robot` - Common reusable browser keywords

This structure keeps test cases readable while separating page-specific locators and implementation details from test scenarios.

## Test Data Management

Test data is separated from the test scenarios and stored under:

```text
variables/test_data.py
```

This makes test values easier to maintain and reuse across multiple test suites.

## Planned Improvements

- Additional positive and negative test scenarios
- Data-driven testing
- Cross-browser testing
- Reusable setup and teardown keywords
- GitHub Actions CI/CD execution
- Improved test result management
- Additional end-to-end scenarios

## About Me

I am a **Test Engineer with more than 10 years of experience** in manual and automated testing across web applications, APIs, embedded systems, networking, and enterprise applications.

My automation experience includes:

- Python
- Robot Framework
- Selenium
- Playwright
- TypeScript
- Java
- TestNG
- C#
- API testing
- Git
- CI/CD

I use portfolio projects like this repository to continue developing practical automation framework design, maintainable test cases, reusable components, and modern software testing practices.

## Repository

[Robot Framework Selenium Automation](https://github.com/Mullaimalarp/robot-framework-selenium-automation)
