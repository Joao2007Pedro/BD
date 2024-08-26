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
  ;
