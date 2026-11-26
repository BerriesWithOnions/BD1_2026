INSERT INTO categoria (nome) VALUES ('Informática');
INSERT INTO categoria (nome) VALUES ('Escritório');
INSERT INTO categoria (nome) VALUES ('Acessórios');
INSERT INTO categoria (nome) VALUES ('Eletrônicos');

SELECT * FROM categoria;

-- Informei apenas o nome de cada categoria. Para cada linha, o PostgreSQL
-- gerou id_categoria usando a sequência associada à coluna IDENTITY.
