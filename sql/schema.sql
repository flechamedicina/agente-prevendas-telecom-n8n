-- ============================================================
-- ABC Telecom — schema completo
--
-- Rode este arquivo inteiro no SQL Editor do Supabase antes
-- de importar os workflows.
--
-- ATENÇÃO À DIMENSIONALIDADE: o valor 3072 abaixo corresponde
-- ao padrão do modelo de embedding usado neste projeto. Se você
-- usar outro modelo, ajuste os três pontos marcados com
-- [DIMENSAO] para o número correto. Para descobrir qual é,
-- crie a coluna sem tamanho fixo (vector), rode a ingestão e
-- consulte:  select vector_dims(embedding) from documents limit 1;
-- ============================================================

create extension if not exists vector;

-- ── Base vetorial ───────────────────────────────────────────

create table if not exists documents (
  id        bigserial primary key,
  content   text,
  metadata  jsonb,
  embedding vector(3072)          -- [DIMENSAO]
);

-- Função de busca por similaridade consumida pelos agentes.
-- query_embedding sem tamanho fixo aceita qualquer dimensionalidade,
-- o que evita ter que recriar a função ao trocar de modelo.
create or replace function match_documents (
  query_embedding vector,          -- [DIMENSAO]
  match_count int default 5,
  filter jsonb default '{}'
) returns table (
  id bigint,
  content text,
  metadata jsonb,
  similarity float
)
language plpgsql
as $$
begin
  return query
  select
    documents.id,
    documents.content,
    documents.metadata,
    1 - (documents.embedding <=> query_embedding) as similarity
  from documents
  where documents.metadata @> filter
  order by documents.embedding <=> query_embedding
  limit match_count;
end;
$$;

-- Nota sobre índice: pgvector não suporta ivfflat nem hnsw acima
-- de 2000 dimensões. Com 3072 a busca é sequencial — irrelevante
-- nesta escala. Em produção, a decisão seria truncar o embedding
-- para 768 via output_dimensionality e então criar:
--   create index on documents using hnsw (embedding vector_cosine_ops);

-- ── Tabelas operacionais ────────────────────────────────────

create table if not exists leads (
  id             bigserial primary key,
  empresa        text,
  contato        text,
  cargo          text,
  num_linhas     integer,
  operadora      text,
  necessidade    text,
  plano_sugerido text,
  score          integer,
  temperatura    text,        -- quente | morno | frio
  dossie         text,
  criado_em      timestamptz default now()
);

create table if not exists chamados (
  id           bigserial primary key,
  cliente      text,
  categoria    text,          -- tecnico | comercial | faturamento | portabilidade
  urgencia     text,          -- critica | alta | media | baixa
  sla_horas    integer,
  tier_cliente text,          -- platinum | corporativo | essencial
  descricao    text,
  encaminhar   text,
  criado_em    timestamptz default now()
);

-- ── Segurança ───────────────────────────────────────────────
-- RLS habilitado sem políticas: nenhuma chave pública tem acesso.
-- Somente service_role, usada pelo n8n, consegue ler e escrever.

alter table documents enable row level security;
alter table leads     enable row level security;
alter table chamados  enable row level security;

-- Tabelas criadas via SQL Editor não recebem grant automático
-- para service_role. Sem estas linhas, o n8n retorna
-- "permission denied for table".

grant all on table documents to service_role;
grant all on table leads     to service_role;
grant all on table chamados  to service_role;
grant execute on function match_documents to service_role;
grant usage, select on all sequences in schema public to service_role;
