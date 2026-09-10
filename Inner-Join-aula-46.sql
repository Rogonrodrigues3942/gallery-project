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


