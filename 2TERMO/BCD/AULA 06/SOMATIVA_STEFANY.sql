-- SOMATIVA 

-- 01 - MODELAGEM DE BANCO DE DADOS (BR MODELO)
-- feito no br modelo  

-- 2 . CRIAÇÃO DE BANCO DE DADOS E TABELAS (MYSQL)

CREATE DATABASE IF NOT EXISTS  SOMATIVA;
USE SOMATIVA;

CREATE TABLE  CLIENTES (
  id_clientes INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  CPF INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome VARCHAR(50) NOT NULL,
  data_nascimento VARCHAR(20),
  cidade VARCHAR(30),
  email VARCHAR (100) NOT NULL,
  telefone INT AUTO_INCREMENT PRIMARY KEY NOT NULL 
  );

CREATE TABLE VEICULOS(
   placas VARCHAR(10) AUTO_INCREMENT PRIMARY KEY NOT NULL,
   id_veiculos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   auto_propelidos VARCHAR(10),
   bicicleta VARCHAR(10),
   carro ENUM ('comum', 'eletrico', 'automatico'),
   moto ENUM ('comum', 'esportiva')
   );
   

CREATE TABLE MARCAS (
  id_marcas INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  ano_veiculo INT,
  ano_compra INT,
  empresa_fabricante VARCHAR (15),
  observacoes VARCHAR(100)
  );


CREATE TABLE MODELOS(
  cor VARCHAR(15),
  ano_veiculo ENUM ('antigo(mais_20anos)', 'recente(menos_20anos)'),
  faixa_valor INT,
  id_modelos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  fabricante VARCHAR (15),
  alteracoes VARCHAR (100)
  );
  

CREATE TABLE PAGAMENTOS (
  id_pagamentos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  dinheiro VARCHAR(10),
  pix VARCHAR(10),
  boleto VARCHAR(10),
  cheque VARCHAR(10),
  cartao ENUM('debito','credito')
  );


CREATE TABLE FUNCIONARIOS(
  CPF INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_funcionarios INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome VARCHAR(50),
  salario VARCHAR (10),
  cargo VARCHAR(15),
  tempo_empresa VARCHAR(15)
  );

CREATE TABLE SERVICOS(
valor VARCHAR(30),
quantidade INT,
tipo_servico VARCHAR (50),
tempo VARCHAR(15),
id_servicos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
veiculos_servico VARCHAR(20)
);

CREATE TABLE PECAS(
  nomes VARCHAR(100),
  quantidade INT,
  veiculo VARCHAR(50),
  tipo ENUM ('peca_original', 'outro_fabricante'),
  id_pecas INT AUTO_INCREMENT PRIMARY KEY NOT NULL
  );

CREATE TABLE ORDENS_SERVICO(
  taxa_orcamento INT,
  id_ordens_servico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  tempo_servico VARCHAR(15),
  tipo_servico VARCHAR(15),
  nome_cliente VARCHAR(50),
  valor INT, 
  mao_de_obra_funcionarios VARCHAR(20)
  );

CREATE TABLE FORNECEDORES(
  id_fornecedores INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  telefone INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  produto_forneciso VARCHAR(100),
  tempo_contrato VARCHAR(15),
  nome_responsavel VARCHAR (50),
  nome_empresa VARCHAR(50)
  );


-- 03 - ALTERAÇÃO DE INFORMAÇÕES DE TABELAS (MYSQL)
RENAME TABLE MODELOS TO MODELOS_FAB;







