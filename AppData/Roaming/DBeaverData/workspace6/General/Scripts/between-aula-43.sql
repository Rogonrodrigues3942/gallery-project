/*11/12/2024 - Aula 43 - Between - Como utilizar? */

select *
from pedido p

-- Exemplo 1 - utilizando Between
select to_char(p.dt_inic, 'DD/MM/YYYY'),
		p.pedido_id 
from pedido p
where p.dt_inic between '01/09/2024' and '03/09/2024'

-- Exemplo 2 - utilizando Between
select to_char(p.dt_inic, 'DD/MM/YYYY') as "Data do Pedido",
		p.pedido_id "Id do Pedido"
from pedido p
where p.pedido_id between 0 and 3

--*******
-- Revisão de Between 09/01/2025
select * 
from pedido p 

--Exibir as datas em padrão brasileiro.
select to_char(p.dt_inic, 'DD/MM/YY') 
from pedido p

--Aplicando BETWEEN nas consultas
select to_char(p.dt_inic, 'DD/MM/YY') 
from pedido p
where p.dt_inic  >= '01/09/2024'
and p.dt_inic  <= '30/09/2024'

select to_char(p.dt_inic, 'DD/MM/YY') 
from pedido p
where p.dt_inic between '03/09/2024' and '21/09/2024'

select *
from pedido p
where p.pedido_id between 1 and 3