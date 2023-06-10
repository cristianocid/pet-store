*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot

Library    OperatingSystem
Library    SeleniumLibrary

*** Test Cases ***
New Pet
    ${payload}=         Get Json    /pet/buddy.json

    #Delete Customer     ${payload['cpf']}
    ${resp}=            Post Pet    ${payload}

    Status Should Be    200    ${resp}

Get Pet
    ${origin}=    Get Json    /pet/buddy.json

    ${pet_id}=   Convert To String    ${origin['id']} 

    ${resp}=      Get Pet    ${pet_id}

    Status Should Be    200                      ${resp}
    Should Be Equal     ${resp.json()['id']}    ${origin['id']}

Update a Pet
    # Pet origem
    ${payload}=         Get Json    /pet/buddy.json
    
    # Pega o id do Pet
    ${user_id}=         Convert To String    ${payload['id']}
    
    # Solicita a alteração na API
    ${resp}    Put Pet    ${payload}
    
    Status Should Be    200    ${resp}

    # Obtem os dados do cliente para validar se o nome foi alterado
    ${resp}    Get Pet    ${user_id}

    Should Be Equal    ${resp.json()['name']}  Cid Shadow

Delete Pet
    ${origin}=    Get Json    /pet/buddy.json

    ${pet_id}=   Convert To String    ${origin['id']} 

    ${resp}=      Delete Pet    ${pet_id}

    Status Should Be    200    ${resp}
    Should Be Equal    ${resp.json()['message']}  ${pet_id}