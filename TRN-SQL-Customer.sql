select	codigo_cliente, 
		nome_cliente, 
		endereco_cliente, 
		cidade_cliente, 
		cep_cliente, 
		uf_cliente, 
		cnpj_cliente, 
		ie_cliente
FROM 	cliente

--Inserção de dados na tabela cliente. 02/09/2026
insert into cliente 
(	codigo_cliente, 
	nome_cliente, 
	endereco_cliente, 
	cidade_cliente, 
	cep_cliente, 
	uf_cliente, 
	cnpj_cliente, ie_cliente
)
values(720, 'Ana',  'Rua 17 nº 19', 'Niteroi', '24358310', 'RJ', '12113231000134',  '2134');
values(870, 'Flávio', 'Av. Pres. Varga 10', 'São Paulo', '02763931', 'SP', '22534126938790',  '4631');
values(110, 'Jorge', 'Rua Caiapo 13', 'Curitiba', '43078500', 'PR', '14512764983409', '1111');
values(222, 'Lúcia', 'Rua Itabira nª 123 Loja 09', 'Belo Horizonte', '32124391', 'MG', '28315213934888', '2985');
values(830, 'Maurício',  'Av. Paulista 1236 sala 2345', 'São Paulo', '03012683', 'SP', '32816985746561', '9343');
values(130, 'Edmar',  	  'Rua da Praia s/n', 'Salvador', 		'71079300', 'BA', '23463284123479', '7121');
values(410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '21789000', 'SP', '32816985746561', '9343');
values(20, 'Beth',  'Av. Climério nº 45', 'São Paulo', '02576930', 'SP', '32845126732687', '9280');
values(157, 'Paulo',  'Trav. Moraes casa 3', 'Londrina', '45999000', 'PR', '32848126324633', '1923');
values(180, 'Lívio',  'Av. Beira Mar nº 1256', 'Florianópolis', '47322559', 'SC', '12736571234704', '2222');
values(260, 'Susana',  'Rua Lopes Mendes nº 12', 'Niterói', '21046500', 'RJ', '21763571232979', '2530');
values(290, 'Renato',  'Rua Meireles nº 123 bloco 02 sala 345', 'São Paulo', '03225900', 'SP', '132765711231457', '1820');
values(390, 'Sebastião',  'Rua da Igreja  nº 10', 'Uberaba', '33576930', 'MG', '32176547213301', '9071');
values(234, 'José',  'Quadra 3 bloco 3 sala 1003', 'Brasília', 	'69841650', 'DF', '21763576123287', '2931');

select *
from cliente
