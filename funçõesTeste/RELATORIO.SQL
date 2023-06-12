--FUNÇÕES 
--  Relatório de vendas pendentes
select * from relatorio_vendas_pendentes();
DROP FUNCTION relatorio_vendas_pendentes
--  Relatório de vendas pendentes
CREATE FUNCTION relatorio_vendas_pendentes() RETURNS TABLE (cli_venda_id INT, valor_total_venda REAL, dt_venda TIMESTAMPTZ, qtd_itens INT, qtd_parcelas INT) AS $$
BEGIN
    RETURN QUERY
    SELECT V.CLI_VENDA_ID, V.VALOR_TOTAL_VENDA, V.dt_venda, V.qtd_itens, V.qtd_parcelas
    FROM Venda V
    LEFT JOIN ItemVenda IV ON V.cli_venda_id = IV.vendaId
    WHERE IV.valor_total_item_v > 0
    AND IV.valor_total_item_v < V.valor_total_venda;
END;
$$ LANGUAGE plpgsql;

--  Relatório de vendas quitadas
SELECT * FROM relatorio_vendas_quitadas();
CREATE FUNCTION relatorio_vendas_quitadas() RETURNS TABLE (id_venda INT, nome_cli VARCHAR, valor_total_venda REAL, dt_venda TIMESTAMPTZ) AS $$
BEGIN
    RETURN QUERY
    SELECT V.ID_VENDA, C.NOME_CLI, V.VALOR_TOTAL_VENDA, V.DT_VENDA
    FROM Venda V
    JOIN Cliente C ON V.id_cli = C.id_cli
    WHERE V.QTD_PARCELAS_FALTA = 0 OR V.QTD_PARCELAS_FALTA IS NULL;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM relatorio_vendas_efetuadas();
drop function relatorio_vendas_efetuadas
--  Relatório de vendas efetuadas
CREATE FUNCTION relatorio_vendas_efetuadas() RETURNS TABLE (id_cli INT, valor_total_venda REAL, dt_venda TIMESTAMPTZ, qtd_itens INT, qtd_parcelas_total INT, qtd_parcelas_falta INT) AS $$
BEGIN
    RETURN QUERY
    SELECT V.id_cli, V.valor_total_venda, V.dt_venda, V.qtd_itens, V.qtd_parcelas_total, V.qtd_parcelas_falta
    FROM Venda V
    LEFT JOIN ItemVenda IV ON V.id_cli = IV.vendaId;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM relatorio_vendas_efetuadas(); 
--  Relatório de compras efetuadas
CREATE FUNCTION relatorio_compras_efetuadas() RETURNS TABLE (id_compra INT, fornecedor VARCHAR, dt_compra TIMESTAMPTZ, valor_total_compra FLOAT) AS $$
BEGIN
    RETURN QUERY
    SELECT C.id_compra, F.nome_fn AS fornecedor, C.dt_compra, C.valor_total_compra
    FROM Compra C
    INNER JOIN Fornecedor F ON C.fn_compra_id = F.id_fn;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM relatorio_status_produto();
DROP FUNCTION relatorio_status_produto
--  Relatório de status do produto
CREATE FUNCTION relatorio_status_produto() RETURNS TABLE (id_prod INT, nome_prod VARCHAR, status_produto VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT P.id_prod, P.nome_prod,
        COALESCE(NULLIF((E.quant_estq <= 0)::int, 1), 0)::VARCHAR(20) AS status_produto
    FROM Produto P
    INNER JOIN Estoque E ON P.id_prod = E.prodId;
END;
$$ LANGUAGE plpgsql;


--  Verificar disponibilidade do produto
select * from verificar_disponibilidade_produto();
drop function verificar_disponibilidade_produto
CREATE FUNCTION verificar_disponibilidade_produto() RETURNS TABLE (id_prod INT, nome_prod VARCHAR, disponibilidade VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT P.id_prod, P.nome_prod,
        COALESCE(NULLIF((E.quant_estq <= 0)::int, 1), 0)::VARCHAR(20) AS disponibilidade
    FROM Produto P
    INNER JOIN Estoque E ON P.id_prod = E.prodId;
END;
$$ LANGUAGE plpgsql;

--  Verificar produtos sem estoque
select * from verificar_produtos_sem_estoque();
CREATE FUNCTION verificar_produtos_sem_estoque() RETURNS TABLE (id_prod INT, nome_prod text) AS $$
BEGIN
    RETURN QUERY
    SELECT P.id_prod, P.nome_prod
    FROM Produto P
    INNER JOIN Estoque E ON P.id_prod = E.prodId
    WHERE E.prodId IS NULL OR E.quant_estq = 0;
END;
$$ LANGUAGE plpgsql;