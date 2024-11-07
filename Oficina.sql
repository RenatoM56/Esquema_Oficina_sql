CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Veiculos (
    id_veiculo SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Clientes(id_cliente),
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT
);

CREATE TABLE Funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2)
);

CREATE TABLE Servicos (
    id_servico SERIAL PRIMARY KEY,
    descricao VARCHAR(100),
    preco_base DECIMAL(10, 2)
);

CREATE TABLE Ordem_Servico (
    id_os SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Clientes(id_cliente),
    id_veiculo INT REFERENCES Veiculos(id_veiculo),
    id_funcionario INT REFERENCES Funcionarios(id_funcionario),
    id_servico INT REFERENCES Servicos(id_servico),
    data_servico DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pendente', 'em andamento', 'finalizado')),
    total DECIMAL(10, 2)
);

CREATE TABLE Pecas (
    id_peca SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    custo DECIMAL(10, 2)
);

CREATE TABLE Pecas_Ordem_Servico (
    id_os INT REFERENCES Ordem_Servico(id_os),
    id_peca INT REFERENCES Pecas(id_peca),
    quantidade INT,
    PRIMARY KEY (id_os, id_peca)
);
