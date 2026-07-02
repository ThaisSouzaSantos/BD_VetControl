-- DQL.sql - Projeto VetControl
-- Seis consultas complexas (subconsultas e operadores de conjunto)

USE VetControl;

-- Consulta 1: Animais de Clientes residentes em Avenidas (Subconsulta IN)
-- Objetivo: Filtrar animais para campanhas de saúde pública focadas
-- em áreas de alta densidade (Avenidas).

SELECT nome, especie, raca
FROM Animal
WHERE id_cliente_FK IN (
    SELECT id_pessoa_FK FROM Cliente WHERE endereco LIKE 'Avenida%'
);

-- Consulta 2: Agendamentos de Animais com Peso Acima da Média (Subconsulta Escalar)
-- Objetivo: Auxiliar a triagem pré-anestésica, identificando dinamicamente
-- animais que fogem do padrão de peso médio da clínica.

SELECT id_agenda, data, id_animal_FK
FROM Agendamento
WHERE id_animal_FK IN (
    SELECT id_animal FROM Animal WHERE peso > (SELECT AVG(peso) FROM Animal)
);

-- Consulta 3: Clientes sem Agendamentos Pendentes (Subconsulta NOT EXISTS)
-- Objetivo: Identificar clientes inativos ou com ciclo de atendimento
-- concluído para ações de reativação (mais seguro que NOT IN contra NULL).

SELECT p.nome
FROM Pessoa p
JOIN Cliente c ON p.id_pessoa = c.id_pessoa_FK
WHERE NOT EXISTS (
    SELECT 1 FROM Agendamento a
    WHERE a.id_cliente_FK = c.id_pessoa_FK AND a.status = 'Pendente'
);

-- Consulta 4: Relatório de Espécies Atendidas com Frequência (GROUP BY/HAVING)
-- Objetivo: Análise gerencial da especialização da clínica por volume
-- de espécies cadastradas.

SELECT especie, COUNT(id_animal) AS total_animais
FROM Animal
GROUP BY especie
HAVING COUNT(id_animal) > 1;

-- Consulta 5: Listagem Unificada de Stakeholders (UNION)
-- Objetivo: Consolidar todos os nomes registrados no sistema para
-- controle de acesso físico à clínica.

SELECT p.nome, 'Cliente' AS perfil
FROM Pessoa p
JOIN Cliente c ON p.id_pessoa = c.id_pessoa_FK
UNION
SELECT p.nome, 'Veterinário' AS perfil
FROM Pessoa p
JOIN Veterinario v ON p.id_pessoa = v.id_pessoa_FK;

-- Consulta 6: Média de Idade dos Animais por Cliente (Joins e Agregação)
-- Objetivo: Segmentar o público-alvo para serviços pediátricos ou
-- geriátricos baseando-se na média de idade dos pets de cada tutor.

SELECT p.nome AS tutor, AVG(a.idade) AS media_idade_pet
FROM Pessoa p
JOIN Cliente c ON p.id_pessoa = c.id_pessoa_FK
JOIN Animal a ON c.id_pessoa_FK = a.id_cliente_FK
GROUP BY p.nome
ORDER BY media_idade_pet DESC;
