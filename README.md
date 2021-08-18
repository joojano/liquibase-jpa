# Liquibase + JPA
<p align="center">
    <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white"/>
    <img src="https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white"/>
    <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"/>
    <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white"/>
    <img src="https://img.shields.io/badge/Docker-0DB7ED?style=for-the-badge&logo=docker&logoColor=white"/>
</p>

### Tópicos

- [Descrição do projeto](#descricao)
- [O que foi usado?](#usado)
- [Como rodar a aplicação?](#rodar)
    - [Itens necessários para rodar a aplicação](#dependencias)
    - [Executando a aplicação](#executando-app)
    - [Executando as migrações](#executando-migrations)
- [Endpoints da aplicação](#endpoints)
- [Comandos do Liquibase](#comandos-liquibase)

<a name="descricao"/>

## Descrição do projeto
API REST básica para inserir e consultar usuários em um sistema, com ferramenta de migração de dados Liquibase imbutida para versionamento de schema (migração de dados).

<a name="usado"/>

## O que foi usado?

- Java 8, com as seguintes dependências:
    - Spring Boot 2.4.2
    - Spring Data
    - [Lombok](https://projectlombok.org/) para redução de códigos comuns como getters/setters;
    - Driver PostgreSQL;
    - [Liquibase](https://www.liquibase.org/) com Maven Wrapper para migração de dados;
- PostgreSQL 13.4;
- Docker v20.10.8

<a name="rodar"/>

## Como rodar a aplicação?

<a name="dependencias"/>

### Itens necessários

- [Docker](https://docs.docker.com/desktop/);
- [Docker Compose](https://docs.docker.com/compose/install/)

<a name="executando-app"/>

### Executando a aplicação
A API foi pré-construída para ser consumida imediatamente, e empacotada em uma imagem Docker. Adicionalmente,
a dependência da aplicação, PostgreSQL, está incluída no arquivo docker-compose.yml.

Para executar toda a aplicação, clone este repositório, abra seu terminal e vá até a pasta onde o repositório está.
Em seguida, execute o seguinte comando:

```docker-compose up -d```

Após a execução bem sucedida, você poderá acessar a API no endereço http://localhost:10000 e o banco de dados no
endereço localhost:5432.

<a name="executando-migrations"/>

### Executando as migrações

Para criação do banco de dados e dados de exemplo, são usados os arquivos .sql contidos na pasta
src/main/resources/db/migration. Para implantar as migrações, vá até a pasta raiz e execute o seguinte comando:

```./mvnw liquibase:update```

A aplicação irá implementar os SQLs no banco de dados.

**Vale ressaltar que o mvnw pode não ter permissão para rodar no seu sistema**. Caso esteja no Linux, execute o comando
`chmod +x mvnw` para dar permissão de execução.

<a name="endpoints"/>

## Endpoints da aplicação
Considerando a simplicidade da aplicação, foi optado pela não criação da especificação OpenAPI/Swagger. Portanto, segue
abaixo os métodos da API.

| Método | Caminho | Função                                   | Body                                           | Retorno                                                          |
|--------|---------|------------------------------------------|------------------------------------------------|------------------------------------------------------------------|
| POST   | /user   | Insere um novo usuário no banco de dados | { 	"username": "string", 	"password": "string" } | {   "id": uuid,   "username": string,   "password": string }     |
| GET    | /users  | Lista todos os usuários                  | Não aplicável                                  | [ {   "id": uuid,   "username": string,   "password": string } ] |

<a name="comandos-liquibase"/>

## Comandos do Liquibase

Os principais comandos estão listados abaixo. Outros comandos podem ser encontrados na 
[documentação do Liquibase](https://docs.liquibase.com/tools-integrations/maven/commands/home.html).


| Comando          |               Comando via mvnw              | Função                                                                                                                                                                                                                                                                |
|------------------|:-------------------------------------------:|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| update           |           ./mvnw liquibase:update           | Implementa todas as mudanças que estão no arquivo de changelog e que não foram implementadas ainda. Caso não exista, ele irá criar uma tabela chamada DATABASECHANGELOG e cada versão (ou changeset) que for implementada terá um hash MD5 e registrada nesta tabela. |
| rollback         |          ./mvnw liquibase:rollback          | Reverte mudanças para a versão especificada no comando.                                                                                                                                                                                                               |
| history          |           ./mvnw liquibase:history          | Lista todos os deployments e changesets associdados já implementados no banco de dados.                                                                                                                                                                               |
| dropAll          |           ./mvnw liquibase:dropAll          | Deleta todos os objetos do banco de dados, exceto functions, procedures ou packages (estes últimos só podem ser deletados por usuários pagos).                                                                                                                        |
| validate         |          ./mvnw liquibase:validate          | Checa e identifica possíveis problemas num changelog que pode fazer com que o comando de migração (update) falhe.                                                                                                                                                     |
| status (verbose) | ./mvnw liquibase:status -Dliquibase.verbose | Produz uma lista de changesets que ainda não foram implementados no banco de dados.                                                                                                                                                                                   |