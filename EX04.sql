/*-----------------------------------------------------------------------
  Curso Técnico em Desenvolvimento de Sistemas
  Banco de Dados - Prof. Gustavo Castello
  Exercícios de Fixação: 06C BD - DDL - Criação e Alteração de Estruturas de Dados
 ----------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
  Criação do banco de dados 
-----------------------------------------------------------------------*/
--CREATE DATABASE dbAtividade06c
--Go
USE Juliana
Go

/*-----------------------------------------------------------------------
1. 	Escreva os comandos DDL necessários para criar e relacionar (1-N) as 
	tabelas 	abaixo.
	
	Tabela: Empresa
		Cnpj : tipo de dados inteiro e chave primária
		Empresa : tipo de dados varchar(80)
		
	Tabela: Empregado
		Cpf : tipo de dados inteiro e chave primária
		Nome : tipo de dados varchar(80)
		
	Relacionamento :  Cardinalidade (1-N) entre Empresa e Empregado
-----------------------------------------------------------------------*/
CREATE TABLE Ex04_Empresa (
CNPJ INT NOT NULL PRIMARY KEY,
Empresa VARCHAR(80) NOT NULL 
)
GO

CREATE TABLE Ex04_Empregado (
Cpf INT NOT NULL  PRIMARY KEY,
Nome VARCHAR(80) NOT NULL 
)
GO 

ALTER TABLE Ex04_Empregado
ADD CNPJ INT NOT NULL,
		CONSTRAINT FK_EmpregadoEmpresa
		FOREIGN KEY (CNPJ) REFERENCES Ex04_Empresa (CNPJ)
GO

/*-----------------------------------------------------------------------
2. 	Escreva os comandos DDL necessários para realacionar (N-1) as tabelas
	abaixo.
		Cidades					UFs
	====================   ==================
	  CidadeId INT PK		  UFId INT PK
	Cidade VARCHAR(80)		 UF VARCHAR(2)
	     UFId FK			Nome VARCHAR(30)
		 
-----------------------------------------------------------------------*/
CREATE TABLE Ex04_Cidades (
CidadeId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Cidade VARCHAR(80) NOT NULL 
)
GO

CREATE TABLE Ex04_UFs (
UFId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
UF VARCHAR(2) NOT NULL ,
Nome VARCHAR(30) NOT NULL
)
GO    


ALTER TABLE Ex04_Cidades
ADD UFId INT NOT NULL,
		CONSTRAINT FK_UFCidade
		FOREIGN KEY (UFId) REFERENCES Ex04_UFs (UFId)
GO



/*-----------------------------------------------------------------------
3. 	Escreva os comandos DDL necessários para realacionar (1-N) as tabelas
	abaixo.
					   Pessoa				    PET
				====================   ======================
				  PessoaId INT PK			 PetID INT PK
				  Nome VARCHAR(80)		 NomePet VAARCHAR(80)
				     CPF INT			Descricao VARCHAR(150)
				Telefone VARCHAR(15)
-----------------------------------------------------------------------*/
CREATE TABLE Ex04_Pessoas (
PessoaId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Nome VARCHAR(80) NOT NULL ,
Cpf INT NOT NULL,
Telefone VARCHAR(15)
)
GO



CREATE TABLE Ex04_PET (
PETId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
NomePet VARCHAR(50) NOT NULL ,
Descricao VARCHAR(150) NOT NULL
)
GO


ALTER TABLE Ex04_PET
ADD PessoaId INT NOT NULL,
		CONSTRAINT FK_PessoaPet
		FOREIGN KEY (PessoaId) REFERENCES Ex04_Pessoas (PessoaId)
GO



/*-----------------------------------------------------------------------
4. 	Escreva os comandos DDL necessários para realizar as seguintes altera-
	ções na tabela Pessoas:
	
	a) Renomear a coluna "Cpf" para "CpfPessoa";
	b) Excluir a coluna "Telefone".
-----------------------------------------------------------------------*/
EXEC sp_rename 'Ex04_Pessoas.Cpf', 'CpfPessoa', 'Column'
GO

ALTER TABLE Ex04_Pessoas
DROP COLUMN Telefone;
GO

SELECT * FROM Ex04_Pessoas
GO

/*-----------------------------------------------------------------------
5. 	Teste os relacionamentos (constraints) que você criou inserindo pelo
	menos 3 registros em cada uma das tabelas abaixo:
	
	a) Ufs
	b) Cidades
	c) Empresa
	d) Empregado
	e) Pessoa
	f) Pet
-----------------------------------------------------------------------*/

INSERT Ex04_UFs (UF, Nome)
VALUES
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro'),
('SC', 'Santa Catarina')
GO

SELECT * FROM Ex04_UFs
GO

INSERT Ex04_Cidades (Cidade,UFId)
VALUES
('Bariri',1),
('Areal',2),
('Florianópolis',3)
GO

SELECT * FROM Ex04_Cidades
GO

INSERT Ex04_Empresa (CNPJ, Empresa)
VALUES
(987, 'Americanas'),
(236, 'Renner'),
(438, 'Magazine')
GO

SELECT * FROM Ex04_Empresa
GO




INSERT Ex04_Empregado (Cpf, Nome, CNPJ)
VALUES
(987, 'Jubscleudo',134),
(123, 'Cleitin',136),
(873, 'Joberson',124)
GO

SELECT * FROM Ex04_Empregado
GO

INSERT Ex04_Pessoas(Nome, CpfPessoa)
VALUES
('Roberto', 837),
('Zurema',524),
('Robson',573)
GO

SELECT * FROM Ex04_Pessoas

INSERT Ex04_PET(NomePet, Descricao, PessoaId)
VALUES
('Pipoca', 'Branca', 1),
('Chocolate', 'Marrom', 2),
('Neguinho', 'Preto', 3)
GO

SELECT * FROM Ex04_PET
