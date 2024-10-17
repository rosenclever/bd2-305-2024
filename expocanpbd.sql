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

-- insira 3 alunos no sistema, sendo cada aluno de uma turma diferente e com um m�todo de inser��o diferente entre si
insert into alunos values(1, 'Fulano de Tal', '105');
insert into alunos(nome, turma) values('Fulana de Tal', '205');
insert into alunos(turma, nome) values('305', 'Veterano Fera');

-- liste o nome de todos os alunos da turma 305
select nome
from alunos
where turma = '305';

-- liste o nome e a turma correspondente aos alunos cuja turma termine com o n�mero 5
select nome, turma
from alunos
where turma like '%5';

-- modifique o nome do aluno da turma 305 para seu nome
update alunos 
set nome = 'Seu nome'
where turma = '305';

-- exclua todos os alunos cujo nome inicie com a letra F
delete from alunos
where nome like 'F%';

-- modifique a tabela aluno para que possua a coluna email, sendo que n�o ser� permitido o cadastro de emails iguais para diferentes alunos
ALTER TABLE Alunos
ADD EMAIL VARCHAR(50);
ALTER TABLE Alunos
ADD CONSTRAINT ALUNO_UQ UNIQUE(EMAIL);
-- Modifique o email do aluno SeuNome para seunome@seuemail.com
update alunos
set email = 'senome@seuemail.com'
where nome = 'seunome';
-- adicione 3 novos alunos na tabela alunos e pertencentes a turma do aluno SeuNome e um outro pertence a uma turma diferente
insert into alunos(nome, turma, email)
values('João', '305', 'joão@mail.com'),
('cineli', '205', 'cinele@gmail.com'),
('cleiton', '305', 'cleiton@gmail.com');

-- liste o total de alunos cadastrados
select count(*) as "total de alunos"
from alunos;

-- informe o total de alunos por tura
select turma, count(*) as "total de alunos"
from alunos;

select turma, count(*) as "total de alunos"
from alunos
group by turma;

--adicione os seguintes alunos
insert into alunos(nome, turma, email)
values('peter', '301', 'aranha@mail.com'),
('lais', '301', 'croft@mail.com'),
('louis', '205', 'lane@mail.com'),
('clark', '305', 'kent@mail.com'),
('tanus', '201', 'dedo@mail.com');

-- liste as turmas e seu quantitativo de alunos. Apresente apenas as turmas que possuem mais de 1 aluno cadastrado
select turma, count(*)
from alunos
group by turma
having count(*) > 1;

-- Liste o total de alunos por turma. Considere aprenas as turmas de terceiro ano e que possuem mais de um aluno cadastrado.
select turma, count(*)
from alunos
where turma like '3%'
group by turma
having count(*) > 1;