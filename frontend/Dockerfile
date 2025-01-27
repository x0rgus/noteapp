# Usando a imagem oficial do Node.js
FROM node:18

# Diretório de trabalho
WORKDIR /app

# Copiar os arquivos necessários
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar todo o código do frontend
COPY . .

# Expor a porta padrão do Vite
EXPOSE 3000

# Comando para iniciar o frontend
CMD ["npm", "run", "dev", "--", "--host"]
