# Estágio 1: Build da aplicação
# Use uma imagem base com o Java 21 e o Maven
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo pom.xml para que as dependências possam ser baixadas
# (isso aproveita o cache do Docker)
COPY pom.xml .

# Baixa as dependências do projeto
RUN mvn dependency:go-offline

# Copia o restante do código da sua aplicação
COPY src ./src

# Executa o build final do projeto (gera o arquivo .jar)
RUN mvn clean package -DskipTests

# Estágio 2: Criação da imagem final (leve)
# Usa uma imagem base menor (apenas com o JRE) para o ambiente de produção
FROM eclipse-temurin:21-jre-alpine

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo .jar gerado no estágio de build
COPY --from=build /app/target/*.jar ./app.jar

# Define o comando de inicialização da sua aplicação
CMD ["java", "-jar", "app.jar"]