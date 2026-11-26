SELECT id_categoria, COUNT(*) AS produtos
FROM produto
WHERE preco > 100
GROUP BY id_categoria
ORDER BY id_categoria;
