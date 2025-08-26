# Imagem base com Java 21
FROM eclipse-temurin:21-jdk-alpine

# Diretório de trabalho
WORKDIR /app

# Copiando todos os arquivos do projeto
COPY . .

# Build do projeto usando Maven Wrapper, ignorando testes
RUN ./mvnw clean package -DskipTests

# Comando para rodar a aplicação
CMD ["java", "-jar", "target/DSList-0.0.1-SNAPSHOT.jar"]
