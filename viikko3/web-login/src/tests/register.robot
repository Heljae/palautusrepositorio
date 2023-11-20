*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Register Page Open

*** Test Cases ***
Register With Valid Username And Password
    Go To Register Page
    Set Username  moii
    Set Password  joujou123
    Confirm Password  joujou123
    Submit Credentials
    Page Should Contain  Welcome to Ohtu Application!

Register With Too Short Username And Valid Password
    Go To Register Page
    Set Username  m
    Set Password  joujou123
    Confirm Password  joujou123
    Submit Credentials
    Register Should Fail With Message  Invalid username or password

Register With Valid Username And Invalid Password
    Go To Register Page
    Set Username  moikka
    Set Password  joujoujou
    Confirm Password  joujoujou
    Submit Credentials
    Register Should Fail With Message  Invalid username or password

Register With Nonmatching Password And Password Confirmation
    Go To Register Page
    Set Username  heippa
    Set Password  joujou123
    Confirm Password  jeejee123
    Submit Credentials
    Register Should Fail With Message  Password and confirmation don't match

Login After Successful Registration
    Go To Register Page
    Set Username  heippaa
    Set Password  joujou123
    Confirm Password  joujou123
    Submit Credentials
    Go To Login Page
    Set Username  heippaa
    Set Password  joujou123
    Submit Credentials Login
    Login Should Succeed

Login After Failed Registration
    Go To Register Page
    Set Username  he
    Set Password  joujou123
    Confirm Password  joujou123
    Submit Credentials
    Go To Login Page
    Set Username  he
    Set Password  joujou123
    Submit Credentials Login
    Login Should Fail With Message  Invalid username or password

*** Keywords ***
Register Should Succeed
    Main Page Should Be Open

Register Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Page Should Contain  ${message}

Login Should Succeed
    Main Page Should Be Open

Login Should Fail With Message
    [Arguments]  ${message}
    Login Page Should Be Open
    Page Should Contain  ${message}

Submit Credentials
    Click Button  Register

Submit Credentials Login
    Click Button  Login

Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Confirm Password
    [Arguments]  ${password}
    Input Password  password_confirmation  ${password}

Register Page Open
    Go To Register Page
