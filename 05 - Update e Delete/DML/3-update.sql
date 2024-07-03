UPDATE 
  products
SET
  "price" = 350.12
WHERE
  "id" = 1;

UPDATE 
  products
SET
  "description" = 'Uma desc nova para o headphone' 
WHERE
  "id" = 4
RETURNING *;

-- MUITO CUIDADO: Update sem where, atualiza TODOS os registros no campo especificado
UPDATE 
  products
SET
  "price" = 1;