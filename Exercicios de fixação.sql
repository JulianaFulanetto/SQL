/*-----------------------------------------------------------------------
  Curso Técnico em Desenvolvimento de Sistemas
  Banco de Dados - Gustavo Castello
  Relembrando os comandos de DML em SQL Server
-----------------------------------------------------------------------*/
Use SeuBancoDeDados
Go

/*-----------------------------------------------------------------------
  Criação de uma tabela comum para utilização nos testes de comandos
-----------------------------------------------------------------------*/
CREATE TABLE Produto_Remember (
	ProdutoId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Preco DECIMAL(5,2) NOT NULL DEFAULT 150,
    Descricao VARCHAR(300)
)
GO

/*-----------------------------------------------------------------------
  Inserindo multiplos dados na tabela 
-----------------------------------------------------------------------*/

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
VALUES
('Tênis de corrida preto', 268.45, 'Tênis confortável e anatômico para corrida'),
('Tênis de corrida vermelho', 275.80, 'Tênis confortável e anatômico para corrida')
GO

/*-----------------------------------------------------------------------
  Comandos Insert com omissão de campos.
-----------------------------------------------------------------------*/
  INSERT INTO Produto_Remember (Nome)
  VALUES
  ('Tênis de Corrida Rosa')
  GO

/*-----------------------------------------------------------------------
  Inserindo dados na tabela 
-----------------------------------------------------------------------*/
INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('Tênis comum amarelo', 110.80, 'Um bonito tênis amarelo')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('Tênis comum pink', 110.80, 'Um bonito tênis pink')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values
        ('Tênis comum verde', 110.80, 'Um bonito tênis verde')
Go


/*-----------------------------------------------------------------------
  Selecionando itens da tabela com a cláusula WHERE.
-----------------------------------------------------------------------*/
/* Todos os registros (produtos) */
Select 	*
From 	Produto_Remember
Go

/* Apenas o registro (produto) com IdProduto = 3 */
Select 	*
From 	Produto_Remember
Where	ProdutoId = 3
Go

/*-----------------------------------------------------------------------
  Atualizando OS dados da tabela com o comando (UPDATE)

	UPDATE		<nome-tabela>
	SET			<nome-campo> =<valor>
	WHERE		<condições>
-----------------------------------------------------------------------*/
--UPDATE sem o WHERE -> altera o preco de todos os produtos 

UPDATE Produto_Remember
SET Preco = 150.00
GO

--UPDATE com WHERE -> Altera o preço apenas do produto com id = 3
UPDATE Produto_Remember
SET Preco = 449.99
WHERE ProdutoId = 3
GO

SELECT *
FROM Produto_Remember 
GO

--Comando UPDATE alterando vários itens
UPDATE Produto_Remember
SET Nome = 'TÊnis de corrida rosa xtreme',
	Preco = 980.78,
	Descricao = 'Um tÊnis exclusivo para você que merece '
WHERE ProdutoId = 3
GO

/*-----------------------------------------------------------------------
	Apagando itens da tabela com o comando Delete 

	Delete From <nome-tabela>
	where <condições>
-----------------------------------------------------------------------*/

DELETE FROM Produto_Remember 
WHERE ProdutoId = 3
GO

--CUIDADO AO UTILIZAR SEM A CONDIÇÃO WHERE
DELETE FROM Produto_Remember
GO

SELECT * 
FROM Produto_Remember
GO

/************************************************************************
						Exercícios de fixação
************************************************************************/

/*-----------------------------------------------------------------------
  1. Utilize o comando Insert para cadastrar mais 5 produtos quaisquer.
  2. Altere o preço do produto cujo IdProduto = 11 para R$ 350,00.
  3. Altere o nome e a descrição do produto cujo IdProduto = 10.
  4. Apague o produto cujo IdProduto = 9.
-----------------------------------------------------------------------*/
--1
INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('Tênis Cinza', 150.00, 'Um bonito tênis Cinza')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('Tênis Preto', 160.80, 'Um bonito tênis preto')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('Tênis Roxo', 130.30, 'Um bonito tênis roxo')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('Tênis brilhante branco', 100.80, 'Um bonito tênis branco brilhante')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('Tênis comum vermelho', 118.80, 'Um bonito tênis vermelho')
GO


SELECT *
FROM Produto_Remember 
GO

--2
UPDATE Produto_Remember
SET Preco = 350.00
WHERE ProdutoId = 11
GO

SELECT *
FROM Produto_Remember 
GO

--3
UPDATE Produto_Remember
SET Nome = 'TÊnis de corrida preto brilhante',
	Descricao = 'Um tÊnis exclusivo para pessoas lindas'
WHERE ProdutoId = 10
GO

SELECT *
FROM Produto_Remember 
GO

--4
DELETE FROM Produto_Remember 
WHERE ProdutoId = 9
GO

SELECT *
FROM Produto_Remember 
GO
