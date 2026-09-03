-- PROJETO SMARTCOFFEE STEFANY
create database if not exists smartcoffee;

use smartcoffee;

create table if not exists clientes(
 id_cliente int auto_increment primary key,
 cpf varchar(15) not null unique,
 nome varchar (50),
 endereco varchar (50),
 telefone varchar (15) not null unique
);

create table if not exists produtos (
id_produtos int auto_increment primary key,
preco int
 );

create table if not exists estoque (
id_item_estoque int auto_increment primary key,
quantidade int
 );

create table if not exists pedidos (
id_pedidos int auto_increment primary key,
status varchar(15)
);







