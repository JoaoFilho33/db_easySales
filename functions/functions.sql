/*
    VALIDAR CPF
*/

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
    IF cpf_limpo = repeat(cpf_limpo[1], 11) THEN
		RAISE EXCEPTION 'TODOS OS DIGITOS SÃO IGUAIS';
	END IF;
    
    -- Cálculo do primeiro dígito verificador
    FOR i IN 1..9 LOOP
        soma1 := soma1 + CAST(cpf_limpo[i] AS INT) * multiplicador;
        multiplicador := multiplicador - 1;
    END LOOP;
    
    digito1 := (soma1 * 10) % 11;
    IF digito1 = 10 THEN
        digito1 := 0;
    END IF;
    
    -- Cálculo do segundo dígito verificador
    multiplicador := 11;
    FOR i IN 1..10 LOOP
        soma2 := soma2 + CAST(cpf_limpo[i] AS INT) * multiplicador;
        multiplicador := multiplicador - 1;
    END LOOP;
    
    digito2 := (soma2 * 10) % 11;
    IF digito2 = 10 THEN
        digito2 := 0;
    END IF;
    
    -- Verificar se os dígitos verificadores são válidos
    IF digito1 = CAST(cpf_limpo[10] AS INT) AND digito2 = CAST(cpf_limpo[11] AS INT) THEN
        RAISE LOG 'CPF VÁLIDO';
	END IF;

    RAISE EXCEPTION 'CPF INVÁLIDO. DÍGITOS VERIFICADORES INCORRETOS!';
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
    IF cnpj_limpo = repeat(cnpj_limpo[1], 14) THEN
        RAISE EXCEPTION 'TODOS OS DÍGITOS DO CNPJ SÃO IGUAIS!';
    END IF;
    
    -- Cálculo do primeiro dígito verificador
    FOR i IN 1..12 LOOP
        soma1 := soma1 + CAST(cnpj_limpo[i] AS INT) * multiplicador1[i];
    END LOOP;
    
    resto := soma1 % 11;
    
    IF resto < 2 THEN
        digito1 := 0;
    ELSE
        digito1 := 11 - resto;
    END IF;
    
    -- Cálculo do segundo dígito verificador
    FOR i IN 1..13 LOOP
        soma2 := soma2 + CAST(cnpj_limpo[i] AS INT) * multiplicador2[i];
    END LOOP;
    
    resto := soma2 % 11;
    
    IF resto < 2 THEN
        digito2 := 0;
    ELSE
        digito2 := 11 - resto;
    END IF;
    
    -- Verificar se os dígitos verificadores são válidos
    IF digito1 = CAST(cnpj_limpo[13] AS INT) AND digito2 = CAST(cnpj_limpo[14] AS INT) THEN
        RAISE LOG 'CNPJ VÁLIDO!';
    ELSE
        RAISE EXCEPTION 'CNPJ INVÁLIDO!';
    END IF;
END;
$$ LANGUAGE plpgsql;



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
$$ LANGUAGE plpgsql;    


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
$$ LANGUAGE plpgsql;


/*----------------------------
	VALIDAR EMAIL
*/----------------------------
CREATE OR REPLACE FUNCTION validar_email(email TEXT)
RETURNS VOID AS $$
BEGIN
    -- Verificar se o email tem pelo menos um @ e um ponto após o @
    IF position('@' IN email) = 0 OR position('.' IN substring(email, position('@' IN email))) = 0 THEN
        RAISE EXCEPTION 'EMAIL INVÁLIDO'
    END IF;
    
    -- Verificar se o email não começa ou termina com um ponto
    IF email LIKE '.%' OR email LIKE '%.' THEN
		RAISE EXCEPTION 'EMAIL INVÁLIDO'
	END IF;
    
    -- Verificar se o email não contém espaços em branco
    IF position(' ' IN email) <> 0 THEN
		RAISE EXCEPTION 'EMAIL INVÁLIDO'
	END IF;   
END;
$$ LANGUAGE plpgsql;


/*----------------------------
	VALIDAR CEP
*/----------------------------
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
$$ LANGUAGE plpgsql;

