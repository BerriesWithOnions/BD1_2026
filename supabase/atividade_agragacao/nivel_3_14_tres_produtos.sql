SELECT id_categoria, COUNT(*) AS produtos
FROM produto
GROUP BY id_categoria
HAVING COUNT(*) >= 3
ORDER BY id_categoria;
