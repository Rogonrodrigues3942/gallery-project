--E2) Operadores Lógicos

--> AND: "e" lógico
--> OR: "ou" lógico
--> NOT: negação

-- Exemplo 1:
-- Listar os produtos que tenham unidade igual a 'M' e valor unitário igual a R4 1,05 da tabela de produtos

select *
from produto 
where unidade_produto = 'M' 
and valor_unitario_produto::numeric = 1.05


-- Exemplo 2:
-- Listar os clientes que moram em "São Paulo" ou estejam na faixa de  CEP entre "30077000" e "30079000" e seus respectivos endereços.
select *
from cliente c 
where c.uf_cliente = 'SP'
or c.cep_cliente >= '03012683'
and c.cep_cliente <= '03300000'


-- Exemplo 3: 
-- Listar os clientes que moram em "São Paulo" ou estejam na faixa de  CEP entre "30077000" e "30079000" e seus respectivos endereços.
select 	nome_cliente,
		endereco_cliente,
		cep_cliente
from cliente
where (cep_cliente >= '030077000' and cep_cliente <= '03007900')
or cidade_cliente = 'São Paulo'

--Operador  'AND' tem prioridade sobre o operador 'OR'.


-- Exemplo 4:
--Listar todos os pedidos que não tenham prazo de entrega igual a 15.
select	numero_pedido,
		prazo_entrega
from pedido
where prazo_entrega <> 15

