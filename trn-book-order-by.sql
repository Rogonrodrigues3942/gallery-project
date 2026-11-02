-- Pages: 243, 244, 245 and 246.
-- F) Ordenação dos dados selecionados
-- A cláusula " ORDER BY " tem a função de ordanação dos dados selecionados.

--Sintaxe básica:
-- SELECT < none(s) da(s) colunas(s) >
-- FROM   < tabela(s) >
-- WHERE  < condição (ões) >
-- ORDER BY < nome(s) da(s) coluna(s) >  [ ASC | DESC ]
-- ou
-- ORDER BY < número da clouna >


-- Exemplo 1:
-- Mostrar em ordem alfabética a lista de vendedores e seus respectivos salários fixos.

select	nome_vendedor,
		salario_fixo
from vendedor
order by nome_vendedor 


-- Exemplo 2:
-- Mostrar em ordem alfabética a lista de vendedores e seus respectivos salários fixos.

select	nome_vendedor,
		salario_fixo
from vendedor
order by nome_vendedor DESC


-- Exemplo 3:
-- Mostrar em ordem ascendente a lista de salários e seus respectivos vendedores.
select  salario_fixo,
		nome_vendedor
from vendedor
order by salario_fixo ASC
	


-- Exemplo 4:
-- Mostrar em ordem descendente a lista de salários e seus respectivos vendedores.
select 	salario_fixo,
		nome_vendedor
from vendedor
order by salario_fixo DESC


-- Exemplo 5:
-- Listar os nomes, cidades e estados de todos os clientes, ordenados por estado e cidade de forma descendente.
-- Neste exemplo a cláusula tem mais de uma coluna.
select 	nome_cliente, 
		cidade_cliente,
		uf_cliente  
from cliente
order by uf_cliente, cidade_cliente DESC  


-- Exemplo 6:
-- Listar os nomes, cidades e estados de todos os clientes, ordenados por estado e cidade de forma ascendente.
-- Neste exemplo a cláusula tem mais de uma coluna. A primeira coluna será a base para ordenação.
select 	nome_cliente, 
		cidade_cliente,
		uf_cliente  
from cliente
order by uf_cliente, cidade_cliente ASC  






