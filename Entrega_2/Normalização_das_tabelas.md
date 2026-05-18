# Normalização das Tabelas

## 1) Normalização da tabela Aplicacao_Vacina

A tabela encontra-se na 3FN:

Aplicacao_Vacina (
<u>id_aplicacao (PK)</u>,
data_aplicacao,
id_animal_FK,
id_vacina_FK,
id_lote_FK,
id_vet_FK
)

---

### Tabela Inicial (não normalizada)

Aplicacao_Vacina (
<u>id_aplicacao (PK)</u>,
data_aplicacao,
nome_animal,
nome_vacina,
nome_veterinario,
numero_lote
)

---

### Aplicando a 1FN

Aplicacao_Vacina (
<u>id_aplicacao (PK)</u>,
data_aplicacao,
nome_animal,
nome_vacina,
nome_veterinario,
numero_lote
)

---

### Aplicando a 2FN

Animal (
<u>id_animal (PK)</u>,
nome
)

Vacina (
<u>id_vacina (PK)</u>,
nome
)

Veterinario (
<u>id_vet (PK)</u>,
nome
)

Lote (
<u>id_lote (PK)</u>,
numero
)

Aplicacao_Vacina (
<u>id_aplicacao (PK)</u>,
data_aplicacao,
id_animal_FK,
id_vacina_FK,
id_lote_FK,
id_vet_FK
)

---

### Aplicando a 3FN

Aplicacao_Vacina (
<u>id_aplicacao (PK)</u>,
data_aplicacao,
id_animal_FK,
id_vacina_FK,
id_lote_FK,
id_vet_FK
)

---

## 2) Normalização da tabela Atendimento_Servico

Tabela final na 3FN:

Atendimento_Servico (
<u>id_atendimento_FK (PK)</u>,
<u>id_servico_FK (PK)</u>
)

---

### Tabela Inicial

Atendimento_Servico (
<u>id_atendimento (PK)</u>,
nome_servico,
descricao_servico
)

---

### Aplicando a 1FN

Atendimento_Servico (
<u>id_atendimento (PK)</u>,
nome_servico,
descricao_servico
)

---

### Aplicando a 2FN

Servico (
<u>id_servico (PK)</u>,
nome,
descricao
)

Atendimento_Servico (
<u>id_atendimento_FK (PK)</u>,
<u>id_servico_FK (PK)</u>
)

---

### Aplicando a 3FN

Atendimento_Servico (
<u>id_atendimento_FK (PK)</u>,
<u>id_servico_FK (PK)</u>
)

---

## 3) Normalização da tabela Prescricao_Medicamento

Tabela final na 3FN:

Prescricao_Medicamento (
<u>id_prescricao_FK (PK)</u>,
<u>id_med_FK (PK)</u>
)

---

### Tabela Inicial

Prescricao_Medicamento (
<u>id_prescricao (PK)</u>,
nome_medicamento,
tipo,
validade
)

---

### Aplicando a 1FN

Prescricao_Medicamento (
<u>id_prescricao (PK)</u>,
nome_medicamento,
tipo,
validade
)

---

### Aplicando a 2FN

Medicamento (
<u>id_med (PK)</u>,
nome,
tipo,
validade
)

Prescricao_Medicamento (
<u>id_prescricao_FK (PK)</u>,
<u>id_med_FK (PK)</u>
)

---

### Aplicando a 3FN

Prescricao_Medicamento (
<u>id_prescricao_FK (PK)</u>,
<u>id_med_FK (PK)</u>
)
