-- QUERYES
-- --  RELATÓRIOS VENDAS
--     -- PENDENTES 
-- SELECT V.CLI_VENDA_ID, V.VALOR_TOTAL_VENDA, V.dt_venda  , V.qtd_itens, V.qtd_parcelas
-- FROM Venda V
-- LEFT JOIN ItemVenda IV ON V.cli_venda_id = IV.vendaId
-- WHERE IV.valor_total_item_v > 0
-- AND IV.valor_total_item_v < V.valor_total_venda

--     -- QUITADAS
-- SELECT V.ID_VENDA, C.NOME_CLI, V.VALOR_TOTAL_VENDA, V.DT_VENDA
-- FROM Venda v
-- JOIN Cliente c ON v.cli_venda_id = c.id_cli
-- WHERE V.QTD_PARCELAS_FALTA = 0 OR V.QTD_PARCELAS_FALTA IS NULL;

--     -- EFETUADAS
-- SELECT V.cli_venda_id, V.valor_total_venda, V.dt_venda, V.qtd_itens, V.qtd_parcelas
-- FROM Venda V
-- LEFT JOIN ItemVenda IV ON V.cli_venda_id = IV.vendaId


-- -- RELATÓRIO COMPRA
--     -- COMPRAS EFETUADAS
-- SELECT c.id_compra, f.nome_fn AS fornecedor, c.dt_compra, c.valor_total_compra
-- FROM Compra c
-- INNER JOIN Fornecedor f ON c.fn_compra_id = f.id_fn;

-- -- RELATÓRIO PRODUTOS
--     --status do produto (se está em falta)
-- SELECT p.id_prod, p.nome_prod,
--     CASE
--         WHEN e.quant_estq > 0 THEN 'Disponível'
--         ELSE 'Em falta'
--     END AS status_produto
-- FROM Produto p
-- INNER JOIN Estoque e ON p.id_prod = e.prodId;


-- --VERIFICAR DISPONIBILIDADE DO PRODUTO (SE TEM ESTOQUE OU NÃO)
-- SELECT p.id_prod, p.nome_prod,
--     CASE
--         WHEN e.quant_estq > 0 THEN 'Disponível'
--         ELSE 'Sem estoque'
--     END AS disponibilidade
-- FROM Produto p 
-- INNER JOIN Estoque e ON p.id_prod = e.prodId;

-- --VERIFICAR PRODUTOS SEM ESTOQUE (ISSO PODE MUDAR PARA SER UM ALERTA, SE ELE ESTÁ SEM ESTOQUE, ALERTE)

-- SELECT p.id_prod, p.nome_prod
-- FROM Produto p
-- INNER JOIN Estoque e ON p.id_prod = e.prodId
-- WHERE
--     e.prodId IS NULL OR e.quant_estq = 0;

--FUNÇÕES 

--  Relatório de vendas pendentes
CREATE FUNCTION relatorio_vendas_pendentes() RETURNS TABLE (cli_venda_id INT, valor_total_venda DECIMAL, dt_venda DATE, qtd_itens INT, qtd_parcelas INT) AS $$
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
CREATE FUNCTION relatorio_vendas_quitadas() RETURNS TABLE (id_venda INT, nome_cli VARCHAR, valor_total_venda DECIMAL, dt_venda DATE) AS $$
BEGIN
    RETURN QUERY
    SELECT V.ID_VENDA, C.NOME_CLI, V.VALOR_TOTAL_VENDA, V.DT_VENDA
    FROM Venda V
    JOIN Cliente C ON V.cli_venda_id = C.id_cli
    WHERE V.QTD_PARCELAS_FALTA = 0 OR V.QTD_PARCELAS_FALTA IS NULL;
END;
$$ LANGUAGE plpgsql;

--  Relatório de vendas efetuadas
CREATE FUNCTION relatorio_vendas_efetuadas() RETURNS TABLE (cli_venda_id INT, valor_total_venda DECIMAL, dt_venda DATE, qtd_itens INT, qtd_parcelas INT) AS $$
BEGIN
    RETURN QUERY
    SELECT V.cli_venda_id, V.valor_total_venda, V.dt_venda, V.qtd_itens, V.qtd_parcelas
    FROM Venda V
    LEFT JOIN ItemVenda IV ON V.cli_venda_id = IV.vendaId;
END;
$$ LANGUAGE plpgsql;


--  Relatório de compras efetuadas
CREATE FUNCTION relatorio_compras_efetuadas() RETURNS TABLE (id_compra INT, fornecedor VARCHAR, dt_compra DATE, valor_total_compra DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT C.id_compra, F.nome_fn AS fornecedor, C.dt_compra, C.valor_total_compra
    FROM Compra C
    INNER JOIN Fornecedor F ON C.fn_compra_id = F.id_fn;
END;
$$ LANGUAGE plpgsql;


--  Relatório de status do produto
CREATE FUNCTION relatorio_status_produto() RETURNS TABLE (id_prod INT, nome_prod VARCHAR, status_produto VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT P.id_prod, P.nome_prod,
        CASE
            WHEN E.quant_estq > 0 THEN 'Disponível'
            ELSE 'Em falta'
        END AS status_produto
    FROM Produto P
    INNER JOIN Estoque E ON P.id_prod = E.prodId;
END;
$$ LANGUAGE plpgsql;

--  Verificar disponibilidade do produto
CREATE FUNCTION verificar_disponibilidade_produto() RETURNS TABLE (id_prod INT, nome_prod VARCHAR, disponibilidade VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT P.id_prod, P.nome_prod,
        CASE
            WHEN E.quant_estq > 0 THEN 'Disponível'
            ELSE 'Sem estoque'
        END AS disponibilidade
    FROM Produto P
    INNER JOIN Estoque E ON P.id_prod = E.prodId;
END;
$$ LANGUAGE plpgsql;


--  Verificar produtos sem estoque
CREATE FUNCTION verificar_produtos_sem_estoque() RETURNS TABLE (id_prod INT, nome_prod VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT P.id_prod, P.nome_prod
    FROM Produto P
    INNER JOIN Estoque E ON P.id_prod = E.prodId
    WHERE E.prodId IS NULL OR E.quant_estq = 0;
END;
$$ LANGUAGE plpgsql;
