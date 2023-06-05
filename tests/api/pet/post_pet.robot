*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot

Library    OperatingSystem
Library    SeleniumLibrary

*** Test Cases ***
New Pet
    ${payload}=         Get Json    buddy.json

    #Delete Customer     ${payload['cpf']}
    ${resp}=            Post Pet    ${payload}

    Status Should Be    200    ${resp}
