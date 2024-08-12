CREATE DATABASE bdRecursosHumanos;

USE bdRecursosHumanos;

CREATE TABLE tbDepartamento (
    codDepartamento INT PRIMARY KEY IDENTITY(1,1),
    nomeDepartamento VARCHAR(100) NOT NULL
);

CREATE TABLE tbFuncionario (
    codFuncionario INT PRIMARY KEY IDENTITY(1,1),
    nomeFuncionario VARCHAR(100) NOT NULL,
    cpfFuncionario VARCHAR(15) NOT NULL,
    sexoFuncionario CHAR(1) NOT NULL,
    dataNascimentoFuncionario SMALLDATETIME NOT NULL,
    salarioFuncionario FLOAT NOT NULL,
    codDepartamento INT FOREIGN KEY REFERENCES tbDepartamento(codDepartamento)
);

CREATE TABLE tbDependente (
    codDependente INT PRIMARY KEY IDENTITY(1,1),
    nomeDependente VARCHAR(100) NOT NULL,
    dataNascimentoDependente DATETIME NOT NULL,
    sexoDependente CHAR(1) NOT NULL,
    codFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(codFuncionario)
);
