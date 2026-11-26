SELECT id_categoria, SUM(estoque) AS unidades
FROM produto
GROUP BY id_categoria
ORDER BY id_categoria;
