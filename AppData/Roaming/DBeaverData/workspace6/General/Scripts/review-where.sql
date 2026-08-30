select * from estoque_cardapio ec 
select * from cardapio c 
select * from fornecedor f 
select * from pedido p 
select * from usuario u 


select e.qtde ,e.estoque_cardapio_id ,e.cardapio_id 
from estoque_cardapio e 

select e.qtde ,e.estoque_cardapio_id ,e.cardapio_id 
from estoque_cardapio e 
where e.cardapio_id = 1

select e.qtde ,e.estoque_cardapio_id ,e.cardapio_id 
from estoque_cardapio e 
/*A clausula WHERE é o primeiro parâmetro da Query*/
where e.cardapio_id != 1

