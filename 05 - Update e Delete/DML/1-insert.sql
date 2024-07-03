/*
  As operações abaixo são categorizadas como DML (Data Manipulation Language). São
  operações de interação com os registros do banco, como por exemplo:
  - Criação de registros (INSERT INTO)
  - Seleção de registros (SELECT)
  - Atualização de registros (UPDATE)
  - Deleção de registros (DELETE)
  - ...
 */

-- Inserção (CREATE)
INSERT INTO products 
  ("name", "description", "price", "created_at", "updated_at")
VALUES
  ('Notebook', 'Notebook GAMER', 105.53, '07-01-2024', '07-01-2024')
RETURNING *;

-- Datas -> mês-dia-ano
INSERT INTO products 
  ("name", "description", "price", "created_at", "updated_at")
VALUES
    ('Mouse', 'Mouse bacana', 150, '03-17-2024', '03-17-2024'), 
    ('Teclado', 'Teclado com luzes', 300, '05-23-2024', '05-23-2024'), 
    ('Headphone', 'Headphone muito bacana', 250, '08-25-2024', '08-25-2024'),
    ('Mouse Pad', 'Mouse Pad ergonômico', 50, '04-15-2024', '04-15-2024'),
    ('Cabo HDMI', 'Cabo HDMI de alta velocidade', 25, '02-10-2024', '02-10-2024'),
    ('Webcam HD', 'Webcam HD com microfone', 120, '01-30-2024', '01-30-2024'),
    ('Teclado Mecânico', 'Teclado Mecânico RGB', 350, '07-20-2024', '07-20-2024')
RETURNING *;



