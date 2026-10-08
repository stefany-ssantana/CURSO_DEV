// IMPORTAR
const fs = require('fs');

// LÊ E CONVERTE O ARQUIVO JSON PARA ARRAY DE OBJETOS
const texto = fs.readFileSync('equipamentos.json', 'utf-8');
const equipamentos = JSON.parse(texto);

// CRIA O CONTADOR COMEÇANDO EM ZERO
let totalParados = 0;


console.log("=== EQUIPAMENTOS PARADOS ===");


for (let item of equipamentos) {

  // O OPERADOR (!) INVERTE O VALOR: SE OPERACIONAL FOR FALSE, !item.operacional VIRA TRUE
  if (!item.operacional) {
    console.log(`${item.nome} - ${item.setor}`);
    totalParados++; // SOMA +1 NO CONTADOR DE PARADOS
  }

}


console.log(`Total de equipamentos parados: ${totalParados}`);


//   ==================================================================
//   RESUMO DOS COMANDOS USADOS:
//   ==================================================================

//   1. OPERADOR DE NEGAÇÃO (!):
//      - Inverte um valor booleano (true vira false, e false vira true).
//      - Como 'item.operacional' é false para os parados, '!item.operacional'
//        se torna true e o 'if' entra na condição sem precisar comparar com '== false'.

//   2. CONTADOR (let totalParados = 0 e totalParados++):
//      - Começa zerado fora do laço.
//      - Toda vez que encontra um equipamento parado, o 'totalParados++'
//        soma 1 na variável.