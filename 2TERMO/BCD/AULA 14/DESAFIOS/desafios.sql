USE smartcoffee_procedures_stefany;

-- AULA 13 - ATIVIDADE STORED PROCEDURES
-- Aluno: Stefany Santana
-- Turma: 2 DEVIS

-- 1. listar_clientes_ativos()
DELIMITER $$
CREATE PROCEDURE LISTAR_CLIENTES_ATIVOS()
BEGIN
    SELECT ID_CLIENTE, NOME, EMAIL, TELEFONE, PONTOS_FIDELIDADE
    FROM CLIENTE
    WHERE ATIVO = TRUE
    ORDER BY NOME;
END $$
DELIMITER ;

CALL LISTAR_CLIENTES_ATIVOS();


-- 2. buscar_produto_por_nome(IN p_busca VARCHAR(100))



-- 3. produtos_por_categoria(IN p_id_categoria INT)
DELIMITER $$
CREATE PROCEDURE PRODUTOS_POR_CATEGORIA(IN P_ID_CATEGORIA INT)
BEGIN
    SELECT ID_PRODUTO AS CODIGO, NOME, PRECO
    FROM PRODUTO
    WHERE ID_CATEGORIA = P_ID_CATEGORIA
      AND ATIVO = TRUE
    ORDER BY NOME;
END $$
DELIMITER ;

CALL PRODUTOS_POR_CATEGORIA(1);


-- 4. total_clientes(OUT p_total INT)
DELIMITER $$
CREATE PROCEDURE TOTAL_CLIENTES(OUT P_TOTAL INT)
BEGIN
    SELECT COUNT(*)
    INTO P_TOTAL
    FROM CLIENTE
    WHERE ATIVO = TRUE;
END $$
DELIMITER ;

CALL TOTAL_CLIENTES(@TOTAL);
SELECT @TOTAL;


-- 5. consultar_estoque(IN p_id_produto INT) usando variável local
DELIMITER $$
CREATE PROCEDURE CONSULTAR_ESTOQUE(IN P_ID_PRODUTO INT)
BEGIN
    DECLARE V_QUANTIDADE INT;

    SELECT QUANTIDADE
    INTO V_QUANTIDADE
    FROM ESTOQUE
    WHERE ID_PRODUTO = P_ID_PRODUTO;

    SELECT V_QUANTIDADE AS QUANTIDADE_ESTOQUE;
END $$
DELIMITER ;

CALL CONSULTAR_ESTOQUE(1);


-- 6. classificar estoque: 0 SEM ESTOQUE / <=5 BAIXO / >5 NORMAL

-- 7. cadastrar_cliente(...) com três parâmetros IN

-- 8. alterar_preco(...) impedindo valor <= 0
DELIMITER $$
CREATE PROCEDURE ALTERAR_PRECO(
    IN P_ID_PRODUTO INT,
    IN P_NOVO_PRECO DECIMAL(10,2)
)
BEGIN
    IF P_NOVO_PRECO > 0 THEN
        UPDATE PRODUTO
        SET PRECO = P_NOVO_PRECO
        WHERE ID_PRODUTO = P_ID_PRODUTO;

        SELECT 'PREÇO ATUALIZADO' AS MENSAGEM;
    ELSE
        SELECT 'PREÇO INVÁLIDO' AS MENSAGEM;
    END IF;
END $$
DELIMITER ;

CALL ALTERAR_PRECO(1, 9.50);

-- 9. criar_pedido(IN p_id_cliente INT, OUT p_id_pedido INT)

-- 10. devolver ID com LAST_INSERT_ID()
DELIMITER $$
CREATE PROCEDURE CRIAR_PEDIDO(
    IN P_ID_CLIENTE INT,
    OUT P_ID_PEDIDO INT
)
BEGIN
    START TRANSACTION;
    INSERT INTO PEDIDO (
        ID_CLIENTE,
        DATA_PEDIDO,
        STATUS_PEDIDO
    )
    VALUES (
        P_ID_CLIENTE, NOW(), 'ABERTO'
    );

    SET P_ID_PEDIDO = LAST_INSERT_ID();
    COMMIT;
END $$
DELIMITER ;

CALL CRIAR_PEDIDO(1, @ID_PEDIDO_GERADO);
SELECT @ID_PEDIDO_GERADO;

-- 11. adicionar_item_pedido(...) buscando o preço atual

-- 12. Faça uma chamada inválida e explique o resultado.

-- 13. Use SHOW CREATE PROCEDURE.

-- 14. Remova uma procedure com DROP PROCEDURE IF EXISTS e recrie-a.

-- DESAFIO FINAL:
-- Crie uma procedure de negócio com:
-- - pelo menos 2 parâmetros;
-- - variável local;
-- - IF;
-- - pelo menos uma alteração no banco.