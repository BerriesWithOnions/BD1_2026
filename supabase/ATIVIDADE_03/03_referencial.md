# Parte I · C — Integridade referencial

A integridade referencial mantém coerentes os vínculos entre tabelas. Uma chave estrangeira (FK) indica qual chave da outra tabela deve ser consultada. Se a FK tiver um valor, esse valor deve corresponder a um registro existente. Quando o vínculo é obrigatório, a FK também precisa ser preenchida.

**Exemplo.** Uma escola mantém TURMA e MATRICULA. Cada matrícula registra o código da turma. Se uma matrícula indicar a turma 17 e essa turma não existir, teremos um registro órfão: a matrícula aponta para um registro que não pode ser encontrado.

Se alguém tentar excluir uma turma que ainda possui matrículas, o resultado depende da regra definida para a FK. A escola pode bloquear a exclusão para preservar o histórico. Com exclusão em cascata, apagar a turma apagaria também as matrículas vinculadas. Outra opção seria colocar a referência em nulo, mas isso só serve a um modelo em que a matrícula possa ficar sem turma. Para a escola deste exemplo, o bloqueio preserva tanto a matrícula quanto a turma em que ela ocorreu.

**Fonte:** [PostgreSQL — Foreign Keys](https://www.postgresql.org/docs/current/ddl-constraints.html#DDL-CONSTRAINTS-FK).
