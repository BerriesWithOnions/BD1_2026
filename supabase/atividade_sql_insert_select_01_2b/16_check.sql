-- Teste intencional: este comando deve falhar.
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Monitor', -500.00, 10, (SELECT id_categoria FROM categoria WHERE nome = 'Informática'));
-- O CHECK (preco >= 0) rejeita -500.00 (23514). Nenhuma linha é inserida.
