*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot

Library    OperatingSystem
Library    SeleniumLibrary

*** Test Cases ***
New Store
    ${payload}=         Get Json    /store/buddy.json

    #Delete Customer     ${payload['cpf']}
    ${resp}=            Post Pet    ${payload}

    Status Should Be    200    ${resp}

Get Store
    ${origin}=    Get Json    /store/buddy.json

    ${pet_id}=   Convert To String    ${origin['id']} 

    ${resp}=      Get Pet    ${pet_id}

    Status Should Be    200                      ${resp}
    Should Be Equal     ${resp.json()['id']}    ${origin['id']}

Delete Store
    ${origin}=    Get Json    /store/buddy.json

    ${id}=   Convert To String    ${origin['id']} 

    ${resp}=      Delete Pet    ${id}

    Status Should Be    200    ${resp}
    Should Be Equal    ${resp.json()['message']}  ${id}