*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot


*** Test Cases ***
Get Store
    ${origin}=    Get Json    /store/buddy.json

    ${id}=   Convert To String    ${origin['id']} 

    ${resp}=      Get Pet    ${id}

    Status Should Be    200                      ${resp}
    Should Be Equal     ${resp.json()['id']}    ${origin['id']}
