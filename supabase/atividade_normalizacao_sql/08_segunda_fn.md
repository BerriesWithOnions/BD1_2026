# Exercício 8 — Análise da 2FN

a–b) A chave primária é simples, formada apenas por `id_venda`.

c–d) Não há dependências parciais. Pela hipótese, a única chave candidata possui um único atributo. Os atributos não primos dependem da chave inteira. Como a relação já está na 1FN, atende à 2FN.

e) Sim. Um cliente com várias vendas tem o nome repetido. Uma atualização em apenas uma venda pode deixar nomes divergentes para o mesmo cliente.

f) A dependência responsável é `id_cliente → nome_cliente`. Com `id_venda → id_cliente`, o nome do cliente depende transitivamente da chave da venda.

g) A próxima forma a analisar é a 3FN. **Antes:** VENDA(id_venda PK, data_venda, id_cliente, nome_cliente). **Depois:** CLIENTE(id_cliente PK, nome_cliente) e VENDA(id_venda PK, data_venda, id_cliente FK → CLIENTE).
