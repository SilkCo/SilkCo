CREATE DATABASE silkCo;

USE silkCo;

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    codigo CHAR(5),
    nome VARCHAR(50),
    cnpj CHAR(14)
);

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(30),
    numero INT,
    cep CHAR(8),
    fkEmpresa INT,
    CONSTRAINT chFkEmpresaEndereco 
		FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE galpao (
idGalpao INT PRIMARY KEY AUTO_INCREMENT,
fkEndereco INT,
fkEmpresa INT,
CONSTRAINT chFkEndereco
	FOREIGN KEY(fkEndereco) REFERENCES endereco (idEndereco),
CONSTRAINT chFkEmpresaGalpao
	FOREIGN KEY(fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    senha VARCHAR(30) NOT NULL,
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

CREATE VIEW vw_buscarMedidas AS
SELECT 
    fkSensor as idSensor,
    DATE_FORMAT(dtColeta,"%d/%m") as dataColeta,
    TRUNCATE(MAX(temperatura), 0) as maiorTemperatura,
    TRUNCATE(MIN(temperatura), 0) as menorTemperatura,
    (
        SELECT 
            TRUNCATE(temperatura, 0) 
        FROM leitura_sensor 
        WHERE fkSensor = idSensor 
        ORDER BY dtColeta DESC 
        LIMIT 1
    ) as ultimaTemperatura,
    TRUNCATE(MAX(umidade), 0) as maiorUmidade,
    TRUNCATE(MIN(umidade), 0) as menorUmidade,
    (
        SELECT 
            TRUNCATE(umidade, 0)
        FROM leitura_sensor 
        WHERE fkSensor = idSensor 
        ORDER BY dtColeta DESC 
        LIMIT 1
    ) as ultimaUmidade
FROM leitura_sensor
GROUP BY idSensor, dataColeta;