-- Active: 1794503195200@@127.0.0.1@3308@smartcoffee_procedures_stefany
-- Function: Armazena uma rotina criada dentro do MYSQL que recebe
-- parametrps, executa uma lógica e devolve um valor com RETURN

-- Exemplo de utilização:
-- - Calculo de frete (valor do frete)
-- - Escola (classificar médias com aprovado e reprovado)
-- - Financeiro (calcular juros - valor corrigido)
-- - Estoque (situação estoque - opções de checagem)

-- Ex 0: Estrutura básica
CREATE FUNCTION nome_funcao(parametro TIPO)
RETURNS TIPO_DE_RETORNO
DETERMINISTIC
BEGIN
    -- PROCESSAMENTO
    RETURN VALOR;
END $$
DELIMITER ; 
-- Obs: RETURNS - informa qual tipo será devolvido. RETURN informa o 
-- resultado devolvido

-- EX 1: Total de item
DELIMITER $$
CREATE FUNCTION calcular_total_item
(p_preco DECIMAL (10,2), p_quantidade INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_preco * p_quantidade;
END $$
DELIMITER ;
-- OBS: Agora  a função pode ser usada como se fosse uma função pode ser 
-- usada como se fosse uma função nativa
-- Apresentar o resultado FUNCTION

SELECT nome, preco, calcular_total_item(preco, 3) AS 
Total_3_Unidades
FROM produto;

-- EX 2: COM DECISÃO - BASE EM FIDELIDADE
DELIMITER $$

CREATE FUNCTION classificar_fidelidade
(p_pontos INT)
RETURNS varchar(20)
DETERMINISTIC
BEGIN
    IF p_pontos >= 500 THEN
        RETURN 'OURO';
    ELSEIF p_pontos >= 200 THEN
        RETURN 'PRATA';
    ELSE
        RETURN 'BRONZE';
    END IF;
END $$

DELIMITER ;

SELECT nome, pontos_fidelidade, classificar_fidelidade
(pontos_fidelidade) AS Nível
from cliente;


-- EX 3: EXEMPLO COM VARIÁVEL LOCAL
DELIMITER $$
CREATE FUNCTION calcular_desconto
(
    p_valor DECIMAL(10,2),
    p_pontos INT
)
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
    DECLARE v_percentual DECIMAL (5,2);
    IF p_pontos >= 500 THEN
        SET v_percentual = 0.10;
    ELSEIF p_pontos >= 200 THEN
        SET v_percentual = 0.05;
    ELSE
        SET v_percentual = 0;
    END IF;
    RETURN p_valor * v_percentual;
END $$
DELIMITER ;
-- Obs: DETERMINISTIC?
-- Uma função marcada como DETERMINISTIC declara que, para os mesmos 
-- valores de entrada, o resultado será o mesmo.

-- Comparações entre FUNCTION x PROCEDURE x VIEW 
-- VIEW: SELECT ... FROM view - consulta reutilizável - vw_pedidos_abertos
-- PROCEDURE: CALL ... - processo com várias etapas - registrar_pedido
-- FUNCTION: dentro da expressão / SELECT - cálculo ou classificação - 
-- calcular_desconto


-- ATIVIDADE AMPLIDA - AULAS 14 E 15

-- 1. Function calcular_total_item
DELIMITER $$
CREATE FUNCTION calcular_valor_total_item
(p_preco DECIMAL (10,2), p_quantidade INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_preco * p_quantidade;
END $$
DELIMITER ;

SELECT nome, preco, calcular_valor_total_item(preco, 3) AS 
Total_3_Unidades
FROM produto;

-- 2. Function classificar_fidelidade
DELIMITER $$

CREATE FUNCTION classificacao_de_fidelidade
(p_pontos INT)
RETURNS varchar(20)
DETERMINISTIC
BEGIN
    IF p_pontos >= 500 THEN
        RETURN 'OURO';
    ELSEIF p_pontos >= 200 THEN
        RETURN 'PRATA';
    ELSE
        RETURN 'BRONZE';
    END IF;
END $$

DELIMITER ;

SELECT nome, pontos_fidelidade, classificacao_de_fidelidade
(pontos_fidelidade) AS Nível
from cliente;

-- 3. Function calcular_desconto
DELIMITER $$
CREATE FUNCTION calcular_descontos
(
    p_valor DECIMAL(10,2),
    p_pontos INT
)
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
    DECLARE v_percentual DECIMAL (5,2);
    IF p_pontos >= 500 THEN
        SET v_percentual = 0.10;
    ELSEIF p_pontos >= 200 THEN
        SET v_percentual = 0.05;
    ELSE
        SET v_percentual = 0;
    END IF;
    RETURN p_valor * v_percentual;
END $$
DELIMITER ;


-- 4. Function situacao_estoque
DELIMITER $$
CREATE FUNCTION situacao_estoque (
    p_quantidade INT
)
RETURNS VARCHAR (20)
DETERMINISTIC
BEGIN
    IF P_QUANTIDADE = 0 THEN
        RETURN 'SEM ESTOQUE';
    ELSEIF P_QUANTIDADE <= 10 THEN
        RETURN 'ESTOQUE BAIXO';
    ELSE
        RETURN 'ESTOQUE NORMAL';
    END IF;
END $$

DELIMITER ;

-- EXEMPLO KEYNAN
SELECT ID_PRODUTO, SITUACAO_ESTOQUE(QUANTIDADE) AS SITUACAO_ESTOQUE FROM ESTOQUE;

-- EXEMPLO GABRIEL
SELECT E.ID_PRODUTO, P.NOME AS PRODUTO, E.QUANTIDADE, SITUACAO_ESTOQUE(E.QUANTIDADE) AS STATUS_ESTOQUE FROM ESTOQUE AS E
INNER JOIN PRODUTO AS P
ON E.ID_PRODUTO = P.ID_PRODUTO
ORDER BY ID_PRODUTO;

-- 5. Testar todas en SELECT



-- TRIGGERS
-- TRIGGER É UMA ROTINA ASSOCIADA A UMA TABELA QUE É EXECUTADA
-- AUTOMATICAMENTE QUANDO OCORRE UM INSERT, UPDATE, DELETE
-- APLICAÇÕES NO DIA-A-DIA
-- AUDITORIA: REGISTRAR PREÇO ANTIGO E NOVO SEMPRE QUE UM PRODUTO MUDA
-- SEGURANÇA: REGISTRAR EXCLUSÕES IMPORTANTES
-- ESTOQUE: IMPEDIR QUANTIDADE NEGATIVA
-- HOSPITAL: REGISTRAR ALTERAÇÕES EM DADOS CRITICOS
-- FINANCEIRA: CRIAR HISTÓRICO DE MUDANÇA DE STATUS DE PAGAMENTO

-- EX 1: AUDITORIA DE PREÇO
CREATE TABLE AUDITORIA_PRECO (
    ID_AUDITORIA INT AUTO_INCREMENT,
    ID_PRODUTO INT NOT NULL,
    PRECO_ANTERIOR DECIMAL(10,2),
    PRECO_NOVO DECIMAL(10,2),
    ALTERADO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ID_AUDITORIA PRIMARY KEY (ID_AUDITORIA),
    CONSTRAINT FK_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

DELIMITER $$

CREATE TRIGGER TRG_PRODUTO_PRECO_UPDATE
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN
    IF OLD.PRECO <> NEW.PRECO THEN
        INSERT INTO AUDITORIA_PRECO (ID_PRODUTO, PRECO_ANTERIOR, PRECO_NOVO)
        VALUES (NEW.ID_PRODUTO, OLD.PRECO, NEW.PRECO);
    END IF;
END $$

DELIMITER ;

SELECT ID_PRODUTO, NOME, PRECO FROM PRODUTO
WHERE ID_PRODUTO = 1;

UPDATE PRODUTO
SET PRECO = 10.50
WHERE ID_PRODUTO = 1;

SELECT * FROM AUDITORIA_PRECO
ORDER BY ID_AUDITORIA DESC;

-- OBS: BOA PRÁTICA - SEMPRE MOSTRE O ESTADO ANTES (BEFORE), EXECUTE A MUDANÇA E DEPOIS CONSULTE O ESTADO DEPOIS (AFTER)
-- BEFORE antes de gravar validar estoque negativo
-- AFTER depois de gravar registrar histórico/auditoria
-- INSERT (OLD não) (NEW sim)
-- UPDATE (OLD sim) (NEW sim)
-- DELETE (OLD sim) (NEW não)

-- EX 2 - VALIDAÇÃO AUTOMÁTICA COM SIGNAL
DELIMITER $$

CREATE TRIGGER TRG_ESTOQUE_BEFORE_UPDATE
BEFORE UPDATE ON ESTOQUE
FOR EACH ROW
BEGIN
    IF NEW.QUANTIDADE < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ESTOQUE NÃO PODE FICAR NEGATIVO';
    END IF;
END $$

DELIMITER ;

-- EX 3: BEFORE INSERT - ANTES DE INSERIR DADOS
DELIMITER $$

CREATE TRIGGER TRG_PRODUTO_BEFORE_INSERT
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN
    IF NEW.PRECO <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'PREÇO DEVE SER MAIOR QUE ZERO';
    END IF;
END $$

DELIMITER ;

SELECT * FROM produto;


-- INSERIR INFORMAÇÕES PARA COMPLETAR O BANCO DE DADOS
INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES 
(3, 'CAFÉ AMERICANO', 3.50, TRUE);

INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES 
(3, 'BOLO DE CENOURA', 7.50, TRUE);

INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES 
(3, 'CAPUCCINO', 4.00, TRUE);

INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES 
(3, 'SURPRESA DE UVA', 10.90, TRUE);

INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES 
(3, 'CAROLINA', 2.99, TRUE);

INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES 
(3, 'PÃO NA CHAPA', 4.00, TRUE);

INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES 
(3, 'MILK SHAKE', 15.00, TRUE);

INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES 
(3, 'CHÁ MATTE', 6.00, TRUE);


-- EX 4: EXCLUSÃO DE REGISTRO - AFTER DELETE
CREATE TABLE LOG_EXCLUSAO_PRODUTO
(
    ID_LOG INT AUTO_INCREMENT,
    ID_PRODUTO INT,
    NOME_PRODUTO VARCHAR(120),
    EXCLUIDO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ID_LOG PRIMARY KEY (ID_LOG),
    CONSTRAINT FK_PRODUTO_ID FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);


DELIMITER $$

CREATE TRIGGER TRG_PRODUTO_AFTER_DELETE
AFTER DELETE ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_EXCLUSAO_PRODUTO(ID_PRODUTO, NOME_PRODUTO)
    VALUES (OLD.ID_PRODUTO, OLD.NOME);
END $$

DELIMITER ;

-- TESTANDO
INSERT INTO LOG_EXCLUSAO_PRODUTO(ID_PRODUTO, NOME_PRODUTO) VALUES
 (1, 'TESTE');

SELECT * FROM LOG_EXCLUSAO_PRODUTO;

DELETE FROM LOG_EXCLUSAO_PRODUTO
WHERE ID_LOG = 1; 

DELETE FROM LOG_EXCLUSAO_PRODUTO
WHERE ID_LOG = 1;

-- COMO GERENCIAR
SHOW TRIGGERS;

SHOW CREATE TRIGGER NOME_TRIGGER;

DROP TRIGGER IF EXISTS NOME_TRIGGER;


-- 6. Criar auditoria_preco
CREATE TABLE IF NOT EXISTS auditoria_preco (
    id_auditoria INT AUTO_INCREMENT,
    id_produto INT NOT NULL,
    preco_anterior DECIMAL(10,2) NOT NULL,
    preco_novo DECIMAL(10,2) NOT NULL,
    alterado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_id_auditoria PRIMARY KEY (id_auditoria),
    CONSTRAINT fk_auditoria_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- 7. Trigger AFTER UPDATE de preço
DELIMITER $$

CREATE TRIGGER trg_produto_preco_update0
AFTER UPDATE ON produto
FOR EACH ROW
BEGIN
    IF OLD.preco <> NEW.preco THEN
        INSERT INTO auditoria_preco (id_produto, preco_anterior, preco_novo)
        VALUES (NEW.id_produto, OLD.preco, NEW.preco);
    END IF;
END $$

DELIMITER ;
-- 8. Trigger BEFORE UPDATE impedindo estoque negativo
DELIMITER $$

CREATE TRIGGER trg_estoque_before_update0
BEFORE UPDATE ON estoque
FOR EACH ROW
BEGIN
    IF NEW.quantidade < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ESTOQUE NÃO PODE FICAR NEGATIVO';
    END IF;
END $$

DELIMITER ;


-- 9. Criar log_exclusao_produto
CREATE TABLE IF NOT EXISTS LOG_EXCLUSAO_PRODUTOS
(
    ID_LOG INT AUTO_INCREMENT,
    ID_PRODUTO INT,
    NOME_PRODUTO VARCHAR(120),
    EXCLUIDO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ID_LOG PRIMARY KEY (ID_LOG),
    CONSTRAINT FK_PRODUTO_ID FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);


DELIMITER $$

-- 10. Trigger AFTER DELETE

-- 11. Demonstrar operação bloqueada

-- 12. Demonstrar histórico gerado automaticamente

-- 13. SHOW TRIGGERS

-- 14. SHOW CREATE TRIGGER

-- 15. Explique: Function x Procedure x View x Trigger

-- 16. Cite 3 regras em que CHECK/UNIQUE/FK seriam melhores que Trigger

-- DESAFIO: crie uma automação própria e justifique a escolha do recurso.