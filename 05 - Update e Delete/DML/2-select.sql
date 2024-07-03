-- Seleção (READ)
-- Seleção de TODAS as colunas de TODOS os registros
SELECT * FROM products;
SELECT * FROM products WHERE "id" = 1;

SELECT "name", "description" FROM products;
SELECT "name", "description" FROM products WHERE "id" = 1;

-- Comparadores de String (strings no SQL são representadas com aspas SIMPLES)

-- Comparação EXATA
SELECT * FROM products WHERE "name" = 'Mouse';

-- LIKE (CASE SENSITIVE -> Diferencia maiusculas de minusculas -> 'A' != 'a')
SELECT * FROM products WHERE "name" LIKE 'Mouse';
-- Pesquisar sobre qualquer registro que contenha 'Mouse' como INICIO da string
SELECT * FROM products WHERE "name" LIKE 'Mouse%';

-- Pesquisar sobre qualquer registro que contenha 'o' como FINAL da string
SELECT * FROM products WHERE "name" LIKE '%o';


-- Pesquisar sobre qualquer registro que contenha 'o' como MEIO da string
SELECT * FROM products WHERE "name" LIKE '%o%';


-- ILIKE (CASE INSENSITIVE -> Desconsidera diferença entre maisculas e minusicas)
-- 'A' = 'a'
SELECT * FROM products WHERE "name" ILIKE 'mouse';
SELECT * FROM products WHERE "name" ILIKE 'mouse%';
SELECT "name", "price" FROM products WHERE "name" ILIKE 'mouse%';

-- Filtros de Ordenação
SELECT * FROM products ORDER BY "id" DESC;
SELECT * FROM products WHERE "name" ILIKE 'mouse%' ORDER BY "id" DESC;

SELECT * FROM products ORDER BY "price" DESC;

SELECT * FROM products WHERE "price" <= 120;

SELECT 
  "name", "price" 
FROM 
  products
WHERE 
  "name" ILIKE '%teclado%' 
ORDER BY price asc;

SELECT 
  "name", "price", "created_at"
FROM 
  products
WHERE 
  "name" ILIKE '%teclado%' 
ORDER BY "created_at" asc;
