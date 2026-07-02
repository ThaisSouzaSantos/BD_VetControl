-- DML.sql - Projeto VetControl
-- Inserção de 10 registros em tabelas relacionadas
-- (Pessoa, Cliente, Animal, Agendamento)

USE VetControl;

-- 1. Inserindo em Pessoa
INSERT INTO Pessoa (id_pessoa, nome, telefone) VALUES
(1, 'Carlos Alberto Silva', '11988887777'),
(2, 'Mariana Fontes Santos', '11977776666'),
(3, 'Roberto Costa e Silva', '11966665555'),
(4, 'Ana Beatriz Oliveira', '11955554444'),
(5, 'Juliana Mendes Lima', '11944443333'),
(6, 'Marcos Vinicius Souza', '11933332222'),
(7, 'Fernanda Alvez Rocha', '11922221111'),
(8, 'Ricardo Pereira Dias', '11911110000'),
(9, 'Beatriz Cavalcante', '11900009999'),
(10, 'Lucas Gabriel Mendes', '11999998888');

-- 2. Inserindo em Cliente (Especialização de Pessoa)
INSERT INTO Cliente (id_pessoa_FK, CPF, endereco) VALUES
(1, '123.456.789-01', 'Rua das Flores, 10'),
(2, '234.567.890-12', 'Avenida Paulista, 2000'),
(3, '345.678.901-23', 'Rua Chile, 30'),
(4, '456.789.012-34', 'Avenida Central, 40'),
(5, '567.890.123-45', 'Avenida Brasil, 50'),
(6, '678.901.234-56', 'Rua F, 60'),
(7, '789.012.345-67', 'Rua G, 70'),
(8, '890.123.456-78', 'Avenida H, 80'),
(9, '901.234.567-89', 'Rua I, 90'),
(10, '012.345.678-90', 'Rua J, 100');

-- 3. Inserindo em Animal (Relacionado ao Cliente)
INSERT INTO Animal (id_animal, nome, especie, raca, idade, peso, id_cliente_FK) VALUES
(1, 'Rex', 'Cão', 'Labrador', 5, 30.50, 1),
(2, 'Mia', 'Gato', 'Siamês', 3, 4.20, 2),
(3, 'Thor', 'Cão', 'Pug', 2, 8.00, 3),
(4, 'Luna', 'Gato', 'Persa', 4, 5.10, 4),
(5, 'Bolt', 'Cão', 'Beagle', 1, 12.30, 5),
(6, 'Mel', 'Cão', 'Poodle', 7, 6.50, 6),
(7, 'Simba', 'Gato', 'SRD', 2, 4.80, 7),
(8, 'Pipoca', 'Cão', 'Shih Tzu', 1, 5.50, 8),
(9, 'Pandora', 'Cão', 'Boxer', 6, 25.00, 9),
(10, 'Bidu', 'Cão', 'Schnauzer', 3, 9.10, 10);

-- 4. Inserindo em Agendamento (Relacionado a Cliente e Animal)
INSERT INTO Agendamento (id_agenda, data, horario_marcado, status, id_cliente_FK, id_animal_FK) VALUES
(1, '2026-06-01', '09:00:00', 'Pendente', 1, 1),
(2, '2026-06-01', '10:00:00', 'Confirmado', 2, 2),
(3, '2026-06-02', '11:00:00', 'Pendente', 3, 3),
(4, '2026-06-02', '14:00:00', 'Pendente', 4, 4),
(5, '2026-06-03', '08:30:00', 'Confirmado', 5, 5),
(6, '2026-06-03', '15:00:00', 'Cancelado', 6, 6),
(7, '2026-06-04', '09:30:00', 'Pendente', 7, 7),
(8, '2026-06-04', '10:30:00', 'Confirmado', 8, 8),
(9, '2026-06-05', '11:30:00', 'Pendente', 9, 9),
(10, '2026-06-05', '16:00:00', 'Confirmado', 10, 10);
