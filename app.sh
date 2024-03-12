#!/bin/bash

# Crear una nueva carpeta llamada mypythonapp
mkdir mypythonapp

# Copiar los archivos a la nueva carpeta
cp -r proyecto/* mypythonapp/

# Crear el archivo Dockerfile en la carpeta mypythonapp
cat <<EOT > mypythonapp/Dockerfile
# Usa una imagen base de Python
FROM python:3.10

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos necesarios al contenedor
COPY . .

# Instala las dependencias del proyecto
RUN pip install -r requirements.txt

# Expone el puerto 5000 (el puerto en el que Flask se ejecuta por defecto)
EXPOSE 5000

# Comando para ejecutar la aplicación cuando el contenedor se inicia
CMD ["python", "app.py"]
EOT

# Construir la imagen de Docker
docker build -t mypythonapp:latest mypythonapp/
