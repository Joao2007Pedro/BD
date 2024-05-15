CREATE DATABASE bdLivrariaBrasileira
USE bdLivrariaBrasileira
GO

CREATE TABLE tbAutor (
	codAutor INT PRIMARY KEY IDENTITY (1,1)
	,nomeAutor VARCHAR (50) NOT NULL
)
 
CREATE TABLE tbGenero (
	codGenero INT PRIMARY KEY IDENTITY (1,1)
	,nomeGenero VARCHAR (50) NOT NULL
)
 
CREATE TABLE tbEditora (
	codEditora INT PRIMARY KEY IDENTITY (1,1)
	,nomeEditora VARCHAR (50) NOT NULL
)
 
CREATE TABLE tbLivro (
	codLivro INT PRIMARY KEY IDENTITY (1,1)
	,nomeLivro VARCHAR (100) NOT NULL
	,numPaginas INT NOT NULL
  	,codGenero INT FOREIGN KEY REFERENCES tbGenero (codGenero)
	,codAutor INT FOREIGN KEY REFERENCES tbAutor (codAutor)
  	,codEditora INT FOREIGN KEY REFERENCES tbEditora (codEditora)
	)

SELECT * FROM tbLivro
SELECT * FROM tbAutor
SELECT * FROM tbGenero
SELECT * FROM tbEditora
