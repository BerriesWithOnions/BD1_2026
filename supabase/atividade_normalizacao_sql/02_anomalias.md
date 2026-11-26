# Exercício 2 — Funcionários e departamentos

**Antes:** FUNCIONARIO_DEPARTAMENTO(id_funcionario PK, nome_funcionario, salario, id_departamento, nome_departamento, gerente_departamento).

a) **Inserção.** Para registrar um departamento recém-criado, seria preciso informar a chave de um funcionário mesmo que ninguém tivesse sido contratado.

b) **Atualização.** Se TI mudar de gerente, atualizar apenas um dos seus funcionários deixará dois gerentes registrados para TI.

c) **Exclusão.** Ao excluir o último funcionário de TI, perdem-se também o nome do departamento e seu gerente.

d) O funcionário possui id_funcionario, nome_funcionario e salario. A referência id_departamento registra sua lotação.

e) O departamento possui id_departamento, nome_departamento e gerente_departamento.

f) **Depois:** DEPARTAMENTO(id_departamento PK, nome_departamento, gerente_departamento) e FUNCIONARIO(id_funcionario PK, nome_funcionario, salario, id_departamento FK → DEPARTAMENTO). Cada funcionário referencia um departamento, que pode existir mesmo sem funcionários.
