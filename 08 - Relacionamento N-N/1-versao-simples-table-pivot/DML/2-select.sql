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

  WHERE: Filtra ANTES da agregação do GROUP BY
  HAVING: Filtra DEPOIS da agregação do GROUP BY
*/
SELECT
  customers.name, COUNT(orders.id) AS "contagem de pedidos"
FROM
  orders
JOIN 
  customers ON customers.id = orders.customer_id
WHERE
  orders.order_date BETWEEN '2024-07-01' AND '2024-07-31'
GROUP BY customers.id
HAVING COUNT(orders.id) > 1
ORDER BY customers.name;

-- N-N -> orders - foods
SELECT * FROM orders_food;

/*
  Listar todas as comidas de um determinado pedido
*/
SELECT
  orders_food.order_id, orders_food.food_id,
  foods.name, foods.name
FROM
  orders_food
JOIN
  foods ON orders_food.food_id = foods.id
WHERE
  orders_food.order_id = 1;

/*
  Listar todos os pedidos com nome do cliente, data do pedido e dados da comida
*/
SELECT
  customers.name,
  orders.id AS "order id", orders.order_date,
  foods.name, foods.price
FROM
  orders
JOIN
  customers ON customers.id = orders.customer_id
JOIN
  orders_food ON orders.id = orders_food.order_id
JOIN
  foods ON foods.id = orders_food.food_id
WHERE
  customers.id = 1;
/*
    name    | order id | order_date |       name       | price 
------------+----------+------------+------------------+-------
 João Silva |        1 | 2024-06-15 | Pizza Margherita | 20.00
 João Silva |        1 | 2024-06-15 | Hambúrguer       | 12.00
 João Silva |        3 | 2024-07-02 | Salada Caesar    | 15.00
 João Silva |        4 | 2024-07-03 | Lasanha          | 25.00
*/

SELECT
  customers.name,
  orders.id AS "order id", orders.order_date, orders_food.price_at_order,
  foods.name, foods.price
FROM
  orders
JOIN
  customers ON customers.id = orders.customer_id
JOIN
  orders_food ON orders.id = orders_food.order_id
JOIN
  foods ON foods.id = orders_food.food_id
WHERE
  customers.id = 7;