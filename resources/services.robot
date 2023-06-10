*** Settings ***
Documentation    Camada de serviços do projeto de automação

Library     RequestsLibrary
Resource    helpers.robot

*** Variables ***
${base_api_url}    https://petstore.swagger.io/v2

*** Keywords ***
## Post /pet
Post Pet
    [Arguments]    ${payload}

    Create Session    pet-api    ${base_api_url}

    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json
    
    ${resp}=       Post Request    pet-api    /pet    json=${payload}    headers=${headers}
    
    [return]    ${resp}

## Get /pet
Get Pet
    [Arguments]    ${pet_id}
    
    Create Session    pet-api    ${base_api_url}

    &{headers}=    Create Dictionary    Content-Type=Application/json    accept=application/json

    ${resp}=       Get Request    pet-api    /pet/${pet_id}    headers=${headers}
    
    [return]    ${resp}    

## Put /pet
Put Pet
    [Arguments]    ${payload}

    Create Session    pet-api    ${base_api_url}

    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json
    
    ${resp}=       Put Request    pet-api    /pet   json=${payload}    headers=${headers}
    
    [return]    ${resp}

## Delete /pet
Delete Pet
    [Arguments]    ${pet_id}

    Create Session    pet-api    ${base_api_url}
    
    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json

    ${resp}=    Delete Request    pet-api    /pet/${pet_id}    headers=${headers}

    [return]    ${resp}


## Post /store/order
Post Store
    [Arguments]    ${payload}

    Create Session    pet_store-api    ${base_api_url}

    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json
    
    ${resp}=       Post Request    pet_store-api    /store/order    json=${payload}    headers=${headers}
    
    [return]    ${resp}

## Get /store/order
Get Store
    [Arguments]    ${id}
    
    Create Session    pet_store-api    ${base_api_url}

    &{headers}=    Create Dictionary    Content-Type=Application/json    accept=application/json

    ${resp}=       Get Request    pet_store-api    /store/order/${id}    headers=${headers}
    
    [return]    ${resp}    

## Delete /store/order
Delete Store
    [Arguments]    ${id}

    Create Session    pet_store-api    ${base_api_url}
    
    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json

    ${resp}=    Delete Request    pet_store-api    /store/order/${id}    headers=${headers}

    [return]    ${resp}


## Post /user
Post User
    [Arguments]    ${payload}

    Create Session    pet_user-api    ${base_api_url}

    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json
    
    ${resp}=       Post Request    pet_user-api    /user    json=${payload}    headers=${headers}
    
    [return]    ${resp}

## Get /user
Get User
    [Arguments]    ${user_name}
    
    Create Session    pet_user-api    ${base_api_url}

    &{headers}=    Create Dictionary    Content-Type=Application/json    accept=application/json

    ${resp}=       Get Request    pet_user-api    /user/${user_name}    headers=${headers}
    
    [return]    ${resp}   

## Delete /user
Delete User
    [Arguments]    ${user_name}

    Create Session    pet_user-api    ${base_api_url}
    
    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json

    ${resp}=    Delete Request    pet_user-api    /user/${user_name}    headers=${headers}

    [return]    ${resp}