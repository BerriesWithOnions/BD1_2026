SELECT c.id_categoria, c.nome
FROM categoria AS c
LEFT JOIN produto AS p ON p.id_categoria = c.id_categoria
WHERE p.id_produto IS NULL;
