-- Script SQL para criação do banco de dados da Oficina Mecânica

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS oficina_mecanica;
USE oficina_mecanica;

-- Tabela Cliente
CREATE TABLE Cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('PF', 'PJ') NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(200) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    INDEX idx_cliente_cpf_cnpj (cpf_cnpj),
    INDEX idx_cliente_nome (nome)
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    veiculo_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL,
    ano_modelo INT NOT NULL,
    cor VARCHAR(30) NOT NULL,
    quilometragem INT NOT NULL,
    chassi VARCHAR(30) UNIQUE,
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_veiculo_placa (placa),
    INDEX idx_veiculo_cliente (cliente_id)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(15) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(200) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    especialidade VARCHAR(50),
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    INDEX idx_funcionario_cpf (cpf),
    INDEX idx_funcionario_especialidade (especialidade)
);

-- Tabela Servico
CREATE TABLE Servico (
    servico_id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor_padrao DECIMAL(10,2) NOT NULL,
    tempo_estimado_minutos INT NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    INDEX idx_servico_categoria (categoria)
);

-- Tabela Peca
CREATE TABLE Peca (
    peca_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo_referencia VARCHAR(50) NOT NULL UNIQUE,
    fabricante VARCHAR(50) NOT NULL,
    valor_custo DECIMAL(10,2) NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    estoque_atual INT NOT NULL DEFAULT 0,
    estoque_minimo INT NOT NULL DEFAULT 1,
    categoria VARCHAR(50) NOT NULL,
    localizacao_estoque VARCHAR(50),
    CHECK (estoque_atual >= 0),
    CHECK (valor_venda >= valor_custo),
    INDEX idx_peca_codigo (codigo_referencia),
    INDEX idx_peca_categoria (categoria)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    nome_fantasia VARCHAR(100),
    cnpj VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(200) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    contato_nome VARCHAR(100),
    INDEX idx_fornecedor_cnpj (cnpj),
    INDEX idx_fornecedor_razao_social (razao_social)
);

-- Tabela Ordem_Servico
CREATE TABLE Ordem_Servico (
    ordem_servico_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    veiculo_id INT NOT NULL,
    data_entrada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_previsao DATETIME,
    data_conclusao DATETIME,
    status ENUM('aberta', 'em_andamento', 'concluida', 'entregue', 'cancelada') NOT NULL DEFAULT 'aberta',
    descricao_problema TEXT NOT NULL,
    diagnostico TEXT,
    valor_total DECIMAL(10,2) DEFAULT 0,
    forma_pagamento VARCHAR(50),
    observacoes TEXT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_os_cliente (cliente_id),
    INDEX idx_os_veiculo (veiculo_id),
    INDEX idx_os_status (status),
    INDEX idx_os_data_entrada (data_entrada)
);

-- Tabela OS_Servico (Relacionamento entre Ordem de Serviço e Serviço)
CREATE TABLE OS_Servico (
    os_servico_id INT AUTO_INCREMENT PRIMARY KEY,
    ordem_servico_id INT NOT NULL,
    servico_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    valor_cobrado DECIMAL(10,2) NOT NULL,
    tempo_gasto_minutos INT,
    descricao_adicional TEXT,
    data_realizacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    garantia_dias INT DEFAULT 0,
    FOREIGN KEY (ordem_servico_id) REFERENCES Ordem_Servico(ordem_servico_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(funcionario_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_os_servico_os (ordem_servico_id),
    INDEX idx_os_servico_funcionario (funcionario_id)
);

-- Tabela OS_Peca (Relacionamento entre Ordem de Serviço e Peça)
CREATE TABLE OS_Peca (
    os_peca_id INT AUTO_INCREMENT PRIMARY KEY,
    ordem_servico_id INT NOT NULL,
    peca_id INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) DEFAULT 0,
    valor_total DECIMAL(10,2) GENERATED ALWAYS AS ((quantidade * valor_unitario) - desconto) STORED,
    FOREIGN KEY (ordem_servico_id) REFERENCES Ordem_Servico(ordem_servico_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (peca_id) REFERENCES Peca(peca_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK (quantidade > 0),
    CHECK (desconto >= 0),
    INDEX idx_os_peca_os (ordem_servico_id)
);

-- Tabela Fornecedor_Peca (Relacionamento entre Fornecedor e Peça)
CREATE TABLE Fornecedor_Peca (
    fornecedor_peca_id INT AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT NOT NULL,
    peca_id INT NOT NULL,
    codigo_fornecedor VARCHAR(50),
    prazo_entrega_dias INT,
    preco_compra DECIMAL(10,2) NOT NULL,
    ultima_compra DATE,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (peca_id) REFERENCES Peca(peca_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY uk_fornecedor_peca (fornecedor_id, peca_id),
    INDEX idx_fornecedor_peca_fornecedor (fornecedor_id),
    INDEX idx_fornecedor_peca_peca (peca_id)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    ordem_servico_id INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    forma_pagamento ENUM('dinheiro', 'cartao_credito', 'cartao_debito', 'pix', 'transferencia', 'boleto') NOT NULL,
    parcelas INT DEFAULT 1,
    status ENUM('pendente', 'aprovado', 'cancelado') NOT NULL DEFAULT 'pendente',
    data_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacoes TEXT,
    FOREIGN KEY (ordem_servico_id) REFERENCES Ordem_Servico(ordem_servico_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK (valor > 0),
    CHECK (parcelas > 0),
    INDEX idx_pagamento_os (ordem_servico_id),
    INDEX idx_pagamento_status (status)
);

-- Tabela Agendamento
CREATE TABLE Agendamento (
    agendamento_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    veiculo_id INT NOT NULL,
    servico_id INT,
    funcionario_id INT,
    data_agendamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATETIME NOT NULL,
    status ENUM('agendado', 'confirmado', 'cancelado', 'concluido') NOT NULL DEFAULT 'agendado',
    observacoes TEXT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(funcionario_id) ON DELETE SET NULL ON UPDATE CASCADE,
    INDEX idx_agendamento_cliente (cliente_id),
    INDEX idx_agendamento_data (data_prevista),
    INDEX idx_agendamento_status (status)
);

-- Triggers para atualização automática de valores e estoque

-- Trigger para atualizar o valor total da OS quando um serviço é adicionado
DELIMITER //
CREATE TRIGGER atualiza_valor_os_apos_servico
AFTER INSERT ON OS_Servico
FOR EACH ROW
BEGIN
    UPDATE Ordem_Servico
    SET valor_total = valor_total + NEW.valor_cobrado
    WHERE ordem_servico_id = NEW.ordem_servico_id;
END //
DELIMITER ;

-- Trigger para atualizar o valor total da OS quando um serviço é removido
DELIMITER //
CREATE TRIGGER atualiza_valor_os_apos_remover_servico
AFTER DELETE ON OS_Servico
FOR EACH ROW
BEGIN
    UPDATE Ordem_Servico
    SET valor_total = valor_total - OLD.valor_cobrado
    WHERE ordem_servico_id = OLD.ordem_servico_id;
END //
DELIMITER ;

-- Trigger para atualizar o valor total da OS quando uma peça é adicionada
DELIMITER //
CREATE TRIGGER atualiza_valor_os_apos_peca
AFTER INSERT ON OS_Peca
FOR EACH ROW
BEGIN
    UPDATE Ordem_Servico
    SET valor_total = valor_total + NEW.valor_total
    WHERE ordem_servico_id = NEW.ordem_servico_id;
END //
DELIMITER ;

-- Trigger para atualizar o valor total da OS quando uma peça é removida
DELIMITER //
CREATE TRIGGER atualiza_valor_os_apos_remover_peca
AFTER DELETE ON OS_Peca
FOR EACH ROW
BEGIN
    UPDATE Ordem_Servico
    SET valor_total = valor_total - OLD.valor_total
    WHERE ordem_servico_id = OLD.ordem_servico_id;
END //
DELIMITER ;

-- Trigger para atualizar o estoque quando uma peça é adicionada a uma OS
DELIMITER //
CREATE TRIGGER atualiza_estoque_apos_adicionar_peca
AFTER INSERT ON OS_Peca
FOR EACH ROW
BEGIN
    UPDATE Peca
    SET estoque_atual = estoque_atual - NEW.quantidade
    WHERE peca_id = NEW.peca_id;
END //
DELIMITER ;

-- Trigger para atualizar o estoque quando uma peça é removida de uma OS
DELIMITER //
CREATE TRIGGER atualiza_estoque_apos_remover_peca
AFTER DELETE ON OS_Peca
FOR EACH ROW
BEGIN
    UPDATE Peca
    SET estoque_atual = estoque_atual + OLD.quantidade
    WHERE peca_id = OLD.peca_id;
END //
DELIMITER ;
