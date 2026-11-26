-- a–b) Antes: CLIENTE(id_cliente PK, nome_cliente, telefones). O campo telefones
-- guarda uma lista, embora cada número precise ser consultado e removido sozinho.
-- c–g) Depois: CLIENTE(id_cliente PK, nome_cliente) e TELEFONE(id_cliente FK,
-- numero, PK(id_cliente, numero)). A FK referencia CLIENTE.id_cliente.
-- A cardinalidade é 1:N: cada linha de telefone pertence a um cliente, e um
-- cliente pode ter zero ou vários números. O mesmo par não pode se repetir.

BEGIN;
CREATE SCHEMA norm_05;
SET LOCAL search_path TO norm_05;

CREATE TABLE cliente (
    id_cliente bigint PRIMARY KEY,
    nome_cliente text NOT NULL
);
CREATE TABLE telefone (
    id_cliente bigint REFERENCES cliente,
    numero text NOT NULL,
    PRIMARY KEY (id_cliente, numero)
);

INSERT INTO cliente VALUES (1, 'Ana'), (2, 'Bruno'), (3, 'Carlos');
INSERT INTO telefone VALUES
    (1, '9999-1111'), (1, '9888-2222'), (2, '9777-3333'),
    (3, '9666-4444'), (3, '9555-5555'), (3, '9444-6666');

SELECT * FROM cliente ORDER BY id_cliente;
SELECT numero FROM telefone WHERE id_cliente = 1 ORDER BY numero;
INSERT INTO telefone VALUES (2, '9333-7777');
DELETE FROM telefone WHERE id_cliente = 3 AND numero = '9555-5555';
COMMIT;
