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

Get User
    ${origin}=    Get Json    /user/user.json

    ${user_name}=   Convert To String    ${origin['username']} 

    ${resp}=      Get User    ${user_name} 

    Status Should Be    200    ${resp}
    Should Be Equal     ${resp.json()['username']}    ${origin['username']}

Delete User
    ${origin}=    Get Json    /user/user.json

    ${user_name}=   Convert To String    ${origin['username']} 

    ${resp}=      Delete User    ${user_name}

    Status Should Be    200    ${resp}
    Should Be Equal    ${resp.json()['message']}  ${user_name}