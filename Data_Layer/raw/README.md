# Camada RAW (Bronze)

Esta pasta contém os **dados brutos** (Bronze) do Data Warehouse, preservados exatamente como foram coletados.

---

## 📑 Catálogo de Arquivos

| Arquivo | Descrição |
|---------|-----------|
| Accidents0515.csv | Registro de acidentes (2005–2015) |
| Casualties0515.csv | Registro de vítimas por acidente |
| Vehicles0515.csv | Registro de veículos envolvidos |
| contextCSVs/*.csv | Tabelas de referência (tipos de acidente, severidade, dias da semana, tipos de veículo, etc.) |

---

## 📋 Metadados

| Arquivo | Granularidade | Chave Primária | Período | Observações |
|---------|---------------|----------------|---------|-------------|
| Accidents0515.csv | 1 registro = 1 acidente | Accident_Index | 2005–2015 | Dados já consolidados (2005–2014 + 2015) |
| Casualties0515.csv | 1 registro = 1 vítima | Casualty_Index | 2005–2015 | Linkado pelo Accident_Index |
| Vehicles0515.csv | 1 registro = 1 veículo | Vehicle_Index | 2005–2015 | Linkado pelo Accident_Index |
| contextCSVs/*.csv | Lookup / dimensão | Code | 2005–2015 | Tabelas de referência para substituir códigos por descrições |

---

## 📌 Observações

- Dados originais **não foram alterados**; preservam o formato CSV.  
- Organização por tipo de entidade (`Accidents`, `Casualties`, `Vehicles`) e tabelas de contexto.  
- Dados históricos; **não há atualizações periódicas**.  
- Esta camada garante a **fonte única da verdade** e permite rastreabilidade/auditoria completa.
