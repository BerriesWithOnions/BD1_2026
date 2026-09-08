# Descrição da Modelagem — Locadora (BRMW)

## 1. Modelagem Conceitual

O modelo conceitual da locadora representa três entidades principais — **Cliente**, **Carro** e **Locação** — conectadas por um relacionamento central chamado **Loca**.

### Entidades e atributos

- **Cliente**: identificado por `id_cliente`, possui os atributos `nome` e `idade`.
- **Carro**: identificado por `id_carro`, possui os atributos `modelo` e `placa`.
- **Locação**: identificada por `id_locacao`, representa o registro de cada aluguel realizado, com os atributos `dias`, `quilometragem`, `valor_franquia`, `valor_seguro` e `valor_diaria`.

### Relacionamento

O relacionamento **Loca** conecta Cliente, Carro e Locação com as seguintes cardinalidades:

- Cliente → Loca: **(1, n)** — um cliente pode realizar uma ou várias locações.
- Carro → Loca: **(0, n)** — um carro pode não ter sido alugado ainda, ou pode ter sido alugado várias vezes.
- Locação → Loca: **(1, n)** — cada locação está ligada a pelo menos um cliente e um carro.

Na prática, **Locação** funciona como a entidade associativa que registra cada operação de aluguel, guardando os dados específicos daquela transação (dias, km rodados, valores de franquia/seguro/diária).

### Regras de negócio previstas

O modelo prevê validações que devem ser tratadas na aplicação/banco (via `CHECK constraints` ou lógica de negócio):

- Erro de diária (valor inválido ou fora do padrão).
- Erro de quantidade de dias (dias ≤ 0, por exemplo).
- Erro de quilometragem (valor negativo ou incoerente).
- Erro de idade inválida (ex: cliente menor que a idade mínima permitida para locação).

### Ajustes feitos em relação ao rascunho original

Durante a revisão do diagrama original, foram identificadas e corrigidas as seguintes inconsistências:

1. **Duplicidade de atributo em Cliente**: existiam dois atributos representando a mesma informação (`Idade` e `- $ idade`), sendo que o prefixo de valor monetário (`$`) não fazia sentido para um dado como idade. Os dois foram unificados em um único atributo `idade`.
2. **Ausência de nome do cliente**: o modelo original não continha nenhum atributo de identificação textual do cliente. Foi adicionado o atributo `nome`, essencial para qualquer operação real da locadora.
3. **Carro sem atributos descritivos**: a entidade Carro possuía apenas o identificador técnico (`id_carro`), sem nenhuma informação sobre o próprio veículo. Foram adicionados `modelo` e `placa`.
4. **Duplicidade de atributo em Locação**: assim como em Cliente, havia dois atributos conflitantes (`Dias` e `- $ dias loc`). O segundo foi reinterpretado como um **atributo derivado** — o valor total da locação, calculado a partir de `dias × valor_diaria` — e por isso não é armazenado como coluna própria no modelo lógico, apenas calculado quando necessário.

---

## 2. Modelagem Lógica

A modelagem lógica traduz as entidades e relacionamentos conceituais em tabelas relacionais, com chaves primárias (PK) e estrangeiras (FK) definidas.

### Tabela CLIENTE

| Campo | Tipo | Restrição |
|---|---|---|
| id_cliente | INT | PK |
| nome | VARCHAR(100) | NOT NULL |
| idade | INT | NOT NULL |

### Tabela CARRO

| Campo | Tipo | Restrição |
|---|---|---|
| id_carro | INT | PK |
| modelo | VARCHAR(100) | NOT NULL |
| placa | VARCHAR(10) | NOT NULL, UNIQUE |

### Tabela LOCACAO

| Campo | Tipo | Restrição |
|---|---|---|
| id_locacao | INT | PK |
| id_cliente | INT | FK → CLIENTE(id_cliente), NOT NULL |
| id_carro | INT | FK → CARRO(id_carro), NOT NULL |
| dias | INT | NOT NULL |
| quilometragem | DECIMAL(10,2) | NOT NULL |
| valor_franquia | DECIMAL(10,2) | NOT NULL |
| valor_seguro | DECIMAL(10,2) | NOT NULL |
| valor_diaria | DECIMAL(10,2) | NOT NULL |
| valor_total | DECIMAL(10,2) | derivado (`dias × valor_diaria`), calculado em consulta/aplicação — não persistido |
