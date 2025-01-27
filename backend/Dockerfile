# Usando a imagem oficial do Python
FROM python:3.10-slim

# Diretório de trabalho
WORKDIR /app

# Copiar os arquivos necessários
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o código do backend
COPY . .

# Expor a porta padrão do Django
EXPOSE 8000

# Comando para rodar o servidor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
