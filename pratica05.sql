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

select * from treinador;