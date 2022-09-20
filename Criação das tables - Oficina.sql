-- criação do banco de dados para oficina mecânica

create database oficina;

use oficina;

create table cliente (
idCliente int primary key auto_increment,
nomecliente varchar(255),
CPF char(11),
constraint unique_cpf_client unique (CPF)
);

create table veiculo(
idveiculo int primary key auto_increment,
idveiculocliente int,
marcaveiculo varchar(255),
modeloveiculo varchar(255),
anoveiculo char(4),
constraint fk_veiculo_cliente foreign key (idveiculocliente) references cliente (idcliente)
);

create table mecanico (
idmecanico int primary key auto_increment,
idmecanicoveiculo int,
nomemecanico varchar(255),
enderecomecanico varchar(255),
constraint fk_mecanico_veiculo foreign key (idmecanicoveiculo) references veiculo (idveiculo)
);

drop table tiposervico;
create table tiposervico(
idtiposervico int,
descricaoservico varchar(255) not null,
idTSmecanico int,
idTSveiculo int,
primary key (idtiposervico, idTSmecanico, idTSveiculo),
constraint fk_tiposervico_mecanico foreign key (idTSmecanico) references mecanico (idmecanico),
constraint fk_tiposervico_veiculo foreign key (idTSveiculo) references veiculo (idveiculo)
);

drop table maodeobra;
create table maodeobra(
idmaodeobra int,
idMtiposervico int,
valormo float,
primary key (idmaodeobra, idMtiposervico),
constraint fk_maodeobra_tiposervico foreign key(idMtiposervico) references tiposervico (idtiposervico)
);

drop table orders;
create table orders(
idorder int,
idOmaodeobra int,
idOmecanico int,
idOveiculo int,
idOcliente int,
dataemissao date not null,
dataconclusao date not null,
statusorder enum('Em andamento', 'Concluído') default 'Em andamento',
valororder float,
primary key (idorder, idOmaodeobra, idOmecanico, idOveiculo, idOcliente),
constraint fk_orders_maodeobra foreign key (idOmaodeobra) references maodeobra (idmaodeobra),
constraint fk_orders_mecanico foreign key (idOmecanico) references mecanico (idmecanico),
constraint fk_orders_veiculo foreign key (idOveiculo) references veiculo (idveiculo),
constraint fk_orders_cliente foreign key (idOcliente) references cliente (idcliente)
);








