INSERT INTO categoria (nome) VALUES ('Informática')
RETURNING id_categoria, nome, ativo;
-- A identidade fornece o ID e o valor padrão de ativo é TRUE.
