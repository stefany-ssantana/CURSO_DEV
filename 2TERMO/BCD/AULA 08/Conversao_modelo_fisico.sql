-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Estoque (
    quantidade_min int,
    Id_item_estoque INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    quantidade_max int,
    unidade_medida varchar(10),
    nome_produto varchar(50)
);

CREATE TABLE Clientes (
    id_clientes INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    Nome varchar(60),
    CPF varchar(14) not null unique,
    Telefone varchar(15) not null unique,
    email varchar(100),
    Endereco varchar(150),
    data_cadastro date time
);

CREATE TABLE Programa_de_fidelidade (
    Id_fidelidade INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_clientes INT NOT NULL UNIQUE,
    Pontos_acumulados int,
    Nivel varchar(10),
    data_ultima_atualizacao date time,
    FOREIGN KEY (id_clientes) REFERENCES Clientes(id_clientes)
);

CREATE TABLE Funcionarios (
    Id_funcionarios INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    Nome varchar(60),
    CPF varchar(14),
    Cargo varchar(20),
    Salario int,
    data_admissao int
);

CREATE TABLE Produtos (
    Id_produto INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    nome varchar(60),
    descricao varchar(100),
    categoria varchar(60),
    Preco varchar(10)
);

CREATE TABLE Pedidos (
    Id_pedidos INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    data_hora date time,
    valor_total int,
    tipo_pedido varchar(20),
    Status varchar(20),
    id_clientes INT NOT NULL,
    Id_funcionarios INT,
    FOREIGN KEY (id_clientes) REFERENCES Clientes(id_clientes),
    FOREIGN KEY (Id_funcionarios) REFERENCES Funcionarios(Id_funcionarios)
);

CREATE TABLE Delivery (
    id_delivery INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    Id_pedidos INT NOT NULL UNIQUE,
    Id_funcionarios INT,
    data_hora_saida date time,
    status_entrega varchar(20),
    endereco_entrega varchar(150),
    taxa_entrega int,
    FOREIGN KEY (Id_pedidos) REFERENCES Pedidos(Id_pedidos),
    FOREIGN KEY (Id_funcionarios) REFERENCES Funcionarios(Id_funcionarios)
);

CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    Id_pedidos INT NOT NULL,
    valor_pago int,
    valor_total int,
    data_hora_pagamento date time,
    forma_pagamento varchar(20),
    FOREIGN KEY (Id_pedidos) REFERENCES Pedidos(Id_pedidos)
);

CREATE TABLE contem (
    Id_pedidos INT NOT NULL,
    Id_produto INT NOT NULL,
    PRIMARY KEY (Id_pedidos, Id_produto),
    FOREIGN KEY (Id_pedidos) REFERENCES Pedidos(Id_pedidos),
    FOREIGN KEY (Id_produto) REFERENCES Produtos(Id_produto)
);

CREATE TABLE consome (
    Id_produto INT NOT NULL,
    Id_item_estoque INT NOT NULL,
    PRIMARY KEY (Id_produto, Id_item_estoque),
    FOREIGN KEY (Id_produto) REFERENCES Produtos(Id_produto),
    FOREIGN KEY (Id_item_estoque) REFERENCES Estoque(Id_item_estoque)
);
