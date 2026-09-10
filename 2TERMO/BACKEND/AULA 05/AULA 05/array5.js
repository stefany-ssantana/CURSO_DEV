const entrada = require('readline-sync');

const notas = [];

const quantidade = entrada.questionInt("Quantas pessoas desejam cadastrar?" );

for (let i = 0; i < quantidade; i++) {
    let nota = entrada.questionFloat(`Digite a notas ${i + 1}: `

    );

notas.push(nota);
}

console.log("\nNOtas cadastradas: ");
console.log(notas);

console.log(`Quantidade de notas: ${notas.length}`);
