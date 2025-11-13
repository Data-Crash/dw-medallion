-- Consulta: Análise de Acidentes por Área Urbana vs Rural
SELECT 
    u.desc_urbano AS "Area",
    COUNT(f.id_acidente) AS "Total de Acidentes",
    SUM(CASE WHEN s.desc_severidade = 'Fatal' THEN 1 ELSE 0 END) AS "Qtd Fatais",
    SUM(CASE WHEN s.desc_severidade = 'Sério' THEN 1 ELSE 0 END) AS "Qtd Serios",
    SUM(CASE WHEN s.desc_severidade = 'Leve'  THEN 1 ELSE 0 END) AS "Qtd Leves",
    ROUND((SUM(CASE WHEN s.desc_severidade = 'Fatal' THEN 1.0 ELSE 0 END) / COUNT(f.id_acidente)) * 100, 2) AS "Pct Fatal",
    ROUND((SUM(CASE WHEN s.desc_severidade = 'Sério' THEN 1.0 ELSE 0 END) / COUNT(f.id_acidente)) * 100, 2) AS "Pct Serio",
    ROUND((SUM(CASE WHEN s.desc_severidade = 'Leve'  THEN 1.0 ELSE 0 END) / COUNT(f.id_acidente)) * 100, 2) AS "Pct Leve"
FROM dw_gold.ft_acidente f
    JOIN dw_gold.dim_urbano u ON f.fk_urbano = u.sk_urbano
    JOIN dw_gold.dim_severidade s ON f.fk_severidade = s.sk_severidade
WHERE u.desc_urbano IN ('Urbano', 'Rural') 
GROUP BY u.desc_urbano
ORDER BY "Pct Fatal" DESC;

-- Consulta: Análise de Acidentes por Tipo de Via e Iluminação
SELECT 
    v.desc_tipo_via AS "Tipo de Via",
    l.desc_luz AS "Iluminacao",
    COUNT(f.id_acidente) AS "Total de Acidentes",
    SUM(CASE WHEN s.desc_severidade = 'Fatal' THEN 1 ELSE 0 END) AS "Acidentes Fatais",
    ROUND(
        (SUM(CASE WHEN s.desc_severidade = 'Fatal' THEN 1.0 ELSE 0 END) / COUNT(f.id_acidente)) * 100, 
    2) AS "Taxa de Letalidade (%)"
FROM dw_gold.ft_acidente f
    JOIN dw_gold.dim_tipo_via v ON f.fk_tipo_via = v.sk_tipo_via
    JOIN dw_gold.dim_luz l ON f.fk_luz = l.sk_luz
    JOIN dw_gold.dim_severidade s ON f.fk_severidade = s.sk_severidade
GROUP BY 
    v.desc_tipo_via, 
    l.desc_luz
ORDER BY 
    "Taxa de Letalidade (%)" DESC
LIMIT 15;

-- Consulta: Análise de Acidentes por Limite de Velocidade
SELECT 
    fa.vl_limite_velocidade AS "Limite de Velocidade",
    COUNT(fa.id_acidente) AS "Total de Acidentes",
    SUM(CASE WHEN ds.desc_severidade = 'Fatal' THEN 1 ELSE 0 END) AS "Qtd Fatais",
    ROUND((SUM(CASE WHEN ds.desc_severidade = 'Fatal' THEN 1.0 ELSE 0 END) / COUNT(fa.id_acidente)) * 100, 2) AS "Taxa de Letalidade",
    ROUND((SUM(CASE WHEN ds.desc_severidade IN ('Fatal', 'Sério') THEN 1.0 ELSE 0 END) / COUNT(fa.id_acidente)) * 100, 2) AS "Risco Grave ou Fatal"
FROM dw_gold.ft_acidente fa
JOIN dw_gold.dim_severidade ds ON fa.fk_severidade = ds.sk_severidade
WHERE fa.vl_limite_velocidade > 0 
GROUP BY fa.vl_limite_velocidade
ORDER BY "Taxa de Letalidade" DESC;

-- Consulta: Análise de Veículos Acidentados por Tipo de Propulsão e Faixa Etária
SELECT 
    dp.desc_propulsao AS "Tipo de Propulsão",
    CASE 
        WHEN fv.vl_idade_veiculo BETWEEN 0 AND 5 THEN '01. Novo (0-5 anos)'
        WHEN fv.vl_idade_veiculo BETWEEN 6 AND 10 THEN '02. Médio (6-10 anos)'
        WHEN fv.vl_idade_veiculo BETWEEN 11 AND 15 THEN '03. Velho (11-15 anos)'
        ELSE '04. Muito Velho (16+ anos)' 
    END AS "Faixa Etária Veículo",
    COUNT(fv.id_veiculo) AS "Qtd Veículos Acidentados",
    ROUND(
        (COUNT(fv.id_veiculo) * 100.0 / SUM(COUNT(fv.id_veiculo)) OVER ()), 
    4) AS "Pct do Total Geral"

FROM dw_gold.ft_veiculo fv
JOIN dw_gold.dim_propulsao dp ON fv.fk_propulsao = dp.sk_propulsao
WHERE fv.vl_idade_veiculo >= 0 
GROUP BY 1, 2
ORDER BY 1, 2;

-- Consulta: Análise de Acidentes por Dia da Semana e Hora do Dia
SELECT 
    CASE 
        WHEN dd.desc_dia_semana = 'Sunday' THEN 'Domingo'
        WHEN dd.desc_dia_semana = 'Monday' THEN 'Segunda-feira'
        WHEN dd.desc_dia_semana = 'Tuesday' THEN 'Terça-feira'
        WHEN dd.desc_dia_semana = 'Wednesday' THEN 'Quarta-feira'
        WHEN dd.desc_dia_semana = 'Thursday' THEN 'Quinta-feira'
        WHEN dd.desc_dia_semana = 'Friday' THEN 'Sexta-feira'
        WHEN dd.desc_dia_semana = 'Saturday' THEN 'Sábado'
        ELSE dd.desc_dia_semana 
    END AS "Dia da Semana",
    dt.vl_hora_dia || 'h' AS "Hora do Dia",
    COUNT(fa.id_acidente) AS "Total de Acidentes"
FROM dw_gold.ft_acidente fa
    JOIN dw_gold.dim_data dd ON fa.fk_data = dd.sk_data
    JOIN dw_gold.dim_tempo dt ON fa.fk_tempo = dt.sk_tempo
GROUP BY 
    dd.desc_dia_semana, 
    dt.vl_hora_dia
ORDER BY 
    "Total de Acidentes" DESC
LIMIT 10;

-- Consulta: Top 15 Dias do Ano com Mais Acidentes
SELECT 
    TO_CHAR(dd.data_completa, 'DD/MM') AS "Data (Dia/Mês)",   
    dd.vl_dia_mes AS "Dia",
    dd.vl_mes AS "Mês",
    
    COUNT(fa.id_acidente) AS "Total Histórico de Acidentes",   
    ROUND(COUNT(fa.id_acidente) / COUNT(DISTINCT dd.vl_ano)::numeric, 1) AS "Média por Dia"
FROM dw_gold.ft_acidente fa
JOIN dw_gold.dim_data dd ON fa.fk_data = dd.sk_data
GROUP BY 
    dd.vl_mes, 
    dd.vl_dia_mes,
    TO_CHAR(dd.data_completa, 'DD/MM')
ORDER BY 
    "Total Histórico de Acidentes" DESC
LIMIT 15;

-- Consulta: Análise de Envolvimentos em Acidentes por Sexo e Faixa Etária do Motorista
SELECT 
    ds.desc_sexo AS "Sexo do Motorista",
    df.desc_faixa_etaria AS "Faixa Etária",
    COUNT(fv.id_veiculo) AS "Qtd Envolvimentos",
    ROUND(
        (COUNT(fv.id_veiculo) * 100.0 / SUM(COUNT(fv.id_veiculo)) OVER ()), 
    2) AS "% do Total"
FROM dw_gold.ft_veiculo fv
    JOIN dw_gold.dim_sexo ds ON fv.fk_sexo_motorista = ds.sk_sexo
    JOIN dw_gold.dim_faixa_etaria df ON fv.fk_faixa_etaria_mot = df.sk_faixa_etaria
WHERE ds.desc_sexo NOT IN ('Desconhecido', 'Ausente', 'Not known', 'Data missing or out of range')
  AND df.desc_faixa_etaria NOT IN ('Unknown', 'Data missing or out of range')
GROUP BY 
    ds.desc_sexo, 
    df.desc_faixa_etaria
ORDER BY 
    "Qtd Envolvimentos" DESC
LIMIT 15;

-- Consulta: Análise de Acidentes por Tipo de Via e Iluminação
SELECT 
    v.desc_tipo_via AS "Tipo de Via",
    l.desc_luz AS "Iluminacao",
    COUNT(f.id_acidente) AS "Total de Acidentes",
    SUM(CASE WHEN s.desc_severidade = 'Fatal' THEN 1 ELSE 0 END) AS "Acidentes Fatais",
    ROUND(
        (SUM(CASE WHEN s.desc_severidade = 'Fatal' THEN 1.0 ELSE 0 END) / COUNT(f.id_acidente)) * 100, 
    2) AS "Taxa de Letalidade (%)"
FROM dw_gold.ft_acidente f
    JOIN dw_gold.dim_tipo_via v ON f.fk_tipo_via = v.sk_tipo_via
    JOIN dw_gold.dim_luz l ON f.fk_luz = l.sk_luz
    JOIN dw_gold.dim_severidade s ON f.fk_severidade = s.sk_severidade
GROUP BY 
    v.desc_tipo_via, 
    l.desc_luz
ORDER BY 
    "Taxa de Letalidade (%)" DESC

-- Consulta: Análise de Acidentes por Condição Climática e Tipo de Estrada
SELECT 
    c.desc_clima AS "Condição Climática",
    v.desc_tipo_via AS "Tipo de Estrada",
    COUNT(f.id_acidente) AS "Total de Acidentes",
    SUM(CASE WHEN s.desc_severidade = 'Fatal' THEN 1 ELSE 0 END) AS "Qtd Fatais",
    ROUND(
        (SUM(CASE WHEN s.desc_severidade = 'Fatal' THEN 1.0 ELSE 0 END) / COUNT(f.id_acidente)) * 100, 
    2) AS "% Taxa de Letalidade"
FROM dw_gold.ft_acidente f
    JOIN dw_gold.dim_clima c ON f.fk_clima = c.sk_clima
    JOIN dw_gold.dim_tipo_via v ON f.fk_tipo_via = v.sk_tipo_via
    JOIN dw_gold.dim_severidade s ON f.fk_severidade = s.sk_severidade
WHERE c.desc_clima NOT IN ('Unknown', 'Data missing or out of range', 'Desconhecido', 'Ausente')
  AND v.desc_tipo_via NOT IN ('Unknown', 'Data missing or out of range', 'Desconhecido', 'Ausente')

GROUP BY 
    c.desc_clima, 
    v.desc_tipo_via
ORDER BY 
    c.desc_clima, 
    "% Taxa de Letalidade" DESC;


-- Consulta: Análise de Risco por Manobra do Veículo
SELECT 
    dm.desc_manobra AS "Manobra Realizada",
    COUNT(fv.id_veiculo) AS "Total de Veículos",
    SUM(CASE WHEN ds.desc_severidade = 'Fatal' THEN 1 ELSE 0 END) AS "Veículos em Acidentes Fatais",
    ROUND(
        (SUM(CASE WHEN ds.desc_severidade = 'Fatal' THEN 1.0 ELSE 0 END) / COUNT(fv.id_veiculo)) * 100, 
    2) AS "% Taxa de Letalidade"

FROM dw_gold.ft_veiculo fv
    JOIN dw_gold.dim_manobra dm ON fv.fk_manobra = dm.sk_manobra
    JOIN dw_gold.ft_acidente fa ON fv.id_acidente = fa.id_acidente
    JOIN dw_gold.dim_severidade ds ON fa.fk_severidade = ds.sk_severidade

WHERE dm.desc_manobra NOT IN ('Ausente', 'Data missing or out of range', 'Desconhecido')
GROUP BY 
    dm.desc_manobra
HAVING 
    COUNT(fv.id_veiculo) > 100
ORDER BY 
    "% Taxa de Letalidade" DESC;