# 🗺️ Planejamento MVP: GerenciadorBiblioteca

Este documento serve como **Guia Mestre** para o desenvolvimento do projeto **GerenciadorBiblioteca**. Aqui definimos o escopo, as responsabilidades e o fluxo de trabalho do MVP (Produto Mínimo Viável) do Grupo de Estudos `String[] devs = {"C", "G", "J"};`.

---

## 🎯 1. Objetivo do Projeto
Desenvolver um sistema web funcional para gestão de bibliotecas comunitárias. O foco não é apenas o software final, mas a prática da metodologia de desenvolvimento em grupo.

**Metas de Aprendizado:**
* Dominar o fluxo **HTTP -> Controller -> Service -> Repository -> Database**.
* Praticar **Injeção de Dependência** com Spring Framework.
* Entender relacionamentos de banco de dados com **JPA/Hibernate**.
* Gerenciar conflitos e integrações via **Git/GitHub**.

---

## 🏗️ 2. Arquitetura e Stack Tecnológico
A aplicação seguirá o padrão MVC (Model-View-Controller) monolítico.

* **Linguagem:** Java 21 (LTS)
* **Framework:** Spring Boot 4.0
* **Template Engine:** Thymeleaf
* **Banco de Dados:** PostgreSQL 15
* **Infraestrutura:** Docker Compose (Baseado no repo `java-dockyard`)

### 📦 Estrutura de Pacotes (Vertical Slicing)
Para evitar conflitos de merge e garantir que todos toquem em todas as camadas (Back, Front e Banco), a divisão será por **Domínio Funcional**, e não por camada técnica.

```text
com.StringDevsCGJ.GerenciadorBiblioteca
├── GerenciadorBibliotecaApplication.java
├── books                       <-- DOMÍNIO A (Livros)
│   ├── Book.java
│   ├── BookRepository.java
│   ├── BookService.java
│   └── BookController.java
├── readers                     <-- DOMÍNIO B (Leitores)
│   ├── Reader.java
│   ├── ReaderRepository.java
│   ├── ReaderService.java
│   └── ReaderController.java
└── loans                       <-- DOMÍNIO C (Empréstimos)
    ├── Loan.java
    ├── LoanRepository.java
    ├── LoanService.java
    └── LoanController.java
```

---

## 👥 3. Divisão de Responsabilidades (Fatias Verticais)
Cada membro é responsável por desenvolver **End-to-End** o seu módulo.

### 📚 Módulo A: Gestão de Acervo (Books)
* **Responsável:** [Nome do Membro 1]
* **Entidade Principal:** `Book`
* **Atributos:** `Long id`, `String title`, `String author`, `String isbn`, `Status status` (ENUM: `AVAILABLE`, `BORROWED`).
* **Entregáveis:**
    * Tela de cadastro de livros.
    * Listagem de todos os livros.
    * Lógica para mudar o status do livro.

### 👤 Módulo B: Gestão de Leitores (Readers)
* **Responsável:** [Nome do Membro 2]
* **Entidade Principal:** `Reader`
* **Atributos:** `Long id`, `String name`, `String email`, `String phone`.
* **Entregáveis:**
    * Tela de cadastro de leitores.
    * Listagem de leitores ativos.
    * Validação de campos obrigatórios (Spring Validation).

### 🤝 Módulo C: Gestão de Empréstimos (Loans)
* **Responsável:** [Nome do Membro 3]
* **Entidade Principal:** `Loan`
* **Atributos:** `Long id`, `Book book` (ManyToOne), `Reader reader` (ManyToOne), `LocalDate loanDate`, `LocalDate returnDate`.
* **Estratégia de Dependência (Mocks):**
    * Como este módulo depende de `Book` e `Reader` (que estão sendo feitos pelos outros), o responsável deve criar classes `MockBook` e `MockReader` simples dentro do seu pacote para testar a lógica enquanto os módulos reais não ficam prontos.
* **Entregáveis:**
    * Tela de registro de empréstimo (Selecionar Livro + Selecionar Leitor).
    * Tela de devolução (Cálculo de dias).

---

## 📆 4. Roteiro de Execução (Step-by-Step)

### FASE 1: O "Big Bang" (Sessão em Grupo)
* Clonar o repositório de infraestrutura (`java-dockyard`).
* Renomear pasta e git para `bibliotrindade`.
* Subir containers Docker.
* Gerar projeto Spring via CLI (Curl) ou Spring Initializr.

### FASE 2: Desenvolvimento Isolado (Sessões Individuais)
Cada membro cria sua branch a partir da `main`:
1.  `git checkout -b feature/books`
2.  `git checkout -b feature/readers`
3.  `git checkout -b feature/loans`

* Desenvolvimento das camadas (`Entity` -> `Repository` -> `Service` -> `Controller` -> `HTML`).
* Testes manuais locais.

### FASE 3: A Integração (Merge Party)
1.  **Books** e **Readers** abrem Pull Request (PR) para a `main`.
2.  Code Review em grupo. Aprovação e Merge.
3.  **Responsável por Loans:**
    * Faz pull da `main` atualizada.
    * Deleta seus Mocks.
    * Conecta seu código com as classes reais `Book` e `Reader`.
    * Abre PR para a `main`.

### FASE 4: Polimento (Mob Programming)
* Criação de `style.css` global.
* Criação de fragmento de menu (Navbar) no Thymeleaf.
* Deploy/Teste final.

---

## ⚠️ 5. Regras de Ouro do Grupo

1.  **Git Ignore:** Nunca commitar pastas `.idea`, `.vscode`, `target` ou arquivos `.class`.
2.  **Inglês no Código:** Nomes de classes, variáveis e métodos devem ser em Inglês (ex: `BookService`, não `LivroService`). Comentários podem ser em PT-BR.
3.  **Commits Semânticos:**
    * `feat: ...` (Nova funcionalidade)
    * `fix: ...` (Correção de erro)
    * `docs: ...` (Documentação)
    * `refactor: ...` (Melhoria de código sem mudar funcionalidade)
4.  **Não Quebre a Build:** Antes de subir o código, rode o projeto localmente para garantir que ele compila.