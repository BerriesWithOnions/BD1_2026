# Exercício 20 — Como selecionar apenas os produtos desejados?

A cláusula `WHERE`, escrita depois de `FROM produto`, filtra as linhas. Para cada pergunta, a condição muda.

1. **Produtos acima de R$ 500,00** — use `preco > 500.00`. Um produto de exatamente R$ 500,00 fica fora do resultado.
2. **Produtos de Informática** — localize em `categoria` o identificador da linha cujo nome é Informática. Em seguida, filtre `produto.id_categoria` por esse identificador.
3. **Produto chamado Notebook** — use `nome = 'Notebook'`. Se houver produtos diferentes com esse mesmo nome, todos serão exibidos.
