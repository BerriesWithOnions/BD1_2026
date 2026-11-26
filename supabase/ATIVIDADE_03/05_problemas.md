# Parte II — Investigando os dados da loja

O traço nas tabelas representa um dado ausente. Para esta análise, a loja vende produtos por unidade, registra vendas com valor não negativo e adota um e-mail exclusivo para identificar cada conta de cliente.

| Problema encontrado | Por que é um problema? | Tipo de integridade | Regra que deveria existir |
|---|---|---|---|
| Bruno e Carlos têm `idCliente = 2`. | O pedido 101 aponta para o número 2. A loja não consegue saber a qual dos dois deve atribuir a compra. | Entidade | Cada cliente deve ter um ID obrigatório e exclusivo. |
| O cliente 4 está sem nome. | Há um contato, mas falta o nome necessário ao atendimento. O endereço de e-mail não permite deduzir o nome com segurança. | Domínio | Exigir um nome com ao menos um caractere diferente de espaço. |
| Ana e João têm o mesmo e-mail. | Se o e-mail identifica a conta, o mesmo endereço corresponde a dois cadastros. | Unicidade de chave alternativa | Exigir um e-mail exclusivo por conta. |
| O Mouse, produto 11, custa R$ −50,00. | Usar esse preço em uma venda reduziria o total ao acrescentar o item. | Domínio | Exigir preço maior ou igual a zero. |
| O Monitor, produto 12, tem estoque −3. | O saldo contradiz o significado de unidades físicas disponíveis. | Domínio | Exigir estoque inteiro maior ou igual a zero. |
| O produto 13 está sem nome. | O catálogo mostra o preço, mas o comprador não consegue saber o que está comprando. | Domínio | Exigir nome de produto preenchido e com conteúdo. |
| O pedido 101 vale R$ −100,00. | Um valor negativo seria tratado como venda e reduziria o faturamento. | Domínio | Exigir valor de venda maior ou igual a zero. |
| O pedido 102 referencia o cliente 99, que não existe. | O pedido está órfão. A loja não consegue localizar seu comprador. | Referencial | Exigir que o cliente indicado já exista em CLIENTE. |
| O pedido 103 está sem data. | A loja não consegue determinar em qual dia ou mês contabilizar a venda. | Domínio | Exigir uma data válida e preenchida. |
