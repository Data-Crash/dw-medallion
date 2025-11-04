### Dicionário de Dados

A estrutura do banco de dados segue um modelo dimensional (esquema estrela), ideal para um Data Warehouse. Ele é composto por tabelas de fatos (`accident`, `vehicle`, `casualty`) que armazenam os eventos, e tabelas de dimensão (como `accident_severity`, `day_of_week`, etc.) que fornecem o contexto e a descrição dos códigos usados nas tabelas de fatos.

A tabela `joined` parece ser uma tabela de *staging* ou temporária, usada para carregar os dados brutos antes de distribuí-los para as tabelas finais normalizadas.

---

### Tabela `accident`

Armazena os detalhes principais de cada acidente. Cada linha representa um único acidente.

| Nome da Coluna | Tipo de Dado | Restrições | Descrição |
| :--- | :--- | :--- | :--- |
| `accident_index` | `CHAR(13)` | `PRIMARY KEY` | Identificador único para o acidente. |
| `longitude` | `DOUBLE PRECISION` | | Coordenada de longitude da localização do acidente. |
| `latitude` | `DOUBLE PRECISION` | | Coordenada de latitude da localização do acidente. |
| `accident_severity` | `INT` | `FK -> accident_severity(code)` | Código que representa a gravidade do acidente (e.g., Fatal, Grave, Leve). |
| `number_of_vehicles` | `INT` | | Número total de veículos envolvidos no acidente. |
| `number_of_casualties` | `INT` | | Número total de vítimas (feridos ou mortos) no acidente. |
| `accident_timestamp` | `TIMESTAMP` | | Data e hora exatas em que o acidente ocorreu. |
| `day_of_week` | `INT` | `FK -> day_of_week(code)` | Código para o dia da semana em que o acidente ocorreu. |
| `accident_time` | `CHAR(5)` | | Hora do acidente no formato 'HH:MM'. |
| `road_type` | `INT` | `FK -> road_type(code)` | Código para o tipo de via (e.g., Pista única, Pista dupla). |
| `speed_limit` | `INT` | | Limite de velocidade da via no local do acidente. |
| `junction_detail` | `INT` | `FK -> junction_detail(code)` | Código que descreve o detalhe do cruzamento onde o acidente ocorreu. |
| `junction_control` | `INT` | `FK -> junction_control(code)` | Código para o tipo de controle de tráfego no cruzamento (e.g., Semáforo, Placa de Pare). |
| `pedestrian_crossing_physical_facilities` | `INT` | `FK -> ped_cross_physical(code)` | Código para a infraestrutura física para travessia de pedestres no local. |
| `light_conditions` | `INT` | `FK -> light_conditions(code)` | Código para as condições de iluminação no momento do acidente. |
| `weather_conditions` | `INT` | `FK -> weather(code)` | Código para as condições climáticas no momento do acidente. |
| `road_surface_conditions` | `INT` | `FK -> road_surface(code)` | Código para as condições da superfície da estrada. |
| `special_conditions_at_site` | `INT` | `FK -> special_conditions_at_site(code)` | Código para condições especiais no local (e.g., Obras na via). |
| `carriageway_hazards` | `INT` | `FK -> carriageway_hazard(code)` | Código para perigos na pista (e.g., Objeto na pista). |
| `urban_or_rural_area` | `INT` | `FK -> urban_rural(code)` | Código que indica se o acidente ocorreu em área urbana ou rural. |

---

### Tabela `vehicle`

Armazena informações sobre cada veículo envolvido em um acidente.

| Nome da Coluna | Tipo de Dado | Restrições | Descrição |
| :--- | :--- | :--- | :--- |
| `accident_index` | `CHAR(13)` | `PRIMARY KEY, FK -> accident(accident_index)` | Identificador do acidente ao qual o veículo está associado. |
| `vehicle_reference` | `INT` | `PRIMARY KEY` | Identificador sequencial do veículo dentro do mesmo acidente. |
| `vehicle_type` | `INT` | `FK -> vehicle_type(code)` | Código para o tipo de veículo (e.g., Carro, Motocicleta). |
| `vehicle_manoeuvre` | `INT` | `FK -> vehicle_manoeuvre(code)` | Código para a manobra que o veículo estava realizando. |
| `vehicle_location_restricted_lane` | `INT` | `FK -> vehicle_location(code)` | Código para a localização do veículo em faixas restritas. |
| `was_vehicle_left_hand_drive` | `INT` | | Indicador se o veículo tinha direção à esquerda (1=Sim, 2=Não). |
| `sex_of_driver` | `INT` | `FK -> sex(code)` | Código para o sexo do motorista. |
| `age_of_driver` | `INT` | | Idade exata do motorista. |
| `age_band_of_driver` | `INT` | `FK -> age_band(code)` | Código para a faixa etária do motorista. |
| `propulsion_code` | `INT` | `FK -> propulsion_code(code)` | Código para o tipo de propulsão do veículo (e.g., Gasolina, Elétrico). |
| `age_of_vehicle` | `INT` | | Idade do veículo em anos. |

---

### Tabela `casualty`

Armazena informações sobre cada vítima (pessoa ferida ou morta) em um acidente.

| Nome da Coluna | Tipo de Dado | Restrições | Descrição |
| :--- | :--- | :--- | :--- |
| `accident_index` | `CHAR(13)` | `PRIMARY KEY, FK -> accident(accident_index)` | Identificador do acidente. |
| `vehicle_reference` | `INT` | `PRIMARY KEY, FK -> vehicle(accident_index, vehicle_reference)` | Identificador do veículo em que a vítima estava. |
| `casualty_reference` | `INT` | `PRIMARY KEY` | Identificador sequencial da vítima dentro do mesmo acidente. |
| `casualty_class` | `INT` | `FK -> casualty_class(code)` | Código para a classe da vítima (e.g., Motorista, Passageiro, Pedestre). |
| `sex_of_casualty` | `INT` | `FK -> sex(code)` | Código para o sexo da vítima. |
| `age_of_casualty` | `INT` | | Idade exata da vítima. |
| `age_band_of_casualty` | `INT` | `FK -> age_band(code)` | Código para a faixa etária da vítima. |
| `casualty_severity` | `INT` | `FK -> casualty_severity(code)` | Código para a gravidade dos ferimentos da vítima. |
| `pedestrian_movement` | `INT` | `FK -> ped_movement(code)` | Código para o movimento do pedestre (se a vítima era um). |
| `car_passenger` | `INT` | `FK -> car_passenger(code)` | Código que indica a posição do passageiro no carro (se aplicável). |
| `bus_or_coach_passenger` | `INT` | `FK -> bus_or_coach(code)` | Código que indica como o passageiro entrou/saiu do ônibus (se aplicável). |
| `casualty_type` | `INT` | `FK -> casualty_type(code)` | Código para o tipo de usuário da via que a vítima era. |

---

### Tabelas de Dimensão (Lookup)

As tabelas a seguir são tabelas de dimensão. Elas servem para "traduzir" os códigos numéricos armazenados nas tabelas de fatos em descrições textuais legíveis. Todas elas compartilham uma estrutura similar:

*   `code` (INT, PRIMARY KEY): O código numérico.
*   `description` (VARCHAR): O texto descritivo correspondente.

| Nome da Tabela | Descrição |
| :--- | :--- |
| `accident_severity` | Descreve a gravidade de um acidente. |
| `age_band` | Descreve faixas etárias. |
| `bus_or_coach` | Descreve o comportamento de um passageiro de ônibus. |
| `car_passenger` | Descreve a posição de um passageiro em um carro. |
| `carriageway_hazard` | Descreve perigos na pista. |
| `casualty_class` | Descreve a classe da vítima (motorista, pedestre, etc.). |
| `casualty_severity` | Descreve a gravidade dos ferimentos de uma vítima. |
| `casualty_type` | Descreve o tipo de vítima (e.g., pedestre, ciclista, etc.). |
| `day_of_week` | Nomes dos dias da semana. |
| `junction_control` | Tipos de controle em um cruzamento (semáforo, placa, etc.). |
| `junction_detail` | Tipos de cruzamento (rotatória, em T, etc.). |
| `light_conditions` | Condições de iluminação (dia, noite, etc.). |
| `ped_cross_physical` | Infraestrutura para travessia de pedestres. |
| `ped_movement` | Movimento de pedestres. |
| `propulsion_code` | Tipo de combustível/propulsão do veículo. |
| `road_surface` | Condições da superfície da pista (seca, molhada, etc.). |
| `road_type` | Tipos de via (pista única, dupla, etc.). |
| `sex` | Sexo (masculino, feminino). |
| `special_conditions_at_site` | Condições especiais no local do acidente (obras, etc.). |
| `urban_rural` | Classificação da área (urbana ou rural). |
| `vehicle_location` | Localização do veículo em faixas especiais. |
| `vehicle_manoeuvre` | Manobras realizadas pelo veículo. |
| `vehicle_type` | Tipos de veículo (carro, moto, etc.). |
| `weather` | Condições climáticas. |

---

### Tabela `joined`


| Nome da Coluna | Tipo de Dado | Descrição |
| :--- | :--- | :--- |
| `accident_index` | `text` | Identificador do acidente. |
| `vehicle_reference` | `int4` | Identificador do veículo no acidente. |
| `longitude` | `float8` | Coordenada de longitude. |
| `latitude` | `float8` | Coordenada de latitude. |
| `accident_severity` | `int4` | Código da gravidade do acidente. |
| `number_of_vehicles` | `int4` | Número de veículos envolvidos. |
| `number_of_casualties` | `int4` | Número de vítimas. |
| `accident_timestamp` | `date` | Data do acidente. |
| `day_of_week` | `int4` | Código do dia da semana. |
| `accident_time` | `text` | Hora do acidente. |
| `road_type` | `int4` | Código do tipo de via. |
| `speed_limit` | `int4` | Limite de velocidade. |
| `junction_detail` | `int4` | Código do detalhe do cruzamento. |
| `junction_control` | `int4` | Código do controle do cruzamento. |
| `pedestrian_crossing_physical_facilities` | `int4` | Código da infraestrutura para pedestres. |
| `light_conditions` | `int4` | Código das condições de iluminação. |
| `weather_conditions` | `int4` | Código das condições climáticas. |
| `road_surface_conditions` | `int4` | Código das condições da superfície da via. |
| `special_conditions_at_site` | `int4` | Código de condições especiais no local. |
| `carriageway_hazards` | `int4` | Código de perigos na pista. |
| `urban_or_rural_area` | `int4` | Código de área urbana/rural. |
| `vehicle_type` | `int4` | Código do tipo de veículo. |
| `vehicle_manoeuvre` | `int4` | Código da manobra do veículo. |
| `vehicle_location_restricted_lane` | `int4` | Código da localização do veículo. |
| `was_vehicle_left_hand_drive` | `int4` | Indicador de direção à esquerda. |
| `sex_of_driver` | `int4` | Código do sexo do motorista. |
| `age_of_driver` | `int4` | Idade do motorista. |
| `age_band_of_driver` | `int4` | Código da faixa etária do motorista. |
| `propulsion_code` | `int4` | Código do tipo de propulsão. |
| `age_of_vehicle` | `int4` | Idade do veículo. |
| `casualty_reference` | `int4` | Identificador da vítima no acidente. |
| `casualty_class` | `int4` | Código da classe da vítima. |
| `sex_of_casualty` | `int4` | Código do sexo da vítima. |
| `age_of_casualty` | `int4` | Idade da vítima. |
| `age_band_of_casualty` | `int4` | Código da faixa etária da vítima. |
| `casualty_severity` | `int4` | Código da gravidade da vítima. |
| `pedestrian_movement` | `int4` | Código do movimento do pedestre. |
| `car_passenger` | `int4` | Código da posição do passageiro no carro. |
| `bus_or_coach_passenger` | `int4` | Código do comportamento do passageiro de ônibus. |
| `casualty_type` | `int4` | Código do tipo de vítima. |

---


