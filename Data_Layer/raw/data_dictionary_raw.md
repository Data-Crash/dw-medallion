# 📑 Data Dictionary – RAW Layer

Este dicionário descreve as colunas presentes nos arquivos **originais (raw)** do dataset.  


---

## 🟥 Tabela: `Accident`

| Coluna | Tipo | Descrição | Valores/Códigos |
|--------|------|------------|-----------------|
| Accident_Index | String | Identificador único do acidente | Código alfanumérico |
| Location_Easting_OSGR | Integer | Coordenada Easting (sistema OSGR) | Numérico |
| Location_Northing_OSGR | Integer | Coordenada Northing (sistema OSGR) | Numérico |
| Longitude | Float | Longitude em graus decimais | - |
| Latitude | Float | Latitude em graus decimais | - |
| Police_Force | Integer | Força policial responsável | [Lista](dd_codes.md#police-force) |
| Accident_Severity | Integer | Severidade do acidente | [Lista](dd_codes.md#accident-severity) |
| Number_of_Vehicles | Integer | Nº de veículos envolvidos | Inteiro |
| Number_of_Casualties | Integer | Nº de vítimas | Inteiro |
| Date | Date | Data do acidente | dd/mm/yyyy |
| Day_of_Week | Integer | Dia da semana | [Lista](dd_codes.md#day-of-week) |
| Time | String | Hora do acidente | hh:mm |
| Local_Authority_District | Integer | Autoridade local (distrito) | [Lista](dd_codes.md#local-authority-district) |
| Local_Authority_Highway | String | Autoridade rodoviária responsável | [Lista](dd_codes.md#local-authority-highway) |
| 1st_Road_Class | Integer | Classe da estrada primária | [Lista](dd_codes.md#road-class) |
| 1st_Road_Number | Integer | Número da estrada primária | Numérico |
| Road_Type | Integer | Tipo de estrada | [Lista](dd_codes.md#road-type) |
| Speed_limit | Integer | Velocidade máxima da via | Inteiro (mph) |
| Junction_Detail | Integer | Detalhe do cruzamento | [Lista](dd_codes.md#junction-detail) |
| Junction_Control | Integer | Tipo de controle no cruzamento | [Lista](dd_codes.md#junction-control) |
| 2nd_Road_Class | Integer | Classe da estrada secundária | [Lista](dd_codes.md#road-class) |
| 2nd_Road_Number | Integer | Número da estrada secundária | Numérico |
| Pedestrian_Crossing-Human_Control | Integer | Controle humano de pedestres | [Lista](dd_codes.md#ped-cross-human) |
| Pedestrian_Crossing-Physical_Facilities | Integer | Infraestrutura física de travessia | [Lista](dd_codes.md#ped-cross-physical) |
| Light_Conditions | Integer | Condição de iluminação | [Lista](dd_codes.md#light-conditions) |
| Weather_Conditions | Integer | Condições climáticas | [Lista](dd_codes.md#weather-conditions) |
| Road_Surface_Conditions | Integer | Condições da superfície da via | [Lista](dd_codes.md#road-surface-conditions) |
| Special_Conditions_at_Site | Integer | Condições especiais no local | [Lista](dd_codes.md#special-conditions-at-site) |
| Carriageway_Hazards | Integer | Perigos na pista | [Lista](dd_codes.md#carriageway-hazards) |
| Urban_or_Rural_Area | Integer | Área urbana/rural | [Lista](dd_codes.md#urban-rural) |
| Did_Police_Officer_Attend_Scene_of_Accident | Integer | Presença da polícia | [Lista](dd_codes.md#police-officer-attend) |
| LSOA_of_Accident_Location | String | Código estatístico da área (LSOA) | Texto |

---

## 🟦 Tabela: `Casualty`

| Coluna | Tipo | Descrição | Valores/Códigos |
|--------|------|------------|-----------------|
| Accident_Index | String | Identificador do acidente | Chave estrangeira |
| Vehicle_Reference | Integer | Referência ao veículo | Inteiro |
| Casualty_Reference | Integer | Identificador da vítima | Inteiro |
| Casualty_Class | Integer | Classe da vítima | [Lista](dd_codes.md#casualty-class) |
| Sex_of_Casualty | Integer | Sexo da vítima | [Lista](dd_codes.md#sex-of-casualty) |
| Age_of_Casualty | Integer | Idade da vítima | Anos |
| Age_Band_of_Casualty | Integer | Faixa etária | [Lista](dd_codes.md#age-band-of-casualty) |
| Casualty_Severity | Integer | Severidade da vítima | [Lista](dd_codes.md#casualty-severity) |
| Pedestrian_Location | Integer | Localização do pedestre | [Lista](dd_codes.md#ped-location) |
| Pedestrian_Movement | Integer | Movimento do pedestre | [Lista](dd_codes.md#ped-movement) |
| Car_Passenger | Integer | Passageiro em carro | [Lista](dd_codes.md#car-passenger) |
| Bus_or_Coach_Passenger | Integer | Passageiro em ônibus | [Lista](dd_codes.md#bus-or-coach-passenger) |
| Pedestrian_Road_Maintenance_Worker | Integer | Pedestre trabalhador da via | Binário |
| Casualty_Type | Integer | Tipo de vítima (veículo/pedestre) | [Lista](dd_codes.md#casualty-type) |
| Casualty_Home_Area_Type | Integer | Tipo de área de residência | [Lista](dd_codes.md#casualty-home-area-type) |

---

## 🟩 Tabela: `Vehicle`

| Coluna | Tipo | Descrição | Valores/Códigos |
|--------|------|------------|-----------------|
| Accident_Index | String | Identificador do acidente | Chave estrangeira |
| Vehicle_Reference | Integer | Referência do veículo | Inteiro |
| Vehicle_Type | Integer | Tipo de veículo | [Lista](dd_codes#vehicle-type) |
| Towing_and_Articulation | Integer | Reboque/articulação | [Lista](dd_codes.md#towing-and-articulation) |
| Vehicle_Manoeuvre | Integer | Manobra realizada | [Lista](dd_codes#vehicle-manoeuvre) |
| Vehicle_Location-Restricted_Lane | Integer | Faixa restrita (ônibus, ciclovia etc.) | [Lista](dd_codes.md#vehicle-location) |
| Junction_Location | Integer | Localização no cruzamento | [Lista](dd_codes.md#junction-location) |
| Skidding_and_Overturning | Integer | Perda de controle/tombamento | [Lista](dd_codes.md#skidding-and-overturning) |
| Hit_Object_in_Carriageway | Integer | Objeto atingido na pista | [Lista](dd_codes.md#hit-object-in-carriageway) |
| Hit_Object_off_Carriageway | Integer | Objeto atingido fora da pista | [Lista](dd_codes.md#hit-object-off-carriageway) |
| Vehicle_Leaving_Carriageway | Integer | Saiu da pista | [Lista](dd_codes.md#vehicle-leaving-carriageway) |
| 1st_Point_of_Impact | Integer | Ponto inicial de impacto | [Lista](dd_codes.md#point-of-impact) |
| Was_Vehicle_Left_Hand_Drive? | Integer | Veículo com volante à esquerda | Binário |
| Journey_Purpose_of_Driver | Integer | Propósito da viagem | [Lista](dd_codes.md#journey-purpose) |
| Sex_of_Driver | Integer | Sexo do condutor | [Lista](dd_codes.md#sex-of-driver) |
| Age_of_Driver | Integer | Idade do condutor | Anos |
| Age_Band_of_Driver | Integer | Faixa etária do condutor | [Lista](dd_codes.md#age-band-of-driver) |
| Engine_Capacity_(CC) | Integer | Capacidade do motor (cm³) | Numérico |
| Propulsion_Code | Integer | Tipo de propulsão | [Lista](dd_codes.md#propulsion-code) |
| Age_of_Vehicle | Integer | Idade do veículo | Anos |
| Driver_IMD_Decile | Integer | Índice de privação do motorista (decis) | 1 a 10 |
| Driver_Home_Area_Type | Integer | Tipo de área de residência | [Lista](dd_codes.md#driver-home-area-type) |


