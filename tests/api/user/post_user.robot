*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot

Library    OperatingSystem
Library    SeleniumLibrary

*** Test Cases ***
New User
    ${payload}=         Get Json    /user/user.json

    ${resp}=            Post User    ${payload}

    Status Should Be    200    ${resp}
