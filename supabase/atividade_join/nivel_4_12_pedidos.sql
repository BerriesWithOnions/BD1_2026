BEGIN;
CREATE SCHEMA join_12;
SET LOCAL search_path TO join_12, public;

CREATE TABLE cliente (
    id_cliente bigint PRIMARY KEY,
    nome text NOT NULL
);
CREATE TABLE pedido (
    id_pedido bigint PRIMARY KEY,
    id_cliente bigint NOT NULL REFERENCES cliente,
    data_pedido date NOT NULL
);
INSERT INTO cliente VALUES (1, 'Ana'), (2, 'Bruno'), (3, 'Maria');
INSERT INTO pedido VALUES
    (11, 1, '2026-03-05'), (12, 2, '2026-03-02'),
    (13, 1, '2026-03-07'), (14, 2, '2026-03-04');

-- a) Pedidos com seus clientes.
SELECT p.id_pedido, p.data_pedido, c.nome
FROM pedido AS p JOIN cliente AS c ON c.id_cliente = p.id_cliente;

-- b) Todos os clientes e seus pedidos, inclusive Maria.
SELECT c.id_cliente, c.nome, p.id_pedido
FROM cliente AS c LEFT JOIN pedido AS p ON p.id_cliente = c.id_cliente;

-- c) Clientes sem pedidos.
SELECT c.id_cliente, c.nome
FROM cliente AS c LEFT JOIN pedido AS p ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL;

-- d) Do mais antigo ao mais recente.
SELECT * FROM pedido ORDER BY data_pedido, id_pedido;

-- e) Pedidos da cliente de identificador 1.
SELECT * FROM pedido WHERE id_cliente = 1 ORDER BY id_pedido;
COMMIT;
