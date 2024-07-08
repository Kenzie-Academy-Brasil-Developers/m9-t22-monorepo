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