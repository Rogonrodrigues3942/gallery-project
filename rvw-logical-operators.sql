-- E.2) Logical Operators
-- Pages: 237, 238 and 239
--Operators:  AND, OR and NOT

-- Example 1: Listar os produtos que tenham unidade igual "M" e valor unitário igual R$ 1,05 da tabela produto.

select*
from produto p 
where p.unidade_produto = 'M'
and p.valor_unitario_produto::numeric = 1.05


-- Example 1.2: Listar os produtos que tenham unidade igual "M" e valor unitário igual R$ 1,05 da tabela produto.
select *
from  produto p 
where p.unidade_produto = 'M'
and p.valor_unitario_produto = cast(1.05 as money)


-- Example 2: Listar os nomes que moram em "São Paulo" 
select *
from cliente c 
where c.cidade_cliente = 'São Paulo'
and c.cep_cliente >= '02700000' 
or  c.cep_cliente <= '03100000'

-- Exemplo 2.1: Listar os nomes que morem na afaixa de CEP entre 30077000 e 30079000 e seus respectivos endereços
select *
from cliente c 
where c.cep_cliente >= '32077000'
and c.cep_cliente  <= '34079000'

--Exemplo 3: Mostrar todos os pedidos que não tenham prazo de entrega igual a 15 dias
select *
from pedido p 
where not p.prazo_entrega = 15 
and not p.prazo_entrega = 20

-- Exemplo 3.1: utilizando o operador de comrparação diferente (' <> ')
select *
from pedido p 
where p.prazo_entrega  <> 20

-- Exemplo 3.1: utilizando o operador de comrparação diferente (' != ')
select *
from pedido p 
where p.prazo_entrega  != 20





