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
values (2, 'ISABELA', 'Voleii', 1); 

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
