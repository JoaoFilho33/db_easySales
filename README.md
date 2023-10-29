# Projeto Banco de Dados EasySales

- O banco funciona de forma independente da plataforma. Nele você pode testar todas as funcionalidades do sistema de forma manual.
- Podem ser criados diversos usuários (empresa) como uma forma de login com a função abaixo:

  ```sql
  CREATE OR REPLACE FUNCTION CADASTRAR_EMPRESA(
    nome_emp VARCHAR(15),
    email_emp VARCHAR(25),
    senha_emp VARCHAR(8),
	cpf_emp VARCHAR(15)
	)
	RETURNS void AS
	$$
	DECLARE
	    novo_usuario VARCHAR;
	BEGIN
	    novo_usuario := REPLACE(nome_emp, ' ', '_'); -- Define o nome do usuário trocando espaços em branco por "_"
	
	    -- Cria o usuário e atribui a role
	    EXECUTE format('CREATE USER %s IN ROLE empresa_users PASSWORD %L', novo_usuario, senha_emp);
	
	    -- Concede permissões necessárias ao usuário
	    EXECUTE format('GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO %s', novo_usuario);
	    EXECUTE format('GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO %s', novo_usuario);
	    EXECUTE format('REVOKE UPDATE, DELETE ON TABLE empresa FROM %s', novo_usuario);
	    EXECUTE format('REVOKE UPDATE, DELETE ON TABLE produto FROM %s', novo_usuario);
	
	    INSERT INTO EMPRESA VALUES (DEFAULT, nome_emp, email_emp, senha_emp, cpf_emp);
	
	    RAISE NOTICE 'EMPRESA CADASTRADA COM SUCESSO!';
	END;
	$$
	LANGUAGE 'plpgsql';
```

- Para testar, certifique-se de ter o PostgreSQL instalado na sua máquina, e um ambiente preparado para criar as tabelas.
