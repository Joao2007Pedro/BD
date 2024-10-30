USE db_EscolaIdiomas
GO

--1) Crie uma função que informada uma data de matricula, retorne o dia da semana
  CREATE FUNCTION functDiaSemana(@data DATE)
      RETURNS VARCHAR(40) AS
        BEGIN
            DECLARE @diaSemana VARCHAR(40)
            DECLARE @dia INT
            IF NOT EXISTS (SELECT 1 FROM tbVenda WHERE CAST(dataVenda AS DATE) = @data)
                RETURN 'Nenhuma venda registrada nesta data.'
            SET @dia = DATEPART(WEEKDAY, @data)
            IF @dia = 1
                SET @diaSemana = 'DOMINGO'
            IF @dia = 2
                SET @diaSemana = 'SEGUNDA-FEIRA'
            IF @dia = 3
                SET @diaSemana = 'TERÇA-FEIRA'
            IF @dia = 4
                SET @diaSemana = 'QUARTA-FEIRA'
            IF @dia = 5
                SET @diaSemana = 'QUINTA-FEIRA'
            IF @dia = 6
                SET @diaSemana = 'SEXTA-FEIRA'
            IF @dia = 7
                SET @diaSemana = 'SÁBADO'
            RETURN @diaSemana
        END
        GO
        
        GO
--2) Crie uma função que de acordo com a carga horária do curso exiba curso rápido ou curso extenso. (Rápido menos de 1000 horas).
  CREATE FUNCTION functCursoRapidoExtenso(@codCurso INT)
      RETURNS VARCHAR(30) AS
        BEGIN
            DECLARE @cargaHoraria INT
            DECLARE @resultado VARCHAR(30)
            IF NOT EXISTS (SELECT 1 FROM tbl_curso WHERE codCurso = @codCurso)
                RETURN 'Curso não encontrado.'
            SET @cargaHoraria = (SELECT cargaHorariaCurso FROM tbl_curso WHERE codCurso = @codCurso)
            IF @cargaHoraria < 1000
                SET @resultado = 'Curso rápido'
            ELSE
                SET @resultado = 'Curso extenso'
            RETURN @resultado
        END
        GO

--3) Crie uma função que de acordo com o valor do curso exiba curso caro ou curso barato. (Curso caro acima de 400).
  CREATE FUNCTION functCursoBaratoCaro(@codCurso INT)
      RETURNS VARCHAR(30) AS
        BEGIN
            DECLARE @valorCurso MONEY
            DECLARE @resultado VARCHAR(30)
            IF NOT EXISTS (SELECT 1 FROM tbl_curso WHERE codCurso = @codCurso)
                RETURN 'Curso não encontrado.'
            SET @valorCurso = (SELECT valorCurso FROM tbl_curso WHERE codCurso = @codCurso)
            IF @valorCurso > 400
                SET @resultado = 'Curso caro'
            ELSE
                SET @resultado = 'Curso barato'
            RETURN @resultado
        END
        GO

--4) Criar uma função que informada a data da matrícula converta-a no formato dd/mm/aaaa
    CREATE FUNCTION functConverterData(@data DATE)
    	RETURNS VARCHAR(40) AS
        BEGIN
        
        	IF NOT EXISTS (SELECT 1 FROM tbl_curso WHERE dataMatricula = @data)
            RETURN 'Matricula não encontrada.'
        
        	DECLARE @resultado VARCHAR(10)
        	SET @resultado = (CONVERT(VARCHAR, @data, 103))
        
        	RETURN @resultado
        END
        GO
