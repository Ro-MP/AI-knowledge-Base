FROM python:3.11-slim-bookworm

# Evitar diálogos interactivos
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Limpieza total y re-intento de instalación
RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar las herramientas core de IA
RUN pip install --no-cache-dir \
    pandas \
    jupyterlab

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]