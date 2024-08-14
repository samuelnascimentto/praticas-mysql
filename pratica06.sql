-- EXECÍCIO 1 _____________________________________________________________________________________________________________________________________
/* Sobre os alunos, o sistema guarda o ra (chave primária), nome, telefone.
- Sobre os projetos, o sistema guarda um identificador (chave primária),
nome e a descrição do projeto.
- Sobre os acompanhantes, o sistema guarda um identificador, nome e o
tipo de relação com o aluno (se é pai, amigo, irmão, namorado, etc)).
 */
 
-- Criar um banco de dados AlunoProjeto no MySQL, selecionar esse
-- banco de dados e executar as instruções relacionadas a seguir.
CREATE DATABASE AlunoProjeto;

USE AlunoProjeto;

-- Criar as tabelas equivalentes à modelagem.
CREATE TABLE projeto (
  idP INT AUTO_INCREMENT,
  nome VARCHAR(150),
  descricao VARCHAR(100),
  primary key (idP)
);

CREATE TABLE aluno (
  ra CHAR(8), 
  nome VARCHAR(50),
  telefone VARCHAR(13),
  fkProjeto INT,
  fkRepresentante CHAR(8),
  primary key (ra),
  FOREIGN KEY (fkProjeto) REFERENCES projeto(idP),
  FOREIGN KEY (fkRepresentante) REFERENCES aluno(ra)
);

CREATE TABLE acompanhante (
   idA INT AUTO_INCREMENT,
   nome VARCHAR(50),
   relacionamento VARCHAR(40),
   fkA CHAR(10),
   primary key (idA),
   foreign key (fkA) references aluno(ra)
) AUTO_INCREMENT = 10;

-- Inserir dados nas tabelas.
-- Inserir dados tabela projeto
INSERT INTO projeto (nome, descricao) values
('Ecoyield', 'Monitoramento do ambiente de trabalho'),
('Infinity Art', 'Sistema de preservação de artes em tela');

-- Inserir dados tabela aluno 
INSERT INTO aluno(ra, nome, telefone, fkProjeto, fkRepresentante) VALUES 
('00000001', 'Marcos aguiar', '123456789101', 1, null);

INSERT INTO aluno(ra, nome, telefone, fkProjeto, fkRepresentante) VALUES
('00000002', 'matheus pereira', '89876543210', 2, '00000001'),
('00000003', 'alexandre R.', '112233333333', 2, '00000002'),
('00000004', 'mariana M.', '66666666666', 1, '00000003'); 

INSERT INTO acompanhante(nome, relacionamento, fkA) VALUES 
('maria a.', 'Pai', '00000001'),
('maria.b', 'Namorado', '00000002'),
('maria c', 'Amigo', '00000003'),
('maria d', 'Namorada', '00000004');

-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM aluno;
SELECT * FROM projeto;
SELECT * FROM acompanhante;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
-- Já foi feito

-- Exibir os dados dos alunos e dos projetos correspondentes.
SELECT a.ra, 
       a.nome 'nome Aluno',
       a.telefone,
       p.idP 'ID',
       p.nome 'nomeProjeto',
       p.descricao
       FROM projeto p
       join aluno a
       on p.idP = (fkProjeto);

-- Exibir os dados dos alunos e dos seus acompanhantes.
SELECT a.ra, 
       a.nome  'nome Aluno',
       a.telefone,
       c.idA  'id',
       c.nome  'nome Acompanhante',
       c.relacionamento
       FROM aluno a
       JOIN acompanhante c
       on a.ra = c.fkA;

-- Exibir os dados dos alunos e dos seus representantes.
SELECT a.ra,
       a.nome 'Nome Aluno',
       a.telefone, 
       a.fkRepresentante ' RA Representante',
       r.nome 'Nome Representante'
       FROM aluno a
       LEFT JOIN aluno r
       ON a.fkRepresentante = r.ra;
       
-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente
-- de um determinado projeto (indicar o nome do projeto na consulta).
SELECT a.ra, 
       a.nome 'nome Aluno',
       a.telefone,
       p.nome 'nome Projeto',
       p.descricao
       FROM projeto p
       join aluno a
       on p.idP = fkProjeto
       where p.nome = 'Ecoyield';
       
-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
SELECT a.ra,
       a.nome 'nome Aluno',
       a.telefone,
       p.idP id,
       p.nome 'nome Projeto',
       p.descricao,
       c.nome 'nome Acompanhante',
       c.relacionamento 'Relacionamento'
       FROM aluno a
       JOIN projeto  p
       on p.idP = fkProjeto
       LEFT JOIN acompanhante c
       on a.ra = fkA;

-- EXECÍCIO 2 ____________________________________________________________________________________________________________________________________

-- a) Criar um banco de dados chamado Campanha.
CREATE DATABASE campanha;

-- b) Selecionar esse banco de dados.
USE campanha;

-- c) Criar as tabelas correspondentes à sua modelagem.
CREATE TABLE organizador (
  idO INT AUTO_INCREMENT,
  nome VARCHAR(50),
  endereco VARCHAR(100),
  email VARCHAR(100),
  idOrganizadorExperiente INT,
  primary key (idO),
  FOREIGN KEY (idOrganizadorExperiente) REFERENCES organizador(idO)
) auto_increment = 30;

CREATE TABLE campanha ( 
  idC INT AUTO_INCREMENT,
  categoria VARCHAR(90),
  instituicao1 VARCHAR(100),
  instituicao2 VARCHAR(100),
  finalCampanha DATE,
  fkOrganizador INT,
  primary key (idC),
  FOREIGN KEY (fkOrganizador) REFERENCES organizador(idO)
) AUTO_INCREMENT = 500;

/*d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para
algum organizador, e mais de um organizador novato sendo orientado por algum
organizador mais experiente. */
-- Inserir dados tabela organizador
INSERT INTO organizador (nome, endereco, email, idO) VALUES
('Organizador 1', 'Rua a, Bairro z', 'organizador1@gmail.com', 32),
('Organizador 2', 'Rua b, Bairro Y', 'organizador2@gmail.com', 30),
('Organizador Novato 1', 'Rua C, Bairro w', 'novato1@gmail.com', 31),
('Organizador Novato 2', 'Rua D, Bairro x', 'novato2@gmail.com', 33);

INSERT INTO campanha (categoria, instituicao1, instituicao2, finalCampanha, fkOrganizador) VALUES
('Alimentos', 'Instituicao A', 'Instituiçao AB', '2011-12-11', 32),
('Produtos', 'Instituicao B', null, '2020-04-30', 33),
('Máscaras', 'Instituicao C', 'Instituicao BA', '2001-10-15', 30),
('Alimentos', 'Instituicao D', 'Instituição BB', '2000-09-18', 30),
('Produtos', 'Instituicao E', null, '2020-05-15', 31);

-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM organizador;
SELECT * FROM campanha;

/* f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
JÁ FOI FEITO */

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
SELECT o.idO id,
       o.nome,
       o.endereco,
       o.email,
       c.categoria,
       c.instituicao1 '1°instituição',
       c.instituicao2 '2°instituição',
       c.finalCampanha
       FROM organizador o
       JOIN campanha c
       on o.idO = c.fkOrganizador;
       
-- h) Exibir os dados de um determinado organizador (informar o nome do
-- organizador na consulta) e os dados de suas respectivas campanhas.
SELECT o.idO ID,
       o.nome,
       o.endereco,
       o.email,
       c.categoria,
       c.instituicao1 '1° instituição',
       c.instituicao2 '2° instituição',
       c.finalCampanha
       FROM organizador o
       JOIN campanha c
       on o.idO = c.fkOrganizador
       where idO = 30;

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
SELECT * 
       FROM organizador novato
       JOIN organizador experiente 
       ON novato.idO = experiente.idOrganizadorExperiente;
       
       select * from organizador;

/*j) Exibir os dados dos organizadores novatos e os dados dos respectivos
organizadores orientadores, porém somente de um determinado organizador
orientador (informar o nome do organizador orientador na consulta).*/
SELECT * 
       FROM organizador novato
       JOIN organizador experiente 
       ON experiente.idO = novato.idOrganizadorExperiente
       where experiente.nome = 'Organizador 1';

/*l) Exibir os dados dos organizadores novatos, os dados das respectivas
campanhas organizadas e os dados dos respectivos organizadores
orientadores.*/
SELECT *
      FROM organizador novato
	  JOIN organizador experiente 
      ON novato.idOrganizadorExperiente = experiente.idO
      JOIN campanha c 
      ON novato.idO = c.fkOrganizador;

/* m) Exibir os dados de um organizador novato (informar o seu nome na consulta),
os dados das respectivas campanhas em que trabalha e os dados do seu
organizador orientador.*/
SELECT *
       FROM organizador novato
       JOIN campanha 
       ON novato.idO = campanha.fkOrganizador
       JOIN organizador experiente 
       ON novato.idOrganizadorExperiente = experiente.idO
       WHERE novato.nome = 'Organizador Novato 1';
