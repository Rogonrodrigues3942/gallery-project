
-- Inserindo dados na tabela "pedidos".
insert into pedido 
(numero_pedido, prazo_entrega, codigo_cliente, codigo_vendedor)
values(121, 20, 410, 209);
values(97, 20, 720, 101);
values(101, 15, 720, 101);
values(137, 20, 720, 720);
values(148, 20, 720, 101);
values(189, 15, 870, 213);
values(104, 30, 110, 101);
values(203, 30, 830, 250);
values(98, 20, 410, 209);
values(143, 20, 20, 111);
values(105, 15, 180, 240);
values(111, 20, 260, 240);
values(103, 20, 20, 11);
values(91, 20, 260, 11);
values(138, 20, 260, 11);
values(108, 15, 290, 310);
values(119, 30, 390, 250);
values(127, 10, 410, 11);

-- Verificando se os itens foram inseridos na tabela "pedido".
select *
from pedido p 