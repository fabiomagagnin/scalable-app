# Etapa de build
FROM node:22.13-alpine3.20

# Diretório de trabalho
WORKDIR /app

# Copia apenas o package.json e package-lock.json para instalar dependências
COPY package*.json ./

# Instala dependências em modo de produção
RUN npm ci --only=production

# Copia o restante da aplicação
COPY . .

# Expondo a porta da aplicação
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["node", "index.js"]
