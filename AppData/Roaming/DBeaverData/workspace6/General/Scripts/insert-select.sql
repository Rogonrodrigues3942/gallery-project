/*Populando tabelas - página 46 */

insert into weather values('San Francisco', 46, 50, 0.25, '1994-11-27');
insert into weather values('San Francisco', 06, 10, 0.55, '1994-11-27');

select * from weather w 

insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-29', 'Hayward', 54, 37, 0.66);

insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-30', 'São Paulo', 60, 47, 0.61);

insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-20', 'Manaus', 74, 37, 0.66);
insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-21', 'Manaus', 74, 37, 0.66);
insert into weather (date, city, temp_hi, temp_lo, precp)
values('1994-11-20', 'Manaus', 84, 37, 0.66);

insert into weather (date, city, temp_hi, temp_lo)
values('1994-11-29', 'Hayward', 54, 37);

insert into weather (date, city, temp_hi, temp_lo)
values('1994-11-30', 'Hayward', 54, 37);
insert into weather (date, city, temp_hi, temp_lo)
values('1994-11-01', 'Hayward', 54, 37);


--Selcionando colunas e organizando com ORDER BY
select * from weather w 
where precp notnull 
order by city