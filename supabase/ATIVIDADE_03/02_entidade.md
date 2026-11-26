# Parte I · B — Integridade de entidade

A integridade de entidade garante que seja possível identificar uma linha sem confundi-la com outra. A chave primária (PK) é a coluna ou combinação de colunas escolhida para isso. Seu valor precisa ser único e todos os seus componentes precisam estar preenchidos. Em uma chave composta, um componente pode se repetir em várias linhas, desde que a combinação completa seja exclusiva.

**Exemplo.** Em uma biblioteca, cada exemplar físico recebe um número de tombo. Dois exemplares do mesmo livro podem ter o mesmo título, mas recebem tombos diferentes. Se ambos tivessem o tombo 42, uma devolução registrada para o exemplar 42 seria ambígua. Se o tombo ficasse nulo, aquele exemplar não poderia ser identificado pela chave.

**Fonte:** [PostgreSQL — Primary Keys](https://www.postgresql.org/docs/current/ddl-constraints.html#DDL-CONSTRAINTS-PRIMARY-KEYS).
