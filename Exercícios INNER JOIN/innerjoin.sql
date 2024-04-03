-- EXIBINDO O CODIGO DO PRODUTO E A DESCRIÇÃO JUNTO AO NOME DO FRABICANTE
		SELECT 
		p.codProduto AS 'Codigo',  p.descricaoProduto AS 'Descricacao', f.nomeFabricante AS 'Fabricante' 
		FROM tb_Produto p
		INNER JOIN tb_Fabricante f 
		ON f.codFabricante = p.codFabricante;
 
-- EXIBINDO O CODIGO DO PRODUTO E A DESCRIÇÃO JUNTO AO NOME DO FORNECEDOR
		SELECT 
		p.codProduto AS 'Codigo',  p.descricaoProduto AS 'Descricacao', f.nomeFornecedor AS 'Fornecedor' 
		FROM tb_Produto p
		INNER JOIN tb_Fornecedor f 
		ON f.codFornecedor = p.codFornecedor;
 
-- LISTANDO A SOMA DA QUANTIDADE DE PRODUTOS AGRUPADAS DE ACORDO COM O FABRICANTE	
		SELECT 
		f.nomeFabricante AS 'Fabricante', 
			SUM(quantidadeProduto) AS 'TotalQuantidade' FROM tb_Produto p
		INNER JOIN tb_Fabricante f 
		ON f.codFabricante = p.codFabricante
		GROUP BY f.nomeFabricante;
 
--	SOMANDO O VALOR TOTAL DE VENDAS E MOSTRANDO O NOME DO CLIENTE
		SELECT 
		c.nomeCliente AS 'Cliente',
			SUM(v.valorTotalVenda) AS 'Total' FROM tb_Venda v
		INNER JOIN tb_Cliente c ON c.codCliente = v.codCliente
		GROUP BY c.nomeCliente;
        
-- MEDIA DOS PRECOS JUNTO AO NOME DO FORNECEDOR
		SELECT 
        f.nomeFornecedor AS 'Fornecedor', 
            AVG(p.valorProduto) AS 'MediaPrecos' FROM tb_Produto p
        INNER JOIN tb_Fornecedor f ON f.codFornecedor = p.codFornecedor
        GROUP BY f.nomeFornecedor;
        
-- SOMA DAS VENDAS DE ACORDO COM O NOME DO CLIENTE E EM ORDEM ALFABETICA
		SELECT 
        c.nomeCliente AS 'Cliente',
            SUM(v.valorTotalVenda) AS 'Total' FROM tb_Venda v
        INNER JOIN tb_Cliente c ON c.codCliente = v.codCliente
        GROUP BY c.nomeCliente
        ORDER BY c.nomeCliente ASC;
        
-- SOMA DOS PRECOS AGRUPADOS COM O NOME DO FABRICANTE
		SELECT 
        f.nomeFabricante AS 'Fabricante', 
        	SUM(p.valorProduto) AS 'SomaPrecos' FROM tb_Produto p
    	INNER JOIN tb_Fabricante f ON f.codFabricante = p.codFabricante
    	GROUP BY f.nomeFabricante;
        
-- A MEDIA DOS PRECOS COM O NOME DO FORNECEDOR
        SELECT 
        f.nomeFornecedor AS 'Fornecedor', 
            AVG(p.valorProduto) AS 'MediaPrecos' FROM tb_Produto p
        INNER JOIN tb_Fornecedor f ON f.codFornecedor = p.codFornecedor
        GROUP BY f.nomeFornecedor;
        
-- SOMA DAS VENDAS AGRUPADOS COM O NOME DO PRODUTO
		SELECT 
    	p.descricaoProduto AS 'Produto', 
    		SUM(iv.subTotalItensVenda) AS 'TotalVendas' FROM tb_ItensVenda iv
		INNER JOIN tb_Produto p ON p.codProduto = iv.codProduto
		GROUP BY p.descricaoProduto;
        
-- A SOMA DAS VENDA COM O NOME DO CLIENTE SOMENTE EM FEVEREIRO DE 2014
		SELECT 
    	c.nomeCliente AS 'Cliente',
    		SUM(v.valorTotalVenda) AS 'Total' FROM tb_Venda v
		INNER JOIN tb_Cliente c ON c.codCliente = v.codCliente
		WHERE YEAR(v.dataVenda) = 2014 AND MONTH(v.dataVenda) = 2
		GROUP BY c.nomeCliente;
