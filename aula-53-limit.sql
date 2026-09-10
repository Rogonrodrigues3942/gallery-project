-- Aula 53- Limit - Como utilizar? -  22/fev/2025.


-- Case 1 -  traz uma quantidade de tupla determinanda pela cláusula LIMIT
select * from usuario u 
limit 1

-- Case 2
select * from usuario u 
order by u.usuario_id desc
limit 2

-- Case 3
select * from usuario u 
order by u.usuario_id desc
limit 3

-- Case 4
select * 
from usuario u 
order by u.usuario_id desc
-- limit 2