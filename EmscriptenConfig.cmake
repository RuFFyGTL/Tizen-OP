# EmscriptenConfig.cmake - configuración para proyectos que utilizan Emscripten

# Verifica si Emscripten está instalado
if(NOT DEFINED ENV{EMSDK})
    message(FATAL_ERROR "Emscripten SDK not found. Please set the EMSDK environment variable.")
endif()

# Establece el directorio de Emscripten
set(EMSDK_DIR $ENV{EMSDK})
set(EMSCRIPTEN_DIR ${EMSDK_DIR}/upstream/emscripten)

# Configura el compilador de C++
set(CMAKE_CXX_COMPILER "${EMSCRIPTEN_DIR}/em++")
set(CMAKE_C_COMPILER "${EMSCRIPTEN_DIR}/emcc")

# Configura el sistema de construcción
set(CMAKE_MAKE_PROGRAM "${EMSCRIPTEN_DIR}/emmake")

# Incluye las rutas de encabezados de Emscripten
include_directories("${EMSCRIPTEN_DIR}/system/include")
include_directories("${EMSCRIPTEN_DIR}/system/lib")

# Establece las opciones de CMake para Emscripten
set(CMAKE_EXECUTABLE_SUFFIX ".html")

# Otras configuraciones que puedas necesitar para tu proyecto
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s WASM=1")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -s WASM=1")

message(STATUS "Configuración completada para Emscripten")
