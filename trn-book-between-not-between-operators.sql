-- E.3) Operadores " BETWEEN" e "NOT BETWEEN".

Sintaxe:

-- *** WHERE <nome_da_coluna> BETWEEN <valor1> AND <valor2>

-- *** WHERE <nome_da_coluna> NOT BETWEEN <valor1> AND <valor2>

-- Os operadores  "BETWEEN" e "NOT BETWEEN" propriciam queries em uma determinada faixa de valores, são delimitadas pelos valores inicial e final.
-- Não serão necessários os operadores <= e >=. Os valores devem ser do mesmo tipo dedos da coluna utilizada ba query.

-- Exemplo 1:
-- Lista os códigos e as descrições dos produtos que tenham o valor unitário na faixa de R$ 0,32 até R$ 2,00.
-- valor1 = 0,32 e o valor2 = 2,00.
-- Não esquecer de realizar na coluna valor_unitario_produto.

select 	codigo_produto,
		descricao_produto
from produto
where valor_unitario_produto::numeric between 0.32 and 2.00



-- Exemplo 2:
-- Lista os códigos e as descrições dos produtos que não tenham o valor unitário na faixa de R$ 0,32 até R$ 2,00.
-- valor1 = 0,32 e o valor2 = 2,00.
-- Não esquecer de realizar na coluna valor_unitario_produto.

select 	descricao_produto,
		codigo_produto
from produto
where valor_unitario_produto::numeric not between 0.32 and 2.00 