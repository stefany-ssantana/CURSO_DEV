USE smartcoffee_dml;

-- 01. Consulte produto 2 e seu preço.
SELECT id_produto, nome, preco FROM produtos WHERE id_produto = 2;

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.
START TRANSACTION;
UPDATE produtos SET preco = preco + 3.00 WHERE id_produto = 2;

-- 03. Consulte dentro da transação.
SELECT id_produto, preco FROM produtos WHERE id_produto = 2;

-- 04. ROLLBACK.
ROLLBACK;

-- 05. Consulte e comprove retorno.
SELECT id_produto, preco FROM produtos WHERE id_produto = 2;

-- 06. Repita a alteração e finalize com COMMIT.
START TRANSACTION;
UPDATE produtos SET preco = preco + 3.00 WHERE id_produto = 2;
COMMIT;

-- 07. START TRANSACTION e aumente produto 3 em 10%.
START TRANSACTION;
UPDATE produtos SET preco = preco * 1.10 WHERE id_produto = 3;

-- 08. SAVEPOINT ajuste_produto3.
SAVEPOINT ajuste_produto3;

-- 09. Aumente produto 4 em 50%.
UPDATE produtos SET preco = preco * 1.50 WHERE id_produto = 4;

-- 10. Consulte os dois.
SELECT id_produto, preco FROM produtos WHERE id_produto IN (3, 4);

-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.
ROLLBACK TO SAVEPOINT ajuste_produto3;

-- 12. COMMIT e explique em comentário qual alteração permaneceu.
COMMIT; 
-- Explicação: Permaneceu apenas o aumento de 10% no produto 3. O aumento do produto 4 foi desfeito pelo ROLLBACK TO SAVEPOINT.

-- 13. START TRANSACTION.
START TRANSACTION;

-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.
INSERT INTO pedidos (id_clientes, data_hora, valor_total, tipo_pedido, status) 
VALUES (1, NOW(), 35, 'BALCAO', 'PENDENTE');

SET @novo_pedido = LAST_INSERT_ID();

-- 15. Insira dois itens válidos (usa a tabela 'contem').
INSERT INTO contem (id_pedidos, id_produto) VALUES (@novo_pedido, 1);
INSERT INTO contem (id_pedidos, id_produto) VALUES (@novo_pedido, 2);

-- 16. Registre pagamento válido.
INSERT INTO pagamento (id_pedidos, forma_pagamento, valor_pago, valor_total, data_hora_pagamento) 
VALUES (@novo_pedido, 'PIX', 35, 35, NOW());

-- 17. Consulte pedido, itens e pagamento.
SELECT * FROM pedidos WHERE id_pedidos = @novo_pedido;
SELECT * FROM contem WHERE id_pedidos = @novo_pedido;
SELECT * FROM pagamento WHERE id_pedidos = @novo_pedido;

-- 18. COMMIT.
COMMIT;

-- 19. START TRANSACTION e crie pedido para cliente 2.
START TRANSACTION;

INSERT INTO pedidos (id_clientes, data_hora, valor_total, tipo_pedido, status) 
VALUES (2, NOW(), 10, 'BALCAO', 'PENDENTE');

-- 20. Salve o id em @pedido_com_erro.
SET @pedido_com_erro = LAST_INSERT_ID();

-- 21. Tente inserir item com id_produto inexistente.
INSERT INTO contem (id_pedidos, id_produto) 
VALUES (@pedido_com_erro, 9);

-- 22. Após observar a FK, ROLLBACK.
ROLLBACK;

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.
SELECT * FROM pedidos WHERE id_pedidos = @pedido_com_erro;

-- 24. Tente excluir uma categoria que possui produtos.
-- Nota: Como o seu banco não tem uma tabela 'categoria' separada (a categoria é um campo texto em 'produtos'),
-- simulamos a restrição tentando deletar um produto associado a um pedido em 'contem':
DELETE FROM produtos WHERE id_produto = 1;
-- Explicação: Foi bloqueado pela Chave Estrangeira (FK). 
-- O banco impede apagar um produto enquanto houver registros relacionados na tabela 'contem'.

-- 25. Crie em uma transação um pedido temporário com dois itens, exclua o pedido e observe ON DELETE CASCADE.
START TRANSACTION;

INSERT INTO pedidos (id_clientes, data_hora, valor_total, tipo_pedido, status) 
VALUES (2, NOW(), 25, 'BALCAO', 'NOVO');

SET @id_temporario = LAST_INSERT_ID();

INSERT INTO contem (id_pedidos, id_produto) VALUES (@id_temporario, 1);
INSERT INTO contem (id_pedidos, id_produto) VALUES (@id_temporario, 2);

-- Exclui o pedido pai
DELETE FROM pedidos WHERE id_pedidos = @id_temporario;

-- Checa se os registros sumiram da tabela 'contem'
SELECT * FROM contem WHERE id_pedidos = @id_temporario;

-- Finalize com ROLLBACK para preservar a base
ROLLBACK;