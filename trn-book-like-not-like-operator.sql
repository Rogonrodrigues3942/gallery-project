--	E.4) Operadores baseados em string de caracteres "LIKE" e "NOT LIKE"
-- Sintaxe:
--			WHERE <nome da coluna> LIKE <valor>
--			WHERE <nome da coluna> NOT LIKE <valor>

-- Observações:
-- 				" % " : substitui uma palavra
--				" _ " : substitui um caractere

--Exemplo 1: Listar todos os produtos cujo nome comece com "Q".
select 	codigo_produto,
		descricao_produto 
from produto 
where descricao_produto like 'Q%'


--Exemplo 2: Listar todos os produtos cujo nome termine com "o".
select 	codigo_produto,
		descricao_produto 
from produto 
where descricao_produto like '%o'


--Exeplo 3: Listarvendedores que não começam com 'Jo'
select *
from vendedor
where nome_vendedor  not like 'Jo%'