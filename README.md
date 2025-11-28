# 📚 GerenciadorBiblioteca

> Sistema de Gestão de Biblioteca (LMS) desenvolvido em Java 21 com Spring Boot, Thymeleaf e PostgreSQL. Projeto prático do Grupo `String[] devs = {"C", "G, "J"};` focado em arquitetura MVC e containerização.

## 📖 Sobre o Projeto
O **GerenciadorBiblioteca** é um projeto de estudo desenvolvido para simular o ambiente real de desenvolvimento de software. O objetivo é criar uma solução completa para controle de acervo e empréstimos de pequenas bibliotecas comunitárias, aplicando conceitos de:

* **Vertical Slicing:** Desenvolvimento orientado a funcionalidades.
* **DevOps:** Uso de Docker para padronização de ambiente.
* **Clean Code:** Boas práticas de implementação em Java.

## 🚀 Tecnologias

* [Java 21 (LTS)](https://adoptium.net/)
* [Spring Boot 4.0](https://spring.io/projects/spring-boot)
* [Spring Data JPA](https://spring.io/projects/spring-data-jpa) (Hibernate)
* [Thymeleaf](https://www.thymeleaf.org/) (Template Engine)
* [PostgreSQL](https://www.postgresql.org/) (Database)
* [Docker Compose](https://www.docker.com/) (Infraestrutura)

## ⚙️ Como Executar
Este projeto utiliza o padrão de infraestrutura do grupo `String[] devs = {"C", "G", "J"};`. Você não precisa instalar o Java ou o Postgres na sua máquina, apenas o Docker.

### Pré-requisitos
* Docker e Docker Compose instalados.

### Passo a Passo

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/andlybras/GerenciadorBiblioteca.git](https://github.com/andlybras/GerenciadorBiblioteca.git)
    cd GerenciadorBiblioteca
    ```

2.  **Suba o ambiente (Banco de Dados + Ferramentas):**
    ```bash
    docker compose up -d
    ```

3.  **Execute a aplicação:**
    * **Opção A (Via IDE):** Abra a pasta no IntelliJ/VS Code (certifique-se de configurar o JDK 21).
    * **Opção B (Via Terminal do Container):**
        ```bash
        # Entre no container
        docker exec -it dev_backend /bin/bash

        # Rode o projeto
        ./mvnw spring-boot:run
        ```

4.  **Acesse no Navegador:**
    * A aplicação estará rodando em: `http://localhost:8080`

## 📂 Estrutura do Projeto

O projeto segue uma arquitetura modular baseada em domínios:

* `/books` - Regras de negócio e telas relacionadas ao Acervo.
* `/readers` - Gestão de cadastro de Leitores.
* `/loans` - Lógica de Empréstimos e Devoluções.

## 🤝 Autores (Grupo Trindade)

* **[Nome do Membro A]** - *Gestão de Acervo*
* **[Nome do Membro B]** - *Gestão de Leitores*
* **[Nome do Membro C]** - *Gestão de Empréstimos*

---
*Desenvolvido com ☕*
