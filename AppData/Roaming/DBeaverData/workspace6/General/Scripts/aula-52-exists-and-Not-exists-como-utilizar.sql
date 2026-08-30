-- Aula-52 - Exists and Not Exists - Como utilizar

select * from usuario u 


-- Case 1 - aplicando cláusula EXISTS
select * from usuario u 
where exists ( select 1
				from comanda c2
				where c2.usuario_id  = u.usuario_id )

				
-- Case 2 - aplicando cláusula NOT EXISTS
select * from usuario u 
where not exists ( select 1
				from comanda c2
				where c2.usuario_id  = u.usuario_id
				and exists(select 1 from usuario u2
										, tipo_pessoa tp 
							where u2.usuario_id = c2.usuario_id
							and u2.tppessoa_id = tp.tppessoa_id
							and tp.tppessoa_id = 2
							)
				)