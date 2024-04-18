
-- 1) Apresentar os nomes dos aluno sao lado do nome dos cursos que eles fazem
	SELECT a.nomeAluno AS 'Nome', c.nomeCurso AS 'Nome do Curso'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
	INNER JOIN tb_Turma t ON m.codTurma = t.codTurma
	INNER JOIN tb_Curso c ON t.codCurso = c.codCurso
-- 2) Apresentar a quantidadede alunos matriculados por nome do curso
	SELECT COUNT(a.nomeAluno) AS 'Número de Alunos', c.nomeCurso AS 'Nome do Curso'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
	INNER JOIN tb_Turma t ON m.codTurma = t.codTurma
	INNER JOIN tb_Curso c ON t.codCurso = c.codCurso
	GROUP BY c.nomeCurso
-- 3) Apresentar a quantidadede alunos matriculados por nome da turma
	SELECT COUNT(a.nomeAluno) AS 'Número de Alunos', t.nomeTurma AS 'Nome da Turma'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
	INNER JOIN tb_Turma t ON m.codTurma = t.codTurma
	GROUP BY t.nomeTurma
-- 4) Apresentar a quantidade de alunos que fizeram matricula em maio de 2016
	SELECT COUNT(a.nomeAluno) AS 'Número de Alunos Matriculados em Maio de 2016'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
	WHERE YEAR(m.dataMatricula) = 2016 AND MONTH(m.dataMatricula) = 5
-- 5) Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
	SELECT a.nomeAluno AS 'Nome',t.nomeTurma AS 'Nome Turma', c.nomeCurso As 'Nome do Curso'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
	INNER JOIN tb_Turma t ON m.codTurma = t.codTurma
	INNER JOIN tb_Curso c ON t.codCurso = c.codCurso
	ORDER BY a.nomeAluno ASC
-- 6) Apresentar o nome dos cursos e os horários em que eles são oferecidos
	SELECT c.nomeCurso AS 'Nome do Curso', t.horarioTurma AS 'Horario da Turma'
	FROM tb_Turma t
	INNER JOIN tb_Curso c ON t.codCurso = c.nomeCurso
-- 7) Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
	SELECT 	n.naturalidadeAluno AS 'Estado de Nascimento', 			 			COUNT(n.naturalidadeAluno) AS 'Quantidade de Alunos'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
	INNER JOIN tb_Curso c ON m.codCurso = c.codCurso
	WHERE c.nomeCurso = 'Inglês'
	GROUP BY a.estadoNascimento
-- 8) Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
	SELECT a.nomeAluno AS 'Nome do Aluno', DATE_FORMAT(m.dataMatricula, 		'%d/%m/%Y') AS 'Data de Matrícula'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
-- 9) Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
	SELECT a.nomeAluno AS 'Nome do Aluno'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
	INNER JOIN tb_Curso c ON m.codCurso = c.codCurso
	WHERE c.nomeCurso = 'Inglês' AND a.nomeAluno LIKE 'A%'
-- 10) Apresentar a quantidade de matriculas feitas no ano de 2016
	SELECT COUNT(*)
	FROM tb_Matricula
	WHERE YEAR(dataMatricula) = 2016
-- 11) Apresentar a quantidade de matriculas por nome do curso
	SELECT c.nomeCurso AS 'Nome do Curso', COUNT(*) AS 'Quantidade de 			Matrículas'
	FROM tb_Matricula m
	INNER JOIN tb_Curso c ON m.codCurso = c.codCurso
	GROUP BY c.nomeCurso;
-- 12) Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$300,00
	SELECT COUNT(DISTINCT m.codAluno) AS 'Quantidade de Alunos'
	FROM tb_Matricula m
	INNER JOIN tb_Curso c ON m.codCurso = c.codCurso
	WHERE c.valorCurso > 300.00
-- 13) Apresentar os nomes dos alunos que fazem o curso de alemão
	SELECT DISTINCT a.nomeAluno AS 'Nome do Aluno'
	FROM tb_Aluno a
	INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
	INNER JOIN tb_Curso c ON m.codCurso = c.codCurso
	WHERE c.nomeCurso = 'Alemão'
