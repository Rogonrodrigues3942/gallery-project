--Aula 44 - Distinct - como utilizar?
--13/jan/2025

select *
from pedido p


select distinct p.aprovado as Status,
		p.comanda_id as Comanda
from pedido p

