CREATE TABLE estoque (
    quantidade_min INT,
    Id_item_estoque INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    quantidade_max INT,
    unidade_medida VARCHAR(10),
    nome_produto VARCHAR(50)
);

CREATE TABLE cliente (
    id_clientes INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    Nome VARCHAR(60),
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Telefone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100),
    Endereco VARCHAR(150),
    data_cadastro DATETIME
);

CREATE TABLE programa_de_fidelidade (
    id_fidelidade INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_clientes INT NOT NULL UNIQUE,
    pontos_acumulados INT,
    nivel VARCHAR(10),
    data_ultima_atualizacao DATETIME,
    FOREIGN KEY (id_clientes) REFERENCES cliente(id_clientes)
);

CREATE TABLE funcionarios (
    id_funcionarios INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(60),
    CPF VARCHAR(14),
    cargo VARCHAR(20),
    salario INT,
    data_admissao INT
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(60),
    descricao VARCHAR(100),
    categoria VARCHAR(60),
    preco VARCHAR(10)
);

CREATE TABLE pedidos (
    id_pedidos INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    data_hora DATETIME,
    valor_total INT,
    tipo_pedido VARCHAR(20),
    status VARCHAR(20),
    id_clientes INT NOT NULL,
    id_funcionarios INT,
    FOREIGN KEY (id_clientes) REFERENCES cliente(id_clientes),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios(id_funcionarios)
);

CREATE TABLE Delivery (
    id_delivery INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_pedidos INT NOT NULL UNIQUE,
    id_funcionarios INT,
    data_hora_saida DATETIME,
    status_entrega VARCHAR(20),
    endereco_entrega VARCHAR(150),
    taxa_entrega INT,
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios(id_funcionarios)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_pedidos INT NOT NULL,
    valor_pago INT,
    valor_total INT,
    data_hora_pagamento DATETIME,
    forma_pagamento VARCHAR(20),
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos)
);

CREATE TABLE contem (
    id_pedidos INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_pedidos, id_produto),
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE consome (
    id_produto INT NOT NULL,
    id_item_estoque INT NOT NULL,
    PRIMARY KEY (id_produto, id_item_estoque),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_item_estoque) REFERENCES estoque(id_item_estoque)
);

INSERT INTO cliente (Nome, CPF, Telefone, email, Endereco, data_cadastro)
VALUES ('Maria Silva', '123.456.789-00', '(19) 99999-8888', 'maria@email.com', 'Rua A, 123', NOW());

INSERT INTO produtos (nome, descricao, categoria, preco) 
VALUES 
    ('Café Expresso', 'Café tradicional 50ml', 'Bebidas Quentes', '5.00'),
    ('Cappuccino', 'Com canela e chocolate', 'Bebidas Quentes', '8.50'),
    ('Pão de Queijo', 'Unidade quentinha', 'Salgados', '4.00');

INSERT INTO contem (id_pedidos, id_produto)
VALUES (1, 2);

USE smartcoffee_dml;

-- ============================================================
-- 1. INSERINDO CLIENTES
-- ============================================================
INSERT INTO cliente (Nome, CPF, Telefone, email, Endereco, data_cadastro) 
VALUES 
    ('Ana Souza', '111.222.333-44', '(19) 98111-1111', 'ana.souza@email.com', 'Rua das Flores, 123 - Centro', NOW()),
    ('Bruno Lima', '222.333.444-55', '(19) 98222-2222', 'bruno.lima@email.com', 'Av. Brasil, 456 - Jardim América', NOW()),
    ('Carla Dias', '333.444.555-66', '(19) 98333-3333', 'carla.dias@email.com', 'Rua Pedro II, 789 - Vila Nova', NOW());


-- ============================================================
-- 2. INSERINDO FUNCIONÁRIOS
-- ============================================================
INSERT INTO funcionarios (nome, CPF, cargo, salario, data_admissao) 
VALUES 
    ('Carlos Barista', '444.555.666-77', 'Barista', 2500, 20230115),
    ('Daniela Atendente', '555.666.777-88', 'Atendente', 2000, 20230510),
    ('Eduardo Entregador', '666.777.888-99', 'Entregador', 1800, 20240201);


-- ============================================================
-- 3. INSERINDO ESTOQUE (Insumos)
-- ============================================================
INSERT INTO estoque (nome_produto, quantidade_min, quantidade_max, unidade_medida) 
VALUES 
    ('Grão de Café Arábica', 5, 50, 'KG'),
    ('Leite Integral', 10, 100, 'L'),
    ('Açúcar Refinado', 2, 20, 'KG'),
    ('Copo Descartável 300ml', 50, 500, 'UN');


-- ============================================================
-- 4. INSERINDO PRODUTOS DO CARDÁPIO
-- ============================================================
INSERT INTO produtos (nome, descricao, categoria, preco) 
VALUES 
    ('Café Expresso', 'Café forte e encorpado 50ml', 'Bebidas Quentes', '6.00'),
    ('Cappuccino Italiano', 'Café, leite vaporizado e espuma', 'Bebidas Quentes', '12.00'),
    ('Iced Latte', 'Café gelado com leite e xarope de baunilha', 'Bebidas Geladas', '14.00'),
    ('Pão de Queijo', 'Tradicional mineiro assado na hora', 'Salgados', '5.00'),
    ('Croissant de Chocolate', 'Massa folhada recheada com chocolate', 'Doces', '9.50');


-- ============================================================
-- 5. PROGRAMA DE FIDELIDADE DOS CLIENTES
-- ============================================================
INSERT INTO programa_de_fidelidade (id_clientes, pontos_acumulados, nivel, data_ultima_atualizacao) 
VALUES 
    (1, 150, 'PRATA', NOW()),
    (2, 40, 'BRONZE', NOW());


-- ============================================================
-- 6. INSERINDO PEDIDOS
-- ============================================================
INSERT INTO pedidos (id_clientes, id_funcionarios, data_hora, valor_total, tipo_pedido, status) 
VALUES 
    (1, 1, NOW(), 18, 'BALCAO', 'FINALIZADO'),
    (2, 2, NOW(), 23, 'DELIVERY', 'EM_ANDAMENTO'),
    (3, 1, NOW(), 11, 'BALCAO', 'PENDENTE');


-- ============================================================
-- 7. VINCULANDO PRODUTOS AOS PEDIDOS (Tabela 'contem')
-- ============================================================
-- Pedido 1: 1 Expresso (ID 1) + 1 Cappuccino (ID 2)
INSERT INTO contem (id_pedidos, id_produto) VALUES (1, 1);
INSERT INTO contem (id_pedidos, id_produto) VALUES (1, 2);

-- Pedido 2: 1 Iced Latte (ID 3) + 1 Croissant (ID 5)
INSERT INTO contem (id_pedidos, id_produto) VALUES (2, 3);
INSERT INTO contem (id_pedidos, id_produto) VALUES (2, 5);

-- Pedido 3: 1 Expresso (ID 1) + 1 Pão de Queijo (ID 4)
INSERT INTO contem (id_pedidos, id_produto) VALUES (3, 1);
INSERT INTO contem (id_pedidos, id_produto) VALUES (3, 4);


-- ============================================================
-- 8. VINCULANDO PRODUTOS AO ESTOQUE (Tabela 'consome')
-- ============================================================
-- Cappuccino (ID 2) consome Grão de Café (ID 1) e Leite (ID 2)
INSERT INTO consome (id_produto, id_item_estoque) VALUES (2, 1);
INSERT INTO consome (id_produto, id_item_estoque) VALUES (2, 2);


-- ============================================================
-- 9. REGISTRANDO PAGAMENTOS
-- ============================================================
INSERT INTO pagamento (id_pedidos, valor_pago, valor_total, data_hora_pagamento, forma_pagamento) 
VALUES 
    (1, 18, 18, NOW(), 'PIX'),
    (2, 23, 23, NOW(), 'CARTAO_CREDITO');


-- ============================================================
-- 10. REGISTRANDO DELIVERY
-- ============================================================
INSERT INTO Delivery (id_pedidos, id_funcionarios, data_hora_saida, status_entrega, endereco_entrega, taxa_entrega) 
VALUES 
    (2, 3, NOW(), 'EM_TRANSITO', 'Av. Brasil, 456 - Jardim América', 5);