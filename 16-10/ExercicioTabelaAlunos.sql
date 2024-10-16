/*--------------------------------------------------------------
  Curso T�cnico em Desenvolvimento de Sistemas
  Banco de Dados - Prof. Gustavo Castello
  Script: 08A DB - Script Banco de Dados para Aula
 -------------------------------------------------------------*/

/*--------------------------------------------------------------
  Criando o banco de dados.
 -------------------------------------------------------------*/
--Use master
--Go
--Drop Database If Exists dbCursos
--Go
--Create Database dbCursos;
--Go
Use Juliana
Go

/*--------------------------------------------------------------
			    Criando e inserindo as tabelas 
 -------------------------------------------------------------*/
 CREATE TABLE Ex05_tbcursos (
 IdCurso  INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 Sigla VARCHAR(80) NOT NULL,
 Curso VARCHAR(80) NOT NULL,
 CargaHoraria INT NOT NULL
 )
 GO


 SELECT * FROM Ex05_tbcursos
 GO

 CREATE TABLE Ex05_tbalunos (
 IdAluno INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 Aluno VARCHAR(80),
 RM VARCHAR(10),
 DataNascimento DATE NOT NULL
 )
 GO

 SELECT * FROM Ex05_tbalunos
 GO

 CREATE TABLE Ex05_tbtipoaluno (
 IdTipo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 Tipo VARCHAR(50)
 )
GO

 SELECT * FROM Ex05_tbtipoaluno
 GO

 CREATE TABLE	Ex05_tbmatricula (
 DataMatricula DATE NOT NULL DEFAULT GETDATE()
 )
 GO

 SELECT * FROM Ex05_tbmatricula
 GO

 ALTER TABLE Ex05_tbmatricula
ADD IdAluno INT NOT NULL,
    CONSTRAINT FK_MatriculaAlunos
    FOREIGN KEY (IdAluno) REFERENCES Ex05_tbalunos (IdAluno);
GO

 ALTER TABLE Ex05_tbmatricula
ADD IdCurso INT NOT NULL,
		CONSTRAINT FK_MatriculaCursos
		FOREIGN KEY (IdCurso) REFERENCES Ex05_tbcursos (IdCurso)
GO

ALTER TABLE Ex05_tbalunos
ADD IdTipo INT NOT NULL,
		CONSTRAINT FK_AlunosIdTipo
		FOREIGN KEY (IdTipo) REFERENCES Ex05_tbtipoaluno (IdTipo)
GO

INSERT INTO Ex05_tbcursos ( Sigla, Curso, CargaHoraria) VALUES
('CS101', 'Introdução à Computação', 40),
('MAT201', 'Matemática Avançada', 60),
('LIT301', 'Literatura Inglesa', 45),
('BIO101', 'Fundamentos de Biologia', 50),
('QUI101', 'Introdução à Química', 55),
('FIS101', 'Introdução à Física', 50),
('HIS201', 'História Mundial', 40),
('ART101', 'Apreciação de Arte', 30),
('MUS101', 'Teoria Musical', 35),
('PSI101', 'Introdução à Psicologia', 45);
GO
SELECT * FROM  Ex05_tbcursos
GO

 INSERT INTO Ex05_tbtipoaluno (Tipo) VALUES
('Regular'),
('Meio-período'),
('Integral')
GO
SELECT * FROM Ex05_tbtipoaluno
GO

 INSERT INTO Ex05_tbalunos (Aluno, RM, DataNascimento,IdTipo ) VALUES
( 'Alice Silva', 'RM001', '2000-01-15',1),
('Bruno Souza', 'RM002', '1999-05-23',1),
( 'Carlos Oliveira', 'RM003', '2001-07-30',2),
( 'Daniela Costa', 'RM004', '2000-11-11',1),
('Eduardo Lima', 'RM005', '1998-03-22',3),
('Fernanda Rocha', 'RM006', '1999-09-09',3),
('Gabriel Santos', 'RM007', '2000-12-25',2),
( 'Helena Martins', 'RM008', '2001-04-04',3),
('Igor Ferreira', 'RM009', '1998-08-18',2),
('Juliana Mendes', 'RM010', '1999-02-14',1);
GO

SELECT * FROM  Ex05_tbalunos
GO


INSERT INTO Ex05_tbmatricula (IdAluno, IdCurso, DataMatricula) VALUES
(11, 1, '2023-10-01'),
(12, 2, '2023-10-02'),
(3, 3, '2023-10-03'),
(4, 4, '2023-10-04'),
(5, 5, '2023-10-05'),
(6, 6, '2023-10-06'),
(7, 7, '2023-10-07'),
(8, 8, '2023-10-08'),
(9, 9, '2023-10-09'),
(10, 10, '2023-10-10');
GO

SELECT * FROM Ex05_tbmatricula
GO

 /*--------------------------------------------------------------
  Selecionando todos os alunos, sem especificar a ordem de 
  exibição (vai seguir automaticamente a ordem da PK Id Aluno)
 -------------------------------------------------------------*/
  SELECT * FROM Ex05_tbalunos
 GO
 /*--------------------------------------------------------------
  Selecionando todos os alunos por ordem alfabética de Nome 
  (Cláusula Order By)(Obs, a palavra ASC é opcional por ser 
  o padrão)
 -------------------------------------------------------------*/
 SELECT * FROM Ex05_tbalunos
ORDER BY Aluno;
  /*--------------------------------------------------------------
  Selecionando todos os alunos por ordem alfabética inversda de 
  Nome (Cláusula Order By com Desc)
 -------------------------------------------------------------*/
 SELECT * FROM Ex05_tbalunos
ORDER BY Aluno DESC;
  /*--------------------------------------------------------------
  Selecionando todos os alunos e seus respectivos tipos
 -------------------------------------------------------------*/

SELECT 
a.Aluno,
a.RM,
a.DataNascimento, 
t.Tipo
FROM Ex05_tbalunos a INNER JOIN Ex05_tbtipoaluno t ON a.IdTipo = t.IdTipo;
   /*--------------------------------------------------------------
  Selecionando todos os alunos e seus respectivos tipos e ordenando
  os resultados por Tipo
 -------------------------------------------------------------*/
 SELECT
 a.Aluno,
 a.RM,
 a.DataNascimento, 
 t.Tipo
FROM Ex05_tbalunos a INNER JOIN Ex05_tbtipoaluno t ON a.IdTipo = t.IdTipo
ORDER BY t.Tipo;
  /*--------------------------------------------------------------
  Selecionando todos os alunos e seus respectivos tipos e combinando
  ordenações. Primeiro por Tipo em ordem alfabética inversa, depois
  por nome.
 -------------------------------------------------------------*/
 SELECT 
 a.Aluno, 
 a.RM, 
 a.DataNascimento, 
 t.Tipo
FROM Ex05_tbalunos a INNER JOIN Ex05_tbtipoaluno t ON a.IdTipo = t.IdTipo
ORDER BY t.Tipo DESC, a.Aluno ASC;

  /*--------------------------------------------------------------
  Selecionando separadamente o dia, o mês e o ano da data de 
  nascimento de todos os alunos 
 -------------------------------------------------------------*/
 SELECT 
    a.Aluno,
    DAY ( a.DataNascimento) AS Dia,
    MONTH (a.DataNascimento) AS Mes,
    YEAR (a.DataNascimento) AS Ano
FROM Ex05_tbalunos a;
GO
  /*--------------------------------------------------------------
  Selecionando todos os alunos que fazem aniversário em março
 -------------------------------------------------------------*/
SELECT Aluno, RM, DataNascimento
FROM Ex05_tbalunos
WHERE MONTH(DataNascimento) = 3;
  /*--------------------------------------------------------------
  Selecionando todos os alunos com idade maior ou igual 14 anos
  sutratindo ano atual - ano de nascimento.
 -------------------------------------------------------------*/
 
SELECT Aluno, RM, DataNascimento
FROM Ex05_tbalunos
WHERE YEAR(GETDATE()) - YEAR(DataNascimento) >= 14;
  /*--------------------------------------------------------------
  Selecionando todos os alunos com idade maior ou igual 14 anos
  usando DateDiff (calcula a diferença entre duas datas)
 -------------------------------------------------------------*/
 SELECT Aluno, RM, DataNascimento
FROM Ex05_tbalunos
WHERE DATEDIFF(YEAR, DataNascimento, GETDATE()) >= 14;