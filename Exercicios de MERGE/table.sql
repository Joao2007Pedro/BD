CREATE DATABASE bdEtec
USE bdEtec
GO

CREATE TABLE tb2A (
    RM INT PRIMARY KEY,
    nome_aluno VARCHAR(100),
    status VARCHAR(20)
);

CREATE TABLE tb2B (
    RM INT PRIMARY KEY,
    nome_aluno VARCHAR(100),
    status VARCHAR(20)
);

CREATE TABLE tb3 (
    RM INT PRIMARY KEY,
    nome_aluno VARCHAR(100),
    status VARCHAR(20)
);


INSERT INTO tb2A (RM, nome_aluno, status) VALUES
(1, 'Alice Silva', 'APROVADO'),
(2, 'Bruna Costa', 'APROVADO'),
(3, 'Carlos Pereira', 'APROVADO'),
(4, 'Daniel Souza', 'REPROVADO'),
(5, 'Eva Lima', 'APROVADO'),
(6, 'Felipe Rocha', 'APROVADO'),
(7, 'Gabriel Oliveira', 'REPROVADO'),
(8, 'Helena Costa', 'APROVADO'),
(9, 'Igor Silva', 'APROVADO'),
(10, 'Juliana Mendes', 'REPROVADO');

INSERT INTO tb2B (RM, nome_aluno, status) VALUES
(11, 'Karla Almeida', 'APROVADO'),
(12, 'Lucas Martins', 'REPROVADO'),
(13, 'Marcos Rocha', 'APROVADO'),
(14, 'Natalia Oliveira', 'APROVADO'),
(15, 'Otavio Costa', 'REPROVADO'),
(16, 'Patricia Fernandes', 'APROVADO'),
(17, 'Ricardo Silva', 'APROVADO'),
(18, 'Sofia Lima', 'APROVADO'),
(19, 'Tiago Santos', 'REPROVADO'),
(20, 'Ursula Costa', 'APROVADO');

SELECT * FROM tb2A
SELECT * FROM tb2B
SELECT * FROM tb3
