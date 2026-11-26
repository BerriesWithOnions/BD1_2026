SELECT id_categoria, COUNT(*) AS produtos
FROM produto
GROUP BY id_categoria
ORDER BY id_categoria;
