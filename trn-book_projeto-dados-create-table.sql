/*script para criar tabelas do banco de dados "comercial" - capítulo 14  "SQL" - 03/12/2024 */

--create database comercial

create table cliente(
	codigo_cliente smallint not null unique primary key,
	nome_cliente varchar(80),
	endereco_cliente char(80),
	cidade_cliente char(40),
	cep_cliente char(8),
	uf_cliente char(2),
	cnpj_cliente char(14),
	ie_cliente char(20)
);

create table vendedor(
	codigo_vendedor smallint not null unique primary key,
	nome_vendedor varchar(80),
	salario_fixo money,
	faixa_comissao varchar (1)
);

create table produto(
	codigo_produto smallint not null unique primary key,
	descricao_produto char(40),
	unidade_produto char(4),
	valor_unitario_produto money
);

create table pedido(
	numero_pedido int not null unique primary key,
	prazo_entrega smallint not null,
	codigo_cliente smallint not null,
	codigo_vendedor smallint not null,
	foreign key (codigo_cliente) references cliente,
	foreign key (codigo_vendedor) references vendedor
);

create table item_de_pedido(
	numero_pedido int not null unique,
	codigo_produto smallint not null unique,
	quantidade_produto decimal,
	constraint PK_ITEM_DE_PEDIDO primary key (numero_pedido, codigo_produto),
	constraint FK_PEDIDO  foreign key (numero_pedido) references pedido,
	constraint FK_PRODUTO foreign key (codigo_produto) references produto
);

/*
drop table cliente;
drop table vendedor;
drop table produto;
drop table pedido;
drop table item_de_pedido; 
*/


--select * from cliente;
--select * from vendedor;
--select * from produto; 
--select * from pedido;
--select * from item_de_pedido;