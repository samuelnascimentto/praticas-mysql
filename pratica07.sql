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
