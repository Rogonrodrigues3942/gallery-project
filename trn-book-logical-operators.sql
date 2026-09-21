--E2) Operadores Lógicos

--> AND: "e" lógico
--> OR: "ou" lógico
--> NOT: negação

--Exemplo 1:
-- Listar os produtos que tenham unidade igual a 'M' e valor unitário igual a R4 1,05 da tabela de produtos

select *
from produto 
where unidade_produto = 'M' 
and valor_unitario_produto::numeric = 1.05
