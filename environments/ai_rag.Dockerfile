FROM python:3.11-slim-bookworm

# Evitar basura de archivos y asegurar logs limpios
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Sin build-essential y python3-dev, chromadb no puede compilar sus índices
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    cmake \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN pip install wget

# Actualizar pip antes de las librerías pesadas
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Instalación de librerías
# Torch & Transformers specific
RUN pip install --no-cache-dir \
    transformers==4.41.2 \
    sentence-transformers==2.5.1 \
    huggingface-hub==0.23.4

# Vector DB
RUN pip install --no-cache-dir chromadb

# LangChain Ecosystem
RUN pip install --no-cache-dir \
    langchain \
    langgraph \
    langchain-google-genai \
    langchain-huggingface \
    langchain-community \
    langchain-chroma \
    langchain-classic

# Data & Utilities
RUN pip install --no-cache-dir \
    pandas \
    jupyterlab \
    python-dotenv \
    google-genai

# Exponer puerto de Jupyter (o Flask después)
EXPOSE 5000

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=5000", "--no-browser", "--allow-root", "--NotebookApp.token=''"]