# Usa a imagem oficial do PostgreSQL
FROM postgres:17

# Copia o script SQL para a pasta especial do PostgreSQL
# Tudo nessa pasta roda automaticamente na criação do banco
COPY /silver/DDL.sql /docker-entrypoint-initdb.d/
