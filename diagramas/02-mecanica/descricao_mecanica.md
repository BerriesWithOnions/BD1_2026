# Descrição da Modelagem — Oficina Mecânica (BRMW)

## 1. Modelagem Conceitual

O modelo conceitual da oficina mecânica é mais complexo que o da locadora, envolvendo generalização/especialização, um relacionamento ternário e duas entidades associativas com atributos próprios.

### Entidades e atributos

- **Empregado**: identificado por `matricula`, com atributos `nome` e `admissao`. É uma entidade **generalizada**, especializada em duas subtipos:
  - **Atendente**: possui o atributo exclusivo `ramal`.
  - **Mecânico**: possui o atributo exclusivo `especialidade`.
  
  A especialização é do tipo **(t, c)** — total e exclusiva —, ou seja, todo empregado é obrigatoriamente ou Atendente ou Mecânico, nunca os dois ao mesmo tempo e nunca nenhum dos dois.

- **Cliente**: identificado por `codigo`, com atributos `nome`, `telefone` e `email`.
- **Veículo**: identificado por `placa`, com atributos `modelo`, `ano` e `quilometragem`.
- **Ordem de Serviço (OS)**: identificada por `numero`, com atributos `data_abertura`, `data_encerramento` e `status`.
- **Serviço**: identificado por `codigo`, com atributos `descricao`, `valor_ref`, `valor_cobrado` e `observacoes`.
- **Peça**: identificada por `codigo`, com atributos `descricao`, `fabricante` e `valor_ref`.

### Relacionamentos

- **Possui** (Cliente ↔ Veículo): cardinalidade **(0,n) : (1,n)** — um cliente pode possuir vários veículos e um veículo pode estar associado a um ou mais clientes (relação N:N).
- **Pertence** (Veículo ↔ Ordem de Serviço): cardinalidade **(1,1) : (0,n)** — cada OS pertence a exatamente um veículo, e um veículo pode ter nenhuma ou várias OS.
- **Presta** (relacionamento ternário entre Mecânico, Serviço e OS): representa o fato de que, dentro de uma OS, um mecânico presta um determinado serviço. As cardinalidades são **(1,1)** para Mecânico e **(1,n)** para Serviço e para OS.
- **Usa** (Peça ↔ Ordem de Serviço): relacionamento N:N, com atributos próprios `valor_cobrado` e `qtd_usada`, representando as peças utilizadas em cada OS.

### Decisões de modelagem documentadas no diagrama original

O autor do modelo deixou anotações explicando três decisões importantes, que foram mantidas:

1. **Generalização de Empregado**: como existem dois tipos de funcionário (Atendente e Mecânico) que compartilham características comuns, optou-se por especializar a entidade Empregado, atribuindo a cada subtipo apenas suas características exclusivas.
2. **Relacionamento ternário Presta**: como Mecânico, OS e Serviço precisam ser representados simultaneamente numa mesma operação (um mecânico presta um serviço dentro de uma OS), optou-se por um relacionamento ternário ao invés de relacionamentos binários separados.
3. **Atributos na relação Usa**: como a peça está associada à OS na especificação, mas há poucas informações que diferenciariam uma "peça usada" de uma peça em estoque, optou-se por colocar os atributos (`valor_cobrado`, `qtd_usada`) diretamente na relação, em vez de criar uma entidade adicional.

### Correção aplicada em relação ao rascunho original

O diagrama continha uma **inconsistência entre a anotação do autor e o desenho**: havia uma generalização (t,c) da entidade `Tipo_servico_5` para `Servico`, mas a nota ao lado do diagrama já explicava que essa ideia de entidade separada havia sido abandonada, optando-se por representar os 5 tipos de serviço como um único atributo do tipo **ENUM** dentro da própria entidade Serviço.

Como o desenho mantinha a generalização (contradizendo a própria explicação do autor), essa parte foi corrigida: a generalização `Tipo_servico_5` foi removida e substituída por um atributo `tipo_servico` (ENUM/lista fixa de valores) dentro da entidade **Serviço**, conforme a intenção original documentada.

---

## 2. Modelagem Lógica

### Tabela EMPREGADO

| Campo | Tipo | Restrição |
|---|---|---|
| matricula | INT | PK |
| nome | VARCHAR(100) | NOT NULL |
| admissao | DATE | NOT NULL |
| tipo | VARCHAR(20) | NOT NULL, CHECK IN ('ATENDENTE', 'MECANICO') |

### Tabela ATENDENTE

| Campo | Tipo | Restrição |
|---|---|---|
| matricula | INT | PK, FK → EMPREGADO(matricula) |
| ramal | VARCHAR(10) | NOT NULL |

### Tabela MECANICO

| Campo | Tipo | Restrição |
|---|---|---|
| matricula | INT | PK, FK → EMPREGADO(matricula) |
| especialidade | VARCHAR(50) | NOT NULL |

### Tabela CLIENTE

| Campo | Tipo | Restrição |
|---|---|---|
| codigo | INT | PK |
| nome | VARCHAR(100) | NOT NULL |
| telefone | VARCHAR(20) | |
| email | VARCHAR(100) | |

### Tabela VEICULO

| Campo | Tipo | Restrição |
|---|---|---|
| placa | VARCHAR(10) | PK |
| modelo | VARCHAR(50) | NOT NULL |
| ano | INT | NOT NULL |
| quilometragem | DECIMAL(10,2) | NOT NULL |

### Tabela POSSUI (associativa Cliente N:N Veículo)

| Campo | Tipo | Restrição |
|---|---|---|
| codigo_cliente | INT | PK, FK → CLIENTE(codigo) |
| placa_veiculo | VARCHAR(10) | PK, FK → VEICULO(placa) |

### Tabela ORDEM_SERVICO

| Campo | Tipo | Restrição |
|---|---|---|
| numero | INT | PK |
| data_abertura | DATE | NOT NULL |
| data_encerramento | DATE | |
| status | VARCHAR(20) | NOT NULL |
| placa_veiculo | VARCHAR(10) | FK → VEICULO(placa), NOT NULL |

### Tabela SERVICO

| Campo | Tipo | Restrição |
|---|---|---|
| codigo | INT | PK |
| descricao | VARCHAR(100) | NOT NULL |
| valor_ref | DECIMAL(10,2) | NOT NULL |
| valor_cobrado | DECIMAL(10,2) | NOT NULL |
| observacoes | VARCHAR(255) | |
| tipo_servico | VARCHAR(20) | NOT NULL, CHECK IN (5 valores fixos — ENUM) |

### Tabela PECA

| Campo | Tipo | Restrição |
|---|---|---|
| codigo | INT | PK |
| descricao | VARCHAR(100) | NOT NULL |
| fabricante | VARCHAR(100) | |
| valor_ref | DECIMAL(10,2) | NOT NULL |

### Tabela PRESTA (relacionamento ternário: Mecânico + Serviço + OS)

| Campo | Tipo | Restrição |
|---|---|---|
| codigo_servico | INT | PK, FK → SERVICO(codigo) |
| numero_os | INT | PK, FK → ORDEM_SERVICO(numero) |
| matricula_mecanico | INT | FK → MECANICO(matricula), NOT NULL |

### Tabela USA (associativa Peça N:N Ordem de Serviço)

| Campo | Tipo | Restrição |
|---|---|---|
| codigo_peca | INT | PK, FK → PECA(codigo) |
| numero_os | INT | PK, FK → ORDEM_SERVICO(numero) |
| valor_cobrado | DECIMAL(10,2) | NOT NULL |
| qtd_usada | INT | NOT NULL |

