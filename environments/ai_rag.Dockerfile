FROM python:3.11

# Evitar que Python genere archivos .pyc y permitir logs en tiempo real
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Instalar las herramientas core de IA
RUN pip install --no-cache-dir \
    langchain \
    langgraph \
    langchain-openai \
    langchain-community \
    chromadb \
    pandas \
    jupyterlab \
    python-dotenv

EXPOSE 5000

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=5000", "--no-browser", "--allow-root", "--NotebookApp.token=''"]