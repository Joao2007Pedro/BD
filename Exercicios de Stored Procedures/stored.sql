USE db_Encomendas
 
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
