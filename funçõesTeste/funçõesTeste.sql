--FUNÇÃO QUE INSERE DADOS EM QUALQUER TABELA (USANDO O FORMATO JSON)

CREATE OR REPLACE FUNCTION inserir_registro(
  tabela_name text,
  colunas_text text
)
RETURNS void AS
$$
DECLARE
  colunas jsonb;
  coluna text;
  valor text;
  coluna_list text;
  valor_list text;
BEGIN
  colunas := colunas_text::jsonb;
  coluna_list := (SELECT string_agg(key, ', ') FROM jsonb_object_keys(colunas) key);
  valor_list := (SELECT string_agg(quote_literal(colunas ->> key), ', ') FROM jsonb_object_keys(colunas) key);

  EXECUTE format(
    'INSERT INTO %I (%s) VALUES (%s)',
    tabela_name,
    coluna_list,
    valor_list
  );
END;
$$
LANGUAGE plpgsql;