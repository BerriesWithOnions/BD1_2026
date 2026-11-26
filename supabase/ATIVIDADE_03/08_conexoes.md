# Conexões — Da necessidade ao mecanismo

| Necessidade | Mecanismo que eu utilizaria |
|---|---|
| Identificar cada cliente de maneira única | `PRIMARY KEY` em `CLIENTE.idCliente`. |
| Impedir um cliente sem nome | `NOT NULL` para exigir preenchimento e `CHECK` para recusar texto vazio ou composto só por espaços. |
| Impedir dois clientes com o mesmo e-mail | `UNIQUE` em `CLIENTE.email`. Como a loja exige e-mail em toda conta, também usaria `NOT NULL`. |
| Impedir preço negativo | `CHECK` com a condição `preco >= 0`. Para também exigir um preço conhecido, acrescentaria `NOT NULL`. |
| Garantir que um pedido pertença a um cliente existente | `FOREIGN KEY` de `PEDIDO.idCliente` para `CLIENTE.idCliente`, junto com `NOT NULL` para tornar o vínculo obrigatório. |
| Iniciar o produto com estoque zero quando a quantidade for omitida | `DEFAULT 0` em `PRODUTO.estoque`. |

**Existe relação?** Sim. Cada problema revela uma regra que faltou aplicar. O pedido 102 mostra bem como duas regras se complementam: o campo do cliente está preenchido com 99, então passaria pelo teste de obrigatoriedade. A chave estrangeira é que detectaria a ausência do cliente 99. No estoque acontece algo semelhante: o valor padrão resolve o cadastro em que a quantidade é omitida, mas, se alguém informar −3, é a verificação do limite que impede a gravação.

**Fontes:** [PostgreSQL — Constraints](https://www.postgresql.org/docs/current/ddl-constraints.html) e [PostgreSQL — Default Values](https://www.postgresql.org/docs/current/ddl-default.html).
