-- 1) Criar um trigger que ao veículo tomar uma multa os pontos da multa sejam atualizados na tabela do motorista no campo pontuacaoAcumulada. Caso o motorista alcance 20 pontos informar via mensagem que o mesmo poderá ter sua habilitação suspensa.
    CREATE TRIGGER tgAtualizaPontos ON tbMulta AFTER INSERT
        AS
      BEGIN
  	    DECLARE @idMotorista INT, @pontosMulta INT, @pontuacaoAcumulada INT
    	  SELECT @idMotorista = inserted.idMotorista, @pontosMulta = INSERTED.pontosMulta FROM INSERTED
    	  UPDATE tbMotorista
    	  SET pontuacaoAcumulada = pontuacaoAcumulada + @pontosMulta
    	  WHERE idMotorista = @idMotorista
    	  SELECT @pontuacaoAcumulada = pontuacaoAcumulada FROM tbMotorista
    	WHERE idMotorista = @idMotorista
    	IF (@pontuacaoAcumulada >= 20)
    	BEGIN
    		PRINT 'Você pode ter sua habilitação suspensa'
    	END
    END

-- 2) 
	-- a) Ao ser feito um depósito atualize o saldo da conta corrente somando a quantia depositada
      CREATE TRIGGER tr_AtualizaSaldoDeposito ON tbDeposito AFTER INSERT
      AS
      BEGIN
      UPDATE tbContaCorrente
        SET saldoConta = saldoConta + inserted.valorDeposito FROM tbContaCorrente
      INNER JOIN INSERTED ON tbContaCorrente.numConta = INSERTED.numConta;
      END;

  -- b) Ao ser feito um saque atualize o saldo da conta corrente descontando o valor caso tenha saldo suficiente
      CREATE TRIGGER tr_AtualizaSaldoSaque ON tbSaque AFTER INSERT
      AS
      BEGIN
      DECLARE @saldoAtual DECIMAL(18, 2);
      DECLARE @valorSaque DECIMAL(18, 2);
      DECLARE @numConta INT;
      SELECT @valorSaque = s.valorSaque, @numConta = s.numConta FROM INSERTED 
      AS s;
      SELECT @saldoAtual = saldoConta
      FROM tbContaCorrente
      WHERE numConta = @numConta;
      IF @saldoAtual >= @valorSaque
      BEGIN
          UPDATE tbContaCorrente
          SET saldoConta = saldoConta - @valorSaque
          WHERE numConta = @numConta;
      END
      ELSE
      BEGIN
          PRINT('Saldo insuficiente para realizar o saque.');
      END;
    END;
