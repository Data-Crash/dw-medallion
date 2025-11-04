# Data Warehouse - Arquitetura Medallion

Este repositório contém o projeto de **Data Warehouse/Lakehouse** baseado na arquitetura **Medallion** (Bronze/Raw, Silver e Gold), utilizando como base de dados o conjunto **UK Road Safety Data (2005–2015)**.  

O projeto tem como objetivo **armazenar, limpar e modelar dados de acidentes rodoviários do Reino Unido**, transformando-os em informações estruturadas para análises de BI, com métricas de acidentes, vítimas, veículos e condições de tráfego.

---

## 📂 Estrutura do Repositório

dw-medallion/</br>
 ├──Data_Layer
 |  ├── raw/ # Dados originais (Bronze) </br>
 |  ├── silver/ # Dados limpos e padronizados</br>
 |  ├── gold/ # Dados modelados para BI (esquema estrela)</br>
 |  └── README.md
 └──Trasformer # ETLs e transformações das tabelas </br>
---

## 🔹 Camadas

- **RAW (Bronze):** dados originais, preservados como coletados.  
- **Silver:** dados tratados, integrados e enriquecidos.  
- **Gold:** dados prontos para análise, em modelo estrela (fato e dimensões).  


