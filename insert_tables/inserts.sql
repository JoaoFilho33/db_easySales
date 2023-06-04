
------------------------------------------------------------------------------------------
--INSERT
------------------------------------------------------------------------------------------
-- Inserção de clientes
INSERT INTO cliente (nome_cli, cpf, rua_cli, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli)
VALUES ('João da Silva', '12345678901', 'Rua A', 'Bairro 1', '123', 'Logradouro A', '12345-678', 'Cidade A');

INSERT INTO cliente (nome_cli, cpf, rua_cli, bairro_cli, num_cli, logradouro_cli, cep_cli, cidade_cli)
VALUES ('Maria Oliveira', '98765432101', 'Rua B', 'Bairro 2', '456', 'Logradouro B', '98765-432', 'Cidade B');

-- Inserção de fornecedores
INSERT INTO fornecedor (nome_fornecedor, rua_fornecedor, bairro_fornecedor, num_fornecedor, logradouro_fornecedor, cep_fornecedor, cidade_fornecedor)
VALUES ('Fornecedor A', 'Rua X', 'Bairro X', '789', 'Logradouro X', '56789-012', 'Cidade X');

INSERT INTO fornecedor (nome_fornecedor, rua_fornecedor, bairro_fornecedor, num_fornecedor, logradouro_fornecedor, cep_fornecedor, cidade_fornecedor)
VALUES ('Fornecedor B', 'Rua Y', 'Bairro Y', '321', 'Logradouro Y', '01234-567', 'Cidade Y');

-- Inserção de produtos
INSERT INTO produto (nome_prod)
VALUES ('Produto 1');

INSERT INTO produto (nome_prod)
VALUES ('Produto 2');

-- Inserção de empresas
INSERT INTO empresa (nome_empresa, email, senha)
VALUES ('Empresa 1', 'empresa1@example.com', 'senha123');

INSERT INTO empresa (nome_empresa, email, senha)
VALUES ('Empresa 2', 'empresa2@example.com', 'senha456');

-- Inserção de estoques
INSERT INTO estoque (id_estoque)
VALUES (uuid_generate_v4());

INSERT INTO estoque (id_estoque)
VALUES (uuid_generate_v4());

-- Inserção de compras
INSERT INTO compra (data_compra, valor_total_compra, fornecedor_id)
VALUES (CURRENT_TIMESTAMP, 100.50, (SELECT id_fornecedor FROM fornecedor LIMIT 1));

INSERT INTO compra (data_compra, valor_total_compra, fornecedor_id)
VALUES (CURRENT_TIMESTAMP, 200.75, (SELECT id_fornecedor FROM fornecedor LIMIT 1));

-- Inserção de vendas
INSERT INTO venda (cli_venda_id, valor_total_venda, dt_pagamento, quantidade_parcelas)
VALUES ((SELECT id_cli FROM cliente LIMIT 1), 150.25, CURRENT_TIMESTAMP, 1);

INSERT INTO venda (cli_venda_id, valor_total_venda, dt_pagamento, quantidade_parcelas)
VALUES ((SELECT id_cli FROM cliente LIMIT 1), 300.50, CURRENT_TIMESTAMP, 2);

-- Inserção de itens de compra
INSERT INTO item_compra (compra_id, estoque_id, qtdComprada, valor_unitario_compra, dt_compra)
VALUES ((SELECT id_compra FROM compra LIMIT 1), (SELECT id_estoque FROM estoque LIMIT 1), 10, 15.99, CURRENT_TIMESTAMP);

INSERT INTO item_compra (compra_id, estoque_id, qtdComprada, valor_unitario_compra, dt_compra)
VALUES ((SELECT id_compra FROM compra LIMIT 1), (SELECT id_estoque FROM estoque LIMIT 1), 5, 12.99, CURRENT_TIMESTAMP);




SELECT * FROM VENDA

