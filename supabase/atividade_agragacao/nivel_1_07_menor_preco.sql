SELECT *
FROM produto
WHERE preco = (SELECT MIN(preco) FROM produto)
ORDER BY id_produto;
