-- Usa o catálogo produto da lista de INSERT/SELECT. As tabelas de vendas
-- ficam em um esquema próprio para não conflitar com a lista de JOIN.
BEGIN;
CREATE SCHEMA agregacao_22;
SET LOCAL search_path TO agregacao_22, public;

CREATE TABLE cliente (
    id_cliente bigint PRIMARY KEY,
    nome text NOT NULL
);
CREATE TABLE pedido (
    id_pedido bigint PRIMARY KEY,
    id_cliente bigint NOT NULL REFERENCES cliente
);
CREATE TABLE item_pedido (
    id_pedido bigint REFERENCES pedido,
    id_produto bigint REFERENCES public.produto,
    quantidade integer NOT NULL CHECK (quantidade > 0),
    preco_unitario numeric(10,2) NOT NULL CHECK (preco_unitario >= 0),
    PRIMARY KEY (id_pedido, id_produto)
);

-- Cada pedido contribui uma única vez para o ticket, mesmo com vários itens.
CREATE VIEW total_pedido AS
SELECT p.id_pedido, p.id_cliente,
       COALESCE(SUM(i.quantidade * i.preco_unitario), 0) AS valor
FROM pedido AS p
LEFT JOIN item_pedido AS i ON i.id_pedido = p.id_pedido
GROUP BY p.id_pedido, p.id_cliente;

-- a) Pedidos por cliente, incluindo quem não comprou.
SELECT c.id_cliente, c.nome, COUNT(p.id_pedido) AS pedidos
FROM cliente AS c
LEFT JOIN pedido AS p ON p.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- b) Valor de cada pedido.
SELECT id_pedido, valor FROM total_pedido ORDER BY id_pedido;

-- c) Total gasto por cliente.
SELECT c.id_cliente, c.nome, COALESCE(SUM(t.valor), 0) AS total_gasto
FROM cliente AS c
LEFT JOIN total_pedido AS t ON t.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- d) Sem pedidos, o ticket médio é indefinido (NULL).
SELECT c.id_cliente, c.nome, AVG(t.valor) AS ticket_medio
FROM cliente AS c
LEFT JOIN total_pedido AS t ON t.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- e) Clientes que gastaram mais de R$ 1.000.
SELECT c.id_cliente, c.nome, SUM(t.valor) AS total_gasto
FROM cliente AS c
JOIN total_pedido AS t ON t.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING SUM(t.valor) > 1000;

-- f) Todos os líderes de vendas em unidades.
WITH vendas AS (
    SELECT id_produto, SUM(quantidade) AS unidades
    FROM item_pedido
    GROUP BY id_produto
)
SELECT p.id_produto, p.nome, v.unidades
FROM vendas AS v
JOIN public.produto AS p ON p.id_produto = v.id_produto
WHERE v.unidades = (SELECT MAX(unidades) FROM vendas)
ORDER BY p.id_produto;
COMMIT;
