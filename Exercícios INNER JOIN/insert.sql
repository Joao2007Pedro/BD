
INSERT INTO tb_Cliente VALUES
	('Armando José Santana', '12345678900', 'armandojsantana@outlook.com', 'm', '19610221'),
	('Sheila Carvalho Leal', '45678909823', 'scarvalho@ig.com.br', 'f', '19780913'),
	('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com', 'm', '18910908'),
	('Maria Aparecida Souza', '87365309899', 'mapdasouza@outlook.com', 'f', '19620202'),
	('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'f', '19770409'),
	('Paulo Henrique Silva', '87390123111', 'phsilva80@hotmail.com', 'm', '19870202');
 
INSERT INTO tb_Fabricante VALUES
	('Unilever'),
	('P&G'),
	('Bunge');
 
INSERT INTO tb_Fornecedor VALUES 
	('Atacadão', 'Carlos Santos'),
	('Assai', 'Maria Stella'),
	('Roldão', 'Paulo César');
 
INSERT INTO tb_Produto VALUES 
	('Amaciante Downy', 5.76, '1500', '2', '1'),
	('Amaciante Comfort', 5.45, '2300', '1', '1'),
	('Sabão em pó OMO', 5.99, '1280', '1', '2'),
	('Marganna Qually', 4.76, '2500', '3', '1'),
	('Salsicha Hot Dog Sadia', 6.78, '2900', '3', '2'),
	('Mortadela Perdigão', 2.50, '1200', '3', '3'),
	('Hamburger Sadia', 9.89, '1600', '3', '1'),
	('Fralda Pampers', 36.00, '340', '2', '3'),
	('Xampu Seda', 5.89, '800', '1', '2'),
	('Condicionador Seda', 6.50, '700', '1', '3');
 
INSERT INTO tb_Venda VALUES
    ('20140201', 4500.00, 1),
    ('20140203', 3400.00, 1),
    ('20140210', 2100.00, 2),
    ('20140215', 2700.00, 3),
    ('20140317', 560.00, 3),
    ('20140409', 1200.00, 4),
    ('20140507', 3500.00, 5),
    ('20140507', 3400.00, 1);
 

INSERT INTO tb_ItensVenda VALUES
	('1', '1', '200', 1500.00),
	('1', '2','300', 3000.00 ),
	('2', '4', '120', 1400.00),
	('2', '2', '200', 1000.00),
	('2', '3', '130', 1000.00),
	('3', '5', '200', 2100.00),
	('4', '4', '120', 1000.00),
	('4', '5', '450', 700.00),
	('5', '5', '200', 560.00),
	('6', '7', '200', 600.00),
	('6', '6', '300', 600.00),
	('8', '1', '300', 2500.00),
	('8', '2', '200', 1000.00),
	('9', '6', '250', 1700.00),
	('9', '5', '200', 1700.00),
	('10', '4', '1000', 4000.00);
