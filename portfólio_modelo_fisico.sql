create database dtb_sistema_faculdade;

use dtb_sistema_faculdade;

create table tbl_professores(
	id int not null auto_increment primary key,
    nome varchar(80) not null ,
    unique index(id)
);

create table tbl_cursos(
	id int not null auto_increment primary key,
    nome_curso varchar(45) not null,
    modalidade varchar(45), 
    unique index(id)
);

create table tbl_alunos(
	id int not null auto_increment primary key,
    nome varchar(80) not null,
    numero_matricula varchar(45) not null, 
    data_matricula date,
    id_curso int not null,
    
    constraint FK_aluno_curso
    foreign key (id_curso)
    references tbl_cursos(id),
    
    unique index(id)
);

create table tbl_endereco(
	id int not null auto_increment primary key,
    logradouro varchar(45),
    cep varchar(20),
    estado varchar(45) not null,
    id_aluno int not null,
    id_professor int not null,
    
    constraint FK_aluno_endereco
    foreign key (id_aluno)
    references tbl_alunos(id),
    
    constraint FK_professor_endereco
    foreign key (id_professor)
    references tbl_professores(id),
    
    unique index(id)
);

create table tbl_telefone(
	id int not null auto_increment primary key,
    numero_telefone varchar(45) not null,
    id_aluno int,
    id_professor int,
    
    constraint FK_aluno_telefone
    foreign key (id_aluno)
    references tbl_alunos(id),
    
    constraint FK_professor_telefone
    foreign key (id_professor)
    references tbl_professores(id),
    
    unique index(id)
);

alter table tbl_endereco CHANGE id_aluno id_aluno int;

create table tbl_materia(
	id int not null primary key auto_increment,
    nome_materia varchar(45) not null,
    carga_horaria int,
    id_professor int not null,
    
    constraint FK_professor_materia
    foreign key (id_professor)
    references tbl_professores(id),
    
    
    unique index(id)
);

create table tbl_materia_curso(
	id int not null auto_increment primary key,
    id_materia int not null,
    id_curso int not null,
    
    constraint FK_materia
    foreign key (id_materia)
    references tbl_materia(id),
    
     constraint FK_curso
    foreign key (id_curso)
    references tbl_cursos(id),
    
    unique index(id)
);

show tables;

select * from tbl_cursos; 
select * from tbl_professores;
select * from tbl_materia;
select * from tbl_alunos;
select * from tbl_endereco;
select * from tbl_telefone;
select * from tbl_materia_curso;




insert into tbl_cursos (nome_curso, modalidade) values ('Analise e desenvolvimento de sistemas', 'EAD e presencial'),
													('Nutrição', 'presencial'),
                                                    ('Educação física', 'hibrido'),
                                                    ('Medicina', 'presencial'),
                                                    ('Direito', 'presencial'),
                                                    ('História', 'EAD'),
                                                    ('Relações internacionais', 'EAD e presencial');
                                                    
insert into tbl_professores (nome) values ('Ricardo dos Santos'), ('Andreia Batista Amaral'), ('João Pedro Soares'), ('Gustavo Cardoso da Silva'), ('Joana Santos Silva');

insert into tbl_materia (nome_materia, carga_horaria, id_professor) values ('Cloud computing', 80, 1), ('Anatomia', 150, 5);

insert into tbl_materia_curso (id_materia, id_curso) values (1, 1), (2, 4), (2, 2), (2, 3);

insert into tbl_alunos (nome, numero_matricula, data_matricula, id_curso) values ('Joyce Amaral', 55845, '2024-01-12', 3), 
('Elisa Dantas', 8897, '2022-12-12', 1), ('Pedro dos Santos', 14399, '2023-11-29', 4) ;

insert into tbl_telefone (numero_telefone, id_professor) values ('(12)96732-7088', 1);

insert into tbl_endereco (logradouro, cep, estado, id_professor) values ('R: Joao alves Nº2', '11348-000', 'SP', 2);