-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE  (
nome_cliente  varchar(60) not null,
ID_cliente int auto increment primary key PRIMARY KEY
)

CREATE TABLE PEDIDO (
ID_pedido int auto increment primary key PRIMARY KEY,
data_pedido  datetime not null,
ID_cliente int auto increment primary key,
FOREIGN KEY(ID_cliente) REFERENCES CLIENTE  (ID_cliente)
)

CREATE TABLE PRODUTO+ESTOQUE  (
ID_produto int auto increment primary key,
nome_produto varchar(60) not null,
quantidade int not null,
ID_estoque  int auto increment primary key,
PRIMARY KEY(ID_produto,ID_estoque)
)

CREATE TABLE FORECEDOR  (
ID_fornecedor int auto increment primary kay unique  PRIMARY KEY,
razao_social varchar(100)
)

CREATE TABLE PRODUTO (
nome_produto varchar(100),
ID_produto int auto increment primary kay unique PRIMARY KEY
)


CREATE TABLE Relação_3+FORNECE  (
ID_fornecedor int auto increment primary kay unique ,
ID_produto int auto increment primary kay unique,
ID_itens  int auto increment primary kay unique PRIMARY KEY,
FOREIGN KEY(ID_fornecedor) REFERENCES FORECEDOR  (ID_fornecedor),
FOREIGN KEY(ID_produto) REFERENCES PRODUTO (ID_produto)
)
