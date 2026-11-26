SELECT id_categoria, AVG(preco) AS preco_medio
FROM produto
GROUP BY id_categoria
HAVING AVG(preco) > 500
ORDER BY id_categoria;
