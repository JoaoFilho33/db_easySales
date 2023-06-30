CREATE TABLE Empresa (
  	id_emp           SERIAL NOT NULL PRIMARY KEY,
  	nome_emp         VARCHAR(15) NOT NULL,
  	email_emp        VARCHAR(25) NOT NULL, --CRIAR VIEW DE CADA EMPRESA PARA SEU PROPRIO BD
  	senha_emp        VARCHAR(8) NOT NULL,
	cpf				 VARCHAR(15) NOT NULL
);

CREATE TABLE Cliente (
  	id_cli          SERIAL NOT NULL PRIMARY KEY,
  	nome_cli        VARCHAR(40) NOT NULL,
  	cpf             VARCHAR(15) NOT NULL,
  	bairro_cli      VARCHAR(15) NOT NULL,
  	num_cli         VARCHAR(12) NOT NULL,
  	logradouro_cli  VARCHAR(25) NOT NULL,
  	cep_cli         VARCHAR(9) NOT NULL,
  	cidade_cli      VARCHAR(20) NOT NULL,
	email_cli		VARCHAR(25) NOT NULL,
	telefone		VARCHAR(15) NOT NULL,
	id_emp			INT NOT NULL REFERENCES EMPRESA(ID_EMP)
);

CREATE TABLE Fornecedor (
  	id_fn             SERIAL NOT NULL PRIMARY KEY,
  	nome_fn           VARCHAR(40) NOT NULL,
  	bairro_fn         VARCHAR(25) NOT NULL,
  	num_fn            VARCHAR(20) NOT NULL,
  	logradouro_fn     VARCHAR(30) NOT NULL,
  	cep_fn            VARCHAR(9) NOT NULL,
  	cidade_fn         VARCHAR(20) NOT NULL,
	telefone_fn		  VARCHAR(15) NOT NULL,
	cpf_fn			  VARCHAR(18) NOT NULL,
	email_fn		  VARCHAR(25) NOT NULL,
	id_emp			  INT NOT NULL REFERENCES EMPRESA(ID_EMP)
);

CREATE TABLE Compra (
  	id_compra               INT NOT NULL PRIMARY KEY,
	fn_compra_id          	INT NOT NULL REFERENCES Fornecedor(id_fn),
  	dt_compra               TIMESTAMPTZ NOT NULL,
  	valor_total_compra      FLOAT NOT NULL
);

CREATE TABLE Produto (
  	id_prod             SERIAL PRIMARY KEY NOT NULL,
  	nome_prod           VARCHAR NOT NULL
);

CREATE TABLE Estoque (
 	id_estoque        SERIAL NOT NULL PRIMARY KEY,
	empId             INT NOT NULL REFERENCES Empresa(id_emp),
  	prodId            INT NOT NULL REFERENCES Produto(id_prod),
	preco_prod	      REAL NOT NULL, --preço de venda do produto
	quant_estq		  INT NOT NULL
);

CREATE TABLE ItemCompra (
  	compraId                   INT NOT NULL REFERENCES Compra(id_compra),
  	estoqueId                  INT NOT NULL REFERENCES Estoque(id_estoque),
  	qtdComprada                INT NOT NULL,
	valor_total_item_c 		   FLOAT NOT NULL,
	preco_prod_c			   REAL NOT NULL,
  	CONSTRAINT PRI_ITEM_COMPRA PRIMARY KEY (compraId, estoqueId)
);

CREATE TABLE Venda (
  	id_venda               INT NOT NULL PRIMARY KEY,
  	id_cli                 INT NOT NULL REFERENCES Cliente(id_cli),
  	valor_total_venda      REAL NOT NULL,
  	dt_venda	       	   TIMESTAMPTZ NOT NULL,
	qtd_itens			   INT NOT NULL,
  	qtd_parcelas_total	   INT NOT NULL,
  	qtd_parcelas_falta	   INT
);


CREATE TABLE ItemVenda (
	vendaId                INT NOT NULL REFERENCES Venda(id_venda),
  	estoqueId              INT NOT NULL REFERENCES Estoque(id_estoque),
	qtd_vendida		   	   INT NOT NULL,
	valor_total_item_v     REAL NOT NULL,
  	CONSTRAINT PRI_ITEM_VENDA PRIMARY KEY (estoqueId, vendaId)
);