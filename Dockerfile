# Usamos slim para reducir vulnerabilidades y tamaño
FROM node:18-slim

# Directorio de trabajo
WORKDIR /app

# Instalación de git y limpieza inmediata (como en tu referencia profesional)
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copia de dependencias
COPY package*.json ./

# Instalación limpia para producción
RUN npm install --omit=dev

# Copia del código fuente
COPY . .

# Tu puerto original
EXPOSE 3000

# Ejecución
CMD ["node", "index.js"]
