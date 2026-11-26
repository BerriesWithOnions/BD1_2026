SELECT c.id_categoria, c.nome AS categoria, p.nome AS produto
FROM categoria AS c
CROSS JOIN produto AS p;

-- Cada categoria aparece com cada produto. Com C categorias e P produtos,
-- são C × P linhas. Se qualquer uma das tabelas estiver vazia, são zero.
