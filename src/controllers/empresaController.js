var empresaModel = require("../models/empresaModel");

function buscarPorCnpj(req, res) { 
  var cnpj = req.query.cnpj;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function listar(req, res) {
  empresaModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  });
}

function buscarPorId(req, res) { // nao sabemos se vai usar
  var id = req.params.id;

  empresaModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function cadastrar(req, res) {
  var cnpj = req.body.cnpjServer;
  var nome = req.body.nomeServer;
  var codigo = req.body.codigoServer;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    if (resultado.length > 0) {
      res
        .status(401)
        .json({ mensagem: `a empresa com o cnpj ${cnpj} já existe` });
    } else {
      empresaModel.cadastrar(nome, cnpj, codigo).then((resultado) => {
        res.status(201).json(resultado);
      });
    }
  });
}



function cadastrarEndereco(req, res){

  var cnpjEmpresa = req.body.cnpjEmpresa;
  var logradouro = req.body.logradouro;
  var cep = req.body.cep;
  var numero = req.body.numero;

  empresaModel.buscarPorCnpj(cnpjEmpresa)
  .then(function(resposta){

    if(resposta.length == 1){

      empresaModel.cadastrarEndereco(resposta[0].idEmpresa, logradouro, numero, cep)
      .then(function (resultado){
        res.status(201).json(resultado);
      });
      
    }

  });

}

function cadastrarGalpao(req, res){

  var logradouro = req.body.logradouro;
  var numero = req.body.numero;
  var cep = req.body.cep;

  console.log('entrei no cadastrarGalpao controller', logradouro, numero, cep);

  empresaModel.buscarEndereco(logradouro, numero, cep)
  .then(function(resposta){

    if(resposta.length == 1){

      console.log(resposta);

      let fkEmpresa = resposta[0].fkEmpresa;
      let fkEndereco = resposta[0].idEndereco;

      empresaModel.cadastrarGalpao(fkEmpresa, fkEndereco)
      .then(function(resultado){
        res.status(201).json(resultado);
      });

    }

  });

}

module.exports = {
  buscarPorCnpj,
  buscarPorId,
  cadastrar,
  listar,
  cadastrarEndereco,
  cadastrarGalpao,
};
