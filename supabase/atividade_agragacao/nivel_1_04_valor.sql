SELECT COALESCE(SUM(preco * estoque), 0) AS valor_estoque
FROM produto;
