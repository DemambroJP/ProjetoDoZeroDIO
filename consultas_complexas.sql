-- Consultas SQL Complexas para o Sistema de Oficina Mecânica

USE oficina_mecanica;

-- 1. Recuperações simples com SELECT Statement
-- Pergunta: Quais são todos os clientes cadastrados na oficina?
SELECT cliente_id, nome, tipo, cpf_cnpj, telefone, email
FROM Cliente
ORDER BY nome;

-- 2. Filtros com WHERE Statement
-- Pergunta: Quais veículos têm mais de 50.000 km rodados?
SELECT v.veiculo_id, v.placa, v.marca, v.modelo, v.ano_fabricacao, v.quilometragem, c.nome AS proprietario
FROM Veiculo v
JOIN Cliente c ON v.cliente_id = c.cliente_id
WHERE v.quilometragem > 50000
ORDER BY v.quilometragem DESC;

-- 3. Expressões para gerar atributos derivados
-- Pergunta: Qual é a margem de lucro para cada peça vendida?
SELECT 
    peca_id,
    nome,
    valor_custo,
    valor_venda,
    (valor_venda - valor_custo) AS lucro_bruto,
    ROUND(((valor_venda - valor_custo) / valor_custo * 100), 2) AS margem_lucro_percentual,
    CASE 
        WHEN ((valor_venda - valor_custo) / valor_custo * 100) < 50 THEN 'Baixa'
        WHEN ((valor_venda - valor_custo) / valor_custo * 100) BETWEEN 50 AND 100 THEN 'Média'
        ELSE 'Alta'
    END AS categoria_margem
FROM Peca
ORDER BY margem_lucro_percentual DESC;

-- 4. Ordenações dos dados com ORDER BY
-- Pergunta: Quais são os serviços mais caros oferecidos pela oficina?
SELECT servico_id, descricao, valor_padrao, categoria, tempo_estimado_minutos,
       ROUND(valor_padrao / (tempo_estimado_minutos / 60), 2) AS valor_hora
FROM Servico
ORDER BY valor_padrao DESC, valor_hora DESC
LIMIT 10;

-- 5. Condições de filtros aos grupos - HAVING Statement
-- Pergunta: Quais clientes tiveram gastos totais acima de R$ 500,00 em serviços?
SELECT 
    c.cliente_id,
    c.nome,
    c.tipo,
    COUNT(DISTINCT os.ordem_servico_id) AS total_ordens,
    SUM(os.valor_total) AS valor_total_gasto,
    MAX(os.data_entrada) AS ultima_visita
FROM Cliente c
JOIN Ordem_Servico os ON c.cliente_id = os.cliente_id
WHERE os.status = 'entregue'
GROUP BY c.cliente_id, c.nome, c.tipo
HAVING SUM(os.valor_total) > 500
ORDER BY valor_total_gasto DESC;

-- 6. Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Pergunta: Qual é o histórico completo de serviços e peças para cada veículo?
SELECT 
    v.placa,
    v.marca,
    v.modelo,
    os.ordem_servico_id,
    os.data_entrada,
    os.status,
    s.descricao AS servico,
    oss.valor_cobrado AS valor_servico,
    f.nome AS mecanico,
    p.nome AS peca,
    osp.quantidade,
    osp.valor_unitario,
    osp.valor_total AS valor_peca
FROM Veiculo v
JOIN Ordem_Servico os ON v.veiculo_id = os.veiculo_id
LEFT JOIN OS_Servico oss ON os.ordem_servico_id = oss.ordem_servico_id
LEFT JOIN Servico s ON oss.servico_id = s.servico_id
LEFT JOIN Funcionario f ON oss.funcionario_id = f.funcionario_id
LEFT JOIN OS_Peca osp ON os.ordem_servico_id = osp.ordem_servico_id
LEFT JOIN Peca p ON osp.peca_id = p.peca_id
ORDER BY v.placa, os.data_entrada DESC, os.ordem_servico_id;

-- 7. Consulta com subconsulta e expressão derivada
-- Pergunta: Quais peças estão com estoque abaixo do mínimo recomendado e qual a quantidade necessária para reposição?
SELECT 
    p.peca_id,
    p.nome,
    p.codigo_referencia,
    p.estoque_atual,
    p.estoque_minimo,
    (p.estoque_minimo - p.estoque_atual) AS quantidade_repor,
    ROUND(((p.estoque_minimo - p.estoque_atual) * p.valor_custo), 2) AS custo_reposicao,
    (SELECT f.razao_social 
     FROM Fornecedor_Peca fp 
     JOIN Fornecedor f ON fp.fornecedor_id = f.fornecedor_id 
     WHERE fp.peca_id = p.peca_id 
     ORDER BY fp.preco_compra ASC 
     LIMIT 1) AS fornecedor_recomendado
FROM Peca p
WHERE p.estoque_atual < p.estoque_minimo
ORDER BY quantidade_repor DESC;

-- 8. Consulta com junção múltipla e agregação
-- Pergunta: Qual é o faturamento mensal da oficina, detalhado por tipo de serviço?
SELECT 
    YEAR(os.data_conclusao) AS ano,
    MONTH(os.data_conclusao) AS mes,
    s.categoria,
    COUNT(DISTINCT os.ordem_servico_id) AS total_ordens,
    COUNT(oss.os_servico_id) AS total_servicos,
    SUM(oss.valor_cobrado) AS valor_servicos,
    SUM(osp.valor_total) AS valor_pecas,
    SUM(oss.valor_cobrado) + SUM(IFNULL(osp.valor_total, 0)) AS faturamento_total
FROM Ordem_Servico os
JOIN OS_Servico oss ON os.ordem_servico_id = oss.ordem_servico_id
JOIN Servico s ON oss.servico_id = s.servico_id
LEFT JOIN OS_Peca osp ON os.ordem_servico_id = osp.ordem_servico_id
WHERE os.status = 'entregue'
GROUP BY YEAR(os.data_conclusao), MONTH(os.data_conclusao), s.categoria
ORDER BY ano, mes, faturamento_total DESC;

-- 9. Consulta com HAVING e múltiplas condições
-- Pergunta: Quais funcionários realizaram mais de 3 serviços e têm média de valor acima de R$ 200?
SELECT 
    f.funcionario_id,
    f.nome,
    f.especialidade,
    COUNT(oss.os_servico_id) AS total_servicos,
    SUM(oss.valor_cobrado) AS valor_total,
    ROUND(AVG(oss.valor_cobrado), 2) AS valor_medio,
    MIN(oss.valor_cobrado) AS menor_valor,
    MAX(oss.valor_cobrado) AS maior_valor
FROM Funcionario f
JOIN OS_Servico oss ON f.funcionario_id = oss.funcionario_id
GROUP BY f.funcionario_id, f.nome, f.especialidade
HAVING COUNT(oss.os_servico_id) > 3 AND AVG(oss.valor_cobrado) > 200
ORDER BY total_servicos DESC, valor_total DESC;

-- 10. Consulta com JOIN, GROUP BY, HAVING e ORDER BY
-- Pergunta: Quais são os clientes mais lucrativos, considerando o valor total gasto e a frequência de visitas?
SELECT 
    c.cliente_id,
    c.nome,
    c.tipo,
    COUNT(DISTINCT os.ordem_servico_id) AS total_visitas,
    COUNT(DISTINCT v.veiculo_id) AS total_veiculos,
    SUM(os.valor_total) AS valor_total_gasto,
    ROUND(SUM(os.valor_total) / COUNT(DISTINCT os.ordem_servico_id), 2) AS ticket_medio,
    DATEDIFF(MAX(os.data_entrada), MIN(os.data_entrada)) AS periodo_cliente_dias,
    CASE 
        WHEN COUNT(DISTINCT os.ordem_servico_id) >= 3 AND SUM(os.valor_total) > 1000 THEN 'Premium'
        WHEN COUNT(DISTINCT os.ordem_servico_id) >= 2 OR SUM(os.valor_total) > 500 THEN 'Regular'
        ELSE 'Ocasional'
    END AS categoria_cliente
FROM Cliente c
JOIN Ordem_Servico os ON c.cliente_id = os.cliente_id
JOIN Veiculo v ON os.veiculo_id = v.veiculo_id
WHERE os.status = 'entregue'
GROUP BY c.cliente_id, c.nome, c.tipo
HAVING COUNT(DISTINCT os.ordem_servico_id) > 1
ORDER BY valor_total_gasto DESC, total_visitas DESC;
