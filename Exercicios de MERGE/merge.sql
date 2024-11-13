USE db_Etec
GO 

MERGE tb3 dest
	USING tb2A ori
	ON ori.RM = dest.RM
	WHEN NOT MATCHED AND ori.status = 'APROVADO' THEN
	 INSERT (RM, nome_aluno,status)
	 VALUES (ori.RM, ori.nome_aluno, ori.status);

MERGE tb3 dest
	USING tb2B ori
	ON ori.RM = dest.RM
	WHEN NOT MATCHED AND ori.status LIKE 'APROVADO' THEN
	 INSERT (RM, nome_aluno,status)
	 VALUES (ori.RM, ori.nome_aluno, ori.status);

SELECT * FROM tb2A
SELECT * FROM tb2B
SELECT * FROm tb3
