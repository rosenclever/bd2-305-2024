--criar database

mysql -u root; 

create database expocanpbd;

use expocanpbd;

create table Salas(
    id int not null auto_increment,
    identifiacao varchar(50) not null,
    capacidade int not null,
    constraint Salas_pk primary key(id)
);

create table Atividades(
    id int not null auto_increment,
    nome varchar(100) not null,
    horario time not null,
    dataAtividade date not null,
    sala int not null,
    constraint Atividades_pk primary key(id),
    constraint sala_atividades_fk foreign key(sala) references Salas(id) 

);

create table Alunos(
    id int not null auto_increment,
    nome varchar(100) not null,
    turma varchar(50) not null,
    constraint Alunos_pk primary key(id)

);

create table Inscrever(
    aluno int not null,
    atividade int not null,
    constraint Inscrever_pk primary key(aluno, atividade),
    constraint Inscrever_aluno_fk foreign key(aluno) references Alunos(id),
    constraint Inscrever_atividade_fk foreign key(atividade) references Atividades(id)
);


-- CADASTRAR DADOS
INSERT INTO SALAS(identifiacao, capacidade) VALUES('LABORATORIO 2', 40);
INSERT INTO SALAS(identifiacao, capacidade) VALUES('SALA 14', 20), ('SALA 15', 17);

-- EXCLUIR SALAS 
DELETE FROM SALAS WHERE capacidade = 20 AND id = 3;
DELETE FROM SALAS WHERE capacidade = 17 AND id = 6;

--ATUALIZAR DADOS 
UPDATE SALAS SET capacidade = 10;