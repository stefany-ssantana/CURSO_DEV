// BIBLIOTECA
const entrada = require('readline-sync');

// TITULO
console.log(" === CONTROLE DE ESTOQUE === ");

// ARRAY VAZIO
const componentes = [];

// LAÇO
for (let i = 0; i < 3; i++) {
    const nome = entrada.question('Nome do produto: ');
    const quantidade = +entrada.question('Quantidade: ');
    const estoqueMinimo = +entrada.question('Estoque Minimo: ');

    componentes.push({
        nome: nome,
        quantidade: quantidade,
        estoqueMinimo: estoqueMinimo
    });
}

console.log("\n=== RELATORIO DE ESTOQUE ===");

// FEITO COM AUXILIO DOS REGISTROS DAS AULAS ANTERIORES PARA DEIXAR CLARO COMO USAR LAÇOS 
for (let i = 0; i < componentes.length; i++) {
    if (componentes[i].quantidade < componentes[i].estoqueMinimo) {
        console.log(`${componentes[i].nome} -> REPOR ESTOQUE`);
    } else {
        console.log(`${componentes[i].nome} -> ESTOQUE OK`);
    }
}