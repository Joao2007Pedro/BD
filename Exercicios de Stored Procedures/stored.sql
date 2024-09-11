-- a) Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo
		CREATE PROCEDURE Inserir_Categorias
			@nomeCategoriaProduto VARCHAR (100)
		AS
			BEGIN 
			INSERT INTO tb_CategoriaProduto (nomeCategoriaProduto)
			VALUES (@nomeCategoriaProduto);
	 
		END
		EXEC Inserir_Categorias 'Bolo Festa' 
		EXEC Inserir_Categorias 'Bolo Simples'
		EXEC Inserir_Categorias 'Torta'
		EXEC Inserir_Categorias 'Salgado'
 
-- b) Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado
		CREATE PROCEDURE Inserir_Produtos
		@nomeProduto VARCHAR(100),
		@precoKiloProduto DECIMAL(10, 2),
		@codCategoriaProduto INT
	AS
			BEGIN
				IF NOT EXISTS (SELECT 1 FROM tb_CategoriaProduto WHERE codCategoriaProduto = @codCategoriaProduto)
				BEGIN
					PRINT 'O código da categoria não existe.';
					RETURN;
				END
				IF NOT EXISTS (SELECT 1 FROM tb_Produto WHERE nomeProduto = @nomeProduto)
				BEGIN
					INSERT INTO tb_Produto (nomeProduto, precoKiloProduto, codCategoriaProduto)
					VALUES (@nomeProduto, @precoKiloProduto, @codCategoriaProduto);
				END
				ELSE
				BEGIN
					PRINT 'O produto já existe na tabela.';
				END
			END

			EXEC Inserir_Produtos 'Bolo Floresta Negra', 42.00, '1'
			EXEC Inserir_Produtos 'Bolo Prestpigio', 43.00, '1'
			EXEC Inserir_Produtos 'Bolo Nutella', 44.00, '1'
			EXEC Inserir_Produtos 'Bolo Formigueiro', 17.00, '2'
			EXEC Inserir_Produtos 'Bolo de cenoura', 19.00, '2'
			EXEC Inserir_Produtos 'Torta de palmito', 45.00, '3'
			EXEC Inserir_Produtos 'Torta de frango e catupiry', 47.00, '3'
			EXEC Inserir_Produtos 'Torta de escarola ', 44.00, '3'
			EXEC Inserir_Produtos 'Coxinha frango', 25.00, '4'
			EXEC Inserir_Produtos 'Esfiha came', 27.00, '4'
			EXEC Inserir_Produtos 'Folhado queijo', 31.00, '4'
			EXEC Inserir_Produtos 'Risoles misto', 29.00, '4'

-- c) Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que deverão ser feitas duas validações: - Verificar pelo CPF se o cliente já existe. Caso já exista emitir a mensagem: “Cliente cpf XXXXX já cadastrado” (Acrescentar a coluna CPF)
-- Verificar se o cliente é morador de Itaquera ou Guaianases, pois a confeitaria não realiza entregas para clientes que residam fora desses bairros. Caso o cliente não seja morador desses bairros enviar a mensagem “Não foi possível cadastrar o cliente XXXX pois o bairro XXXX não é atendido pela confeitaria”

		CREATE PROCEDURE Inserir_Cliente
		    @nomeCliente VARCHAR(100),
		    @dataNascimentoCliente SMALLDATETIME,
		    @ruaCliente VARCHAR(100),
		    @numCasaCliente VARCHAR(20),
		    @cepCliente VARCHAR(50),
		    @bairroCliente VARCHAR(100),
		    @sexoCliente VARCHAR(1)
		AS
		BEGIN
		    IF EXISTS (SELECT * FROM tb_Cliente WHERE cpfCliente = @cpfCliente)
		    BEGIN
		        PRINT 'Cliente CPF ' + @cpfCliente + ' já cadastrado';
		        RETURN;
		    END
		    IF @bairroCliente NOT IN ('Itaquera', 'Guaianases')
		    BEGIN
		        PRINT 'Não foi possível cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' não é atendido pela confeitaria';
		        RETURN;
		    END
		    INSERT INTO tb_Cliente (nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente,sexoCliente)
		    VALUES (@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @sexoCliente);
		    PRINT 'Cliente ' + @nomeCliente + ' cadastrado com sucesso!';
		END

		EXEC Inserir_Cliente 'Samira Fatah', '1990-05-05', 'Rua Aguapei', '1000', '08090-000', 'Guaianases','F'
		EXEC Inserir_Cliente 'Celia Nogueira', '1992-06-06', 'Rua Andes', '234', '08456-090', 'Guaianases','F'
		EXEC Inserir_Cliente 'Paulo Cesar Siqueira', '1984-04-04', 'Rua Castelo do Piaui', '232', '08109-000', 'Itaquera','M'
		EXEC Inserir_Cliente 'Rodrigo Favaroni', '1991-04-09', 'Rua Sansao Castelo Branco', '10', '08431-090', 'Guaianases','M'
		EXEC Inserir_Cliente 'Flavia Regina Brito', '1992-04-22', 'Rua Mariano Moro', '300', '08200-123', 'Itaquera','F'

-- d) Criar via stored procedure as encomendas abaixo relacionadas, fazendo as verificações abaixo: No momento da encomenda o cliente irá fornecer o seu cpf. Caso ele não tenha sido cadastrado enviar a mensagem “não foi possível efetivar a encomenda pois o cliente xxxx não está cadastrado”
-- Verificar se a data de entrega não é menor do que a data da encomenda. Caso seja enviar a mensagem “não é possível entregar uma encomenda antes da encomenda ser realizada” Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: “Encomenda XXX para o cliente YYY efetuada com sucesso” sendo que no lugar de XXX deverá aparecer o número da encomenda e no YYY deverá aparecer o nome do cliente;
	CREATE PROCEDURE Inserir_Encomenda
	      @dataEncomenda DATETIME,
	      @valorTotalEncomenda DECIMAL(10, 2),
	      @dataEntregaEncomenda DATETIME
	AS
	BEGIN
	    DECLARE @codCliente INT;
	    DECLARE @nomeCliente VARCHAR(100);
	    SELECT @codCliente = codCliente, @nomeCliente = nomeCliente
	    FROM tb_Cliente
	    WHERE cpfCliente = @cpfCliente;
	    IF @codCliente IS NULL
	    BEGIN
	        PRINT 'Não foi possível efetivar a encomenda pois o cliente ' + @cpfCliente + ' não está cadastrado';
	        RETURN;
	    END
	    IF @dataEntregaEncomenda < @dataEncomenda
	    BEGIN
	        PRINT 'Não é possível entregar uma encomenda antes da encomenda ser realizada';
	        RETURN;
	    END
	    INSERT INTO tb_Encomenda (dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
	    VALUES (@dataEncomenda, @codCliente, @valorTotalEncomenda, @dataEntregaEncomenda);
	    DECLARE @codEncomenda INT;
	    SET @codEncomenda = SCOPE_IDENTITY();
	    PRINT 'Encomenda ' + CAST(@codEncomenda AS VARCHAR) + ' para o cliente ' + @nomeCliente + ' efetuada com sucesso';
	END

		EXEC Inserir_Encomenda '123.456.789-00', '2015-08-08 10:00:00', 450.00, '2024-08-15 00:00:00';
		EXEC Inserir_Encomenda '987.654.321-00', '2015-10-10 10:00:00', 200.00, '2024-10-15 00:00:00'; 
		EXEC Inserir_Encomenda '567.890.123-45', '2015-10-10 10:00:00', 150.00, '2024-12-10 00:00:00';
		EXEC Inserir_Encomenda '567.890.123-45', '2015-10-06 10:00:00', 250.00, '2024-10-12 00:00:00';
		EXEC Inserir_Encomenda '567.890.123-45', '2015-10-05 10:00:00', 150.00, '2024-10-12 00:00:00';


-- e) Ao adicionar a encomenda, criar uma Stored procedure, para que sejam inseridos os itens da encomenda conforme tabela a seguir. 
	CREATE PROCEDURE Inserir_ItensEncomenda
	    @codEncomenda INT,
	    @codProduto INT,
	    @quantidadeKilos FLOAT,
	    @subTotal FLOAT
	AS
	BEGIN
	    IF NOT EXISTS (SELECT 1 FROM tb_Encomenda WHERE codEncomenda = @codEncomenda)
	    BEGIN
	        PRINT 'Encomenda não encontrada.';
	        RETURN;
	    END
	    IF NOT EXISTS (SELECT 1 FROM tb_Produto WHERE codProduto = @codProduto)
	    BEGIN
	        PRINT 'Produto não encontrado.';
	        RETURN;
	    END
	    INSERT INTO tb_ItensEncomenda (codEncomenda, codProduto, quantidadeKilos, subTotal)
	    VALUES (@codEncomenda, @codProduto, @quantidadeKilos, @subTotal);
	
	    PRINT 'Item da encomenda inserido com sucesso.';
	END

	EXEC Inserir_ItensEncomenda 1, 1, 2.5, 105.00;
	EXEC Inserir_ItensEncomenda 1, 10, 2.6, 70.00;
	EXEC Inserir_ItensEncomenda 1, 6, 6, 150.00;
	EXEC Inserir_ItensEncomenda 2, 12, 4.3, 125.00;
	EXEC Inserir_ItensEncomenda 2, 8, 8, 200.00;
	EXEC Inserir_ItensEncomenda 3, 11, 3.2, 100.00;
	EXEC Inserir_ItensEncomenda 3, 2, 2, 50.00;
	EXEC Inserir_ItensEncomenda 3, 9, 3.5, 100.00;
	EXEC Inserir_ItensEncomenda 5, 6, 2.2, 100.00;
	EXEC Inserir_ItensEncomenda 5, 5, 3.4, 150.00;

-- f) Após todos os cadastros, criar Stored procedures para alterar o que se pede:
-- 1- O preço dos produtos da categoria “Bolo festa” sofreram um aumento de 10%
	CREATE PROCEDURE Aumentar_Preco_BoloFesta
	AS
	BEGIN
	    UPDATE tb_Produto
	    SET precoKiloProduto = precoKiloProduto * 1.10
	    WHERE codCategoriaProduto = (SELECT codCategoriaProduto FROM tb_CategoriaProduto WHERE nomeCategoriaProduto = 'Bolo Festa');	
	    PRINT 'Preços dos produtos da categoria "Bolo Festa" aumentados em 10%.';
	END;
	EXEC Aumentar_Preco_BoloFesta;

-- 2- O preço dos produtos categoria “Bolo simples” estão em promoção e terão um desconto de 20%;
	CREATE PROCEDURE Desconto_Preco_BoloSimples
	AS
	BEGIN
	    UPDATE tb_Produto
	    SET precoKiloProduto = precoKiloProduto * 0.80
	    WHERE codCategoriaProduto = (SELECT codCategoriaProduto FROM tb_CategoriaProduto WHERE nomeCategoriaProduto = 'Bolo Simples');
	    PRINT 'Preços dos produtos da categoria "Bolo Simples" reduzidos em 20%.';
	END;
	EXEC Desconto_Preco_BoloSimples;

-- 3- O preço dos produtos categoria “Torta” aumentaram 25%
	CREATE PROCEDURE Aumentar_Preco_Torta
	AS
	BEGIN
	    UPDATE tb_Produto
	    SET precoKiloProduto = precoKiloProduto * 1.25
	    WHERE codCategoriaProduto = (SELECT codCategoriaProduto FROM tb_CategoriaProduto WHERE nomeCategoriaProduto = 'Torta');
	    PRINT 'Preços dos produtos da categoria "Torta" aumentados em 25%.';
	END;
	EXEC Aumentar_Preco_Torta;

-- 4- O preço dos produtos categoria “Salgado”, com exceção da esfiha de carne, sofreram um aumento de 20%
	CREATE PROCEDURE Aumentar_Preco_Salgado
	AS
	BEGIN
	    UPDATE tb_Produto
	    SET precoKiloProduto = precoKiloProduto * 1.20
	    WHERE codCategoriaProduto = (SELECT codCategoriaProduto FROM tb_CategoriaProduto WHERE nomeCategoriaProduto = 'Salgado')
	    AND nomeProduto != 'Esfiha came';
	    PRINT 'Preços dos produtos da categoria "Salgado", exceto Esfiha de Carne, aumentados em 20%.';
	END;
	EXEC Aumentar_Preco_Salgado;

-- g) Criar uma procedure para excluir clientes pelo CPF sendo que:
-- 1- Caso o cliente possua encomendas emitir a mensagem “Impossivel remover esse cliente pois o cliente XXXXX possui encomendas; onde XXXXX é o nome do cliente.
-- 2- Caso o cliente não possua encomendas realizar a remoção e emitir a mensagem “Cliente XXXX removido com sucesso”, onde XXXX é o nome do cliente;
	CREATE PROCEDURE Excluir_Cliente_Por_CPF 
	    @cpfCliente VARCHAR(11)
	AS
	BEGIN
	    DECLARE @nomeCliente VARCHAR(100);
	    SELECT @nomeCliente = nomeCliente 
	    FROM tb_Cliente 
	    WHERE cpfCliente = @cpfCliente;
	    IF @nomeCliente IS NULL
	    BEGIN
	        PRINT 'Cliente não encontrado.';
	        RETURN;
	    END
	    IF EXISTS (SELECT 1 
	               FROM tb_Encomenda 
	               WHERE codCliente = (SELECT codCliente 
	                                   FROM tb_Cliente 
	                                   WHERE cpfCliente = @cpfCliente))
	    BEGIN
	        PRINT 'Impossível remover esse cliente pois o cliente ' + @nomeCliente + ' possui encomendas.';
	    END
	    ELSE
	    BEGIN
	        DELETE FROM tb_Cliente 
	        WHERE cpfCliente = @cpfCliente;
	        PRINT 'Cliente ' + @nomeCliente + ' removido com sucesso.';
	    END
	END;

-- h) Criar uma procedure que permita excluir qualquer item de uma encomenda cuja data de entrega seja maior que a data atual. Para tal o cliente deverá fornecer o código da encomendae o código do produto que será excluído da encomenda. 
-- A procedure deverá remover o item e atualizar o valor total da encomenda, do qual deverá ser subtraído o valor do item a ser removido. A procedure poderá remover apenas um item da encomenda de cada vez.
	CREATE PROCEDURE Excluir_Item_Encomenda
	    @codEncomenda INT,
	    @codProduto INT
	AS
	BEGIN
	    DECLARE @dataEntrega DATETIME;
	    DECLARE @subTotal FLOAT;
	    DECLARE @valorTotalEncomenda FLOAT;
	    SELECT @dataEntrega = dataEntregaEncomenda
	    FROM tb_Encomenda
	    WHERE codEncomenda = @codEncomenda;
	    IF @dataEntrega <= GETDATE()
	    BEGIN
	        PRINT 'Não é possível remover o item, pois a data de entrega da encomenda é igual ou anterior à data atual.';
	        RETURN;
	    END
	    SELECT @subTotal = subTotal
	    FROM tb_ItensEncomenda
	    WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto;
	    IF @subTotal IS NULL
	    BEGIN
	        PRINT 'O item especificado não foi encontrado na encomenda.';
	        RETURN;
	    END
	    DELETE FROM tb_ItensEncomenda
	    WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto;
	    SELECT @valorTotalEncomenda = valorTotalEncomenda
	    FROM tb_Encomenda
	    WHERE codEncomenda = @codEncomenda;
	    SET @valorTotalEncomenda = @valorTotalEncomenda - @subTotal;
	    UPDATE tb_Encomenda
	    SET valorTotalEncomenda = @valorTotalEncomenda
	    WHERE codEncomenda = @codEncomenda;
	    PRINT 'Item removido com sucesso e valor total da encomenda atualizado.';
	END;





	
	
			

