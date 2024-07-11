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

-- ORDERS
SELECT * FROM "orders"; 

-- 1. Listar todos os pedidos com os nomes dos clientes.
SELECT
  o.id, o.order_date,
  c.name
FROM
  orders o
JOIN
  customers c ON o.customer_id = c.id;

-- 2. Listar todos os pedidos com os nomes dos clientes e seus endereços
SELECT
  orders.id, orders.order_date,
  customers.name,
  addresses.street, addresses.number, addresses.city
FROM
  orders
JOIN
  customers ON orders.customer_id = customers.id
JOIN
  addresses ON customers.id = addresses.customer_id;

-- 3. Listar todos os pedidos feitos em julho de 2024
SELECT
  o.id, o.order_date,
  c.name
FROM
  orders o
JOIN
  customers c ON o.customer_id = c.id
WHERE
  o.order_date BETWEEN '2024-07-01' AND '2024-07-31';

SELECT COUNT(*) FROM "orders";

-- 4 Listar quantidade de pedidos dos clientes
SELECT
  customers.name, COUNT(orders.id) AS "contagem de pedidos"
FROM
  orders
JOIN 
  customers ON customers.id = orders.customer_id
GROUP BY customers.id

-- 5 Listar quantidade de pedidos dos clientes, com filtro do order_date pelo mes de julho
SELECT
  customers.name, COUNT(orders.id) AS "contagem de pedidos"
FROM
  orders
JOIN 
  customers ON customers.id = orders.customer_id
WHERE
  orders.order_date BETWEEN '2024-07-01' AND '2024-07-31'
GROUP BY customers.id;

-- 5 Listar quantidade de pedidos dos clientes, com filtro do order_date pelo mes de julho e ordenado
-- alfabeticamente pelo nome do cliente
SELECT
  customers.name, COUNT(orders.id) AS "contagem de pedidos"
FROM
  orders
JOIN 
  customers ON customers.id = orders.customer_id
WHERE
  orders.order_date BETWEEN '2024-07-01' AND '2024-07-31'
GROUP BY customers.id
ORDER BY customers.name;

/* 6 
Listar nome do cliente e quantidade de pedidos, com filtro do order_date pelo 
mes de julho, somente para os clientes que possuem mais de 1 pedido, ordenado
alfabeticamente pelo nome do cliente.
*/