#  Regras de Negócio (RN) – Clínica Veterinária
### Clientes e Animais
- **RN01** – Todo animal deve estar obrigatoriamente vinculado a um único cliente.
- **RN02** – Um cliente pode possuir um ou mais animais cadastrados.
- **RN03** – Não é permitido cadastrar dois clientes com o mesmo CPF.
- **RN04** – Um animal deve possuir, obrigatoriamente, nome, espécie e idade no momento do cadastro.
- **RN05** – A idade e o peso do animal devem ser valores positivos.
---
### Atendimentos e Consultas
- **RN06** – Todo atendimento deve estar vinculado a um único animal.
- **RN07** – Um atendimento deve possuir, obrigatoriamente, um veterinário responsável.
- **RN08** – Um atendimento só pode ser registrado se houver um agendamento prévio (consulta marcada).
- **RN09** – Um animal pode possuir vários atendimentos ao longo do tempo.
- **RN10** – Cada atendimento deve conter, obrigatoriamente, data e horário.
- **RN11** – Diagnóstico e tratamento devem ser registrados obrigatoriamente após a realização do atendimento.
---
### Vacinas e Medicamentos
- **RN12** – Toda vacina ou medicamento deve possuir cadastro com nome, fabricante e validade.
- **RN13** – Não é permitida a aplicação de vacinas ou medicamentos com data de validade expirada.
- **RN14** – Toda vacina aplicada deve estar associada a um animal e a um atendimento.
- **RN15** – Cada vacina deve possuir identificação de lote para rastreabilidade.
---
### Serviços e Procedimentos
- **RN16** – Todo serviço realizado deve estar vinculado a um atendimento.
- **RN17** – Um atendimento pode possuir um ou mais serviços associados.
- **RN18** – Cada serviço deve possuir um custo registrado maior ou igual a zero.
- **RN19** – Não é permitido registrar serviços sem especificar o tipo (consulta, cirurgia, exame, etc.).
---
### Controle e Histórico
- **RN20** – O histórico clínico de um animal deve ser composto por todos os seus atendimentos registrados.
- **RN21** – O histórico de serviços de um cliente deve considerar todos os serviços realizados nos seus animais.
- **RN22** – O sistema deve permitir consultas de atendimentos por intervalo de datas válido (data inicial ≤ data final).
---
### Profissionais
- **RN23** – Todo veterinário deve estar previamente cadastrado no sistema.
- **RN24** – Um veterinário pode ser responsável por vários atendimentos.
