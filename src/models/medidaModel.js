var database = require("../database/config");

function buscarIdSensor(fkGalpao) {
    var instrucaoSql =
        `
    SELECT idSensor FROM sensor WHERE fkGalpao=${fkGalpao}; 
        `
       return database.executar(instrucaoSql);
}

function buscarKpi(fkSensor) {
    var instrucaoSql =
        `
    SELECT * FROM vw_buscarMedidas WHERE idSensor = ${fkSensor} ORDER BY DataColeta DESC LIMIT 1;
    `
    return database.executar(instrucaoSql);
}

function buscarDashboard(fkSensor) {
    var instrucaoSql =
        `

    `
}

function buscarEnderecosGalpao(idEmpresa) {
    // var instrucaoSql = `SELECT
    //     endereco.*,galpao.*
    //     FROM endereco JOIN galpao ON fkEndereco = idEndereco WHERE endereco.fkEmpresa = ${idEmpresa}
    // `

    var instrucaoSql =
        `
        SELECT * FROM endereco WHERE fkEmpresa = ${idEmpresa};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarGalpoes(idEndereco) {

    var instrucaoSql =
        `
        SELECT * FROM galpao WHERE fkEndereco = ${idEndereco};
    `;

    return database.executar(instrucaoSql);

}

function exibirQuantidadeAlerta() {
    var instrucaoSql =
        `
    SELECT COUNT(dht11_temperatura) WHERE dht11_temperatura > 26 AND < 18;
    `
}

module.exports = {
    buscarIdSensor,
    buscarKpi,
    buscarEnderecosGalpao,
    buscarGalpoes,
    exibirQuantidadeAlerta
}
