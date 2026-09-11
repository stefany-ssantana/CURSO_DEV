// BIBLIOTECA 
const entrada = require("readline-sync"); 

// TITULO
console.log(" === TABELA DE PRODUÇÃO === ");

// PERGUNTAS - VARIAVEIS
const qntPecasCiclo = entrada.questionInt("Digite a quantidade de peças produzidas por ciclo: ");

// LAÇOS (não entendi muito bem mais tinha um exemplo no meus resumos e consegui fazer)
for (let ciclo = 1; ciclo <= 10; ciclo++) {

    // número do ciclo e a produção acumulada.
    const producaoTotal = qntPecasCiclo * ciclo;
    console.log(`Ciclo ${ciclo}: Produção acumulada = ${producaoTotal} peças`);
}