-- No editor SQL do Supabase, selecione e execute um INSERT por vez.

-- A. Produto sem nome (NULL)
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES (NULL, 10.00, 1, (SELECT id_categoria FROM categoria WHERE nome = 'Informática'));

-- B. Preço negativo
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Pasta', -5.00, 1, (SELECT id_categoria FROM categoria WHERE nome = 'Escritório'));

-- C. Estoque negativo
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Agenda', 15.00, -1, (SELECT id_categoria FROM categoria WHERE nome = 'Escritório'));

-- D. Categoria inexistente. O maior ID atual mais um ainda não está cadastrado.
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Hub USB', 45.00, 3,
        (SELECT MAX(id_categoria) + 1 FROM categoria));

-- E. Categoria já cadastrada no exercício 1
INSERT INTO categoria (nome) VALUES ('Informática');

/* Respostas e diagnósticos esperados do PostgreSQL
Tentativa             | Aceita? | Restrição (SQLSTATE)        | Motivo
A. Produto sem nome   | Não     | NOT NULL (23502)            | produto.nome recebeu NULL.
B. Preço negativo     | Não     | CHECK (23514)               | -5.00 viola preco >= 0.
C. Estoque negativo   | Não     | CHECK (23514)               | -1 viola estoque >= 0.
D. Categoria ausente  | Não     | FOREIGN KEY (23503)         | O ID informado não existe em categoria.
E. Categoria repetida | Não     | UNIQUE (23505)              | O nome Informática já está em categoria.

B e C têm o mesmo código de erro. Com o esquema do enunciado, o nome da
restrição na mensagem distingue produto_preco_check de produto_estoque_check.
Em D, a mensagem identifica fk_produto_categoria. Em E, identifica categoria_nome_key.
*/
