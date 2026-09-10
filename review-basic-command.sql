select * 
/*Colunas a serem exibidas no resultado Qurey*/
from cardapio c 
/*Quais tabelas que serão utilizadas.*/

select * from usuario u 

select u.nome 
from usuario u 

select u.nome, u.tppessoa_id, u.cpf 
from usuario u 

select e.dt_atualizacao, e.qtde_minima 
from estoque e 

select e.dt_atualizacao, e.qtde_minima 
from estoque e 
where e.qtde_minima > 100

select *
/*Colunas a serem exibidas no resultado Qurey*/
from 
/*Quais tabelas que serão utilizadas.*/
cardapio c
/*Quais condições*/
where c.vlr_preparo > 0
and c.nome <> 'Porção de petiscos'