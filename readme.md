# Laravel Docker Setup

Este repositório contém um ambiente de desenvolvimento Docker para rodar uma aplicação Laravel com os seguintes serviços: PHP, MariaDB, Redis, Nginx, PhpMyAdmin e MinIO (para S3). Ele foi configurado para facilitar o desenvolvimento e a execução do projeto Laravel com todos os serviços necessários em containers isolados.

## Serviços

O projeto é composto pelos seguintes serviços:

- **Laravel App**: Contêiner PHP com FPM para rodar a aplicação Laravel.
- **MariaDB**: Banco de dados MariaDB com um banco e usuário configurados para o Laravel.
- **PhpMyAdmin**: Interface web para gerenciar o banco de dados MariaDB.
- **MinIO**: Armazenamento de objetos S3 local para testes.
- **Redis**: Cache e banco de dados em memória.
- **Nginx**: Servidor web que serve a aplicação Laravel.

## Como Usar

### Requisitos

- [Docker](https://docs.docker.com/get-docker/) - Siga as instruções oficiais para instalar o Docker.
- [Docker Compose](https://docs.docker.com/compose/install/) - Siga as instruções oficiais para instalar o Docker Compose.


### Passos para Rodar o Ambiente

1. **Baixe este projeto**  
   Faça o download deste repositório na mesma pasta onde os arquivos do seu projeto Laravel está localizado.
   A estrutura final deve ser parecida com esta:

### Estrutura de Diretórios

```bash
├── projeto laravel             # Seu projeto laravel
    ├── docker
    │   ├── nginx
    │   │   └── default.conf    # Configuração do Nginx
    │   └── php
    │       └── local.ini       # Configurações customizadas do PHP
    ├── Dockerfile              # Dockerfile para o ambiente PHP
    ├── docker-compose.yml      # Arquivo de configuração dos containers Docker
    .
    .
```

###  **Inicie os contêineres Docker**  
   Execute os comandos abaixo para criar e inicializar os serviços do ambiente:

   ```bash
   docker-compose build
   docker-compose up -d
   ```

4. **Acesse os Serviços**  
   - Aplicação Laravel: [http://localhost](http://localhost)
   - phpMyAdmin: [http://localhost:8081](http://localhost:8081)
   - MinIO Console: [http://localhost:9001](http://localhost:9001)

---

## Informações Extras

- **Configuração do MinIO**  
  O serviço MinIO está configurado para escutar nas portas `9100` (API) e `9101` (console). Atualize as configurações do Laravel para refletir as novas portas:

  ```env
  AWS_ENDPOINT=http://localhost:9100
  AWS_ACCESS_KEY_ID=your_username
  AWS_SECRET_ACCESS_KEY=your_password
  AWS_DEFAULT_REGION=us-east-1
  AWS_BUCKET=your_bucket_name
  ```

### Comandos Úteis

- Parar todos os contêineres:
  ```bash
  docker-compose down
  ```

- Ver logs:
  ```bash
  docker-compose logs -f
  ```

- Recriar contêineres:
  ```bash
  docker-compose up -d --build
  ```