-- 1) Criar uma stored procedure “Busca_Aluno” que receba o código do aluno e retorne seu nome e data de nascimento.
	-- 1) Criar uma stored procedure “Busca_Aluno” que receba o código do aluno e retorne seu nome e data de nascimento.

	CREATE PROCEDURE Busca_Aluno
			@codigoAluno INT	
		AS
				IF EXISTS (SELECT codAluno FROM tb_Aluno WHERE codAluno = @codigoAluno)
				BEGIN
					SELECT nomeAluno, CONVERT(VARCHAR(12),dataNascAluno, 103) 'Data de Nascimento' FROM tb_Aluno	
						WHERE codAluno = @codigoAluno
				END
				ELSE
				BEGIN
					PRINT('Aluno não encontrado!')
				END
		EXEC Busca_Aluno 1

-- 2) Criar uma stored procedure “Insere_Aluno” que insira um registro na tabela de Alunos.
    CREATE PROCEDURE Insere_AlunO
			@nomeAluno VARCHAR(100),
			@dataNascAluno DATE,
			@rgAluno VARCHAR(100),
			@naturalidadeAluno VARCHAR(50)
		AS
			BEGIN
			INSERT INTO tb_Aluno (nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
			VALUES (@nomeAluno, @dataNascAluno, @rgAluno, @naturalidadeAluno);
		END
	  EXEC Insere_Aluno 'João Silva', '2009-03-25', '12.345.678-9', 'SP';

-- 3) Criar uma stored procedure “Aumenta_Preco” que, dados o nome do curso e um percentual, aumente o valor do curso com a porcentagem informada
    CREATE PROCEDURE Aumenta_Preco
         @nomeCurso VARCHAR(100),
         @percentual_aumento FLOAT
		 AS
			BEGIN
				UPDATE tb_Curso
				SET valorCurso = valorCurso * (1 + @percentual_aumento / 100)
				WHERE nomeCurso = @nomeCurso;
			END
		  EXEC Aumenta_Preco 'Inglês', 10.0;

-- 4) Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma exiba todas as informações dela.
    CREATE PROCEDURE Exibe_Turma
        @nomeTurma VARCHAR(50)
			AS
			BEGIN
				SELECT * FROM tb_Turma
				WHERE nomeTurma = @nomeTurma;
			END;
		  EXEC Exibe_Turma '1|A';

-- 5) Criar uma stored procedure “Exibe_AlunosdaTurma” que, dado o nome da turma exiba os seus alunos.
    CREATE PROCEDURE Exibe_AlunosdaTurma
		@nomeTurma VARCHAR(50)
			AS
			BEGIN
				SELECT a.codAluno, a.nomeAluno
				FROM tb_Aluno a
				INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
				INNER JOIN tb_Turma t ON m.codTurma = t.codTurma
				WHERE t.nomeTurma = @nomeTurma;
			END;
	EXEC Exibe_AlunosdaTurma '1|A';

-- 6) - Criar uma stored procedure para inserir alunos, verificando pelo cpf se o aluno existe ou não, e informar essa condição via mensagem
  	CREATE PROCEDURE Inserir_Aluno
				@nomeAluno VARCHAR(100),
				@dataNascAluno DATETIME,
				@rgAluno VARCHAR(100),
				@naturalidadeAluno VARCHAR(50)
			AS
			BEGIN
				IF NOT EXISTS (SELECT 1 FROM tb_Aluno WHERE rgAluno = @rgAluno)
				BEGIN
					INSERT INTO tb_Aluno (nomeAluno, rgAluno, dataNascAluno, naturalidadeAluno)
					VALUES (@nomeAluno, @rgAluno, @dataNascAluno, @naturalidadeAluno);
				END
			END
			EXEC Inserir_Aluno @nomeAluno = 'Maria Santos', @dataNascAluno = '20000101', @rgAluno = '12.345.678-9', @naturalidadeAluno = 'São Paulo';

-- 7) Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido
    CREATE PROCEDURE Matricular_Aluno
            @nomeAluno VARCHAR(100),
            @nomeCurso VARCHAR(100)
        AS
        BEGIN
            DECLARE @CodAluno INT;
            DECLARE @CodCurso INT;
            SELECT @CodAluno = codAluno
            FROM tb_Aluno
            WHERE nomeAluno = @nomeAluno;
            SELECT @CodCurso = codCurso
            FROM tb_Curso
            WHERE nomeCurso = @nomeCurso;
            IF @CodAluno IS NOT NULL AND @CodCurso IS NOT NULL
            BEGIN
                IF NOT EXISTS (SELECT 1 FROM tb_Matricula WHERE codAluno = @CodAluno AND codCurso = @CodCurso)
                BEGIN
                    INSERT INTO tb_Matricula (codAluno, CodCurso, dataMattricula)
                    VALUES (@CodAluno, @CodCurso, GETDATE());
                END
                ELSE
                BEGIN
                    PRINT 'O aluno já está matriculado neste curso.';
                END
            END
            ELSE
            BEGIN
                PRINT 'Aluno ou curso não encontrados.';
            END
        END;
