# Normalização das Tabelas

## 1) Normalização da tabela Aplicacao_Vacina

A tabela encontra-se na 3FN:

Aplicacao_Vacina (
id_aplicacao,
data_aplicacao,
id_animal_FK,
id_vacina_FK,
id_lote_FK,
id_vet_FK
)

---

### Tabela Inicial (não normalizada)

Aplicacao_Vacina (
id_aplicacao,
data_aplicacao,
nome_animal,
nome_vacina,
nome_veterinario,
numero_lote
)

---

### Aplicando a 1FN

Todos os atributos passaram a possuir valores atômicos.

A tabela permanece:

Aplicacao_Vacina (
id_aplicacao,
data_aplicacao,
nome_animal,
nome_vacina,
nome_veterinario,
numero_lote
)

---

### Aplicando a 2FN

Os dados referentes ao animal, vacina, veterinário e lote foram separados em tabelas próprias para evitar redundância.

#### Resultado:

Animal (
id_animal,
nome
)

Vacina (
id_vacina,
nome
)

Veterinario (
id_vet,
nome
)

Lote (
id_lote,
numero
)

Aplicacao_Vacina (
id_aplicacao,
data_aplicacao,
id_animal_FK,
id_vacina_FK,
id_lote_FK,
id_vet_FK
)

---

### Aplicando a 3FN

Foram removidas dependências transitivas, mantendo apenas atributos diretamente dependentes da chave primária.

#### Tabela final normalizada:

Aplicacao_Vacina (
id_aplicacao,
data_aplicacao,
id_animal_FK,
id_vacina_FK,
id_lote_FK,
id_vet_FK
)

---

# 2) Normalização da tabela Atendimento_Servico

A tabela encontra-se na 3FN:

Atendimento_Servico (
id_atendimento_FK,
id_servico_FK
)

---

### Tabela Inicial (não normalizada)

Atendimento_Servico (
id_atendimento,
nome_servico,
descricao_servico
)

---

### Aplicando a 1FN

Todos os atributos passaram a possuir valores atômicos.

A tabela permanece:

Atendimento_Servico (
id_atendimento,
nome_servico,
descricao_servico
)

---

### Aplicando a 2FN

Os dados do serviço foram separados em uma tabela própria para evitar redundância.

#### Resultado:

Servico (
id_servico,
nome,
descricao
)

Atendimento_Servico (
id_atendimento_FK,
id_servico_FK
)

---

### Aplicando a 3FN

Foram removidas dependências transitivas, mantendo apenas atributos diretamente dependentes da chave primária.

#### Tabela final normalizada:

Atendimento_Servico (
id_atendimento_FK,
id_servico_FK
)

---

# 3) Normalização da tabela Prescricao_Medicamento

A tabela encontra-se na 3FN:

Prescricao_Medicamento (
id_prescricao_FK,
id_med_FK
)

---

### Tabela Inicial (não normalizada)

Prescricao_Medicamento (
id_prescricao,
nome_medicamento,
tipo,
validade
)

---

### Aplicando a 1FN

Todos os atributos passaram a possuir valores atômicos.

A tabela permanece:

Prescricao_Medicamento (
id_prescricao,
nome_medicamento,
tipo,
validade
)

---

### Aplicando a 2FN

Os dados do medicamento foram separados em uma tabela própria para evitar redundância.

#### Resultado:

Medicamento (
id_med,
nome,
tipo,
validade
)

Prescricao_Medicamento (
id_prescricao_FK,
id_med_FK
)

---

### Aplicando a 3FN

Foram removidas dependências transitivas, mantendo apenas atributos diretamente dependentes da chave primária.

#### Tabela final normalizada:

Prescricao_Medicamento (
id_prescricao_FK,
id_med_FK
)
