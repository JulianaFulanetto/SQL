/*-----------------------------------------------------------------------
  Curso T�cnico em Desenvolvimento de Sistemas
  Banco de Dados - Gustavo Castello
  Relembrando os comandos de DML em SQL Server
-----------------------------------------------------------------------*/
Use SeuBancoDeDados
Go

/*-----------------------------------------------------------------------
  Cria��o de uma tabela comum para utiliza��o nos testes de comandos
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
('T�nis de corrida preto', 268.45, 'T�nis confort�vel e anat�mico para corrida'),
('T�nis de corrida vermelho', 275.80, 'T�nis confort�vel e anat�mico para corrida')
GO

/*-----------------------------------------------------------------------
  Comandos Insert com omiss�o de campos.
-----------------------------------------------------------------------*/
  INSERT INTO Produto_Remember (Nome)
  VALUES
  ('T�nis de Corrida Rosa')
  GO

/*-----------------------------------------------------------------------
  Inserindo dados na tabela 
-----------------------------------------------------------------------*/
INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('T�nis comum amarelo', 110.80, 'Um bonito t�nis amarelo')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('T�nis comum pink', 110.80, 'Um bonito t�nis pink')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values
        ('T�nis comum verde', 110.80, 'Um bonito t�nis verde')
Go


/*-----------------------------------------------------------------------
  Selecionando itens da tabela com a cl�usula WHERE.
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
	WHERE		<condi��es>
-----------------------------------------------------------------------*/
--UPDATE sem o WHERE -> altera o preco de todos os produtos 

UPDATE Produto_Remember
SET Preco = 150.00
GO

--UPDATE com WHERE -> Altera o pre�o apenas do produto com id = 3
UPDATE Produto_Remember
SET Preco = 449.99
WHERE ProdutoId = 3
GO

SELECT *
FROM Produto_Remember 
GO

--Comando UPDATE alterando v�rios itens
UPDATE Produto_Remember
SET Nome = 'T�nis de corrida rosa xtreme',
	Preco = 980.78,
	Descricao = 'Um t�nis exclusivo para voc� que merece '
WHERE ProdutoId = 3
GO

/*-----------------------------------------------------------------------
	Apagando itens da tabela com o comando Delete 

	Delete From <nome-tabela>
	where <condi��es>
-----------------------------------------------------------------------*/

DELETE FROM Produto_Remember 
WHERE ProdutoId = 3
GO

--CUIDADO AO UTILIZAR SEM A CONDI��O WHERE
DELETE FROM Produto_Remember
GO

SELECT * 
FROM Produto_Remember
GO

/************************************************************************
						Exerc�cios de fixa��o
************************************************************************/

/*-----------------------------------------------------------------------
  1. Utilize o comando Insert para cadastrar mais 5 produtos quaisquer.
  2. Altere o pre�o do produto cujo IdProduto = 11 para R$ 350,00.
  3. Altere o nome e a descri��o do produto cujo IdProduto = 10.
  4. Apague o produto cujo IdProduto = 9.
-----------------------------------------------------------------------*/
--1
INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('T�nis Cinza', 150.00, 'Um bonito t�nis Cinza')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('T�nis Preto', 160.80, 'Um bonito t�nis preto')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('T�nis Roxo', 130.30, 'Um bonito t�nis roxo')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('T�nis brilhante branco', 100.80, 'Um bonito t�nis branco brilhante')
GO

INSERT INTO Produto_Remember (Nome, Preco, Descricao)
Values ('T�nis comum vermelho', 118.80, 'Um bonito t�nis vermelho')
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
SET Nome = 'T�nis de corrida preto brilhante',
	Descricao = 'Um t�nis exclusivo para pessoas lindas'
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
