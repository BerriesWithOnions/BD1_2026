SELECT COUNT(*) AS total,
       COUNT(*) FILTER (WHERE preco > 1000) AS caros,
       COUNT(*) FILTER (WHERE estoque < 10) AS estoque_baixo
FROM produto;
