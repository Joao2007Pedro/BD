CREATE TABLE tbCampus ( 
    idCampus INT PRIMARY KEY IDENTITY (1,1) 
    ,nome VARCHAR (100) NOT NULL 
    ,rua VARCHAR (100) NOT NULL 
    ,número VARCHAR (100) NOT NULL 
    ,cep CHAR (14) NOT NULL 
    ,logradouro VARCHAR(100 ) NOT NULL 
    ,complemento VARCHAR(100) NOT NULL 
    ,bairro VARCHAR (100) NOT NULL 
    ,cidade VARCHAR (100) NOT NULL 
    ,estado VARCHAR (100) NOT NULL
  )
  
  CREATE TABLE tbCurso (
     idCurso INT PRIMARY KEY IDENTITY (1,1) 
     ,nome VARCHAR (100) NOT NULL   
     ,duracao VARCHAR (20) NOT NULL
     ,idCampus INT FOREIGN KEY REFERENCES tbCampus (idCampus)
  )
  
  CREATE TABLE tbDisciplina (
    IdDisciplina INT PRIMARY KEY IDENTITY (1,1) 
    ,Data_da_Matricula SMALLDATETIME
    ,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
  )
 
  CREATE TABLE tbProfessor ( 
    idProfessor INT PRIMARY KEY IDENTITY (1,1) 
    ,nome VARCHAR (100) NOT NULL 
    ,email VARCHAR (100) NOT NULL
    ,telefone VARCHAR (13) NOT NULL
    ,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
  )
  
  CREATE TABLE tbAluno (
    idAluno INT PRIMARY KEY IDENTITY (1,1)
    ,nome VARCHAR (100) NOT NULL 
    ,cpf VARCHAR (12) NOT NULL
    ,telefone VARCHAR (13) NOT NULL
    ,rua VARCHAR (100) NOT NULL 
    ,número VARCHAR (100) NOT NULL 
    ,cep VARCHAR (9) NOT NULL 
    ,logradouro VARCHAR(100 ) NOT NULL 
    ,complemento VARCHAR(100) NOT NULL 
    ,bairro VARCHAR (100) NOT NULL 
    ,cidade VARCHAR (100) NOT NULL 
    ,estado VARCHAR (100) NOT NULL
    ,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
  )
  
  CREATE TABLE tbTurma (
    idTurma INT PRIMARY KEY IDENTITY (1,1)
    ano_de_iniciacao SMALLDATETIME 
    ano_de_formacao SMALLDATETIME
    numero_da_sala INT NOT NULL
    ,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
  )
  
  CREATE TABLE tbMatricula (
     idMatricula INT PRIMARY KEY IDENTITY (1,1)
    ,data_da_Matricula SMALLDATETIME 
    ,idAluno INT FOREIGN KEY REFERENCES tbAluno (IdAluno)
  )
  
  CREATE TABLE tbAtribuicao (
    idAtribuicao INT PRIMARY KEY IDENTITY (1,1)
    ,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
    ,idProfessor INT FOREIGN KEY REFERENCES tbProfessor (idProfessor)
    ,idDisciplina INT FOREIGN KEY REFERENCES tbAluno (idDisciplina)
  )
