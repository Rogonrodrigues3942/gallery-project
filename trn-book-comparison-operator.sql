-- SELEÇÃO DE SOMENTE ALGUMAS LINHAS DA TABELA (PÁG: 235)

--E.1) OPERADORES DE COMAPRAÇÃO (PÁG: 236)

select *
from item_de_pedido

--Exemplo 1:
--Listar o num_pedido, o cod_produto e a quantidade dos itens do pedido com a quantidade igual a 35 da tabela de item_pedido.

SELECT	numero_pedido,
		codigo_produto,
		quantidade_produto 
FROM item_de_pedido
where quantidade_produto =35

--Exemplo 2:
--Listar o num_pedido, o cod_produto e a quantidade dos itens do pedido com a quantidade igual a 70 da tabela de item_pedido.

select *
from item_de_pedido
where quantidade_produto =  70

--Exemplo 4:
--Quais clientes que moram em Niteroi.

select nome_cliente 
from cliente
where cidade_cliente = 'Niteroi'

--Exemplo 5:
--Quais clientes que moram no estado de São Paulo, uf = SP.

select * 
from cliente
where cidade_cliente = 'Niteroi'

