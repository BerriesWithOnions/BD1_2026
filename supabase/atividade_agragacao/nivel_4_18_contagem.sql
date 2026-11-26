SELECT c.id_categoria, c.nome, COUNT(p.id_produto) AS produtos
FROM categoria AS c
LEFT JOIN produto AS p ON p.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY c.id_categoria;
