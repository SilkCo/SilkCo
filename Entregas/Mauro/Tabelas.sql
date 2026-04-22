CREATE DATABASE silkCo;

USE silkCo;

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cnpj CHAR(14)
);

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    logradoura VARCHAR(30),
    numero INT,
    cep CHAR(8),
    fkEmpresa INT,
    CONSTRAINT chFkEmpresaEndereco 
		FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE galpao (
idGalpao INT PRIMARY KEY AUTO_INCREMENT,
fkEndereco INT,
CONSTRAINT chFkEndereco
	FOREIGN KEY(fkEndereco) REFERENCES endereco (idEndereco)
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    senha VARCHAR(30) NOT NULL,
    administrador CHAR(1) CHECK(administrador IN('S','N')),
    fkEmpresa INT,
    CONSTRAINT chFkEmpresaUsuario 
		FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusSensor VARCHAR(10) NOT NULL,
    modeloSensor VARCHAR(30),
	fkGalpao INT,
    CONSTRAINT chStatus 
        CHECK (statusSensor IN ('Ativo', 'Inativo', 'Manutencao')),
	CONSTRAINT chFkGalpaoSensor 
		FOREIGN KEY (fkGalpao) REFERENCES galpao (idGalpao)
);

CREATE TABLE leitura_sensor (
    idColeta INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(4,2) NOT NULL,
    umidade DECIMAL(4,2) NOT NULL,
    dtColeta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fkSensor INT,
    CONSTRAINT chFkSensor 
		FOREIGN KEY (fkSensor) REFERENCES sensor (idSensor)
);

