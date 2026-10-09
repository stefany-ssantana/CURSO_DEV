// IMPORTAR
const fs = require('fs');

// LÊ E CONVERTE O ARQUIVO JSON PARA ARRAY DE OBJETOS
const texto = fs.readFileSync('producao.json', 'utf-8');
const listaProducao = JSON.parse(texto);

// CONTADOR PARA MÁQUINAS QUE ATINGIRAM A META
let maquinasNaMeta = 0;


console.log("=== RELATÓRIO DE PRODUÇÃO ===");


for (let item of listaProducao) {

  const percentual = (item.produzido / item.meta) * 100;

  // CLASSIFICA A SITUAÇÃO DA MÁQUINA
  let situacao = "";

  if (percentual >= 100) {
    situacao = "META ATINGIDA";
    maquinasNaMeta++; // SOMA +1 NO CONTADOR DE METAS ATINGIDAS
  } else if (percentual >= 80) {
    situacao = "ATENÇÃO";
  } else {
    situacao = "ABAIXO DA META";
  }

  console.log(`Máquina: ${item.maquina}`);
  console.log(`Meta: ${item.meta}`);
  console.log(`Produzido: ${item.produzido}`);
  console.log(`Desempenho: ${percentual.toFixed(2)}%`);
  console.log(`Situação: ${situacao}`);
  console.log("-----------------------------------");

}
console.log(`Total de máquinas que atingiram a meta: ${maquinasNaMeta}`);


//   ==================================================================
//   RESUMO DOS COMANDOS USADOS:
//   ==================================================================

//   1. CÁLCULO DE PERCENTUAL ((produzido / meta) * 100):
//      - Divide a quantidade produzida pela meta e multiplica por 100 para achar a % do desempenho.

//   2. ESTRUTURA IF / ELSE IF / ELSE:
//      - Testa as condições em ordem: primeiro se é maior/igual a 100, depois se é maior/igual a 80, e por fim o restante.

//   3. .toFixed(2):
//      - Formata o valor do percentual para exibir exatamente 2 casas decimais (ex: 95.00%).