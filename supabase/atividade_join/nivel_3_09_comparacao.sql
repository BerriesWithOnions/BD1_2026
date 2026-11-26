SELECT c.id_categoria, c.nome AS categoria, p.nome AS produto
FROM produto AS p
INNER JOIN categoria AS c ON c.id_categoria = p.id_categoria;

SELECT c.id_categoria, c.nome AS categoria, p.nome AS produto
FROM categoria AS c
LEFT JOIN produto AS p ON p.id_categoria = c.id_categoria;

-- O INNER JOIN retorna uma linha por produto com categoria correspondente.
-- O LEFT JOIN acrescenta uma linha com produto NULL para cada categoria vazia.
-- Se todas as categorias tiverem produtos, as consultas retornam as mesmas linhas.
