*** Settings ***
Resource    ../page/users_page.robot



*** Test Cases ***
Test Criar Usuário
    [Documentation]    Testa a criação de um usuário
    Criar Usuário    WeslleyGabrielPaz@test.com    Has7#skPS&    Apenas um Teste

Test Autenticar Usuário
    [Documentation]    Testa a autenticação de um usuário
    Autenticar Usuário    adfdsssest@test.com    password123

Teste Criar Usuário Fake
	[Documentation]    Usado para gerar massa de teste
    Criar Usuário Fake

Test Listar Usuário Autenticado
    [Documentation]    Teste para listar usuário
	Listar Usuário Autenticado

Test Alterar Usuário
    [Documentation]    Teste para alterar um usuário autenticado
    Alterar Usuário    NEWemail@teste.com    NEW Nome    novaSenha123

Test Deletar Usuário
    [Documentation]    Teste para deletar um usuário autenticado
    Deletar Usuário