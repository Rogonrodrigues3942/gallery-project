-- E.1) Operadores de comparação --> página 236 e 237
--
-- Exemplo 1: Listar num_pedido, o código_produto e a quantidade dos itens do pedido com a quantidade dos itens do pedido com a quantidade 
-- igual a 35 da tabela item_do_pedido.


select  *
from item_de_pedido
where quantidade_produto = 35

-- Exemplo 02: Listar num_pedido, o código_produto e a quantidade dos itens do pedido com a quantidade dos itens do pedido com a quantidade 
-- menor que 10 da tabela item_do_pedido.

select *
from item_de_pedido idp 
where idp.quantidade_produto  < 10


-- Exemplo 03: Listar toda a tabela de item_de_pedido

select *
from item_de_pedido idp 

-- Exemplo xx:  " != "
select *
from item_de_pedido idp 
where idp.quantidade_produto != 10 
and idp.quantidade_produto !=20

-- Exemplo xx:  " <> "
select *
from item_de_pedido idp 
where idp.quantidade_produto <> 8
and idp.quantidade_produto <> 40

-- Exemplo xx:  " < " less than
select *
from item_de_pedido idp 
where idp.quantidade_produto < 20

-- Exemplo xx:  "<= "
select *
from item_de_pedido idp 
where idp.quantidade_produto <= 20

-- Exemplo xx:  " > " greater than
select *
from item_de_pedido idp 
where idp.quantidade_produto  > 35


-- Exemplo xx:  " >= "
select *
from item_de_pedido idp 
where idp.quantidade_produto >= 35



