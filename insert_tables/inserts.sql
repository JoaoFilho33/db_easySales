
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

-- Inserção de clientes
INSERT INTO Cliente (nome_cli, cpf, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli, email_cli)
VALUES ('Maria Santos', '987.654.321-00', 'Centro', '456', 'Rua Principal', '54321-098', 'São Paulo', 'maria@example.com');

INSERT INTO Cliente (nome_cli, cpf, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli, email_cli)
VALUES ('Pedro Oliveira', '111.222.333-44', 'Bairro A', '789', 'Avenida Secundária', '98765-432', 'Rio de Janeiro', 'pedro@example.com');

INSERT INTO Cliente (nome_cli, cpf, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli, email_cli)
VALUES ('Ana Silva', '555.666.777-88', 'Bairro B', '321', 'Rua Alternativa', '12345-678', 'Curitiba', 'ana@example.com');

-- Inserção de fornecedores
INSERT INTO Fornecedor (nome_fn, bairro_fn, num_fn, logradouro_fn, cep_fn, cidade_fn, telefone_fn, cpf_fn, email_fn)
VALUES ('Fornecedor A', 'Centro', '123', 'Rua Principal', '12345-678', 'São Paulo', '(11) 12345-6789', '123.456.789-00', 'fornecedorA@example.com');

INSERT INTO Fornecedor (nome_fn, bairro_fn, num_fn, logradouro_fn, cep_fn, cidade_fn, telefone_fn, cpf_fn, email_fn)
VALUES ('Fornecedor B', 'Bairro A', '789', 'Avenida Secundária', '98765-432', 'Rio de Janeiro', '(21) 98765-4321', '987.654.321-00', 'fornecedorB@example.com');

INSERT INTO Fornecedor (nome_fn, bairro_fn, num_fn, logradouro_fn, cep_fn, cidade_fn, telefone_fn, cpf_fn, email_fn)
VALUES ('Fornecedor C', 'Bairro B', '321', 'Rua Alternativa', '12345-678', 'Curitiba', '(41) 12345-6789', '555.666.777-88', 'fornecedorC@example.com');

-- Inserção de compras
INSERT INTO Compra (fn_compra_id, dt_compra, valor_total_compra)
VALUES (1, CURRENT_TIMESTAMP, 1000.0);

INSERT INTO Compra (fn_compra_id, dt_compra, valor_total_compra)
VALUES (2, CURRENT_TIMESTAMP, 1500.0);

INSERT INTO Compra (fn_compra_id, dt_compra, valor_total_compra)
VALUES (3, CURRENT_TIMESTAMP, 800.0);

-- Inserção de itens de compra
INSERT INTO ItemCompra (compraId, estoqueId, qtdComprada, valor_total_item_c, preco_prod_c)
VALUES (1, 1, 5, 500.0, 100.0);

INSERT INTO ItemCompra (compraId, estoqueId, qtdComprada, valor_total_item_c, preco_prod_c)
VALUES (2, 2, 10, 1000.0, 100.0);

INSERT INTO ItemCompra (compraId, estoqueId, qtdComprada, valor_total_item_c, preco_prod_c)
VALUES (3, 3, 4, 320.0, 80.0);

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




