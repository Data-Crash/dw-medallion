### Modelo Entidade-Relacionamento (MER) - Conceitual

**Entidades Principais:**

*   **ACIDENTE**: Representa a ocorrência de um acidente de trânsito.
*   **VEÍCULO**: Representa um veículo específico envolvido em um acidente.
*   **VÍTIMA**: Representa uma pessoa que sofreu ferimentos (ou faleceu) em um acidente.

**Relacionamentos:**

1.  **`ACIDENTE` ↔ `VEÍCULO`**
    *   Um `ACIDENTE` **envolve** um ou mais `VEÍCULOS`. (Relacionamento 1:N)
    *   Um `VEÍCULO` **participa de** exatamente um `ACIDENTE`.

2.  **`VEÍCULO` ↔ `VÍTIMA`**
    *   Um `VEÍCULO` **pode conter** zero ou mais `VÍTIMAS` (a vítima pode ser o motorista, um passageiro ou até um pedestre associado ao impacto com o veículo). (Relacionamento 1:N)
    *   Uma `VÍTIMA` **está associada a** exatamente um `VEÍCULO`.

**Representação Textual do MER:**

```
+----------+       1..*       +---------+       0..*       +--------+
| ACIDENTE |-------envolve----| VEÍCULO |----pode conter---| VÍTIMA |
+----------+                  +---------+                  +--------+
```

---

### Diagrama Entidade-Relacionamento (DER) - Lógico/Físico

Este diagrama representa a estrutura das tabelas no banco de dados, incluindo chaves e relacionamentos, conforme definido no arquivo DDL. É a representação visual do seu *schema* de Data Warehouse, conhecido como **Esquema Estrela (Star Schema)**.

*   **Tabelas de Fato**: `accident`, `vehicle`, `casualty`. Elas contêm as métricas e as chaves estrangeiras para as dimensões.
*   **Tabelas de Dimensão**: Todas as outras tabelas (`road_type`, `weather`, etc.) que descrevem os dados das tabelas de fato.

**Explicação do Diagrama:**

1.  **Centro do Esquema**: A tabela `accident` é a tabela de fatos principal. Cada linha é um evento único de acidente.
2.  **Relação `accident` -> `vehicle`**: A tabela `vehicle` se conecta à `accident` pela chave `accident_index`. Esta é uma relação de **um-para-muitos** (um acidente pode ter vários veículos).
3.  **Relação `vehicle` -> `casualty`**: A tabela `casualty` se conecta à `vehicle` pela chave composta `(accident_index, vehicle_reference)`. Esta também é uma relação de **um-para-muitos** (um veículo pode ter várias vítimas associadas a ele).
4.  **Tabelas de Dimensão (os "braços" da estrela)**:
    *   Tanto `accident`, `vehicle` quanto `casualty` possuem colunas que são chaves estrangeiras (`FOREIGN KEY`) apontando para as tabelas de dimensão.
    *   Por exemplo, `accident.weather_conditions` se conecta a `weather.code` para obter a descrição do clima, e `vehicle.vehicle_type` se conecta a `vehicle_type.code` para saber se era um carro, moto, etc.