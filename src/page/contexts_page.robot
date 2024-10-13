*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary
Library    Collections
Resource   ../../resources/variables.robot


*** Keywords ***
Test Criar Contexto
    [Documentation]    Teste para criar um novo contexto
    [Arguments]    ${imageUrl}    ${name}    ${soundUrl}=    ${videoUrl}=
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-Type=application/json
    ${data}=    Create Dictionary    imageUrl=${imageUrl}    name=${name}    soundUrl=${soundUrl}    videoUrl=${videoUrl}
    ${response}=    POST    ${BASE_URL}/auth/contexts    headers=${headers}    json=${data}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    201

Test Listar Todos os Contextos
    [Documentation]    Testa a listagem de todos os contextos registrados pelo usuário
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-Type=application/json
    ${response}=    GET    ${BASE_URL}/auth/contexts    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200

Test Buscar Contexto por ID
    [Documentation]    Testa a busca de um contexto específico por ID
    [Arguments]    ${idContext}
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-Type=application/json
    ${response}=    GET    ${BASE_URL}/auth/contexts/${idContext}    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200


Test Atualizar Contexto
    [Documentation]    Testa a atualização de um contexto específico
    [Arguments]    ${idContext}    ${imageUrl}    ${name}    ${soundUrl}=    ${videoUrl}=
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-Type=application/json
    ${data}=    Create Dictionary    imageUrl=${imageUrl}    name=${name}    soundUrl=${soundUrl}    videoUrl=${videoUrl}
    ${response}=    PUT    ${BASE_URL}/auth/contexts/${idContext}    headers=${headers}    json=${data}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200

Test Deletar Contexto
	[Documentation]    Teste para deletar um contexto específico
    [Arguments]    ${idContext}
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-Type=application/json
    ${response}=    DELETE    ${BASE_URL}/auth/contexts/${idContext}    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
