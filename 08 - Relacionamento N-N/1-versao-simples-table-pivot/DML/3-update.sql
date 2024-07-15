-- Atualizando preço da 'Pizza Margherita'
UPDATE foods SET price = 35.10 WHERE id = 1;

/*
  Perco o historico de quanto custava o produto nas orders antigas
  Possiveis soluções:
  - Sem deletar os registros:
    - Adicionar uma nova coluna em orders_food (price_at_order)
    ALTER TABLE orders_food
    ADD COLUMN price_at_order DECIMAL(5, 2) NOT NULL;
    -- ou eu nao adiciono a coluna com NOT NULL
    -- ou eu adiciono um valor padrão para a coluna

    ALTER TABLE orders_food
    ADD COLUMN price_at_order DECIMAL(5, 2) NOT NULL DEFAULT 0;
*/
ALTER TABLE orders_food
ADD COLUMN price_at_order DECIMAL(5, 2) NOT NULL DEFAULT 0;

-- Sub Query
UPDATE orders_food
SET price_at_order = (SELECT price FROM foods WHERE id = orders_food.food_id);

-- Atualizando preço da 'Sushi'
UPDATE foods SET price = 25 WHERE id = 4;