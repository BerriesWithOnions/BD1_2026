SELECT id_categoria, AVG(preco) AS media, MIN(preco) AS minimo, MAX(preco) AS maximo
FROM produto
GROUP BY id_categoria
ORDER BY id_categoria;
