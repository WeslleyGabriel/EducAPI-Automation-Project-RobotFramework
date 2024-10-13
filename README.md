# Testes Automatizados para EducAPI com Robot Framework

Este repositório contém um conjunto de testes automatizados para o **EducAPI**, um sistema colaborativo desenvolvido para apoiar atividades de alfabetização. Os testes foram desenvolvidos utilizando **Robot Framework** e **RequestsLibrary**, com o objetivo de contribuir para a qualidade dos serviços da API REST.

## Objetivo do Projeto

- **Automatizar operações CRUD**: Testar criação, leitura, atualização e exclusão de usuários, contextos e desafios.
- **Testar autenticação JWT**: Verificar se apenas usuários autenticados podem acessar funcionalidades protegidas.
- **Facilitar adaptação para outros sistemas**: Estrutura dos testes podem ser adaptadas para testar outras APIs REST.

## Pré-requisitos

- **Python 3.x**: Certifique-se de que Python está instalado.
- **Robot Framework e bibliotecas necessárias**:
  ```sh
  pip install robotframework robotframework-requests robotframework-faker

## Rodando os testes

- **Clone o Repositório**
    ```sh
    git clone https://github.com/WeslleyGabriel/EducAPI-Automation-Project-RobotFramework.git
    cd remoteEducAPI

## Configure as Variáveis
- **Atualize variables.robot com o BASE_URL correto para o ambiente (local, produção, etc).**
- **Armazene o token JWT como uma variável global, se necessário.**

## Execute os testes

- **Para rodar os testes**
    ```sh
    robot tests/
- **Para rodar um teste específico**
    ```sh
    robot -t "Nome do Caso de Teste" tests/
