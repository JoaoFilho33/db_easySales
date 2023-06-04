CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tabela Cliente
CREATE TABLE Cliente (
  id_cli          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nome_cli        VARCHAR(40)NOT NULL,
  cpf             VARCHAR(15) NOT NULL,
  bairro_cli      VARCHAR(15) NOT NULL,
  num_cli         VARCHAR(12) NOT NULL,
  logradouro_cli  VARCHAR(25) NOT NULL,
  cep_cli         VARCHAR(11) NOT NULL,
  cidade_cli      VARCHAR(20) NOT NULL,
  compras         UUID[] REFERENCES Compra(id_compra) ON DELETE CASCADE
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
  	id_fn             UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
  	nome_fn           VARCHAR(40) NOT NULL,
  	bairro_fn         VARCHAR(20) NOT NULL,
  	num_fn            VARCHAR(13) NOT NULL,
  	logradouro_fn     VARCHAR(15) NOT NULL,
  	cep_fn            VARCHAR(13) NOT NULL,
  	cidade_fn         VARCHAR(20) NOT NULL,
	telefone_fn		  VARCHAR(15) NOT NULL,
);

-- Tabela Compra
CREATE TABLE Compra (
  id_compra               UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
  data_compra             TIMESTAMPTZ NOT NULL,
  valor_total_compra      FLOAT NOT NULL,
  fornecedorId            UUID REFERENCES Fornecedor(id_fn) NOT NULL
);

-- Tabela ItemCompra
CREATE TABLE ItemCompra (
  compraId                   UUID REFERENCES Compra(id_compra) NOT NULL,
  estoqueId                  UUID REFERENCES Estoque(id_estoque) NOT NULL,
  qtdComprada                INT,
  valor_unitario_compra      FLOAT,
  dt_compra                  TIMESTAMPTZ,
  PRIMARY KEY (compraId, estoqueId)
);

-- Tabela Venda
CREATE TABLE Venda (
  id_venda               UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  cli_venda_id           UUID REFERENCES Cliente(id_cli) NOT NULL,
  valor_total_venda      FLOAT NOT NULL,
  dt_pagamento           TIMESTAMPTZ NOT NULL,
  quantidade_parcelas    INT NOT NULL
);

-- Tabela ItemVenda
CREATE TABLE ItemVenda (
  estoqueId              UUID REFERENCES Estoque(id_estoque) NOT NULL,
  vendaId                UUID REFERENCES Venda(id_venda) NOT NULL,
  valor_prod             FLOAT,
  PRIMARY KEY (estoqueId, vendaId)
);

-- Tabela Empresa
CREATE TABLE Empresa (
  id_empresa           UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
  nome_empresa         VARCHAR NOT NULL,
  email                VARCHAR UNIQUE NOT NULL, --CRIAR VIEW DE CADA EMPRESA PARA SEU PROPRIO BD
  senha                VARCHAR(8) NOT NULL
);

-- Tabela Estoque
CREATE TABLE Estoque (
 	id_estoque            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	cod_empresa           UUID REFERENCES Empresa(id_empresa) ON DELETE CASCADE,
  	cod_produto           UUID REFERENCES Produto(id_prod) ON DELETE CASCADE
	quant_estoque		  INT NOT NULL
);

-- Tabela Produto
CREATE TABLE Produto (
  	id_prod             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  	nome_prod           VARCHAR NOT NULL,
	valor_unitario	    REAL NOT NULL
);


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


