
CREATE DATABASE IF NOT EXISTS smartcoffee;
USE smartcoffee;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produtos_categoria FOREIGN KEY (id_categoria)
    REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM('ABERTO', 'PREPARANDO', 'FINALIZADO', 'CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente)
    REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto)
    REFERENCES produto (id_produto)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (id_forma_pagamento)
    REFERENCES forma_pagamento (id_forma_pagamento)
);

-- PARTE A
-- 1) CADASTRAR 2 NOVOS CLIENTES
INSERT INTO cliente (nome, email, telefone, cidade, ativo)
VALUES 
    ('Stefany', 'stefany.santana5@senaisp.edu', '19920067642', 'Limeira', TRUE),
    ('Lucas', 'lucas.soares@gmail.com', '19994875077', 'Limeira', TRUE);

-- 2) CADASTRAR UMA NOVA CATEGORIA CHAMADA ESPECIAS DA CASA 
INSERT INTO categoria (nome) VALUES ('Especiais da Casa');

-- 3) CADASTRAR 3 PRODUTOS NA CATEGORIA
SET @categoria_especial = (SELECT id_categoria FROM categoria WHERE nome = 'Especiais da Casa');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES 
('Sonho', 5.00, TRUE, @categoria_especial),
('Donut recheado', 11.99, TRUE, @categoria_especial),
('Waffles morango com nutella', 20.00, TRUE, @categoria_especial);

-- 4) INSERIR CLIENTE SEM TELEFONE E OBSERVAR O USO DO NOT NULL

-- 5) CRIAR NOVO PEDIDO PARA UM DOS CLIENTES 
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente)
VALUES ('2026-10-01 10:00:00', 'ABERTO', 29.00, 1);

-- 9
UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = @categoria_especial;
                   
-- 10
SET @pedido_atividade = 1;

UPDATE pedido
SET status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_atividade;

-- 11
SELECT SUM(quantidade * preco_unitario) AS total
FROM item_pedido
WHERE id_pedido = @pedido_atividade;

UPDATE pedido 
SET valor_total = (
    SELECT COALESCE(SUM(quantidade * preco_unitario), 0) 
    FROM item_pedido 
    WHERE id_pedido = @pedido_atividade
)
WHERE id_pedido = @pedido_atividade;

-- 12
INSERT INTO cliente (nome, email, telefone, cidade)
VALUES ('Cliente Temporário', 'temporario.a09@gmail.com', '19900000000', 'Limeira');

SELECT * FROM produto WHERE nome = 'Croissant Especial';
UPDATE produto SET ativo = FALSE WHERE nome = 'Croissant Especial';
SELECT * FROM produto WHERE nome = 'Croissant Especial';

-- 13
INSERT INTO cliente (nome, email, telefone, cidade)
VALUES ('Cliente temporario 2', 'temporario.a10@gmail.com', '19900000000', 'Limeira');

SELECT * FROM cliente WHERE email = 'temporario.a10@gmail.com';
DELETE FROM cliente WHERE email = 'temporario.a10@gmail.com';
SELECT * FROM cliente WHERE email = 'temporario.a10@gmail.com';

-- 14
SET @cliente_atividade = 1;

-- 15

-- 16
INSERT INTO categoria (nome) VALUES ('Excluir depois');