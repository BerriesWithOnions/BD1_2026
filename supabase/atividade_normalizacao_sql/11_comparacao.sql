-- Antes (A): PRODUTO_CATEGORIA(id_produto PK, nome_produto, preco, id_categoria,
-- nome_categoria). Depois (B): CATEGORIA(id_categoria PK, nome_categoria) e
-- PRODUTO(id_produto PK, nome_produto, preco, id_categoria FK → CATEGORIA).

BEGIN;
CREATE SCHEMA norm_11;
SET LOCAL search_path TO norm_11;

-- a–c) Estrutura A e conteúdo inicial.
CREATE TABLE produto_categoria (
    id_produto bigint PRIMARY KEY,
    nome_produto text NOT NULL,
    preco numeric(10,2) NOT NULL CHECK (preco >= 0),
    id_categoria bigint NOT NULL,
    nome_categoria text NOT NULL
);
INSERT INTO produto_categoria VALUES
    (1, 'Notebook', 3500, 10, 'Informática'), (2, 'Mouse', 80, 10, 'Informática'),
    (3, 'Teclado', 150, 10, 'Informática'), (4, 'Monitor', 1200, 20, 'Eletrônicos'),
    (5, 'Webcam', 180, 20, 'Eletrônicos');
SELECT * FROM produto_categoria ORDER BY id_produto;

-- d–f) A categoria 10 agora aparece como Computação no Notebook e
-- Informática nos outros dois produtos.
UPDATE produto_categoria SET nome_categoria = 'Computação' WHERE id_produto = 1;
SELECT * FROM produto_categoria ORDER BY id_produto;

-- g–i) Estrutura B e os mesmos produtos.
CREATE TABLE categoria (id_categoria bigint PRIMARY KEY, nome_categoria text NOT NULL);
CREATE TABLE produto (
    id_produto bigint PRIMARY KEY,
    nome_produto text NOT NULL,
    preco numeric(10,2) NOT NULL CHECK (preco >= 0),
    id_categoria bigint NOT NULL REFERENCES categoria
);
INSERT INTO categoria VALUES (10, 'Informática'), (20, 'Eletrônicos');
INSERT INTO produto (id_produto, nome_produto, preco, id_categoria)
SELECT id_produto, nome_produto, preco, id_categoria FROM produto_categoria;

-- j–m) Na versão A, uma alteração completa exigiria atualizar as três linhas
-- da categoria 10. Na B, uma linha armazena o nome e os produtos guardam o ID.
UPDATE categoria SET nome_categoria = 'Computação' WHERE id_categoria = 10;
SELECT * FROM categoria ORDER BY id_categoria;

-- Discussão: normalizar evita cópias conflitantes do nome, mas uma estrutura
-- normalizada ainda permite erros se as regras não forem impostas. Aqui a FK
-- garante que a categoria exista, a PK impede IDs repetidos, NOT NULL exige
-- os campos obrigatórios e CHECK impede preço negativo.
COMMIT;
