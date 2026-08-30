--Aula 47 - Left Join e Right Join - Join - Como utilizar. 05/02/2025

select * 
from usuario u

select * 
from comanda c 

-- Caso 1 - Left Join

select * 
from usuario u
left join comanda c on u.usuario_id  = c.comanda_id 

-- Caso 1 - Left Join
select  *
from comanda c 
left join usuario u on c.comanda_id  = u.usuario_id 



select * 
from usuario u
right join comanda c on u.usuario_id  = c.comanda_id 


select  *
from comanda c 
right join usuario u on c.comanda_id  = u.usuario_id 

select  *
from comanda c 
right join usuario u on c.comanda_id  = u.tppessoa_id 

select  *
from comanda c 
left join usuario u on c.comanda_id  = u.tppessoa_id 
-- 05/02/2025 - Aula 48 - Full Join e Cross Join  Join - Como utilizar.

select * from comanda c 

select * from usuario u 


-- Caso 1 - Aplicando Full Join
select *
from comanda c 
full join usuario u on c.usuario_id = u.usuario_id 


-- Caso 2 - Aplicando inner Join: somente os resultados da intersecçao
select *
from comanda c 
-- somente os dados interseção
inner join usuario u 
--intersecção
on c.usuario_id = u.usuario_id 


-- Caso 3 - Aplicando inner Left: somente os resultados da intersecçao
select *
from comanda c 
-- dados da interseção e os dados a esquerda da interseção
left join usuario u 
--intersecção 
on c.usuario_id = u.usuario_id 


-- Caso 4 - Aplicando Right Join: somente os resultados da intersecçao
select *
from comanda c 
-- dados da interseção e os dados a direita da interseção
right join usuario u 
--intersecção 
on c.usuario_id = u.usuario_id 


-- Caso 5 - Aplicando Right Join: somente os resultados da intersecçao
select c.comanda_id 
		, c.dt_inic 
from comanda c 
-- dados da interseção e os dados a direita da interseção
right join usuario u 
--intersecção 
on c.usuario_id = u.usuario_id 


-- Caso 6 - Aplicando Left Join: somente os resultados da intersecçao
select c.comanda_id 
		, c.dt_inic 
from comanda c 
-- dados da interseção e os dados a direita da interseção
left join usuario u 
--intersecção 
on c.usuario_id = u.usuario_id 


-- Caso 6 - Aplicando Cross Join: produto cartesiano
-- Traz as informações das tabelas usuário e tipo_pessoa
select * from usuario u 
cross join tipo_pessoa tp


-- 13/02/2025 - Aula 50 - IN() e NOT IN()  Join - Como utilizar.


-- Caso 1: 
select *
from usuario u
	,tipo_pessoa tp 
where  u.tppessoa_id = tp.tppessoa_id 
and tp.tppessoa_id in(1, 2)


-- Caso 2: 
select *
from usuario u
	,tipo_pessoa tp 
where  u.tppessoa_id = tp.tppessoa_id 
and tp.tppessoa_id in(1)


-- Caso 3: 
select *
from usuario u
	,tipo_pessoa tp 
where  u.tppessoa_id = tp.tppessoa_id 
and tp.tppessoa_id in(2, 1, 3)



-- Caso 4: negando 
select *
from usuario u
	,tipo_pessoa tp 
where  u.tppessoa_id = tp.tppessoa_id 
and tp.tppessoa_id not in( 1, 3)
-- Aula 51 - Having - Como utilizar operadores nas condições


-- Case 1: aplicação da cláusula "GROUP BY"
select u.nome 
	 , u.cpf 
	 , count(c.comanda_id)
from usuario u
left join comanda c on u.usuario_id  = c.usuario_id 
group by u.nome
		,u.cpf
		
		
-- Case 2: aplicação da cláusula "HAVING"count()
select u.nome 
	 , u.cpf 
	 , count(c.comanda_id)
from usuario u
left join comanda c on u.usuario_id  = c.usuario_id 
group by u.nome
		,u.cpf
having count(c.comanda_id) = 1

-- Case 3: aplicação da cláusula "HAVING"sum()
select u.nome 
	 , u.cpf 
	 , count(c.comanda_id)
from usuario u
left join comanda c on u.usuario_id  = c.usuario_id 
group by u.nome
		,u.cpf
having sum(c.comanda_id) = 1





-- Aula-52 - Exists and Not Exists - Como utilizar

select * from usuario u 


-- Case 1 - aplicando cláusula EXISTS
select * from usuario u 
where exists ( select 1
				from comanda c2
				where c2.usuario_id  = u.usuario_id )

				
-- Case 2 - aplicando cláusula NOT EXISTS
select * from usuario u 
where not exists ( select 1
				from comanda c2
				where c2.usuario_id  = u.usuario_id
				and exists(select 1 from usuario u2
										, tipo_pessoa tp 
							where u2.usuario_id = c2.usuario_id
							and u2.tppessoa_id = tp.tppessoa_id
							and tp.tppessoa_id = 2
							)
				)
-- Aula 53- Limit - Como utilizar? -  22/fev/2025.


-- Case 1 -  traz uma quantidade de tupla determinanda pela cláusula LIMIT
select * from usuario u 
limit 1

-- Case 2
select * from usuario u 
order by u.usuario_id desc
limit 2
--30/01/2025 - CLÁUSULA BETWEEN -REVIEW
-- Revisão da cláusula BETWEEN 30/01/2025

select * from pedido p

-- Aplicando máscara para datas usando to_char(coluna, máscara)
select to_char(p.dt_inic, 'DD/MM/YYYY') from pedido p


-- Caso 1 --> sem aplicação de BETWEEN
select to_char(p.dt_inic, 'DD/MM/YYY')
from pedido p 
where p.dt_inic  >= '02/09/2024'
and p.dt_inic <= '31/01/2025'

-- Caso 2 --> com aplicação de BETWEEN
select to_char(p.dt_inic, 'DD/MM/YYY')
from pedido p 
where p.dt_inic between '02/09/2024' and '30/09/2024'


-- Caso 3 --> com aplicação de BETWEEN - fora do range de data
select to_char(p.dt_inic, 'DD/MM/YYY')
from pedido p 
where p.dt_inic between '09/09/2024' and '30/09/2024'

-- Caso 4 --> com aplicação de BETWEEN - fora do range de data
select *
from pedido p 
where p.pedido_id between 0 and 1

-- Caso 5 --> com aplicação de BETWEEN - fora do range de data
select *
from pedido p 
where p.pedido_id between 2 and 3

-- path: C:\Users\rogon\AppData\Roaming\DBeaverData\workspace6\General\Scripts


/*11/12/2024 - Aula 43 - Between - Como utilizar? */

select *
from pedido p

-- Exemplo 1 - utilizando Between
select to_char(p.dt_inic, 'DD/MM/YYYY'),
		p.pedido_id 
from pedido p
where p.dt_inic between '01/09/2024' and '03/09/2024'

-- Exemplo 2 - utilizando Between
select to_char(p.dt_inic, 'DD/MM/YYYY') as "Data do Pedido",
		p.pedido_id "Id do Pedido"
from pedido p
where p.pedido_id between 0 and 3

--*******
-- Revisão de Between 09/01/2025
select * 
from pedido p 

--Exibir as datas em padrão brasileiro.
select to_char(p.dt_inic, 'DD/MM/YY') 
from pedido p

--Aplicando BETWEEN nas consultas
select to_char(p.dt_inic, 'DD/MM/YY') 
from pedido p
where p.dt_inic  >= '01/09/2024'
and p.dt_inic  <= '30/09/2024'

select to_char(p.dt_inic, 'DD/MM/YY') 
from pedido p
where p.dt_inic between '03/09/2024' and '21/09/2024'

select *
from pedido p
where p.pedido_id between 1 and 3
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
create table weather(
city varchar(80),
temp_lo int, --low temperature
temp_hi int, --high temperature
precp real,  --precipitation
date date 
);

create table cities(
name varchar(80),
location point
);
--Aula 44 - Distinct - como utilizar?
--13/jan/2025

select *
from pedido p


select distinct p.aprovado as Status,
		p.comanda_id as Comanda
from pedido p


-- xx/xx/2025 - Aula 44 - Distinct - Como utilizar? revisão
select  * from pedido p 

--Cláusula "DISTINCT"
-- Apresentando as informações de aprovado  e comanda_id

select distinct 
p.pedido_id as "Id do Pedido", p.aprovado as Status
from pedido p

-- Distinct é equivalente a cláusula  GROUP BY, mas cuidado caos utilizar.


/*Aula 42 - 11/12/2024 - GROUP BY, COMO UTILIZAR?*/

select  * from usuario u 
order by u.tppessoa_id desc 

--Exemplo 1 de GROUP BY

select count(u.tppessoa_id) as "Quantide de Tipo de Pessoa",
	   u.tppessoa_id as "Tipo de Pessoa"
from usuario u 
group by u.tppessoa_id


		 
--Exemplo 2 de GROUP BY

select count(u.tppessoa_id) as "Quantide de Tipo de Pessoa",
	   u.tppessoa_id as "Tipo de Pessoa",
	   u.nome "Nome"
from usuario u 
group by u.tppessoa_id,
		 u.nome 

-- REVIEW|: Aula 45 - Indrodução sobre a Junções (Join) - 0102x/2025

-- REVIEW|: Aula 46 - Inner Join - 01/02/2025
-- A função INNER JOIN (intersecção)

select * from comanda c 

select * from tipo_pessoa tp 


select  * 
from usuario u
where u.usuario_id = 1

-- chave são registros integros, não duplicados em um banco de dados.

-- Caso 1 - INNER JOIN
select * from comanda c 
inner join usuario u  on  c.usuario_id  = u.usuario_id 


-- Caso 2 -  JOIN
select * from comanda c 
join usuario u  on  c.usuario_id  = u.usuario_id

--Caso 3 -  selecionando colunas para o retorno da query
select c.comanda_id "Id da Comanda",
u.usuario_id  "Id do Cliente",
u.nome  "Nome",
u.cpf "CPF"
from comanda c 
join usuario u  on  c.usuario_id  = u.usuario_id

--Caso 4 -  mais de uma junção
select c.comanda_id "Id da Comanda",
u.usuario_id  "Id do Cliente",
tp.descricao "Tipo de Pessoa",
u.nome  "Nome",
u.cpf "CPF"
from comanda c 
join usuario u  on  c.usuario_id  = u.usuario_id
join tipo_pessoa tp on u.tppessoa_id = tp.tppessoa_id 



/*Populando tabelas - página 46 */

insert into weather values('San Francisco', 46, 50, 0.25, '1994-11-27');
insert into weather values('San Francisco', 06, 10, 0.55, '1994-11-27');

select * from weather w 

insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-29', 'Hayward', 54, 37, 0.66);

insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-30', 'São Paulo', 60, 47, 0.61);

insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-20', 'Manaus', 74, 37, 0.66);
insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-21', 'Manaus', 74, 37, 0.66);
insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-20', 'Manaus', 84, 37, 0.66);

insert into weather (date, city, temp_hi, temp_lo)
values('1994-11-29', 'Hayward', 54, 37);

insert into weather (date, city, temp_hi, temp_lo)
values('1994-11-30', 'Hayward', 54, 37);
insert into weather (date, city, temp_hi, temp_lo)
values('1994-11-01', 'Hayward', 54, 37);


--Selcionando colunas e organizando com ORDER BY
select * from weather w 
where precp notnull 
order by city
select * 
from aula1

select * from aula3 a 

select a1.descricao as "Descrição"
from aula1 as a1

select a3.* from aula3 as a3
/*Review - 23/11/2024 - Alias*/

select * 
from usuario  as usu

/*Exemplo 2 - retornando todas as colunas*/
select usu.*
from usuario  as usu

/*Exemplo 3 - retornando a coluna nome*/
select usu.nome 
from usuario  as usu

/*Exemplo 4 - retornando a coluna nome com alias*/
select usu.nome as "Nome Funcionário"
from usuario  as usu

/*Exemplo 5 - retornando a coluna nome com alias - ordem crescente*/
select usu.nome as "Nome Funcionário"
from usuario  as usu
order by usu.nome asc 

select * 
/*Colunas a serem exibidas no resultado Qurey*/
from cardapio c 
/*Quais tabelas que serão utilizadas.*/

select * from usuario u 

select u.nome 
from usuario u 

select u.nome, u.tppessoa_id, u.cpf 
from usuario u 

select e.dt_atualizacao, e.qtde_minima 
from estoque e 

select e.dt_atualizacao, e.qtde_minima 
from estoque e 
where e.qtde_minima > 100

select *
/*Colunas a serem exibidas no resultado Qurey*/
from 
/*Quais tabelas que serão utilizadas.*/
cardapio c
/*Quais condições*/
where c.vlr_preparo > 0
and c.nome <> 'Porção de petiscos'
/*Review clausulas - operadores condicionais - 	WHERE, AND, OR*/

select vlr_preparo as "Valor de Preparo", nome as "Prato"
from cardapio as c
where vlr_preparo > 0
  and nome = 'Hamburguer da Casa'
  
select *
from cardapio as c
where vlr_preparo > 0
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15)
and c.nome = 'casa'

select *
from cardapio as c
where vlr_preparo > 0
and (c.tempo_preparo >= 0
	 or c.tempo_preparo > 15)

--Aula 41 Funções Matemáticas  - Count, Max, Min, Avg

--A Função cunt traz a quantidade de linhas
select count(*) from cardapio c 

-- Ao utilizar contadores, utilize a chave primária para cntar registros.
select count(c.cardapio_id) from cardapio c 

select  * from pedido p 

select count(ec.qtde) from estoque_cardapio ec 


/*Retorna o maior valor de uma consulta de uma coluna.*/
select max(p.dt_fim) from pedido p 

/*Retorna o menor valor de uma consulta de uma coluna.*/
select min(p.dt_fim) from pedido p 

/*AVG - Média de valores de uma determinada coluna*/
select avg(c.vlr_preparo) as "Valor Médio", avg(c.tempo_preparo) "Tempo Médio"
from cardapio c 

/*Tamanho de caracteres de células de uma colunas.*/
select length(c.nome)
from cardapio c 
--Aula 40 - Order By - Como utilizar?

select *
from cardapio as c
where c.unidade_id = 1
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15)
order by 1 desc 

select *
from cardapio as c
where c.unidade_id = 1
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15)
order by 2 desc 

select  c.nome as "Nome do item"
from cardapio c 
order by "Nome do item" desc 
select * from estoque_cardapio ec 
select * from cardapio c 
select * from fornecedor f 
select * from pedido p 
select * from usuario u 


select e.qtde ,e.estoque_cardapio_id ,e.cardapio_id 
from estoque_cardapio e 

select e.qtde ,e.estoque_cardapio_id ,e.cardapio_id 
from estoque_cardapio e 
where e.cardapio_id = 1

select e.qtde ,e.estoque_cardapio_id ,e.cardapio_id 
from estoque_cardapio e 
/*A clausula WHERE é o primeiro parâmetro da Query*/
where e.cardapio_id != 1



CREATE SEQUENCE unidade_unidade_id_seq;

CREATE TABLE UNIDADE (
                UNIDADE_ID INTEGER NOT NULL DEFAULT nextval('unidade_unidade_id_seq'),
                SEGMENTO VARCHAR(100) NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                NOME VARCHAR(100) NOT NULL,
                CONSTRAINT unidade_id_pk PRIMARY KEY (UNIDADE_ID)
);


ALTER SEQUENCE unidade_unidade_id_seq OWNED BY UNIDADE.UNIDADE_ID;

CREATE SEQUENCE cardapio_cardapio_id_seq;

CREATE TABLE CARDAPIO (
                CARDAPIO_ID INTEGER NOT NULL DEFAULT nextval('cardapio_cardapio_id_seq'),
                NOME VARCHAR(150) NOT NULL,
                VLR_PREPARO DOUBLE PRECISION NOT NULL,
                TEMPO_PREPARO INTEGER NOT NULL,
                UNIDADE_ID INTEGER NOT NULL,
                CONSTRAINT cardapio_id_pk PRIMARY KEY (CARDAPIO_ID)
);


ALTER SEQUENCE cardapio_cardapio_id_seq OWNED BY CARDAPIO.CARDAPIO_ID;

CREATE SEQUENCE item_item_id_seq;

CREATE TABLE ITEM (
                ITEM_ID INTEGER NOT NULL DEFAULT nextval('item_item_id_seq'),
                CD INTEGER NOT NULL,
                DESCRICAO VARCHAR(100) NOT NULL,
                UNIDADE_MEDIDA VARCHAR(5) NOT NULL,
                VLR DOUBLE PRECISION NOT NULL,
                FORNECEDOR_ID INTEGER NOT NULL,
                CONSTRAINT item_id_pk PRIMARY KEY (ITEM_ID)
);


ALTER SEQUENCE item_item_id_seq OWNED BY ITEM.ITEM_ID;

CREATE SEQUENCE estoque_estoque_id_seq;

CREATE TABLE ESTOQUE (
                ESTOQUE_ID INTEGER NOT NULL DEFAULT nextval('estoque_estoque_id_seq'),
                QTDE NUMERIC(5,2) NOT NULL,
                QTDE_MINIMA NUMERIC(5,2),
                DT_ATUALIZACAO TIMESTAMP NOT NULL,
                ITEM_ID INTEGER NOT NULL,
                CONSTRAINT estoque_id_pk PRIMARY KEY (ESTOQUE_ID)
);

CREATE TABLE ESTOQUE_CARDAPIO (
                ESTOQUE_CARDAPIO_ID SERIAL,
                ESTOQUE_ID INTEGER NOT NULL,
                CARDAPIO_ID INTEGER NOT NULL,
                QTDE NUMERIC(5,2) NOT NULL,
                CONSTRAINT estoque_cardapio_id_pk PRIMARY KEY (ESTOQUE_CARDAPIO_ID),
		CONSTRAINT estoque_cardapio_id_uk UNIQUE (ESTOQUE_ID, CARDAPIO_ID ),
                CONSTRAINT estoque_estoque_cardapio_fk FOREIGN KEY (ESTOQUE_ID) REFERENCES ESTOQUE,
                CONSTRAINT cardapio_estoque_cardapio_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO
);



CREATE SEQUENCE fornecedor_fornecedor_id_seq;

CREATE TABLE FORNECEDOR (
                FORNECEDOR_ID INTEGER NOT NULL DEFAULT nextval('fornecedor_fornecedor_id_seq'),
                NOME_FANTASIA VARCHAR(300) NOT NULL,
                RESPONSAVEL VARCHAR(200) NOT NULL,
                DT_INCL DATE NOT NULL,
                CNPJ VARCHAR(14) NOT NULL,
                INSCRICAO_ESTADUAL VARCHAR(10),
                SITUACAO INTEGER NOT NULL,
                CONSTRAINT fornecedor_id_pk PRIMARY KEY (FORNECEDOR_ID)
);
COMMENT ON COLUMN FORNECEDOR.SITUACAO IS '1 - ATIVO
0 - INATIVO';


ALTER SEQUENCE fornecedor_fornecedor_id_seq OWNED BY FORNECEDOR.FORNECEDOR_ID;

CREATE SEQUENCE tipopessoa_tppessoa_seq;

CREATE TABLE TIPO_PESSOA (
                TPPESSOA_ID INTEGER NOT NULL DEFAULT nextval('tipopessoa_tppessoa_seq'),
                DESCRICAO VARCHAR(50) NOT NULL,
                CONSTRAINT tppessoa_id_pk PRIMARY KEY (TPPESSOA_ID)
);


ALTER SEQUENCE tipopessoa_tppessoa_seq OWNED BY TIPO_PESSOA.TPPESSOA_ID;

CREATE SEQUENCE pessoa_pessoa_seq;

CREATE TABLE USUARIO (
                USUARIO_ID INTEGER NOT NULL DEFAULT nextval('pessoa_pessoa_seq'),
                NOME VARCHAR NOT NULL,
                CPF VARCHAR(11) NOT NULL,
                TPPESSOA_ID INTEGER NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                TELEFONE VARCHAR(14),
                EMAIL VARCHAR(50),
                SENHA VARCHAR(150) NOT NULL,
                CONSTRAINT usuario_id_pk PRIMARY KEY (USUARIO_ID)
);
COMMENT ON COLUMN USUARIO.CPF IS 'IRÁ GRAVAR A INFORMAÇÃO DE IDENTIFICAÇÃO DA PESSOA, CASO SEJA FISICA O CPF , CASO JURIDICA O CNPJ';


ALTER SEQUENCE pessoa_pessoa_seq OWNED BY USUARIO.USUARIO_ID;

CREATE SEQUENCE comanda_comanda_id_seq;

CREATE TABLE COMANDA (
                COMANDA_ID INTEGER NOT NULL DEFAULT nextval('comanda_comanda_id_seq'),
                DT_INIC TIMESTAMP NOT NULL,
                DT_ENCERRAMENTO TIMESTAMP,
                VLR_TOTAL DOUBLE PRECISION,
                USUARIO_ID INTEGER NOT NULL,
                CONSTRAINT comanda_id_pk PRIMARY KEY (COMANDA_ID)
);


ALTER SEQUENCE comanda_comanda_id_seq OWNED BY COMANDA.COMANDA_ID;

CREATE SEQUENCE pedido_pedido_id_seq;

CREATE TABLE PEDIDO (
                PEDIDO_ID INTEGER NOT NULL DEFAULT nextval('pedido_pedido_id_seq'),
                DT_INIC TIMESTAMP,
                APROVADO INTEGER NOT NULL,
                DT_FIM TIMESTAMP,
                COMANDA_ID INTEGER NOT NULL,
                USUARIO_ID_CLIENTE INTEGER NOT NULL,
                USUARIO_ID_FUNCIONARIO INTEGER NOT NULL,
                CONSTRAINT pedido_id_pk PRIMARY KEY (PEDIDO_ID)
);

CREATE TABLE CARDAPIO_PEDIDO (
                CARDAPIO_PEDIDO_ID SERIAL,
                CARDAPIO_ID INTEGER NOT NULL,
                PEDIDO_ID INTEGER NOT NULL,
                QTDE INTEGER NOT NULL,
                CONSTRAINT cardapio_pedido_id_pk PRIMARY KEY (CARDAPIO_PEDIDO_ID),
		CONSTRAINT cardapio_pedido_id_uk UNIQUE(CARDAPIO_ID, PEDIDO_ID ),
                CONSTRAINT cardapio_cardapio_pedido_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO,
                CONSTRAINT pedido_cardapio_pedido_fk FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO
);


ALTER TABLE CARDAPIO ADD CONSTRAINT unidade_cardapio_fk
FOREIGN KEY (UNIDADE_ID)
REFERENCES UNIDADE (UNIDADE_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ESTOQUE ADD CONSTRAINT item_estoque_fk
FOREIGN KEY (ITEM_ID)
REFERENCES ITEM (ITEM_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE USUARIO ADD CONSTRAINT tipo_pessoa_pessoa_fk
FOREIGN KEY (TPPESSOA_ID)
REFERENCES TIPO_PESSOA (TPPESSOA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ITEM ADD CONSTRAINT fornecedor_item_fk
FOREIGN KEY (FORNECEDOR_ID)
REFERENCES FORNECEDOR (FORNECEDOR_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk
FOREIGN KEY (USUARIO_ID_CLIENTE)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk1
FOREIGN KEY (USUARIO_ID_FUNCIONARIO)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE COMANDA ADD CONSTRAINT usuario_comanda_fk
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT comanda_pedido_fk
FOREIGN KEY (COMANDA_ID)
REFERENCES COMANDA (COMANDA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

INSERT INTO unidade (segmento, nome, endereco)
VALUES
    ('Shopping', 'Barzim do shops', 'Shopping da barra, Avenida Beria Rio, Florianópolis SC'),
    ('Tradicional', 'Restaurante do zé', 'Avenida Getulio Dorneles, Chapeco SC');

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 350 ml', 0, 0 , 1),
    ('Coca cola 350 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 600 ml', 0, 0 , 1),
    ('Coca cola 600 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Hamburguer da Casa', 5, 15 , 1),
    ('Porção de petiscos', 10, 20 , 2);

INSERT INTO tipo_pessoa (descricao) VALUES ('USUARIO'), ('FUNCIONARIO');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco, telefone, email, senha)
VALUES
    ('Jonathan da Cruz', '42720955019', 1, 'Avenida Beria Rio, Florianópolis SC', '049999763242', 'jonathan@jonathan.com.br', '$2a$12$MwYkus57CQgP0tCqHHuscOME1/Bg6axpXmVtmAiUiEu5egekNX6jS'),
    ('Joao Paulo', '64249420094', 2, 'Avenida Getulio Dorneles, Chapeco SC', '049899763242', 'joaopaulo@gmail.com', '$2a$12$uCwp8gfpl7BvPBfoBKqVUucRvjUGvKqWsGVm1LxaEJ1S7bjrwvPg2');

INSERT INTO fornecedor (nome_fantasia, responsavel, cnpj, dt_incl, inscricao_estadual, situacao)
VALUES
    ('Ambev', 'Joao Paulo', '71137756000125', NOW(), '7037800117', 1),
    ('Seara', 'Joao Paulo', '49319580000173', NOW(), '7477434051', 1);

INSERT INTO item (cd, descricao, unidade_medida, vlr, FORNECEDOR_ID)
VALUES
    (8744, 'Hamburguer Artesanal', 'UN', 6.5, 2),
    (8745, 'Coca cola 350 ml', 'UN', 2.5, 1);

INSERT INTO estoque (qtde, qtde_minima, dt_atualizacao, item_id)
VALUES
    (100, 80, now(), 1),
    (200, 150, now(), 2);

INSERT INTO estoque_cardapio (estoque_id, cardapio_id, qtde)  VALUES (2, 1, 1), (2, 2, 1);

INSERT INTO COMANDA (DT_INIC , dt_encerramento, vlr_total, usuario_id) VALUES (NOW() , NULL, NULL, 1);

INSERT INTO pedido (dt_inic, aprovado, dt_fim, comanda_id, usuario_id_cliente, usuario_id_funcionario)
VALUES (now(), 0, NULL, 1, 1, 2);

INSERT INTO cardapio_pedido (cardapio_id, pedido_id, qtde) values  (1, 1, 2);



INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Felipe Andre', 9123123882, 2 , 'Avenida Beria Rio, Florianópolis SC', 88923123123, 'felipe@gmail.com', '123123');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Andre Souza', 98385678882, 1 , 'Avenida Beria Rio, Florianópolis SC', 23123123, 'teste@teste.com', '123123');


CREATE SEQUENCE unidade_unidade_id_seq;

CREATE TABLE UNIDADE (
                UNIDADE_ID INTEGER NOT NULL DEFAULT nextval('unidade_unidade_id_seq'),
                SEGMENTO VARCHAR(100) NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                NOME VARCHAR(100) NOT NULL,
                CONSTRAINT unidade_id_pk PRIMARY KEY (UNIDADE_ID)
);


ALTER SEQUENCE unidade_unidade_id_seq OWNED BY UNIDADE.UNIDADE_ID;

CREATE SEQUENCE cardapio_cardapio_id_seq;

CREATE TABLE CARDAPIO (
                CARDAPIO_ID INTEGER NOT NULL DEFAULT nextval('cardapio_cardapio_id_seq'),
                NOME VARCHAR(150) NOT NULL,
                VLR_PREPARO DOUBLE PRECISION NOT NULL,
                TEMPO_PREPARO INTEGER NOT NULL,
                UNIDADE_ID INTEGER NOT NULL,
                CONSTRAINT cardapio_id_pk PRIMARY KEY (CARDAPIO_ID)
);


ALTER SEQUENCE cardapio_cardapio_id_seq OWNED BY CARDAPIO.CARDAPIO_ID;

CREATE SEQUENCE item_item_id_seq;

CREATE TABLE ITEM (
                ITEM_ID INTEGER NOT NULL DEFAULT nextval('item_item_id_seq'),
                CD INTEGER NOT NULL,
                DESCRICAO VARCHAR(100) NOT NULL,
                UNIDADE_MEDIDA VARCHAR(5) NOT NULL,
                VLR DOUBLE PRECISION NOT NULL,
                FORNECEDOR_ID INTEGER NOT NULL,
                CONSTRAINT item_id_pk PRIMARY KEY (ITEM_ID)
);


ALTER SEQUENCE item_item_id_seq OWNED BY ITEM.ITEM_ID;

CREATE SEQUENCE estoque_estoque_id_seq;

CREATE TABLE ESTOQUE (
                ESTOQUE_ID INTEGER NOT NULL DEFAULT nextval('estoque_estoque_id_seq'),
                QTDE NUMERIC(5,2) NOT NULL,
                QTDE_MINIMA NUMERIC(5,2),
                DT_ATUALIZACAO TIMESTAMP NOT NULL,
                ITEM_ID INTEGER NOT NULL,
                CONSTRAINT estoque_id_pk PRIMARY KEY (ESTOQUE_ID)
);

CREATE TABLE ESTOQUE_CARDAPIO (
                ESTOQUE_CARDAPIO_ID SERIAL,
                ESTOQUE_ID INTEGER NOT NULL,
                CARDAPIO_ID INTEGER NOT NULL,
                QTDE NUMERIC(5,2) NOT NULL,
                CONSTRAINT estoque_cardapio_id_pk PRIMARY KEY (ESTOQUE_CARDAPIO_ID),
		CONSTRAINT estoque_cardapio_id_uk UNIQUE (ESTOQUE_ID, CARDAPIO_ID ),
                CONSTRAINT estoque_estoque_cardapio_fk FOREIGN KEY (ESTOQUE_ID) REFERENCES ESTOQUE,
                CONSTRAINT cardapio_estoque_cardapio_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO
);



CREATE SEQUENCE fornecedor_fornecedor_id_seq;

CREATE TABLE FORNECEDOR (
                FORNECEDOR_ID INTEGER NOT NULL DEFAULT nextval('fornecedor_fornecedor_id_seq'),
                NOME_FANTASIA VARCHAR(300) NOT NULL,
                RESPONSAVEL VARCHAR(200) NOT NULL,
                DT_INCL DATE NOT NULL,
                CNPJ VARCHAR(14) NOT NULL,
                INSCRICAO_ESTADUAL VARCHAR(10),
                SITUACAO INTEGER NOT NULL,
                CONSTRAINT fornecedor_id_pk PRIMARY KEY (FORNECEDOR_ID)
);
COMMENT ON COLUMN FORNECEDOR.SITUACAO IS '1 - ATIVO
0 - INATIVO';


ALTER SEQUENCE fornecedor_fornecedor_id_seq OWNED BY FORNECEDOR.FORNECEDOR_ID;

CREATE SEQUENCE tipopessoa_tppessoa_seq;

CREATE TABLE TIPO_PESSOA (
                TPPESSOA_ID INTEGER NOT NULL DEFAULT nextval('tipopessoa_tppessoa_seq'),
                DESCRICAO VARCHAR(50) NOT NULL,
                CONSTRAINT tppessoa_id_pk PRIMARY KEY (TPPESSOA_ID)
);


ALTER SEQUENCE tipopessoa_tppessoa_seq OWNED BY TIPO_PESSOA.TPPESSOA_ID;

CREATE SEQUENCE pessoa_pessoa_seq;

CREATE TABLE USUARIO (
                USUARIO_ID INTEGER NOT NULL DEFAULT nextval('pessoa_pessoa_seq'),
                NOME VARCHAR NOT NULL,
                CPF VARCHAR(11) NOT NULL,
                TPPESSOA_ID INTEGER NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                TELEFONE VARCHAR(14),
                EMAIL VARCHAR(50),
                SENHA VARCHAR(150) NOT NULL,
                CONSTRAINT usuario_id_pk PRIMARY KEY (USUARIO_ID)
);
COMMENT ON COLUMN USUARIO.CPF IS 'IRÁ GRAVAR A INFORMAÇÃO DE IDENTIFICAÇÃO DA PESSOA, CASO SEJA FISICA O CPF , CASO JURIDICA O CNPJ';


ALTER SEQUENCE pessoa_pessoa_seq OWNED BY USUARIO.USUARIO_ID;

CREATE SEQUENCE comanda_comanda_id_seq;

CREATE TABLE COMANDA (
                COMANDA_ID INTEGER NOT NULL DEFAULT nextval('comanda_comanda_id_seq'),
                DT_INIC TIMESTAMP NOT NULL,
                DT_ENCERRAMENTO TIMESTAMP,
                VLR_TOTAL DOUBLE PRECISION,
                USUARIO_ID INTEGER NOT NULL,
                CONSTRAINT comanda_id_pk PRIMARY KEY (COMANDA_ID)
);


ALTER SEQUENCE comanda_comanda_id_seq OWNED BY COMANDA.COMANDA_ID;

CREATE SEQUENCE pedido_pedido_id_seq;

CREATE TABLE PEDIDO (
                PEDIDO_ID INTEGER NOT NULL DEFAULT nextval('pedido_pedido_id_seq'),
                DT_INIC TIMESTAMP,
                APROVADO INTEGER NOT NULL,
                DT_FIM TIMESTAMP,
                COMANDA_ID INTEGER NOT NULL,
                USUARIO_ID_CLIENTE INTEGER NOT NULL,
                USUARIO_ID_FUNCIONARIO INTEGER NOT NULL,
                CONSTRAINT pedido_id_pk PRIMARY KEY (PEDIDO_ID)
);

CREATE TABLE CARDAPIO_PEDIDO (
                CARDAPIO_PEDIDO_ID SERIAL,
                CARDAPIO_ID INTEGER NOT NULL,
                PEDIDO_ID INTEGER NOT NULL,
                QTDE INTEGER NOT NULL,
                CONSTRAINT cardapio_pedido_id_pk PRIMARY KEY (CARDAPIO_PEDIDO_ID),
		CONSTRAINT cardapio_pedido_id_uk UNIQUE(CARDAPIO_ID, PEDIDO_ID ),
                CONSTRAINT cardapio_cardapio_pedido_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO,
                CONSTRAINT pedido_cardapio_pedido_fk FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO
);


ALTER TABLE CARDAPIO ADD CONSTRAINT unidade_cardapio_fk
FOREIGN KEY (UNIDADE_ID)
REFERENCES UNIDADE (UNIDADE_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ESTOQUE ADD CONSTRAINT item_estoque_fk
FOREIGN KEY (ITEM_ID)
REFERENCES ITEM (ITEM_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE USUARIO ADD CONSTRAINT tipo_pessoa_pessoa_fk
FOREIGN KEY (TPPESSOA_ID)
REFERENCES TIPO_PESSOA (TPPESSOA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ITEM ADD CONSTRAINT fornecedor_item_fk
FOREIGN KEY (FORNECEDOR_ID)
REFERENCES FORNECEDOR (FORNECEDOR_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk
FOREIGN KEY (USUARIO_ID_CLIENTE)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk1
FOREIGN KEY (USUARIO_ID_FUNCIONARIO)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE COMANDA ADD CONSTRAINT usuario_comanda_fk
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT comanda_pedido_fk
FOREIGN KEY (COMANDA_ID)
REFERENCES COMANDA (COMANDA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

INSERT INTO unidade (segmento, nome, endereco)
VALUES
    ('Shopping', 'Barzim do shops', 'Shopping da barra, Avenida Beria Rio, Florianópolis SC'),
    ('Tradicional', 'Restaurante do zé', 'Avenida Getulio Dorneles, Chapeco SC');

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 350 ml', 0, 0 , 1),
    ('Coca cola 350 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 600 ml', 0, 0 , 1),
    ('Coca cola 600 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Hamburguer da Casa', 5, 15 , 1),
    ('Porção de petiscos', 10, 20 , 2);

INSERT INTO tipo_pessoa (descricao) VALUES ('USUARIO'), ('FUNCIONARIO');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco, telefone, email, senha)
VALUES
    ('Jonathan da Cruz', '42720955019', 1, 'Avenida Beria Rio, Florianópolis SC', '049999763242', 'jonathan@jonathan.com.br', '$2a$12$MwYkus57CQgP0tCqHHuscOME1/Bg6axpXmVtmAiUiEu5egekNX6jS'),
    ('Joao Paulo', '64249420094', 2, 'Avenida Getulio Dorneles, Chapeco SC', '049899763242', 'joaopaulo@gmail.com', '$2a$12$uCwp8gfpl7BvPBfoBKqVUucRvjUGvKqWsGVm1LxaEJ1S7bjrwvPg2');

INSERT INTO fornecedor (nome_fantasia, responsavel, cnpj, dt_incl, inscricao_estadual, situacao)
VALUES
    ('Ambev', 'Joao Paulo', '71137756000125', NOW(), '7037800117', 1),
    ('Seara', 'Joao Paulo', '49319580000173', NOW(), '7477434051', 1);

INSERT INTO item (cd, descricao, unidade_medida, vlr, FORNECEDOR_ID)
VALUES
    (8744, 'Hamburguer Artesanal', 'UN', 6.5, 2),
    (8745, 'Coca cola 350 ml', 'UN', 2.5, 1);

INSERT INTO estoque (qtde, qtde_minima, dt_atualizacao, item_id)
VALUES
    (100, 80, now(), 1),
    (200, 150, now(), 2);

INSERT INTO estoque_cardapio (estoque_id, cardapio_id, qtde)  VALUES (2, 1, 1), (2, 2, 1);

INSERT INTO COMANDA (DT_INIC , dt_encerramento, vlr_total, usuario_id) VALUES (NOW() , NULL, NULL, 1);

INSERT INTO pedido (dt_inic, aprovado, dt_fim, comanda_id, usuario_id_cliente, usuario_id_funcionario)
VALUES (now(), 0, NULL, 1, 1, 2);

INSERT INTO cardapio_pedido (cardapio_id, pedido_id, qtde) values  (1, 1, 2);



INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Felipe Andre', 9123123882, 2 , 'Avenida Beria Rio, Florianópolis SC', 88923123123, 'felipe@gmail.com', '123123');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Andre Souza', 98385678882, 1 , 'Avenida Beria Rio, Florianópolis SC', 23123123, 'teste@teste.com', '123123');


CREATE SEQUENCE unidade_unidade_id_seq;

CREATE TABLE UNIDADE (
                UNIDADE_ID INTEGER NOT NULL DEFAULT nextval('unidade_unidade_id_seq'),
                SEGMENTO VARCHAR(100) NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                NOME VARCHAR(100) NOT NULL,
                CONSTRAINT unidade_id_pk PRIMARY KEY (UNIDADE_ID)
);


ALTER SEQUENCE unidade_unidade_id_seq OWNED BY UNIDADE.UNIDADE_ID;

CREATE SEQUENCE cardapio_cardapio_id_seq;

CREATE TABLE CARDAPIO (
                CARDAPIO_ID INTEGER NOT NULL DEFAULT nextval('cardapio_cardapio_id_seq'),
                NOME VARCHAR(150) NOT NULL,
                VLR_PREPARO DOUBLE PRECISION NOT NULL,
                TEMPO_PREPARO INTEGER NOT NULL,
                UNIDADE_ID INTEGER NOT NULL,
                CONSTRAINT cardapio_id_pk PRIMARY KEY (CARDAPIO_ID)
);


ALTER SEQUENCE cardapio_cardapio_id_seq OWNED BY CARDAPIO.CARDAPIO_ID;

CREATE SEQUENCE item_item_id_seq;

CREATE TABLE ITEM (
                ITEM_ID INTEGER NOT NULL DEFAULT nextval('item_item_id_seq'),
                CD INTEGER NOT NULL,
                DESCRICAO VARCHAR(100) NOT NULL,
                UNIDADE_MEDIDA VARCHAR(5) NOT NULL,
                VLR DOUBLE PRECISION NOT NULL,
                FORNECEDOR_ID INTEGER NOT NULL,
                CONSTRAINT item_id_pk PRIMARY KEY (ITEM_ID)
);


ALTER SEQUENCE item_item_id_seq OWNED BY ITEM.ITEM_ID;

CREATE SEQUENCE estoque_estoque_id_seq;

CREATE TABLE ESTOQUE (
                ESTOQUE_ID INTEGER NOT NULL DEFAULT nextval('estoque_estoque_id_seq'),
                QTDE NUMERIC(5,2) NOT NULL,
                QTDE_MINIMA NUMERIC(5,2),
                DT_ATUALIZACAO TIMESTAMP NOT NULL,
                ITEM_ID INTEGER NOT NULL,
                CONSTRAINT estoque_id_pk PRIMARY KEY (ESTOQUE_ID)
);

CREATE TABLE ESTOQUE_CARDAPIO (
                ESTOQUE_CARDAPIO_ID SERIAL,
                ESTOQUE_ID INTEGER NOT NULL,
                CARDAPIO_ID INTEGER NOT NULL,
                QTDE NUMERIC(5,2) NOT NULL,
                CONSTRAINT estoque_cardapio_id_pk PRIMARY KEY (ESTOQUE_CARDAPIO_ID),
		CONSTRAINT estoque_cardapio_id_uk UNIQUE (ESTOQUE_ID, CARDAPIO_ID ),
                CONSTRAINT estoque_estoque_cardapio_fk FOREIGN KEY (ESTOQUE_ID) REFERENCES ESTOQUE,
                CONSTRAINT cardapio_estoque_cardapio_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO
);



CREATE SEQUENCE fornecedor_fornecedor_id_seq;

CREATE TABLE FORNECEDOR (
                FORNECEDOR_ID INTEGER NOT NULL DEFAULT nextval('fornecedor_fornecedor_id_seq'),
                NOME_FANTASIA VARCHAR(300) NOT NULL,
                RESPONSAVEL VARCHAR(200) NOT NULL,
                DT_INCL DATE NOT NULL,
                CNPJ VARCHAR(14) NOT NULL,
                INSCRICAO_ESTADUAL VARCHAR(10),
                SITUACAO INTEGER NOT NULL,
                CONSTRAINT fornecedor_id_pk PRIMARY KEY (FORNECEDOR_ID)
);
COMMENT ON COLUMN FORNECEDOR.SITUACAO IS '1 - ATIVO
0 - INATIVO';


ALTER SEQUENCE fornecedor_fornecedor_id_seq OWNED BY FORNECEDOR.FORNECEDOR_ID;

CREATE SEQUENCE tipopessoa_tppessoa_seq;

CREATE TABLE TIPO_PESSOA (
                TPPESSOA_ID INTEGER NOT NULL DEFAULT nextval('tipopessoa_tppessoa_seq'),
                DESCRICAO VARCHAR(50) NOT NULL,
                CONSTRAINT tppessoa_id_pk PRIMARY KEY (TPPESSOA_ID)
);


ALTER SEQUENCE tipopessoa_tppessoa_seq OWNED BY TIPO_PESSOA.TPPESSOA_ID;

CREATE SEQUENCE pessoa_pessoa_seq;

CREATE TABLE USUARIO (
                USUARIO_ID INTEGER NOT NULL DEFAULT nextval('pessoa_pessoa_seq'),
                NOME VARCHAR NOT NULL,
                CPF VARCHAR(11) NOT NULL,
                TPPESSOA_ID INTEGER NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                TELEFONE VARCHAR(14),
                EMAIL VARCHAR(50),
                SENHA VARCHAR(150) NOT NULL,
                CONSTRAINT usuario_id_pk PRIMARY KEY (USUARIO_ID)
);
COMMENT ON COLUMN USUARIO.CPF IS 'IRÁ GRAVAR A INFORMAÇÃO DE IDENTIFICAÇÃO DA PESSOA, CASO SEJA FISICA O CPF , CASO JURIDICA O CNPJ';


ALTER SEQUENCE pessoa_pessoa_seq OWNED BY USUARIO.USUARIO_ID;

CREATE SEQUENCE comanda_comanda_id_seq;

CREATE TABLE COMANDA (
                COMANDA_ID INTEGER NOT NULL DEFAULT nextval('comanda_comanda_id_seq'),
                DT_INIC TIMESTAMP NOT NULL,
                DT_ENCERRAMENTO TIMESTAMP,
                VLR_TOTAL DOUBLE PRECISION,
                USUARIO_ID INTEGER NOT NULL,
                CONSTRAINT comanda_id_pk PRIMARY KEY (COMANDA_ID)
);


ALTER SEQUENCE comanda_comanda_id_seq OWNED BY COMANDA.COMANDA_ID;

CREATE SEQUENCE pedido_pedido_id_seq;

CREATE TABLE PEDIDO (
                PEDIDO_ID INTEGER NOT NULL DEFAULT nextval('pedido_pedido_id_seq'),
                DT_INIC TIMESTAMP,
                APROVADO INTEGER NOT NULL,
                DT_FIM TIMESTAMP,
                COMANDA_ID INTEGER NOT NULL,
                USUARIO_ID_CLIENTE INTEGER NOT NULL,
                USUARIO_ID_FUNCIONARIO INTEGER NOT NULL,
                CONSTRAINT pedido_id_pk PRIMARY KEY (PEDIDO_ID)
);

CREATE TABLE CARDAPIO_PEDIDO (
                CARDAPIO_PEDIDO_ID SERIAL,
                CARDAPIO_ID INTEGER NOT NULL,
                PEDIDO_ID INTEGER NOT NULL,
                QTDE INTEGER NOT NULL,
                CONSTRAINT cardapio_pedido_id_pk PRIMARY KEY (CARDAPIO_PEDIDO_ID),
		CONSTRAINT cardapio_pedido_id_uk UNIQUE(CARDAPIO_ID, PEDIDO_ID ),
                CONSTRAINT cardapio_cardapio_pedido_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO,
                CONSTRAINT pedido_cardapio_pedido_fk FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO
);


ALTER TABLE CARDAPIO ADD CONSTRAINT unidade_cardapio_fk
FOREIGN KEY (UNIDADE_ID)
REFERENCES UNIDADE (UNIDADE_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ESTOQUE ADD CONSTRAINT item_estoque_fk
FOREIGN KEY (ITEM_ID)
REFERENCES ITEM (ITEM_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE USUARIO ADD CONSTRAINT tipo_pessoa_pessoa_fk
FOREIGN KEY (TPPESSOA_ID)
REFERENCES TIPO_PESSOA (TPPESSOA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ITEM ADD CONSTRAINT fornecedor_item_fk
FOREIGN KEY (FORNECEDOR_ID)
REFERENCES FORNECEDOR (FORNECEDOR_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk
FOREIGN KEY (USUARIO_ID_CLIENTE)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk1
FOREIGN KEY (USUARIO_ID_FUNCIONARIO)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE COMANDA ADD CONSTRAINT usuario_comanda_fk
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT comanda_pedido_fk
FOREIGN KEY (COMANDA_ID)
REFERENCES COMANDA (COMANDA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

INSERT INTO unidade (segmento, nome, endereco)
VALUES
    ('Shopping', 'Barzim do shops', 'Shopping da barra, Avenida Beria Rio, Florianópolis SC'),
    ('Tradicional', 'Restaurante do zé', 'Avenida Getulio Dorneles, Chapeco SC');

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 350 ml', 0, 0 , 1),
    ('Coca cola 350 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 600 ml', 0, 0 , 1),
    ('Coca cola 600 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Hamburguer da Casa', 5, 15 , 1),
    ('Porção de petiscos', 10, 20 , 2);

INSERT INTO tipo_pessoa (descricao) VALUES ('USUARIO'), ('FUNCIONARIO');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco, telefone, email, senha)
VALUES
    ('Jonathan da Cruz', '42720955019', 1, 'Avenida Beria Rio, Florianópolis SC', '049999763242', 'jonathan@jonathan.com.br', '$2a$12$MwYkus57CQgP0tCqHHuscOME1/Bg6axpXmVtmAiUiEu5egekNX6jS'),
    ('Joao Paulo', '64249420094', 2, 'Avenida Getulio Dorneles, Chapeco SC', '049899763242', 'joaopaulo@gmail.com', '$2a$12$uCwp8gfpl7BvPBfoBKqVUucRvjUGvKqWsGVm1LxaEJ1S7bjrwvPg2');

INSERT INTO fornecedor (nome_fantasia, responsavel, cnpj, dt_incl, inscricao_estadual, situacao)
VALUES
    ('Ambev', 'Joao Paulo', '71137756000125', NOW(), '7037800117', 1),
    ('Seara', 'Joao Paulo', '49319580000173', NOW(), '7477434051', 1);

INSERT INTO item (cd, descricao, unidade_medida, vlr, FORNECEDOR_ID)
VALUES
    (8744, 'Hamburguer Artesanal', 'UN', 6.5, 2),
    (8745, 'Coca cola 350 ml', 'UN', 2.5, 1);

INSERT INTO estoque (qtde, qtde_minima, dt_atualizacao, item_id)
VALUES
    (100, 80, now(), 1),
    (200, 150, now(), 2);

INSERT INTO estoque_cardapio (estoque_id, cardapio_id, qtde)  VALUES (2, 1, 1), (2, 2, 1);

INSERT INTO COMANDA (DT_INIC , dt_encerramento, vlr_total, usuario_id) VALUES (NOW() , NULL, NULL, 1);

INSERT INTO pedido (dt_inic, aprovado, dt_fim, comanda_id, usuario_id_cliente, usuario_id_funcionario)
VALUES (now(), 0, NULL, 1, 1, 2);

INSERT INTO cardapio_pedido (cardapio_id, pedido_id, qtde) values  (1, 1, 2);



INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Felipe Andre', 9123123882, 2 , 'Avenida Beria Rio, Florianópolis SC', 88923123123, 'felipe@gmail.com', '123123');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Andre Souza', 98385678882, 1 , 'Avenida Beria Rio, Florianópolis SC', 23123123, 'teste@teste.com', '123123');

CREATE SEQUENCE unidade_unidade_id_seq;

CREATE TABLE UNIDADE (
                UNIDADE_ID INTEGER NOT NULL DEFAULT nextval('unidade_unidade_id_seq'),
                SEGMENTO VARCHAR(100) NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                NOME VARCHAR(100) NOT NULL,
                CONSTRAINT unidade_id_pk PRIMARY KEY (UNIDADE_ID)
);


ALTER SEQUENCE unidade_unidade_id_seq OWNED BY UNIDADE.UNIDADE_ID;

CREATE SEQUENCE cardapio_cardapio_id_seq;

CREATE TABLE CARDAPIO (
                CARDAPIO_ID INTEGER NOT NULL DEFAULT nextval('cardapio_cardapio_id_seq'),
                NOME VARCHAR(150) NOT NULL,
                VLR_PREPARO DOUBLE PRECISION NOT NULL,
                TEMPO_PREPARO INTEGER NOT NULL,
                UNIDADE_ID INTEGER NOT NULL,
                CONSTRAINT cardapio_id_pk PRIMARY KEY (CARDAPIO_ID)
);


ALTER SEQUENCE cardapio_cardapio_id_seq OWNED BY CARDAPIO.CARDAPIO_ID;

CREATE SEQUENCE item_item_id_seq;

CREATE TABLE ITEM (
                ITEM_ID INTEGER NOT NULL DEFAULT nextval('item_item_id_seq'),
                CD INTEGER NOT NULL,
                DESCRICAO VARCHAR(100) NOT NULL,
                UNIDADE_MEDIDA VARCHAR(5) NOT NULL,
                VLR DOUBLE PRECISION NOT NULL,
                FORNECEDOR_ID INTEGER NOT NULL,
                CONSTRAINT item_id_pk PRIMARY KEY (ITEM_ID)
);


ALTER SEQUENCE item_item_id_seq OWNED BY ITEM.ITEM_ID;

CREATE SEQUENCE estoque_estoque_id_seq;

CREATE TABLE ESTOQUE (
                ESTOQUE_ID INTEGER NOT NULL DEFAULT nextval('estoque_estoque_id_seq'),
                QTDE NUMERIC(5,2) NOT NULL,
                QTDE_MINIMA NUMERIC(5,2),
                DT_ATUALIZACAO TIMESTAMP NOT NULL,
                ITEM_ID INTEGER NOT NULL,
                CONSTRAINT estoque_id_pk PRIMARY KEY (ESTOQUE_ID)
);

CREATE TABLE ESTOQUE_CARDAPIO (
                ESTOQUE_CARDAPIO_ID SERIAL,
                ESTOQUE_ID INTEGER NOT NULL,
                CARDAPIO_ID INTEGER NOT NULL,
                QTDE NUMERIC(5,2) NOT NULL,
                CONSTRAINT estoque_cardapio_id_pk PRIMARY KEY (ESTOQUE_CARDAPIO_ID),
		CONSTRAINT estoque_cardapio_id_uk UNIQUE (ESTOQUE_ID, CARDAPIO_ID ),
                CONSTRAINT estoque_estoque_cardapio_fk FOREIGN KEY (ESTOQUE_ID) REFERENCES ESTOQUE,
                CONSTRAINT cardapio_estoque_cardapio_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO
);



CREATE SEQUENCE fornecedor_fornecedor_id_seq;

CREATE TABLE FORNECEDOR (
                FORNECEDOR_ID INTEGER NOT NULL DEFAULT nextval('fornecedor_fornecedor_id_seq'),
                NOME_FANTASIA VARCHAR(300) NOT NULL,
                RESPONSAVEL VARCHAR(200) NOT NULL,
                DT_INCL DATE NOT NULL,
                CNPJ VARCHAR(14) NOT NULL,
                INSCRICAO_ESTADUAL VARCHAR(10),
                SITUACAO INTEGER NOT NULL,
                CONSTRAINT fornecedor_id_pk PRIMARY KEY (FORNECEDOR_ID)
);
COMMENT ON COLUMN FORNECEDOR.SITUACAO IS '1 - ATIVO
0 - INATIVO';


ALTER SEQUENCE fornecedor_fornecedor_id_seq OWNED BY FORNECEDOR.FORNECEDOR_ID;

CREATE SEQUENCE tipopessoa_tppessoa_seq;

CREATE TABLE TIPO_PESSOA (
                TPPESSOA_ID INTEGER NOT NULL DEFAULT nextval('tipopessoa_tppessoa_seq'),
                DESCRICAO VARCHAR(50) NOT NULL,
                CONSTRAINT tppessoa_id_pk PRIMARY KEY (TPPESSOA_ID)
);


ALTER SEQUENCE tipopessoa_tppessoa_seq OWNED BY TIPO_PESSOA.TPPESSOA_ID;

CREATE SEQUENCE pessoa_pessoa_seq;

CREATE TABLE USUARIO (
                USUARIO_ID INTEGER NOT NULL DEFAULT nextval('pessoa_pessoa_seq'),
                NOME VARCHAR NOT NULL,
                CPF VARCHAR(11) NOT NULL,
                TPPESSOA_ID INTEGER NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                TELEFONE VARCHAR(14),
                EMAIL VARCHAR(50),
                SENHA VARCHAR(150) NOT NULL,
                CONSTRAINT usuario_id_pk PRIMARY KEY (USUARIO_ID)
);
COMMENT ON COLUMN USUARIO.CPF IS 'IRÁ GRAVAR A INFORMAÇÃO DE IDENTIFICAÇÃO DA PESSOA, CASO SEJA FISICA O CPF , CASO JURIDICA O CNPJ';


ALTER SEQUENCE pessoa_pessoa_seq OWNED BY USUARIO.USUARIO_ID;

CREATE SEQUENCE comanda_comanda_id_seq;

CREATE TABLE COMANDA (
                COMANDA_ID INTEGER NOT NULL DEFAULT nextval('comanda_comanda_id_seq'),
                DT_INIC TIMESTAMP NOT NULL,
                DT_ENCERRAMENTO TIMESTAMP,
                VLR_TOTAL DOUBLE PRECISION,
                USUARIO_ID INTEGER NOT NULL,
                CONSTRAINT comanda_id_pk PRIMARY KEY (COMANDA_ID)
);


ALTER SEQUENCE comanda_comanda_id_seq OWNED BY COMANDA.COMANDA_ID;

CREATE SEQUENCE pedido_pedido_id_seq;

CREATE TABLE PEDIDO (
                PEDIDO_ID INTEGER NOT NULL DEFAULT nextval('pedido_pedido_id_seq'),
                DT_INIC TIMESTAMP,
                APROVADO INTEGER NOT NULL,
                DT_FIM TIMESTAMP,
                COMANDA_ID INTEGER NOT NULL,
                USUARIO_ID_CLIENTE INTEGER NOT NULL,
                USUARIO_ID_FUNCIONARIO INTEGER NOT NULL,
                CONSTRAINT pedido_id_pk PRIMARY KEY (PEDIDO_ID)
);

CREATE TABLE CARDAPIO_PEDIDO (
                CARDAPIO_PEDIDO_ID SERIAL,
                CARDAPIO_ID INTEGER NOT NULL,
                PEDIDO_ID INTEGER NOT NULL,
                QTDE INTEGER NOT NULL,
                CONSTRAINT cardapio_pedido_id_pk PRIMARY KEY (CARDAPIO_PEDIDO_ID),
		CONSTRAINT cardapio_pedido_id_uk UNIQUE(CARDAPIO_ID, PEDIDO_ID ),
                CONSTRAINT cardapio_cardapio_pedido_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO,
                CONSTRAINT pedido_cardapio_pedido_fk FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO
);


ALTER TABLE CARDAPIO ADD CONSTRAINT unidade_cardapio_fk
FOREIGN KEY (UNIDADE_ID)
REFERENCES UNIDADE (UNIDADE_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ESTOQUE ADD CONSTRAINT item_estoque_fk
FOREIGN KEY (ITEM_ID)
REFERENCES ITEM (ITEM_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE USUARIO ADD CONSTRAINT tipo_pessoa_pessoa_fk
FOREIGN KEY (TPPESSOA_ID)
REFERENCES TIPO_PESSOA (TPPESSOA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ITEM ADD CONSTRAINT fornecedor_item_fk
FOREIGN KEY (FORNECEDOR_ID)
REFERENCES FORNECEDOR (FORNECEDOR_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk
FOREIGN KEY (USUARIO_ID_CLIENTE)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk1
FOREIGN KEY (USUARIO_ID_FUNCIONARIO)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE COMANDA ADD CONSTRAINT usuario_comanda_fk
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT comanda_pedido_fk
FOREIGN KEY (COMANDA_ID)
REFERENCES COMANDA (COMANDA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

INSERT INTO unidade (segmento, nome, endereco)
VALUES
    ('Shopping', 'Barzim do shops', 'Shopping da barra, Avenida Beria Rio, Florianópolis SC'),
    ('Tradicional', 'Restaurante do zé', 'Avenida Getulio Dorneles, Chapeco SC');

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 350 ml', 0, 0 , 1),
    ('Coca cola 350 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 600 ml', 0, 0 , 1),
    ('Coca cola 600 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Hamburguer da Casa', 5, 15 , 1),
    ('Porção de petiscos', 10, 20 , 2);

INSERT INTO tipo_pessoa (descricao) VALUES ('USUARIO'), ('FUNCIONARIO');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco, telefone, email, senha)
VALUES
    ('Jonathan da Cruz', '42720955019', 1, 'Avenida Beria Rio, Florianópolis SC', '049999763242', 'jonathan@jonathan.com.br', '$2a$12$MwYkus57CQgP0tCqHHuscOME1/Bg6axpXmVtmAiUiEu5egekNX6jS'),
    ('Joao Paulo', '64249420094', 2, 'Avenida Getulio Dorneles, Chapeco SC', '049899763242', 'joaopaulo@gmail.com', '$2a$12$uCwp8gfpl7BvPBfoBKqVUucRvjUGvKqWsGVm1LxaEJ1S7bjrwvPg2');

INSERT INTO fornecedor (nome_fantasia, responsavel, cnpj, dt_incl, inscricao_estadual, situacao)
VALUES
    ('Ambev', 'Joao Paulo', '71137756000125', NOW(), '7037800117', 1),
    ('Seara', 'Joao Paulo', '49319580000173', NOW(), '7477434051', 1);

INSERT INTO item (cd, descricao, unidade_medida, vlr, FORNECEDOR_ID)
VALUES
    (8744, 'Hamburguer Artesanal', 'UN', 6.5, 2),
    (8745, 'Coca cola 350 ml', 'UN', 2.5, 1);

INSERT INTO estoque (qtde, qtde_minima, dt_atualizacao, item_id)
VALUES
    (100, 80, now(), 1),
    (200, 150, now(), 2);

INSERT INTO estoque_cardapio (estoque_id, cardapio_id, qtde)  VALUES (2, 1, 1), (2, 2, 1);

INSERT INTO COMANDA (DT_INIC , dt_encerramento, vlr_total, usuario_id) VALUES (NOW() , NULL, NULL, 1);

INSERT INTO pedido (dt_inic, aprovado, dt_fim, comanda_id, usuario_id_cliente, usuario_id_funcionario)
VALUES (now(), 0, NULL, 1, 1, 2);

INSERT INTO cardapio_pedido (cardapio_id, pedido_id, qtde) values  (1, 1, 2);



INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Felipe Andre', 9123123882, 2 , 'Avenida Beria Rio, Florianópolis SC', 88923123123, 'felipe@gmail.com', '123123');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Andre Souza', 98385678882, 1 , 'Avenida Beria Rio, Florianópolis SC', 23123123, 'teste@teste.com', '123123');

create table aula ( id serial, descricao varchar(20));

insert into aula (descricao) values('Teste2')

select * from aula



drop table aula3 

select * from aula1

select * from aula3

insert into aula3 (descricao) values( 'Teste 4')

create table aula3 as 
select * from aula1 where 1 = 2;
create table empresa(
	id serial primary key,
	nome varchar(20)
	);
	
select  * from empresa e;

insert into empresa (nome) values ('Empresa do Jhanatan')

create table funcionario(
	funcinario_id serial primary key,
	nome varchar(100)not null,
	cpf varchar(20) not null unique,
	salario numeric not null check(salario > 0),
	empresa_id serial,
	constraint fk_funcionario_empresa foreign key (empresa_id)
	references empresa(id)
	);
	
f
insert into funcionario(nome, cpf, salario, empresa_id)
values ('Maria', '222341123', 5000,5)

insert into funcionario(nome, cpf, salario)
values ('Maria', '222341125', 5000)

insert into funcionario(nome, cpf, salario)
values ('Maria', '222341126', 5000)

insert into funcionario(nome, cpf, salario, empresa_id)
values ('Maria', '222341127', 5000,1)

select * from funcionario f 

insert into empresa (nome) values ('Pastelaria do Jose')

ALTER TABLE empresa  ALTER COLUMN nome type VARCHAR(200);

alter table funcionario 
drop constraint fk_funcionario_empresa

alter  table funcionario 
drop column empresa_id;

alter  table funcionario 
add column empresa_id integer;

alter  table funcionario 
add constraint fk_funcionario_empresa foreign key (empresa_id)
references empresa(id)


** Aula 34 - update - Como utilizar? 10/09/2024

create table primeira(
	id numeric primary key
);

select * from primeira

insert into primeira 

create table segunda(
	id numeric unique not null check(id > 0)
);

select * from segunda

insert into segunda (id)
values(7)


update segunda set id = 5
where id = 2


//Aula 35 - delete from table

delete from segunda
CREATE SEQUENCE unidade_unidade_id_seq;

CREATE TABLE UNIDADE (
                UNIDADE_ID INTEGER NOT NULL DEFAULT nextval('unidade_unidade_id_seq'),
                SEGMENTO VARCHAR(100) NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                NOME VARCHAR(100) NOT NULL,
                CONSTRAINT unidade_id_pk PRIMARY KEY (UNIDADE_ID)
);


ALTER SEQUENCE unidade_unidade_id_seq OWNED BY UNIDADE.UNIDADE_ID;

CREATE SEQUENCE cardapio_cardapio_id_seq;

CREATE TABLE CARDAPIO (
                CARDAPIO_ID INTEGER NOT NULL DEFAULT nextval('cardapio_cardapio_id_seq'),
                NOME VARCHAR(150) NOT NULL,
                VLR_PREPARO DOUBLE PRECISION NOT NULL,
                TEMPO_PREPARO INTEGER NOT NULL,
                UNIDADE_ID INTEGER NOT NULL,
                CONSTRAINT cardapio_id_pk PRIMARY KEY (CARDAPIO_ID)
);


ALTER SEQUENCE cardapio_cardapio_id_seq OWNED BY CARDAPIO.CARDAPIO_ID;

CREATE SEQUENCE item_item_id_seq;

CREATE TABLE ITEM (
                ITEM_ID INTEGER NOT NULL DEFAULT nextval('item_item_id_seq'),
                CD INTEGER NOT NULL,
                DESCRICAO VARCHAR(100) NOT NULL,
                UNIDADE_MEDIDA VARCHAR(5) NOT NULL,
                VLR DOUBLE PRECISION NOT NULL,
                FORNECEDOR_ID INTEGER NOT NULL,
                CONSTRAINT item_id_pk PRIMARY KEY (ITEM_ID)
);


ALTER SEQUENCE item_item_id_seq OWNED BY ITEM.ITEM_ID;

CREATE SEQUENCE estoque_estoque_id_seq;

CREATE TABLE ESTOQUE (
                ESTOQUE_ID INTEGER NOT NULL DEFAULT nextval('estoque_estoque_id_seq'),
                QTDE NUMERIC(5,2) NOT NULL,
                QTDE_MINIMA NUMERIC(5,2),
                DT_ATUALIZACAO TIMESTAMP NOT NULL,
                ITEM_ID INTEGER NOT NULL,
                CONSTRAINT estoque_id_pk PRIMARY KEY (ESTOQUE_ID)
);

CREATE TABLE ESTOQUE_CARDAPIO (
                ESTOQUE_CARDAPIO_ID SERIAL,
                ESTOQUE_ID INTEGER NOT NULL,
                CARDAPIO_ID INTEGER NOT NULL,
                QTDE NUMERIC(5,2) NOT NULL,
                CONSTRAINT estoque_cardapio_id_pk PRIMARY KEY (ESTOQUE_CARDAPIO_ID),
		CONSTRAINT estoque_cardapio_id_uk UNIQUE (ESTOQUE_ID, CARDAPIO_ID ),
                CONSTRAINT estoque_estoque_cardapio_fk FOREIGN KEY (ESTOQUE_ID) REFERENCES ESTOQUE,
                CONSTRAINT cardapio_estoque_cardapio_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO
);



CREATE SEQUENCE fornecedor_fornecedor_id_seq;

CREATE TABLE FORNECEDOR (
                FORNECEDOR_ID INTEGER NOT NULL DEFAULT nextval('fornecedor_fornecedor_id_seq'),
                NOME_FANTASIA VARCHAR(300) NOT NULL,
                RESPONSAVEL VARCHAR(200) NOT NULL,
                DT_INCL DATE NOT NULL,
                CNPJ VARCHAR(14) NOT NULL,
                INSCRICAO_ESTADUAL VARCHAR(10),
                SITUACAO INTEGER NOT NULL,
                CONSTRAINT fornecedor_id_pk PRIMARY KEY (FORNECEDOR_ID)
);
COMMENT ON COLUMN FORNECEDOR.SITUACAO IS '1 - ATIVO
0 - INATIVO';


ALTER SEQUENCE fornecedor_fornecedor_id_seq OWNED BY FORNECEDOR.FORNECEDOR_ID;

CREATE SEQUENCE tipopessoa_tppessoa_seq;

CREATE TABLE TIPO_PESSOA (
                TPPESSOA_ID INTEGER NOT NULL DEFAULT nextval('tipopessoa_tppessoa_seq'),
                DESCRICAO VARCHAR(50) NOT NULL,
                CONSTRAINT tppessoa_id_pk PRIMARY KEY (TPPESSOA_ID)
);


ALTER SEQUENCE tipopessoa_tppessoa_seq OWNED BY TIPO_PESSOA.TPPESSOA_ID;

CREATE SEQUENCE pessoa_pessoa_seq;

CREATE TABLE USUARIO (
                USUARIO_ID INTEGER NOT NULL DEFAULT nextval('pessoa_pessoa_seq'),
                NOME VARCHAR NOT NULL,
                CPF VARCHAR(11) NOT NULL,
                TPPESSOA_ID INTEGER NOT NULL,
                ENDERECO VARCHAR(400) NOT NULL,
                TELEFONE VARCHAR(14),
                EMAIL VARCHAR(50),
                SENHA VARCHAR(150) NOT NULL,
                CONSTRAINT usuario_id_pk PRIMARY KEY (USUARIO_ID)
);
COMMENT ON COLUMN USUARIO.CPF IS 'IRÁ GRAVAR A INFORMAÇÃO DE IDENTIFICAÇÃO DA PESSOA, CASO SEJA FISICA O CPF , CASO JURIDICA O CNPJ';


ALTER SEQUENCE pessoa_pessoa_seq OWNED BY USUARIO.USUARIO_ID;

CREATE SEQUENCE comanda_comanda_id_seq;

CREATE TABLE COMANDA (
                COMANDA_ID INTEGER NOT NULL DEFAULT nextval('comanda_comanda_id_seq'),
                DT_INIC TIMESTAMP NOT NULL,
                DT_ENCERRAMENTO TIMESTAMP,
                VLR_TOTAL DOUBLE PRECISION,
                USUARIO_ID INTEGER NOT NULL,
                CONSTRAINT comanda_id_pk PRIMARY KEY (COMANDA_ID)
);


ALTER SEQUENCE comanda_comanda_id_seq OWNED BY COMANDA.COMANDA_ID;

CREATE SEQUENCE pedido_pedido_id_seq;

CREATE TABLE PEDIDO (
                PEDIDO_ID INTEGER NOT NULL DEFAULT nextval('pedido_pedido_id_seq'),
                DT_INIC TIMESTAMP,
                APROVADO INTEGER NOT NULL,
                DT_FIM TIMESTAMP,
                COMANDA_ID INTEGER NOT NULL,
                USUARIO_ID_CLIENTE INTEGER NOT NULL,
                USUARIO_ID_FUNCIONARIO INTEGER NOT NULL,
                CONSTRAINT pedido_id_pk PRIMARY KEY (PEDIDO_ID)
);

CREATE TABLE CARDAPIO_PEDIDO (
                CARDAPIO_PEDIDO_ID SERIAL,
                CARDAPIO_ID INTEGER NOT NULL,
                PEDIDO_ID INTEGER NOT NULL,
                QTDE INTEGER NOT NULL,
                CONSTRAINT cardapio_pedido_id_pk PRIMARY KEY (CARDAPIO_PEDIDO_ID),
		CONSTRAINT cardapio_pedido_id_uk UNIQUE(CARDAPIO_ID, PEDIDO_ID ),
                CONSTRAINT cardapio_cardapio_pedido_fk FOREIGN KEY (CARDAPIO_ID) REFERENCES CARDAPIO,
                CONSTRAINT pedido_cardapio_pedido_fk FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO
);


ALTER TABLE CARDAPIO ADD CONSTRAINT unidade_cardapio_fk
FOREIGN KEY (UNIDADE_ID)
REFERENCES UNIDADE (UNIDADE_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ESTOQUE ADD CONSTRAINT item_estoque_fk
FOREIGN KEY (ITEM_ID)
REFERENCES ITEM (ITEM_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE USUARIO ADD CONSTRAINT tipo_pessoa_pessoa_fk
FOREIGN KEY (TPPESSOA_ID)
REFERENCES TIPO_PESSOA (TPPESSOA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ITEM ADD CONSTRAINT fornecedor_item_fk
FOREIGN KEY (FORNECEDOR_ID)
REFERENCES FORNECEDOR (FORNECEDOR_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk
FOREIGN KEY (USUARIO_ID_CLIENTE)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT usuario_pedido_fk1
FOREIGN KEY (USUARIO_ID_FUNCIONARIO)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE COMANDA ADD CONSTRAINT usuario_comanda_fk
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PEDIDO ADD CONSTRAINT comanda_pedido_fk
FOREIGN KEY (COMANDA_ID)
REFERENCES COMANDA (COMANDA_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

INSERT INTO unidade (segmento, nome, endereco)
VALUES
    ('Shopping', 'Barzim do shops', 'Shopping da barra, Avenida Beria Rio, Florianópolis SC'),
    ('Tradicional', 'Restaurante do zé', 'Avenida Getulio Dorneles, Chapeco SC');

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 350 ml', 0, 0 , 1),
    ('Coca cola 350 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Coca cola 600 ml', 0, 0 , 1),
    ('Coca cola 600 ml', 0, 0 , 2);

INSERT INTO cardapio (nome, vlr_preparo, tempo_preparo, unidade_id)
VALUES
    ('Hamburguer da Casa', 5, 15 , 1),
    ('Porção de petiscos', 10, 20 , 2);

INSERT INTO tipo_pessoa (descricao) VALUES ('USUARIO'), ('FUNCIONARIO');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco, telefone, email, senha)
VALUES
    ('Jonathan da Cruz', '42720955019', 1, 'Avenida Beria Rio, Florianópolis SC', '049999763242', 'jonathan@jonathan.com.br', '$2a$12$MwYkus57CQgP0tCqHHuscOME1/Bg6axpXmVtmAiUiEu5egekNX6jS'),
    ('Joao Paulo', '64249420094', 2, 'Avenida Getulio Dorneles, Chapeco SC', '049899763242', 'joaopaulo@gmail.com', '$2a$12$uCwp8gfpl7BvPBfoBKqVUucRvjUGvKqWsGVm1LxaEJ1S7bjrwvPg2');

INSERT INTO fornecedor (nome_fantasia, responsavel, cnpj, dt_incl, inscricao_estadual, situacao)
VALUES
    ('Ambev', 'Joao Paulo', '71137756000125', NOW(), '7037800117', 1),
    ('Seara', 'Joao Paulo', '49319580000173', NOW(), '7477434051', 1);

INSERT INTO item (cd, descricao, unidade_medida, vlr, FORNECEDOR_ID)
VALUES
    (8744, 'Hamburguer Artesanal', 'UN', 6.5, 2),
    (8745, 'Coca cola 350 ml', 'UN', 2.5, 1);

INSERT INTO estoque (qtde, qtde_minima, dt_atualizacao, item_id)
VALUES
    (100, 80, now(), 1),
    (200, 150, now(), 2);

INSERT INTO estoque_cardapio (estoque_id, cardapio_id, qtde)  VALUES (2, 1, 1), (2, 2, 1);

INSERT INTO COMANDA (DT_INIC , dt_encerramento, vlr_total, usuario_id) VALUES (NOW() , NULL, NULL, 1);

INSERT INTO pedido (dt_inic, aprovado, dt_fim, comanda_id, usuario_id_cliente, usuario_id_funcionario)
VALUES (now(), 0, NULL, 1, 1, 2);

INSERT INTO cardapio_pedido (cardapio_id, pedido_id, qtde) values  (1, 1, 2);



INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Felipe Andre', 9123123882, 2 , 'Avenida Beria Rio, Florianópolis SC', 88923123123, 'felipe@gmail.com', '123123');

INSERT INTO usuario (nome, cpf, tppessoa_id, endereco,telefone, email, senha) VALUES
('Andre Souza', 98385678882, 1 , 'Avenida Beria Rio, Florianópolis SC', 23123123, 'teste@teste.com', '123123');
/* 12/09/2024 - Seção 5: Read - Comandos de Leitura Select. */
/*Aula 36 - Estrutura Básica do Select*/

select C.cardapio_id, C.nome, C.vlr_preparo 
/*COLUNAS A SEREM EXIBIDAS NO RESULTADO DA QUERY. TAMBÉM SE PODE UTILIZAR COLUNAS NA QUERY*/
from 
/*QUAIS AS TABELAS QUE SERÃO UTILIZADAS (A FONTA DA INFORMAÇÃO)*/
cardapio c
/*CLAUSULAS*/
where c.vlr_preparo > 0
/*A CLAUSULA WHERE É UTILIZADO PARA O PPRIMEIRO PARÂMETRO UTILIZADO COMO CONDIÇÃO NA QUERY.*/
and c.nome <> 'Hambuguer da Casa'
/*PARA  DECLARAR MAIS DE UMA CONDIÇÃO DEVE-SE UTILIZAR A CLAUSULA AND.*/

select C.cardapio_id, C.nome, C.vlr_preparo 
from cardapio c
where c.vlr_preparo > 0
and c.nome <> 'Hamburguer da Casa'


/*Aula 37 - Aliases - Como utilizar*/

/*Alias = apeldido*/


select * from  usuario as usu

select usu.usuario_id, usu.nome 
from  usuario as usu

select usu.nome as "Nome do Funcionário"
from  usuario usu


F
/*Aula 38 - CLASUSULAS WHERE, AND, OR - COMO UTILIZAR?*/
-- Usando alias pára tabela cardapio e claUsula "WHERE".
select * 
from cardapio c 
where c.unidade_id = 1

/*Passando mais de uma condição para query, utilizar a clausula "AND".*/
-- Exemplo 1 - AND
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15
	 )

-- Exemplo 2 - AND
select * 
from cardapio c 
where c.unidade_id = 1
and  c.tempo_preparo <= 10

-- Exemplo 3 - AND
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15
	 )
and c.nome = 'Coca cola 350 ml'

-- Aula 39 - Operadores Condicionais
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo >= 0
--	 or c.tempo_preparo = 15
	 )
and c.tempo_preparo <> 15
and c.tempo_preparo != 15


-- Aula 40 - order By - Como utilizar?
--Exemplo 1
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo >= 0
--	 or c.tempo_preparo = 15
	 )
order by 1 asc 

--Exemplo 2 - Ordenar  pelo número da tabela
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo >= 0
--	 or c.tempo_preparo = 15
	 )
order by 1 desc  

--Exemplo 3 - ordenando pelo nome do produto
select c.nome as nome_Produto
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo >= 0
--	 or c.tempo_preparo = 15
	 )
order by  nome_Produto desc 
-- ORDER BY sempre será a última clausula.


-- Aula 41 - Funções Matématicas - Count, max, min, avg - refazer a aula.

--Funcão count() é contador, conta informações de de todas as linhas, ou por colunas.
select count(*) from cardapio c 

--Contando os registros por uma coluna.
select count(c.nome) from cardapio c 

--Melhor resultado para contar registros, é realizar pela coluna da chave primária
select count(c.cardapio_id) from cardapio c 

--Contador de registros de pedidos finalizados, 
--a função count trará somente os valores diferentes de null
select * from pedido p 
select count(p.dt_inic) from pedido p 

--Trazendo informação de coluna com valor null
select count(p.dt_fim) from pedido p 

--Função max(), trará o maior valor, passar valor somente para uma coluna.
select max(p.dt_inic) from pedido p 

--Função min(), trará o menor valor, passar valor somente para uma coluna.
select min(p.dt_inic) from pedido p 

--Função abg(), traz o valor médios de uma coluna
select * from cardapio c 
select avg(c.tempo_preparo) from cardapio c 
select avg(c.vlr_preparo) from cardapio c 
select avg(c.unidade_id) from cardapio c

--Função length(), serve contar a quantidade de caracteres de cada linha de uma coluna.
select length(c.nome) from cardapio c



--Aula 42 - Group By - Como utilizar?
 select * from usuario u 
 order by u.tppessoa_id 

 --Exemplo 2 -> ordenar descrescente
 select * from usuario u 
 order by u.tppessoa_id desc 
 
 --Exemplo 3 -> agrupar e com contador.
 select count(u.tppessoa_id) "Quantidade de Pessoas",
 		u.tppessoa_id  "Tipo de Pessoa"
 from usuario u 
 group by u.tppessoa_id 
 order by u.tppessoa_id desc 
 
 
  --Exemplo 4 -> agrupar por 2 colunas e com contador para duas colunas.
 select count(u.tppessoa_id) "Quantidade de Pessoas",
 		u.tppessoa_id  "Tipo de Pessoa",
 		u.nome 
 from usuario u 
 group by u.tppessoa_id, 
 		  u.nome 
  order by u.nome
  
  
  --Aula 43 - Between - Como utilizar?
  --Período, pesquisar início e fim de período.
  select *from pedido p 
  select to_char(p.dt_inic, 'DD/MM/YYY') 
  from pedido p 
  where p.dt_inic between '12/12/2021'  and '29/12/2024'
  
  
  --Aula 44 - Distinct - Como utilizar? - *** assistir novamente ***
  select distinct p.aprovado as status,
  p.comanda_id as comanda
  from pedido p 
  group by status
  
  
  --Teste de fixação
  
  select * 
  from usuario usu
  where usu.usuario_id = 1
  
  select pe.dt_inic 
  from pedido pe 
  where pe.aprovado = 0
 
  Pergunta 4 - Exiba o último cardapio  criado!   (CARDAPIO_ID) em ordem decrescente!
  select  *
  from cardapio ca
  order by ca.cardapio_id desc

  
  --Aula 45 - Introdução sobre a junção = "JOIN".
  
  --Aula 46 - INNER JOIN - Como utilizar? **Rever Aula
  
  select * from comanda c 

  select *
  from usuario u
  where u.usuario_id = 1
  
  -- Iniciando a função de junção.
  -- Explicando o "INNER JOIN"
select * from comanda c 
inner join usuario u on c.usuario_id = u.usuario_id    

select c.comanda_id, 
	   u.nome, 
	   u.cpf 
from comanda c 
inner join usuario u on c.usuario_id = u.usuario_id   

-- Exemplo de deleção de dados de uma tabela //há um violação de pk e fk
delete from usuario 
where usuario_id =1


-- Aula 47 - LEFT JOIN - Como utilizar?
select 	u.nome,
		u.cpf,
		count(c.comanda_id) as qtde_comanda
from usuario u
left join comanda c on u.usuario_id  = c.comanda_id
group by u.nome,
		 u.cpf 


-- Aula 48 - FULL JOIN e CROSS JOIN - Como utilizar?
-- INNER JOIN - retorna  apenas intersecção das tabelas;
-- LEFT JOIN - retorna os dados da interseção mais os campos da tabela a esquerda;
-- RIGHT JOIN - retorna os dados da interseção mais os campos da tabela a direita;
-- FULL JOIN - retorna a união das tabelas.

-- Exmeplo 1 - FULL JOIN
select *
from comanda c 
full outer join usuario u on c.usuario_id = u.usuario_id 

-- Exemplo 2 - CROSS JOIN
select *
from comanda c 
cross join usuario u


-- Aula 49 - SQL Implicito - SQL ANSI - 89

-- Aula 50 IN( ) e NOT( ) - Como utilizar?

-- Exemplo 1 - clausula "IN"
select  *
from usuario u,
	 tipo_pessoa tp 
where u.tppessoa_id  = tp.tppessoa_id 
and tp.tppessoa_id  in (1, 32, 34, 3 )

-- Exemplo 2 - clausula "NOT IN ( )"
select  *
from usuario u,
	 tipo_pessoa tp 
where u.tppessoa_id  = tp.tppessoa_id 
and tp.tppessoa_id not in (1, 32, 34, 3 )


-- Aula 51 - HAVING - Como utilizar operadores nas consições?
-- Exemplo 1 - 
select u.nome,
	   u.cpf,
	   count(c.comanda_id) as "Quantidade de Comandas"
from usuario u
left join comanda c on u.usuario_id = c.usuario_id
group by u.nome,
		 u.cpf 
having count(C.comanda_id) > 0 


-- Aula 52 - EXISTS AND NOT EXISTS - Como utilizar?

-- Exemplo 1 - EXISTS
select  * from usuario u 
where exists ( select 1
			   from comanda c2
			   where c2.usuario_id = u.usuario_id
			   )

-- Exemplo 2 - NOT EXISTS
select  * from usuario u 
where not exists ( select 1
			   from comanda c2
			   where c2.usuario_id = u.usuario_id
			   )
			   
-- Exemplo 3 - NOT EXISTS - exemplo complexo
select  * from usuario u 
where not exists ( select 1
			   from comanda c2
			   where c2.usuario_id = u.usuario_id
			   and exists(
			   			select 1 
			   			from usuario u2,
			   				 tipo_pessoa tp
			   			where u2.usuario_id = c2.usuario_id
			   			and u2.tppessoa_id = tp.tppessoa_id
			   			and tp.tppessoa_id = 1
			   			)
			   )
			   
			   
-- Aula 53 - LIMIT - Como utilizar? - retorma a quantidade de linhas.
-- Exemplo 1 - LIMIT
select *
from usuario u 
order by u.usuario_id  desc 
limit 1

-- Exemplo 2 - LIMIT
select *
from usuario u 
order by u.usuario_id  desc 
limit 2

-- Exemplo 3 - LIMIT
select *
from usuario u 
order by u.usuario_id  desc 
limit 4


-- Aula 54 - TRUNCATE e TRUNC- Como utilizar? *** rever aula.
-- Deletar dados de uma tabela sem confirmação ou aviso. Pode gerar exclusões errôneas.
-- Exemplo 1 - 	   
create table teste_jonathan (c varchar(10))
select * from teste_jonathan
insert into teste_jonathan (c) values ('C')
truncate teste_jonathan


-- Aula 55 - IS NULL - IS NOT NULL - Como utilizar?
-- Exemplo 1 - IS NOT NULL
select * from usuario u
left join comanda c on u.usuario_id  = c.usuario_id
where  c.comanda_id  is not null 

-- Exemplo 2 - IS  NULL
select * from usuario u
left join comanda c on u.usuario_id  = c.usuario_id
where  c.comanda_id  is null 

-- Exemplo 3 - IS NOT NULL e IS NULL - Comandas não encerradas
select * from usuario u
left join comanda c on u.usuario_id  = c.usuario_id
where  c.comanda_id  is not null
and c.dt_encerramento isnull 

-- Exemplo 4 - IS NOT NULL e IS NULL - Comandas encerradas
select * from usuario u
left join comanda c on u.usuario_id  = c.usuario_id
where  c.comanda_id  is not null
and c.dt_encerramento is not null 
			  
-- Aula 56 - LIKE, NOT LIKE e ILIKE - Como utilizar?
-- Acessar doc do postgre
-- Exemplo 1 - LIKE
select * from tipo_pessoa tp
where tp.descricao like 'FUNCIONARIO'

-- Exemplo 2 - LIKE - string "F%"
select * from tipo_pessoa tp
where tp.descricao like 'F%'

-- Exemplo 3 - LIKE
insert into tipo_pessoa (descricao)
values ('funcionario')

select * from tipo_pessoa tp
where tp.descricao like 'Fu%'

-- Exemplo 4 - ILIKE - string "F%"
select * from tipo_pessoa tp
where tp.descricao ilike 'Fu%'

-- Exemplo 5 - ILIKE - upper ou lower como condições
select * from tipo_pessoa tp
where  upper(tp.descricao) ilike upper('Fu%')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('Fu%')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('%u%')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('%o')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('%a')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('_s%')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('_s_a%')
			   
			   
-- Aula 57 - Replace - Como utilizar? ***rever aula
-- Serve para refatorar uma string.
-- Exemplo 1 - replace
select  * 
from cardapio c

select  replace (c.nome, '350 ml', 'lata')
from cardapio c 

-- Aula 58 - UNION e UNION ALL - Como utilizar? ***rever aula
-- Exemplo 1 - Uitilizando o 'UNION'
select *
from usuario u 
where  u.tppessoa_id = 1
union 
select *
from usuario u2 
where u2.tppessoa_id = 2

-- Exemplo 2 - Uitilizando o 'UNION'
select * 
from usuario u 
join tipo_pessoa tp on u.tppessoa_id  = tp.tppessoa_id 
where u.endereco like 'Avenida Beria%'
union 
select * 
from usuario u2 
join tipo_pessoa tp2 on u2.tppessoa_id = tp2.tppessoa_id 
where u2.endereco like 'Avenida Beria%'

-- Exemplo 3 - Uitilizando o 'UNION'
select u.tppessoa_id,
	   tp.descricao 
from usuario u 
join tipo_pessoa tp on u.tppessoa_id  = tp.tppessoa_id 
where u.endereco like 'Avenida Beria%'
union 
select u2.tppessoa_id,
	   tp2.descricao 
from usuario u2 
join tipo_pessoa tp2 on u2.tppessoa_id = tp2.tppessoa_id 
where u2.endereco like 'Avenida Beria%'

-- Exemplo 4 - Uitilizando o 'UNION ALL'
select u.tppessoa_id,
	   tp.descricao,
	   u.nome 
from usuario u 
join tipo_pessoa tp on u.tppessoa_id  = tp.tppessoa_id 
where u.endereco like 'Avenida Beria%'
union all 
select u2.tppessoa_id,
	   tp2.descricao,
	   u2.nome
from usuario u2 
join tipo_pessoa tp2 on u2.tppessoa_id = tp2.tppessoa_id 
where u2.endereco like 'Avenida Beria%'


--Aula 59 - TRIM: TRIM, LTRIM, BTRIM - Como utilizar?
-- Função trim é para remover caracter de uma string.
select trim('frase, frase2, frase3, ', ', ')

select ltrim('frase, frase2, frase3, ', ', ')

select rtrim('frase, frase2, frase3, ', ', ')

select btrim('frase, frase2, frase3, ', ', ')

-- Exemplo com as tabelas usando 'trim'
select *
from cardapio c 

select trim(c.nome, 'Cl'), c.* 
from cardapio c 

select ltrim(c.nome, 'C'), c.* 
from cardapio c 

select rtrim(c.nome, 'l'), c.* 
from cardapio c 

select btrim(c.nome, 'Cl'), c.* 
from cardapio c 

select trim(c.nome, 'c'), c.* 
from cardapio c 


-- Aula 60 - LPAD -RPAD - Como utilizar?
-- Completa o tamanho total de caracteres de uma string, lado esquerdo ou direito.
select  lpad('Udemy Banco de Dados', 50, '*') 

select  rpad('Udemy Banco de Dados', 50, 'x') 


-- Aula 61 - SUBSTR - Como utilizar?
-- Remove um conjunto de string determinado, retorna caracteres desejados
select substr('Jonathan', 1, 3) 

select substr('Jonathan', 3, 3) 


-- Aula 62 - SUBQUERY - Fundamentos
-- Sub  consulta - Aula teórica.
-- Subselect: instrução de sql, detro de outra instrução sql.


-- Aula 63 - SUBQUERY - Como utilizar na PROJEÇÃO, FROM e PREDICADO
-- Exemplo 1 - suqbquery
select u.*,
		(select c.comanda_id
			from comanda c,
				 pedido p 
			where c.dt_encerramento is not null
			and c.usuario_id = c.usuario_id
		)
from usuario u 

-- Exemplo 2 - suqbquery
select u.*,
		(select c.comanda_id
			from comanda c,
				 --pedido p 
			where c.dt_encerramento is not null
			--and c.usuario_id = c.usuario_id
			union 
			select c2.comanda_id
			from comanda c2
		)
from usuario u 

