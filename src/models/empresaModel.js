var database = require("../database/config");

function buscarPorId(id) { // nao sabemos se vai usar
  var instrucaoSql = `SELECT * FROM empresa WHERE idEmpresa = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT idEmpresa, nome, cnpj, codigo FROM empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) { 
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(nome, cnpj, codigo) {
  var instrucaoSql = `INSERT INTO empresa (nome, cnpj, codigo) VALUES ('${nome}', '${cnpj}', '${codigo}')`;

  return database.executar(instrucaoSql);
}

function cadastrarEndereco(fkEmpresa, logradouro, numero, cep){

  var instrucaoSql = 
  `
    INSERT INTO endereco (logradouro, numero, cep, fkEmpresa) VALUES
    ('${logradouro}', ${numero}, '${cep}', ${fkEmpresa});
  `;

  return database.executar(instrucaoSql);

}

module.exports = { buscarPorCnpj, buscarPorId, cadastrar, listar, cadastrarEndereco };
