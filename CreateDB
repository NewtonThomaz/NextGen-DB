-- ======================
-- HABILITA EXTENSÃO UUID
-- ======================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ======================
-- CRIAÇÃO DOS TIPOS (TABELAS ENUM)
-- ======================
CREATE TABLE Permissao (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tipo VARCHAR NOT NULL
);

INSERT INTO Permissao (tipo) VALUES
    ('ROOT'),
    ('ADMIN'),
    ('DEFAULT'),
    ('VIEW');

CREATE TABLE Medida (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tipo VARCHAR NOT NULL
);
INSERT INTO Medida (tipo) VALUES
    ('HECTARE'),
    ('QUILOMETROS_QUADRADOS'),
    ('METROS_QUADRADOS'); -- Corrigido para manter o padrão

-- ======================
-- TABELAS INDEPENDENTES (NÍVEL 0)
-- ======================
CREATE TABLE Usuario (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    foto_perfil VARCHAR,
    nome VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    senha VARCHAR NOT NULL 
);

CREATE TABLE Cultura (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR NOT NULL,
    data DATE NOT NULL
);

CREATE TABLE Operacao (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    operacao VARCHAR NOT NULL,
    agente VARCHAR NOT NULL,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Sensor_Temperatura (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ip_temperatura VARCHAR NOT NULL
);

CREATE TABLE Sensor_Umidade (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ip_umidade VARCHAR NOT NULL
);

-- ======================
-- TABELAS DEPENDENTES (NÍVEL 1)
-- ======================

CREATE TABLE Colaborador (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_usuario UUID NOT NULL,
    id_permissao UUID NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_permissao) REFERENCES Permissao(id)
);

CREATE TABLE Talhao (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR NOT NULL,
    descricao TEXT,
    tamanho DOUBLE PRECISION NOT NULL,
    id_usuario UUID NOT NULL,
    id_medida UUID NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_medida) REFERENCES Medida(id)
);

-- ======================
-- TABELAS DEPENDENTES (NÍVEL 2 - JUNÇÕES E LEITURAS)
-- ======================

CREATE TABLE Leitura_Temperatura (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_sensor UUID NOT NULL,
    temperatura FLOAT NOT NULL,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_talhao UUID,
    FOREIGN KEY (id_sensor) REFERENCES Sensor_Temperatura(id),
    FOREIGN KEY (id_talhao) REFERENCES Talhao(id)
);

CREATE TABLE Leitura_Umidade (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_sensor UUID NOT NULL,
    umidade FLOAT NOT NULL,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_talhao UUID,
    FOREIGN KEY (id_sensor) REFERENCES Sensor_Umidade(id),
    FOREIGN KEY (id_talhao) REFERENCES Talhao(id)
);

CREATE TABLE Talhao_Cultura (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_talhao UUID NOT NULL, 
    id_cultura UUID NOT NULL,
    FOREIGN KEY (id_talhao) REFERENCES Talhao(id),
    FOREIGN KEY (id_cultura) REFERENCES Cultura(id)
);

CREATE TABLE Talhao_Operacao (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_talhao UUID NOT NULL,
    id_operacao UUID NOT NULL,
    FOREIGN KEY (id_talhao) REFERENCES Talhao(id),
    FOREIGN KEY (id_operacao) REFERENCES Operacao(id)
);

CREATE TABLE Talhao_Colaborador (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_colaborador UUID NOT NULL,
    id_talhao UUID NOT NULL,
    FOREIGN KEY (id_colaborador) REFERENCES Colaborador(id),
    FOREIGN KEY (id_talhao) REFERENCES Talhao(id)
);
