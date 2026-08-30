/*Review clausulas - operadores condicionais - 	WHERE, AND, OR*/

select vlr_preparo as "Valor de Preparo", nome as "Prato"
from cardapio as c
where vlr_preparo > 0
  and nome = 'Hamburguer da Casa'
  
select *
from cardapio as c
where vlr_preparo > 0
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15)
and c.nome = 'casa'

select *
from cardapio as c
where vlr_preparo > 0
and (c.tempo_preparo >= 0
	 or c.tempo_preparo > 15)
