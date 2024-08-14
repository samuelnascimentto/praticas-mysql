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
