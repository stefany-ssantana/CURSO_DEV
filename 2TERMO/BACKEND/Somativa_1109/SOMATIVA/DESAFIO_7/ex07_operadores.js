// BIBLIOTECA
const entrada = require('readline-sync');

// TITULO
console.log(" === LISTA DE OPERADORES === ");

// CRIAR UM ARRAY 
const operadores = [];

// LAÇO 
for (let i = 0; i < 5; i++) {
    const operador = entrada.question(`Digite o nome do operador ${i + 1}: `);
    operadores.push(operador);
}

console.log("\n=== OPERADORES CADASTRADOS ===");

// LENGTH
for (let i = 0; i < operadores.length; i++) {
    console.log(`${i + 1} - ${operadores[i]}`);
}