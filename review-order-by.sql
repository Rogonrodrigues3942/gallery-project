--Aula 40 - Order By - Como utilizar?

select *
from cardapio as c
where c.unidade_id = 1
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15)
order by 1 desc 

select *
from cardapio as c
where c.unidade_id = 1
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15)
order by 2 desc 

select  c.nome as "Nome do item"
from cardapio c 
order by "Nome do item" desc 