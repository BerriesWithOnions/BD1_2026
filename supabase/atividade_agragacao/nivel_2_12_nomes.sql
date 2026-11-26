SELECT id_categoria, STRING_AGG(nome, ', ' ORDER BY nome, id_produto) AS produtos
FROM produto
GROUP BY id_categoria
ORDER BY id_categoria;
