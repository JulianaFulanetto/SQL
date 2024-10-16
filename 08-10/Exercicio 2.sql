/*-----------------------------------------------------------------------
  Curso Técnico em Desenvolvimento de Sistemas
  Banco de Dados - Prof. Gustavo Castello
  Script: 06A BD - Criação, alteração e exclusão de tabelas
----------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
  Criação do banco de dados 
-----------------------------------------------------------------------*/
--Create Database SeuNome
--Go
Use Juliana
Go

/*-----------------------------------------------------------------------
  Criação de uma tabela de pessoas 
-----------------------------------------------------------------------*/
CREATE TABLE Ex02_Pessoas (
	Pessoa INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	Nome VARCHAR(80) NOT NULL
)
GO

INSERT Ex02_Pessoas
VALUES
('Pafúncio'),
('Zuleika'),
('Emengarda'),
('Adrúbal')
GO

SELECT * FROM Ex02_Pessoas
GO 

/*----------------------------------------------------------------
ALTERANDO A TABELA DE PESSOA PARA RENOMEAR UMA COLUNA JA EXISTENTE
----------------------------------------------------------------*/
EXEC sp_rename 'Ex02_Pessoas.Nome',	'NomePessoa', 'Column'
GO

/*----------------------------------------------------------------
ALTERANDO A TABELA DE PESSOAS PARA INSERIR UMA COLUNA ADICIONAL "IDADE"
        ***********VAMOS CRIAR COM TIPO ERRADO************
----------------------------------------------------------------*/
ALTER TABLE Ex02_Pessoas 
ADD Idade VARCHAR(3)
GO

SELECT * FROM Ex02_Pessoas
GO

/*----------------------------------------------------------------
Alterando a tabela de pessoas para corrigir o tipo de coluna "IDADE"
----------------------------------------------------------------*/
ALTER TABLE Ex02_Pessoas
ALTER COLUMN Idade INT 
GO

SELECT * FROM Ex02_Pessoas
GO

/*----------------------------------------------------------------
ALTERANDO A TABELA DE PESSOAS PARA INSERIR UMA COLINA ADICIONAL
"DataNascimento" especificando um valor padrão de data e hora atual
----------------------------------------------------------------*/
ALTER TABLE Ex02_Pessoas
ADD DataNascimento DateTime NOT NULL DEFAULT GETDATE()
GO

SELECT * FROM Ex02_Pessoas
GO

/*----------------------------------------------------------------
ALTERANDO A TABELA DE PESSOAS EXCLUINDO UMA COLUNA (IDADE)
----------------------------------------------------------------*/
ALTER TABLE Ex02_Pessoas
DROP COLUMN Idade
GO

ALTER TABLE Ex02_Pessoas
GO
/*----------------------------------------------------------------
INSERINDO UMA NOVA PESSOA NA TABELA APOS AS ALTERAÇÕES 
----------------------------------------------------------------*/

INSERT INTO Ex02_Pessoas(NomePessoa,DataNascimento)
VALUES 
('Ubiratan', '1988-04-04 12:03:02')
GO

SELECT * FROM Ex02_Pessoas
GO

/*----------------------------------------------------------------
DELETANDO UMA LINHA ESPECÍFICA DA TABELA (linha = dado) 
	NUNCA VAMOS 
----------------------------------------------------------------*/
DELETE FROM Ex02_Pessoas
WHERE PessoaId = 5
GO

SELECT * FROM Ex02_Pessoas
GO

/*----------------------------------------------------------------
					ATIVIDADE PRÁTICA
CRIE UMA TABELA CHAMADA 'Ex02_Carros' COM OS CAMPOS CarroId (PK), 
Carro, Ano e Cor
----------------------------------------------------------------*/

CREATE TABLE Ex02_Carros(
CarroId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Carro VARCHAR(50) NOT NULL, 
Ano INT NOT NULL,
Cor VARCHAR(30) NOT NULL
)
GO	

/*----------------------------------------------------------------
ALTERANDO A TABELA CARROS PARA INCLUIR UMA FK (Foreign Key) relacionada à tabela pessoas paea informar qual pessoa possui determinadp carrp.
	cardinalidade: Pessias (1,1) -possui - (1,	N) Carros
----------------------------------------------------------------*/
ALTER TABLE Ex02_Carros
ADD Pessoa INT NOT NULL,
		CONSTRAINT FK_CarrosPessoas
		FOREIGN KEY (Pessoa) REFERENCES Ex02_Pessoas (Pessoa)
GO
/*----------------------------------------------------------------
Cadastrando alguns registros na tabela de Carros
----------------------------------------------------------------*/

INSERT INTO Ex02_Carros(Carro,Ano,Cor,Pessoa)
VALUES 
('Fusca', 1973, 'Verde', 3),
('Corsa', 1997, 'Prata', 1),
('Focus', 2012, 'Branco', 2)
GO

--O comando abaixo está errado posis não temos a pessoa 7 cadastrada na tabela pessoas
INSERT INTO Ex02_Carros(Carro,Ano,Cor,Pessoa)
VALUES('Onix', 2021, 'Preto', 7)
GO

SELECT * FROM Ex02_Carros
GO