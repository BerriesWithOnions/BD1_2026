# Parte I · A — Integridade de dados

Imagine que a loja precisa descobrir quem fez o pedido 101. Ela consulta o identificador do cliente e encontra duas pessoas com o número 2. Mesmo que os dois cadastros estejam preenchidos, o banco perdeu a capacidade de responder a uma pergunta simples.

Garantir a integridade significa definir quais estados dos dados fazem sentido para o negócio e preservar essas regras ao inserir, alterar ou excluir registros. No exemplo, cada cliente precisa de um identificador exclusivo e cada pedido precisa apontar para um cliente cadastrado. Ao receber uma operação que quebraria uma dessas regras, o banco pode recusá-la.

Isso importa porque cobranças, relatórios e decisões de reposição usam esses dados. Uma regra só verifica aquilo que foi definido: se alguém digitar R$ 150,00 em vez de R$ 15,00, os dois valores passam pela regra de preço não negativo. Conferir o valor com o documento de origem continua sendo necessário.

**Fontes:** [IBM — Data integrity](https://www.ibm.com/think/topics/data-integrity) e [PostgreSQL — Constraints](https://www.postgresql.org/docs/current/ddl-constraints.html).
