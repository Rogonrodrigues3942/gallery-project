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
