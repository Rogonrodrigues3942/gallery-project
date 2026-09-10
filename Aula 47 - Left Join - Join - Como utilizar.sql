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