*** Settings ***
Resource    ../../../resources/helpers.robot
Resource    ../../../resources/services.robot

Library    OperatingSystem
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Update a Pet
    # Pet origem
    ${payload}=         Get Json    buddy.json
    
    # Pega o id do Pet
    ${user_id}=         Convert To String    ${payload['id']}
    
    # Solicita a alteração na API
    ${resp}    Put Pet    ${payload}
    
    Status Should Be    200    ${resp}

    # Obtem os dados do cliente para validar se o nome foi alterado
    ${resp}    Get Pet    ${user_id}

    Should Be Equal    ${resp.json()['name']}  Cid Shadow