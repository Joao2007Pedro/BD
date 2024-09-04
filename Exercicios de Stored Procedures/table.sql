CREATE DATABASE db_Encomendas
USE db_Encomendas
GO

CREATE TABLE tb_CategoriaProduto (
	codCategoriaProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeCategoriaProduto VARCHAR (100) NOT NULL
	)

CREATE TABLE tb_Produto (
	codProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeProduto VARCHAR (100) NOT NULL
	,precoKiloProduto DECIMAL NOT NULL
	,codCategoriaProduto INT FOREIGN KEY REFERENCES tb_CategoriaProduto (codCategoriaProduto)
	)

CREATE TABLE tb_Cliente (
	codCliente	INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (100) NOT NULL
	,dataNascimentoCliente SMALLDATETIME NOT NULL
	,ruaCliente VARCHAR (100) NOT NULL
	,numCasaCliente VARCHAR (20) NOT NULL
	,cepCliente VARCHAR (50) NOT NULL
	,bairroCliente VARCHAR (100) NOT NULL
	,cidadeCliente VARCHAR (100) NOT NULL
	,estadoCliente VARCHAR (100) NOT NULL
	,cpfCliente VARCHAR (15) NOT NULL
	,sexoCliente VARCHAR (1) NOT NULL
	)

CREATE TABLE tb_Encomenda (
	codEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,dataEncomenda DATETIME NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tb_Cliente(codCliente)
	,valorTotalEncomenda DECIMAL NOT NULL
	,dataEntregaEncomenda DATETIME NOT NULL
	)
 
CREATE TABLE tb_ItensEncomenda (
	codItensEncomends INT PRIMARY KEY IDENTITY (1,1)
	,codEncomenda INT FOREIGN KEY REFERENCES tb_Encomenda(codEncomenda)
	,codProduto INT FOREIGN KEY REFERENCES tb_Produto(codProduto)
	,quantidadeKilos FLOAT NOT NULL
	,subTotal FLOAT NOT NULL
	)
 
SELECT * FROM tb_CategoriaProduto
SELECT * FROM tb_Produto
SELECT * FROM tb_Cliente
SELECT * FROM tb_Encomenda
SELECT * FROM tb_ItensEncomenda
