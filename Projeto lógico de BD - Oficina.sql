-- inserção de dados e queries

use oficina;

show tables;

insert into cliente (nomecliente, CPF) values ('Bia', '123456789'),
 ('Miguel', '9873626293'), ('Gustavo', '73436382937'), ('Joana', '9827364728');
 
 select * from cliente;
 
 insert into veiculo (idveiculocliente, marcaveiculo, modeloveiculo, anoveiculo) values (5, 'Renault', 'Sandero', '2010'),
 (6, 'Fiat', 'Uno', '2011'), (7, 'Chevrolet', 'Onix', '2013'), (8, 'hyunday', 'Creta', '2020');
 
 select * from veiculo;
 
 insert into mecanico (idmecanicoveiculo, nomemecanico, enderecomecanico) values (5, 'Osvaldo', 'Rua do osvaldo, 1250 - São Paulo'),
 (7, 'Geisa', 'Rua da Geisa 1111 - Rio de Janeiro'), (8, 'Gabriel', 'Rua do Gabriel,  2222-  Minas Gerais'),
 (6, 'Antonela', 'Rua da Antonela, 333 - Natal');
 
 select * from mecanico;
 
 insert into tiposervico (idtiposervico, descricaoservico, idTSmecanico, idTSveiculo) values
 (1, 'Revisão', 7, 8),
 (2, 'Conserto', 8, 6),
 (3, 'Conserto', 6, 7),
 (4, 'Revisao', 5, 5);
 
 select * from tiposervico;
 
 insert into maodeobra (idmaodeobra, idMtiposervico, valormo) values
 (1, 4, 500.00),
 (2, 3, 200.00),
 (3, 2, 100.00),
 (4, 1, 75.00);
 
 select * from maodeobra;
 
 insert into orders (idOmaodeobra, idOmecanico, idOveiculo, idOcliente, dataemissao, dataconclusao, statusorder) values
 (4,7,5,8, '2022-09-19', '2022-09-19', default),
 (3,5,7,6, '2021-08-21', '2021-08-25', 'Concluído'),
 (2,8,6,7, '2022-09-19', '2022-10-01', default),
 (1,6,8,5, '2022-01-05', '2022-01-06', 'Concluído');
 
 select * from orders;
 
 select count(*) from orders;
 select * from cliente c, orders o where c.idcliente = idOcliente;
 select * from cliente c, veiculo v where c.idcliente = idveiculocliente;
 
select v.idveiculo, marcaveiculo, modeloveiculo, count(*) as Numero_de_Ordens from veiculo v
inner join orders o ON v.idveiculo = o.idOveiculo
Group by idveiculo;

 select * from cliente c, veiculo v where c.idcliente = idveiculocliente;
 select * from tiposervico t, maodeobra m where t.idtiposervico = idMtiposervico;
 select * from maodeobra m, orders o where m.idmaodeobra = idOmaodeobra
 Group by idmaodeobra
 having sum(valormo) >100
 order by valormo;
 




 
 
 