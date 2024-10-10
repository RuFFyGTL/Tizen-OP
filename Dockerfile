# Usa una imagen base de Ubuntu
FROM ubuntu:latest

# Instala las dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    wget \
    mingw-w64 \
    tizen-studio \
    && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo
WORKDIR /workspace

# Copia tu proyecto al contenedor
COPY . /workspace

# Comando por defecto al iniciar el contenedor
CMD ["/bin/bash"]
