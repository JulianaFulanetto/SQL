--Para criar um banco de dados execute o codigo abaixo
CREATE DATABASE Juliana 
--CREATE -> Cria algo em SQL 
--DATABASE -> Banco de dados 
GO

USE Juliana 
GO

--cria a tabela com o nome dado 
CREATE TABLE Pokemon(
--Atributo + identificadores do atributos 
--Tipo do atributo 
--UNIQUEINDENTIFIER -> GUID VISUAL STUDIO 
--GUID -> Chave unica com caracteres 
-- PRIMARY LEY -> Chave prim�ria / �nica por tabela 
--NOT NULL -> N�o permite nulo 
PokemonId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,

--VARCHAR -> campo de caracteres | STRING | TEXTO 
--VARCHAR(50) -> Limite de caracteres
Nome VARCHAR(50) NOT NULL, 
Categoria VARCHAR(40) NOT NULL,
)
GO

--INSERT INTO -> inserir dentro de
INSERT INTO Pokemon( Nome,Categoria,PokemonId)
--VALUES -> Valores
VALUES 
--Inserir valores em banco conforme descrito acima ou de acordo com a cria��o da tabela
('Charmeleon2', 'Fogo',NEWID()),
('Charmeleon3', '�gua',NEWID()),
('Charmeleon4', 'El�trico',NEWID()),
('Charmeleon5', 'Normal',NEWID())
GO

--SELECT -> selecionar coisas na tabela
-- * -> Tudo
--FROM -> DE ou DA TABELA 
SELECT * FROM Pokemon
GO

SELECT PokemonId AS [C�digo],
		Nome AS [Nome do Pok�mon],
		Categoria AS [Tipo]
FROM Pokemon
WHERE Categoria = 'Fogo'
GO