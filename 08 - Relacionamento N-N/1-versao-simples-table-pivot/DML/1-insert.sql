INSERT INTO customers 
  ("name", "email", "password")
VALUES 
  ('João Silva', 'joao.silva@example.com', 'senha123'), -- 1
  ('Maria Santos', 'maria.santos@example.com', 'senha456'), -- 2
  ('Ana Oliveira', 'ana.oliveira@example.com', 'senha789'), -- 3
  ('Pedro Souza', 'pedro.souza@example.com', 'senha101'), -- 4
  ('Mariana Lima', 'mariana.lima@example.com', 'senha123'), -- 5
  ('Rafael Costa', 'rafael.costa@example.com', 'senha456'), -- 6
  ('Carla Santos', 'carla.santos@example.com', 'senha789'); -- 7

-- 1:1 - customers:addresses
INSERT INTO addresses 
  ("street", "number", "city", "customer_id")
VALUES 
  ('Rua das Flores', '100', 'São Paulo', 1),   -- João Silva
  ('Avenida Central', '200', 'Rio de Janeiro', 2),   -- Maria Santos
  ('Rua Principal', '300', 'Belo Horizonte', 3),   -- Ana Oliveira
  ('Travessa dos Bosques', '400', 'Porto Alegre', 4),   -- Pedro Souza
  ('Rua das Palmeiras', '50', 'São Paulo', 5),   -- Mariana Lima
  ('Avenida Central', '300', 'Rio de Janeiro', 6),   -- Rafael Costa
  ('Rua da Amizade', '150', 'Belo Horizonte', 7);   -- Carla Santos

-- 1:N - customers:orders
INSERT INTO orders ("order_date", "customer_id")
VALUES
  ('2024-06-15', 1),   -- 1 - Pedido de João Silva
  ('2024-06-13', 2),   -- 2 - Pedido de Maria Santos
  ('2024-07-02', 1),   -- 3 - Outro pedido de João Silva
  ('2024-07-03', 1),   -- 4 - Outro pedido de João Silva
  ('2024-07-03', 3),   -- 5 - Pedido de Ana Oliveira
  ('2024-07-10', 3),   -- 6 - Pedido de Ana Oliveira
  ('2024-07-25', 4),   -- 7 - Pedido de Pedro Souza
  ('2024-09-11', 5),   -- 8 - Pedido de Mariana Lima
  ('2024-09-23', 6),   -- 9 - Pedido de Rafael Costa
  ('2024-12-10', 7),   -- 10 - Pedido de Carla Santos
  ('2024-12-12', 7);   -- 11 - Pedido de Carla Santos

-- N:N - foods
INSERT INTO foods 
  ("name", "price")
VALUES
  ('Pizza Margherita', 20.00),   -- Comida 1
  ('Hambúrguer', 12.00),   -- Comida 2
  ('Salada Caesar', 15.00),   -- Comida 3
  ('Sushi', 30.00),   -- Comida 4
  ('Lasanha', 25.00),   -- Comida 5
  ('Coxinha', 5.00),   -- Comida 6
  ('Pastel', 7.00); -- Comida 7

-- Associando comidas aos pedidos
INSERT INTO orders_food
  (order_id, food_id)
VALUES
  (1, 1),   -- Pedido 1 (João Silva) -- Pizza Margherita
  (1, 2),   -- Pedido 1 (João Silva) - Hambúrguer
  (2, 4),   -- Pedido 2 (Maria Santos) - Sushi
  (3, 3),   -- Pedido 3 (João Silva) - Salada Caesar
  (4, 5),   -- Pedido 4 (João Silva) - Lasanha
  (5, 1),   -- Pedido 5 (Ana Oliveira) - Pizza Margherita
  (6, 7),   -- Pedido 6 (Ana Oliveira) - Pastel
  (7, 6),   -- Pedido 7 (Pedro Souza) - Coxinha
  (8, 5),   -- Pedido 8 (Mariana Lima) - Lasanha
  (9, 2),   -- Pedido 9 (Rafael Costa) - Hambúrguer
  (10, 3),  -- Pedido 10 (Carla Santos) - Salada Caesar
  (11, 4);  -- Pedido 11 (Carla Santos) - Sushi


INSERT INTO orders_food
  (order_id, food_id, price_at_order)
VALUES
  (11, 4, (SELECT price FROM foods WHERE id = 4));  -- Pedido 11 (Carla Santos) - Sushi