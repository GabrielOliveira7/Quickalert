# 🌪️ Plataforma de Resposta Rápida a Desastres Naturais

API REST em .NET para registrar e gerenciar eventos críticos como incêndios, alagamentos, deslizamentos, secas, etc., com prioridade por gravidade e região.

## 🧩 Funcionalidades

- Cadastro de ocorrências com tipo, gravidade e região
- Listagem de todos os eventos
- Consulta individual por ID
- Atualização de dados
- Remoção de registros
- Persistência em banco de dados PostgreSQL

...

=== Lista de comando em ordem para rodar o projeto ===

# Criar volume
docker volume create postgres_data

# Criar conexão para os containers
docker network create plataforma-network


# Executar banco
docker run -d --name postgres-db --network plataforma-network -e POSTGRES_DB=plataforma_desastres -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=senha123 -p 5432:5432 -v postgres_data:/var/lib/postgresql/data postgres:15




# Build da aplicação
docker build -t plataforma-api .

# Executar aplicação
docker run -d --name plataforma-app  --network plataforma-network -p 5000:5000 -e ConnectionStrings__DefaultConnection="Host=postgres-db;Database=plataforma_desastres;Username=admin;Password=senha123;Port=5432;Pooling=true;" plataforma-api



#### Comandos Uteis ####

# Conectar com o banco
docker exec -it postgres-db psql -U admin -d plataforma_desastres

# Parar containers
docker stop plataforma-app postgres-db

# Iniciar containers
docker start postgres-db plataforma-app

# Ver volumes (verificar persistência)
docker volume ls

# Inspecionar volume do banco
docker volume inspect postgres_data



Banco
criacao manual da tabela:

DROP TABLE IF EXISTS "Ocorrencias";

CREATE TABLE "Ocorrencias" (
    "Id" SERIAL PRIMARY KEY,
    "Tipo" VARCHAR(100) NOT NULL,
    "Gravidade" INT NOT NULL,
    "Regiao" VARCHAR(100) NOT NULL,
    "DataCriacao" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- Verificar
SELECT * FROM "Ocorrencias";





Se chegou aqui provavelmente o crud dara certo, entao so testar e conferir a persistencia de dados!


## 👥 Autores

- [Gabriel Eduardo De Paiva Oliveira - RM:98843]
- [Vicenzo Guardabassi Fukumura - RM: 550208]
