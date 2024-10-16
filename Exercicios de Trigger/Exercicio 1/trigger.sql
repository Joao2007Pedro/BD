USE bd_Loja
GO

-- 1) Criar um trigger que, ao ser feita uma venda (Insert na tabela tbItensVenda), todos os produtos vendidos tenham sua quantidade atualizada na tabela tbProduto. Exemplo, se foi feita uma venda de 5 unidades do produto código 01, na tabela tbProduto a quantidade desse produto será a quantidade atual – 5;
 
CREATE TRIGGER tgAtualizaQuant ON tb_ItensVenda AFTER INSERT 
	AS
	DECLARE @itensVendidos INT, @codProduto INT
	SET @itensVendidos = (SELECT @itensVendidos FROM INSERTED)
	SELECT @codProduto = codProduto FROM INSERTED
	UPDATE tb_ItensVenda
		SET quantidadeItensVenda = quantidadeItensVenda-@itensVendidos
		WHERE codProduto = @codProduto;
 
-- 2) Criar uma trigger que, quando for inserida uma nova entrada de produtos na tbEntradaProduto, a quantidade desse produto seja atualizada e aumentada na tabela tbProduto;
 
CREATE TRIGGER tgAtualizaProduto ON tb_Produto AFTER INSERT
	AS
	DECLARE @entradaProduto INT, @quantidadeProduto INT, @codProduto INT
	SET @entradaProduto = (SELECT @entradaProduto FROM INSERTED)
	SELECT @entradaProduto = @entradaProduto FROM INSERTED
	UPDATE tb_Produto
		SET @entradaProduto = @entradaProduto+@quantidadeProduto
		WHERE codProduto = @codProduto;
 
-- 3) Criar uma trigger que, quando for feita uma venda de um determinado produto, seja feito um Insert na tbSaidaProduto.
 
CREATE TRIGGER tbAtualizaEstoque ON tb_ItensVenda AFTER INSERT 
	AS 
	DECLARE @codProduto INT, @quantidadeSaidaProduto INT, @dataSaidaProduto DATETIME, @codVenda INT
	SET @codProduto = (SELECT codProduto FROM INSERTED)
	SET @quantidadeSaidaProduto = (SELECT quantidadeSaidaProduto FROM INSERTED)
	SET @dataSaidaProduto = (SELECT dataSaidaProduto FROM INSERTED)
	SET @codVenda  = (SELECT dataVenda FROM tb_Venda WHERE codVenda = @codVenda)
		INSERT INTO tb_ItensVenda (codProduto, quantidadeItensVenda,dataSaidaProduto, codVenda)
		VALUES (@codProduto, @quantidadeSaidaProduto, @dataSaidaProduto, @codVenda)
 
