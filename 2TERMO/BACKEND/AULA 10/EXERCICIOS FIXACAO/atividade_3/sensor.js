const entrada = require('readline-sync');

// Título
console.log("---   Gestor de Clima Industrial   ---");

// Variáveis
const checarTemperatura = entrada.questionInt(`Digite a temperatura atual: `);
const checarUmidade = entrada.questionInt(`Digite a umidade atual: `);
console.log("----------------------------------------------");

//  if else 
if (checarTemperatura >= 40) {
    console.log("ALERTA: Caldeira superaquecida.");
} else if (checarUmidade <= 20) {
    console.log("ALERTA: Ar muito seco.");
}