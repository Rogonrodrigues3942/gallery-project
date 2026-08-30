-- xx/xx/2025 - Aula 44 - Distinct - Como utilizar? revisão
select  * from pedido p 

--Cláusula "DISTINCT"
-- Apresentando as informações de aprovado  e comanda_id

select distinct 
p.pedido_id as "Id do Pedido", p.aprovado as Status
from pedido p

-- Distinct é equivalente a cláusula  GROUP BY, mas cuidado caos utilizar.

