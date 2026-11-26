-- a) Antes: PEDIDO_PRODUTO(id_pedido, id_produto, data_pedido, id_cliente,
-- nome_cliente, telefone_cliente, nome_produto, preco_atual_produto,
-- quantidade, preco_unitario_venda).
-- b) PK = (id_pedido, id_produto): o produto aparece no máximo uma vez no pedido.
-- c) id_pedido → data_pedido, id_cliente; id_cliente → nome_cliente, telefone_cliente;
-- id_produto → nome_produto, preco_atual_produto;
-- (id_pedido, id_produto) → quantidade, preco_unitario_venda.
-- d) Data e cliente dependem só de id_pedido; nome e telefone do cliente também
-- dependem dele por transitividade. Nome e preço atual do produto dependem só de id_produto.
-- e) id_pedido → id_cliente → nome_cliente, telefone_cliente.
-- f–g) A chave composta tem dependências parciais, violando a 2FN. Além disso,
-- id_cliente determina atributos não primos sem ser superchave, violando a 3FN.
-- h) Em 1FN, a relação inicial já tem uma linha por par pedido–produto e
-- um valor por campo, considerando um telefone por cliente como no cenário.
-- i) Em 2FN: PEDIDO(id_pedido PK, data_pedido, id_cliente, nome_cliente, telefone_cliente);
-- PRODUTO(id_produto PK, nome_produto, preco_atual_produto); ITEM_PEDIDO(id_pedido FK,
-- id_produto FK, quantidade, preco_unitario_venda, PK(id_pedido, id_produto)).
-- j–m) Em 3FN: CLIENTE(id_cliente PK, nome_cliente, telefone_cliente);
-- PEDIDO(id_pedido PK, data_pedido, id_cliente FK → CLIENTE);
-- PRODUTO(id_produto PK, nome_produto, preco_atual_produto); ITEM_PEDIDO(id_pedido
-- FK → PEDIDO, id_produto FK → PRODUTO, quantidade, preco_unitario_venda,
-- PK(id_pedido, id_produto)).
-- n) CLIENTE 1:N PEDIDO; PEDIDO 1:N ITEM_PEDIDO; PRODUTO 1:N ITEM_PEDIDO.
-- Logo, PEDIDO e PRODUTO se relacionam em N:N por meio dos itens.

BEGIN;
CREATE SCHEMA norm_13;
SET LOCAL search_path TO norm_13;

CREATE TABLE cliente (
    id_cliente bigint PRIMARY KEY,
    nome_cliente text NOT NULL,
    telefone_cliente text NOT NULL
);
CREATE TABLE produto (
    id_produto bigint PRIMARY KEY,
    nome_produto text NOT NULL,
    preco_atual_produto numeric(10,2) NOT NULL CHECK (preco_atual_produto >= 0)
);
CREATE TABLE pedido (
    id_pedido bigint PRIMARY KEY,
    data_pedido date NOT NULL,
    id_cliente bigint NOT NULL REFERENCES cliente
);
CREATE TABLE item_pedido (
    id_pedido bigint REFERENCES pedido,
    id_produto bigint REFERENCES produto,
    quantidade integer NOT NULL CHECK (quantidade > 0),
    preco_unitario_venda numeric(10,2) NOT NULL CHECK (preco_unitario_venda >= 0),
    PRIMARY KEY (id_pedido, id_produto)
);

INSERT INTO cliente VALUES
    (1, 'Ana', '9999-1111'), (2, 'Bruno', '9888-2222'), (3, 'Maria', '9777-3333');
INSERT INTO produto VALUES
    (10, 'Mouse', 80), (20, 'Teclado', 150), (30, 'Monitor', 1200),
    (40, 'Webcam', 180), (50, 'Impressora', 900);
INSERT INTO pedido VALUES
    (1, '2026-03-01', 1), (2, '2026-03-03', 2),
    (3, '2026-03-06', 1), (4, '2026-03-08', 3);
INSERT INTO item_pedido VALUES
    (1, 10, 2, 80), (1, 20, 1, 145), (2, 10, 1, 75), (2, 30, 1, 1200),
    (3, 20, 2, 150), (3, 40, 1, 180), (4, 30, 1, 1150), (4, 50, 1, 900);

SELECT * FROM pedido ORDER BY id_pedido;
SELECT * FROM item_pedido WHERE id_pedido = 1 ORDER BY id_produto;
UPDATE cliente SET telefone_cliente = '9666-4444' WHERE id_cliente = 1;

-- Antes e depois: os mesmos itens devem continuar com os preços 80 e 75.
SELECT id_pedido, preco_unitario_venda FROM item_pedido
WHERE id_produto = 10 ORDER BY id_pedido;

UPDATE produto SET preco_atual_produto = 95 WHERE id_produto = 10;
SELECT preco_atual_produto FROM produto WHERE id_produto = 10;
SELECT id_pedido, preco_unitario_venda FROM item_pedido
WHERE id_produto = 10 ORDER BY id_pedido;
-- z) O preço do catálogo vale para novas negociações. O preço no item registra
-- quanto foi cobrado naquela venda, inclusive descontos. Assim, atualizar o
-- catálogo não altera o histórico nem o valor dos pedidos anteriores.
COMMIT;
