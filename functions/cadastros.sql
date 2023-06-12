/*----------------------------
	CADASTRAR EMPRESA
*/----------------------------
--ADD A COLUNA CPF NA TABELA EMPRESA---
ALTER TABLE EMPRESA
ADD COLUMN CPF_CNPJ VARCHAR(15) NOT NULL;
-----------------------------------------

CREATE OR REPLACE FUNCTION CADASTRAR_EMPRESA(
	nome_emp          VARCHAR(40),
	email_emp		  VARCHAR(25),
	senha_emp         VARCHAR(8),
	cpf_cnpj          VARCHAR(15) 
	
)
RETURNS void AS
$$
BEGIN
	  INSERT INTO EMPRESA VALUES 
	  (DEFAULT, nome_emp,email_emp, senha_emp,cpf_cnpj );
	  RAISE NOTICE 'EMPRESA CADASTRADA COM SUCESSO!';
END;
$$
LANGUAGE plpgsql;

SELECT CADASTRAR_EMPRESA('MARISA', 'DWEKMLFMFO@GMAIL.COM' ,'GALINHA', '01125658965');
SELECT CADASTRAR_EMPRESA('SBT', 'DOMINGO@GMAIL.COM' ,'SILVIO', '39818519353')


/*----------------------------
	CADASTRAR CLIENTE
*/----------------------------
CREATE OR REPLACE FUNCTION CADASTRAR_CLIENTE(
	nome_cli VARCHAR(40),
	CPF VARCHAR(15),
	bairro_cli VARCHAR(15),
	num_cli VARCHAR(12),
	logradouro_cli VARCHAR(25),
	cep_cli VARCHAR(11),
	cidade_cli VARCHAR(20),
	email_cli VARCHAR(25),
	telefone VARCHAR(12)
)
RETURNS void AS
$$
DECLARE
	cliente_existe BOOLEAN;
BEGIN
    SELECT EXISTS (SELECT 1 FROM CLIENTE WHERE CLIENTE.CPF = CADASTRAR_CLIENTE.CPF) INTO CLIENTE_EXISTE;

    IF cliente_existe THEN
        RAISE EXCEPTION 'CLIENTE JÁ CADASTRADO!';
    ELSE
       INSERT INTO CLIENTE VALUES 
	  (DEFAULT, nome_cli, CPF, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli, email_cli, telefone);
	  RAISE EXCEPTION 'CLIENTE CADASTRADO COM SUCESSO!';
    END IF;
END;
$$
LANGUAGE 'plpgsql';

SELECT * FROM CADASTRAR_CLIENTE('John Doe', '079.586.023-40', 'Street 1', '123', 'rua200', '64380-000', 'City', 'doezin@hotmail.com', '86 995120059');
SELECT * FROM CLIENTE
delete from cliente where id_cli = 21


/*----------------------------
	CADASTRAR FORNECEDOR
*/----------------------------
CREATE OR REPLACE FUNCTION CADASTRAR_FORNECEDOR(
	nome_fn           VARCHAR(40),
  	bairro_fn         VARCHAR(20),
  	num_fn            VARCHAR(13),
  	logradouro_fn     VARCHAR(15),
  	cep_fn            VARCHAR(13),
  	cidade_fn         VARCHAR(20),
	telefone_fn		  VARCHAR(15),
	cpf_fn			  VARCHAR(15),
	email_fn		  VARCHAR(25)
)
RETURNS void AS
$$
DECLARE 
	FORNECEDOR_EXISTE BOOLEAN;
BEGIN
	SELECT EXISTS (SELECT 1 FROM FORNECEDOR WHERE FORNECEDOR.CPF_FN = CADASTRAR_FORNECEDOR.CPF_FN) INTO FORNECEDOR_EXISTE;

	IF FORNECEDOR_EXISTE THEN
		RAISE EXCEPTION 'FORNECEDOR JÁ CADASTRADO';
	ELSE
		INSERT INTO FORNECEDOR VALUES
		(DEFAULT, nome_fn, bairro_fn, num_fn, logradouro_fn, cep_fn, cidade_fn, telefone_fn, cpf_fn, email_fn);
		 RAISE NOTICE 'FORNECEDOR CADASTRADO COM SUCESSO!';
	END IF;
END;
$$
LANGUAGE 'plpgsql';

SELECT * FROM CADASTRAR_FORNECEDOR('Nome do Fornecedor', 'Bairro do Fornecedor', '123', 'Logradouro1','64380-000', 'Cidade do Fornecedor', '86 995120059', '268442820001-05', 'emailforn@example.com');
SELECT * FROM FORNECEDOR;
delete from fornecedor where id_fn = 16



/*-------------------------------
	   CADASTRAR PRODUTO
*/-------------------------------



---INCOMPLETO


select * from produto
CREATE OR REPLACE FUNCTION cadastrar_produto(nome_produto VARCHAR) RETURNS VOID AS $$
DECLARE
    produto_id INTEGER;
BEGIN
    -- Verificar se o produto já existe exatamente com o nome fornecido
    SELECT id_prod INTO produto_id FROM Produto WHERE nome_prod = nome_produto;
    
    IF produto_id IS NOT NULL THEN
        RAISE NOTICE 'O produto "%s" já está cadastrado.', nome_produto;
        
    
    -- Se o produto não existe, cadastrar o novo produto
    ELSE
        INSERT INTO Produto (nome_prod) VALUES (nome_produto);
        RAISE NOTICE 'O produto "%s" foi cadastrado com sucesso.', nome_produto;
    END IF;
END;
$$ LANGUAGE plpgsql;