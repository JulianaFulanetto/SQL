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
						Criando as tabelas 
 -------------------------------------------------------------*/

 CREATE TABLE tbcursos (
 IdCurso INT NOT NULL PRIMARY KEY,
 Sigla VARCHAR(80) NOT NULL,
 Curso VARCHAR(80) NOT NULL,
 CargaHoraria SMALLINT(6) NOT NULL
 )
 GO

 
 /*--------------------------------------------------------------
  Selecionando todos os alunos, sem especificar a ordem de 
  exibi��o (vai seguir automaticamente a ordem da PK Id Aluno)
 -------------------------------------------------------------*/


 /*--------------------------------------------------------------
  Selecionando todos os alunos por ordem alfab�tica de Nome 
  (Cl�usula Order By)(Obs, a palavra ASC � opcional por ser 
  o padr�o)
 -------------------------------------------------------------*/


  /*--------------------------------------------------------------
  Selecionando todos os alunos por ordem alfab�tica inversda de 
  Nome (Cl�usula Order By com Desc)
 -------------------------------------------------------------*/


  /*--------------------------------------------------------------
  Selecionando todos os alunos e seus respectivos tipos
 -------------------------------------------------------------*/


   /*--------------------------------------------------------------
  Selecionando todos os alunos e seus respectivos tipos e ordenando
  os resultados por Tipo
 -------------------------------------------------------------*/


  /*--------------------------------------------------------------
  Selecionando todos os alunos e seus respectivos tipos e combinando
  ordena��es. Primeiro por Tipo em ordem alfab�tica inversa, depois
  por nome.
 -------------------------------------------------------------*/


  /*--------------------------------------------------------------
  Selecionando separadamente o dia, o m�s e o ano da data de 
  nascimento de todos os alunos 
 -------------------------------------------------------------*/


  /*--------------------------------------------------------------
  Selecionando todos os alunos que fazem anivers�rio em mar�o
 -------------------------------------------------------------*/


  /*--------------------------------------------------------------
  Selecionando todos os alunos com idade maior ou igual 14 anos
  sutratindo ano atual - ano de nascimento.
 -------------------------------------------------------------*/
 


  /*--------------------------------------------------------------
  Selecionando todos os alunos com idade maior ou igual 14 anos
  usando DateDiff (calcula a diferen�a entre duas datas)
 -------------------------------------------------------------*/