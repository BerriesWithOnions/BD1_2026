# Exercício 1 — Redundância em ALUNO_CURSO

a) Para os alunos 1, 2 e 4, o curso 10 repete o nome Sistemas de Informação e o coordenador Carlos. Para os alunos 3 e 5, repetem-se os dados do curso 20.

b) Um mesmo fato sobre o curso é gravado uma vez por aluno. Se apenas uma cópia mudar, duas linhas poderão atribuir coordenadores diferentes ao mesmo curso.

c) Para substituir Carlos por Marcos, seria preciso atualizar as três linhas do curso 10.

d) Excluir o último aluno de um curso também apagaria o único registro de seu nome e coordenador.

e) Não é possível representar um curso vazio por uma linha válida de aluno. Seria preciso inventar um aluno ou deixar a chave primária sem valor.

f) **Antes:** ALUNO_CURSO(id_aluno PK, nome_aluno, id_curso, nome_curso, coordenador). **Depois:** CURSO(id_curso PK, nome_curso, coordenador) e ALUNO(id_aluno PK, nome_aluno, id_curso FK → CURSO). O identificador do curso pode aparecer em vários alunos para indicar a matrícula, mas o nome e o coordenador ficam em uma única linha.
