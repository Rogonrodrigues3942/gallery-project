/*Aula 38 - CLASUSULAS WHERE, AND, OR - COMO UTILIZAR?*/
-- Usando alias pára tabela cardapio e claUsula "WHERE".
select * 
from cardapio c 
where c.unidade_id = 1

/*Passando mais de uma condição para query, utilizar a clausula "AND".*/
-- Exemplo 1 - AND
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15
	 )

-- Exemplo 2 - AND
select * 
from cardapio c 
where c.unidade_id = 1
and  c.tempo_preparo <= 10

-- Exemplo 3 - AND
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo = 0
	 or c.tempo_preparo = 15
	 )
and c.nome = 'Coca cola 350 ml'

-- Aula 39 - Operadores Condicionais
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo >= 0
--	 or c.tempo_preparo = 15
	 )
and c.tempo_preparo <> 15
and c.tempo_preparo != 15


-- Aula 40 - order By - Como utilizar?
--Exemplo 1
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo >= 0
--	 or c.tempo_preparo = 15
	 )
order by 1 asc 

--Exemplo 2 - Ordenar  pelo número da tabela
select * 
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo >= 0
--	 or c.tempo_preparo = 15
	 )
order by 1 desc  

--Exemplo 3 - ordenando pelo nome do produto
select c.nome as nome_Produto
from cardapio c 
where c.unidade_id = 1
and (c.tempo_preparo >= 0
--	 or c.tempo_preparo = 15
	 )
order by  nome_Produto desc 
-- ORDER BY sempre será a última clausula.


-- Aula 41 - Funções Matématicas - Count, max, min, avg - refazer a aula.

--Funcão count() é contador, conta informações de de todas as linhas, ou por colunas.
select count(*) from cardapio c 

--Contando os registros por uma coluna.
select count(c.nome) from cardapio c 

--Melhor resultado para contar registros, é realizar pela coluna da chave primária
select count(c.cardapio_id) from cardapio c 

--Contador de registros de pedidos finalizados, 
--a função count trará somente os valores diferentes de null
select * from pedido p 
select count(p.dt_inic) from pedido p 

--Trazendo informação de coluna com valor null
select count(p.dt_fim) from pedido p 

--Função max(), trará o maior valor, passar valor somente para uma coluna.
select max(p.dt_inic) from pedido p 

--Função min(), trará o menor valor, passar valor somente para uma coluna.
select min(p.dt_inic) from pedido p 

--Função abg(), traz o valor médios de uma coluna
select * from cardapio c 
select avg(c.tempo_preparo) from cardapio c 
select avg(c.vlr_preparo) from cardapio c 
select avg(c.unidade_id) from cardapio c

--Função length(), serve contar a quantidade de caracteres de cada linha de uma coluna.
select length(c.nome) from cardapio c



--Aula 42 - Group By - Como utilizar?
 select * from usuario u 
 order by u.tppessoa_id 

 --Exemplo 2 -> ordenar descrescente
 select * from usuario u 
 order by u.tppessoa_id desc 
 
 --Exemplo 3 -> agrupar e com contador.
 select count(u.tppessoa_id) "Quantidade de Pessoas",
 		u.tppessoa_id  "Tipo de Pessoa"
 from usuario u 
 group by u.tppessoa_id 
 order by u.tppessoa_id desc 
 
 
  --Exemplo 4 -> agrupar por 2 colunas e com contador para duas colunas.
 select count(u.tppessoa_id) "Quantidade de Pessoas",
 		u.tppessoa_id  "Tipo de Pessoa",
 		u.nome 
 from usuario u 
 group by u.tppessoa_id, 
 		  u.nome 
  order by u.nome
  
  
  --Aula 43 - Between - Como utilizar?
  --Período, pesquisar início e fim de período.
  select *from pedido p 
  select to_char(p.dt_inic, 'DD/MM/YYY') 
  from pedido p 
  where p.dt_inic between '12/12/2021'  and '29/12/2024'
  
  
  --Aula 44 - Distinct - Como utilizar? - *** assistir novamente ***
  select distinct p.aprovado as status,
  p.comanda_id as comanda
  from pedido p 
  group by status
  
  
  --Teste de fixação
  
  select * 
  from usuario usu
  where usu.usuario_id = 1
  
  select pe.dt_inic 
  from pedido pe 
  where pe.aprovado = 0
 
  Pergunta 4 - Exiba o último cardapio  criado!   (CARDAPIO_ID) em ordem decrescente!
  select  *
  from cardapio ca
  order by ca.cardapio_id desc

  
  --Aula 45 - Introdução sobre a junção = "JOIN".
  
  --Aula 46 - INNER JOIN - Como utilizar? **Rever Aula
  
  select * from comanda c 

  select *
  from usuario u
  where u.usuario_id = 1
  
  -- Iniciando a função de junção.
  -- Explicando o "INNER JOIN"
select * from comanda c 
inner join usuario u on c.usuario_id = u.usuario_id    

select c.comanda_id, 
	   u.nome, 
	   u.cpf 
from comanda c 
inner join usuario u on c.usuario_id = u.usuario_id   

-- Exemplo de deleção de dados de uma tabela //há um violação de pk e fk
delete from usuario 
where usuario_id =1


-- Aula 47 - LEFT JOIN - Como utilizar?
select 	u.nome,
		u.cpf,
		count(c.comanda_id) as qtde_comanda
from usuario u
left join comanda c on u.usuario_id  = c.comanda_id
group by u.nome,
		 u.cpf 


-- Aula 48 - FULL JOIN e CROSS JOIN - Como utilizar?
-- INNER JOIN - retorna  apenas intersecção das tabelas;
-- LEFT JOIN - retorna os dados da interseção mais os campos da tabela a esquerda;
-- RIGHT JOIN - retorna os dados da interseção mais os campos da tabela a direita;
-- FULL JOIN - retorna a união das tabelas.

-- Exmeplo 1 - FULL JOIN
select *
from comanda c 
full outer join usuario u on c.usuario_id = u.usuario_id 

-- Exemplo 2 - CROSS JOIN
select *
from comanda c 
cross join usuario u


-- Aula 49 - SQL Implicito - SQL ANSI - 89

-- Aula 50 IN( ) e NOT( ) - Como utilizar?

-- Exemplo 1 - clausula "IN"
select  *
from usuario u,
	 tipo_pessoa tp 
where u.tppessoa_id  = tp.tppessoa_id 
and tp.tppessoa_id  in (1, 32, 34, 3 )

-- Exemplo 2 - clausula "NOT IN ( )"
select  *
from usuario u,
	 tipo_pessoa tp 
where u.tppessoa_id  = tp.tppessoa_id 
and tp.tppessoa_id not in (1, 32, 34, 3 )


-- Aula 51 - HAVING - Como utilizar operadores nas consições?
-- Exemplo 1 - 
select u.nome,
	   u.cpf,
	   count(c.comanda_id) as "Quantidade de Comandas"
from usuario u
left join comanda c on u.usuario_id = c.usuario_id
group by u.nome,
		 u.cpf 
having count(C.comanda_id) > 0 


-- Aula 52 - EXISTS AND NOT EXISTS - Como utilizar?

-- Exemplo 1 - EXISTS
select  * from usuario u 
where exists ( select 1
			   from comanda c2
			   where c2.usuario_id = u.usuario_id
			   )

-- Exemplo 2 - NOT EXISTS
select  * from usuario u 
where not exists ( select 1
			   from comanda c2
			   where c2.usuario_id = u.usuario_id
			   )
			   
-- Exemplo 3 - NOT EXISTS - exemplo complexo
select  * from usuario u 
where not exists ( select 1
			   from comanda c2
			   where c2.usuario_id = u.usuario_id
			   and exists(
			   			select 1 
			   			from usuario u2,
			   				 tipo_pessoa tp
			   			where u2.usuario_id = c2.usuario_id
			   			and u2.tppessoa_id = tp.tppessoa_id
			   			and tp.tppessoa_id = 1
			   			)
			   )
			   
			   
-- Aula 53 - LIMIT - Como utilizar? - retorma a quantidade de linhas.
-- Exemplo 1 - LIMIT
select *
from usuario u 
order by u.usuario_id  desc 
limit 1

-- Exemplo 2 - LIMIT
select *
from usuario u 
order by u.usuario_id  desc 
limit 2

-- Exemplo 3 - LIMIT
select *
from usuario u 
order by u.usuario_id  desc 
limit 4


-- Aula 54 - TRUNCATE e TRUNC- Como utilizar? *** rever aula.
-- Deletar dados de uma tabela sem confirmação ou aviso. Pode gerar exclusões errôneas.
-- Exemplo 1 - 	   
create table teste_jonathan (c varchar(10))
select * from teste_jonathan
insert into teste_jonathan (c) values ('C')
truncate teste_jonathan


-- Aula 55 - IS NULL - IS NOT NULL - Como utilizar?
-- Exemplo 1 - IS NOT NULL
select * from usuario u
left join comanda c on u.usuario_id  = c.usuario_id
where  c.comanda_id  is not null 

-- Exemplo 2 - IS  NULL
select * from usuario u
left join comanda c on u.usuario_id  = c.usuario_id
where  c.comanda_id  is null 

-- Exemplo 3 - IS NOT NULL e IS NULL - Comandas não encerradas
select * from usuario u
left join comanda c on u.usuario_id  = c.usuario_id
where  c.comanda_id  is not null
and c.dt_encerramento isnull 

-- Exemplo 4 - IS NOT NULL e IS NULL - Comandas encerradas
select * from usuario u
left join comanda c on u.usuario_id  = c.usuario_id
where  c.comanda_id  is not null
and c.dt_encerramento is not null 
			  
-- Aula 56 - LIKE, NOT LIKE e ILIKE - Como utilizar?
-- Acessar doc do postgre
-- Exemplo 1 - LIKE
select * from tipo_pessoa tp
where tp.descricao like 'FUNCIONARIO'

-- Exemplo 2 - LIKE - string "F%"
select * from tipo_pessoa tp
where tp.descricao like 'F%'

-- Exemplo 3 - LIKE
insert into tipo_pessoa (descricao)
values ('funcionario')

select * from tipo_pessoa tp
where tp.descricao like 'Fu%'

-- Exemplo 4 - ILIKE - string "F%"
select * from tipo_pessoa tp
where tp.descricao ilike 'Fu%'

-- Exemplo 5 - ILIKE - upper ou lower como condições
select * from tipo_pessoa tp
where  upper(tp.descricao) ilike upper('Fu%')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('Fu%')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('%u%')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('%o')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('%a')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('_s%')

select * from tipo_pessoa tp
where  lower(tp.descricao) ilike lower('_s_a%')
			   
			   
-- Aula 57 - Replace - Como utilizar? ***rever aula
-- Serve para refatorar uma string.
-- Exemplo 1 - replace
select  * 
from cardapio c

select  replace (c.nome, '350 ml', 'lata')
from cardapio c 

-- Aula 58 - UNION e UNION ALL - Como utilizar? ***rever aula
-- Exemplo 1 - Uitilizando o 'UNION'
select *
from usuario u 
where  u.tppessoa_id = 1
union 
select *
from usuario u2 
where u2.tppessoa_id = 2

-- Exemplo 2 - Uitilizando o 'UNION'
select * 
from usuario u 
join tipo_pessoa tp on u.tppessoa_id  = tp.tppessoa_id 
where u.endereco like 'Avenida Beria%'
union 
select * 
from usuario u2 
join tipo_pessoa tp2 on u2.tppessoa_id = tp2.tppessoa_id 
where u2.endereco like 'Avenida Beria%'

-- Exemplo 3 - Uitilizando o 'UNION'
select u.tppessoa_id,
	   tp.descricao 
from usuario u 
join tipo_pessoa tp on u.tppessoa_id  = tp.tppessoa_id 
where u.endereco like 'Avenida Beria%'
union 
select u2.tppessoa_id,
	   tp2.descricao 
from usuario u2 
join tipo_pessoa tp2 on u2.tppessoa_id = tp2.tppessoa_id 
where u2.endereco like 'Avenida Beria%'

-- Exemplo 4 - Uitilizando o 'UNION ALL'
select u.tppessoa_id,
	   tp.descricao,
	   u.nome 
from usuario u 
join tipo_pessoa tp on u.tppessoa_id  = tp.tppessoa_id 
where u.endereco like 'Avenida Beria%'
union all 
select u2.tppessoa_id,
	   tp2.descricao,
	   u2.nome
from usuario u2 
join tipo_pessoa tp2 on u2.tppessoa_id = tp2.tppessoa_id 
where u2.endereco like 'Avenida Beria%'


--Aula 59 - TRIM: TRIM, LTRIM, BTRIM - Como utilizar?
-- Função trim é para remover caracter de uma string.
select trim('frase, frase2, frase3, ', ', ')

select ltrim('frase, frase2, frase3, ', ', ')

select rtrim('frase, frase2, frase3, ', ', ')

select btrim('frase, frase2, frase3, ', ', ')

-- Exemplo com as tabelas usando 'trim'
select *
from cardapio c 

select trim(c.nome, 'Cl'), c.* 
from cardapio c 

select ltrim(c.nome, 'C'), c.* 
from cardapio c 

select rtrim(c.nome, 'l'), c.* 
from cardapio c 

select btrim(c.nome, 'Cl'), c.* 
from cardapio c 

select trim(c.nome, 'c'), c.* 
from cardapio c 


-- Aula 60 - LPAD -RPAD - Como utilizar?
-- Completa o tamanho total de caracteres de uma string, lado esquerdo ou direito.
select  lpad('Udemy Banco de Dados', 50, '*') 

select  rpad('Udemy Banco de Dados', 50, 'x') 


-- Aula 61 - SUBSTR - Como utilizar?
-- Remove um conjunto de string determinado, retorna caracteres desejados
select substr('Jonathan', 1, 3) 

select substr('Jonathan', 3, 3) 


-- Aula 62 - SUBQUERY - Fundamentos
-- Sub  consulta - Aula teórica.
-- Subselect: instrução de sql, detro de outra instrução sql.


-- Aula 63 - SUBQUERY - Como utilizar na PROJEÇÃO, FROM e PREDICADO
-- Exemplo 1 - suqbquery
select u.*,
		(select c.comanda_id
			from comanda c,
				 pedido p 
			where c.dt_encerramento is not null
			and c.usuario_id = c.usuario_id
		)
from usuario u 

-- Exemplo 2 - suqbquery
select u.*,
		(select c.comanda_id
			from comanda c,
				 --pedido p 
			where c.dt_encerramento is not null
			--and c.usuario_id = c.usuario_id
			union 
			select c2.comanda_id
			from comanda c2
		)
from usuario u 
