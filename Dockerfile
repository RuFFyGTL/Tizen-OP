# Usa una imagen base de Ubuntu
FROM ubuntu:22.04

# Establecer variables de entorno
ENV EMSDK="/opt/emsdk"

# Instala dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    wget \
    ninja-build \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/* && \
    echo "Dependencies installed successfully" >> /var/log/docker_build.log

# Descarga y configura Emscripten
RUN mkdir -p ${EMSDK} && \
    cd ${EMSDK} && \
    git clone https://github.com/emscripten-core/emsdk.git && \
    cd emsdk && \
    ./emsdk install latest && \
    ./emsdk activate latest && \
    echo "Emscripten installed successfully" >> /var/log/docker_build.log

# Establecer el directorio de trabajo
WORKDIR /workspace

# Copia el contenido del proyecto al contenedor
COPY moont/ ./moont/

# Compila el proyecto
RUN /bin/bash -c "source ${EMSDK}/emsdk/emsdk_env.sh && \
    mkdir -p build && \
    cd build && \
    cmake -G Ninja -DCMAKE_TOOLCHAIN_FILE=${EMSDK}/emscripten/cmake/Modules/Platform/Emscripten.cmake ../moont && \
    cmake --build . && \
    echo 'Build completed successfully' >> /var/log/docker_build.log"

# Comando por defecto al ejecutar el contenedor
CMD ["/bin/bash"]
