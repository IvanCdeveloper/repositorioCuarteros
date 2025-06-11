#!/bin/bash

echo "🚀 Desplegando TFG Reparaciones con Docker..."

# Verificar que Docker y Docker Compose están instalados
if ! command -v docker &> /dev/null; then
    echo "❌ Docker no está instalado. Por favor, instala Docker primero."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose no está instalado. Por favor, instala Docker Compose primero."
    exit 1
fi

# Detener contenedores existentes si los hay
echo "🛑 Deteniendo contenedores existentes..."
docker-compose down

# Limpiar imágenes anteriores (opcional)
echo "🧹 Limpiando imágenes anteriores..."
docker-compose down --rmi all --volumes --remove-orphans

# Construir y levantar los servicios
echo "🔨 Construyendo y levantando servicios..."
docker-compose up --build -d

# Mostrar el estado de los contenedores
echo "📊 Estado de los contenedores:"
docker-compose ps

# Mostrar logs en tiempo real
echo "📝 Mostrando logs (Ctrl+C para salir):"
echo "🌐 La aplicación estará disponible en: http://localhost"
echo "🔧 API Backend disponible en: http://localhost:8080"
echo "📚 Swagger UI disponible en: http://localhost:8080/swagger-ui/index.html"

docker-compose logs -f
