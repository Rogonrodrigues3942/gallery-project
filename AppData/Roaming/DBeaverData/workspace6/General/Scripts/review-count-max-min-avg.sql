--Aula 41 Funções Matemáticas  - Count, Max, Min, Avg

--A Função cunt traz a quantidade de linhas
select count(*) from cardapio c 

-- Ao utilizar contadores, utilize a chave primária para cntar registros.
select count(c.cardapio_id) from cardapio c 

select  * from pedido p 

select count(ec.qtde) from estoque_cardapio ec 


/*Retorna o maior valor de uma consulta de uma coluna.*/
select max(p.dt_fim) from pedido p 

/*Retorna o menor valor de uma consulta de uma coluna.*/
select min(p.dt_fim) from pedido p 

/*AVG - Média de valores de uma determinada coluna*/
select avg(c.vlr_preparo) as "Valor Médio", avg(c.tempo_preparo) "Tempo Médio"
from cardapio c 

/*Tamanho de caracteres de células de uma colunas.*/
select length(c.nome)
from cardapio c 