# Define a Imagem Base (OS + JDK). Usamos a versão oficial Eclipse Temurin com JDK 21 sobre Ubuntu (Jammy).
FROM eclipse-temurin:21-jdk-jammy

# Instala dependências do SO necessárias para o desenvolvimento.
# O comando 'rm -rf' ao final limpa o cache do apt para reduzir o tamanho final da imagem, uma boa prática para economia de recursos.
RUN apt-get update && apt-get install -y \
    maven \
    git \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho padrão. Ao entrar no container, estaremos aqui.
WORKDIR /app

# Documenta que a aplicação containerizada escutará na porta 8080 (considerando o padrão Spring Boot).
EXPOSE 8080

# Executa um processo contínuo para manter o container ativo,
# permitindo o acesso via terminal para desenvolvimento.
CMD ["sleep", "infinity"]
