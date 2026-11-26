-- Antes: ITEM_PEDIDO(id_pedido, id_produto, nome_produto, quantidade).
-- a–b) A PK é (id_pedido, id_produto). O par determina quantidade.
-- c–d) id_produto → nome_produto: trocar o pedido não muda o nome do mesmo produto.
-- e) Atende à 1FN: cada campo contém um único valor em seu domínio.
-- f) Viola a 2FN: nome_produto depende de uma parte própria da chave composta.
-- g–h) Depois: PEDIDO(id_pedido PK), PRODUTO(id_produto PK, nome_produto)
-- e ITEM_PEDIDO(id_pedido FK, id_produto FK, quantidade, PK(id_pedido, id_produto)).

BEGIN;
CREATE SCHEMA norm_07;
SET LOCAL search_path TO norm_07;

CREATE TABLE pedido (id_pedido bigint PRIMARY KEY);
CREATE TABLE produto (id_produto bigint PRIMARY KEY, nome_produto text NOT NULL);
CREATE TABLE item_pedido (
    id_pedido bigint REFERENCES pedido,
    id_produto bigint REFERENCES produto,
    quantidade integer NOT NULL CHECK (quantidade > 0),
    PRIMARY KEY (id_pedido, id_produto)
);
INSERT INTO pedido VALUES (1), (2), (3);
INSERT INTO produto VALUES (10, 'Mouse'), (20, 'Teclado');
INSERT INTO item_pedido VALUES (1, 10, 2), (1, 20, 1), (2, 10, 3), (3, 10, 1);

-- o–p) O par (1, 10) já existe. A PK composta rejeita a duplicata.
DO $$
BEGIN
    INSERT INTO item_pedido VALUES (1, 10, 9);
    RAISE EXCEPTION 'A chave composta deveria ter rejeitado a duplicata.';
EXCEPTION WHEN unique_violation THEN
    RAISE NOTICE 'Duplicata rejeitada pela chave primária (23505).';
END;
$$;
COMMIT;
