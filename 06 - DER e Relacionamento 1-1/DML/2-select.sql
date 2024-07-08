SELECT * FROM customers;
SELECT * FROM addresses;

-- Trazer TODAS as colunas das 2 tabelas 'joinadas'
SELECT 
  *
FROM
  customers
JOIN
  addresses
  ON customers.id = addresses.customer_id;

-- Trazendo apenas algumas colunas
SELECT 
  c.name, c.email,
  a.street, a.number,
  a.city
FROM
  customers c
JOIN
  addresses a
  ON c.id = a.customer_id;

-- Trazer apenas os clientes de São Paulo
SELECT 
  c.name, c.email,
  a.street, a.number,
  a.city
FROM
  customers c
JOIN
  addresses a
  ON c.id = a.customer_id
WHERE
  a.city 
  LIKE 'São Paulo';

-- Ordenar alfabeticamente pelo nome da cidade 
SELECT 
  c.name, c.email,
  a.street, a.number,
  a.city
FROM
  customers c
JOIN
  addresses a
  ON c.id = a.customer_id
ORDER BY
  a.city DESC;