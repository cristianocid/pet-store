*** Settings ***

Resource    ../../../resources/services.robot
Resource    ../../../resources/fixtures/pet/buddy.json

*** Test Cases ***
Delete Pet
    ${origin}=    Get Json    buddy.json

    ${pet_id}=   Convert To String    ${origin['id']} 

    ${resp}=      Delete Pet    ${pet_id}

    Status Should Be    200    ${resp}
    Should Be Equal    ${resp.json()['message']}  ${pet_id}