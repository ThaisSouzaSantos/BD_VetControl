# Mapeamento para o Modelo Relacional

## Pessoa
- **id_pessoa** (PK)
- nome
- telefone

## Cliente
- **id_pessoa_FK** (PK, FK → Pessoa.id_pessoa)
- CPF
- endereco

## Veterinario
- **id_pessoa_FK** (PK, FK → Pessoa.id_pessoa)
- CRMV
- especialidade

## Animal
- **id_animal** (PK)
- nome
- especie
- raca
- idade
- peso
- **id_cliente_FK** (FK → Cliente.id_pessoa_FK)

## Agendamento
- **id_agenda** (PK)
- data
- horario_marcado
- status
- **id_cliente_FK** (FK → Cliente.id_pessoa_FK)
- **id_animal_FK** (FK → Animal.id_animal)

## Atendimento
- **id_atendimento** (PK)
- data_hora
- **id_animal_FK** (FK → Animal.id_animal)
- **id_vet_FK** (FK → Veterinario.id_pessoa_FK)

## Diagnostico
- **id_diagnostico** (PK)
- descricao
- **id_atendimento_FK** (FK → Atendimento.id_atendimento)

## Tratamento
- **id_tratamento** (PK)
- descricao
- **id_atendimento_FK** (FK → Atendimento.id_atendimento)

## Servico
- **id_servico** (PK)
- nome
- descricao

## Atendimento_Servico
- **id_atendimento_FK** (PK, FK → Atendimento.id_atendimento)
- **id_servico_FK** (PK, FK → Servico.id_servico)

## Medicamento
- **id_med** (PK)
- nome
- tipo
- validade

## Fornecedor
- **id_fornecedor** (PK)
- nome
- cnpj

## Lote
- **id_lote** (PK)
- numero
- validade
- **id_fornecedor_FK** (FK → Fornecedor.id_fornecedor)

## Medicamento_Lote
- **id_med_FK** (PK, FK → Medicamento.id_med)
- **id_lote_FK** (PK, FK → Lote.id_lote)

## Vacina
- **id_vacina** (PK)
- nome
- validade

## Aplicacao_Vacina
- **id_aplicacao** (PK)
- data_aplicacao
- **id_animal_FK** (FK → Animal.id_animal)
- **id_vacina_FK** (FK → Vacina.id_vacina)
- **id_lote_FK** (FK → Lote.id_lote)
- **id_vet_FK** (FK → Veterinario.id_pessoa_FK)

## Prescricao
- **id_prescricao** (PK)
- **id_atendimento_FK** (FK → Atendimento.id_atendimento)

## Prescricao_Medicamento
- **id_prescricao_FK** (PK, FK → Prescricao.id_prescricao)
- **id_med_FK** (PK, FK → Medicamento.id_med)