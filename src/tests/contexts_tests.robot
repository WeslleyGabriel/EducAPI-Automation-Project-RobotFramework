*** Settings ***
Resource    ../page/contexts_page.robot


*** Test Cases ***

Test Criar Contexto
    [Documentation]    Teste para criar um novo contexto
    Test Criar Contexto    https://example.com/image.jpg    Parque de diversões    https://example.com/sound.mp3    https://example.com/video.mp4

Test Listar Todos os Contextos
    [Documentation]    Testa a listagem de todos os contextos registrados pelo usuário
    Test Listar Todos os Contextos

Test Buscar Contexto por ID
    [Documentation]    Testa a busca de um contexto específico por ID
    Test Buscar Contexto por ID    1  # Substituir pelo ID do contexto

Test Atualizar Contexto
    [Documentation]    Testa a atualização de um contexto específico
    Test Atualizar Contexto    1    https://example.com/updatedimage.jpg    Parque Atualizado    https://example.com/updatedsound.mp3    https://example.com/updatedvideo.mp4

Test Deletar Contexto
    [Documentation]    Teste para deletar um contexto específico
    Test Deletar Contexto    1  # Substituir pelo ID do contexto
