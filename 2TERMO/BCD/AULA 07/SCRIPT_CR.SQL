-- Active: 1788435101780@@127.0.0.1@3306@sesi_cr_tb

CREATE DATABASE IF NOT EXISTS SESI_CR_TB;

USE SESI_CR_TB;

-- APAGANDO AS TABELAS CASO JÁ EXISTAM

DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS PEDIDO;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS CLIENTE;


DROP TABLE IF EXISTS CLIENTE;

CREATE TABLE CLIENTE(

    ID_cliente INT AUTO_INCREMENT PRIMARY KEY UNIQUE,

    nome_cliente VARCHAR(100) NOT NULL

);

CREATE TABLE PEDIDO(
    ID_pedido INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    data_pedido DATETIME NOT NULL,
    ID_cliente INT NOT NULL,
    FOREIGN KEY (ID_cliente) REFERENCES CLIENTE(ID_CLIENTE)

);


-- CONSULTA DE TABELAS

SELECT * FROM CLIENTE;

SELECT * FROM PEDIDO;


-- INSERINDO DADOS NA TABELA

INSERT INTO CLIENTE (nome_cliente) VALUES
('BRUNO'),
('MARIA'),
('JOSÉ');


CREATE TABLE FORNECEDOR (
    ID_fornecedor INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    razao_social VARCHAR(60) NOT NULL

);


CREATE TABLE PRODUTO (
    ID_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(60) NOT NULL,
    ID_fornecedor INT NOT NULL,
    FOREIGN KEY (ID_fornecedor) REFERENCES FORNECEDOR(ID_FORNECEDOR)

);


-- DESAFIOS


-- 1 QUESTÃO 1

-- CATEGORIA --- POSSUI --- PRODUTOS

-- UMA CATEGORIA PODE POSSUIR VARIOS PRODUTOS. CADA PRODUTO PERTENCE A UMA CATEGORIA.

-- 1,N                       1,1


-- Desafio Rápido — Qual é a

-- Cardinalidade?

-- Para cada situação, identifique a cardinalidade e justifique.


-- 1. Uma categoria pode possuir vários produtos. Cada produto pertence a apenas

-- uma categoria.

-- 1,N                       1,1


-- 2. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um

-- funcionário.

-- 1,N                       1,1


-- 3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser

-- comprado de vários fornecedores.

-- 1,N                       1,N


-- 4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar

-- vinculada a uma mesa.

-- 0,N                       1,1


-- 5. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.

-- 1,N                       1,1