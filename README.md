# 🚀 Automatización CI/CD: Docker Hub con GitHub Actions

![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-blueviolet?style=for-the-badge&logo=githubactions)
![Docker](https://img.shields.io/badge/Docker-Hub-blue?style=for-the-badge&logo=docker)

## 📝 Descripción
Este proyecto implementa un pipeline de **Integración y Entrega Continua (CI/CD)**. El objetivo es automatizar la construcción de una imagen Docker optimizada y su posterior publicación en **Docker Hub** cada vez que se realiza un cambio en la rama principal.

## 🛠️ Tecnologías Utilizadas
* **Docker:** Contenedorización de la aplicación.
* **GitHub Actions:** Automatización del flujo de trabajo (Workflows).
* **Markdown:** Documentación técnica profesional.
* **Node.js/Java:** (Especifica aquí el lenguaje que estés usando).

## 🐳 Dockerización
El proyecto utiliza un **Dockerfile Multi-Stage** para garantizar que la imagen final sea ligera y segura, siguiendo las buenas prácticas de tus clases:

```dockerfile
# Se utiliza una imagen base Alpine para reducir el tamaño
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Etapa de ejecución
FROM node:20-alpine
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["node", "index.js"]