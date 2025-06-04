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

Lista de comando para rodar o projeto

1. docker build -t plataforma-resposta-desastres .
2. docker run -d --name postgres-db -e POSTGRES_PASSWORD=123 -e POSTGRES_DB=desastresdb -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres
3. docker run -d --name api-desastres --link postgres-db -p 5000:5000 plataforma-desastres



## 👥 Autores

- [Gabriel Eduardo De Paiva Oliveira - RM:98843]
- [Vicenzo Guardabassi Fukumura - RM: 550208]
