SELECT c.id_categoria, c.nome, COUNT(p.id_produto) AS produtos,
       COALESCE(SUM(p.estoque), 0) AS unidades,
       AVG(p.preco) AS preco_medio,
       COALESCE(SUM(p.preco * p.estoque), 0) AS valor_estoque
FROM categoria AS c
LEFT JOIN produto AS p ON p.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY c.id_categoria;
