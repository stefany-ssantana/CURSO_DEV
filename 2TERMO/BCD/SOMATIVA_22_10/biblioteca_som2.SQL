-- Active: 1788435101780@@127.0.0.1@3306@biblioteca_soma02


-- FASE 1 — DDL: CRIAÇÃO E ESTRUTURA
-- 1. Criação do banco —
CREATE DATABASE biblioteca_soma02;
USE biblioteca_soma02;

-- 2. Tabela USUARIO
CREATE TABLE USUARIO (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo ENUM ('TRUE', 'FALSE') DEFAULT 'TRUE' 
);                                  

-- 3. Tabela LIVRO
CREATE TABLE LIVRO (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT NOT NULL,

    CHECK (quantidade_disponivel >= 0)
);

-- 4. Tabela EMPRESTIMO
CREATE TABLE EMPRESTIMO (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO',
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES LIVRO (isbn),
    FOREIGN KEY (id_usuario) REFERENCES LIVRO (id_livro),
    
    CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
);

-- 5. ALTER TABLE
ALTER TABLE LIVRO ADD editora VARCHAR(100);



-- FASE 2 — DML: MANIPULAÇÃO DE DADOS
-- 6. INSERT de usuários
INSERT INTO usuario ( id_usuario, nome, email, telefone, ativo) 
VALUES (001, 'stefany', 'stefany.santana@email.com', 199099090, 'TRUE');

INSERT INTO usuario ( id_usuario, nome, email, telefone, ativo) 
VALUES (002, 'bruno', 'bruno.moraes@email.com', 1999999999, 'TRUE');

INSERT INTO usuario ( id_usuario, nome, email, telefone, ativo) 
VALUES (003, 'celso', 'celso.carvalho@email.com', 190900009, 'TRUE');

INSERT INTO usuario ( id_usuario, nome, email, telefone, ativo) 
VALUES (004, 'amanda', 'amanda.foseca@email.com', '' , 'FALSE');


-- 7. INSERT de livros
INSERT INTO LIVRO (id_livro, titulo, autor, isbn, ano_publicacao, quantidade_disponivel)
VALUES (00001, 'O Diario de uma Paixao', 'Nicholas Sparks', 12300, 1997, 7 );
    
INSERT INTO LIVRO (id_livro, titulo, autor, isbn, ano_publicacao, quantidade_disponivel)
VALUES (00002, 'Orgulho e Preconceito ', 'Jane Austen', 22000, 1817, 10 );
    
INSERT INTO LIVRO (id_livro, titulo, autor, isbn, ano_publicacao, quantidade_disponivel)
VALUES (00003, 'A Culpa e das Estrelas', 'John Green', 86400, 2012, 4 );

INSERT INTO LIVRO (id_livro, titulo, autor, isbn, ano_publicacao, quantidade_disponivel)
VALUES (00004, 'A Culpa e das Estrelas', 'John Green', 97500, 2012, 4 );

INSERT INTO LIVRO (id_livro, titulo, autor, isbn, ano_publicacao, quantidade_disponivel)
VALUES (00005, 'Como Eu Era Antes de Voce ', 'Jojo Moyes', 64300, 2013, 5);

INSERT INTO LIVRO (id_livro, titulo, autor, isbn, ano_publicacao, quantidade_disponivel)
VALUES (00006, 'Minha Culpa', 'Mercedes Ron', 98600, 2024, 3 );


  

