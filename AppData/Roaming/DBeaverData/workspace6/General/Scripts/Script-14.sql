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