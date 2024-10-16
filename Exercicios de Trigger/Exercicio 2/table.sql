CREATE DATABASE bdTrigger
USE bdTrigger
GO
 
CREATE TABLE tbMotorista (

	idMotorista INT PRIMARY KEY IDENTITY (1,1)
	,nomeMotorista VARCHAR (100) NOT NULL
	,dataNascimentOMotorista SMALLDATETIME NOT NULL
	,cpfMotorista VARCHAR (15) NOT NULL
	,cnhMotorista VARCHAR (100) NOT NULL
	,pontuacaoAcumulada INT NOT NULL
	)

CREATE TABLE tbVeiculo (
	idVeiculo INT PRIMARY KEY IDENTITY (1,1)
	,modeloVeiculo VARCHAR (100) NOT NULL
	,placa VARCHAR (10) NOT NULL
	,renavam INT NOT NULL
	,anoVeiculo DATETIME NOT NULL
	,idMotorista INT FOREIGN KEY REFERENCES tbMotorista(idMotorista)
	)
 
CREATE TABLE tbMultas (
	idMulta INT PRIMARY KEY IDENTITY (1,1)
	,dataMulta DATETIME NOT NULL
	,horaMulta DATETIME NOT NULL
	,pontosMulta INT NOT NULL
	,idVeiculo INT FOREIGN KEY REFERENCES tbVeiculo(idVeiculo)
	)
 
CREATE TABLE tbCliente (
    codCliente INT PRIMARY KEY IDENTITY(1,1), 
    nomeCliente VARCHAR(100) NOT NULL,
    cpfCliente CHAR(11) NOT NULL
	)
 
CREATE TABLE tbContaCorrente (
    numConta INT PRIMARY KEY IDENTITY(1,1), 
    saldoConta DECIMAL(18, 2) NOT NULL, 
    codCliente INT NOT NULL, 
    CONSTRAINT FK_tbContaCorrente_tbCliente FOREIGN KEY (codCliente) 
    REFERENCES tbCliente(codCliente)
	)
 
CREATE TABLE tbDeposito (
    codDeposito INT PRIMARY KEY IDENTITY(1,1), 
    valorDeposito DECIMAL(18, 2) NOT NULL, 
    numConta INT NOT NULL, 
    dataDeposito DATE NOT NULL,
    horaDeposito TIME(0) NOT NULL, 
    CONSTRAINT FK_tbDeposito_tbContaCorrente FOREIGN KEY (numConta) 
    REFERENCES tbContaCorrente(numConta)
	)
 
CREATE TABLE tbSaque (

    codSaque INT PRIMARY KEY IDENTITY(1,1),
    valorSaque DECIMAL(18, 2) NOT NULL, 
    numConta INT NOT NULL, 
    dataSaque DATE NOT NULL, 
    horaSaque TIME(0) NOT NULL, 
    CONSTRAINT FK_tbSaque_tbContaCorrente FOREIGN KEY (numConta) 
    REFERENCES tbContaCorrente(numConta)
	)
 
SELECT * FROM tbMotorista
SELECT * FROM tbVeiculo
SELECT * FROM tbMultas
 
 
 
