CREATE TABLE Cliente (
  	id_cli          SERIAL NOT NULL PRIMARY KEY,
  	nome_cli        VARCHAR(40) NOT NULL,
  	cpf             VARCHAR(15),
  	bairro_cli      VARCHAR(15) NOT NULL,
  	num_cli         VARCHAR(12) NOT NULL,
  	logradouro_cli  VARCHAR(25) NOT NULL,
  	cep_cli         VARCHAR(11) NOT NULL,
  	cidade_cli      VARCHAR(20) NOT NULL,
	email_cli		VARCHAR(25),
	telefone		VARCHAR(12) NOT NULL
);

CREATE TABLE Fornecedor (
  	id_fn             SERIAL NOT NULL PRIMARY KEY,
  	nome_fn           VARCHAR(40) NOT NULL,
  	bairro_fn         VARCHAR(20) NOT NULL,
  	num_fn            VARCHAR(13) NOT NULL,
  	logradouro_fn     VARCHAR(15) NOT NULL,
  	cep_fn            VARCHAR(13) NOT NULL,
  	cidade_fn         VARCHAR(20) NOT NULL,
	telefone_fn		  VARCHAR(15) NOT NULL,
	cpf_fn			  VARCHAR(15) NOT NULL,
	email_fn		  VARCHAR(25)
	
);

CREATE TABLE Compra (
  	id_compra               SERIAL NOT NULL PRIMARY KEY,
	id_fn          	INT NOT NULL REFERENCES Fornecedor(id_fn),
  	dt_compra               TIMESTAMPTZ NOT NULL,
  	valor_total_compra      FLOAT NOT NULL
);

CREATE TABLE ItemCompra (
  	id_compra                 INT NOT NULL REFERENCES Compra(id_compra),
  	id_estoque                  INT NOT NULL REFERENCES Estoque(id_estoque),
  	qtdComprada                INT NOT NULL,
	valor_total_item_c 		   FLOAT NOT NULL,
	preco_prod_c			   REAL NOT NULL,
  	--dt_compra                TIMESTAMPTZ NOT NULL,
  	CONSTRAINT PRI_ITEM_COMPRA PRIMARY KEY (id_compra,id_estoque)
);


CREATE TABLE Empresa (
  	id_emp           SERIAL NOT NULL PRIMARY KEY,
  	nome_emp         VARCHAR(15) NOT NULL,
  	email_emp        VARCHAR(25) NOT NULL, --CRIAR VIEW DE CADA EMPRESA PARA SEU PROPRIO BD
  	senha_emp        VARCHAR(8) NOT NULL
	CPF_CNPJ         VARCHAR(15) NOT NULL;----------ADD COLUNA CPF_CNPJ(CASO JA TENHA A TABELA CRIADA)
);



CREATE TABLE Produto (
  	id_prod             SERIAL PRIMARY KEY NOT NULL,
  	nome_prod           VARCHAR NOT NULL
);


CREATE TABLE Venda (
  	id_venda               SERIAL NOT NULL PRIMARY KEY,
  	id_cli           INT NOT NULL REFERENCES Cliente(id_cli),
  	valor_total_venda      REAL NOT NULL,
  	dt_venda		       TIMESTAMPTZ NOT NULL,
	qtd_itens			   INT NOT NULL,
  	qtd_parcelas	       INT NOT NULL
);


CREATE TABLE Estoque (
 	id_estoque        SERIAL NOT NULL PRIMARY KEY,
	id_emp             INT NOT NULL REFERENCES Empresa(id_emp) ON DELETE CASCADE,
  	id_prod            INT NOT NULL REFERENCES Produto(id_prod) ON DELETE CASCADE,
	preco_prod	      REAL NOT NULL, --preço de venda do produto
	quant_estq		  INT NOT NULL
);


CREATE TABLE ItemVenda (
	id_venda                INT NOT NULL REFERENCES Venda(id_venda),
  	id_estoque             INT NOT NULL REFERENCES Estoque(id_estoque),
	qtd_vendida		   	   INT NOT NULL,
	valor_total_item_v     REAL NOT NULL,
  	CONSTRAINT PRI_ITEM_VENDA PRIMARY KEY (id_estoque, id_venda)
);




------------------------------------------------------------------------------------------
--INSERT
------------------------------------------------------------------------------------------
-- Inserção de empresas
INSERT INTO Empresa (nome_emp, email_emp, senha_emp)
VALUES ('Empresa A', 'empresaA@example.com', 'senhaA');

INSERT INTO Empresa (nome_emp, email_emp, senha_emp)
VALUES ('Empresa B', 'empresaB@example.com', 'senhaB');

INSERT INTO Empresa (nome_emp, email_emp, senha_emp)
VALUES ('Empresa C', 'empresaC@example.com', 'senhaC');

-- Inserção de produtos
INSERT INTO Produto (id_prod, nome_prod)
VALUES (DEFAULT, 'Produto A');

INSERT INTO Produto (id_prod, nome_prod)
VALUES (DEFAULT, 'Produto B');

INSERT INTO Produto (id_prod, nome_prod)
VALUES (DEFAULT, 'Produto C');

--Inserção estoque
SELECT * FROM EMPRESA
SELECT * FROM ESTOQUE
SELECT * FROM PRODUTO
INSERT INTO ESTOQUE VALUES(DEFAULT, 1, 1, 12.5, 100);
INSERT INTO ESTOQUE VALUES(DEFAULT, 1, )

-- Inserção de clientes
INSERT INTO Cliente (nome_cli, cpf, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli, email_cli, telefone)
VALUES ('Maria Santos', '987.654.321-00', 'Centro', '456', 'Rua Principal', '54321-098', 'São Paulo', 'maria@example.com', '86995002359');

INSERT INTO Cliente (nome_cli, cpf, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli, email_cli, telefone)
VALUES ('Pedro Oliveira', '111.222.333-44', 'Bairro A', '789', 'Avenida dois', '98765-432', 'Rio de Janeiro', 'pedro@example.com', '86995123459');

INSERT INTO Cliente (nome_cli, cpf, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli, email_cli, telefone)
VALUES ('Ana Silva', '555.666.777-88', 'Bairro B', '321', 'Rua Alternativa', '12345-678', 'Curitiba', 'ana@example.com', '81547682341');

-- Inserção de fornecedores
INSERT INTO Fornecedor (nome_fn, bairro_fn, num_fn, logradouro_fn, cep_fn, cidade_fn, telefone_fn, cpf_fn, email_fn)
VALUES ('Fornecedor A', 'Centro', '123', 'Rua Principal', '12345-678', 'São Paulo', '11123456789', '123.456.789-00', 'fornecedorA@example.com');

INSERT INTO Fornecedor (nome_fn, bairro_fn, num_fn, logradouro_fn, cep_fn, cidade_fn, telefone_fn, cpf_fn, email_fn)
VALUES ('Fornecedor B', 'Bairro A', '789', 'Avenida Dois', '98765-432', 'Teresina', '21987654321', '987.654.321-00', 'fornecedorB@example.com');

INSERT INTO Fornecedor (nome_fn, bairro_fn, num_fn, logradouro_fn, cep_fn, cidade_fn, telefone_fn, cpf_fn, email_fn)
VALUES ('Fornecedor C', 'Bairro B', '321', 'Rua Alternativa', '12345-678', 'Curitiba', '41123456789', '555.666.777-88', 'fornecedorC@example.com');

select * from fornecedor

-- Inserção de compras
INSERT INTO Compra (fn_compra_id, dt_compra, valor_total_compra)
VALUES (3, CURRENT_TIMESTAMP, 1000.0);

INSERT INTO Compra (fn_compra_id, dt_compra, valor_total_compra)
VALUES (4, CURRENT_TIMESTAMP, 1500.0);

INSERT INTO Compra (fn_compra_id, dt_compra, valor_total_compra)
VALUES (5, CURRENT_TIMESTAMP, 800.0);


select * from compra
-- Inserção de itens de compra
INSERT INTO ItemCompra (compraId, estoqueId, qtdComprada, valor_total_item_c, preco_prod_c)
VALUES (2, 1, 5, 500.0, 100.0);

INSERT INTO ItemCompra (compraId, estoqueId, qtdComprada, valor_total_item_c, preco_prod_c)
VALUES (3, 2, 10, 1000.0, 100.0);

INSERT INTO ItemCompra (compraId, estoqueId, qtdComprada, valor_total_item_c, preco_prod_c)
VALUES (4, 3, 4, 320.0, 80.0);


-- Inserção de vendas
INSERT INTO Venda (cli_venda_id, valor_total_venda, dt_venda, qtd_itens, qtd_parcelas)
VALUES (1, 500.0, CURRENT_TIMESTAMP, 2, 1);

INSERT INTO Venda (cli_venda_id, valor_total_venda, dt_venda, qtd_itens, qtd_parcelas)
VALUES (2, 800.0, CURRENT_TIMESTAMP, 3, 2);

INSERT INTO Venda (cli_venda_id, valor_total_venda, dt_venda, qtd_itens, qtd_parcelas)
VALUES (3, 200.0, CURRENT_TIMESTAMP, 1, 1);


-- Inserção de itens de venda
INSERT INTO ItemVenda (vendaId, estoqueId, preco_item_v, qtd_vendida, valor_total_item_v)
VALUES (1, 1, 100.0, 1, 100.0);

INSERT INTO ItemVenda (vendaId, estoqueId, preco_item_v, qtd_vendida, valor_total_item_v)
VALUES (2, 2, 200.0, 2, 400.0);

INSERT INTO ItemVenda (vendaId, estoqueId, preco_item_v, qtd_vendida, valor_total_item_v)
VALUES (3, 3, 80.0, 1, 80.0);

select * from estoque


------------------------------------------------------------------------------------------
--					FUNCTIONS
------------------------------------------------------------------------------------------
/*-----------------------------
	VALIDAR CPF
*/-----------------------------
CREATE OR REPLACE FUNCTION validar_cpf(cpf TEXT)
RETURNS VOID AS $$
DECLARE
    soma1 INT := 0;
    soma2 INT := 0;
    i INT;
    digito1 INT;
    digito2 INT;
    multiplicador INT := 10;
    cpf_limpo TEXT;
BEGIN
    -- Remover caracteres não numéricos do CPF
    cpf_limpo := regexp_replace(cpf, '[^0-9]', '', 'g');
    
    -- Verificar se o CPF tem 11 dígitos
    IF length(cpf_limpo) <> 11 THEN
        RAISE EXCEPTION 'CPF INVÁLIDO. O CAMPO DEVE POSSUIR 11 DÍGITOS!';
    END IF;
    
    -- Verificar se todos os dígitos são iguais
    IF cpf_limpo = repeat(substring(cpf_limpo, 1, 1), 11) THEN
        RAISE EXCEPTION 'TODOS OS DIGITOS SÃO IGUAIS';
    END IF;
    
    -- Cálculo do primeiro dígito verificador
    FOR i IN 1..9 LOOP
        soma1 := soma1 + CAST(substring(cpf_limpo, i, 1) AS INT) * multiplicador;
        multiplicador := multiplicador - 1;
    END LOOP;
    
    digito1 := (soma1 * 10) % 11;
    IF digito1 = 10 THEN
        digito1 := 0;
    END IF;
    
    -- Cálculo do segundo dígito verificador
    multiplicador := 11;
    FOR i IN 1..10 LOOP
        soma2 := soma2 + CAST(substring(cpf_limpo, i, 1) AS INT) * multiplicador;
        multiplicador := multiplicador - 1;
    END LOOP;
    
    digito2 := (soma2 * 10) % 11;
    IF digito2 = 10 THEN
        digito2 := 0;
    END IF;
    
    -- Verificar se os dígitos verificadores são válidos
    IF digito1 = CAST(substring(cpf_limpo, 10, 1) AS INT) AND digito2 = CAST(substring(cpf_limpo, 11, 1) AS INT) THEN
        RAISE LOG 'CPF VÁLIDO';
    ELSE
        RAISE EXCEPTION 'CPF INVÁLIDO. DÍGITOS VERIFICADORES INCORRETOS!';
    END IF;
END;
$$ LANGUAGE plpgsql;

/*-----------------------------------
	VALIDAR CPNJ
*/-----------------------------------

CREATE OR REPLACE FUNCTION validar_cnpj(cnpj TEXT)
RETURNS VOID AS $$
DECLARE
    cnpj_limpo TEXT;
    multiplicador1 CONSTANT INTEGER[] := ARRAY[5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    multiplicador2 CONSTANT INTEGER[] := ARRAY[6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    soma1 INT := 0;
    soma2 INT := 0;
    digito1 INT;
    digito2 INT;
    resto INT;
BEGIN
    -- Remover caracteres não numéricos do CNPJ
    cnpj_limpo := regexp_replace(cnpj, '[^0-9]', '', 'g');
    
    -- Verificar se o CNPJ tem 14 dígitos
    IF length(cnpj_limpo) <> 14 THEN
        RAISE EXCEPTION 'CNPJ INVÁLIDO. O CAMPO DEVE POSSUIR 14 DÍGITOS!';
    END IF;
    
    -- Verificar se todos os dígitos são iguais
    IF substring(cnpj_limpo, 1, 1) = repeat(substring(cnpj_limpo, 1, 1), 14) THEN
        RAISE EXCEPTION 'TODOS OS DÍGITOS DO CNPJ SÃO IGUAIS!';
    END IF;
    
    -- Cálculo do primeiro dígito verificador
    FOR i IN 1..12 LOOP
        soma1 := soma1 + CAST(substring(cnpj_limpo, i) AS INT) * multiplicador1[i];
    END LOOP;
    
    resto := soma1 % 11;
    
    IF resto < 2 THEN
        digito1 := 0;
    ELSE
        digito1 := 11 - resto;
    END IF;
    
    -- Cálculo do segundo dígito verificador
    FOR i IN 1..13 LOOP
        soma2 := soma2 + CAST(substring(cnpj_limpo, i) AS INT) * multiplicador2[i];
    END LOOP;
    
    resto := soma2 % 11;
    
    IF resto < 2 THEN
        digito2 := 0;
    ELSE
        digito2 := 11 - resto;
    END IF;
    
    -- Verificar se os dígitos verificadores são válidos
    IF digito1 = CAST(substring(cnpj_limpo, 13) AS INT) AND digito2 = CAST(substring(cnpj_limpo, 14) AS INT) THEN
        RAISE LOG 'CNPJ VÁLIDO!';
    ELSE
        RAISE EXCEPTION 'CNPJ INVÁLIDO!';
    END IF;
END;
$$ LANGUAGE 'plpgsql';

/*----------------------------------
	VALIDAR SE É CPF OU CNPJ
*/----------------------------------
CREATE OR REPLACE FUNCTION verificar_cnpj_cpf(dado TEXT)
RETURNS BOOLEAN AS $$
BEGIN
    -- Remover caracteres não numéricos do dado
    dado := regexp_replace(dado, '[^0-9]', '', 'g');
    
    -- Verificar se é CNPJ (14 dígitos) ou CPF (11 dígitos)
    IF length(dado) = 14 THEN
        RETURN TRUE;  -- É CNPJ
    ELSIF length(dado) = 11 THEN
        RETURN FALSE;  -- É CPF
    ELSE
        RETURN NULL;  -- Não é CNPJ nem CPF
    END IF;
END;
$$ LANGUAGE 'plpgsql';


/*----------------------------
	VALIDAR TELEFONE
*/----------------------------
CREATE OR REPLACE FUNCTION validar_telefone(telefone TEXT)
RETURNS VOID AS $$
BEGIN
    -- Remover caracteres não numéricos do telefone
    telefone := regexp_replace(telefone, '[^0-9]', '', 'g');
    
    -- Verificar se o telefone tem 10 dígitos (incluindo o código de área)
    IF length(telefone) <> 11 THEN
        RAISE EXCEPTION 'TELEFONE INVÁLIDO';
    END IF;
END;
$$ LANGUAGE 'plpgsql';



/*---------------------------------------------------------------
	VALIDAR EMAIL
*/----------------------------------------------------------------
CREATE OR REPLACE FUNCTION validar_email(email TEXT)
RETURNS VOID AS $$
BEGIN
    -- Verificar se o email tem pelo menos um @ e um ponto após o @
    IF position('@' IN email) = 0 OR position('.' IN substring(email, position('@' IN email))) = 0 THEN
        RAISE EXCEPTION 'EMAIL INVÁLIDO';
    END IF;
    
    -- Verificar se o email não começa ou termina com um ponto
    IF email LIKE '.%' OR email LIKE '%.' THEN
		RAISE EXCEPTION 'EMAIL INVÁLIDO';
	END IF;
    
    -- Verificar se o email não contém espaços em branco
    IF position(' ' IN email) <> 0 THEN
		RAISE EXCEPTION 'EMAIL INVÁLIDO';
	END IF;   
END;
$$ LANGUAGE 'plpgsql';




/*-----------------------------------------------------------------------
	VALIDAR CEP
*/-----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION validar_cep(cep TEXT)
RETURNS VOID AS $$
BEGIN
    -- Remover caracteres não numéricos do CEP
    cep := regexp_replace(cep, '[^0-9]', '', 'g');
    
    -- Verificar se o CEP tem 8 dígitos
    IF length(cep) <> 8 THEN
        RAISE EXCEPTION 'CEP INVÁLIDO';
    END IF;
END;
$$ LANGUAGE 'plpgsql';


/*---------------------------------------------------
			ABATER VENDA
	CLIENTE PODE ABATER UMA OU MAIS PARCELAS
*/---------------------------------------------------
CREATE OR REPLACE FUNCTION ABATER_PARCELA(NC VARCHAR(40), QUANT_ABATE INT)
RETURNS VOID AS $$
DECLARE
	QUANT_FALTA INT; --QTD PARCELAS FALTANTES
	QUANT_TOTAL INT;
	COD_CLI INT;
BEGIN
	SELECT ID_CLI INTO COD_CLI FROM CLIENTE WHERE NOME_CLI = NC;
	SELECT QTD_PARCELAS_FALTA INTO QUANT_FALTA FROM VENDA WHERE CLI_VENDA_ID = COD_CLI;
	SELECT QTD_PARCELAS_TOTAL INTO QUANT_TOTAL FROM VENDA WHERE CLI_VENDA_ID = COD_CLI;
	
	IF QUANT_FALTA > QUANT_TOTAL THEN 
		UPDATE VENDA SET QTD_PARCELAS_FALTA = QTD_PARCELAS_FALTA - QUANT_ABATE;
	ELSIF QUANT_FALTA == 0 THEN
		RAISE LOG 'COMPRA JÁ QUITADA';
	ELSEIF QUANT_FALTA == QUANT_TOTAL THEN
		UPDATE VENDA SET QTD_PARCELAS_FALTA = QTD_PARCELAS_FALTA - QUANT_ABATE; --CRIAR TRIGGER PARA NÃO DEIXAR ABATER A PONTO DE FICAR >0
	END IF;
END;
$$ LANGUAGE plpgsql;

/*---------------------------------------------------
			REALIZAR VENDA
*/----------------------------------------------------
SELECT * FROM REALIZAR REALIZAR_VENDA(1, 'PRODUTO A', 'EMPRESA A', 'MARIA SANTOS', 5, 2)
SELECT * FROM EMPRESA
SELECT * FROM ESTOQUE
SELECT * FROM CLIENTE
SELECT * FROM VENDA


CREATE OR REPLACE FUNCTION REALIZAR_VENDA(CV INT, NP VARCHAR(25), NE VARCHAR(15), NC VARCHAR(40), QV INT, QUANT_PARC INT) --IMPLEMENTAR ABATIMENTO DE PARCELAS
RETURNS VOID AS $$
DECLARE 
	QUANT_EST INT;
	--QUANT_PARC_TOTAL INT;
	--QUANT_PARC_FALTA INT;
	COD_PROD INT; --COD_PRO
	COD_EMP INT; --CEO_EMP
	COD_CLI INT; --COD_CLI
	VALOR_PROD INT; --VALOR_UNI
	COD_EST INT;
BEGIN
	PERFORM CLIENTE_EXISTE(NC);
	PERFORM EMPRESA_EXISTE(NE);
	SELECT ID_PROD INTO COD_PROD FROM PRODUTO WHERE NOME_PROD=NP;
	SELECT ID_CLI INTO COD_CLI FROM CLIENTE WHERE NOME_CLI=NC;
	SELECT PRECO_PROD INTO VALOR_PROD FROM ESTOQUE WHERE PROD_ID=CP; -- IN (SELECT ID_PROD FROM PRODUTO WHERE PROD_ID = ID_PROD)
	SELECT ID_EMP INTO COD_EMP FROM EMPRESA WHERE NOME_EMP=NE;
	SELECT ID_ESTOQUE INTO COD_EST FROM ESTOQUE WHERE EMPID=COD_EMP AND PRODID=COD_PROD;
	SELECT QUANT_ESTQ INTO QUANT_EST FROM ESTOQUE WHERE ID_ESTOQUE=COD_EST;
	--SELECT QTD_PARCELAS_TOTAL INTO QUANT_PARC_TOTAL FROM VENDA WHERE CLI_VENDA_ID = COD_CLI;
	--SELECT QTD_PARCELAS_FALTA INTO QUANT_PARC_FALTA FROM VENDA WHERE CLI_VENDA_ID = COD_CLI;

IF (QUANT_EST>=QV) THEN
	IF NOT EXISTS (SELECT * FROM VENDA WHERE COD_VENDA=CV) THEN 
		IF QUANT_PARC > 1 THEN-- SE NÃO FOR A VISTA, AS PARCELAS FALTANRTES DEVEM SER IGUAIS AS TOTAIS
			INSERT INTO VENDA VALUES(CV, COD_CLI, VALOR_PROD*QV, CURRENT_DATE, QV, QUANT_PARC, QUANT_PARC); --criar trigger para venda (verificar se venda existe)
		ELSE 
			INSERT INTO VENDA VALUES(CV, COD_CLI, VALOR_PROD*QV, CURRENT_DATE, QV, QUANT_PARC);
		END IF;
		INSERT INTO ITEM_VENDA VALUES(CV, COD_EST, QV, VALOR_PROD*QV);
		UPDATE ESTOQUE SET QUANT_ESTQ=QUANT_ESTQ-QV WHERE ID_ESTOQUE=COD_EST;
	ELSE
		UPDATE VENDA SET VALOR_TOTAL_VENDA=VALOR_TOTAL_VENDA+(VALOR_PROD*QV), QTD_ITENS=QTD_ITENS+QV
		WHERE COD_VENDA=CV;
		IF EXISTS (SELECT * FROM ITEM_VENDA WHERE VENDAID=CV AND ESTOQUEID=COD_EST) THEN 
			UPDATE ITEM_VENDA SET QTD_VENDIDA=QTD_VENDIDA+QV,
			VALOR_TOTAL_ITEM_V=VALOR_TOTAL_ITEM_V+(VALOR_PROD*QV);
		ELSE 
			INSERT INTO ITEM_VENDA VALUES(CV, COD_EST, QV, VALOR_PROD*QV);
		END IF;
		UPDATE ESTOQUE SET QUANT_ESTQ=QUANT_ESTQ-QV WHERE ID_ESTOQUE=COD_EST;
	END IF;
END IF;	
END;
$$ LANGUAGE 'plpgsql';


/*========================================
		FUNÇÃO SE CLIENTE EXISTE
*/--=======================================
CREATE OR REPLACE FUNCTION CLIENTE_EXISTE(NC VARCHAR(40))
RETURNS VOID
AS $$
BEGIN 
	IF NOT EXISTS(SELECT * FROM CLIENTE WHERE LOWER(NOME_CLI) = LOWER(NC)) THEN
		RAISE EXCEPTION 'O CLIENTE AINDA NÃO FOI CADASTRADO';
	END IF;
END;
$$ LANGUAGE plpgsql;


/*========================================
		FUNÇÃO SE EMPRESA EXISTE
*/--=======================================
CREATE OR REPLACE FUNCTION EMPRESA_EXISTE(NE VARCHAR(15))
RETURNS VOID
AS $$
BEGIN
	IF NOT EXISTS(SELECT * FROM EMPRESA WHERE LOWER(NOME_EMP) = LOWER(NE)) THEN
		RAISE EXCEPTION 'VOCÊ NÃO TEM ACESSO A ESSA EMPRESA';
	END IF;
END;
$$ LANGUAGE plpgsql;


/*=====================================================================================================
			TRIGGERS


----------------------- VALIDAR CLIENTE --------------------------------
		
CREATE OR REPLACE FUNCTION T_VALIDAR_CLIENTE()
RETURNS TRIGGER AS $$
	BEGIN
		PERFORM VALIDAR_EMAIL(NEW.email_cli);
		PERFORM VALIDAR_TELEFONE(NEW.TELEFONE);
		PERFORM VALIDAR_CEP(NEW.cep_cli);
		PERFORM VALIDAR_CPF(NEW.CPF);
		RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER TRIGGER_VALIDAR_CLIENTE 
BEFORE INSERT OR UPDATE ON CLIENTE
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_CLIENTE()

--drop trigger trigger_validar_cliente on cliente


-------------------------------------------------------------------------

---------------------- VALIDAR FORNECEDOR -------------------------------

CREATE OR REPLACE FUNCTION T_VALIDAR_FORNECEDOR()
RETURNS TRIGGER AS $$
	BEGIN
		PERFORM VALIDAR_EMAIL(NEW.EMAIL_fn);
		PERFORM VALIDAR_TELEFONE(NEW.TELEFONE_fn);
		PERFORM VALIDAR_CEP(NEW.CEP_fn);
		
		IF VERIFICAR_CNPJ_CPF(NEW.CPF_fn) THEN
			PERFORM VALIDAR_CNPJ(NEW.CPF_fn);
		ELSEIF VERIFICAR_CNPJ_CPF(NEW.CPF_fn) = FALSE THEN
			PERFORM VALIDAR_CPF(NEW.cpf_fn);
		ELSE
			RAISE EXCEPTION 'O valor informado é inválido.';
		END IF;
		
		RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER TRIGGER_VALIDAR_FORNECEDOR
BEFORE INSERT OR UPDATE ON FORNECEDOR
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_FORNECEDOR()


-------------------------------------------------------------------------

---------------------- VALIDAR EMPRESA-------------------------------
CREATE OR REPLACE FUNCTION T_VALIDAR_EMPRESA()
RETURNS TRIGGER AS $$
	BEGIN
		PERFORM VALIDAR_EMAIL(NEW.email_emp);
		
		IF VERIFICAR_CNPJ_CPF(NEW.CPF_CNPJ) THEN
			PERFORM VALIDAR_CNPJ(NEW.CPF_CNPJ);
		ELSEIF VERIFICAR_CNPJ_CPF(NEW.CPF_CNPJ) = FALSE THEN
			PERFORM VALIDAR_CPF(NEW.CPF_CNPJ);
		ELSE
			RAISE EXCEPTION 'O VALOR INFORMADO É INVÁLIDO.';
		END IF;
		
		RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER TRIGGER_VALIDAR_EMPRESA
BEFORE INSERT OR UPDATE ON EMPRESA
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_EMPRESA()


select * from empresa
---------------------------------------------------------------------------------------
-------------------------VALIDAR PRODUTO-------------------------------------------------
CREATE OR REPLACE FUNCTION PRODUTO_EXISTE(NP)

CREATE OR REPLACE FUNCTION T_VALIDAR_PRODUTO()
RETURNS TRIGGER AS $$
BEGIN
	IF EXISTS (SELECT * FROM PRODUTO )
	

CREATE TRIGGER TRIGGER_VALIDAR_PRODUTO
BEFORE INSERT OR UPDATE ON PRODUTO
FOR EACH ROW
EXECUTE PROCEDURE T_VALIRDAR_PRODUTO()

---------------------------------------------------------------------------------------
-------------------------ATUALIZAR VALOR TOTAL DE COMPRA-----------------------------------FALTA TESTAR

 CREATE OR REPLACE FUNCTION ATUALIZAR_VALOR_TOTAL_COMPRA()
    RETURNS TRIGGER AS $$
BEGIN
    -- Atualizar o valor total de compra
    UPDATE Compra
    SET valor_total_compra = (
        SELECT SUM(valor_total_item_c)
        FROM ItemCompra
        WHERE id_compra = NEW.id_compra
    )
    WHERE id_compra = NEW.id_compra;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER T_ATUALIZAR_VALOR_TOTAL_COMPRA
AFTER INSERT ON ItemCompra
FOR EACH ROW
EXECUTE FUNCTION ATUALIZAR_VALOR_TOTAL_COMPRA();



---------------------------------------------------------------------------------------
-------------------------NÃO PERMITIR qtd_parcelas_falta FICAR MENOR QUE ZERO-----------------------------------FALTA TESTAR


CREATE OR REPLACE FUNCTION validar_qtd_parcelas_falta()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.qtd_parcelas_falta < 0 THEN
        RAISE EXCEPTION 'A QUANTIDADE DE PARCELAS NÃO PODE SWR MENOR QUE ZERO.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER T_VALIDAR_QTD_PARCELAS_FALTA
BEFORE UPDATE ON VENDA
FOR EACH ROW
EXECUTE FUNCTION validar_qtd_parcelas_falta();


---------------------------------------------------------------------------------------
------------------------------VALIDAR SENHA EMPRESA---------------------------------------------------------
CREATE OR REPLACE FUNCTION T_VALIDAR_SENHA_EMPRESA()
    RETURNS TRIGGER AS $$
BEGIN
    IF LENGTH(NEW.senha_emp) < 4 THEN
        RAISE EXCEPTION 'A senha da empresa deve ter no mínimo 4 caracteres.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER validar_senha_empresa_trigger
BEFORE INSERT OR UPDATE ON empresa
FOR EACH ROW
EXECUTE FUNCTION  T_VALIDAR_SENHA_EMPRESA();


------------------------------------------------------------------------------------------------------
----------------------------------------VALIDAR NOME DA EMPRESA-----------------------------------------
CREATE OR REPLACE FUNCTION T_VALIDAR_NOME_EMPRESA()
    RETURNS TRIGGER AS $$
DECLARE
    count INTEGER;
BEGIN
    SELECT COUNT(*) INTO count
    FROM empresa
    WHERE nome_emp = NEW.nome_emp;

    IF count > 0 THEN
        RAISE EXCEPTION 'NOME DA EMPRESA JÁ ESTA SENDO UTILIZADO.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER VALIDAR_NOME_EMPRESA
BEFORE INSERT OR UPDATE ON empresa
FOR EACH ROW
EXECUTE FUNCTION T_VALIDAR_NOME_EMPRESA();


--==============================================================================================================
--							CADASTROS
--=============================================================================================================
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




