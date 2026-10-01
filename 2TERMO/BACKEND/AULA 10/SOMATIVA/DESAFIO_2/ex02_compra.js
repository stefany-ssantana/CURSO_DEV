// importar a biblioteca
const entrada = require("readline-sync");

// titulo
console.log(" === PEDIDO DE MATERIA PRIMA === ");

// perguntas, variaveis 
// nome do material 
const nomeMaterial = entrada.question("Digite o nome do material: ");

// quantidade comprada
const qntComprada = entrada.questionInt("Digite a quantidade de material comprada: ");

//  valor unitario 
const precoUnitario = entrada.questionFloat("Digite o valor unitário do material: ");

// calculo do valor total
const valorTotal = qntComprada * precoUnitario;

console.log("--------------------------------------------------")

console.log(" === RESUMO DA COMPRA === ");
console.log(`Material: ${nomeMaterial}`);
console.log(`Quantidade comprada: ${qntComprada}`);
console.log(`Valor unitario: R$ ${precoUnitario}`);
console.log(`Valor total da compra: R$ ${valorTotal}`);