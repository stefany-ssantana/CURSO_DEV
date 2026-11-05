-- Active: 1788435101780@@127.0.0.1@3306@smartcoffee_dml

-- VIEWS OU VISÕES - TRANSFORMAR DETERMINADAS CONSULTAS EM VISÕES REUTILIZAVEIS

-- COMO POSSO DISPONIBILIZAR UMA CONSULTA COMO SE ELA FOSSE UMA TABELA?
-- RESPOSTA: CRIANDO UMA VIEW

-- EXC 1: COMO CONSULTAR UMA VISÃO LOGICA 
CREATE VIEW vw_clientes_ativos AS SELECT id_produto, nome, preco
FROM PRODUTOS 
WHERE ativo = TRUE ;

-- VISUALIZAR A CONSUKTA CRIADA ATRAVÉS DA VIEW
SELECT * FROM vw_clientes_ativos;

-- OBS: A VIEW GUARDA A DEFINIÇÃO DA CONSULTA, MAS NÃO GUARDA OS DADOS. OS DADOS SÃO BUSCADOS NA TABELA ORIGINAL.

-- TABEL - ARMAZENA REGISTROS
-- VIEW - REPRESENTA O RESULTADO LOGICO DE UMA CONSULTA

-- PORQUE UTILIZAR?
-- POR QUE DESEJO SIMPLIFICAR A MINHA CONSULTA
-- REUTILIZAR LOGICA ONDE A CONSULTA GANHA UM NOME 
-- PADRONIZAÇÃO DE RELATÓRIOS 
-- RESTRIÇÃO DE EXPOSIÇÃO DA LOGICA


-- RESUMO 1:
-- UMA CONSULTA ORIGINAL OU INICIAL:
SELECT id_produto, nome, preco
FROM PRODUTOS
WHERE ativo = TRUE ;

-- TRANSFORMAR EM UMA VIEW:
CREATE VIEW vw_clientes_ativos AS SELECT id_produto, nome, preco
FROM PRODUTOS 
WHERE ativo = TRUE ;

-- COMO UTILIZAR:
SELECT * FROM vw_clientes_ativos;

-- EX 2 : UTILIZAR FILTROS NAS VIEWS
SELECT id_produto, nome, preco  
From produto
WHERE preco >= 10.00
ORDER BY preco DESC;

SELECT * FROM ww_produtos_ativos
WHERE preco >= 10.00
ORDER BY preco DESC;
-- obs: VIEW NÃO ELIMINA A POSSIBILIDADE DE USAR WHERE, ORDER BY E OURAS CLAÚSULAS

-- EX 3: VIEW COM JOINS - MOSTRAR PRODUTOS E CATEGORIAS

SELECT p.id_produto, p.nome AS produto, ca.nome AS categorias, p.preco
FROM  produto AS p  
INNER JOIN categoria as ca  
ON ca.id_categoria = p.id_categoria;

-- CRIANDO VIEW
CREATE VIEW ww_produtos_categoria AS
SELECT p.id_produto, p.nome AS produto, ca.nome AS categorias, p.preco
FROM  produto AS p  
INNER JOIN categoria as ca  
ON ca.id_categoria = p.id_categoria;

-- RESULTADO VISULA POR VIEW

SELECT * FROM ww_produtos_categoria
ORDER BY categorias, produto;

-- EX 4: VIEW com varias abelas - Relatorio

CREATE VIEW ww_pedidos_clientes AS
SELECT p.id_pedido, p.data_pedido, p.status_pedido , c.id_cliente, c.nome AS cliente
FROM pedido AS p  
INNER JOIN cliente AS c
ON c.id_cliente = p.id_cliente;


-- APAGAR VIEW
DROP VIEW ww_pedidos_clientes;

-- RESULTADO
SELECT * FROM ww_
WHERE status = 'ABERTO';

-- EX 5: VIEW para um relatório completo de itens do pedido
CREATE VIEW ww_itens_pedidos AS
SELECT
    pe.id_pedido,
    pe.data_pedido,
    c.nome AS Cliente,
    pr.nome AS Produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS Subtotal
FROM pedido AS pe
INNER JOIN cliente AS c ON c.id_cliente = pe.id_cliente
INNER JOIN item_pedido AS ip ON ip.id_pedido = pe.id_pedido
INNER JOIN produto AS pr ON pr.id_produto = ip.id_produto;

-- RESULTADO
 SELECT * FROM ww_itens_pedidos
where id_pedido = 3;

-- EX 6: VIEW COM FUNÇÕES DE AGREGAÇÃO
CREATE VIEW ww_vendas_por_produto AS
SELECT
    pr.id_produto,
    pr.nome AS produto,
    SUM(ip.quantidade) AS unidades_vendidas,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM produto AS pr
INNER JOIN item_pedido AS ip
    ON ip.id_produto = pr.id_produto
INNER JOIN pedido AS pe
    ON pe.id_pedido = ip.id_pedido
WHERE pe.status_pedido = 'FINALIZADO'
GROUP BY pr.id_produto, pr.nome;
-- SUM() é uma função de agregação utilizada para calcular a soma total dos valores de uma coluna numérica.

-- RESULTADO : CONSULTA GERENCIAL

SELECT * FROM ww_vendas_por_produto
ORDER BY faturamento DESC;

-- EX 7: VIEW COM LEFT JOIN - QUEREMOS TODOS OS CLIENTES INCLUSIVE QUEM NUNCA REALIZOU PEDIDOS
CREATE VIEW vw_clientes_resumo AS
SELECT c.id_cliente, c.nome AS cliente, COUNT(p.id_pedido) AS Quantidade_Pedidos
FROM cliente AS c
LEFT JOIN pedido AS p
ON p.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;



-- EX 8: NOMEANDO VIEWS 
-- ALIASES TORNAM AS VIEWS MAIS LEGIVEIS E FÁCEIS DE ENTENDER -- AS
CREATE VIEW vw_clientes_resumo AS
SELECT id_produto, nome AS Produto, preco AS Preco_Atual
FROM produto;

SELECT * FROM vw_produtos_produtos;


-- EX 9: VIZUALIZAR AS VIEWS CRIADAS NO BANCO DE DADOS
-- VIZUALIZAR O RESULTADO DE TODAS AS VIEWS CRIADAS
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

-- PODEMOS CONSULTAR NO CATALOGO
SELECT TABLE_NAME FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = DATABASE();


 -- EX 10: VIZUALIZANDO DEFINIÇÕES
 SHOW CREATE VIEW vw_produtos_categoria;


 -- EX 11: CREATE OR REPLACE VIEW 
CREATE OR REPLACE VIEW vw_produtos_ativos AS
SELECT id_produto, nome, preco, id_categoria
FROM produto
WHERE ativo = TRUE; 

-- OBS: IRA SUBSITITUIR OU LATERAR UMA VIEW JA CRIADA COM SUAS INFORMAÇÕES


-- EX 12: VIEW ATUALIZAVEL
CREATE VIEW vw_clientes_ativos AS
SELECT id_cliente, nome, email, ativo
FROM cliente
WHERE ativo = TRUE;

-- ATUALIZAR A TABELA CLIENTE
UPDATE vw_clientes_ativos
SET nome = 'Ana Silva'
WHERE id_cliente = 2;

-- EX 13: VIEW NÃO ATUALIZAVEL
UPDATE vw_vendas_por_produto
SET Faturamento = 1000
WHERE id_produto = 1;   

-- OBS: O CAMPO É CALCULADO. SIMPLISMENTE NÃO É POSSIVEL RECEBER 1000.


-- EX 14: WITH CHECK OPTION - VIEW QUE MOSTRA APENAS PRODUTOS ATIVOS
CREATE OR REPLACE VIEW vw_produtos_ativos AS
SELECT id_produto, nome, preco, ativo, id_categoria
FROM produto
WHERE ativo = TRUE
WITH CHECK OPTION;

SELECT * FROM vw_produtos_ativos;
-- OBS: O WITH CHECK OPTION AJUDA A IMPEDIR ALTERAÇÕES REALIZADAS PELA VIEW QUE FARIAM O REGISTRO.


-- EX 15: PADRÃO DEFINIÇÃO DE NOMENCLATURA
-- vw - VIEW
-- nome - COMPLEMENTAR A TABELA OU CONSULTAR QUE DESEJA REALIZAR.
-- vw_nome_desejo
-- vw_nome_finalidade
-- vw_produtos_ativos


-- APAGAR VIEWS
DROP VIEW vw_vendas_por_produto;  
