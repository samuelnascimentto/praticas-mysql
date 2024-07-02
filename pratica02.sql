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
('LUCAS', 'Basquete', 3),
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

drop table restaurante;