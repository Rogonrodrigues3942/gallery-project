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




