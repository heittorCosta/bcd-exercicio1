create database escola;

use escola;

create table turma (
	turmaID bigint auto_increment not null,
    nome varchar(30) not null , 
    periodo enum("Manha", "Tarde", "Noite"),
    primary key(turmaID)
);

create table curso (
	cursoID bigint auto_increment not null,
    nome varchar(30) not null,
    turmaID bigint not null,
    primary key(cursoID),
    foreign key (turmaID) references turma(turmaID)
);

create table itens (
	itemID bigint auto_increment not null,
    item varchar(200) not null,
    primary key(itemID)
);

create table registros(
	registroID bigint auto_increment not null,
    itemID bigint not null,
    aluno varchar(30) null,
    nivel_satisfacao enum("Ruim", "Regular", "Bom", "Otimo", "NA"),
    nivel_importacia enum("Alta", "Media", "Baixa"),
    cursoID bigint not null,
    primary key (registroID),
    foreign key(cursoID) references curso(cursoID)
);

create table observacoes (
	observacaoID bigint auto_increment not null,
    observacao text null,
    registroID bigint not null,
    primary key(observacaoID),
    foreign key(registroID) references registros(registroID)
);

insert into turma (nome, periodo) values ("A", "Manha"), ("A", "Tarde"), ("A", "Noite"), ("B", "Manha"), ("B", "Tarde"), ("B", "Noite"), ("C", "Manha"), ("C", "Tarde"), ("C", "Noite");

insert into curso (nome, turmaID) values ("Desenvolvimento de Sistemas", 3), ("Desenvolvimento de Sistemas", 6), ("Desenvolvimento de Sistemas", 9), ("Mecanica", 1), ("Mecanica", 4), ("Mecanica", 7), ("Mecatrônica", 2), ("Mecatrônica", 5), ("Mecatrônica", 8), ("Eletrônica", 1), ("Eletrônica", 5), ("Eletrônica", 9);

insert into itens (item) values ("Limpeza e conservação da sala de aula e da oficina"), ("Disponibilidade de ferramentas, máquinas e ferramentas para realização do curso"), ("Qualidade de apostilas, livros e textos, quanto a impressão e a adequação da informação"), ("Cumprimento dos horários das aulas"), ("Cumprimento dos objetivos propostos para o curso"), ("Preocupação dos docentes com o aproveitamento dos alunos"), ("Dominio dos docentes sobre os assuntos tratados"), ("O aprendizado na teoria e na prática em relação ao esperado"), ("Conteudo do curso em relação as expectativas"), ("Atendimento da recepção/secretaria da escola"), ("Atendimento telefonico da escola"),("Atendimento da cantina"),("Atendimento da biblioteca");

insert into registros(itemID, aluno, nivel_satisfacao, nivel_importacia, cursoID) values(1, "Heittor", "Bom", "Alta", 1),(2, "Heittor", "Bom", "Baixa", 1), (3, "Heittor", "Ruim", "Alta", 1), (4, "Heittor", "Bom", "Media", 1), (5, "Heittor", "Bom", "Alta", 1), (6, "Heittor", "Regular", "Baixa", 1), (7, "Heittor", "Bom", "Alta", 1), (8, "Heittor", "Bom", "Alta", 1), (9, "Heittor", "Bom", "Alta", 1), (10, "Heittor", "Bom", "Alta", 1), (11, "Heittor", "Otimo", "Alta", 1), (12, "Heittor", "Ruim", "Baixa", 1), (13, "Heittor", "Bom", "Alta", 1),
																						(1, "Daniel", "Otimo", "Media", 7),(2, "Daniel", "Otimo", "Media", 7), (3, "Daniel", "Otimo", "Media", 7), (4, "Daniel", "Otimo", "Media", 7), (5, "Daniel", "Otimo", "Media", 7), (6, "Daniel", "Otimo", "Media", 7), (7, "Daniel", "Otimo", "Alta", 7), (8, "Daniel", "Otimo", "Alta", 7), (9, "Daniel", "Bom", "Alta", 7), (10, "Daniel", "Bom", "Alta", 7), (11, "Daniel", "Otimo", "Alta", 7), (12, "Daniel", "Ruim", "Baixa", 7), (13, "Daniel", "Bom", "Alta", 7),
                                                                                        (1, "Lucas", "Otimo", "Media", 10),(2, "Lucas", "Otimo", "Media", 10), (3, "Lucas", "Otimo", "Media", 10), (4, "Lucas", "Otimo", "Media", 10), (5, "Lucas", "Otimo", "Media", 10), (6, "Lucas", "Otimo", "Media", 10), (7, "Lucas", "Otimo", "Alta", 10), (8, "Lucas", "Otimo", "Alta", 10), (9, "Lucas", "Bom", "Alta", 10), (10, "Lucas", "Bom", "Alta", 10), (11, "Lucas", "Otimo", "Alta", 10), (12, "Lucas", "Ruim", "Baixa", 10), (13, "Lucas", "Bom", "Alta", 10),
                                                                                        (1, "Sabrina", "Otimo", "Media", 4),(2, "Sabrina", "Otimo", "Media", 4), (3, "Sabrina", "Otimo", "Media", 4), (4, "Sabrina", "Otimo", "Media", 4), (5, "Sabrina", "Otimo", "Media", 4), (6, "Sabrina", "Ruim", "Media", 4), (7, "Sabrina", "Otimo", "Baixa", 4), (8, "Sabrina", "Otimo", "Baixa", 4), (9, "Sabrina", "Ruim", "Baixa", 4), (10, "Sabrina", "Ruim", "Baixa", 4), (11, "Sabrina", "Ruim", "Baixa", 4), (12, "Sabrina", "Ruim", "Baixa", 4), (13, "Sabrina", "Ruim", "Baixa", 4),
                                                                                        (1, "Paulo", "Bom", "Alta", 12),(2, "Paulo", "Bom", "Baixa", 12), (3, "Paulo", "Ruim", "Alta", 12), (4, "Paulo", "Bom", "Media", 12), (5, "Paulo", "Bom", "Alta", 12), (6, "Paulo", "Regular", "Baixa", 12), (7, "Paulo", "Bom", "Alta", 12), (8, "Paulo", "Bom", "Alta", 12), (9, "Paulo", "Bom", "Alta", 12), (10, "Paulo", "Bom", "Alta", 12), (11, "Paulo", "Otimo", "Alta", 12), (12, "Paulo", "Ruim", "Baixa", 12), (13, "Paulo", "Bom", "Alta", 12),
																						(1, "Camila", "Otimo", "Media", 7),(2, "Camila", "Otimo", "Media", 7), (3, "Camila", "Otimo", "Media", 7), (4, "Camila", "Otimo", "Media", 7), (5, "Camila", "Otimo", "Media", 7), (6, "Camila", "Otimo", "Media", 7), (7, "Camila", "Otimo", "Alta", 7), (8, "Camila", "Otimo", "Alta", 7), (9, "Camila", "Bom", "Alta", 7), (10, "Camila", "Bom", "Alta", 7), (11, "Camila", "Otimo", "Alta", 7), (12, "Camila", "Ruim", "Baixa", 7), (13, "Camila", "Bom", "Alta", 7),
                                                                                        (1, "Luana", "Otimo", "Media", 10),(2, "Luana", "Otimo", "Media", 10), (3, "Luana", "Otimo", "Media", 10), (4, "Luana", "Otimo", "Media", 10), (5, "Luana", "Otimo", "Media", 10), (6, "Luana", "Otimo", "Media", 10), (7, "Luana", "Otimo", "Alta", 10), (8, "Luana", "Otimo", "Alta", 10), (9, "Luana", "Bom", "Alta", 10), (10, "Luana", "Bom", "Alta", 10), (11, "Luana", "Otimo", "Alta", 10), (12, "Luana", "Ruim", "Baixa", 10), (13, "Luana", "Bom", "Alta", 10),
                                                                                        (1, "Tulio", "Otimo", "Media", 4),(2, "Tulio", "Otimo", "Media", 4), (3, "Tulio", "Otimo", "Media", 4), (4, "Tulio", "Otimo", "Media", 4), (5, "Tulio", "Otimo", "Media", 4), (6, "Tulio", "Ruim", "Media", 4), (7, "Tulio", "Otimo", "Baixa", 4), (8, "Tulio", "Otimo", "Baixa", 4), (9, "Tulio", "Ruim", "Baixa", 4), (10, "Tulio", "Ruim", "Baixa", 4), (11, "Tulio", "Ruim", "Baixa", 4), (12, "Tulio", "Ruim", "Baixa", 4), (13, "Tulio", "Ruim", "Baixa", 4)
                                                                                        (1, "Paty", "Bom", "Alta", 1),(2, "Paty", "Bom", "Baixa", 1), (3, "Paty", "Ruim", "Alta", 1), (4, "Paty", "Bom", "Media", 1), (5, "Paty", "Bom", "Alta", 1), (6, "Paty", "Regular", "Baixa", 1), (7, "Paty", "Bom", "Alta", 1), (8, "Paty", "Bom", "Alta", 1), (9, "Paty", "Bom", "Alta", 1), (10, "Paty", "Bom", "Alta", 1), (11, "Paty", "Otimo", "Alta", 1), (12, "Paty", "Ruim", "Baixa", 1), (13, "Paty", "Bom", "Alta", 1),
																						(1, "Daniel", "Otimo", "Media", 7),(2, "Daniel", "Otimo", "Media", 7), (3, "Daniel", "Otimo", "Media", 7), (4, "Daniel", "Otimo", "Media", 7), (5, "Daniel", "Otimo", "Media", 7), (6, "Daniel", "Otimo", "Media", 7), (7, "Daniel", "Otimo", "Alta", 7), (8, "Daniel", "Otimo", "Alta", 7), (9, "Daniel", "Bom", "Alta", 7), (10, "Daniel", "Bom", "Alta", 7), (11, "Daniel", "Otimo", "Alta", 7), (12, "Daniel", "Ruim", "Baixa", 7), (13, "Daniel", "Bom", "Alta", 7),
                                                                                        (1, "Lucas", "Otimo", "Media", 10),(2, "Lucas", "Otimo", "Media", 10), (3, "Lucas", "Otimo", "Media", 10), (4, "Lucas", "Otimo", "Media", 10), (5, "Lucas", "Otimo", "Media", 10), (6, "Lucas", "Otimo", "Media", 10), (7, "Lucas", "Otimo", "Alta", 10), (8, "Lucas", "Otimo", "Alta", 10), (9, "Lucas", "Bom", "Alta", 10), (10, "Lucas", "Bom", "Alta", 10), (11, "Lucas", "Otimo", "Alta", 10), (12, "Lucas", "Ruim", "Baixa", 10), (13, "Lucas", "Bom", "Alta", 10),
                                                                                        (1, "Sabrina", "Otimo", "Media", 4),(2, "Sabrina", "Otimo", "Media", 4), (3, "Sabrina", "Otimo", "Media", 4), (4, "Sabrina", "Otimo", "Media", 4), (5, "Sabrina", "Otimo", "Media", 4), (6, "Sabrina", "Ruim", "Media", 4), (7, "Sabrina", "Otimo", "Baixa", 4), (8, "Sabrina", "Otimo", "Baixa", 4), (9, "Sabrina", "Ruim", "Baixa", 4), (10, "Sabrina", "Ruim", "Baixa", 4), (11, "Sabrina", "Ruim", "Baixa", 4), (12, "Sabrina", "Ruim", "Baixa", 4), (13, "Sabrina", "Ruim", "Baixa", 4),
                                                                                        (1, "Paulo", "Bom", "Alta", 12),(2, "Paulo", "Bom", "Baixa", 12), (3, "Paulo", "Ruim", "Alta", 12), (4, "Paulo", "Bom", "Media", 12), (5, "Paulo", "Bom", "Alta", 12), (6, "Paulo", "Regular", "Baixa", 12), (7, "Paulo", "Bom", "Alta", 12), (8, "Paulo", "Bom", "Alta", 12), (9, "Paulo", "Bom", "Alta", 12), (10, "Paulo", "Bom", "Alta", 12), (11, "Paulo", "Otimo", "Alta", 12), (12, "Paulo", "Ruim", "Baixa", 12), (13, "Paulo", "Bom", "Alta", 12),
																						(1, "Camila", "Otimo", "Media", 7),(2, "Camila", "Otimo", "Media", 7), (3, "Camila", "Otimo", "Media", 7), (4, "Camila", "Otimo", "Media", 7), (5, "Camila", "Otimo", "Media", 7), (6, "Camila", "Otimo", "Media", 7), (7, "Camila", "Otimo", "Alta", 7), (8, "Camila", "Otimo", "Alta", 7), (9, "Camila", "Bom", "Alta", 7), (10, "Camila", "Bom", "Alta", 7), (11, "Camila", "Otimo", "Alta", 7), (12, "Camila", "Ruim", "Baixa", 7), (13, "Camila", "Bom", "Alta", 7),
                                                                                        (1, "Luana", "Otimo", "Media", 10),(2, "Luana", "Otimo", "Media", 10), (3, "Luana", "Otimo", "Media", 10), (4, "Luana", "Otimo", "Media", 10), (5, "Luana", "Otimo", "Media", 10), (6, "Luana", "Otimo", "Media", 10), (7, "Luana", "Otimo", "Alta", 10), (8, "Luana", "Otimo", "Alta", 10), (9, "Luana", "Bom", "Alta", 10), (10, "Luana", "Bom", "Alta", 10), (11, "Luana", "Otimo", "Alta", 10), (12, "Luana", "Ruim", "Baixa", 10), (13, "Luana", "Bom", "Alta", 10),
                                                                                        (1, "Tulio", "Otimo", "Media", 4),(2, "Tulio", "Otimo", "Media", 4), (3, "Tulio", "Otimo", "Media", 4), (4, "Tulio", "Otimo", "Media", 4), (5, "Tulio", "Otimo", "Media", 4), (6, "Tulio", "Ruim", "Media", 4), (7, "Tulio", "Otimo", "Baixa", 4), (8, "Tulio", "Otimo", "Baixa", 4), (9, "Tulio", "Ruim", "Baixa", 4), (10, "Tulio", "Ruim", "Baixa", 4), (11, "Tulio", "Ruim", "Baixa", 4), (12, "Tulio", "Ruim", "Baixa", 4), (13, "Tulio", "Ruim", "Baixa", 4);

select * from registros;