INSERT INTO vendedor
(codigo_vendedor, nome_vendedor, salario_fixo, faixa_comissao)
--VALUES(111, 'Carlos', 2490, 'A');
--VALUES(11, 'João', 2780, 'C');
--VALUES(240, 'Antônio', 9500, 'C');
--VALUES(720, 'Felipe', 4600, 'A');
--VALUES(213, 'Jonas', 2300, 'A');
--VALUES(101, 'João', 2650, 'C');
--VALUES(310, 'Josias', 870, 'B');
--VALUES(209, 'José', 1800, 'C');
VALUES(250, 'Maurício', 2930, 'B');



select *
from vendedor

--CAST 1 ->  para money
select 	nome_vendedor as "Vendedor", 
		salario_fixo as "Salário Fixo" 
from vendedor
where salario_fixo > 2000 ::money

--CAST 2 ->  para money
select 	nome_vendedor as "Vendedor", 
		salario_fixo as "Salário Fixo" ,
		faixa_comissao as "Faixa de Comissão" 
from vendedor
where salario_fixo > CAST(2000 as money)