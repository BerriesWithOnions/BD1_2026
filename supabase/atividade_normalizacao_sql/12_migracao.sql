-- a–b) Antes: PRODUTO_ORIGINAL(id_produto PK, nome_produto, preco, id_categoria,
-- nome_categoria). id_produto → nome_produto, preco, id_categoria e
-- id_categoria → nome_categoria. O nome da categoria depende transitivamente
-- da PK; repeti-lo a cada produto permite grafias conflitantes para o mesmo ID.
-- c) Depois: CATEGORIA_NORMALIZADA(id_categoria PK, nome_categoria) e
-- PRODUTO_NORMALIZADO(id_produto PK, nome_produto, preco, id_categoria FK).

BEGIN;
CREATE SCHEMA norm_12;
SET LOCAL search_path TO norm_12;

CREATE TABLE produto_original (
    id_produto bigint PRIMARY KEY,
    nome_produto varchar(100) NOT NULL,
    preco numeric(10,2) NOT NULL,
    id_categoria bigint NOT NULL,
    nome_categoria varchar(100) NOT NULL
);
INSERT INTO produto_original VALUES
    (1, 'Notebook', 3500.00, 10, 'Informática'),
    (2, 'Mouse', 80.00, 10, 'Informática'),
    (3, 'Teclado', 150.00, 10, 'Informática'),
    (4, 'Monitor', 1200.00, 20, 'Eletrônicos'),
    (5, 'Webcam', 180.00, 20, 'Eletrônicos'),
    (6, 'Impressora', 900.00, 30, 'Escritório');

CREATE TABLE categoria_normalizada (
    id_categoria bigint PRIMARY KEY,
    nome_categoria varchar(100) NOT NULL
);
CREATE TABLE produto_normalizado (
    id_produto bigint PRIMARY KEY,
    nome_produto varchar(100) NOT NULL,
    preco numeric(10,2) NOT NULL,
    id_categoria bigint NOT NULL REFERENCES categoria_normalizada
);
INSERT INTO categoria_normalizada (id_categoria, nome_categoria)
SELECT DISTINCT id_categoria, nome_categoria FROM produto_original;

INSERT INTO produto_normalizado (id_produto, nome_produto, preco, id_categoria)
SELECT id_produto, nome_produto, preco, id_categoria FROM produto_original;

SELECT * FROM categoria_normalizada ORDER BY id_categoria;
SELECT * FROM produto_normalizado ORDER BY id_produto;

-- h) As duas diferenças devem retornar zero linhas. A primeira detecta
-- produtos ausentes ou alterados; a segunda detecta registros extras.
SELECT id_produto, nome_produto, preco, id_categoria FROM produto_original
EXCEPT
SELECT id_produto, nome_produto, preco, id_categoria FROM produto_normalizado;

SELECT id_produto, nome_produto, preco, id_categoria FROM produto_normalizado
EXCEPT
SELECT id_produto, nome_produto, preco, id_categoria FROM produto_original;

-- i) Preservar os IDs permite copiar as referências sem remapeá-las.
-- j) A FK exige que cada ID de categoria usado por um produto exista no
-- cadastro normalizado e impede a exclusão de uma categoria em uso.
COMMIT;
