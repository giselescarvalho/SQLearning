create schema Revenda;
-- create database Revenda;

use Revenda;
create table Filial (
codigoFi int(10) not null auto_increment, 
nomeF varchar(80) not null comment 'nome unidade filial', 
enderecoF varchar(80) not null comment 'endereço unidade filial', 
telefoneF varchar(15) comment 'telefone unidade filial',
constraint pk_Filial primary key (codigoFi)
);

-- ===============================================================
create table Veiculo (
placa varchar(7) not null comment 'identificador placa veículo', 
ano int(4) not null comment 'ano modelo veículo',
modelo varchar(80) not null,
cor varchar(15) not null,
chassi varchar(17) not null comment 'sequencia unica de caracteres, simbolos e numeros de um veiculo',
combustivel varchar(15) not null,
codigoFi int(10) not null,
nome varchar(15) not null,
constraint pk_Veiculo primary key (placa),
constraint fk_Veiculo_codigoFi foreign key (codigoFi) references Filial (codigoFi)
);

-- ================================================================
create table Fabricante (
codigoFa int(10) not null,
nome varchar(15) not null,
placa varchar(7) not null,
constraint pk_Fabricante primary key (codigoFa),
constraint fk_Fabricante_placa foreign key (placa) references Veiculo(placa)
);

-- ================================================================
alter table Veiculo
add constraint fk_Veiculo_nome
foreign key (nome)
references Fabricante (nome);