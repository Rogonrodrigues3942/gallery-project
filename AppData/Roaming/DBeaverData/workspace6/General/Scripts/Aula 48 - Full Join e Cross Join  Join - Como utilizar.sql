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

