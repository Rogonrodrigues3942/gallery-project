/* 12/09/2024 - Seção 5: Read - Comandos de Leitura Select. */
/*Aula 36 - Estrutura Básica do Select*/

select C.cardapio_id, C.nome, C.vlr_preparo 
/*COLUNAS A SEREM EXIBIDAS NO RESULTADO DA QUERY. TAMBÉM SE PODE UTILIZAR COLUNAS NA QUERY*/
from 
/*QUAIS AS TABELAS QUE SERÃO UTILIZADAS (A FONTA DA INFORMAÇÃO)*/
cardapio c
/*CLAUSULAS*/
where c.vlr_preparo > 0
/*A CLAUSULA WHERE É UTILIZADO PARA O PPRIMEIRO PARÂMETRO UTILIZADO COMO CONDIÇÃO NA QUERY.*/
and c.nome <> 'Hambuguer da Casa'
/*PARA  DECLARAR MAIS DE UMA CONDIÇÃO DEVE-SE UTILIZAR A CLAUSULA AND.*/

select C.cardapio_id, C.nome, C.vlr_preparo 
from cardapio c
where c.vlr_preparo > 0
and c.nome <> 'Hamburguer da Casa'


/*Aula 37 - Aliases - Como utilizar*/

/*Alias = apeldido*/


select * from  usuario as usu

select usu.usuario_id, usu.nome 
from  usuario as usu

select usu.nome as "Nome do Funcionário"
from  usuario usu


F