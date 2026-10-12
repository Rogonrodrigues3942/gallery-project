-- E.5) Operadores baseados em listas "IN" e "NOT IN".

-- Os operadores "IN" e "NOT IN" pesquisam registros que estão ou não no conjunto de  <valores> fornecodo.
-- Eles minimizam o uso dos operadores "=", "<>", "AND" e "OR".

-- Sintaxe:
--			WHERE <nome da clouna> IN <valores>
--			WHERE <nome da clouna> NOT IN <valores>

-- Exemplo 1: Listar os vendedores que são das faixas de comissão A e B.
select	nome_vendedor,
		faixa_comissao 
from vendedor
where faixa_comissao in ('A', 'B')

-- Exemplo 2: Listar os vendedores que não são das faixas de comissão A e B.
select	nome_vendedor,
		faixa_comissao 
from vendedor
where faixa_comissao not in ('A', 'B')