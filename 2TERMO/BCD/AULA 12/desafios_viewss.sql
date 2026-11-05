-- Active: 1788435101780@@127.0.0.1@3306@smartcoffee_dml
-- Parte A — Básico Fundamentos

-- 1. Crie vw_produtos_ativos .
CREATE VIEW vw_produtos_ativos AS
SELECT id_produto, nome, preco
FROM produtos
WHERE ativo = TRUE;


-- 2. Consulte apenas produtos da view com preço maior que R$ 10,00.
SELECT * FROM vw_produtos_ativos
WHERE preco > 10.00;


-- 3. Liste todas as views do banco.
SHOW FULL TABLES WHERE Table_type = 'VIEW';


-- 4. Exiba a definição de vw_produtos_ativos .
SHOW CREATE VIEW vw_produtos_ativos;

-- Parte B — Relacionamentos Intermediário


-- 5. Crie vw_produtos_categorias usando INNER JOIN.
CREATE VIEW ww_produtos_categorias AS
SELECT p.id_produto, p.nome AS produto, ca.nome AS categorias, p.preco
FROM  produto AS p  
INNER JOIN categoria as ca  
ON ca.id_categoria = p.id_categoria;


-- 6. Crie vw_pedidos_clientes .
CREATE VIEW ww_pedidos_clientes AS
SELECT p.id_pedido, p.data_pedido, p.status_pedido , c.id_cliente, c.nome AS cliente
FROM pedido AS p  
INNER JOIN cliente AS c
ON c.id_cliente = p.id_cliente;


-- 7. Consulte somente pedidos FINALIZADOS pela view.
SELECT * FROM ww_pedidos_clientes
WHERE status_pedido = 'FINALIZADO';

-- 8. Crie uma view com pedido, produto, quantidade, preço unitário e
-- subtotal.

-- Parte C — Relatórios Intermediário/
-- Avançado

-- 9. Crie vw_vendas_por_produto com SUM e GROUP BY.

-- 10. Liste os produtos pelo maior faturamento.

-- 11. Crie uma view que apresente todos os clientes e a quantidade de
-- pedidos, inclusive zero.

-- 12. Descubra, pela view anterior, clientes que nunca compraram.

-- Parte D — Manutenção

-- 13. Use CREATE OR REPLACE para acrescentar id_categoria em uma
-- view.

-- 14. Crie uma view simples e teste uma atualização permitida pelo SGBD.

-- 15. Crie uma view de produtos ativos com WITH CHECK OPTION e
-- analise seu efeito.

-- 16. Remova uma view de teste com DROP VIEW IF EXISTS.