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

-- =========================================================================
-- FASE 1 - DDL: ESTRUTURA E RESTRICOES
-- =========================================================================

-- 1. CRIAR E SELECIONAR O BANCO
CREATE DATABASE IF NOT EXISTS RETROGAME_RECUPERACAO;
USE RETROGAME_RECUPERACAO;

-- 2. TABELA CLIENTE (RN01, RN02)
CREATE TABLE CLIENTE (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20) NULL,
    ATIVO BOOLEAN DEFAULT TRUE
);

-- 3. PLATAFORMA E CATEGORIA (RN03, RN04)
CREATE TABLE PLATAFORMA (
    ID_PLATAFORMA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(80) NOT NULL UNIQUE
);

-- 4. TABELA JOGO (RN05, RN06)
CREATE TABLE JOGO (
    ID_JOGO INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(150) NOT NULL,
    CODIGO VARCHAR(15) NOT NULL UNIQUE,
    ANO_LANCAMENTO INT NOT NULL,
    QUANTIDADE_DISPONIVEL INT DEFAULT 0 CHECK (QUANTIDADE_DISPONIVEL >= 0),
    ID_PLATAFORMA INT NOT NULL,
    ID_CATEGORIA INT NOT NULL,
    CONSTRAINT FK_JOGO_PLATAFORMA FOREIGN KEY (ID_PLATAFORMA) REFERENCES PLATAFORMA(ID_PLATAFORMA) ON DELETE RESTRICT,
    CONSTRAINT FK_JOGO_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA) ON DELETE RESTRICT
);

-- 5. TABELA LOCACAO (RN07, RN08, RN11)
CREATE TABLE LOCACAO (
    ID_LOCACAO INT PRIMARY KEY AUTO_INCREMENT,
    DATA_RETIRADA DATETIME DEFAULT CURRENT_TIMESTAMP,
    DATA_PREVISTA DATE NOT NULL,
    DATA_DEVOLUCAO DATE NULL,
    STATUS_LOCACAO VARCHAR(20) DEFAULT 'ABERTA' CHECK (STATUS_LOCACAO IN ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    ID_CLIENTE INT NOT NULL,
    ID_JOGO INT NOT NULL,
    CONSTRAINT FK_LOCACAO_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE) ON DELETE RESTRICT,
    CONSTRAINT FK_LOCACAO_JOGO FOREIGN KEY (ID_JOGO) REFERENCES JOGO(ID_JOGO) ON DELETE RESTRICT
);

-- 6. ALTER TABLE
ALTER TABLE JOGO ADD COLUMN DESENVOLVEDORA VARCHAR(100);


-- =========================================================================
-- FASE 2 - DML: MANIPULACAO DE DADOS
-- =========================================================================

-- 7. INSERIR CLIENTES (MINIMO 4, UM COM TELEFONE NULL)
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE) VALUES
('CARLOS EDUARDO SILVA', 'CARLOS.SILVA@EMAIL.COM', '11987654321'),
('MARIANA OLIVEIRA SANTOS', 'MARIANA.SANTOS@EMAIL.COM', '19991234567'),
('PEDRO HENRIQUE COSTA', 'PEDRO.COSTA@EMAIL.COM', NULL),
('FERNANDA ALMEIDA LIMA', 'FERNANDA.LIMA@EMAIL.COM', '21988887777');

-- 8. INSERIR PLATAFORMAS, CATEGORIAS E JOGOS
INSERT INTO PLATAFORMA (NOME) VALUES
('SUPER NINTENDO'),
('PLAYSTATION 2'),
('MEGA DRIVE');

INSERT INTO CATEGORIA (DESCRICAO) VALUES
('PLATAFORMA'),
('ACAO E AVENTURA'),
('CORRIDA');

INSERT INTO JOGO (TITULO, CODIGO, ANO_LANCAMENTO, QUANTIDADE_DISPONIVEL, ID_PLATAFORMA, ID_CATEGORIA, DESENVOLVEDORA) VALUES
('SUPER MARIO WORLD', 'SNES-001', 1990, 5, 1, 1, 'NINTENDO'),
('DONKEY KONG COUNTRY', 'SNES-002', 1994, 3, 1, 1, 'RARE'),
('SONIC THE HEDGEHOG 2', 'MD-001', 1992, 4, 3, 1, 'SEGA'),
('GOD OF WAR II', 'PS2-001', 2007, 6, 2, 2, 'SANTA MONICA STUDIO'),
('GRAN TURISMO 4', 'PS2-002', 2004, 2, 2, 3, 'POLYPHONY DIGITAL'),
('SHADOW OF THE COLOSSUS', 'PS2-003', 2005, 3, 2, 2, 'TEAM ICO');

-- 9. INSERIR LOCACOES ABERTAS E REDUZIR O ESTOQUE CORRESPONDENTE (RN08, RN09)
INSERT




-- PARTE 9: Inserir locações e atualizar o estoque correspondente
INSERT INTO LOCACAO (DATA_PREVISTA, STATUS_LOCACAO, ID_CLIENTE, ID_JOGO) VALUES
('2026-11-20', 'ABERTA', 1, 1), -- Carlos alugou Super Mario World (ID 1)
('2026-11-21', 'ABERTA', 2, 4), -- Mariana alugou God of War II (ID 4)
('2026-11-22', 'ABERTA', 3, 5); -- Pedro alugou Gran Turismo 4 (ID 5)

-- Redução de 1 unidade no estoque de cada jogo locado acima
UPDATE JOGO 
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL - 1 
WHERE ID_JOGO IN (1, 4, 5);


-- PARTE 10: SELECT + UPDATE
-- Localizando o cliente Pedro Costa (que estava sem telefone)
SELECT * FROM CLIENTE WHERE ID_CLIENTE = 3;

-- Atualizando o telefone do cliente localizado
UPDATE CLIENTE 
SET TELEFONE = '11955554444' 
WHERE ID_CLIENTE = 3;


-- PARTE 11: UPDATE em lote
-- Acrescenta 2 unidades ao estoque dos jogos lançados a partir do ano 2000
UPDATE JOGO 
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2 
WHERE ANO_LANCAMENTO >= 2000;


-- PARTE 12: DELETE e proteção do histórico
-- 1. Criando um cliente temporário sem locações
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('Lucas Mendes', 'lucas.mendes@email.com', '11944443333', TRUE);

-- Excluindo o cliente sem locações (executa com sucesso)
DELETE FROM CLIENTE WHERE EMAIL = 'lucas.mendes@email.com';

-- 2. Tentando excluir um cliente que possui locação vinculada (Carlos - ID 1)
DELETE FROM CLIENTE WHERE ID_CLIENTE = 1;


-- FASE 3 - DQL (Consultas e Análise)

-- 13. SELECT básico
-- Liste título, ano de lançamento e quantidade disponível de todos os jogos.
SELECT 
    TITULO, 
    ANO_LANCAMENTO, 
    QUANTIDADE_DISPONIVEL 
FROM JOGO;


-- 14. WHERE + ORDER BY
-- Mostre jogos com estoque maior que 2, do maior para o menor estoque.
SELECT 
    TITULO, 
    QUANTIDADE_DISPONIVEL 
FROM JOGO 
WHERE QUANTIDADE_DISPONIVEL > 2 
ORDER BY QUANTIDADE_DISPONIVEL DESC;


-- 15. LIKE
-- Pesquise jogos cujo título contenha uma palavra escolhida por você (ex: 'MARIO').
SELECT 
    ID_JOGO, 
    TITULO, 
    ANO_LANCAMENTO, 
    QUANTIDADE_DISPONIVEL 
FROM JOGO 
WHERE TITULO LIKE '%MARIO%';


-- 16. BETWEEN
-- Liste os jogos com ano de lançamento entre 1990 e 2005.
SELECT 
    TITULO, 
    ANO_LANCAMENTO, 
    DESENVOLVEDORA 
FROM JOGO 
WHERE ANO_LANCAMENTO BETWEEN 1990 AND 2005;


-- 17. Funções agregadas
-- Apresente COUNT, SUM, AVG, MIN e MAX sobre os estoques dos jogos, com aliases claros.
SELECT 
    COUNT(ID_JOGO) AS TOTAL_JOGOS_CADASTRADOS,
    SUM(QUANTIDADE_DISPONIVEL) AS SOMA_TOTAL_ESTOQUE,
    AVG(QUANTIDADE_DISPONIVEL) AS MEDIA_ESTOQUE_POR_JOGO,
    MIN(QUANTIDADE_DISPONIVEL) AS MENOR_ESTOQUE,
    MAX(QUANTIDADE_DISPONIVEL) AS MAIOR_ESTOQUE
FROM JOGO;


-- 18. INNER JOIN
-- Liste ID da locação, nome do cliente, título do jogo, data de retirada e status.
SELECT 
    L.ID_LOCACAO,
    C.NOME AS NOME_CLIENTE,
    J.TITULO AS TITULO_JOGO,
    L.DATA_RETIRADA,
    L.STATUS_LOCACAO
FROM LOCACAO L
INNER JOIN CLIENTE C ON L.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN JOGO J ON L.ID_JOGO = J.ID_JOGO;