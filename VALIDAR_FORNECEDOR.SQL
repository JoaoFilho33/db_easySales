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



--EXEMPLO DE VALUES
SELECT * FROM CADASTRAR_FORNECEDOR('Nome do Fornecedor', 'Bairro do Fornecedor', '123', 'Logradouro1','64380-000', 'Cidade do Fornecedor', '86 995120059', '268442820001-05', 'emailforn@example.com');

