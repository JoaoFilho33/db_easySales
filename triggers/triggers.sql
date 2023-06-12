-----------------------VALIDAR VENDA------------------------------------
CREATE OR REPLACE FUNCTION T_VALIDAR_VENDA()
RETURNS TRIGGER AS $$
BEGIN
	PERFORM CLIENTE_EXISTE()
	PERFORM PRODUTO_EXISTE(NEW.CLI)
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER TRIGGER_VALIDAR_VENDA
BEFORE INSERT OR UPDATE ON VENDA
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_VENDA()


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
		PERFORM VALIDAR_EMAIL(NEW.EMAIL);
		
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



-----------------------------------------------------------------------------------------------------
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


CREATE OR REPLACE TRIGGER validar_senha_empresa_trigger
BEFORE INSERT OR UPDATE ON empresa
FOR EACH ROW
EXECUTE FUNCTION  T_VALIDAR_SENHA_EMPRESA();


-----------------------------------------------------------------------------------------------------
------------------------------------VALIDAR NOME EMPRESA---------------------------------------------
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

