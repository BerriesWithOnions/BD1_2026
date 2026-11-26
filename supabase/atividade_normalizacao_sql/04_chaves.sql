-- a) {id_aluno} e {cpf} são chaves candidatas: cada uma identifica sozinha uma linha.
-- b) A chave primária escolhida é id_aluno.
-- c) id_aluno e cpf são primos: pertencem a pelo menos uma chave candidata.
-- d) nome e email são não primos; ambos podem se repetir.
-- e) O CPF é primo porque é chave candidata, mesmo com id_aluno escolhido como PK.
-- f) UNIQUE e NOT NULL garantem a identificação alternativa pelo CPF.

BEGIN;
CREATE SCHEMA norm_04;
SET LOCAL search_path TO norm_04;

CREATE TABLE aluno (
    id_aluno bigint PRIMARY KEY,
    cpf varchar(11) NOT NULL UNIQUE,
    nome text NOT NULL,
    email text
);
COMMIT;
