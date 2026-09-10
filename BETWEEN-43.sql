--30/01/2025 - CLÁUSULA BETWEEN -REVIEW
-- Revisão da cláusula BETWEEN 30/01/2025

select * from pedido p

-- Aplicando máscara para datas usando to_char(coluna, máscara)
select to_char(p.dt_inic, 'DD/MM/YYYY') from pedido p


-- Caso 1 --> sem aplicação de BETWEEN
select to_char(p.dt_inic, 'DD/MM/YYY')
from pedido p 
where p.dt_inic  >= '02/09/2024'
and p.dt_inic <= '31/01/2025'

-- Caso 2 --> com aplicação de BETWEEN
select to_char(p.dt_inic, 'DD/MM/YYY')
from pedido p 
where p.dt_inic between '02/09/2024' and '30/09/2024'


-- Caso 3 --> com aplicação de BETWEEN - fora do range de data
select to_char(p.dt_inic, 'DD/MM/YYY')
from pedido p 
where p.dt_inic between '09/09/2024' and '30/09/2024'

-- Caso 4 --> com aplicação de BETWEEN - fora do range de data
select *
from pedido p 
where p.pedido_id between 0 and 1

-- Caso 5 --> com aplicação de BETWEEN - fora do range de data
select *
from pedido p 
where p.pedido_id between 2 and 3

-- path: C:\Users\rogon\AppData\Roaming\DBeaverData\workspace6\General\Scripts

