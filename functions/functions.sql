/*-----------------------------
	VALIDAR CPF
*/-----------------------------
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
    IF cnpj_limpo = repeat(substring(cnpj_limpo FROM 1 FOR 1), 14) THEN
        RAISE EXCEPTION 'TODOS OS DÍGITOS DO CNPJ SÃO IGUAIS!';
    END IF;
    
    -- Cálculo do primeiro dígito verificador
    FOR i IN 1..12 LOOP
        soma1 := soma1 + CAST(substring(cnpj_limpo FROM i FOR 1) AS INT) * multiplicador1[i];
    END LOOP;
    
    resto := soma1 % 11;
    
    IF resto < 2 THEN
        digito1 := 0;
    ELSE
        digito1 := 11 - resto;
    END IF;
    
    -- Cálculo do segundo dígito verificador
    FOR i IN 1..13 LOOP
        soma2 := soma2 + CAST(substring(cnpj_limpo FROM i FOR 1) AS INT) * multiplicador2[i];
    END LOOP;
    
    resto := soma2 % 11;
    
    IF resto < 2 THEN
        digito2 := 0;
    ELSE
        digito2 := 11 - resto;
    END IF;
    
    -- Verificar se os dígitos verificadores são válidos
    IF digito1 = CAST(substring(cnpj_limpo FROM 13 FOR 1) AS INT) AND digito2 = CAST(substring(cnpj_limpo FROM 14 FOR 1) AS INT) THEN
        RAISE LOG 'CNPJ VÁLIDO!';
    ELSE
        RAISE EXCEPTION 'CNPJ INVÁLIDO!';
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
	VALIDAR SE É CPF OU NPJ
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
		UPDATE VENDA SET QTD_PARCELAS_FALTA = QTD_PARCELAS_FALTA - QUANT_ABATE; --CRIAR TRIGGER PARA NÃO DEIXAR ABATER A PONTO DE FICAR < 0
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


CREATE OR REPLACE FUNCTION REALIZAR_VENDA(
	CV INT, -- código da venda
	NP VARCHAR(25), -- nome do produto
	NE VARCHAR(15), -- nome da empresa
	NC VARCHAR(40), -- nome do cliente
	CPF_CLI VARCHAR(15), -- CPF do cliente
	QV INT, -- quantidade vendida
	QUANT_PARC INT -- quantidade de parcelas
)
RETURNS VOID AS $$
DECLARE 
	QUANT_EST INT;
	COD_PROD INT;
	COD_EMP INT;
	COD_CLI INT;
	VALOR_PROD INT;
	COD_EST INT;
BEGIN
	PERFORM CLIENTE_EXISTE(NC, CPF_CLI); -- Verifica se o cliente existe com o nome e CPF fornecidos
	PERFORM EMPRESA_EXISTE(NE);
	SELECT ID_PROD INTO COD_PROD FROM PRODUTO WHERE NOME_PROD = NP;
	SELECT ID_CLI INTO COD_CLI FROM CLIENTE WHERE NOME_CLI = NC AND CPF = CPF_CLI;
	SELECT PRECO_PROD INTO VALOR_PROD FROM ESTOQUE WHERE PROD_ID = COD_PROD;
	SELECT ID_EMP INTO COD_EMP FROM EMPRESA WHERE NOME_EMP = NE;
	SELECT ID_ESTOQUE INTO COD_EST FROM ESTOQUE WHERE EMPID = COD_EMP AND PRODID = COD_PROD;
	SELECT QUANT_ESTQ INTO QUANT_EST FROM ESTOQUE WHERE ID_ESTOQUE = COD_EST;

	IF QUANT_EST >= QV THEN
		IF NOT EXISTS (SELECT * FROM VENDA WHERE COD_VENDA = CV) THEN 
			IF QUANT_PARC > 1 THEN
				INSERT INTO VENDA VALUES (CV, COD_CLI, VALOR_PROD * QV, CURRENT_DATE, QV, QUANT_PARC, QUANT_PARC);
			ELSE 
				INSERT INTO VENDA VALUES (CV, COD_CLI, VALOR_PROD * QV, CURRENT_DATE, QV, QUANT_PARC);
			END IF;
			INSERT INTO ITEM_VENDA VALUES (CV, COD_EST, QV, VALOR_PROD * QV);
			UPDATE ESTOQUE SET QUANT_ESTQ = QUANT_ESTQ - QV WHERE ID_ESTOQUE = COD_EST;
		ELSE
			UPDATE VENDA SET VALOR_TOTAL_VENDA = VALOR_TOTAL_VENDA + (VALOR_PROD * QV), QTD_ITENS = QTD_ITENS + QV
			WHERE COD_VENDA = CV;
			IF EXISTS (SELECT * FROM ITEM_VENDA WHERE VENDAID = CV AND ESTOQUEID = COD_EST) THEN 
				UPDATE ITEM_VENDA SET QTD_VENDIDA = QTD_VENDIDA + QV,
				VALOR_TOTAL_ITEM_V = VALOR_TOTAL_ITEM_V + (VALOR_PROD * QV);
			ELSE 
				INSERT INTO ITEM_VENDA VALUES (CV, COD_EST, QV, VALOR_PROD * QV);
			END IF;
			UPDATE ESTOQUE SET QUANT_ESTQ = QUANT_ESTQ - QV WHERE ID_ESTOQUE = COD_EST;
		END IF;
	END IF;	
END;
$$ LANGUAGE plpgsql;


/*========================================
		FUNÇÃO SE CLIENTE EXISTE
*/--=======================================
CREATE OR REPLACE FUNCTION CLIENTE_EXISTE(NC VARCHAR(40), CPF_CLI VARCHAR(15))
RETURNS VOID AS $$
BEGIN 
	IF NOT EXISTS (SELECT * FROM CLIENTE WHERE LOWER(NOME_CLI) = LOWER(NC) AND CPF = CPF_CLI) THEN
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


