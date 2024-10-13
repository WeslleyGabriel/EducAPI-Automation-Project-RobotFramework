*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary
Library    Collections
Resource   ../../resources/variables.robot


*** Keywords ***
Listar Todos os Desafios
    [Documentation]    Teste para listar todos os desafios
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-type=application/json
    ${response}=   GET    ${BASE_URL}/challenges    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200

Buscar Desafio Por ID
	[Documentation]    Teste para buscar desafio por Id
    [Arguments]    ${idChallenge}
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-type=application/json
    ${response}=   GET    ${BASE_URL}/auth/challenges/${idChallenge}    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200

Criar Desafio
	[Documentation]    Teste para criar desafio
    [Arguments]    ${idContext}    ${imageUrl}    ${soundUrl}    ${videoUrl}    ${word}
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-type=application/json
    ${data}=    Create Dictionary    imageUrl=${imageUrl}    soundUrl=${soundUrl}    videoUrl=${videoUrl}    word=${word}
    ${response}=   POST    ${BASE_URL}/auth/challenges/${idContext}    headers=${headers}    json=${data}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    201

Atualizar Desafio
	[Documentation]    Teste para atualizar desafio
    [Arguments]    ${idChallenge}    ${imageUrl}    ${soundUrl}    ${videoUrl}    ${word}
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-type=application/json
    ${data}=    Create Dictionary    imageUrl=${imageUrl}    soundUrl=${soundUrl}    videoUrl=${videoUrl}    word=${word}
    ${response}=   PUT    ${BASE_URL}/auth/challenges/${idChallenge}    headers=${headers}    json=${data}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200

Deletar Desafio
	[Documentation]    Teste para deletar desafio
    [Arguments]    ${idChallenge}
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-type=application/json
    ${response}=   DELETE    ${BASE_URL}/auth/challenges/${idChallenge}    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    204

Listar Todos os Desafios Registrados por Usuário Autenticado
    [Documentation]    Testa a listagem de todos os desafios registrados pelo usuário autenticado
    ${headers}=    Create Dictionary    Authorization=${TOKEN}    Content-type=application/json
    ${response}=    GET    ${BASE_URL}/auth/challenges    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
