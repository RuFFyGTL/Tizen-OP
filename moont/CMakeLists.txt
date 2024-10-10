cmake_minimum_required(VERSION 3.10)

# Nombre del proyecto
project(Moont VERSION 1.0 LANGUAGES CXX)

# Establecer las opciones de compilación
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS OFF)

# Incluir el archivo de configuración de Emscripten
include(${CMAKE_CURRENT_SOURCE_DIR}/../EmscriptenConfig.cmake)

# Incluir directorios de encabezados
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)

# Archivos fuente
file(GLOB_RECURSE SOURCES 
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp" 
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c"
)

# Crear el ejecutable
add_executable(${PROJECT_NAME} ${SOURCES})

# Configuración de instalación
install(TARGETS ${PROJECT_NAME} DESTINATION bin)

message(STATUS "Configuración completada para ${PROJECT_NAME} (Version: ${PROJECT_VERSION})")
