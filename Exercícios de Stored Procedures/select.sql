-- 1) Criar uma stored procedure “Busca_Aluno” que receba o código do aluno e retorne seu nome e data de nascimento.
    CREATE PROCEDURE Busca_Aluno(
        IN codigo_aluno INT,
        OUT nome_aluno VARCHAR(100),
        OUT data_nascimento DATE
    )
    BEGIN
        SELECT nomeAluno, dataNascAluno
        INTO nome_aluno, data_nascimento
        FROM tb_Aluno
        WHERE codAluno = codigo_aluno;
    END;
    DECLARE @nome VARCHAR(100), @data_nascimento DATE;
    EXEC Busca_Aluno @codigo_aluno = 1, @nome_aluno = @nome OUTPUT, @data_nascimento = @data_nascimento OUTPUT;
    SELECT @nome AS Nome, @data_nascimento AS DataNascimento;

-- 2) Criar uma stored procedure “Insere_Aluno” que insira um registro na tabela de Alunos.
    CREATE PROCEDURE Insere_Aluno(
        IN p_nome VARCHAR(100),
        IN p_data_nascimento DATE,
        IN p_rg VARCHAR(100),
        IN p_naturalidade VARCHAR(50)
    )
    BEGIN
        INSERT INTO tb_Aluno (nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
        VALUES (p_nome, p_data_nascimento, p_rg, p_naturalidade);
    END;
  EXEC Insere_Aluno 'João Silva', '2009-03-25', '12.345.678-9', 'SP';

-- 3) Criar uma stored procedure “Aumenta_Preco” que, dados o nome do curso e um percentual, aumente o valor do curso com a porcentagem informada
    CREATE PROCEDURE Aumenta_Preco(
        IN nome_curso VARCHAR(100),
        IN percentual_aumento DECIMAL(5,2)
    )
    BEGIN
        UPDATE tb_Curso
        SET valorCurso = valorCurso * (1 + percentual_aumento / 100)
        WHERE nomeCurso = nome_curso;
    END;
  EXEC Aumenta_Preco 'Inglês', 10.0;

-- 4) Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma exiba todas as informações dela.
    CREATE PROCEDURE Exibe_Turma(
        IN nome_turma VARCHAR(50)
    )
    BEGIN
        SELECT * FROM tb_Turma
        WHERE nomeTurma = nome_turma;
    END;
  EXEC Exibe_Turma '1|A';

-- 5) Criar uma stored procedure “Exibe_AlunosdaTurma” que, dado o nome da turma exiba os seus alunos.
    CREATE PROCEDURE Exibe_AlunosdaTurma(
        IN nome_turma VARCHAR(50)
    )
    BEGIN
        SELECT a.codAluno, a.nomeAluno
        FROM tb_Aluno a
        INNER JOIN tb_Matricula m ON a.codAluno = m.codAluno
        INNER JOIN tb_Turma t ON m.codTurma = t.codTurma
        WHERE t.nomeTurma = nome_turma;
    END;
  EXEC Exibe_AlunosdaTurma '1|A';

-- 6) - Criar uma stored procedure para inserir alunos, verificando pelo cpf se o aluno existe ou não, e informar essa condição via mensagem
    CREATE PROCEDURE Inserir_Aluno(
        IN p_nome VARCHAR(100),
        IN p_rg VARCHAR(100),
        IN p_data_nascimento DATE,
        IN p_naturalidade VARCHAR(50)
    )
    BEGIN
        IF EXISTS (SELECT 1 FROM tb_Aluno WHERE rgAluno = p_rg) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aluno com o CPF fornecido já existe.';
        ELSE
            INSERT INTO tb_Aluno (nomeAluno, rgAluno, dataNascAluno, naturalidadeAluno)
            VALUES (p_nome, p_rg, p_data_nascimento, p_naturalidade);
            SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Aluno inserido com sucesso.';
        END IF;
    END;
  EXEC Inserir_Aluno 'Maria Santos', '12.345.678-9';

-- 7) Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido
    CREATE PROCEDURE Matricular_Aluno(
        IN nome_aluno VARCHAR(100),
        IN nome_curso VARCHAR(100)
    )
    BEGIN
        DECLARE curso_id INT;
        DECLARE aluno_id INT;
        DECLARE turma_id INT;
        SELECT codAluno INTO aluno_id
        FROM tb_Aluno
        WHERE nomeAluno = nome_aluno;
        SELECT codCurso INTO curso_id
        FROM tb_Curso
        WHERE nomeCurso = nome_curso;
        SELECT codTurma INTO turma_id
        FROM tb_Turma
        WHERE codCurso = curso_id
        LIMIT 1;
        IF aluno_id IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aluno não encontrado.';
        ELSEIF turma_id IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Turma não encontrada para o curso especificado.';
        ELSE
            IF EXISTS (SELECT 1 FROM tb_Matricula WHERE codAluno = aluno_id AND codTurma = turma_id) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O aluno já está matriculado neste curso.';
            ELSE
                INSERT INTO tb_Matricula (codAluno, codTurma)
                VALUES (aluno_id, turma_id);
                SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Matrícula realizada com sucesso.';
            END IF;
        END IF;
    END;
  EXEC Matricular_Aluno 'Maria Santos', 'Inglês';
