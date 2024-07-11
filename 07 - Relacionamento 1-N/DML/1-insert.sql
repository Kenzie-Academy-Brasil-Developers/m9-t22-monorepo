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

-- 1:N - customers:addresses
INSERT INTO orders ("order_date", "customer_id")
VALUES
  ('2024-06-15', 1),   -- Pedido de João Silva
  ('2024-06-13', 2),   -- Pedido de Maria Santos
  ('2024-07-02', 1),   -- Outro pedido de João Silva
  ('2024-07-03', 1),   -- Outro pedido de João Silva
  ('2024-07-03', 3),   -- Pedido de Ana Oliveira
  ('2024-07-10', 3),   -- Pedido de Ana Oliveira
  ('2024-07-25', 4),   -- Pedido de Pedro Souza
  ('2024-09-11', 5),   -- Pedido de Mariana Lima
  ('2024-09-23', 6),   -- Pedido de Rafael Costa
  ('2024-12-10', 7);   -- Pedido de Carla Santos
  ('2024-12-12', 7);   -- Pedido de Carla Santos
