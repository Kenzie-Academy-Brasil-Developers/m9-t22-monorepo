/*
 A ordem importa!!
 Preciso ter a table de customers para que addresses consiga se relacionar com ela,
 através da FK (chave estrangeira) 
*/
CREATE TABLE customers (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "email" VARCHAR(50) NOT NULL UNIQUE,
  "password" VARCHAR(100) NOT NULL
);

CREATE TABLE addresses (
  "id" SERIAL PRIMARY KEY,
  "street" VARCHAR(100) NOT NULL,
  "number" VARCHAR(100) NOT NULL,
  "city" VARCHAR(50) NOT NULL,
  "customer_id" INT UNIQUE NOT NULL,
  FOREIGN KEY ("customer_id") REFERENCES customers(id)
);

-- Em relacionamento 1-N a FK SEMPRE fica do lado N da relação
CREATE TABLE orders (
  "id" SERIAL PRIMARY KEY,
  "order_date" DATE NOT NULL,
  "customer_id" INT NOT NULL,
  FOREIGN KEY ("customer_id") REFERENCES customers(id)
);