USE Juliana
GO 

INSERT INTO Ex01_Produtos(ProdutoId,Nome,Estoque,Unitario)
VALUES 
(NEWID(),'Notebook Dell Inspiron 15',22,4299.50),
(NEWID(),'iphone 13',15,3948.99),
(NEWID(),'iphone 11',8,2659.87),
(NEWID(),'iphone 15',10,9449.10),
(NEWID(),'Samsung Galaxy S23',19,2680.07)
GO

SELECT Nome, Estoque,
		Unitario AS [Valor Unitário],
		(Estoque * Unitario) AS [Valor em Estoque],
		(Unitario - Unitario * 30 / 100) AS [Desconto]
FROM Ex01_Produtos
WHERE Estoque = 8 
GO

SELECT Nome, Estoque,
		Unitario AS [Valor Unitário],
		(Estoque * Unitario) AS [Valor em Estoque],
		(Unitario - Unitario * 30 / 100) AS [Desconto]
FROM Ex01_Produtos
WHERE Estoque >= 15
GO

SELECT Nome, Estoque,
		Unitario AS [Valor Unitário],
		(Estoque * Unitario) AS [Valor em Estoque],
		(Unitario - Unitario * 30 / 100) AS [Desconto]
FROM Ex01_Produtos
WHERE Estoque <= 10
GO

SELECT Nome, Estoque,
		Unitario AS [Valor Unitário],
		(Estoque * Unitario) AS [Valor em Estoque],
		(Unitario - Unitario * 30 / 100) AS [Desconto]
FROM Ex01_Produtos
WHERE Estoque IN (10,15,31)
GO

SELECT Nome, Estoque,
		Unitario AS [Valor Unitário],
		(Estoque * Unitario) AS [Valor em Estoque],
		(Unitario - Unitario * 30 / 100) AS [Desconto]
FROM Ex01_Produtos
WHERE Estoque = 8 OR Estoque = 10
GO

SELECT Nome, Estoque,
		Unitario AS [Valor Unitário],
		(Estoque * Unitario) AS [Valor em Estoque],
		(Unitario - Unitario * 30 / 100) AS [Desconto]
FROM Ex01_Produtos
--LIKE -> quando não está com o uso de % é semelhante ao =
--LIKE-> quanod utilizo %nofim, procura na tabela os itens que comecem com o termo descrito (NomePesquisado%)
--Like '%NomePesquisado%' -> quando utilizado % antes e depois pesquisa na coluna delimitada, todos os itens que contenham o termo procurado 
WHERE Nome LIKE '%%'
GO

INSERT INTO Ex01_Clientes (ClienteId, Nome, CPF, DataNascimento, Genero)
Values 
(NEWID(), 'Zeferina Silva', '666.666.666-66', '1986-07-08', 'F'),
(NEWID(), 'Ubiratan Lopes Da Silva', '777.777.777-77', '1980-11-23', 'M')
GO

--EX01
SELECT *
FROM Ex01_Produtos 
WHERE Nome LIKE '%15%'
GO

--EX02
SELECT * 
FROM Ex01_Clientes 
WHERE Nome LIKE '%Silva%'
GO

--EX03
SELECT * 
FROM Ex01_Clientes 
WHERE Nome LIKE '%Silva%' AND Genero = 'F'
GO

--EX04
SELECT *
FROM Ex01_Clientes
WHERE DataNascimento >= '1981-01-01'
GO

--EX05
SELECT *
FROM Ex01_Produtos
WHERE Estoque < 10 OR Estoque > 30
GO 