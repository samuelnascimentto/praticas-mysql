/*
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