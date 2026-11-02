-- =====================================================================
-- PROJETO: Sistema de Gestão de Acervo e Empréstimos (UFMS Digital)
-- ARQUIVO: schema.sql (Comandos DDL - Data Definition Language)
-- =====================================================================

-- 1. Criação da Tabela AUTOR
CREATE TABLE Autor (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- 2. Criação da Tabela LIVRO
CREATE TABLE Livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    ano_publicacao INT,
    id_autor INT REFERENCES Autor(id_autor) ON DELETE CASCADE
);

-- 3. Criação da Tabela USUARIO
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- 4. Criação da Tabela EMPRESTIMO
CREATE TABLE Emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES Usuario(id_usuario) ON DELETE RESTRICT,
    id_livro INT REFERENCES Livro(id_livro) ON DELETE RESTRICT,
    data_emprestimo DATE DEFAULT CURRENT_DATE,
    data_devolucao_prevista DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'ATIVO' CHECK (status IN ('ATIVO', 'DEVOLVIDO', 'ATRASADO'))
);