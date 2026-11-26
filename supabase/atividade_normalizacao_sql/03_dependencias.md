# Exercício 3 — Dependências funcionais de PRODUTO

a) A chave primária é `id_produto`.

b) As dependências diretas são `id_produto → nome_produto, preco, id_categoria` e `id_categoria → nome_categoria`. Delas decorre `id_produto → nome_categoria`.

c) Sim. Um identificador de produto determina uma única categoria, e o identificador dessa categoria determina seu nome.

d) Não. Mouse e Teclado podem estar na mesma categoria. Conhecer a categoria não permite escolher entre seus nomes.

e) A cadeia transitiva é `id_produto → id_categoria → nome_categoria`.

f) **Antes:** PRODUTO(id_produto PK, nome_produto, preco, id_categoria, nome_categoria). A dependência do nome da categoria em relação a id_categoria viola a 3FN, pois id_categoria não identifica unicamente o produto e nome_categoria não pertence a uma chave candidata. **Depois:** CATEGORIA(id_categoria PK, nome_categoria) e PRODUTO(id_produto PK, nome_produto, preco, id_categoria FK → CATEGORIA).
