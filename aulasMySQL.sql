-- acesso ao SGBD
mysql -u root

-- listar os bancos de dados existentes
show databases;

-- criar o banco de dados exemploDB
create database exemploDB;

-- acessar o banco exemploDB
use exemploDB;

-- criar a tabela produtos
create table produtos(
    id int not null,
    nome varchar(100) not null,
    quantidade int not null,
    preco decimal(6,2),
    constraint produtos_pk primary key(id)
);

-- criar a tabela clientes
create table clientes(
    id int not null,
    nome varchar(150) not null,
    whatsapp varchar(150),
    email varchar(150),
    dataDeNascimento datetime not null,
    constraint clientes_pk primary key(id)
);

-- exclua a coluna quantidade da tabela produtos
alter table produtos
drop column quantidade;

-- verificar a estrutura da tabela
describe produtos;
ou
desc produtos;

-- exclua a coluna whatsapp da tabela clientes e verifique sua nova estrutura
alter table clientes
drop column whatsapp;
desc clientes;

alter table clientes
add whatsapp char(14);

alter table produtos
add quantidade int default 1;

-- evitar valores duplicados em uma determinada coluna
alter table clientes
add constraint clientes_email_uq unique(email);

-- não deve ser possível informar o mesmo número de whatsapp para diferentes clientes
alter table clientes
add constraint clientes_whatsapp_uq unique(whatsapp);

-- não deverá permitir que a quantidade de produtos fique negativa
alter table produtos
add constraint produtos_quantidade_ck
    check(quantidade >= 0);

create table categorias(
    id integer not null auto_increment,
    nome varchar(100) not null,
    constraint categorias_pk
        primary key(id)
);

alter table produtos
add categoria int not null;

alter table produtos
add constraint categorias_produtos_fk
    foreign key(categoria)
    references categorias(id);

create table funcionarios(
    id int not null,
    constraint funcionarios_pk primary key(id),
    matricula int not null,
    nome varchar(150) not null
);

create table vendas(
    numero int not null auto_increment,
    constraint vendas_pk primary key(numero),
    data datetime not null,
    cliente int not null,
    funcionario int,
    constraint vendas_clientes_fk
        foreign key(cliente)
        references clientes(id),
    constraint vendas_funcionarios_fk
        foreign key(funcionario)
        references funcionarios(id)
);
