-- Revisão - pág. 234 - 05/11/2026 --> Alteração de Heading
-- O SQL permite que apresente  a saída de um SELECT com cabecalhos de colunas personalizado pelo operador/analista.
-- Usando a técnica de aliases


-- Exemplo 1) Tabela: cliente

select 	c.nome_cliente as "Nome",
		c.cnpj_cliente as "CNPJ",
		c.ie_cliente as "Incrição Estadual"
from cliente c 


-- Exemplo 2) Tabela:item_de_pedido: sem utilização da cláusula "AS".  

select 
		idp.numero_pedido "Nº Pedido",
		idp.codigo_produto "Cód. Produto",
		idp.quantidade_produto "Quantidade"
from item_de_pedido idp 


-- Exemplo 3) Tabela: pedido: sem utilizados de aspas duplas, retorna a pesquisa com low case (caixa baixa), todas as colunas com letras minúsculas.

select	numero_pedido pedido,
		prazo_entrega entrega,
		codigo_cliente cliente,
		codigo_vendedor vendedor
from pedido

-- Exemplo 4) Tabela:  produto

select	pr.codigo_produto as "Cód. Produto",
		pr.descricao_produto as "Descrição do Produto",
		pr.unidade_produto as "Unid. Produto",
		pr.valor_unitario_produto as "Valor Un. Produto"
from produto pr 


-- Exemplo 5) Tabela:  vendeddor 

select	vd.codigo_vendedor  "Cód. Vendedor",
		vd.nome_vendedor "Nome",
		vd.salario_fixo "Sal. Fixo",
		vd.faixa_comissao "Faixa Comissão"
from vendedor vd 
