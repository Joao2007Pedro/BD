-- a) Criar uma view para exibir a quantidade de funcionários por nome de departamento
 
    CREATE VIEW vwQuantidadeFuncionariosPorDepartamento AS SELECT d.nomeDepartamento,
    COUNT(f.codFuncionario) AS quantidadeFuncionarios FROM tbDepartamento d
    LEFT JOIN tbFuncionario f ON d.codDepartamento = f.codDepartamento
    GROUP BY d.nomeDepartamento;
 
   SELECT * FROM vwQuantidadeFuncionariosPorDepartamento;

--  b) Usando a view anterior, exibir somente o nome do departamento que possui o menor número de funcionários
SELECT nomeDepartamento
FROM vwQuantidadeFuncionariosPorDepartamento
WHERE quantidadeFuncionarios = (
    SELECT MIN(quantidadeFuncionarios)
    FROM vwQuantidadeFuncionariosPorDepartamento
);

-- c) Criar uma view para exibir a soma dos salários por nome de departamento
CREATE VIEW vwSomaSalariosPorDepartamento AS
 SELECT d.nomeDepartamento,
    SUM(f.salarioFuncionario) AS somaSalarios FROM tbDepartamento d
    LEFT JOIN tbFuncionario f ON d.codDepartamento = f.codDepartamento
   GROUP BY d.nomeDepartamento;

-- d) Utilizando a view do exercício anterior, mostrar somente a maior soma dentre os departamentos
SELECT nomeDepartamento, somaSalarios FROM vwSomaSalariosPorDepartamento
    WHERE somaSalarios = (
    SELECT MAX(somaSalarios) FROM vwSomaSalariosPorDepartamento
);

-- e) Criar uma view para exibir somente o nome dos funcionários e o nome dos departamentos daqueles funcionários que não possuem dependentes
CREATE VIEW vwFuncionariosSemDependentes AS
  SELECT f.nomeFuncionario,d.nomeDepartamentoFROM tbFuncionario f
    INNER JOIN tbDepartamento d ON f.codDepartamento = d.codDepartamento
    WHERE f.codFuncionario NOT IN (SELECT DISTINCT codFuncionario FROM tbDependente
);

-- f) Criar uma view que exiba a quantidade de dependentes por nome de funcionário
CREATE VIEW vwQuantidadeDependentesPorFuncionario AS
  SELECT f.nomeFuncionario,
    COUNT(d.codDependente) AS quantidadeDependente FROM tbFuncionario f
    LEFT JOIN tbDependente d ON f.codFuncionario = d.codFuncionario
    GROUP BY f.nomeFuncionario;

-- g) Utilizando a view anterior, mostrar somente o nome do funcionário que possui mais dependentes
SELECT nomeFuncionario, quantidadeDependentes
  FROM vwQuantidadeDependentesPorFuncionario
    WHERE quantidadeDependentes = (
    SELECT MAX(quantidadeDependentes)
      FROM vwQuantidadeDependentesPorFuncionario
);

-- h) Criar uma view para exibir a quantidade de dependentes por departamento
CREATE VIEW vwQuantidadeDependentesPorDepartamento AS
  SELECT d.nomeDepartamento,
    COUNT(d2.codDependente) AS quantidadeDependentes FROM tbDepartamento d
    LEFT JOIN tbFuncionario f ON d.codDepartamento = f.codDepartamento
    LEFT JOIN tbDependente d2 ON f.codFuncionario = d2.codFuncionario
    GROUP BY d.nomeDepartamento;

-- i) Utilizando a view do exercícios anterior, apresentar a soma geral dos dependentes
SELECT SUM(quantidadeDependentes) AS somaTotalDependentes
FROM vwQuantidadeDependentesPorDepartamento;





