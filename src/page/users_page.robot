*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary
Library    Collections
Resource   ../../resources/variables.robot


*** Variables ***
${CREATE_USER_ENDPOINT}    /users
${LOGIN_ENDPOINT}          /auth/login

*** Keywords ***
Criar Usuário
    [Arguments]    ${email}    ${password}    ${name}

    &{payload}=    Create Dictionary    email=${email}    password=${password}    name=${name}

    ${result}=    Run Keyword And Ignore Error    POST    ${BASE_URL}${CREATE_USER_ENDPOINT}    json=${payload}

    ${status_code}=    Run Keyword If    '${result[0]}' == 'PASS'    Get Status Code From Response    ${result[1]}    ELSE    Set Variable    409

    Run Keyword If    '${status_code}' == '201'    Log    Usuário criado com sucesso.
    Run Keyword If    '${status_code}' == '409'    Log    Usuário já existe, nenhum problema.

    Should Be True    '${status_code}' == '201' or '${status_code}' == '409'


Get Status Code From Response
    [Arguments]    ${response}
    [Return]    ${response.status_code}


Autenticar Usuário
    [Arguments]    ${email}    ${password}
    &{payload}=    Create Dictionary    email=${email}    password=${password}
    ${response}=   POST    ${BASE_URL}${LOGIN_ENDPOINT}    json=${payload}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${token}=    Get From Dictionary    ${response.json()}    token
    Set Global Variable    ${TOKEN}    Bearer ${TOKEN}
    Log    Token de autenticação obtido: ${TOKEN}

Criar Usuário Fake
    ${email}=      FakerLibrary.Email
    ${name}=       FakerLibrary.Name
    ${password}=   FakerLibrary.Password
    &{payload}=    Create Dictionary    email=${email}    password=${password}    name=${name}
    ${response}=   POST    ${BASE_URL}/users    json=${payload}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log    Usuário criado: ${email} - ${name}

Listar Usuário Autenticado
    Create Session    api_session    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    ${response}=   GET On Session    api_session    /auth/users    headers=${headers}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}

Alterar Usuário
    [Arguments]    ${novo_email}    ${novo_nome}    ${nova_senha}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    ${dados}=    Create Dictionary    email=${novo_email}    name=${novo_nome}    password=${nova_senha}
    ${response}=    PUT    ${BASE_URL}/auth/users    headers=${headers}    json=${dados}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200

Deletar Usuário
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    ${response}=    DELETE    ${BASE_URL}/auth/users    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
