# Parte I · D — Integridade de domínio

O domínio de um atributo é o conjunto de valores que ele pode assumir. Para defini-lo, primeiro perguntamos o que o campo representa: dinheiro, quantidade, data ou texto? Depois verificamos as regras do negócio. Um tipo inteiro impede que o estoque represente frações de unidade, mas ainda comporta números negativos. Por isso, além do tipo, precisamos definir limites e decidir se o preenchimento é obrigatório.

| Atributo | Valores permitidos nesta loja | Valores recusados e justificativa |
|---|---|---|
| `preco` | Valor monetário conhecido, em reais e centavos, maior ou igual a zero. R$ 0,00 pode representar um brinde. | R$ −50,00 contraria a regra de preço de venda. Um valor ausente também é inválido: preço desconhecido e produto gratuito têm significados diferentes. |
| `estoque` | Inteiro conhecido a partir de zero. Zero significa produto esgotado e 8 significa oito unidades disponíveis. | −3 não representa uma quantidade física disponível. 2,5 é inadequado para produtos contados por unidade. Um campo sem valor deixa a quantidade desconhecida. |

O tipo define como o valor é representado. A obrigatoriedade e os limites completam o domínio adotado pela loja.

**Fonte:** [PostgreSQL — Check Constraints e Not-Null Constraints](https://www.postgresql.org/docs/current/ddl-constraints.html).
