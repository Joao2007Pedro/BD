CREATE DATABASE db_EscolaIdiomas
USE db_EscolaIdiomas
GO
 
CREATE TABLE tb_Aluno (
	codAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR (100) NOT NULL
	,dataNascAluno DATETIME NOT NULL
	,rgAluno VARCHAR (100) NOT NULL
	,naturalidadeAluno VARCHAR (50) NOT NULL
	)
 
CREATE TABLE tb_Curso (
	codCurso INT PRIMARY KEY IDENTITY (1,1)
	,nomeCurso VARCHAR (50) NOT NULL
	,cargahorariaCurso INT NOT NULL
	,valorCurso FLOAT NOT NULL
	)
 
CREATE TABLE tb_Turma (
	codTurma INT PRIMARY KEY IDENTITY (1,1)
	,nomeTurma VARCHAR (50) NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tb_Curso (codCurso)
	,horarioTurma TIME NOT NULL
	)
 
CREATE TABLE tb_Matricula (
	codMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMattricula DATETIME NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tb_Aluno (codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tb_Turma (codTurma)
	)
 
SELECT * FROM tb_Aluno
SELECT * FROM tb_Curso
SELECT * FROM tb_Turma
SELECT * FROM tb_Matricula
 
INSERT INTO tb_Aluno VALUES 
	('Paulo Santos', '20000310 00:00:00', '82.282.122-0', 'SP'),
	('Maria da Gloria', '19991003 00:00:00', '45.233.123-0', 'SP'),
	('Pedro Nogueira da Silva', '19980404 00:00:00', '23.533.211-9', 'SP'),
	('Gilson Barros Silva', '19950909 00:00:00', '34.221.111-x', 'PE'),
	('Mariana Barbosa Santos', '20011010 00:00:00', '54.222.122-9', 'RJ'),
	('Alessandro Pereira', '20031011 00:00:00', '24.402.454-9', 'ES'),
	('Aline Melo', '20011008 00:00:00', '88.365.012-3', 'RJ');

INSERT INTO tb_Curso VALUES
	('Inglês', '2000', '356.00'),
	('Alemão', '3000', '478.00'),
	('Espanhol', '4000', '500.00');

INSERT INTO tb_Turma VALUES
	('1|A', '1', '19000101 12:00:00'),
	('1|C', '3', '19000101 18:00:00'),
	('1|B', '1', '19000101 18:00:00'),
	('1AA', '2', '19000101 19:00:00');

INSERT INTO tb_Matricula VALUES
	('20151003 00:00:00', '1', '1'),
	('20140504 00:00:00', '2', '1'),
	('20140504 00:00:00', '2', '4'),
	('20120503 00:00:00', '3', '2'),
	('20160303 00:00:00', '1', '3'),
	('20150507 00:00:00', '4', '2'),
	('20150705 00:00:00', '4', '3');
