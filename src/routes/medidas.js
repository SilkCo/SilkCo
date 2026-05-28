var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/buscarEnderecosGalpao/:idEmpresa", function (req, res) {
    medidaController.buscarEnderecosGalpao(req, res);
})

router.get('/buscarGalpoes/:idEndereco', function(req, res){
    medidaController.buscarGalpoes(req, res);
})

module.exports = router;