# Parte III — Regras para CLIENTE, PRODUTO e PEDIDO

| Código | Categoria | Tabela | Regra |
|---|---|---|---|
| R01 | [E] | CLIENTE | Cada cliente deve ter um identificador preenchido e exclusivo. |
| R02 | [D] | CLIENTE | O nome deve conter ao menos um caractere diferente de espaço. |
| R03 | [E] | CLIENTE | Cada cliente deve ter um e-mail preenchido e exclusivo, usado pela loja como identificador alternativo da conta. |
| R04 | [E] | PRODUTO | Cada produto deve ter um identificador preenchido e exclusivo. |
| R05 | [D] | PRODUTO | O nome deve conter ao menos um caractere diferente de espaço. |
| R06 | [D] | PRODUTO | O preço deve ser informado em reais e centavos e deve ser maior ou igual a zero. |
| R07 | [D] | PRODUTO | O estoque deve ser um inteiro maior ou igual a zero. Quando omitido no cadastro, começa em zero. |
| R08 | [E] | PEDIDO | Cada pedido deve ter um identificador preenchido e exclusivo. |
| R09 | [D] | PEDIDO | Todo pedido deve ter uma data válida e preenchida. |
| R10 | [D] | PEDIDO | O valor da venda deve ser informado em reais e centavos e deve ser maior ou igual a zero. |
| R11 | [R] | PEDIDO | Todo pedido deve indicar exatamente um cliente existente. |
| R12 | [R] | CLIENTE / PEDIDO | A exclusão de um cliente com pedidos vinculados deve ser bloqueada para preservar o histórico. |

**Legenda:** [E] entidade, [R] referencial, [D] domínio. Na R03, a unicidade do e-mail é uma regra de chave alternativa. Entre as três categorias do enunciado, ela foi agrupada em [E] por também identificar o cliente. A chave primária continua sendo `idCliente`.
