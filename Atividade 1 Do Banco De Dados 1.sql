-- comando para criar um banco de dados;
create database db1;

-- comando para usar o database
use db1;

-- Atividade 1)
CREATE SCHEMA Empresa;

-- Atividade 2)
CREATE TABLE Funcionario (
cpf CHAR(11) primary key,
nome varchar(100) not null,
salario FLOAT DEFAULT 2000,
data_nascimento date
);

-- Atividade 3)
alter table funcionario add column email VARCHAR(100);

-- at
create table Departamento (
id INT PRIMARY KEY,
nome VARCHAR (50) UNIQUE,
gerente CHAR(11),
foreign key (gerente) references Funcionario (cpf)
);

ALTER TABLE funcionario add constraint chk_salario check (salario>1000);

--
INSERT INTO Funcionario (cpf, nome, salario, data_nascimento, email)
VALUES ('12345678900', 'Ana Silva', 2500, '1990-05-10', 'ana@email.com');

INSERT INTO Funcionario (cpf, nome, salario, data_nascimento, email)
VALUES ('98765432100', 'Carlos Souza', 3000, '1985-08-15', 'carlos@email.com');

INSERT INTO Funcionario (cpf, nome, salario, data_nascimento, email)
VALUES ('45678912300', 'Mariana Lima', 1800, '1992-11-25', 'mariana@email.com');

--
insert into Funcionario (cpf,nome,salario<data_nascimento,email)
values
    ('12345678900', 'Ana Silva', 2500, '1990-05-10', 'ana@email.com'),
    ('98765432100', 'Carlos Souza', 3000, '1985-08-15', 'carlos@email.com'),
    ('45678912300', 'Mariana Lima', 1800, '1992-11-25', 'mariana@email.com');
    
    -- Desligar o Safe mode
    SET SQL_SAFE_UPDATES = 0;
    
    
    -- Atividade 7)
    UPDATE Funcionario SET salario = 3500 WHERE salario = 2500;
    
    -- Atividade 8)
    DELETE FROM Funcionario WHERE cpf = '12345678900';
    
    -- Atividade 9)
    INSERT INTO Departamento (id, nome, gerente)
VALUES 
    (1, 'Financeiro', '98765432100'),
    (2, 'TI', '45678912300');
    
    --
    SELECT * FROM Funcionario WHERE salario > 2200;
--
CREATE TABLE Projeto (
    id_projeto INT PRIMARY KEY,
    nome VARCHAR(100),
    local VARCHAR(50),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id);
    
    --
    INSERT INTO Projeto (id_projeto, nome, local, id_departamento) VALUES
(1, 'Sistema ERP', 'SÃ£o Paulo', 1),
(2, 'Aplicativo Mobile', 'Rio de Janeiro', 2);
