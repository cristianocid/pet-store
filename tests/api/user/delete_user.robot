*** Settings ***

Resource    ../../../resources/services.robot
Resource    ../../../resources/fixtures/pet/buddy.json

*** Test Cases ***
Delete User
    ${origin}=    Get Json    /user/user.json

    ${user_name}=   Convert To String    ${origin['username']} 

    ${resp}=      Delete User    ${user_name}

    Status Should Be    200    ${resp}
    Should Be Equal    ${resp.json()['message']}  ${user_name}