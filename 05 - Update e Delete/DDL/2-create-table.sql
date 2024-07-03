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