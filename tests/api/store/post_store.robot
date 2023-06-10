*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot

Library    OperatingSystem
Library    SeleniumLibrary

*** Test Cases ***
New Store
    ${payload}=         Get Json    /store/buddy.json

    #Delete Customer     ${payload['cpf']}
    ${resp}=            Post Store    ${payload}

    Status Should Be    200    ${resp}
