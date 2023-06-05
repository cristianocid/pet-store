*** Settings ***
Library    Collections
Library    json
Library    OperatingSystem


*** Keywords ***
Get Json
    [Arguments]    ${file_name}

    ${json_file}    Get File    ${EXECDIR}/resources/fixtures/pet/${file_name}
    ${json_dict}=   Evaluate    json.loads($json_file)    json

    [return]    ${json_dict}   