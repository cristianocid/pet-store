*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot


*** Test Cases ***
Get Pet
    ${origin}=    Get Json    buddy.json

    ${pet_id}=   Convert To String    ${origin['id']} 

    ${resp}=      Get Pet    ${pet_id}

    Status Should Be    200                      ${resp}
    Should Be Equal     ${resp.json()['id']}    ${origin['id']}
