-- E.6) Operadores baseados em valores desconhecidos: "IS NULL" e "IS NOT NULL"
--			WHERE <nome da coluna> IS NULL;
--			WHERE <nome da coluna> IS NOT NULL;

-- O resultado da aplicação desses operadores permite o tratamento de valores nulos em colunas de uma tabela, selecionando as linhas correspondentes.

-- Exemplo 1: Mostrar os clientes que não tenham inscrição estadual.
select *
from cliente c 
where c.ie_cliente is null

-- Exemplo 2: Mostrar os clientes que não tenham inscrição estadual.
select *
from cliente c 
where c.ie_cliente is not null

-- Exemplo 3: Trabalhando com consulta a cidade do cliente.
select *
from cliente c 
where c.cidade_cliente is null 
