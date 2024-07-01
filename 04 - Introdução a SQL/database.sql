/*
  Comentario multinha em SQL
 */
-- Comentario de uma linha

/*
  As operações abaixo são categorizadas como DDL (Data Definition Language). São
  operações ESTRUTURAIS no banco, como por exemplo:
  - Criação do banco (CREATE DATABASE)
  - Criação de tabela (CREATE TABLE)
  - Alteração de campos de uma tabela já criada (ALTER TABLE)
  -...
 */


-- Criando um novo banco.
-- Nome do banco segue snake_case
CREATE DATABASE "m9_t22";

-- Criação de uma tabela (geralmente no plural seguindo snake_case)
-- Uma tabela é um conjunto de regras sobre o formato dos dados, definidas
-- em colunas
-- PRIMARY KEY -> Nao pode ser nula, e é a identificação única do registro
CREATE TABLE products (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "description" TEXT,
  "price" DECIMAL(10, 2),
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE categories (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);