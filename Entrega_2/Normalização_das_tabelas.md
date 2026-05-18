# Normalização das tabelas

## 1) Normalização da tabela Aplicacao_Vacina

### Normalização da Tabela:
Aplicacao_Vacina ( id_aplicacao, data_aplicacao, nome_animal, nome_vacina, nome_veterinario, numero_lote)

- **Aplicando a 1FN:**
  Todos os atributos passaram a possuir valores atômicos.
  
  *Tabela permanece:*
  Aplicacao_Vacina (id_aplicacao, data_aplicacao, nome_animal, nome_vacina, nome_veterinario, numero_lote)

- **Aplicando a 2FN:**
  Os dados referentes ao animal, vacina, veterinário e lote foram separados em tabelas próprias para evitar redundância.
  
  **Resultado:**
  Animal (id_animal, nome)
  Vacina (id_vacina, nome)
  Veterinario (id_vet, nome)
  Lote (id_lote, numero)
  Aplicacao_Vacina (id_aplicacao, data_aplicacao, id_animal_FK, id_vacina_FK, id_lote_FK, id_vet_FK)
  
- **Aplicando a 3FN:**
  Foram removidas dependências transitivas, mantendo apenas atributos diretamente dependentes da chave primária.
  
  **Tabela final normalizada:**
  Aplicacao_Vacina (id_aplicacao, data_aplicacao, id_animal_FK, id_vacina_FK, id_lote_FK,
  id_vet_FK)

  ___
## 2) Normalização da tabela Atendimento_Servico
### Normalização da Tabela:
Atendimento_Servico (id_atendimento, nome_servico, descricao_servico)

- **Aplicando a 1FN:**
  Todos os atributos passaram a possuir valores atômicos.
  
  *Tabela permanece:*
  Atendimento_Servico (id_atendimento, nome_servico, descricao_servico)
  
- **Aplicando a 2FN:**
  Separação dos dados do serviço.
  
  Servico (id_servico, nome, descricao)
  Atendimento_Servico (id_atendimento_FK, id_servico_FK)

- **Aplicando a 3FN:**
  Sem dependências transitivas.

_____
## 3) Normalização da tabela Prescricao_Medicamento
### Normalização da Tabela:
Prescricao_Medicamento (id_prescricao, nome_medicamento, tipo, validade)

- **Aplicando a 1FN:**
 Todos os atributos passaram a possuir valores atômicos.
  
   *Tabela permanece:*
    Prescricao_Medicamento (id_prescricao, nome_medicamento, tipo, validade)

- **Aplicando a 2FN**
    Separação dos dados do medicamento.
  
    Medicamento (id_med, nome, tipo, validade)
    Prescricao_Medicamento (id_prescricao_FK, id_med_FK)
  
- **Aplicando a 3FN:**
    Sem dependências transitivas.

