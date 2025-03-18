-- Script SQL para inserção de dados de teste na Oficina Mecânica

USE oficina_mecanica;

-- Inserção de Clientes
INSERT INTO Cliente (nome, tipo, cpf_cnpj, telefone, email, endereco, cidade, estado, cep) VALUES
('João Silva', 'PF', '123.456.789-00', '(11) 98765-4321', 'joao.silva@email.com', 'Rua das Flores, 123', 'São Paulo', 'SP', '01234-567'),
('Maria Santos', 'PF', '987.654.321-00', '(11) 91234-5678', 'maria.santos@email.com', 'Av. Paulista, 1000', 'São Paulo', 'SP', '01310-100'),
('Pedro Oliveira', 'PF', '456.789.123-00', '(11) 97890-1234', 'pedro.oliveira@email.com', 'Rua Augusta, 500', 'São Paulo', 'SP', '01305-000'),
('Auto Peças Ltda', 'PJ', '12.345.678/0001-90', '(11) 3456-7890', 'contato@autopecas.com', 'Av. Industrial, 200', 'Santo André', 'SP', '09080-500'),
('Transportes Rápidos SA', 'PJ', '98.765.432/0001-10', '(11) 3321-6547', 'contato@transportesrapidos.com', 'Rodovia Anchieta, km 20', 'São Bernardo', 'SP', '09750-000'),
('Ana Beatriz', 'PF', '111.222.333-44', '(11) 95555-6666', 'ana.beatriz@email.com', 'Rua dos Pinheiros, 50', 'São Paulo', 'SP', '05422-000'),
('Carlos Eduardo', 'PF', '222.333.444-55', '(11) 94444-5555', 'carlos.eduardo@email.com', 'Alameda Santos, 75', 'São Paulo', 'SP', '01419-000'),
('Empresa XYZ Ltda', 'PJ', '45.678.901/0001-23', '(11) 3333-4444', 'contato@xyz.com', 'Av. Engenheiro Luís Carlos Berrini, 500', 'São Paulo', 'SP', '04571-000'),
('Fernanda Lima', 'PF', '333.444.555-66', '(11) 93333-2222', 'fernanda.lima@email.com', 'Rua Oscar Freire, 300', 'São Paulo', 'SP', '01426-000'),
('Gabriel Mendes', 'PF', '444.555.666-77', '(11) 92222-1111', 'gabriel.mendes@email.com', 'Av. Rebouças, 150', 'São Paulo', 'SP', '05401-000');

-- Inserção de Veículos
INSERT INTO Veiculo (cliente_id, placa, marca, modelo, ano_fabricacao, ano_modelo, cor, quilometragem, chassi) VALUES
(1, 'ABC-1234', 'Toyota', 'Corolla', 2018, 2019, 'Prata', 45000, '9BRBL3HE6J0123456'),
(1, 'DEF-5678', 'Honda', 'Civic', 2020, 2020, 'Preto', 15000, '93HGD17407Z123456'),
(2, 'GHI-9012', 'Volkswagen', 'Golf', 2019, 2019, 'Branco', 30000, '9BWAA11J5Y1123456'),
(3, 'JKL-3456', 'Ford', 'Ka', 2017, 2018, 'Vermelho', 60000, '9BFZH55L8J8123456'),
(4, 'MNO-7890', 'Mercedes-Benz', 'Sprinter', 2019, 2020, 'Branco', 80000, 'WDB9066571P123456'),
(4, 'PQR-1234', 'Volkswagen', 'Saveiro', 2018, 2018, 'Prata', 70000, '9BWKB45U0JP123456'),
(5, 'STU-5678', 'Volvo', 'FH 460', 2020, 2021, 'Azul', 120000, 'YV2RT40A1LB123456'),
(6, 'VWX-9012', 'Fiat', 'Uno', 2015, 2016, 'Vermelho', 90000, '9BD195173F0123456'),
(7, 'YZA-3456', 'Chevrolet', 'Onix', 2021, 2021, 'Prata', 5000, '9BGEA48A0LB123456'),
(8, 'BCD-7890', 'Scania', 'R450', 2019, 2019, 'Vermelho', 200000, '9BSR4X200L3123456'),
(9, 'EFG-1234', 'Hyundai', 'HB20', 2020, 2020, 'Azul', 25000, '9BHBG51CALP123456'),
(10, 'HIJ-5678', 'Renault', 'Sandero', 2019, 2020, 'Branco', 35000, '93Y5SRF84LJ123456');

-- Inserção de Funcionários
INSERT INTO Funcionario (nome, cpf, telefone, email, endereco, cargo, especialidade, data_contratacao, salario) VALUES
('Roberto Almeida', '111.222.333-00', '(11) 97777-8888', 'roberto.almeida@oficina.com', 'Rua das Acácias, 50, São Paulo, SP', 'Mecânico', 'Motor', '2018-03-15', 3500.00),
('Juliana Ferreira', '222.333.444-00', '(11) 96666-7777', 'juliana.ferreira@oficina.com', 'Av. Ibirapuera, 1000, São Paulo, SP', 'Mecânico', 'Elétrica', '2019-06-10', 3200.00),
('Marcos Souza', '333.444.555-00', '(11) 95555-6666', 'marcos.souza@oficina.com', 'Rua Vergueiro, 500, São Paulo, SP', 'Mecânico', 'Suspensão', '2017-01-20', 3300.00),
('Patrícia Lima', '444.555.666-00', '(11) 94444-5555', 'patricia.lima@oficina.com', 'Av. Santo Amaro, 200, São Paulo, SP', 'Atendente', NULL, '2020-02-05', 2200.00),
('Lucas Oliveira', '555.666.777-00', '(11) 93333-4444', 'lucas.oliveira@oficina.com', 'Rua Augusta, 300, São Paulo, SP', 'Gerente', NULL, '2015-11-10', 5000.00),
('Camila Santos', '666.777.888-00', '(11) 92222-3333', 'camila.santos@oficina.com', 'Av. Brigadeiro Faria Lima, 1500, São Paulo, SP', 'Mecânico', 'Freios', '2021-01-15', 3000.00),
('Rafael Costa', '777.888.999-00', '(11) 91111-2222', 'rafael.costa@oficina.com', 'Rua Oscar Freire, 100, São Paulo, SP', 'Mecânico', 'Ar Condicionado', '2020-07-20', 3100.00);

-- Inserção de Serviços
INSERT INTO Servico (descricao, valor_padrao, tempo_estimado_minutos, categoria) VALUES
('Troca de óleo e filtros', 150.00, 60, 'Manutenção Preventiva'),
('Revisão de freios', 200.00, 90, 'Manutenção Preventiva'),
('Alinhamento e balanceamento', 120.00, 60, 'Manutenção Preventiva'),
('Troca de correia dentada', 350.00, 180, 'Manutenção Preventiva'),
('Diagnóstico eletrônico', 100.00, 60, 'Diagnóstico'),
('Reparo no sistema elétrico', 250.00, 120, 'Manutenção Corretiva'),
('Troca de amortecedores', 500.00, 180, 'Manutenção Corretiva'),
('Reparo no sistema de ar condicionado', 300.00, 120, 'Manutenção Corretiva'),
('Troca de pastilhas de freio', 180.00, 90, 'Manutenção Preventiva'),
('Troca de bateria', 80.00, 30, 'Manutenção Corretiva'),
('Reparo no motor', 1200.00, 480, 'Manutenção Corretiva'),
('Troca de embreagem', 800.00, 360, 'Manutenção Corretiva'),
('Higienização de ar condicionado', 150.00, 60, 'Manutenção Preventiva'),
('Troca de pneus', 100.00, 60, 'Manutenção Preventiva'),
('Reparo na suspensão', 400.00, 180, 'Manutenção Corretiva');

-- Inserção de Peças
INSERT INTO Peca (nome, codigo_referencia, fabricante, valor_custo, valor_venda, estoque_atual, estoque_minimo, categoria, localizacao_estoque) VALUES
('Óleo de motor 5W30 sintético', 'OL-5W30-S', 'Mobil', 25.00, 45.00, 50, 10, 'Lubrificantes', 'Prateleira A1'),
('Filtro de óleo', 'FO-1234', 'Tecfil', 15.00, 30.00, 40, 10, 'Filtros', 'Prateleira A2'),
('Filtro de ar', 'FA-5678', 'Tecfil', 20.00, 40.00, 35, 8, 'Filtros', 'Prateleira A2'),
('Pastilha de freio dianteira', 'PF-D-1234', 'Frasle', 60.00, 120.00, 20, 4, 'Freios', 'Prateleira B1'),
('Pastilha de freio traseira', 'PF-T-5678', 'Frasle', 50.00, 100.00, 20, 4, 'Freios', 'Prateleira B1'),
('Amortecedor dianteiro', 'AD-1234', 'Cofap', 180.00, 350.00, 8, 2, 'Suspensão', 'Prateleira C1'),
('Amortecedor traseiro', 'AT-5678', 'Cofap', 160.00, 320.00, 8, 2, 'Suspensão', 'Prateleira C1'),
('Correia dentada', 'CD-1234', 'Gates', 80.00, 160.00, 15, 3, 'Motor', 'Prateleira D1'),
('Tensor da correia', 'TC-5678', 'SKF', 70.00, 140.00, 12, 3, 'Motor', 'Prateleira D1'),
('Bateria 60Ah', 'BAT-60', 'Moura', 250.00, 450.00, 10, 2, 'Elétrica', 'Prateleira E1'),
('Kit embreagem', 'KE-1234', 'LUK', 300.00, 600.00, 5, 1, 'Transmissão', 'Prateleira F1'),
('Vela de ignição', 'VI-1234', 'NGK', 15.00, 30.00, 40, 8, 'Ignição', 'Prateleira G1'),
('Cabo de vela', 'CV-5678', 'NGK', 50.00, 100.00, 15, 3, 'Ignição', 'Prateleira G1'),
('Fluido de freio DOT4', 'FB-DOT4', 'Bosch', 20.00, 35.00, 30, 5, 'Fluidos', 'Prateleira H1'),
('Aditivo para radiador', 'AR-1234', 'Radiex', 18.00, 35.00, 25, 5, 'Fluidos', 'Prateleira H1'),
('Pneu 195/65 R15', 'P-19565R15', 'Pirelli', 250.00, 450.00, 16, 4, 'Pneus', 'Prateleira I1'),
('Lâmpada farol H7', 'LF-H7', 'Philips', 25.00, 50.00, 30, 6, 'Iluminação', 'Prateleira J1'),
('Filtro de combustível', 'FC-1234', 'Tecfil', 25.00, 50.00, 25, 5, 'Filtros', 'Prateleira A3'),
('Bomba de combustível', 'BC-5678', 'Bosch', 200.00, 400.00, 5, 1, 'Combustível', 'Prateleira K1'),
('Sensor de oxigênio', 'SO-1234', 'Bosch', 150.00, 300.00, 8, 2, 'Elétrica', 'Prateleira E2');

-- Inserção de Fornecedores
INSERT INTO Fornecedor (razao_social, nome_fantasia, cnpj, telefone, email, endereco, cidade, estado, cep, contato_nome) VALUES
('Auto Peças Brasil Ltda', 'Auto Peças Brasil', '12.345.678/0001-90', '(11) 3456-7890', 'contato@autopecasbrasil.com', 'Av. Brasil, 1500', 'São Paulo', 'SP', '01310-200', 'Ricardo Mendes'),
('Distribuidora de Peças SA', 'DP Peças', '23.456.789/0001-01', '(11) 2345-6789', 'vendas@dppecas.com', 'Rua da Consolação, 800', 'São Paulo', 'SP', '01301-100', 'Fernanda Souza'),
('Importadora Automotiva Ltda', 'Import Auto', '34.567.890/0001-12', '(11) 3567-8901', 'comercial@importauto.com', 'Av. Paulista, 2000', 'São Paulo', 'SP', '01310-200', 'Carlos Eduardo'),
('Peças e Acessórios Genuínos SA', 'PAG Auto', '45.678.901/0001-23', '(11) 4567-8901', 'vendas@pagauto.com', 'Av. Santo Amaro, 1000', 'São Paulo', 'SP', '04506-000', 'Ana Paula'),
('Distribuidora Nacional de Lubrificantes Ltda', 'DNL Lubrificantes', '56.789.012/0001-34', '(11) 5678-9012', 'vendas@dnl.com', 'Av. das Nações Unidas, 10000', 'São Paulo', 'SP', '04578-000', 'Roberto Alves');

-- Relacionamento entre Fornecedor e Peça
INSERT INTO Fornecedor_Peca (fornecedor_id, peca_id, codigo_fornecedor, prazo_entrega_dias, preco_compra, ultima_compra) VALUES
(1, 1, 'F1-OL5W30', 2, 23.00, '2023-01-15'),
(1, 2, 'F1-FO1234', 2, 14.00, '2023-01-15'),
(1, 3, 'F1-FA5678', 2, 18.00, '2023-01-15'),
(1, 12, 'F1-VI1234', 2, 14.00, '2023-01-15'),
(1, 13, 'F1-CV5678', 2, 48.00, '2023-01-15'),
(2, 4, 'F2-PFD1234', 3, 58.00, '2023-02-10'),
(2, 5, 'F2-PFT5678', 3, 48.00, '2023-02-10'),
(2, 6, 'F2-AD1234', 5, 175.00, '2023-02-10'),
(2, 7, 'F2-AT5678', 5, 155.00, '2023-02-10'),
(3, 8, 'F3-CD1234', 7, 78.00, '2023-03-05'),
(3, 9, 'F3-TC5678', 7, 68.00, '2023-03-05'),
(3, 10, 'F3-BAT60', 3, 240.00, '2023-03-05'),
(3, 11, 'F3-KE1234', 10, 290.00, '2023-03-05'),
(4, 14, 'F4-FBDOT4', 2, 19.00, '2023-04-20'),
(4, 15, 'F4-AR1234', 2, 17.00, '2023-04-20'),
(4, 16, 'F4-P19565R15', 5, 240.00, '2023-04-20'),
(5, 1, 'F5-OL5W30', 1, 24.00, '2023-05-10'),
(5, 14, 'F5-FBDOT4', 1, 19.50, '2023-05-10'),
(5, 15, 'F5-AR1234', 1, 17.50, '2023-05-10');

-- Inserção de Ordens de Serviço
INSERT INTO Ordem_Servico (cliente_id, veiculo_id, data_entrada, data_previsao, data_conclusao, status, descricao_problema, diagnostico, forma_pagamento) VALUES
(1, 1, '2023-06-01 08:30:00', '2023-06-01 17:00:00', '2023-06-01 16:30:00', 'entregue', 'Veículo fazendo barulho ao frear', 'Pastilhas de freio desgastadas', 'cartao_credito'),
(2, 3, '2023-06-02 09:15:00', '2023-06-03 12:00:00', '2023-06-03 11:30:00', 'entregue', 'Troca de óleo e revisão geral', 'Veículo em bom estado, realizada manutenção preventiva', 'dinheiro'),
(3, 4, '2023-06-05 10:00:00', '2023-06-06 17:00:00', '2023-06-06 16:00:00', 'entregue', 'Ar condicionado não está gelando', 'Sistema com gás abaixo do nível, realizada recarga', 'cartao_debito'),
(4, 5, '2023-06-10 08:00:00', '2023-06-12 17:00:00', '2023-06-12 15:00:00', 'entregue', 'Revisão completa para viagem', 'Realizada manutenção preventiva completa', 'transferencia'),
(5, 7, '2023-06-15 14:30:00', '2023-06-17 17:00:00', '2023-06-17 16:30:00', 'entregue', 'Motor falhando em alta rotação', 'Problema no sistema de ignição, cabos e velas substituídos', 'cartao_credito'),
(6, 8, '2023-06-20 09:45:00', '2023-06-20 17:00:00', '2023-06-20 16:00:00', 'entregue', 'Troca de óleo', 'Realizada troca de óleo e filtros', 'pix'),
(7, 9, '2023-06-25 11:30:00', '2023-06-26 17:00:00', NULL, 'em_andamento', 'Barulho na suspensão', 'Amortecedores dianteiros desgastados', NULL),
(8, 10, '2023-06-28 08:15:00', '2023-06-30 17:00:00', NULL, 'em_andamento', 'Revisão completa do sistema de freios', 'Em diagnóstico', NULL),
(9, 11, '2023-07-01 10:00:00', '2023-07-01 17:00:00', NULL, 'aberta', 'Troca de bateria', 'Aguardando início do serviço', NULL),
(10, 12, '2023-07-02 14:00:00', '2023-07-05 17:00:00', NULL, 'aberta', 'Veículo não dá partida', 'Aguardando diagnóstico', NULL);

-- Inserção de Serviços realizados nas Ordens de Serviço
INSERT INTO OS_Servico (ordem_servico_id, servico_id, funcionario_id, valor_cobrado, tempo_gasto_minutos, descricao_adicional, garantia_dias) VALUES
(1, 2, 1, 200.00, 85, 'Troca de pastilhas dianteiras e verificação do sistema', 90),
(1, 9, 1, 180.00, 80, 'Troca das pastilhas de freio', 90),
(2, 1, 2, 150.00, 55, 'Troca de óleo e filtros', 30),
(2, 3, 3, 120.00, 60, 'Alinhamento e balanceamento', 30),
(3, 8, 7, 300.00, 110, 'Recarga de gás e verificação do sistema', 60),
(4, 1, 1, 150.00, 60, 'Troca de óleo e filtros', 30),
(4, 2, 1, 200.00, 90, 'Revisão completa do sistema de freios', 90),
(4, 3, 3, 120.00, 60, 'Alinhamento e balanceamento', 30),
(4, 13, 7, 150.00, 55, 'Higienização do ar condicionado', 30),
(5, 6, 2, 250.00, 115, 'Reparo no sistema de ignição', 60),
(6, 1, 1, 150.00, 50, 'Troca de óleo e filtros', 30);

-- Inserção de Peças utilizadas nas Ordens de Serviço
INSERT INTO OS_Peca (ordem_servico_id, peca_id, quantidade, valor_unitario, desconto) VALUES
(1, 4, 1, 120.00, 0.00),
(1, 5, 1, 100.00, 0.00),
(2, 1, 4, 45.00, 0.00),
(2, 2, 1, 30.00, 0.00),
(2, 3, 1, 40.00, 0.00),
(3, 15, 1, 35.00, 0.00),
(4, 1, 5, 45.00, 10.00),
(4, 2, 1, 30.00, 0.00),
(4, 3, 1, 40.00, 0.00),
(4, 4, 1, 120.00, 0.00),
(4, 14, 1, 35.00, 0.00),
(5, 12, 4, 30.00, 0.00),
(5, 13, 1, 100.00, 0.00),
(6, 1, 4, 45.00, 0.00),
(6, 2, 1, 30.00, 0.00);

-- Inserção de Pagamentos
INSERT INTO Pagamento (ordem_servico_id, valor, forma_pagamento, parcelas, status, data_pagamento) VALUES
(1, 600.00, 'cartao_credito', 2, 'aprovado', '2023-06-01 16:45:00'),
(2, 385.00, 'dinheiro', 1, 'aprovado', '2023-06-03 11:45:00'),
(3, 335.00, 'cartao_debito', 1, 'aprovado', '2023-06-06 16:15:00'),
(4, 1000.00, 'transferencia', 1, 'aprovado', '2023-06-12 15:30:00'),
(5, 470.00, 'cartao_credito', 2, 'aprovado', '2023-06-17 16:45:00'),
(6, 330.00, 'pix', 1, 'aprovado', '2023-06-20 16:15:00');

-- Inserção de Agendamentos
INSERT INTO Agendamento (cliente_id, veiculo_id, servico_id, funcionario_id, data_agendamento, data_prevista, status, observacoes) VALUES
(1, 1, 1, 1, '2023-07-10 09:00:00', '2023-07-15 10:00:00', 'agendado', 'Cliente solicitou revisão preventiva'),
(2, 3, 3, 3, '2023-07-11 10:30:00', '2023-07-16 14:00:00', 'agendado', 'Alinhamento e balanceamento após troca de pneus'),
(3, 4, 13, 7, '2023-07-12 11:15:00', '2023-07-17 09:00:00', 'agendado', 'Higienização do ar condicionado'),
(4, 5, 1, 1, '2023-07-13 14:00:00', '2023-07-18 11:00:00', 'confirmado', 'Troca de óleo e filtros'),
(5, 7, 5, 2, '2023-07-14 15:30:00', '2023-07-19 15:00:00', 'confirmado', 'Verificação de luz de injeção acesa');
