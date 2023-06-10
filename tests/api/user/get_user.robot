*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot


*** Test Cases ***
Get User
    ${origin}=    Get Json    /user/user.json

    ${user_name}=   Convert To String    ${origin['username']} 

    ${resp}=      Get User    ${user_name} 

    Status Should Be    200    ${resp}
    Should Be Equal     ${resp.json()['username']}    ${origin['username']}
