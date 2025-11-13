CREATE SCHEMA IF NOT EXISTS dw_gold;

-- Dimensão Data
DROP TABLE IF EXISTS dw_gold.dim_data CASCADE;
CREATE TABLE dw_gold.dim_data (
    sk_data INT PRIMARY KEY,
    id_data INT,
    data_completa DATE,
    vl_ano INT,
    vl_mes INT,
    vl_dia_mes INT,
    desc_dia_semana VARCHAR(20),
    flag_fim_de_semana CHAR(1)
);

-- Dimensão Tempo (Hora)
DROP TABLE IF EXISTS dw_gold.dim_tempo CASCADE;
CREATE TABLE dw_gold.dim_tempo (
    sk_tempo INT PRIMARY KEY,
    id_tempo INT,
    hora_completa VARCHAR(5),
    vl_hora_dia INT,
    desc_periodo_dia VARCHAR(20)
);

-- Dimensão Severidade
DROP TABLE IF EXISTS dw_gold.dim_severidade CASCADE;
CREATE TABLE dw_gold.dim_severidade (
    sk_severidade INT PRIMARY KEY,
    id_severidade INT,
    desc_severidade VARCHAR(50)
);

-- Dimensão Clima
DROP TABLE IF EXISTS dw_gold.dim_clima CASCADE;
CREATE TABLE dw_gold.dim_clima (
    sk_clima INT PRIMARY KEY,
    id_clima INT,
    desc_clima VARCHAR(100)
);

-- Dimensão Condição da Pista
DROP TABLE IF EXISTS dw_gold.dim_pista CASCADE;
CREATE TABLE dw_gold.dim_pista (
    sk_pista INT PRIMARY KEY,
    id_pista INT,
    desc_pista VARCHAR(100)
);

-- Dimensão Condição de Luz
DROP TABLE IF EXISTS dw_gold.dim_luz CASCADE;
CREATE TABLE dw_gold.dim_luz (
    sk_luz INT PRIMARY KEY,
    id_luz INT,
    desc_luz VARCHAR(100)
);

-- Dimensão Área
DROP TABLE IF EXISTS dw_gold.dim_urbano CASCADE;
CREATE TABLE dw_gold.dim_urbano (
    sk_urbano INT PRIMARY KEY,
    id_urbano INT,
    desc_urbano VARCHAR(50)
);

-- Dimensão Tipo de Via
DROP TABLE IF EXISTS dw_gold.dim_tipo_via CASCADE;
CREATE TABLE dw_gold.dim_tipo_via (
    sk_tipo_via INT PRIMARY KEY,
    id_tipo_via INT,
    desc_tipo_via VARCHAR(100)
);

-- Dimensão Detalhe do Cruzamento
DROP TABLE IF EXISTS dw_gold.dim_cruzamento CASCADE;
CREATE TABLE dw_gold.dim_cruzamento (
    sk_cruzamento INT PRIMARY KEY,
    id_cruzamento INT,
    desc_cruzamento VARCHAR(100)
);

-- Dimensão Controle do Cruzamento
DROP TABLE IF EXISTS dw_gold.dim_controle_cruz CASCADE;
CREATE TABLE dw_gold.dim_controle_cruz (
    sk_controle_cruz INT PRIMARY KEY,
    id_controle_cruz INT,
    desc_controle_cruz VARCHAR(100)
);

-- Dimensão Física Pedestre
DROP TABLE IF EXISTS dw_gold.dim_ped_fisico CASCADE;
CREATE TABLE dw_gold.dim_ped_fisico (
    sk_ped_fisico INT PRIMARY KEY,
    id_ped_fisico INT,
    desc_ped_fisico VARCHAR(150)
);

-- Dimensão Condições Especiais
DROP TABLE IF EXISTS dw_gold.dim_cond_esp CASCADE;
CREATE TABLE dw_gold.dim_cond_esp (
    sk_cond_esp INT PRIMARY KEY,
    id_cond_esp INT,
    desc_cond_esp VARCHAR(150)
);

-- Dimensão Perigos na Pista
DROP TABLE IF EXISTS dw_gold.dim_perigos CASCADE;
CREATE TABLE dw_gold.dim_perigos (
    sk_perigos INT PRIMARY KEY,
    id_perigos INT,
    desc_perigos VARCHAR(150)
);

-- Dimensão Tipo de Veículo
DROP TABLE IF EXISTS dw_gold.dim_tipo_veiculo CASCADE;
CREATE TABLE dw_gold.dim_tipo_veiculo (
    sk_tipo_veiculo INT PRIMARY KEY,
    id_tipo_veiculo INT,
    desc_tipo_veiculo VARCHAR(100)
);

-- Dimensão Manobra do Veículo
DROP TABLE IF EXISTS dw_gold.dim_manobra CASCADE;
CREATE TABLE dw_gold.dim_manobra (
    sk_manobra INT PRIMARY KEY,
    id_manobra INT,
    desc_manobra VARCHAR(100)
);

-- Dimensão Localização do Veículo
DROP TABLE IF EXISTS dw_gold.dim_local_veic CASCADE;
CREATE TABLE dw_gold.dim_local_veic (
    sk_local_veic INT PRIMARY KEY,
    id_local_veic INT,
    desc_local_veic VARCHAR(150)
);

-- Dimensão Propulsão
DROP TABLE IF EXISTS dw_gold.dim_propulsao CASCADE;
CREATE TABLE dw_gold.dim_propulsao (
    sk_propulsao INT PRIMARY KEY,
    id_propulsao INT,
    desc_propulsao VARCHAR(50)
);

-- Dimensão Volante
DROP TABLE IF EXISTS dw_gold.dim_volante CASCADE;
CREATE TABLE dw_gold.dim_volante (
    sk_volante INT PRIMARY KEY,
    id_volante INT,
    desc_volante VARCHAR(50)
);

-- Dimensão Sexo
DROP TABLE IF EXISTS dw_gold.dim_sexo CASCADE;
CREATE TABLE dw_gold.dim_sexo (
    sk_sexo INT PRIMARY KEY,
    id_sexo INT,
    desc_sexo VARCHAR(50)
);

-- Dimensão Faixa Etária
DROP TABLE IF EXISTS dw_gold.dim_faixa_etaria CASCADE;
CREATE TABLE dw_gold.dim_faixa_etaria (
    sk_faixa_etaria INT PRIMARY KEY,
    id_faixa_etaria INT,
    desc_faixa_etaria VARCHAR(50)
);

-- Dimensão Classe da Vítima
DROP TABLE IF EXISTS dw_gold.dim_classe_vit CASCADE;
CREATE TABLE dw_gold.dim_classe_vit (
    sk_classe_vit INT PRIMARY KEY,
    id_classe_vit INT,
    desc_classe_vit VARCHAR(50)
);

-- Dimensão Tipo de Vítima
DROP TABLE IF EXISTS dw_gold.dim_tipo_vit CASCADE;
CREATE TABLE dw_gold.dim_tipo_vit (
    sk_tipo_vit INT PRIMARY KEY,
    id_tipo_vit INT,
    desc_tipo_vit VARCHAR(100)
);

-- Dimensão Movimento do Pedestre
DROP TABLE IF EXISTS dw_gold.dim_mov_ped CASCADE;
CREATE TABLE dw_gold.dim_mov_ped (
    sk_mov_ped INT PRIMARY KEY,
    id_mov_ped INT,
    desc_mov_ped VARCHAR(150)
);

-- Dimensão Passageiro Carro
DROP TABLE IF EXISTS dw_gold.dim_pass_carro CASCADE;
CREATE TABLE dw_gold.dim_pass_carro (
    sk_pass_carro INT PRIMARY KEY,
    id_pass_carro INT,
    desc_pass_carro VARCHAR(100)
);

-- Dimensão Passageiro Ônibus
DROP TABLE IF EXISTS dw_gold.dim_pass_bus CASCADE;
CREATE TABLE dw_gold.dim_pass_bus (
    sk_pass_bus INT PRIMARY KEY,
    id_pass_bus INT,
    desc_pass_bus VARCHAR(100)
);


--- FATO 1: ACIDENTE
DROP TABLE IF EXISTS dw_gold.ft_acidente CASCADE;
CREATE TABLE dw_gold.ft_acidente (
    -- Chave Primária
    id_acidente VARCHAR(13) PRIMARY KEY,
    
    -- Métricas (Valores)
    vl_qtd_veiculos INT,
    vl_qtd_vitimas INT,
    vl_longitude DOUBLE PRECISION,
    vl_latitude DOUBLE PRECISION,
    vl_limite_velocidade INT,
    
    -- Chaves Estrangeiras (FKs)
    fk_data INT REFERENCES dw_gold.dim_data(sk_data),
    fk_tempo INT REFERENCES dw_gold.dim_tempo(sk_tempo),
    fk_severidade INT REFERENCES dw_gold.dim_severidade(sk_severidade),
    fk_urbano INT REFERENCES dw_gold.dim_urbano(sk_urbano),
    fk_clima INT REFERENCES dw_gold.dim_clima(sk_clima),
    fk_pista INT REFERENCES dw_gold.dim_pista(sk_pista),
    fk_luz INT REFERENCES dw_gold.dim_luz(sk_luz),
    fk_tipo_via INT REFERENCES dw_gold.dim_tipo_via(sk_tipo_via),
    fk_cruzamento INT REFERENCES dw_gold.dim_cruzamento(sk_cruzamento),
    fk_controle_cruz INT REFERENCES dw_gold.dim_controle_cruz(sk_controle_cruz),
    fk_ped_fisico INT REFERENCES dw_gold.dim_ped_fisico(sk_ped_fisico),
    fk_cond_esp INT REFERENCES dw_gold.dim_cond_esp(sk_cond_esp),
    fk_perigos INT REFERENCES dw_gold.dim_perigos(sk_perigos)
);

-- FATO 2: VEÍCULO
DROP TABLE IF EXISTS dw_gold.ft_veiculo CASCADE;
CREATE TABLE dw_gold.ft_veiculo (
    id_acidente VARCHAR(13),
    id_veiculo INT, 
    vl_idade_motorista INT,
    vl_idade_veiculo INT,   
    fk_tipo_veiculo INT REFERENCES dw_gold.dim_tipo_veiculo(sk_tipo_veiculo),
    fk_manobra INT REFERENCES dw_gold.dim_manobra(sk_manobra),
    fk_local_veic INT REFERENCES dw_gold.dim_local_veic(sk_local_veic),
    fk_propulsao INT REFERENCES dw_gold.dim_propulsao(sk_propulsao),
    fk_volante INT REFERENCES dw_gold.dim_volante(sk_volante),
    fk_sexo_motorista INT REFERENCES dw_gold.dim_sexo(sk_sexo),
    fk_faixa_etaria_mot INT REFERENCES dw_gold.dim_faixa_etaria(sk_faixa_etaria),
    
    PRIMARY KEY (id_acidente, id_veiculo)
);

-- FATO 3: VÍTIMA
DROP TABLE IF EXISTS dw_gold.ft_vitima CASCADE;
CREATE TABLE dw_gold.ft_vitima (
    id_acidente VARCHAR(13),
    id_veiculo INT,
    id_vitima INT,
    vl_idade_vitima INT,
    fk_classe_vitima INT REFERENCES dw_gold.dim_classe_vit(sk_classe_vit),
    fk_tipo_vitima INT REFERENCES dw_gold.dim_tipo_vit(sk_tipo_vit),
    fk_severidade_vitima INT REFERENCES dw_gold.dim_severidade(sk_severidade),
    fk_sexo_vitima INT REFERENCES dw_gold.dim_sexo(sk_sexo),
    fk_faixa_etaria_vit INT REFERENCES dw_gold.dim_faixa_etaria(sk_faixa_etaria),
    fk_mov_pedestre INT REFERENCES dw_gold.dim_mov_ped(sk_mov_ped),
    fk_pass_carro INT REFERENCES dw_gold.dim_pass_carro(sk_pass_carro),
    fk_pass_bus INT REFERENCES dw_gold.dim_pass_bus(sk_pass_bus),
    
    PRIMARY KEY (id_acidente, id_veiculo, id_vitima)
);