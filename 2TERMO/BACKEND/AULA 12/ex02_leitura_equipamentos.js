// IMPORTAR
const fs = require('fs');

//LÊ O ARQUIVO COMO TEXTO
const texto = fs.readFileSync('equipamentos.json', 'utf-8');

// CONVERTE O TEXTO DE VOLTA PARA ARRAY
const equipamentos = JSON.parse(texto);

// PASSA POR CADA EQUIPAMENTO DA LISTA
for (let item of equipamentos) {

  // OPERADOR TERNÁRIO: SE FOR TRUE MOSTRA 'OPERACIONAL', SE FOR FALSE MOSTRA 'PARADA'
  const status = item.operacional ? "OPERACIONAL" : "PARADA";

  
  console.log(`Código: ${item.codigo}`);
  console.log(`Equipamento: ${item.nome}`);
  console.log(`Setor: ${item.setor}`);
  console.log(`Status: ${status}`);
  console.log("------------------");
}


//   ==================================================================
//   RESUMO DOS COMANDOS:
//   ==================================================================

//   1. fs.readFileSync('equipamentos.json', 'utf-8')
//      - Lê o arquivo equipamentos.json e devolve o texto dele.

//   2. JSON.parse(texto)
//      - Transforma o TEXTO em ARRAY DE OBJETOS de novo.

//   3. for (let item of equipamentos)
//      - Pega um equipamento por vez da lista 'equipamentos'.

//   4. item.operacional ? "OPERACIONAL" : "PARADA"
//      - Teste rápido: se for true dá "OPERACIONAL", se for false dá "PARADA".
