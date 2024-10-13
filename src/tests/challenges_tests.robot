*** Settings ***
Resource    ../page/challenges_page.robot

*** Test Cases ***
Test Listar Todos os Desafios
    [Documentation]    Testa a listagem de desafios
    Listar Todos os Desafios

Test Listar Todos os Desafios Registrados Pelo Usuário Autenticado
    [Documentation]    Teste para listar todos os desafios registrados pelo usuário autenticado
    Listar Todos os Desafios Registrados por Usuário Autenticado

Test Buscar Desafio Por ID
    Buscar Desafio Por ID    1

Test Criar Desafio
    Criar Desafio    800    https://img.freepik.com/fotos-gratis/belas-borboletas-na-natureza_23-2150765855.jpg    https://semSom    https://youtu.be/s2WvBNJs_oE?si=7LrSvNe0MkmLfwek    Natureza

Test Atualizar Desafio
    Atualizar Desafio    1    https://newimageurl.com    https://newsoundurl.com    https://newvideourl.com    NovaPalavra

Test Deletar Desafio
    Deletar Desafio    1