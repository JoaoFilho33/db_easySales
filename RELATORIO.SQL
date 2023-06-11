--  RELATÓRIOS VENDAS
    -- PENDENTES 
SELECT V.CLI_VENDA_ID, V.VALOR_TOTAL_VENDA, V.dt_venda  , V.qtd_itens, V.qtd_parcelas
FROM Venda V
LEFT JOIN ItemVenda IV ON V.cli_venda_id = IV.vendaId
WHERE IV.valor_total_item_v > 0
AND IV.valor_total_item_v < V.valor_total_venda

    -- QUITADAS
SELECT V.ID_VENDA, C.NOME_CLI, V.VALOR_TOTAL_VENDA, V.DT_VENDA
FROM Venda v
JOIN Cliente c ON v.cli_venda_id = c.id_cli
WHERE V.QTD_PARCELAS_FALTA = 0 OR V.QTD_PARCELAS_FALTA IS NULL;

    -- EFETUADAS
SELECT V.cli_venda_id, V.valor_total_venda, V.dt_venda, V.qtd_itens, V.qtd_parcelas
FROM Venda V
LEFT JOIN ItemVenda IV ON V.cli_venda_id = IV.vendaId


-- RELATÓRIO COMPRA
    -- COMPRAS EFETUADAS
SELECT c.id_compra, f.nome_fn AS fornecedor, c.dt_compra, c.valor_total_compra
FROM Compra c
INNER JOIN Fornecedor f ON c.fn_compra_id = f.id_fn;



-- RELATÓRIO PRODUTOS
    --status do produto (se está em falta)
SELECT p.id_prod, p.nome_prod,
    CASE
        WHEN e.quant_estq > 0 THEN 'Disponível'
        ELSE 'Em falta'
    END AS status_produto
FROM Produto p
INNER JOIN Estoque e ON p.id_prod = e.prodId;


--VERIFICAR DISPONIBILIDADE DO PRODUTO (SE TEM ESTOQUE OU NÃO)
SELECT p.id_prod, p.nome_prod,
    CASE
        WHEN e.quant_estq > 0 THEN 'Disponível'
        ELSE 'Sem estoque'
    END AS disponibilidade
FROM Produto p 
INNER JOIN Estoque e ON p.id_prod = e.prodId;

--VERIFICAR PRODUTOS SEM ESTOQUE (ISSO PODE MUDAR PARA SER UM ALERTA, SE ELE ESTÁ SEM ESTOQUE, ALERTE)

SELECT p.id_prod, p.nome_prod
FROM Produto p
INNER JOIN Estoque e ON p.id_prod = e.prodId
WHERE
    e.prodId IS NULL OR e.quant_estq = 0;
