-- COMANDOS PARA CRIAR BANCO DE DADOS
-- 1
create database hotel_stefany;
-- VERIFICAR BANCO E CRIAR
create database if not exists hotel_stefany;

-- ATIVAR BANCO DE DADOS
-- 2
use hotel_stefany;

-- TABELAS
-- 3
create table if not exists cadastro(
 id_cadastro int auto_increment primary key,
 nome varchar(60) not null unique,
 telefone varchar (15),
 convenio enum ('sim','não') default 'sim', -- SERVE PARA MULTIPLAS ESCOLHAS EXC: DEBITO, CREDITO,PIX...
 data_cadastro timestamp default current_timestamp
);

create table if not exists servicos(
id_servico int primary key,
nome_servico varchar(60) not null,
tipo_servico enum ('serviço quarto', 'frigobar', 'manutenção', 'limpeza') default 'serviço quarto',
preco decimal(5,2) default 0.00
);

-- VIZUALIZAR TABELAS
-- 4
show tables;


-- APAGAR BD
-- 5 EM CASOS DE NECESSIDADE OU CORREÇÃO
drop database hotel_stefany;
-- APAGAR TABELAS
drop tables cadastro;


-- COMANDOS PARA EXECUTAR CASO TENHA ESQUECIDO ALGO NAS TABELAS E JA TIVER DADO PLAY
-- INSERIR CAMPOS
alter table cadastro add email varchar(100);


-- ALTERAR TIPOS DE DADOS
alter table cadastro modify telefone int;


-- APAGAR COLUNA OU ATRIBUTO
alter table alunos drop column telefone;


-- RENOMEAR TABELAS
rename table cadastro to alunos; 


-- APAGAR DADOS DE UMA TABELA
truncate table alunos;


-- INSERINDO DADOS NA TABELA
insert into servicos  (id_servico, nome_servico, tipo_servico, preco) values (1, 'limpeza', 'frigobar', 35.00), (2, 'manutenção', 'limpeza', 45.00);

insert into servicos  (id_servico, nome_servico, tipo_servico, preco) values (3, 'limpeza', 'frigobar', 35.00), (4, 'manutenção', 'limpeza', 45.00);

insert into servicos (id_servico, nome_servico, tipo_servico, preco) values (5, 'limpeza', default, 50.00);


-- CONSULTAR DADOS DE UMA TABELA
-- select * from;

select * from servicos;

insert into tabela (campo1, campo2, campo...n) values(valor1,valor2,valor...n)

-- -------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXERCICIOS DESAFIOS
-- 1 CRIAR A TABELA E O INSERT DO ESTACIONAMENTO 

create table estacionamento (
 id_vagas int auto_increment primary key,
 placa varchar(10) not null unique,
 quantidade int,
 vagas_preferenciais int,
 veiculo varchar(30),
);

insert into estacionamento (id_vagas, placa, quantidade, vagas_preferenciais, veiculo) values ();


