// BIBLIOTECA
const entrada = require('readline-sync');

// TITULO
console.log(" === MEDIA DE CINCO MEDICOES === ");

// VARIAVEL (resumo feito no word)
let soma = 0;

// LAÇOS 
for (let i = 1; i <= 5; i++) {
  let medicao = entrada.questionFloat('Digite a medicao ' + i + ': ');

  soma = soma + medicao;
}

// CALCULO
let media = soma / 5;

// RETORNA NO TERMINAAL
console.log('Soma das medicoes: ' + soma);
console.log('Media final: ' + media);

