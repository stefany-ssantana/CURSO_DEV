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
    CONSTRAINT fk_emprestimo_usuario 
        FOREIGN KEY (id_usuario) REFERENCES USUARIO (id_usuario),

    CONSTRAINT fk_emprestimo_livro 
        FOREIGN KEY (id_livro) REFERENCES LIVRO (id_livro),

    CONSTRAINT chk_status_emprestimo 
        CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO'))
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
VALUES (00007, 'A Hipotese do Amor ', 'John Green', 93500, 2022, 4 );

INSERT INTO LIVRO (id_livro, titulo, autor, isbn, ano_publicacao, quantidade_disponivel)
VALUES (00005, 'Como Eu Era Antes de Voce ', 'Ali Hazelwood', 64300, 2013, 5);

INSERT INTO LIVRO (id_livro, titulo, autor, isbn, ano_publicacao, quantidade_disponivel)
VALUES (00006, 'Minha Culpa', 'Mercedes Ron', 98600, 2024, 3 );



-- 8.INSERT de empréstimos
INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro)
VALUES ('2026-10-22', '2026-11-05',  '2026-11-04', 'ABERTO', 001, 00001 );
INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro)
VALUES ('2026-10-12', '2026-11-26',  '2026-11-30', 'ABERTO', 001, 00001 );
INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro)
VALUES ('2026-09-02', '2026-09-16',  '2026-10-21', 'ABERTO', 001, 00001 );



-- 9. UPDATE 
SELECT * FROM usuario 

UPDATE usuario
set telefone = '19222016525'
WHERE email = 'stefany.santana@email.com'

 -- 10. Atualização em lote — 4 pts
UPDATE LIVRO
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao >= 2020;

-- 11. DELETE e integridade 
INSERT INTO USUARIO (nome, email, telefone, ativo) 
VALUES ('Usuário Teste', 'teste@email.com', '19988888888', 'TRUE');

DELETE FROM USUARIO 
WHERE email = 'teste@email.com';
DELETE FROM USUARIO 
WHERE id_usuario = 1;

-- EXPLICAÇÃO DO RESULTADO:
-- A tentativa de excluir o id_usuario = 1 vai dar erro, pois é uma fk e no exercicio 4 usamos as mesmas em referencias a tabela usuario, fazendo com que não possa ser excluidas 
-- 4. Tabela EMPRESTIMO — 7 pts
-- Crie PK, duas FKs, DEFAULTs e CHECK de status. As FKs devem impedir
-- exclusão de usuário ou livro com histórico.


-- FASE 3 — DQL: CONSULTAS E ANÁLISE
-- 12. SELECT básico 
SELECT titulo, autor, quantidade_disponivel 
FROM LIVRO;


-- 13. WHERE + ORDER BY 
SELECT * 
FROM LIVRO
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel DESC;


-- 14. LIKE .
SELECT * 
FROM LIVRO
WHERE titulo LIKE '%Amor%';


-- 15. BETWEEN 
SELECT * 
FROM LIVRO
WHERE ano_publicacao BETWEEN 2015 AND 2025;


-- 16. Funções agregadas
SELECT 
    COUNT(quantidade_disponivel) AS total_livros_cadastrados,
    SUM(quantidade_disponivel) AS soma_total_estoque,
    AVG(quantidade_disponivel) AS media_estoque,
    MIN(quantidade_disponivel) AS menor_estoque,
    MAX(quantidade_disponivel) AS maior_estoque
FROM LIVRO;




-- 19. GROUP BY
SELECT 
    status_emprestimo,
    COUNT(*) AS total_emprestimos
FROM EMPRESTIMO
GROUP BY status_emprestimo;


