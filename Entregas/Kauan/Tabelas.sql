CREATE DATABASE silkCo;

USE silkCo;

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
	telefone CHAR(13),
    cnpj CHAR(14)
);

CREATE TABLE galpao (
idGalpao INT PRIMARY KEY AUTO_INCREMENT,
localizacao VARCHAR(40),
fkEmpresa INT,
CONSTRAINT chFkEmpresa
	FOREIGN KEY(fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    emailCadastro VARCHAR(40) NOT NULL UNIQUE,
    emailSecundario VARCHAR(40) UNIQUE, 
    senha VARCHAR(30) NOT NULL,
    fkEmpresa INT,
    CONSTRAINT chFkEmpresaUsuario 
		FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
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

CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusSensor VARCHAR(10) NOT NULL,
    modeloSensor VARCHAR(30),
	localizacao VARCHAR(30),
	fkGalpao INT,
    CONSTRAINT chStatus 
        CHECK (statusSensor IN ('Ativo', 'Inativo', 'Manutencao')),
	CONSTRAINT chFkGalpaoSensor 
		FOREIGN KEY (fkGalpao) REFERENCES galpao (idGalpao)
);

CREATE TABLE contato(
idContato INT PRIMARY KEY AUTO_INCREMENT,
telefone CHAR(11),
email VARCHAR(40),
fkUsuario INT,
CONSTRAINT chFkContatoUsuario FOREIGN KEY (fkUsuario) REFERENCES usuario (idUsuario)
);

CREATE TABLE leitura_sensor (
    idColeta INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(4,2) NOT NULL,
    umidade DECIMAL(4,2) NOT NULL,
    dtColeta DATETIME NOT NULL,
    fkSensor INT,
    CONSTRAINT chFkSensor 
		FOREIGN KEY (fkSensor) REFERENCES sensor (idSensor)
);

