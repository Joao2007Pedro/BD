
-- A) Criar uma consulta que retorne o nome e o preço dos cursos que custem abaixo do valor médio
  SELECT nomeCurso, valorCurso
  FROM tbCurso
  WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)

-- B) Criar uma consulta que retorne o nome e o rg do aluno mais novo
  SELECT a.nomeAluno, a.rgAluno
  FROM tbAluno a
  INNER JOIN AlunoMaisNovo amn
  ON a.dataNascAluno = amn.dataNascMaisRecente

-- C) Criar uma consulta que retorne o nome do aluno mais velho
  SELECT nomeAluno
  FROM tbAluno
  WHERE dataNascAluno = (SELECT MIN(dataNascAluno) FROM tbAluno)

-- D) Criar uma consulta que retorne o nome e o valor do curso mais caro
  SELECT nomeCurso, valorCurso
  FROM tbCurso
  WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)

-- E) Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a última matrícula
  SELECT a.nomeAluno, c.nomeCurso
  FROM tbAluno a
  JOIN tbMatricula m ON a.codAluno = m.codAluno
  JOIN tbTurma t ON m.codTurma = t.codTurma
  JOIN tbCurso c ON t.codCurso = c.codCurso
  WHERE m.dataMatricula = (SELECT MAX(dataMatricula)FROM tbMatricula)

-- F) Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas
    SELECT nomeAluno
    FROM tbAluno
    WHERE codAluno = (SELECT TOP 1 codAluno FROM tbMatricula ORDER BY dataMatricula)

-- G) Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de inglês
  SELECT a.nomeAluno, a.rgAluno, a.dataNascAluno
  FROM tbAluno a
  JOIN tbMatricula m ON a.codAluno = m.codAluno
  JOIN tbTurma t ON m.codTurma = t.codTurma
  JOIN tbCurso c ON t.codCurso = c.codCurso
  WHERE c.nomeCurso = 'Inglês';

