-- ex1
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
create database sprint1;

use sprint1; 

-- Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da 
-- tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha 
-- (int, representando a quantidade de medalhas que o atleta possui)
CREATE TABLE atleta (
    idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

-- Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
insert into atleta(idAtleta, nome, modalidade, qtdMedalha) 
values (1, 'GIOVANNA', 'volei', 1); 

insert into atleta(idAtleta, nome, modalidade, qtdMedalha) 
values (2, 'ISABELA', 'Volei', 1); 

insert into atleta(idAtleta, nome, modalidade, qtdMedalha) 
values (3, 'GUILHERME', 'Natação', 2),
       (4, 'PAULO', 'Basquete', 1),
       (5, 'LUCAS', 'Basquete', 3),
       (6, 'GUSTAVO', 'Basquete', 0),
       (7, 'BIANCA', 'Volei de Praia', 1),
       (8, 'ANA', 'Volei de Praia', 1),
       (9, 'AMANDA', 'Volei', 2),
       (10, 'PEDRO', 'Futebol', 0);

-- Exibir todos os dados da tabela.
select * from atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas.
select nome, qtdMedalha from atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
select * from atleta where modalidade = 'volei';

-- Exibir os dados da tabela ordenados pela modalidade.
select * from atleta order by  modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
select * from atleta order by  qtdMedalha desc;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from atleta where nome like '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
select * from atleta where nome like 'a%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
select * from atleta where nome like '%a';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from atleta where nome like '%r_';

-- Eliminar a tabela.
drop table atleta;

-- Eliminar o database
drop database sprint1;




-- ex2
use sprint1;

create table musica (
idmusica varchar(40) primary key,
titulo varchar (40),
artista varchar(40),
genero varchar(40)
);

/* Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma música, e um artista, que tenha 
mais de uma música cadastrada. Procure inserir pelo menos umas 7 música */ 
insert into musica values 
(1, 'sina', 'djavan', 'MPB'),
(2, 'capim', 'djavan', 'MPB'),
(3, 'caneta azul', 'manuel.g', 'Forró'),
(4, 'maura', 'manuel.g', 'Forro'),
(5, 'julis', 'BK', 'RAP'),
(6, 'gigante', 'BK', 'RAP'),
(7, 'folhas', 'BK', 'RAP');

-- Exibir todos os dados da tabela.
select * from musica;

-- Exibir apenas os títulos e os artistas das músicas.
select titulo from musica;

-- c) Exibir apenas os dados das músicas de um determinado gênero.
select * from musica where genero = 'RAP';

-- d) Exibir apenas os dados das músicas de um determinado artista.
select * from musica where artista = 'BK';

-- e) Exibir os dados da tabela ordenados pelo título da música.
select * from musica order by titulo;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
select * from  musica order by artista desc;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
select * from musica where titulo like 'c%';

-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
select * from musica where artista like '%k';

-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
select * from  musica where genero like '_a_';

-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
select * from musica where titulo like '%i_';

-- k) Elimine a tabela.
drop table musica;




-- ex3
use sprint1;

/*
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
*/

create table filme (
id_filme int primary key auto_increment,
titulo varchar(40),
genero varchar(40),
diretor varchar(40)
);

/* nserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.
*/

insert into filme values
(default,'batman_begins', 'ficcao', 'Christopher Nolan'),
(default,'batman_vs_superman', 'ficcao', 'Zack Snyder'),
(default,'coringa', 'ficcao', 'Tod Phillips'),
(default,'a lagosta', 'ficcao', 'yorgos'),
(default,'roma', 'biografia', 'alfonso cuaron'),
(default,'her', 'ficcao', 'spike jonze'),
(default,'matrix', 'ficcao','lilly Wachowski'),
(default, 'matrix 2', 'ficcao', 'lilly Wachowski'),
(default, 'ressureiçao', 'drama', 'kevin reynolds');

-- • Exibir todos os dados da tabela
select *from filme;

-- • Exibir apenas os títulos e os diretores dos filmes.
select titulo from filme;

-- • Exibir apenas os dados dos filmes de um determinado gênero.
select * from filme where genero = 'ficcao';

-- • Exibir apenas os dados dos filmes de um determinado diretor.
select * from filme where diretor = 'lilly Wachowski';

-- • Exibir os dados da tabela ordenados pelo título do filme.
select * from filme order by titulo;

-- • Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.	
select * from filme order by diretor desc;

-- • Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
select * from filme where titulo like 'b%';

-- • Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
select *  from filme where diretor like '%n';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
select * from filme where genero like '_r%';

-- • Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
select * from filme where titulo like '%i_';

drop table filme;




-- ex4
use sprint1;

/*
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela
*/

create table professor (
id_professor int primary key auto_increment,
nome varchar(40),
especialidade varchar(40),
dtNasc date
);

/*
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.
*/

insert into professor values
(default,'rosim', 'banco de dados', '1980-01-20'),
(default,'frizza', 'Pesquisa', '1980-01-21'),
(default,'brandao', 't.i', '1994-01-22'),
(default,'caio', 'algoritmos', '2000-02-02'),
(default,'vera', 'socio emocional', '1995-01-23'),
(default,'marise', 'arq. comp', '1990-10-23'),
(default,'eduardo', 'sistema operacional', '1915-03-24'),
(default, 'alex', 'aqr. comp', '2000-01-01');

-- a) Exibir todos os dados da tabela.
select * from professor;

-- b) Exibir apenas as especialidades dos professores.
select especialidade from professor;

-- c) Exibir apenas os dados dos professores de uma determinada especialidade.
select * from professor where especialidade = 'arq. comp'; 

-- d) Exibir os dados da tabela ordenados pelo nome do professor.
select nome from professor order by nome;

-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
select dtnasc from professor order by dtnasc desc;

-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra
select * from professor where nome like 'm%';

-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra
select * from professor where nome like '%_a';

-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
select * from professor where nome like '_a%';

-- ) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
select * from professor where nome like '%i_';

-- drop table professor;
drop table professor;




-- ex5
 use sprint1;
 
 /*
 Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
(tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
 */
 
 create table curso (
id_curso int primary key auto_increment,
nome varchar(50),
sigla varchar(3),
coordenador varchar(40)
);

insert into curso values
(default,'Ciencia da computação', 'CCO', 'Marise miranda'),
(default,'Sistema da informação', 'SI', 'Felipe aguiar'),
(default,'Analíse de sistemas', 'ADS', 'Gerson santos'),
(default,'Medicina', 'MED', 'Caio augusto');

-- • Exibir todos os dados da tabela
select * from curso;

-- b) Exibir apenas os coordenadores dos cursos.
select coordenador from curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from curso where sigla = 'med';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
select * from curso order by nome;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select coordenador from curso order by nome desc;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from curso where coordenador like 'G%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from curso where coordenador like '%_o';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from curso where coordenador like '_a%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from curso where coordenador like '%o_';

drop table curso;
 
 
 --exercicio6
-- Você vai criar uma tabela para armazenar os dados de revistas
-- (como por ex: Veja, Isto é, Epoca, Quatro Rodas, Claudia, etc).

use sprint1;

-- Criar a tabela chamada Revista para conter os campos: idRevista (int e chave primária 
-- da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30).
-- Os valores de idRevista devem iniciar com o valor 1 e ser incrementado 
-- automaticamente pelo sistema.

create table revista(
idRevista   INT PRIMARY KEY auto_increment,
nome        VARCHAR(40),
categoria   VARCHAR(30)
);

-- Inserir 4 registros na tabela, mas sem informar a categoria.
insert into revista(idRevista, nome, categoria) 
values(1, 'Forbes', ''),
      (default, 'Vogue', ''),
      (default, 'Times', ''),
      (default, 'Caras', '');
      
-- Exibir todos os dados da tabela
select * from revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela
-- novamente para verificar se atualizou corretamente.
update revista set categoria = 'Negocios' where idRevista = 1;

update revista set categoria = 'Moda' where idRevista = 2;

update revista set categoria = 'Noticias' where idRevista = 3;

update revista set categoria = 'Celebridades' where idRevista = 4;

-- Insira mais 3 registros completos.
insert into revista(idRevista, nome, categoria)
values (5, 'Veja', 'Moda'),
       (6, 'Epoca', 'Receitas'),
       (7, 'Rolling Stone', 'Musica');

-- Exibir novamente os dados da tabela.
select * from revista;

-- Exibir a descrição da estrutura da tabela.
describe revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o
-- tamanho da coluna categoria
describe revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table revista add column periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from revista;

-- Excluir a coluna periodicidade da tabela
alter table revista drop column periodicidade;

-- EXCLUIR O BANCO DE DADOS SPRINT1
drop database sprint1;
/*
Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
*/

create database sprint1;
use sprint1;

create table atleta( 
idAtleta int auto_increment primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedal int
);

#• Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade e pelo menos 5 atletas

insert into atleta(nome, modalidade, qtdMedal)
values
('GUILHERME', 'Natação', 2),
('PAULO', 'Basquete', 1),
('Carlos', 'Basquete', 3),
('GUSTAVO', 'Basquete', 0),
('BIANCA', 'Volei de Praia', 1),
('ANA', 'Volei de Praia', 1),
('AMANDA', 'Volei', 2),
('PEDRO', 'Futebol', 0);

-- • Exibir todos os dados da tabela.
select * from atleta;

-- • Atualizar a quantidade de medalhas do atleta com id=1;
update atleta set qtdMedal = 10 where idAtleta =1; 

-- • Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
update atleta set qtdMedal = 4 where idAtleta between 2 and 3 ;

-- • Atualizar o nome do atleta com o id=4;
update atleta set nome = 'SAMUEL' where idAtleta =4;

-- • Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
alter table atleta add column datNasc date;

-- • Atualizar a data de nascimento de todos os atletas;
update atleta set datNasc = '2002-10-10' where idAtleta = 2;
update atleta set datNasc = '2002-10-04' where idAtleta = 8;
update atleta set datNasc = '2004-03-12' where idAtleta = 1;
update atleta set datNasc = '2002-10-04' where idAtleta = 3;
update atleta set datNasc = '2006-03-12' where idAtleta = 4;
update atleta set datNasc = '2002-10-11' where idAtleta = 5;
update atleta set datNasc = '2002-10-04' where idAtleta = 6;
update atleta set datNasc = '2004-03-12' where idAtleta = 7;

-- • Excluir o atleta com o id=5;
delete from atleta where idAtleta = 5;

-- • Exibir os atletas onde a modalidade é diferente de natação;
select * from atleta where modalidade != 'natação'; 

-- • Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select * from atleta where qtdMedal >= 3;

-- • Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table atleta modify modalidade varchar(60);

-- • Descrever os campos da tabela mostrando a atualização do campo modalidade;
desc atleta;

-- • Limpar os dados da tabela; 
drop database atleta ;


/* 
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista 
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
*/
create table musica (
idMusica int primary key auto_increment , 
titulo varchar (40),
artista varchar(40),
genero varchar (40) 
) auto_increment = 1 ;

/*
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas.
*/

insert into musica (titulo, artista, genero)
values
('sina', 'djavan', 'MPB'),
('capim', 'djavan', 'MPB'),
('caneta azul', 'manuel.g', 'Forró'),
('maura', 'manuel.g', 'Forro'),
('julis', 'BK', 'RAP'),
('gigante', 'BK', 'RAP'),
('folhas', 'BK', 'RAP');

-- • Exibir todos os dados da tabela.
select * from musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;
alter table musica add curtidas int;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
update musica set curtidas = 2 where idMusica = 2;
update musica set curtidas = 100 where idMusica = 3;
update musica set curtidas = 23 where idMusica = 4;
update musica set curtidas = 22 where idMusica = 5;
update musica set curtidas = 207 where idMusica = 1;
update musica set curtidas = 2002 where idMusica = 7;
update musica set curtidas = 20000 where idMusica = 6;

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80; 
alter table musica modify artista varchar(80);

-- e) Atualizar a quantidade de curtidas da música com id=1;
update musica set curtidas = 21 where idMusica = 1;

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update musica set curtidas = 2001 where idMusica between 2 and 3;  

-- g) Atualizar o nome da música com o id=5;
update musica set titulo = 'marcela' where idMusica =5;

-- h) Excluir a música com o id=4;
delete from musica where idMusica = 4; 

-- i) Exibir as músicas onde o gênero é diferente de funk;
select * from musica where genero != 'funk';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from musica where curtidas >= 20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
select artista from musica;

-- l) Limpar os dados da tabela; 
drop table musica;


/*
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela
*/

create table filme (
idFilme int primary key auto_increment,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
)auto_increment = 1 ;

/*
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.
*/
insert into filme ( titulo, genero, diretor) values
('batman begins', 'ficcao', 'Christopher Nolan'),
('batman vs superman', 'ficcao', 'Zack Snyder'),
('coringa', 'ficcao', 'Tod Phillips'),
('a lagosta', 'ficcao', 'yorgos'),
('roma', 'biografia', 'alfonso cuaron'),
('her', 'ficcao', 'spike jonze'),
('matrix', 'ficcao','lilly Wachowski'),
('matrix 2', 'ficcao', 'lilly Wachowski'),
('ressureiçao', 'drama', 'kevin reynolds');

-- • Exibir todos os dados da tabela.
select * from filme;

-- • Adicionar o campo protagonista do tipo varchar(50) na tabela; 
alter table filme add protagonista varchar (50);

-- • Atualizar o campo protagonista de todas os filmes inseridos;
update filme set protagonista = 'Manuel gomes' where idFilme = 1;
update filme set protagonista = 'Chaolin matador' where idFilme = 2;
update filme set protagonista = 'Corinfa da shopee' where idFilme = 3;
update filme set protagonista = 'Michael escofield' where idFilme = 4;
update filme set protagonista = 'Dwight' where idFilme = 6;
update filme set protagonista = 'Michael scott' where idFilme = 7;
update filme set protagonista = 'Dwight damier' where idFilme = 8;
update filme set protagonista = 'IELL' where idFilme = 9;

-- • Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table filme modify diretor varchar(150);

-- • Atualizar o diretor do filme com id=5;
update filme set diretor = 'Lilian lima' where idFilme = 5;

-- • Atualizar o diretor dos filmes com id=2 e com o id=7;
update filme set diretor = 'Maria chiquinha' where idFilme = 2;
update filme set diretor = 'Ronaldo 10' where idFilme = 7;

-- • Atualizar o título do filme com o id=6;
update filme set titulo = 'Chapolin' where idFilme = 6;

-- • Excluir o filme com o id=3;
delete from filme where idFilme = 3;

/*
• Exibir os filmes em que o gênero é diferente de drama;
• Exibir os dados dos filmes que o gênero é igual ‘suspense’;
• Descrever os campos da tabela mostrando a atualização do campo protagonista e
diretor;
• Limpar os dados da tabela;
*/

select * from filme where genero != 'drama'; 

select * from filme where genero = 'suspense'; 

select protagonista, diretor from filme; 

drop table filme;


/*
4. No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela.
Exemplo do campo data: ‘AAAA-MM-DD’, ‘1983-10-13’.
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.
Execute os comandos para:
a) Exibir todos os dados da tabela.
b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,
‘assistente’ ou ‘titular’;
c) Atualizar os professores inseridos e suas respectivas funções;
d) Inserir um novo professor;
e) Excluir o professor onde o idProfessor é igual a 5;
f) Exibir apenas os nomes dos professores titulares;
g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
h) Atualizar a data de nascimento do idProfessor igual a 3;
i) Limpar a tabela Professor;
*/
create table professor (
idProfessor int primary key auto_increment,
nome varchar(50),
especialidade varchar(40),
dtNasc date) auto_increment =1; 


insert into professor (nome, especialidade, dtNasc)
values
('rosim', 'banco de dados', '1980-01-20'),
('frizza', 'Pesquisa', '1980-01-21'),
('brandao', 't.i', '1994-01-22'),
('caio', 'algoritmos', '2000-02-02'),
('vera', 'socio emocional', '1995-01-23'),
('marise', 'arq. comp', '1990-10-23'),
('eduardo', 'sistema operacional', '1915-03-24'),
( 'alex', 'aqr. comp', '2000-01-01');

select * from professor;

alter table professor add monitor varchar(50);

insert into professor (nome, especialidade, dtNasc)
values 
('cristina', 'monitor', '2000-10-21'); 

delete from professor where idProfessor = 5;

select nome from professor where especialidade != 'monitor';

select especialidade, dtNasc from professor where especialidade = 'monitor';

update professor set dtNasc = '2001-02-02' where idProfessor =3;

truncate professor;


/*
7. No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Escreva e execute os comandos para:
• Criar a tabela chamada Serie para conter os campos: idSerie (int e chave primária da
tabela), nome (varchar, tamanho 40), qtdTemporadas (int), status (varchar, tamanho
40). Onde o status só pode ser em andamento, finalizada ou não assistida. Os valores
de idSerie devem iniciar com o valor 100 e ser incrementado automaticamente pelo
sistema.
• Inserir 4 registros na tabela.
Escreva e execute os comandos para:
• Exibir todos os dados da tabela.
*/

create table serie (
idSerie int auto_increment primary key,
nome varchar (40),
qtdTemporadas int,
status varchar(40) 
)auto_increment = 100;

insert into serie (nome, qtdTemporadas)
values ('Dunder mifflin', 8),
('Prison break', 5),
('globe', 10),
('A grande familía', 10);

select * from serie ;


/*
8. No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Carro para conter os dados: idCarro int, nome (tamanho 70), placa
(tamanho 7), marca (tamanho 20), sendo que idCarro é a chave primária da tabela.
Inserir dados na tabela, procurando colocar uma marca de carro que tenha mais de um
carro. Procure inserir pelo menor 5 carros.
O campo marca (tamanho 20) está muito pequeno. É necessário aumentar o número de
caracteres para 40.
Execute os comandos para:
1) Exibir todos os campos da tabela.
2) Exibir apenas os nomes e as placas dos carros.
3) Exibir apenas os dados dos carros de uma determinada marca.
4) Exibir apenas os dados dos carros de uma determinada placa.
5) Exibir os dados da tabela ordenados pela marca do carro.
6) Exibir os dados da tabela ordenados pelo nome em ordem decrescente.
7) Exibir os dados da tabela, dos carros cujo nome termine com uma determinada letra.
8) Exibir os dados da tabela, dos carros cujo marca comece com uma determinada letra.
9) Exibir os dados da tabela, dos carros cuja placa tenha como segunda letra uma
determinada letra.
10) Exibir os dados da tabela, dos carros cujo nome tenha como penúltima letra uma
determinada letra.
11) Atualize uma placa de algum carro. Exiba novamente os dados da tabela após a
atualização.
12) Exclua algum carro da tabela. Exiba novamente os dados da tabela após a exclusão.
13) Elimine a tabela.
*/

create table carro (
idCarro int primary key auto_increment,
nome varchar(70),
placa varchar(7),
marca varchar(20)
) auto_increment = 1;

insert into carro (nome, placa, marca )
values
('HB20', 'abc123', 'Honda' ),
('Fox', 'abc321', 'Volkswagen'),
('Polo','bca123', 'Volkswagen'),
('Gol', 'cba123', 'Volkswagen'),
('Virtus', 'acb123', 'Volkswagen'),
('T-croos', 'bac123', 'Volkswagen');

alter table carro modify marca varchar(40);

desc carro;

select * from carro;

select nome, placa from carro;

select * from carro where marca = 'honda';

select * from carro where placa = 'abc123';

select * from carro order by marca;

select * from carro order by nome desc;

select * from carro where nome like '%s';

select * from carro where nome like 'f%';

select * from carro where placa like '_a%';

select * from carro where nome like '%2_';

update carro set placa = 'sam200' where idCarro = 2;

select * from carro;

delete from carro where idCarro = 1;

select * from carro;
 
drop table carro;

/*
9. No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Restaurante para conter os dados: idRest, nome (tamanho 40), CEP
(tamanho 9), exemplo: '01515-999', tipo (tamanho 30), sendo que idRest tem um valor
numérico inteiro e é a chave primária da tabela. O tipo do restaurante é o tipo da comida que é
servida (churrascaria, italiana, japonesa, fast-food, etc)
Inserir dados na tabela, procurando colocar um tipo de restaurante que tenha mais de um
restaurante. Procure inserir pelo menos 5 restaurantes.
O campo tipo (tamanho 30) está muito pequeno. É necessário aumentar os caracteres para o
tamanho 50.
Execute os comandos para:
1) Exibir todos os dados da tabela.
2) Exibir apenas os nomes e os tipos dos restaurantes.
3) Exibir apenas os dados dos restaurantes de um determinado tipo.
4) Exibir apenas os dados dos restaurantes de um determinado CEP.
5) Exibir os dados da tabela ordenados pelo nome do restaurante.
6) Exibir os dados da tabela ordenados pelo tipo em ordem decrescente.
7) Exibir os dados da tabela, dos restaurantes cujo nome comece com uma determinada letra.
8) Exibir os dados da tabela, dos restaurantes cujo CEP termine com um determinado número.
9) Exibir os dados da tabela, dos restaurantes cujo tipo tenha como segunda letra uma
determinada letra.
10) Exibir os dados da tabela, dos restaurantes cujo nome tenha como penúltima letra uma
determinada letra.
11) Atualize o CEP de algum restaurante. Exiba novamente os dados da tabela após a
atualização.
12) Exclua algum restaurante da tabela. Exiba novamente os dados da tabela após a
exclusão.
13) Elimine a tabela
*/

create table restaurante (
idRest int auto_increment,
nome varchar(40),
cep varchar(9),
tipo varchar (30),
primary key (idRest)
)auto_increment =1;

insert into restaurante (nome, cep, tipo) 
values
('Habibs', '0123441', 'fast-food'),
('Pedra branca', '0123456', 'churrascaria'),
('Mamamia', '10121113', 'italiana'),
('Japan food', '12131415', 'japonesa'),
('Pizza Paulista', '10121314', 'fats-food');

alter table restaurante modify tipo varchar(50);

select * from restaurante;

select nome, tipo from restaurante;

select * from restaurante where tipo = 'japonesa';

select * from restaurante where cep = '10121113';

select * from restaurante order by tipo;

select * from restaurante where nome like 'h%';

select * from restaurante where cep like '1%';

select * from restaurante where tipo like '_a%';

select * from restaurante where nome like '%i_';

update restaurante set cep = '10101010' where idRest = 1;

delete from restaurante where idRest = 2;

drop table restaurante;/*
• Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40),
artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da
tabela.
*/
create table musica(
idMusica int auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40),
primary key (idMusica)
) auto_increment = 1;

-- • Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de
-- uma música, e um artista, que tenha mais de uma música cadastrada. Procure inserir
-- pelo menos umas 3 músicas

insert into musica (titulo, artista, genero) values 
('Azul', 'djavan', 'MPB'),
('capim', 'djavan', 'MPB'),
('caneta azul', 'manuel.g', 'Forró'),
('maura', 'manuel.g', 'Forro'),
('julis', 'BK', 'RAP'),
('gigante', 'BK', 'RAP'),
('folhas', 'BK', 'RAP');

-- Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital ou físico) e dtLancamento (DATE).
create table album (
idAlbum int auto_increment,
nome varchar(30),
tipo varchar(30),
dtLancamento date,
primary key (idAlbum),
constraint ckTipo check(tipo in ('fisico', 'digital'))
) auto_increment = 100;

-- • Inserir pelo menos 2 albuns;
insert into album (nome, tipo, dtLancamento) values
('luz', 'digital', '2000-10-10'),
('Gigantes', 'digital', '2001-10-10');

-- Fazer a modelagem lógica e implementar o modelo físico conforme a regra de negócio:

-- Exibir todos os dados das tabelas separadamente;
select * from album;
select * from musica;

-- Criar a chave estrangeira na tabela de acordo com a regra de negócio;

alter table musica add codAlbum int,
add constraint fkAlbum
foreign key (codAlbum)
references album (idAlbum);

-- c) Atualizar os álbuns de cada música;
update musica set codAlbum = 100 where idMusica = 1;
update musica set codAlbum = 100 where idMusica = 2;
update musica set codAlbum = 101 where idMusica = 5;
update musica set codAlbum = 101 where idMusica = 6;

-- Exibir as músicas e seus respectivos álbuns;
select musica.titulo as Musica, 
album.nome as Album,
musica.artista as Artista,
musica.genero as Genero
from musica join album
on idAlbum = (codAlbum);

-- e) Exibir somente o título da música e o nome do seu respectivo álbum;
select musica.titulo as Musica, 
album.nome as Album
from musica join album
on idAlbum = (codAlbum);

-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.
select musica.titulo as Musica, 
album.nome as Album,
musica.artista as Artista,
album.tipo as tipo               
from musica join album
on idAlbum = (codAlbum);
/* Criar a tabela chamada Professor para conter os dados: idProfessor, nome
(tamanho 50), sobrenome (tamanho 30), especialidade1 (tamanho 40),
especialidade2 (tamanho 40), sendo que idProfessor é a chave primária da tabela. */

create table professor (
idProfessor int auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40),
primary key (idProfessor)
) auto_increment = 1;

-- Inserir pelo menos uns 6 professores.
insert into professor(nome, sobrenome, especialidade1, especialidade2) values
('marcos', 'rosim', 'banco de dados', 'Pesquisa'),
('claudio', 'frizza', 'Pesquisa', 't.i'),
('Alesssasndra', 'brandao', 't.i', 'algoritmos'),
('augusto', 'caio', 'algoritmos', 'socio emocional'),
('maria', 'vera', 'socio emocional', 'Pesquisa'),
('marise', 'augusta', 'arq. comp', 'socio emocional'),
('eduardo', 'henrique', 'sistema operacional', 'socio emocional'),
('alex', 'machine', 'aqr. comp', 'socio emocional');

/* Criar a tabela chamada Disciplina para conter os dados: idDisc, nomeDisc
(tamanho 45), sendo que idDisc é a chave primária da tabela. */
create table disciplina (
idDisc int auto_increment,
nomeDisc varchar(45),
primary key (idDisc)
) auto_increment = 100;

-- Inserir pelo menos 3 disciplinas.
insert into disciplina(nomeDisc) values
("Pesquisa"),
('sistema operacional'),
('aqr. comp'),
('algoritmos'),
('banco de dados');

/* • Configurar a chave estrangeira na tabela conforme sua modelagem (Pode
fazer no comando CREATE TABLE); */
alter table professor add fkDisc int,
add constraint fkDisc 
foreign key (fkDisc)
references disciplina (idDisc);

-- Precisei atualizar a tabela professor para relacionar as tabelas
update professor set fkDisc = 100 where idProfessor = 1;
update professor set fkDisc = 101 where idProfessor = 2;
update professor set fkDisc = 102 where idProfessor = 5;
update professor set fkDisc = 103 where idProfessor = 6;
update professor set fkDisc = 103 where idProfessor = 3;
update professor set fkDisc = 104 where idProfessor = 4;
update professor set fkDisc = 103 where idProfessor = 8;
update professor set fkDisc = 104 where idProfessor = 7;

-- • Exibir os professores e suas respectivas disciplinas;
select professor.nome as professor,
disciplina.nomeDisc as disciplina
from disciplina join professor 
on idDisc = (fkDisc);

-- • Exibir apenas o nome da disciplina e o nome do respectivo professor;
SELECT disciplina.nomeDisc as disciplina,
professor.nome as Professor
from professor join disciplina
on idDisc = (fkDisc);

-- • Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome
SELECT professor.sobrenome as Professor,
disciplina.nomeDisc as Disciplina	
from professor JOIN disciplina on idDisc = (fkDisc);

/* 
• Exibir apenas a especialidade1 e o nome da disciplina, de um determinado
professor, ordenado de forma crescente pela especialidade1;
 */
 SELECT professor.especialidade1 as Especialidade,
 disciplina.nomeDisc as Disciplina
 from professor join disciplina on fkDisc = (idDisc) order by Especialidade;

select * from professor;

/* 2. No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50),
sigla (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.*/

create table curso (
idCurso int auto_increment,
sigla varchar(3),
coordenador varchar(30),
primary key (idCurso)
) auto_increment = 1;

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.
INSERT into curso(sigla ,coordenador) VALUES
('ADS', 'Gerson pinheiros' ),
('SI', 'Katarina paola'),
('CCO', 'Marise coelho');

/* Crie uma regra de negócio com uma nova tabela a sua escolha. Relacione a
tabela que você criou com a tabela curso e insira ou atualize os dados;
Execute os comandos para: */
create table aluno(
 idAluno int primary key auto_increment,
  nome varchar(45),
  raAluno char(8),
  fkCurso int,
  constraint fkCurso foreign key (fkCurso)
  references curso(idCurso)
) auto_increment = 100;

insert into aluno(nome, raAluno, fkCurso) values
("Caio", "01241034", 1),
("Lucas", "01241176", 2),
("jõao", "01241573", 3),
("Djavan", "01241852", 3),
("Mauricio", "01231067", 1);

-- a) Crie a Modelagem Lógica
-- b) Faça um JOIN entre as duas tabelas
select curso.sigla as sigla,
aluno.nome as Nome
from aluno join curso 
on idCurso = (fkCurso);

-- Faça um JOIN com WHERE entre as duas tabelas;
select aluno.nome as NomeAluno,
aluno.raAluno as RA,
curso.sigla as NomeCurso
from curso join aluno on idCurso = fkCurso where curso.sigla = "ADS";

-- Crie um campo com a restrição (constraint) de CHECK;
alter table curso 
add conhecimento varchar(20),
add constraint chkConhecimento
check (conhecimento in ("sem", "com"));

/* - Criar as tabelas equivalentes à modelagem. */
create table cliente(
idCliente int auto_increment,
nome varchar(50),
sobrenome varchar(50),
numPedido int,
telefoneCelular varchar(20),
endereco varchar(100),
primary key (idCliente)
) auto_increment = 1;

create table pet (
idPet int primary key auto_increment,
tipoAnimal varchar(50),
nome varchar(50),
raca varchar(50),
dtNascimento date,
fkCliente int,
constraint fkCliente foreign key (fkCliente) references cliente(idCliente)
) auto_increment = 100;
/*
Inserir dados nas tabelas, de forma que exista mais de um tipo de animal
diferente, e que exista algum cliente com mais de um pet cadastrado. Procure
inserir pelo menos 2 clientes diferentes que tenham o mesmo sobrenome.*/

insert into cliente (nome, sobrenome, numPedido, telefoneCelular, endereco) values
('ana', 'clara', '121', '119213123123', 'avenida paulista'),
('maria', 'clara', '122', '1191234567', 'avenida choro'),
('paula', 'cristina', '123', '112312413', 'congonhas'),
('Clarice', 'cristina', '124', '123123412', 'liberdade');

insert into pet(tipoAnimal, nome, raca, dtNascimento, fkCliente)  values
('Cachorro', 'bolinha', 'chiaua', '2019-11-13', 1),
('Cachorro', 'clarinha', 'poodle', '2001-02-01', 2),
('Gato', 'gary', 'Persa', '2008-12-31', 3),
('Gato', 'Rico', 'Siamês', '2007-09-22', 1),
('Pássaro', 'Blue', 'Calopsita', '2023-11-26', 2);

-- Exibir todos os dados de cada tabela criada, separadamente.

select * from pet;
select * from cliente;

-- - Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
-- - Altere o tamanho da coluna nome do cliente.
alter table cliente modify nome varchar(30);

-- - Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from pet where tipoAnimal = "cachorro";

-- - Exibir apenas os nomes e as datas de nascimento dos pets.
select nome, dtNascimento from pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from pet order by nome;

-- - Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from cliente order by endereco desc;

-- - Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from pet where nome like 'b%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from cliente where sobrenome like '%clara%';

-- Alterar o telefone de um determinado cliente.
update cliente set telefoneCelular = '11 980921312' where idCliente = 2;

-- Exibir os dados dos clientes para verificar se alterou.
select * from cliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select cliente.nome as NomeCliente,
pet.nome as NomePet,
pet.raca as Raca
from cliente join pet on idCliente = (fkCliente);

-- Excluir algum pet.
delete from pet where idPet = 101;

-- Exibir os dados dos pets para verificar se excluiu.
select * from pet;

-- Excluir as tabelas.
drop table pet;

-- Criar tabela pessoa
create table pessoa (
idPessoa int auto_increment,
nome varchar(30),
dtNascimento date,
profissao varchar(20),
primary key (idPessoa)
) auto_increment = 1;

create table gasto (
idGasto int auto_increment,
dataCompra date,
valor decimal (10,2),
descricao varchar(120),
fkPessoa int,
foreign key (fkPessoa) references pessoa (idPessoa),
primary key (idGasto)
) auto_increment = 100;

-- Insira dados nas tabelas
insert into pessoa (nome, dtNascimento, profissao) values 
('Ana', '1965-01-31', 'Programador'),
('Larissa', '1994-12-12', 'Professor'),
('Nicole', '1998-11-29', 'Empregada domestica'),
('Raissa', '2001-12-21', 'Colecionador');

insert into gasto (dataCompra, valor, descricao, fkPessoa) values
('2021-12-11', '39.99', 'Presente de aniversário', 1),
('2022-11-29', '2500.00', 'Viagem para Moscou', 2),
('2020-01-25', '899.00', 'Viagem para  Bahia', 2),
('2019-11-30', '55.89', 'Compras para o dia da mãe', 3);


-- Exiba os dados de cada tabela individualmente.
select * from pessoa;
select * from gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
select pessoa.nome as Nome,
pessoa.dtNascimento as DataNascimento,
pessoa.profissao as Profissão,
gasto.dataCompra as 'Data da Compra',
gasto.valor as Preço,
gasto.descricao as Detalhes
from pessoa join gasto
on idPessoa = fkPessoa
where profissao = 'Programador';

-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select pessoa.nome as Nome,
pessoa.dtNascimento as 'Data de Nascimento',
pessoa.profissao as Profissão,
gasto.valor as Preço
from pessoa join gasto 
on idPessoa = fkPessoa;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select pessoa.nome as Nome,
pessoa.dtNascimento as DataNascimento,
pessoa.profissao as Profissão,
gasto.dataCompra as 'Data da Compra',
gasto.valor as Preço,
gasto.descricao as Detalhes
from pessoa join gasto
on idPessoa = fkPessoa
where pessoa.nome = 'ana';

-- Atualize valores já inseridos na tabela.
update gasto set valor = '20.000' where idGasto = 3;

-- Exclua um ou mais registros de alguma tabela.
delete from pessoa where idPessoa = 102;
delete from gasto where idGasto = 3;
-- EXERCÍCIO 1 ___________________________________________________________________________________________________
/*
Fazer a modelagem lógica (DER) de um sistema para um pet shop cadastrar
os pets e seus donos (clientes).
- Cada pet pertence somente a um cliente.
- Cada cliente pode ter mais de um pet cadastrado
*/

create database pratica5;
use pratica5;

-- Criar as tabelas equivalentes à modelagem.
create table cliente (
  id int auto_increment,
  nome varchar(50),
  telFixo varchar(16),
  telCel varchar(16),
  endereco varchar(100),
  primary key (id)
);

create table pet (
  id int auto_increment,
  tipoAnimal varchar(50),
  nome varchar(50),
  raca varchar(50),
  dtNascimento date,
  primary key (id),
  fkCliente int, constraint fkCliente foreign key (fkCliente) references cliente(id)
) auto_increment = 101;

-- Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente, 
-- e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo
-- menos 2 clientes diferentes que tenham o mesmo sobrenome. Inserir dados na tabela cliente

insert into cliente (nome, telFixo, telCel, endereco) values
('João Silva', '(12) 456-7890', '(97) 654-3210', 'Rua das Flores, 123'),
('Maria Santos', '(11) 222-3333', '(44) 555-6666', 'Avenida Principal, 456'),
('Carlos Oliveira', '(77) 888-9999', '(33) 222-1111', 'Praça Central, 789'),
('Ana Pereira', '(55) 444-3333', '(77) 888-9999', 'Alameda dos Sonhos, 321'),
('Pedro Costa', '(22) 333-4444', '(88) 999-0000', 'Rua das Palmeiras, 987'),
('Mariana Oliveira', '(99) 888-7777', '(22) 333-4444', 'Avenida dos Passarinhos, 654');

-- Inserir dados na tabela pet
insert into pet (tipoAnimal, nome, raca, dtNascimento, fkCliente) values
('Cachorro', 'Rex', 'Labrador Retriever', '2019-05-10', 1),
('Gato', 'Whiskers', 'Siamês', '2020-02-15', 2),
('Pássaro', 'Piu-Piu', 'Canário', '2018-11-20', 3),
('Coelho', 'Frajola', 'Holland Lop', '2017-08-25', 4),
('Cachorro', 'Luna', 'Golden Retriever', '2021-04-30', 5),
('Gato', 'Mittens', 'Persa', '2019-12-10', 1);


-- Exibir todos os dados de cada tabela criada, separadamente.
select * from cliente;
select * from pet;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da
-- criação.
-- JÁ FOI FEITO.

-- Altere o tamanho da coluna nome do cliente.
alter table cliente modify nome varchar(70);

desc cliente;

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo:
-- cachorro).
select * from pet where tipoAnimal = "Gato";

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nome,dtNascimento from pet; 

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from pet order by nome;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from cliente order by endereco desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from pet where nome like 'P%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from cliente where nome like '%Oliveira%';

-- Alterar o telefone de um determinado cliente.
update cliente  set telCel = "(32) 222-1111" where id = 3;

-- Exibir os dados dos clientes para verificar se alterou.
select * from cliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select p.tipoAnimal,
p.nome,
p.raca,
p.dtNascimento,
c.nome, c.telFixo, c.telCel, c.endereco from pet p join cliente c
on c.id = (fkCliente);

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um
-- determinado cliente.
select * from pet p join cliente c
on c.id = (fkCliente)
where c.nome = "Jõao Silva";

-- Excluir algum pet.
delete from pet where id = 105;

-- Exibir os dados dos pets para verificar se excluiu.
select * from pet;

-- Excluir as tabelas.
drop table pet, cliente;

-- EXERCÍCIO 2 
/* 
Crie uma entidade Pessoa, com atributos idPessoa, nome, data de nascimento,
profissão.
Crie uma outra entidade Gasto, com atributos idGasto, data, valor, descrição.
*/
-- Criar tabela pessoa
create table pessoa (
  id int auto_increment,
  nome varchar(45),
  dtNascimento date,
  profissao varchar(50),
  primary key (id)
)   auto_increment = 1;

-- Criar tabela gasto
create table gasto (
 idGasto int auto_increment,
 data date,
 valor decimal(10, 2),
 descricao varchar(250),
 primary key (idGasto),
 fkPessoa int,
 foreign key (fkPessoa) references pessoa(id)
) auto_increment = 100;

--  Insira dados nas tabelas.
insert into pessoa( nome, dtNascimento, profissao) values 
('João da Silva', '1985-07-15', 'Engenheiro'),
('Maria Oliveira', '1990-04-25', 'Médica'),
('Carlos Santos', '1978-12-03', 'Advogado'),
('Ana Pereira', '1982-09-20', 'Professor'),
('Pedro Costa', '1995-03-10', 'Programador'),
('Mariana Mendes', '1989-11-08', 'Arquiteta');

insert into gasto (data, valor, descricao, fkPessoa) values
('2024-04-01', 50.00, 'Compras de supermercado', 1),
('2024-04-02', 30.00, 'Gasolina', 1),
('2024-04-03', 20.00, 'Café da manhã', 2),
('2024-04-04', 100.00, 'Conta de luz', 3),
('2024-04-05', 80.00, 'Jantar fora', 4),
('2024-04-06', 15.00, 'Cinema', 5);

-- Exiba os dados de cada tabela individualmente.
select * from pessoa;
select * from gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da
-- tabela (por exemplo, as pessoas de alguma profissão, etc).
select * from pessoa where profissao = 'Advogado';
select * from gasto where valor > 10;

-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select * from pessoa join gasto on id = fkPessoa;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from pessoa p join gasto on id = fkPessoa
where p.nome = 'João da Silva';

-- Atualize valores já inseridos na tabela.
update pessoa set profissao = 'Uber' where id = 102;
update gasto set valor = 820.00 where idGasto = 3;

-- Exclua um ou mais registros de alguma tabela
delete from pessoa where id = 102;
delete from gasto where idGasto = 3;


-- EXERCÍCIO 3
/* 
Fazer a modelagem lógica no MySQL Workbench de um sistema para cadastrar
os setores de uma empresa, os funcionários desses setores e os acompanhantes
desses funcionários para uma festa que a empresa está organizando para celebrar
o fim da pandemia.
- Cada setor pode ter mais de um funcionário.
- Cada funcionário trabalha apenas em um setor.
*/

-- - Criar um banco de dados chamado PraticaFuncionario.
create database PraticaFuncionario;

-- Selecionar esse banco de dados.
use PraticaFuncionario;

-- Criar as tabelas correspondentes à sua modelagem.
-- Criar tabela setor
create table setor (
  idSetor int auto_increment,
  nome varchar(60),
  numA int,
  primary key(idSetor)
) auto_increment = 100;

-- Criar table Funcionário
create table funcionario (
  idFunc int auto_increment,
  nome varchar(45),
  telefone varchar(16),
  salario decimal(10,2),
  primary key(idFunc),	
  fkSetor int,
  constraint fkSetor
  foreign key (fkSetor) 
  references setor(idSetor)
);

-- Criar tabela Acompanhante
create table acompanhante (
 idAcomp int auto_increment,
 nome varchar(45),
 relacao varchar(40),
 dtNasc date,
 primary key(idAcomp),
 fkFunc int,
 constraint fkFunc
 foreign key (fkFunc)
 references funcionario(idFunc)
) auto_increment = 1000;

-- Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.
insert into setor(nome, numA) values 
('RH', 4),
('Engenharia', 8),
('Programação', 12),
('Pedreiro', 3); 

-- inserir dados da tabela Funcionários
insert into funcionario (nome, telefone, salario, fkSetor) values 
('José Silva', '(123) 456-7890', 2500.00, 100),
('Ana Souza', '(111) 222-3333', 2800.00, 102),
('Carlos Ferreira', '(777) 888-9999', 3000.00, 101),
('Mariana Santos', '(555) 444-3333', 2700.00, 103),
('Pedro Oliveira', '(222) 333-4444', 2600.00, 102),
('Juliana Costa', '(999) 888-7777', 2900.00, 101);

-- inserir dados da tabela Acompanhantes
insert into acompanhante(nome, relacao, dtNasc, fkFunc) values 
('Ana Silva', 'Cônjuge', '1980-03-15', 1),
('João Santos', 'Filho', '2005-07-20', 2),
('Maria Oliveira', 'Mãe', '1960-12-10', 3),
('Pedro Costa', 'Irmão', '1990-05-25', 4),
('Laura Ferreira', 'Filha', '2010-02-28', 5),
('Carla Pereira', 'Amiga', '1985-09-05', 6);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from setor;
select * from funcionario;
select * from acompanhante;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
-- JÁ FEITO

-- Exibir os dados dos setores e dos seus respectivos funcionários.
select * from setor join funcionario on idSetor = fkSetor;

-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
select * from setor s join funcionario f on idSetor = fkSetor where s.nome = 'RH';

-- Exibir os dados dos funcionários e de seus acompanhantes.
select * from funcionario f inner join acompanhante a on idFunc = fkFunc;

-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select * from funcionario f join acompanhante a on idFunc = fkFunc where f.nome = 'Ana Souza';

-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
select * from setor join funcionario on idSetor = fkSetor left join acompanhante on idFunc = fkFunc;
       
drop database PraticaFuncionario;
       
-- EXERCÍCIO 4 ______________________________________________________________________________________________
/*
Fazer a modelagem lógica de um sistema para cadastrar os treinadores de
nadadores, que participarão de vários campeonatos, representando o Brasil.
- Cada treinador treina mais de um nadador.
- Cada nadador tem apenas um treinador. 
*/

-- a) Criar um banco de dados chamado Treinador.
create database treinador;

-- b) Selecionar esse banco de dados.
use treinador;

-- c) Criar as tabelas correspondentes à sua modelagem.
-- Criar tabela treinador experiente
create table treinador (
  idTreinador int auto_increment, 
  nome varchar(45),
  telefone varchar(16),
  primary key(idTreinador),
  email varchar(80)
) auto_increment = 1;

-- Criar tabela nadador
create table nadador (
  idNadador int auto_increment,
  nome varchar(45), 
  estadoOrigem char(3),
  dtNasc date,
  primary key(idNadador),
  fkTreinador int,
  foreign key (fkTreinador) references treinador(idTreinador)
) auto_increment = 100;

-- Criar tabela treinador novato
create table orientador (
   idOrientador int auto_increment,
   nome varchar(45),
   telefone varchar(16),
   email varchar(70),
   primary key(idOrientador),
   fkOrientador int,
   foreign key (fkOrientador)
   references treinador(idTreinador)
)auto_increment = 1000;

-- d) Inserir dados nas tabelas, de forma que exista mais de um nadador para algum
-- treinador, e mais de um treinador sendo orientado por algum treinador mais experiente.
-- Inserir dados tabela treinador experiente
insert into treinador (nome, telefone, email) values
('Carlos Rodrigues', '(12) 56-7890', 'carlos@example.com'),
('Mariana Santos', '(11) 22-3333', 'mariana@example.com'),
('Pedro Oliveira', '(77) 88-9999', 'pedro@example.com'),
('Ana Silva', '(55) 44-3333', 'ana@example.com'),
('João Costa', '(22) 33-4444', 'joao@example.com'),
('Laura Ferreira', '(99) 88-7777', 'laura@example.com');

-- Inserir dados tabela nadador
insert into nadador(nome, estadoOrigem, dtNasc, fkTreinador)  values
('Ana Silva', 'SP', '1995-04-10', 1),
('Pedro Oliveira', 'RJ', '1998-09-20', 2),
('Mariana Santos', 'MG', '1993-12-15', 3),
('João Costa', 'BH', '1992-06-05', 1),
('Carlos Rodrigues', 'PA', '1997-03-25', 2),
('Laura Ferreira', 'SC', '1994-11-08', 3);

-- Inserir dados tabela treinador NOVATO
insert into orientador (nome, telefone, email, fkOrientador) values
('Rafaela Souza', '(123) 456-7890', 'rafaela@example.com', 1),
('Bruno Oliveira', '(111) 222-3333', 'bruno@example.com', 2),
('Aline Santos', '(777) 888-9999', 'aline@example.com', 3),
('Lucas Pereira', '(555) 444-3333', 'lucas@example.com', 1),
('Carolina Rodrigues', '(222) 333-4444', 'carolina@example.com', 2),
('Daniel Ferreira', '(999) 888-7777', 'daniel@example.com', 3);

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from treinador;
select * from nadador;
select * from orientador;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- Já foi feito.

-- g) Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select * from treinador t join nadador n on idTreinador = fkTreinador;

-- h) Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
select * from treinador t join nadador n on idTreinador = (fkTreinador) where t.nome = 'Carlos Rodrigues';

-- i) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.
select * from treinador t join orientador o on idTreinador = fkOrientador;

-- j) Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o
-- nome do treinador na consulta).
select * from treinador t join orientador o on idTreinador = fkOrientador where o.nome = 'Daniel Ferreira';

-- l) Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados
-- dos respectivos treinadores orientadores.
select * from treinador t join nadador n on idTreinador = fkTreinador join orientador on idTreinador = fkOrientador;

drop database treinador;
-- m) Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos
-- respectivos nadadores e os dados do seu treinador orientador.
select * from treinador t join nadador n
on idTreinador = (fkTreinador) 
join orientador on idTreinador = (fkOrientador)
where t.nome = 'Ana Silva';

select * from treinador;-- EXECÍCIO 1 _____________________________________________________________________________________________________________________________________
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
-- a) Criar um banco de dados chamado Venda.
create database venda;

-- b) Selecionar esse banco de dados.
use venda;

-- c) Criar as tabelas correspondentes à sua modelagem.
create table cliente (
   idCliente int primary key auto_increment,
   nome varchar(70),
   email varchar(80),
   endereco varchar(100),
   fkIndicador int,
   foreign key(fkIndicador) references cliente(idCliente)
   );

create table venda (
	idVenda int not null auto_increment,
    totalVenda decimal(10,2),
    dtVenda  date,
    fkCliente int,
    primary key (idVenda),
    constraint fk_venda_cliente 
         foreign key(fkCliente) references cliente(idCliente)
) auto_increment = 100;    

create table produto (
  idProduto int auto_increment,
  nome varchar(70),
  descricao varchar(100),
  preco decimal(10,2),
  primary key (idProduto)
) auto_increment = 10;

create table produtoVenda (
  quantidade int,
  desconto decimal(5,2),
  fkVenda int,
  fkProduto int,
  foreign key (fkVenda) references venda(idVenda),
  foreign key (fkProduto) references produto(idProduto), 
  primary key (fkVenda, fkProduto)
);

-- d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
-- cliente, e mais de um cliente sendo indicado por outro cliente.
insert into cliente values 
(null, 'Giovanna A', 'giovannaA@gmail.com', 'Rua abreu', null),
(null, 'Rafael R', 'rafaelR@gmail.com', 'Rua B', 1),
(null, 'Marina M', 'marinaM@gmail.com', 'Rua C', null),
(null, 'Renatinho R', 'renatinho@gmail.com', 'D', 3);

insert into venda values 
(null, 1000.00, '2024-03-21', 1),
(null, 310.30, '2024-03-21', 1),
(null, 20.40, '2024-03-21', 2),
(null, 110.00, '2023-04-18', 2),
(null, 65.99, '2024-08-15', 3),
(null, 95.99, '2023-11-28', 3),
(null, 2110.00, '2023-08-29', 4),
(null, 9012.00, '2023-12-05', 4);  

insert into produto values 
(null, 'notebook', 'lenovo', 5000.00),
(null, 'monitor', 'monitor lg', 650.15),
(null, 'Relógio', 'Relógio inteligente', 100.20),
(null, 'Siri', 'sei la', 1005.00),
(null, 'Teclado', 'Teclado bluetooth', 100.20),
(null, 'notebook', 'Acev', 900.00),
(null, 'Alexa', 'Amazon', 312.00),
(null, 'fone bluetooth', 'Fone de ouvido sem fio ,', 125.00);

insert into produtoVenda (quantidade, desconto, fkVenda, fkProduto) 
values (2, 50.00, 100, 10),
	   (2, 45.00, 101, 11),
       (2, 15.00, 102, 12),
       (2, 40.00, 103, 13),
       (2, 35.00, 104, 14),
       (2, 10.00, 105, 15),
       (2, 24.00, 106, 16),
       (2, 19.00, 107, 17);

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from cliente;
select * from venda;
select * from produto;
select * from produtoVenda;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- já feito

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
select cli.nome 'Cliente',
       cli.email,
       cli.endereco, 
       cli.fkIndicador 'indicador',
       ven.totalVenda,
       ven.dtVenda,
       ven.fkCliente
       from cliente cli
       left join cliente indi on indi.idCliente = cli.fkIndicador
       left join venda ven on ven.fkCliente = cli.idCliente;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta e os dados de suas respectivas vendas.
select cli.nome 'Cliente',
       cli.email,
       cli.endereco, 
       cli.fkIndicador 'indicador',
       ven.totalVenda,
       ven.dtVenda,
       ven.fkCliente
       from cliente cli
       left join cliente indi on indi.idCliente = cli.fkIndicador
       left join venda ven on ven.fkCliente = cli.idCliente
       where cli.nome = 'Rafael R';


-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes
-- indicadores, porém somente de um determinado cliente indicador (informar o nome do cliente que indicou na consulta).
select 
	  c1.idCliente ID,
      c1.nome as 'clienteIndicado',
      c1.email,
      c1.endereco, 
      c2.idCliente ID,
      c2.nome as 'Indicador',
      c2.email,
      c2.endereco
      from cliente c1
      join cliente c2 on c1.fkIndicador = c2.idCliente
      where c2.nome = 'Giovanna A';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
-- dados das respectivas vendas e dos produtos.
select c1.nome Cliente, c2.nome Indicador, v.*, p.*
       from cliente c1
       inner join cliente c2 on c1.fkIndicador = c2.idCliente
       inner join venda v on c1.idCliente = v.fkCliente
       inner join produtoVenda vp on v.idVenda = vp.fkVenda
       inner join produto p on vp.fkProduto = p.idProduto;
       
-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
select 
	  v.dtVenda,
      p.nome 'Produto',
      vp.quantidade
      from venda v
      join produtoVenda vp on v.idVenda = vp.fkVenda
      join produto p on vp.fkProduto = p.idProduto
      where v.idVenda = 105;
      
-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
-- produtos vendidos agrupados pelo nome do produto.
select 
      p.nome 'Produto', p.preco, sum(vp.quantidade) 'qtVendidos'
      from produto p
      join produtoVenda vp on p.idProduto = vp.fkProduto
      group by p.nome, p.preco;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
-- vendas, e os clientes que não realizaram nenhuma venda.
insert into cliente (nome, email, endereco, fKIndicador) 
values ('Samuel N', 'SamuelN@gmail.com', 'Rua Sptech', 1);

select c.*, v.*
from cliente c
left join venda v on c.idCliente = v.fkCliente;

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
select min(preco) as 'precoMinimo', 
       max(preco) as 'precoMaximo' 
       from produto;

-- q) Exibir a soma e a média dos preços dos produtos;
select sum(preco) as 'somaPreco', 
       avg(preco) as 'mediaPreco' 
       from produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
select count(*) AS 'Quantidade preços acima média'
	   from produto where preco > (select avg(preco) from produto);

-- s) Exibir a soma dos preços distintos dos produtos:
select sum(distinct preco) as 'soma preços distintos' 
       from produto;

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
select v.idVenda, sum(p.preco * vp.quantidade) as Soma_Precos
       from venda v
       join produtoVenda vp on v.idVenda = vp.fkVenda
       join produto p on vp.fkProduto = p.idProduto
       group by v.idVenda;
