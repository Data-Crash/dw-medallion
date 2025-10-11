FROM python:3.11.5-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      default-jre-headless \
      tini \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# porta do jupyter
EXPOSE 8888

ENTRYPOINT ["/usr/bin/tini","--"]

CMD ["bash", "-lc", "jupyter nbconvert --to notebook --inplace --execute /app/etl/etl.ipynb --ExecutePreprocessor.timeout=600"]
