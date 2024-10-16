CREATE DATABASE bd_Loja
USE bd_Loja
GO
 
CREATE TABLE tb_Cliente(
	codCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (100) NOT NULL
	,cpfCliente VARCHAR (12) NOT NULL
	,emailCliente VARCHAR (50) NOT NULL
	,sexoCliente CHAR (10) NOT NULL
	,dataNascimentoCliente DATETIME
	)
CREATE TABLE tb_Fabricante(
	codFabricante INT PRIMARY KEY IDENTITY (1,1)
	,nomeFabricante VARCHAR (100) NOT NULL
	)
 
CREATE TABLE tb_Fornecedor(
	codFornecedor INT PRIMARY KEY IDENTITY (1,1)
	,nomeFornecedor VARCHAR (100) NOT NULL
	,contatoFornecedor VARCHAR (100) NOT NULL
	)
 
CREATE TABLE tb_Produto(
	codProduto INT PRIMARY KEY IDENTITY (1,1)
	,descricaoProduto VARCHAR (100) NOT NULL
	,valorProduto FLOAT NOT NULL
	,quantidadeProduto INT NOT NULL
	,codFabricante INT NOT NULL
	,codFornecedor INT NOT NULL
	)
 
CREATE TABLE tb_Venda(
	codVenda INT PRIMARY KEY IDENTITY (1,1)
	,dataVenda DATETIME
	,valorTotalVenda FLOAT NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tb_Cliente (codCliente)
	)
 
CREATE TABLE tb_ItensVenda(
	codItensVenda INT PRIMARY KEY IDENTITY (1,1)
	,codVenda INT FOREIGN KEY REFERENCES tb_Venda (codVenda)
	,codProduto INT FOREIGN KEY REFERENCES tb_Produto (codProduto)
	,quantidadeItensVenda INT NOT NULL
	,subTotalItensVenda FLOAT NOT NULL
	)
 
CREATE TABLE tb_EntradaProduto (
	codEntrada INT PRIMARY KEY IDENTITY (1,1)
	,dataEntregaProduto DATETIME NOT NULL
	,codProduto INT FOREIGN KEY REFERENCES tb_Produto (codProduto)
	,quantidadeEntradaProduto INT NOT NULL
	)
 
CREATE TABLE tb_SaidaProduto (
	codSaidaProduto INT PRIMARY KEY IDENTITY (1,1)
	,dataSaidaProduto DATETIME NOT NULL
	,codProduto INT FOREIGN KEY REFERENCES tb_Produto (codProduto)
	,quantidadeSaidaProduto INT NOT NULL 
	)
 
	SELECT * FROM tb_Cliente
	SELECT * FROM tb_Fabricante
	SELECT * FROM tb_Fornecedor
	SELECT * FROM tb_Produto
	SELECT * FROM tb_Venda
	SELECT * FROM tb_ItensVenda
	SELECT * FROM tb_EntradaProduto
	SELECT * FROM tb_SaidaProduto
