
-- DDL.sql - Projeto VetControl
-- Criação do esquema físico do banco de dados

CREATE DATABASE VetControl;
USE VetControl;

-- Tabela Pessoa: Superclasse para Cliente e Veterinario
CREATE TABLE Pessoa (
    id_pessoa INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);

-- Tabela Cliente: Especialização de Pessoa
CREATE TABLE Cliente (
    id_pessoa_FK INT PRIMARY KEY,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    endereco VARCHAR(255),
    CONSTRAINT fk_cliente_pessoa FOREIGN KEY (id_pessoa_FK)
        REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

-- Tabela Veterinario: Especialização de Pessoa
CREATE TABLE Veterinario (
    id_pessoa_FK INT PRIMARY KEY,
    CRMV VARCHAR(20) NOT NULL UNIQUE,
    especialidade VARCHAR(50),
    CONSTRAINT fk_vet_pessoa FOREIGN KEY (id_pessoa_FK)
        REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

-- Tabela Animal: Vínculo obrigatório com Cliente
CREATE TABLE Animal (
    id_animal INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raca VARCHAR(30),
    idade INT,
    peso DECIMAL(5,2),
    id_cliente_FK INT NOT NULL,
    CONSTRAINT chk_animal_fisico CHECK (idade >= 0 AND peso >= 0),
    CONSTRAINT fk_animal_cliente FOREIGN KEY (id_cliente_FK)
        REFERENCES Cliente(id_pessoa_FK) ON UPDATE CASCADE
);

-- Tabela Agendamento: Controle de fluxo da clínica
CREATE TABLE Agendamento (
    id_agenda INT PRIMARY KEY,
    data DATE NOT NULL,
    horario_marcado TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Pendente',
    id_cliente_FK INT NOT NULL,
    id_animal_FK INT NOT NULL,
    CONSTRAINT fk_agenda_cliente FOREIGN KEY (id_cliente_FK)
        REFERENCES Cliente(id_pessoa_FK),
    CONSTRAINT fk_agenda_animal FOREIGN KEY (id_animal_FK)
        REFERENCES Animal(id_animal)
);

-- Tabela Atendimento: Registro de atendimentos clínicos
CREATE TABLE Atendimento (
    id_atendimento INT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    id_animal_FK INT NOT NULL,
    id_vet_FK INT NOT NULL,
    CONSTRAINT fk_atend_animal FOREIGN KEY (id_animal_FK)
        REFERENCES Animal(id_animal),
    CONSTRAINT fk_atend_vet FOREIGN KEY (id_vet_FK)
        REFERENCES Veterinario(id_pessoa_FK)
);

-- Tabela Diagnostico: Registro clínico pós-atendimento
CREATE TABLE Diagnostico (
    id_diagnostico INT PRIMARY KEY,
    descricao TEXT NOT NULL,
    id_atendimento_FK INT NOT NULL,
    CONSTRAINT fk_diag_atend FOREIGN KEY (id_atendimento_FK)
        REFERENCES Atendimento(id_atendimento)
);

-- Tabela Tratamento: Procedimentos prescritos
CREATE TABLE Tratamento (
    id_tratamento INT PRIMARY KEY,
    descricao TEXT NOT NULL,
    id_atendimento_FK INT NOT NULL,
    CONSTRAINT fk_trat_atend FOREIGN KEY (id_atendimento_FK)
        REFERENCES Atendimento(id_atendimento)
);

-- Tabela Servico: Catálogo de serviços da clínica
CREATE TABLE Servico (
    id_servico INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100)
);

-- Tabela Associativa: Atendimento_Servico (Relacionamento N:M)
CREATE TABLE Atendimento_Servico (
    id_atendimento_FK INT,
    id_servico_FK INT,
    PRIMARY KEY (id_atendimento_FK, id_servico_FK),
    CONSTRAINT fk_atend_serv_atend FOREIGN KEY (id_atendimento_FK)
        REFERENCES Atendimento(id_atendimento),
    CONSTRAINT fk_atend_serv_serv FOREIGN KEY (id_servico_FK)
        REFERENCES Servico(id_servico)
);

-- Tabela Fornecedor: Rastreabilidade de insumos
CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome_fantasia VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) UNIQUE NOT NULL
);

-- Tabela Lote: Rastreio por validade e fabricante
CREATE TABLE Lote (
    id_lote INT PRIMARY KEY,
    numero_lote VARCHAR(50) NOT NULL,
    data_validade DATE NOT NULL,
    id_fornecedor_FK INT NOT NULL,
    CONSTRAINT fk_lote_fornecedor FOREIGN KEY (id_fornecedor_FK)
        REFERENCES Fornecedor(id_fornecedor)
);

-- Tabela Medicamento: Associada a um lote específico
CREATE TABLE Medicamento (
    id_med INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(30),
    id_lote_FK INT NOT NULL,
    CONSTRAINT fk_med_lote FOREIGN KEY (id_lote_FK)
        REFERENCES Lote(id_lote)
);
