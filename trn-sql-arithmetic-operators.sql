--D) MANIPULAÇÃO DE DADOS NUMÉRICOS: OPERADORES ARITMÉTICOS (PÁG: 234)

--D.1) multiply operator

select	nome_vendedor,
		salario_fixo,
		salario_fixo * 2 "Novo Salário"
from vendedor 

select 	codigo_produto,
		descricao_produto,
		valor_unitario_produto,
		valor_unitario_produto * 3 "Valor Unitário Reajustado"
from produto



--D.2) addition operator - cast

select	nome_vendedor,
		salario_fixo,
		salario_fixo + money(1000) "Novo Salario"
from vendedor 

select 	codigo_produto,
		descricao_produto,
		valor_unitario_produto,
		valor_unitario_produto + money (3) "Valor Unitário Reajustado"
from produto



--D.3) division operator


select	nome_vendedor,
		salario_fixo,
		salario_fixo / 2 "Novo Salário Reduzido"
from vendedor 

select 	codigo_produto,
		descricao_produto,
		valor_unitario_produto,
		valor_unitario_produto / 3 "Valor Unitário Reduzido"
from produto


--D.2) subtraction  operator - cast

select	nome_vendedor,
		salario_fixo,
		salario_fixo - money(1000) "Novo Salario"
from vendedor 

select 	codigo_produto,
		descricao_produto,
		valor_unitario_produto,
		valor_unitario_produto - money (3) "Valor Unitário Reajustado"
from produto
