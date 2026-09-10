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