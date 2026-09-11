const entrada = require('readline-sync');
const { calculo } = require('./conversor');

//  Recebe a entrada
const valorInicial = entrada.questionFloat('Digite o valor total em dolar (U$): ');

// Função resultado
function valorDolar() {
    const resultado = calculo(valorInicial);
    console.log(`O valor convertido é de R$: ${resultado}`);
}

valorDolar();