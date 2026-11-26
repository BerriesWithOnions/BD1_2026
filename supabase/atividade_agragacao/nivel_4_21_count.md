# Exercício 21 — Contagem após LEFT JOIN

Quando uma categoria não possui produtos, o "LEFT JOIN" mantém uma linha para ela e preenche as colunas de "produto" com "NULL". "COUNT(*)" conta essa linha e devolve 1. Para contar os produtos, usamos "COUNT(p.id_produto)". Como a chave primária de um produto existente sempre tem valor, essa expressão conta cada correspondência e devolve 0 para a categoria vazia.
