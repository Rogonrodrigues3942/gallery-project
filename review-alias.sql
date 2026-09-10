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
