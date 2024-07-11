/*
  As operações abaixo são categorizadas como DML (Data Manipulation Language). São
  operações de interação com os registros do banco, como por exemplo:
  - Criação de registros (INSERT INTO)
  - Atualização de registros (UPDATE)
  - Deleção de registros (DELETE)
  O select em específico é categorizado como Data Query Language (DQL)
  - Seleção de registros (SELECT)
 */

-- Inserção (CREATE)
INSERT INTO products 
  ("name", "description", "price", "created_at", "updated_at")
VALUES
  ('Notebook', 'Notebook GAMER', 105.53, '07-01-2024', '07-01-2024');

INSERT INTO products 
  ("name", "description", "price", "created_at", "updated_at")
VALUES
  ('Cadeira', 'Cadeira GAMER', 500, '12-25-2024', '12-25-2024'),
  ('Monitor', 'Monitor GAMER', 230.1, '12-24-2024', '12-24-2024');

INSERT INTO products 
  ("name")
VALUES
  ('Produto Teste');

INSERT INTO products 
  ("description")
VALUES
  ('Descrição Teste');

-- Seleção (READ)
-- Seleção de TODAS as colunas de TODOS os registros
SELECT * FROM products;
SELECT * FROM products WHERE "id" = 1;