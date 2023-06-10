*** Settings ***

Resource    ../../../resources/services.robot
Resource    ../../../resources/fixtures/pet/buddy.json

*** Test Cases ***
Delete Store
    ${origin}=    Get Json    /store/buddy.json

    ${id}=   Convert To String    ${origin['id']} 

    ${resp}=      Delete Pet    ${id}

    Status Should Be    200    ${resp}
    Should Be Equal    ${resp.json()['message']}  ${id}