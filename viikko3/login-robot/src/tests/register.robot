*** Settings ***
Resource  resource.robot
Test Setup  Create User And Input Register Command

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  joujee  hi123478238372
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  jeee  hi12344282498
    Output Should Contain  User with username jeee already exists    

Register With Too Short Username And Valid Password
    Input Credentials  l  hi1234moi
    Output Should Contain  Username must be at least 3 characters 

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  long123  hi1234moi
    Output Should Contain  Username can only include a-z

Register With Valid Username And Too Short Password
    Input Credentials  jeejee  k1
    Output Should Contain  Password must be at least 8 characters

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  jeejee  khehfieifa
    Output Should Contain  Password must include special characters

*** Keywords ***
Create User And Input Register Command
    Create User  jeee  jee1132323
    Input Register Command