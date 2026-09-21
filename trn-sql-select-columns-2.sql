--A) SELEÇÃO DE COLUNAS ESPECÍFICAS  DE UMA TABELA (PÁG: 231)

--A.1) Exemplo 1

select 	p.codigo_produto,
		p.valor_unitario_produto 
from 	produto p


--A.2) Exemplo 2

select 	codigo_produto,
		descricao_produto,
		unidade_produto
from produto 


--A.3) Exemplo 3

select	codigo_cliente,
		nome_cliente,
		cidade_cliente
from cliente


--B) Selecionando todas as colunas de uma tabela.

--B.1) Exemplo 4

select	*
from cliente

--B.2) exemplo 5

select *
from produto