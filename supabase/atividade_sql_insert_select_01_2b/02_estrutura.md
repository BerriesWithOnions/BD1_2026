# Exercício 2 — Estrutura de categoria

No Table Editor do Supabase, abra "public.categoria". Após o exercício 1, a estrutura esperada é a seguinte:

| Coluna | Tipo | Aceita NULL? | Função |
|---|---|---|---|
| id_categoria | bigint | Não | Chave primária, gerada automaticamente por identidade quando omitida. |
| nome | varchar(100) | Não | Nome da categoria, declarado com NOT NULL. |
