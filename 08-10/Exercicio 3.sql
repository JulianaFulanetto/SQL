/*-----------------------------------------------------------------------
  Curso Técnico em Desenvolvimento de Sistemas
  Banco de Dados - Prof. Gustavo Castello
  Script: 06B DB - Controle de dinossauros (Ampliado)
  
  Modelagem para Relacionamento entre Dinossauro e Período Geológico
  
	Dinossauro					Período
	=========================================
	Tyranosaurus rex			Cretáceo
	Brachiosaurus altithorax	Jurássico
	Brontosaurus excelsus		Jurássico
	Triceratops horridus		Cretáceo
	Stegosaurus stenops			Jurássico
	Plateosaurus				Triássico 
 ----------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
  Criação do banco de dados
-----------------------------------------------------------------------*/
--Create Database dbDino
--Go
Use Juliana
Go

/*-----------------------------------------------------------------------
  Criando a tabela de Periodos Ex03_Periodos
-----------------------------------------------------------------------*/
CREATE TABLE Ex03_Periodos(
	PeriodoId INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	Periodo VARCHAR(15) NOT NULL
)
GO

INSERT Ex03_Periodos
VALUES
('Triássico'),
('Jurássico'),
('Cretáceo')
GO

SELECT * FROM Ex03_Periodos
GO 
/*-----------------------------------------------------------------------
  Criando a tabela de dinossauros Ex03_Dinossauros
-----------------------------------------------------------------------*/
CREATE TABLE Ex03_Dinossauros (
IdDinossauro INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Dinossauro VARCHAR(50) NOT NULL, 
Altura DECIMAL(5,2) NOT NULL,
Comprimento DECIMAL(5,2) NOT NULL,
Peso INT NOT NULL
)
GO	

ALTER TABLE Ex03_Dinossauros
ADD PeriodoId INT NOT NULL,
		CONSTRAINT FK_DinossauroPeriodo
		FOREIGN KEY (PeriodoId) REFERENCES Ex03_Periodos (PeriodoId)
GO

INSERT INTO Ex03_Dinossauros(Dinossauro,Altura,Comprimento,Peso,PeriodoId)
VALUES 
('Tyranosaurus rex', 6.1, 12, 8000, 3),
('Brachiosaurus altithorax',22 ,11, 4000, 2),
('Brontosaurus excelsus',4 ,9, 5000, 2),
('Triceratops horridus', 5.4,11,6000, 3),
('Stegosaurus stenops', 3.2, 9, 3000, 2),
('Plateosaurus', 6, 8, 4000, 1)
GO

SELECT * FROM Ex03_Dinossauros
GO

/*-------------------------------------------------------
Consultando os registros das tabelas relacionadas
-------------------------------------------------------*/
SELECT 
		D.Dinossauro,
		D.Altura,
		D.Comprimento,
		D.Peso,
		P.PeriodoId,
		P.Periodo 
FROM Ex03_Dinossauros D INNER JOIN Ex03_Periodos P ON P.PeriodoId = D.PeriodoId
GO