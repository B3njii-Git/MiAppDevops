# Etapa 1: Build (Usando imagen ligera)
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# (Aquí podrías correr tests si tuvieras)

# Etapa 2: Producción
FROM node:20-alpine
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["node", "index.js"]