# Parte IV — Mecanismos do banco de dados

| Termo | O que procura garantir? | Exemplo de uso |
|---|---|---|
| `PRIMARY KEY` | Cada linha tem uma identificação única e preenchida. | Distinguir dois clientes chamados João por meio de `idCliente`. |
| `FOREIGN KEY` | Uma referência preenchida corresponde a uma chave existente na tabela referenciada. | Recusar o pedido que indica o cliente 99 quando esse cliente não existe. |
| `NOT NULL` | A coluna deve ter um valor diferente de nulo. | Exigir a data de cada pedido para registrar quando a venda ocorreu. |
| `UNIQUE` | Impede a repetição de um mesmo valor informado ou de uma mesma combinação de valores. | Impedir que duas contas usem o e-mail de Ana. |
| `CHECK` | Rejeita uma linha quando a condição declarada é falsa. | Rejeitar o cadastro de um mouse com preço de R$ −50,00. |
| `DEFAULT` | Fornece um valor padrão quando a coluna é omitida na inserção. | Cadastrar um novo produto com estoque inicial zero quando a quantidade for omitida. |

**Fontes:** [PostgreSQL — Constraints](https://www.postgresql.org/docs/current/ddl-constraints.html) e [PostgreSQL — Default Values](https://www.postgresql.org/docs/current/ddl-default.html).
