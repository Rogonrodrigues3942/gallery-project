--Treino de aliases - tabela vendedor
select 	codigo_vendedor as "Código",
		nome_vendedor as Nome,
		salario_fixo as "Fixo R$"
from vendedor


--Treino de aliases - tabela cliente
select 	c.nome_cliente  as Cliente,
		c.cidade_cliente as Cidade
from cliente c 