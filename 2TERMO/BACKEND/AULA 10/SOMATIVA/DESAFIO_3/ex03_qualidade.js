//  BIBLIOTECA
const entrada = require(`readline-sync`);

// TITULO
console.log(" === PEÇA APROVADA OU REPORADA === ");

// VARIAVEIS, PERGUNTAS E CONDIÇÕES
const peso = entrada.questionFloat("Digite o peso da peca: ");

// RETORNO, OQ VAI APARECER NO TERMINAL 
console.log("--------------------------------------------------")
console.log(`O peso da peca é: ${peso}g`);
console.log("Com essa infomacao: ");
if (peso >= 95 && peso <= 105) {
    console.log("PECA APROVADA ✅")
}
else {
    console.log("PECA REPROVADA ❌")
}
