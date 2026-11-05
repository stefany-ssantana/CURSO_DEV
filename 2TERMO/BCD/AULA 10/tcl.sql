-- Active: 1788435101780@@127.0.0.1@3306@smartcoffee_dml
-- TCL - TRANSAÇÕES E IMTREGRIDADE 
-- SEM TRANSAÇÃO: PARTE DO PROCESO IRÁ PERMANECER GRAVADO 
-- COM TRANSAÇÃO: PODEMOS CONFIRMAR OU DESFAZER O PROCESSO INTEIRO  

-- ESTRUTURA DE TRANSAÇÃO
BEGIN TRANSACTION
-- COMANDOS SQL

COMMIT; -- CONFIRMA A TRANSAÇÃO
-- OU
ROLLBACK; -- DESFAZ A TRANSAÇÃO

-- PROCESSO INICIAL
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('João Silva', 'joao.silva@email.com', '11999999999', 'São Paulo', true);

-- EX 1: COMMIT
-- CONFIRMA AS ALTERAÇÕES DENTRO DA TRANSIÇÃO 
START TRANSACTION;
UPDATE produtos
SET preco = 8.50
WHERE id_produto = 1;
COMMIT;

-- EX 2: ROLLBACK
-- DESFAZ AS ALTERAÇÕES AINDA NÃO CONFIRMADAS DENTRO DA TRANSIÇÃO
START TRANSACTION;
UPDATE produtos
SET preco = 5.00
WHERE id_produto = 1;
SELECT * FROM produtos WHERE id_produto = 1;
ROLLBACK;


-- EX 3: SAVEPOINT
-- CRIAR UM POSTO DENTRO DE UMA TRANSIÇÃO 
START TRANSACTION;
UPDATE produtos
SET preco = preco * 1.50
WHERE id_categoria = 1;
SAVEPOINT reajuste_cafes;

UPDATE produtos
SET preco = preco * 2.00
WHERE id_categoria = 4;

-- EX 4: RELEASE SAVEPOINT
-- REMOVE O SAVEPOINT DA TRANSIÇÃO
RELEASE SAVEPOINT reajuste_cafes;

ROLLBACK TO reajuste_cafes;
COMMIT;

-- EX 5: AUTOCOMMIT
SELECT @@autocommit; -- VERIFICA SE O AUTOCOMMIT ESTÁ ATIVO
START TRANSACTION;
-- DMLS RELACIONADAS
COMMIT;

-- EX 6: TRANSAÇÕES NÃO SUBSTITUI CONSTRAINT
-- CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES
--  categoria(id_categoria) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE cliente(
    id_cliente int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(60),
    telefone char(15),
    cidade varchar(30),
    ativo BOOLEAN DEFAULT TRUE
);

-- EXEMPLO COM UTILIZAÇÃO

CREATE TABLE IF NOT EXISTS estoque(
    id_estoque int AUTO_INCREMENT,
    id_produto int NOT NULL,
    quantidade int NOT NULL DEFAULT 0,
    CONSTRAINT pk_estoque PRIMARY KEY (id_estoque),
    CONSTRAINT uq_estoque UNIQUE (id_produto),
    CONSTRAINT ck_estoque_quantidade CHECK (quantidade >= 0),
    CONSTRAINT fk_estoque_produto FOREIGN KEY (id_produto) 
    REFERENCES produto (id_produto) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO estoque (id_produto, quantidade) VALUES (1,50), (2,40), (3,30);
INSERT INTO estoque (id_produto, quantidade) VALUES (4,00);

select * from estoque;

--EX 7: FLUXO SEGURO PARA UPDATE/DELETE
-- EXCLUSÃO FISICA
DELETE FROM produtos 
WHERE id_produto = 1;

-- EXCLUSÃO LOGICA
UPDATE produtos
SET ativo = true
WHERE id_produto = 1;

SELECT * FROM produtos WHERE id_produto = 2;

START TRANSACTION;

UPDATE produtos
SET preco = 10.00
WHERE id_produto = 2

COMMIT;
-- ROLLBACK; 

-- EX 8: PEDIDO COMPLETO COM TRANSIÇÃO 
START TRANSACTION;
INSERT INTO pedidos (data_pedido, status, valor_total, id_cliente) VALUES (NOW(), 'pendente', 0.00, 130);

set @id_pedido = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (@id_pedido, 1, 2, 7.50);

