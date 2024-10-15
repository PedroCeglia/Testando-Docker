# 1. Usar uma imagem base do Node.js
FROM node:16-alpine

# 2. Definir o diretório de trabalho dentro do container
WORKDIR /app

# 3. Copiar o arquivo package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# 4. Instalar as dependências
RUN npm install

# 5. Copiar o restante dos arquivos do projeto
COPY . .

# 6. Construir o aplicativo React
RUN npm run build

# 7. Servir o aplicativo usando o servidor http-server
RUN npm install -g http-server

# 8. Expor a porta que o servidor vai usar
EXPOSE 3000

# 9. Comando para rodar o servidor
CMD ["http-server", "build", "-p", "3000"]
