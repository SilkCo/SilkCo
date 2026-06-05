var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get(`/buscarEnderecosGalpao/:idEmpresa`, function (req, res) {
    medidaController.buscarEnderecosGalpao(req, res);
});

router.get(`/buscarGalpoes/:idEndereco`, function(req, res){
    medidaController.buscarGalpoes(req, res);
});

router.get('/exibirQuantidadeAlerta', function(req, res){
    medidaController.exibirQuantidadeAlerta(req, res);
});

router.get(`/buscarKpi/:idGalpao`, function(req, res){
    medidaController.buscarKpi(req, res);
});

router.get(`/buscarUltimasMedidas/:idGalpao`, function(req, res){
    medidaController.buscarUltimasMedidas(req, res);
});

router.get(`/buscarMedias/:idGalpao`, function(req, res){
    medidaController.buscarMedias(req, res);
});

module.exports = router;