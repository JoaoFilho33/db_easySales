CREATE TABLE Empresa (
  	id_emp           SERIAL NOT NULL PRIMARY KEY,
  	nome_emp         VARCHAR(15) NOT NULL,
  	email_emp        VARCHAR(25) NOT NULL, --CRIAR VIEW DE CADA EMPRESA PARA SEU PROPRIO BD
  	senha_emp        VARCHAR(8) NOT NULL,
	cpf				 VARCHAR(15) NOT NULL
);

CREATE TABLE Cliente (
  	id_cli          SERIAL NOT NULL PRIMARY KEY,
  	nome_cli        VARCHAR(40) NOT NULL,
  	cpf             VARCHAR(15) NOT NULL,
  	bairro_cli      VARCHAR(15) NOT NULL,
  	num_cli         VARCHAR(12) NOT NULL,
  	logradouro_cli  VARCHAR(25) NOT NULL,
  	cep_cli         VARCHAR(9) NOT NULL,
  	cidade_cli      VARCHAR(20) NOT NULL,
	email_cli		VARCHAR(25) NOT NULL,
	telefone		VARCHAR(15) NOT NULL,
	id_emp			INT NOT NULL REFERENCES EMPRESA(ID_EMP)
);

CREATE TABLE Fornecedor (
  	id_fn             SERIAL NOT NULL PRIMARY KEY,
  	nome_fn           VARCHAR(40) NOT NULL,
  	bairro_fn         VARCHAR(25) NOT NULL,
  	num_fn            VARCHAR(20) NOT NULL,
  	logradouro_fn     VARCHAR(30) NOT NULL,
  	cep_fn            VARCHAR(9) NOT NULL,
  	cidade_fn         VARCHAR(20) NOT NULL,
	telefone_fn		  VARCHAR(15) NOT NULL,
	cpf_fn			  VARCHAR(18) NOT NULL,
	email_fn		  VARCHAR(25) NOT NULL,
	id_emp			  INT NOT NULL REFERENCES EMPRESA(ID_EMP)
);

CREATE TABLE Compra (
  	id_compra               INT NOT NULL PRIMARY KEY,
	fn_compra_id          	INT NOT NULL REFERENCES Fornecedor(id_fn),
  	dt_compra               TIMESTAMPTZ NOT NULL,
  	valor_total_compra      FLOAT NOT NULL
);

CREATE TABLE Produto (
  	id_prod             SERIAL PRIMARY KEY NOT NULL,
  	nome_prod           VARCHAR NOT NULL
);

CREATE TABLE Estoque (
 	id_estoque        SERIAL NOT NULL PRIMARY KEY,
	empId             INT NOT NULL REFERENCES Empresa(id_emp),
  	prodId            INT NOT NULL REFERENCES Produto(id_prod),
	preco_prod	      REAL NOT NULL, --preço de venda do produto
	quant_estq		  INT NOT NULL
);

CREATE TABLE ItemCompra (
  	compraId                   INT NOT NULL REFERENCES Compra(id_compra),
  	estoqueId                  INT NOT NULL REFERENCES Estoque(id_estoque),
  	qtdComprada                INT NOT NULL,
	valor_total_item_c 		   FLOAT NOT NULL,
	preco_prod_c			   REAL NOT NULL,
  	CONSTRAINT PRI_ITEM_COMPRA PRIMARY KEY (compraId, estoqueId)
);

CREATE TABLE Venda (
  	id_venda               INT NOT NULL PRIMARY KEY,
  	id_cli                 INT NOT NULL REFERENCES Cliente(id_cli),
  	valor_total_venda      REAL NOT NULL,
  	dt_venda	       	   TIMESTAMPTZ NOT NULL,
	qtd_itens			   INT NOT NULL,
  	qtd_parcelas_total	   INT NOT NULL,
  	qtd_parcelas_falta	   INT
);


CREATE TABLE ItemVenda (
	vendaId                INT NOT NULL REFERENCES Venda(id_venda),
  	estoqueId              INT NOT NULL REFERENCES Estoque(id_estoque),
	qtd_vendida		   	   INT NOT NULL,
	valor_total_item_v     REAL NOT NULL,
  	CONSTRAINT PRI_ITEM_VENDA PRIMARY KEY (estoqueId, vendaId)
);


--
DROP TABLE IF EXISTS ItemCompra;

-- Drop da tabela ItemVenda
DROP TABLE IF EXISTS ItemVenda;

-- Drop da tabela Compra
DROP TABLE IF EXISTS Compra;

-- Drop da tabela Venda
DROP TABLE IF EXISTS Venda;

-- Drop da tabela Estoque
DROP TABLE IF EXISTS Estoque;

-- Drop da tabela Cliente
DROP TABLE IF EXISTS Cliente;

-- Drop da tabela Fornecedor
DROP TABLE IF EXISTS Fornecedor;

-- Drop da tabela Produto
DROP TABLE IF EXISTS Produto;

-- Drop da tabela Empresa
DROP TABLE IF EXISTS Empresa;


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

/*
==============================================================================================
								FUNCTIONS
===============================================================================================
*/
---------------------------------VALIDAR CPF---------------------------------------

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
    primeiro_digito TEXT;
BEGIN
    -- Remover caracteres não numéricos do CPF
    cpf_limpo := regexp_replace(cpf, '[^0-9]', '', 'g');

    -- Verificar se o CPF tem 11 dígitos
    IF length(cpf_limpo) <> 11 THEN
        RAISE EXCEPTION 'CPF INVÁLIDO. O CAMPO DEVE POSSUIR 11 DÍGITOS!';
    END IF;

    -- Verificar se todos os dígitos são iguais
    IF cpf_limpo = repeat(left(cpf_limpo, 1), 11) THEN
        RAISE EXCEPTION 'TODOS OS DÍGITOS SÃO IGUAIS';
    END IF;

    -- Cálculo do primeiro dígito verificador
    FOR i IN 1..9 LOOP
        soma1 := soma1 + CAST(substring(cpf_limpo FROM i FOR 1) AS INT) * multiplicador;
        multiplicador := multiplicador - 1;
    END LOOP;

    digito1 := (soma1 * 10) % 11;
    IF digito1 = 10 THEN
        digito1 := 0;
    END IF;

    -- Cálculo do segundo dígito verificador
    multiplicador := 11;
    FOR i IN 1..10 LOOP
        soma2 := soma2 + CAST(substring(cpf_limpo FROM i FOR 1) AS INT) * multiplicador;
        multiplicador := multiplicador - 1;
    END LOOP;

    digito2 := (soma2 * 10) % 11;
    IF digito2 = 10 THEN
        digito2 := 0;
    END IF;

    -- Verificar se os dígitos verificadores são válidos
    IF digito1 = CAST(substring(cpf_limpo FROM 10 FOR 1) AS INT) AND digito2 = CAST(substring(cpf_limpo FROM 11 FOR 1) AS INT) THEN
        RAISE NOTICE 'CPF VÁLIDO';
    ELSE
        RAISE EXCEPTION 'CPF INVÁLIDO. DÍGITOS VERIFICADORES INCORRETOS!';
    END IF;
END;
$$ LANGUAGE plpgsql;





---------------------------------VALIDAR CNPJ---------------------------------------

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



---------------------------------VALIDAR SE É CPF OU CNPJ---------------------------------------

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


---------------------------------VALIDAR TELEFONE---------------------------------------

CREATE OR REPLACE FUNCTION validar_telefone(telefone TEXT)
RETURNS VOID AS $$
BEGIN
    -- Remover caracteres não numéricos do telefone
    telefone := regexp_replace(telefone, '[^0-9]', '', 'g');
    
    -- Verificar se o telefone tem 11 dígitos (incluindo o código de área)
    IF length(telefone) <> 11 THEN
        RAISE EXCEPTION 'TELEFONE INVÁLIDO';
    END IF;
END;
$$ LANGUAGE 'plpgsql';



---------------------------------VALIDAR EMAIL---------------------------------------


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




---------------------------------VALIDAR CEP---------------------------------------

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



/*-----------------------------------------------------------
					ABATER VENDA
			CLIENTE PODE ABATER UMA OU MAIS PARCELAS
*/---------------------------------------------------------------

CREATE OR REPLACE FUNCTION ABATER_PARCELA(COD_VENDA INT, QUANT_ABATE INT)
RETURNS VOID AS $$
DECLARE
	QUANT_FALTA INT; --QTD PARCELAS FALTANTES
	QUANT_TOTAL INT;
BEGIN
	SELECT QTD_PARCELAS_FALTA INTO QUANT_FALTA FROM VENDA WHERE id_venda = COD_VENDA;
	SELECT QTD_PARCELAS_TOTAL INTO QUANT_TOTAL FROM VENDA WHERE id_venda = COD_VENDA;
	
	IF QUANT_ABATE <= QUANT_FALTA THEN
		IF QUANT_FALTA < QUANT_TOTAL THEN 
			UPDATE VENDA SET QTD_PARCELAS_FALTA = QTD_PARCELAS_FALTA - QUANT_ABATE;
		ELSIF QUANT_FALTA = 0 THEN
			RAISE NOTICE 'COMPRA JÁ QUITADA';
		ELSIF QUANT_FALTA = QUANT_TOTAL THEN
			UPDATE VENDA SET QTD_PARCELAS_FALTA = QTD_PARCELAS_FALTA - QUANT_ABATE; --CRIAR TRIGGER PARA NÃO DEIXAR ABATER A PONTO DE FICAR >0
		END IF;
	ELSE
		RAISE EXCEPTION 'VOCÊ NÃO PODE ABATER MAIS PARCELAS QUE O NECESSÁRIO!';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM CLIENTE




-----------------------------------------REALIZAR VENDA-------------------------------------------------------

SELECT * FROM REALIZAR REALIZAR_VENDA(1, 'PRODUTO A', 'EMPRESA A', 'MARIA SANTOS', 5, 2)
SELECT * FROM EMPRESA
SELECT * FROM ESTOQUE
SELECT * FROM CLIENTE
SELECT * FROM VENDA


CREATE OR REPLACE FUNCTION REALIZAR_VENDA(CV INT, NP VARCHAR(25), CPF_CLI VARCHAR(15), QV INT, QUANT_PARC INT)
RETURNS VOID AS $$
DECLARE 
    QUANT_EST INT;
    COD_PROD INT;
    COD_EMP INT;
    COD_CLI INT;
    VALOR_PROD REAL;
    COD_EST INT;
BEGIN
	SELECT ID_CLI INTO COD_CLI FROM CLIENTE WHERE CPF = CPF_CLI;
	SELECT ID_EMP INTO COD_EMP FROM EMPRESA WHERE NOME_EMP = CURRENT_USER;
	
IF VERIFICAR_CLIENTE_EMPRESA(cpf_cli, COD_EMP) THEN	

    SELECT ID_PROD INTO COD_PROD FROM PRODUTO WHERE NOME_PROD = NP;
    SELECT PRECO_PROD INTO VALOR_PROD FROM ESTOQUE WHERE PRODID = COD_PROD;
    SELECT ID_ESTOQUE INTO COD_EST FROM ESTOQUE WHERE EMPID = COD_EMP AND PRODID = COD_PROD;
    SELECT QUANT_ESTQ INTO QUANT_EST FROM ESTOQUE WHERE ID_ESTOQUE = COD_EST;
    
    IF QUANT_EST >= QV THEN
        IF NOT EXISTS (SELECT * FROM VENDA WHERE ID_VENDA = CV) THEN 
            IF QUANT_PARC > 1 THEN
                INSERT INTO VENDA VALUES(CV, COD_CLI, VALOR_PROD * QV, CURRENT_DATE, QV, QUANT_PARC, QUANT_PARC);
            ELSE 
                INSERT INTO VENDA VALUES(CV, COD_CLI, VALOR_PROD * QV, CURRENT_DATE, QV, QUANT_PARC);
            END IF;
            INSERT INTO ItemVenda VALUES(CV, COD_EST, QV, VALOR_PROD * QV);
            UPDATE ESTOQUE SET QUANT_ESTQ = QUANT_ESTQ - QV WHERE ID_ESTOQUE = COD_EST;
        ELSE
            UPDATE VENDA SET VALOR_TOTAL_VENDA = VALOR_TOTAL_VENDA + (VALOR_PROD * QV), QTD_ITENS = QTD_ITENS + QV
            WHERE ID_VENDA = CV;
            IF EXISTS (SELECT * FROM ItemVenda WHERE vendaId = CV AND estoqueId = COD_EST) THEN 
                UPDATE ItemVenda SET qtd_vendida = qtd_vendida + QV,
                valor_total_item_v = valor_total_item_v + (VALOR_PROD * QV);
            ELSE 
                INSERT INTO ItemVenda VALUES(CV, COD_EST, QV, VALOR_PROD * QV);
            END IF;
            UPDATE ESTOQUE SET QUANT_ESTQ = QUANT_ESTQ - QV WHERE ID_ESTOQUE = COD_EST;
        END IF;
    END IF;    
	RAISE NOTICE 'VENDA REALIZADA COM SUCESSO!';
ELSE 
	RAISE EXCEPTION 'O CLIENTE AINDA NÃO FOI CADASTRADO!';
END IF;
END;
$$ LANGUAGE 'plpgsql';



------------------------------FUNÇÃO SE CLIENTE EXISTE NA EMPRESA-----------------------------------------

CREATE OR REPLACE FUNCTION VERIFICAR_CLIENTE_EMPRESA(cpf_cli VARCHAR(18), empresa_id INT)
RETURNS BOOLEAN AS
$$
DECLARE
    cliente_pertence_empresa BOOLEAN;
BEGIN
	SELECT EXISTS (
		SELECT 1 
		FROM CLIENTE WHERE ID_EMP = EMPRESA_ID AND
		cpf = cpf_cli
	)INTO cliente_pertence_empresa;
    
    RETURN cliente_pertence_empresa;
END;
$$
LANGUAGE 'plpgsql';


------------------------------FUNÇÃO SE FORNECEDOR EXISTE NA EMPRESA-----------------------------------------

CREATE OR REPLACE FUNCTION VERIFICAR_FORNECEDOR_EMPRESA(cpf_forn VARCHAR(18), empresa_id INT)
RETURNS BOOLEAN AS
$$
DECLARE
    fornecedor_pertence_empresa BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM Fornecedor WHERE ID_EMP = EMPRESA_ID AND
		CPF_FN = CPF_FORN
    ) INTO fornecedor_pertence_empresa;
    
    RETURN fornecedor_pertence_empresa;
END;
$$
LANGUAGE 'plpgsql';



--------------------------------DELETAR VENDA PARA UM CLIENTE------------------------------

CREATE OR REPLACE FUNCTION apagar_venda(venda_id INT)
RETURNS VOID AS $$
DECLARE 
    cod_estoque INT;
    item_rec RECORD;
BEGIN
    -- Percorrer os itens da venda
    FOR item_rec IN SELECT estoqueId, qtd_vendida FROM ItemVenda WHERE vendaId = venda_id LOOP
        cod_estoque := item_rec.estoqueId;

        -- Atualizar a quantidade no estoque
        UPDATE Estoque SET quant_estq = quant_estq + item_rec.qtd_vendida WHERE id_estoque = cod_estoque;

        -- Remover o item da venda
        DELETE FROM ItemVenda WHERE vendaId = venda_id AND estoqueId = cod_estoque;
    END LOOP;

    -- Remover a venda (Venda)
    DELETE FROM Venda WHERE id_venda = venda_id;

    RAISE NOTICE 'Venda % apagada com sucesso!', venda_id;
END;
$$ LANGUAGE plpgsql;





---------------------------------DELETAR ITEM DA VENDA--------------------------------------

CREATE OR REPLACE FUNCTION remover_item_venda(id_venda INT, nome_produto VARCHAR)
RETURNS VOID AS $$
DECLARE
    cod_estoque INT;
    qtd_removida INT;
BEGIN
    -- Obter o código do estoque com base no nome do produto
    SELECT id_estoque INTO cod_estoque
    FROM Estoque
    WHERE prodId = (SELECT id_prod FROM Produto WHERE nome_prod = nome_produto);

    -- Obter a quantidade removida do item
    SELECT qtd_vendida INTO qtd_removida
    FROM ItemVenda
    WHERE vendaId = id_venda AND estoqueId = cod_estoque;

    -- Deletar o item da venda
    DELETE FROM ItemVenda WHERE vendaId = id_venda AND estoqueId = cod_estoque;

    -- Atualizar a quantidade no estoque
    UPDATE Estoque SET quant_estq = quant_estq + qtd_removida WHERE id_estoque = cod_estoque;
    
    RAISE NOTICE 'Item % removido da venda %.', nome_produto, id_venda;
END;
$$ LANGUAGE plpgsql;



---------------------------UPDATE QUANTIDADE ITENS_VENDA (O CLIENTE PODE DEVOLVER ITENS)------------------------

CREATE OR REPLACE FUNCTION update_quantidade_itens_venda(cod_venda INT, cod_produto INT, quantidade_devolvida INT)
RETURNS VOID AS $$
DECLARE
    COD_ESTOQUE INT;
BEGIN
	SELECT ID_ESTOQUE INTO COD_ESTOQUE FROM ESTOQUE WHERE PRODID = COD_PRODUTO;
	
    -- Atualizar a quantidade vendida e o valor total do item na tabela ItemVenda
    UPDATE ItemVenda
    SET qtd_vendida = qtd_vendida - quantidade_devolvida,
        valor_total_item_v = (qtd_vendida - quantidade_devolvida) * (valor_total_item_v / qtd_vendida)
    WHERE vendaId = cod_venda
    AND estoqueId = cod_estoque;

    -- Atualizar a quantidade devolvida no estoque
    UPDATE Estoque
    SET quant_estq = quant_estq + quantidade_devolvida
    WHERE PRODID = COD_PRODUTO;

    -- Atualizar a quantidade devolvida na tabela Venda
    UPDATE Venda
    SET qtd_itens= qtd_itens - quantidade_devolvida, 
		valor_total_venda = (qtd_itens - quantidade_devolvida) * (valor_total_venda / qtd_itens)
    WHERE id_venda = cod_venda;

    RAISE NOTICE '% unidades do item % devolvidas na venda %.', quantidade_devolvida, cod_produto, cod_venda;
END;
$$ LANGUAGE plpgsql;


	


--------------------------------DELETAR COMPRA COM O FORNECEDOR------------------------------

CREATE OR REPLACE FUNCTION apagar_compra(cod_compra INT)
RETURNS VOID AS $$
DECLARE 
    cod_estoque INT;
    item_rec RECORD;
BEGIN
    -- Percorrer os itens da compra
    FOR item_rec IN SELECT estoqueId, qtd_compra FROM ItemCompra WHERE compraId = cod_compra LOOP
        cod_estoque := item_rec.estoqueId;

        -- Atualizar a quantidade no estoque
        UPDATE Estoque SET quant_estq = quant_estq - item_rec.qtd_compra WHERE id_estoque = cod_estoque;

        -- Remover o item da compra
        DELETE FROM ItemCompra WHERE compraId = cod_compra AND estoqueId = cod_estoque;
    END LOOP;

    -- Remover a compra (Compra)
    DELETE FROM Compra WHERE id_compra = cod_compra;

    RAISE NOTICE 'Compra % apagada com sucesso!', cod_compra;
END;
$$ LANGUAGE plpgsql;


----------------------------DELETAR ITEM DA COMPRA COM O FORNECEDOR------------------------------

CREATE OR REPLACE FUNCTION deletar_item_compra(cod_compra INT, nome_produto VARCHAR) RETURNS VOID AS $$
DECLARE
    cod_estoque INT;
    qtd_deletada INT;
BEGIN
    -- Obter o código do estoque com base no nome do produto
    SELECT id_estoque INTO cod_estoque
    FROM Estoque
    WHERE prodId = (SELECT id_prod FROM Produto WHERE nome_prod = nome_produto);

    -- Obter a quantidade deletada do item
    SELECT qtdComprada INTO qtd_deletada
    FROM ItemCompra
    WHERE compraId = cod_compra AND estoqueId = cod_estoque;

    -- Deletar o item da compra
    DELETE FROM ItemCompra WHERE compraId = cod_compra AND estoqueId = cod_estoque;

    -- Atualizar a quantidade no estoque
    UPDATE Estoque SET quant_estq = quant_estq + qtd_deletada WHERE id_estoque = cod_estoque;
END;
$$ LANGUAGE plpgsql;



----------------------------UPDATE QUANTIDADE ITENS_COMPRA (A EMPRESA PODE QUERER DEVOLVER ITENS)------------------

CREATE OR REPLACE FUNCTION update_quantidade_itens_compra(cod_compra INT, nome_produto VARCHAR, quantidade_devolvida INT)
RETURNS VOID AS $$
DECLARE
    cod_estoque INT;
BEGIN
    -- Obter o ID do estoque do produto na compra
    SELECT ItemCompra.estoqueId
    INTO cod_estoque
    FROM ItemCompra
    INNER JOIN Compra ON ItemCompra.compraId = Compra.id_compra
    INNER JOIN Estoque ON ItemCompra.estoqueId = Estoque.id_estoque
    INNER JOIN Produto ON Estoque.prodId = Produto.id_prod
    WHERE Compra.id_compra = cod_compra
    AND Produto.nome_prod = nome_produto;

    -- Atualizar a quantidade comprada e o valor total do item
    UPDATE ItemCompra
    SET qtd_compra = qtd_compra - quantidade_devolvida,
        valor_total_item_c = (qtd_compra - quantidade_devolvida) * (valor_total_item_c / qtd_compra)
    WHERE compraId = cod_compra
    AND estoqueId = cod_estoque;

    -- Atualizar a quantidade devolvida no estoque
    UPDATE Estoque
    SET quant_estq = quant_estq + quantidade_devolvida
    WHERE id_estoque = cod_estoque;

    RAISE NOTICE '% unidades do item % devolvidas na compra %.', quantidade_devolvida, nome_produto, cod_compra;
END;
$$ LANGUAGE plpgsql;




----------------------------FUNÇÃO SE EMPRESA EXISTE-------------------------------------

CREATE OR REPLACE FUNCTION EMPRESA_EXISTE(NE VARCHAR(15))
RETURNS VOID
AS $$
BEGIN
	IF NOT EXISTS(SELECT * FROM EMPRESA WHERE LOWER(NOME_EMP) = LOWER(NE)) THEN
		RAISE EXCEPTION 'ESSA EMPRESA JÁ EXISTE!';
	END IF;
END;
$$ LANGUAGE plpgsql;


-------------------------SE A COMPRA JA EXISTE----------------------------------
CREATE OR REPLACE FUNCTION COMPRA_EXISTE(CC INT)
RETURNS BOOLEAN
AS $$
DECLARE 
	EXISTE BOOLEAN;
BEGIN 
	SELECT EXISTS (SELECT 1 FROM COMPRA WHERE ID_COMPRA = CC) INTO EXISTE;
	RETURN EXISTE;
END;
$$ LANGUAGE PLPGSQL;


-------------------------SE O ITEM_COMPRA JA EXISTE----------------------------------
CREATE OR REPLACE FUNCTION ITEM_COMPRA_EXISTE(CC INT, CE INT)
RETURNS BOOLEAN
AS $$
DECLARE
	EXISTE BOOLEAN;
BEGIN
	SELECT EXISTS (SELECT 1 FROM ITEMCOMPRA WHERE COMPRAID = CC AND ESTOQUEID = CE) INTO EXISTE;
	RETURN EXISTE;
END;
$$ LANGUAGE PLPGSQL;


-----------------------FUNÇÃO DE REALIZAR COMPRA COM O FORNECEDOR--------------------------
-- FALTA CONCLUIR
CREATE OR REPLACE FUNCTION realizar_compra(
	cod_compra INT,
  	nome_fornecedor VARCHAR(40),
	nome_produto VARCHAR(25),
    quantidade INT,
    preco_unitario FLOAT
) RETURNS VOID AS $$
DECLARE
    COD_FORN INT;
    COD_EMP INT;
    COD_PROD INT;
    COD_ESTOQUE INT;
	CPF_FORN VARCHAR(18);
BEGIN
    -- Obter o ID do fornecedor com base no nome
    SELECT id_fn INTO COD_FORN FROM Fornecedor WHERE nome_fn = nome_fornecedor;
    -- Obter o ID da empresa com base no current user
    SELECT id_emp INTO COD_EMP FROM Empresa WHERE nome_emp = current_user;
	SELECT CPF_FN INTO CPF_FORN FROM FORNECEDOR WHERE NOME_FN = NOME_FORNECEDOR;
	SELECT id_prod INTO COD_PROD FROM Produto WHERE nome_prod = nome_produto;
	SELECT id_estoque INTO COD_ESTOQUE FROM Estoque WHERE empId = COD_EMP AND prodId = COD_PROD;
	
	IF VERIFICAR_FORNECEDOR_EMPRESA(CPF_FORN, COD_EMP) THEN
		IF PRODUTO_EXISTE(nome_produto) THEN
			IF PRODUTO_EXISTE_NA_EMPRESA(COD_PROD, COD_EMP) THEN -- SE O PRODUTO JÁ EXISTE, A EMPRESA SÓ ESTÁ REPONDO
				IF COMPRA_EXISTE(cod_compra) THEN
					UPDATE Compra SET valor_total_compra = valor_total_compra + (quantidade * preco_unitario)
						WHERE id_compra = cod_compra;
					IF ITEM_COMPRA_EXISTE(cod_compra, COD_ESTOQUE) THEN
						UPDATE ItemCompra SET qtdComprada = qtdComprada + quantidade, 
							valor_total_item_c = valor_total_item_c + (quantidade * preco_unitario)
							WHERE compraId = cod_compra AND estoqueId = COD_ESTOQUE;
					ELSE
						INSERT INTO ItemCompra VALUES(cod_compra, COD_ESTOQUE, quantidade, quantidade * preco_unitario, preco_unitario);
					END IF;
					UPDATE Estoque SET quant_estq = quant_estq + quantidade WHERE empId = COD_EMP AND prodId = COD_PROD;
				ELSE 
					INSERT INTO Compra VALUES(cod_compra, COD_FORN, CURRENT_TIMESTAMP, quantidade * preco_unitario);
					INSERT INTO ItemCompra VALUES(cod_compra, COD_ESTOQUE, quantidade, quantidade * preco_unitario, preco_unitario);
					UPDATE Estoque SET quant_estq = quant_estq + quantidade WHERE empId = COD_EMP AND prodId = COD_PROD;
				END IF;
			ELSE -- SE O PRODUTO NÃO EXISTE NA EMPRESA
				INSERT INTO Produto (nome_prod) VALUES (nome_produto);
				SELECT id_prod INTO COD_PROD FROM Produto WHERE nome_prod = nome_produto;
				INSERT INTO Estoque VALUES (DEFAULT, COD_EMP, COD_PROD, preco_unitario, quantidade); -- CADASTRANDO PRODUTO NA EMPRESA
					SELECT id_estoque INTO COD_ESTOQUE FROM Estoque WHERE empId = COD_EMP AND prodId = COD_PROD;

				IF COMPRA_EXISTE(cod_compra) THEN
					UPDATE Compra SET valor_total_compra = valor_total_compra + (quantidade * preco_unitario)
						WHERE id_compra = cod_compra;
					IF ITEM_COMPRA_EXISTE(cod_compra, COD_ESTOQUE) THEN
						UPDATE ItemCompra SET qtdComprada = qtdComprada + quantidade, 
							valor_total_item_c = valor_total_item_c + (quantidade * preco_unitario)
							WHERE compraId = cod_compra AND estoqueId = COD_ESTOQUE;
					ELSE
						INSERT INTO ItemCompra VALUES(cod_compra, COD_ESTOQUE, quantidade, quantidade * preco_unitario, preco_unitario);
					END IF;
					UPDATE Estoque SET quant_estq = quant_estq + quantidade WHERE empId = COD_EMP AND prodId = COD_PROD;
				ELSE 
					INSERT INTO Compra VALUES(cod_compra, COD_FORN, CURRENT_TIMESTAMP, quantidade * preco_unitario);
					INSERT INTO ItemCompra VALUES(cod_compra, COD_ESTOQUE, quantidade, quantidade * preco_unitario, preco_unitario);
					UPDATE Estoque SET quant_estq = quant_estq + quantidade WHERE empId = COD_EMP AND prodId = COD_PROD;
				END IF;
			END IF;
		ELSE -- SE O PRODUTO NÃO EXISTE NA TABELA PRODUTO
			INSERT INTO Produto (nome_prod) VALUES (nome_produto);
			SELECT id_prod INTO COD_PROD FROM Produto WHERE nome_prod = nome_produto;
			INSERT INTO Estoque VALUES (DEFAULT, COD_EMP, COD_PROD, preco_unitario, quantidade); -- CADASTRANDO PRODUTO NA EMPRESA
					SELECT id_estoque INTO COD_ESTOQUE FROM Estoque WHERE empId = COD_EMP AND prodId = COD_PROD;

			IF COMPRA_EXISTE(cod_compra) THEN
				UPDATE Compra SET valor_total_compra = valor_total_compra + (quantidade * preco_unitario)
					WHERE id_compra = cod_compra;
				IF ITEM_COMPRA_EXISTE(cod_compra, COD_ESTOQUE) THEN
					UPDATE ItemCompra SET qtdComprada = qtdComprada + quantidade, 
						valor_total_item_c = valor_total_item_c + (quantidade * preco_unitario)
						WHERE compraId = cod_compra AND estoqueId = COD_ESTOQUE;
				ELSE
					INSERT INTO ItemCompra VALUES(cod_compra, COD_ESTOQUE, quantidade, quantidade * preco_unitario, preco_unitario);
				END IF;
				UPDATE Estoque SET quant_estq = quant_estq + quantidade WHERE empId = COD_EMP AND prodId = COD_PROD;
			ELSE 
				INSERT INTO Compra VALUES(cod_compra, COD_FORN, CURRENT_TIMESTAMP, quantidade * preco_unitario);
				INSERT INTO ItemCompra VALUES(cod_compra, COD_ESTOQUE, quantidade, quantidade * preco_unitario, preco_unitario);
				UPDATE Estoque SET quant_estq = quant_estq + quantidade WHERE empId = COD_EMP AND prodId = COD_PROD;
			END IF;
		END IF;
	else
		RAISE EXCEPTION 'FORNECEDOR NÃO CADASTRADO!';
	END IF;
END;
$$ LANGUAGE plpgsql;




----------------------------PRODUTO EXISTE?-------------------------------------------------

CREATE OR REPLACE FUNCTION PRODUTO_EXISTE(N_PRODUTO VARCHAR(25))
RETURNS BOOLEAN AS $$
DECLARE 
	PRODUTO_EXISTE BOOLEAN;
BEGIN
	SELECT EXISTS(
		SELECT * FROM PRODUTO
		WHERE NOME_PROD = N_PRODUTO
	) INTO PRODUTO_EXISTE;
	
	RETURN PRODUTO_EXISTE;
END;
$$ LANGUAGE plpgsql;

--------------------------PRODUTO EXISTE NA EMPRESA?------------------------------------------
CREATE OR REPLACE FUNCTION PRODUTO_EXISTE_NA_EMPRESA(COD_PROD INT, COD_EMP INT)
RETURNS BOOLEAN AS $$
DECLARE 
	PRODUTO_PERTENCE_EMPRESA BOOLEAN;
BEGIN
	SELECT EXISTS (
		SELECT * FROM ESTOQUE 
		WHERE EMPID = COD_EMP AND PRODID = COD_PROD
	) INTO PRODUTO_PERTENCE_EMPRESA;
	
	RETURN PRODUTO_PERTENCE_EMPRESA;
END;
$$ LANGUAGE plpgsql;

/*
=====================================================================================================
									TRIGGERS
=====================================================================================================
*/


-----------------------VALIDAR VENDA------------------------------------
/*CREATE OR REPLACE FUNCTION T_VALIDAR_VENDA()
RETURNS TRIGGER AS $$
BEGIN
	PERFORM CLIENTE_EXISTE(NEW.CLI)
	PERFORM PRODUTO_EXISTE(NEW.CLI)
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER TRIGGER_VALIDAR_VENDA
BEFORE INSERT OR UPDATE ON VENDA
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_VENDA()*/


----------------------- VALIDAR CLIENTE --------------------------------
		
CREATE OR REPLACE FUNCTION T_VALIDAR_CLIENTE()
RETURNS TRIGGER AS $$
DECLARE
	COD_EMP INT;
BEGIN
	SELECT id_emp INTO COD_EMP FROM empresa WHERE nome_emp = current_user;
	IF VERIFICAR_CLIENTE_EMPRESA(NEW.cpf, COD_EMP) THEN
		RAISE EXCEPTION 'O CLIENTE JÁ FOI CADASTRADO!';
	ELSE
		PERFORM VALIDAR_EMAIL(NEW.email_cli);
		PERFORM VALIDAR_TELEFONE(NEW.telefone);
		PERFORM VALIDAR_CEP(NEW.cep_cli);
		PERFORM VALIDAR_CPF(NEW.cpf);
		RETURN NEW;
	END IF;
END;
$$ LANGUAGE 'plpgsql';




CREATE TRIGGER TRIGGER_VALIDAR_CLIENTE 
BEFORE INSERT OR UPDATE ON CLIENTE
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_CLIENTE();

--drop trigger trigger_validar_cliente on cliente


-------------------------------------------------------------------------
--VALIDAR SE EMAIL, TELEFONE, CEP E CPF/CNPJ SEGUEM O PADRÃO CORRETO
---------------------- VALIDAR FORNECEDOR -------------------------------
SELECT CURRENT_USER;

CREATE OR REPLACE FUNCTION T_VALIDAR_FORNECEDOR()
RETURNS TRIGGER AS $$
	DECLARE
		COD_EMP INT;
	BEGIN
	SELECT id_emp INTO COD_EMP FROM empresa WHERE nome_emp = current_user;
	IF VERIFICAR_FORNECEDOR_EMPRESA(NEW.cpf_fn, COD_EMP) THEN
		RAISE EXCEPTION 'O FORNECEDOR JÁ FOI CADASTRADO!';
	ELSE
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
	END IF;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER TRIGGER_VALIDAR_FORNECEDOR
BEFORE INSERT OR UPDATE ON FORNECEDOR
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_FORNECEDOR();


---------------------------VALIDAR ----------------------------------------




-------------------------------------------------------------------------
--VALIDAR SE EMAIL, CPF/CNPJ SEGUEM O PADRÃO CORRETO
---------------------- VALIDAR EMPRESA-------------------------------

CREATE OR REPLACE FUNCTION T_VALIDAR_CREDENCIAIS_EMPRESA()
RETURNS TRIGGER AS $$
	BEGIN
		PERFORM VALIDAR_EMAIL(NEW.EMAIL_EMP);
		
		IF VERIFICAR_CNPJ_CPF(NEW.CPF) THEN
			PERFORM VALIDAR_CNPJ(NEW.CPF);
		ELSEIF VERIFICAR_CNPJ_CPF(NEW.CPF) = FALSE THEN
			PERFORM VALIDAR_CPF(NEW.CPF);
		ELSE
			RAISE EXCEPTION 'O VALOR INFORMADO É INVÁLIDO.';
		END IF;
		
		RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER TRIGGER_VALIDAR_CREDENCIAIS_EMPRESA
BEFORE INSERT OR UPDATE ON EMPRESA
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_CREDENCIAIS_EMPRESA();



-------------------------PROIBIR QUANT_PARCELAS_FALTA FICAR < 0-----------------------------------


-------------------------PROIBIR DELETAR CLIENTE-------------------------------------------------

CREATE OR REPLACE FUNCTION T_BLOQUEAR_DELETE_CLIENTE()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' AND TG_TABLE_NAME = 'CLIENTE' THEN
        RAISE EXCEPTION 'NÃO É PERMITIDO EXCUIR CLIENTES!';
    END IF;

    -- Retorna o resultado do gatilho
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRIGGER_BLOQUEAR_DELETE_CLIENTE
BEFORE DELETE ON CLIENTE
FOR EACH ROW
EXECUTE FUNCTION T_BLOQUEAR_DELETE_CLIENTE();



-------------------------PROIBIR DELETAR FORNECEDOR-------------------------------------------------

CREATE OR REPLACE FUNCTION T_BLOQUEAR_DELETE_FORNECEDOR()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' AND TG_TABLE_NAME = 'FORNECEDOR' THEN
        RAISE EXCEPTION 'NÃO É PERMITIDO EXCUIR UM FORNECEDOR!';
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TRIGGER_BLOQUEAR_DELETE_FORNECEDOR
BEFORE DELETE ON FORNECEDOR
FOR EACH ROW
EXECUTE FUNCTION T_BLOQUEAR_DELETE_FORNECEDOR();



------------------------------------VALIDAR SENHA EMPRESA---------------------------------------------
CREATE OR REPLACE FUNCTION T_VALIDAR_SENHA_EMPRESA()
    RETURNS TRIGGER AS $$
BEGIN
    IF LENGTH(NEW.senha_emp) < 4 THEN
        RAISE EXCEPTION 'A senha da empresa deve ter no mínimo 4 caracteres.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER validar_senha_empresa_trigger
BEFORE INSERT OR UPDATE ON empresa
FOR EACH ROW
EXECUTE FUNCTION  T_VALIDAR_SENHA_EMPRESA();


-------------------------------VALIDAR SE EMPRESA JÁ EXISTE---------------------------------------------
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

CREATE TRIGGER TRIGGER_VALIDAR_NOME_EMPRESA
BEFORE INSERT OR UPDATE ON empresa
FOR EACH ROW
EXECUTE FUNCTION T_VALIDAR_NOME_EMPRESA();


/*
==============================================================================================================
								 CRIAR USER DA EMPRESA
							CADASTROS - FORNECEDOR, CLIENTE
=============================================================================================================
*/
/*----------------------------
	CADASTRAR EMPRESA
*/----------------------------
SELECT * FROM CADASTRAR_EMPRESA('empresa2', 'empresa2@gmail.com', '1234', '653.254.460-45');
SELECT * FROM CADASTRAR_EMPRESA('empresa3', 'empresa3@gmail.com', '1234', '455.797.320-58');
SELECT * FROM CADASTRAR_EMPRESA('empresa4', 'empresa4@gmail.com', '1234', '174.570.640-28');
SELECT * FROM CADASTRAR_EMPRESA('empresa5', 'empresa5@gmail.com', '1234', '303.862.960-06');
SELECT * FROM CADASTRAR_EMPRESA('empresa6', 'empresa6@gmail.com', '1234', '528.934.630-96');

SELECT * FROM EMPRESA
-- Cria uma role estática para os usuários da empresa
CREATE ROLE empresa_users;
--SELECT rolname FROM pg_roles; ->verificar roles existentes

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



SELECT * FROM EMPRESA

SELECT usename FROM pg_user
DROP USER empresa1

SELECT usename, usesuper, usecreatedb, usesysid FROM pg_user WHERE usename = 'empresa1';


/*----------------------------
	CADASTRAR CLIENTE
*/----------------------------

CREATE OR REPLACE FUNCTION CADASTRAR_CLIENTE(
	nome_cli VARCHAR(40),
	CPF_CLI VARCHAR(15),
	bairro_cli VARCHAR(15),
	num_cli VARCHAR(12),
	logradouro_cli VARCHAR(25),
	cep_cli VARCHAR(11),
	cidade_cli VARCHAR(20),
	email_cli VARCHAR(25),
	telefone VARCHAR(15)
)
RETURNS void AS
$$
BEGIN
	--tem um trigger para verificar se o cliente já não foi cadastrado na empresa
	INSERT INTO CLIENTE VALUES 
	(DEFAULT, nome_cli, cpf_cli, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli, email_cli, telefone, (SELECT id_emp FROM empresa WHERE nome_emp = CURRENT_USER));
	RAISE NOTICE 'CLIENTE CADASTRADO COM SUCESSO!';
END;
$$
LANGUAGE 'plpgsql';


SELECT * FROM CADASTRAR_CLIENTE('John Doe', '079.586.023-40', 'Street 1', '123', 'rua200', '64380-000', 'City', 'doezin@hotmail.com', '86 995120059', 3);
SELECT * FROM CADASTRAR_CLIENTE('Abreu', '577.379.240-00', 'Street 2', '321', 'rua202', '64380-000', 'City1', 'abreu@hotmail.com', '86 995120059');
SELECT * FROM CLIENTE
delete from cliente where id_cli = 21


/*----------------------------
	CADASTRAR FORNECEDOR
*/----------------------------
DROP FUNCTION cadastrar_FORNECEDOR(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR);
CREATE OR REPLACE FUNCTION CADASTRAR_FORNECEDOR(
	nome_fn           VARCHAR(40),
  	bairro_fn         VARCHAR(20),
  	num_fn            VARCHAR(13),
  	logradouro_fn     VARCHAR(15),
  	cep_fn            VARCHAR(13),
  	cidade_fn         VARCHAR(20),
	telefone_fn		  VARCHAR(15),
	cpf_forn		  VARCHAR(15),
	email_fn		  VARCHAR(25)
)
RETURNS void AS
$$
DECLARE 
	COD_FORN INT;
BEGIN
		--EXISTE UM TRIGGER PARA TRATAR SE O FORNECEDOR JA FOI CADASTRADO NA EMPRESA
		INSERT INTO FORNECEDOR VALUES
		(DEFAULT, nome_fn, bairro_fn, num_fn, logradouro_fn, cep_fn, cidade_fn, telefone_fn, cpf_forn, email_fn, (SELECT id_emp FROM empresa WHERE nome_emp = CURRENT_USER));
		 RAISE NOTICE 'FORNECEDOR CADASTRADO COM SUCESSO!';
END;
$$
LANGUAGE 'plpgsql';

SELECT * FROM CADASTRAR_FORNECEDOR('Fornecedor A', 'Centro', '123', 'Rua Principal', '12345-678', 'São Paulo', '11123456789', '123.456.789-00', 'fornecedorA@example.com');
SELECT * FROM CADASTRAR_FORNECEDOR('Fornecedor B', 'Bairro A', '789', 'Avenida Dois', '98765-432', 'Teresina', '21987654321', '987.654.321-00', 'fornecedorB@example.com');
SELECT * FROM CADASTRAR_FORNECEDOR('Fornecedor C', 'Bairro B', '321', 'Rua Alternativa', '12345-678', 'Curitiba', '41123456789', '555.666.777-88', 'fornecedorC@example.com');
SELECT * FROM FORNECEDOR;
delete from fornecedor where id_fn = 16



/*-------------------------------
		TESTES
*/-------------------------------
--FUNÇÃO GENÉRICA PARA CADASTRAR

CREATE OR REPLACE FUNCTION cadastrar(tabela_name TEXT, variadic valores TEXT[])
RETURNS VOID AS $$
DECLARE
  colunas TEXT;
BEGIN
  EXECUTE format('INSERT INTO %I VALUES (%s)',
    tabela_name,
    array_to_string(valores, ', ')
  );
END;
$$ LANGUAGE plpgsql; 

select * from cliente
SELECT cadastrar('CLIENTE', 'Maria', '545.718.790-08', 'Centro', '456', 'Rua Principal', '54321-098', 'São Paulo', 'maria@example.com', '86995002359');


/*---------------------------------------
	TRIGGER VALIDAR CADASTRO DO CLIENTE
*/---------------------------------------



select * from empresa3.cadastrar_fornecedor('Fornecedor C', 'Bairro B', '321', 'Rua Alternativa', '12345-678', 'Curitiba', '41123456789', '555.666.777-88', 'fornecedorC@example.com')





