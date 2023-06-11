/*---------------------------------------------------
			REALIZAR Compra                     
*/----------------------------------------------------

CREATE FUNCTION realizar_compra(
    nome_fornecedor VARCHAR(40),
    nome_empresa VARCHAR(15),
    quantidade INT,
    preco_unitario FLOAT
) RETURNS VOID AS $$
DECLARE
    fornecedor_id INT;
    empresa_id INT;
    produto_id INT;
    estoque_id INT;
    valor_total FLOAT;
BEGIN
    -- Obter o ID do fornecedor com base no nome
    SELECT id_fn INTO fornecedor_id FROM Fornecedor WHERE nome_fn = nome_fornecedor;
    
    -- Obter o ID da empresa com base no nome
    SELECT id_emp INTO empresa_id FROM Empresa WHERE nome_emp = nome_empresa;
    
    -- Criar uma nova compra
    INSERT INTO Compra (fn_compra_id, dt_compra, valor_total_compra)
    VALUES (fornecedor_id, NOW(), 0)
    RETURNING id_compra INTO estoque_id;
    
    -- Atualizar o ID do estoque para referenciar a nova compra
    UPDATE Estoque SET empId = empresa_id WHERE id_estoque = estoque_id;
    
    -- Inserir o item de compra associado ao estoque
    INSERT INTO ItemCompra (compraId, estoqueId, qtdComprada, valor_total_item_c, preco_prod_c)
    VALUES (estoque_id, estoque_id, quantidade, quantidade * preco_unitario, preco_unitario);
    
    -- Calcular o valor total da compra
    SELECT SUM(valor_total_item_c) INTO valor_total FROM ItemCompra WHERE compraId = estoque_id;
    
    -- Atualizar o valor total da compra
    UPDATE Compra SET valor_total_compra = valor_total WHERE id_compra = estoque_id;
    
    -- Atualizar a quantidade no estoque
    UPDATE Estoque SET quant_estq = quant_estq + quantidade WHERE id_estoque = estoque_id;
END;
$$ LANGUAGE plpgsql;


CREATE  OR REPLACE FUNCTION T_VALIDAR_COMPRA()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM FORNECEDOR_EXIST()
    PERFORM EMPRESA_EXISTE()

END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER TRIGGER_VALIDAR_COMPRA
BEFORE INSERT OR UPDATE ON COMPRA
FOR EACH ROW
EXECUTE PROCEDURE T_VALIDAR_COMPRA()