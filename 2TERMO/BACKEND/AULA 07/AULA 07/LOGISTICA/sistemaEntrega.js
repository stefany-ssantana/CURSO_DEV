const entrada = require("readline-sync");
const logistica = require('./calculadoraFrete');

console.log("=== SISTEMA EXPRESSO INDUSTRIAL ===");

const produto = entrada.question("Produto a ser transportado: ");
const km = entrada.questionInt("Valor da carga: R$ ");
const valorCarga = entrada.questionFloat("Valor carga: R$ ");

const freteBase = logistica.calcularBase(km);
const seguro = logistica.calcularSeguro(valorCarga);
const prazo = logistica.verificarPrazo(km);
const totalGeral = freteBase + seguro;

console.log("\n --- RELATORIO DE POSTAGEM ---");
console.log(`Produto: ${produto}`);
console.log(`Frete base: ${freteBase.toFixed(2)}`);
console.log(`Seguro: ${seguro.toFixed(2)}`);
console.log(`TOTAL: R$ ${totalGeral.toFixed(2)}`);
console.log("-".repeat(25))