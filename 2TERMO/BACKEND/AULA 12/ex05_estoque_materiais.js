// IMPORTAR
const fs = require('fs');

// LÊ E CONVERTE O ARQUIVO JSON PARA ARRAY DE OBJETOS
const texto = fs.readFileSync('materiais.json', 'utf-8');
const materiais = JSON.parse(texto);

// VARIÁVEIS 
let quantidadeTotalUnidades = 0;
let valorTotalEstoque = 0;


console.log("=== RELATÓRIO DE ESTOQUE ===");


for (let item of materiais) {

  // CALCULA O VALOR EM ESTOQUE DESTE ITEM (QUANTIDADE x VALOR UNITÁRIO)
  const valorItem = item.quantidade * item.valorUnitario;

  // ACUMULA OS TOTAIS GERAIIS
  quantidadeTotalUnidades += item.quantidade;
  valorTotalEstoque += valorItem;

  // EXIBE OS DADOS DE CADA MATERIAL
  console.log(item.descricao);
  console.log(`Quantidade: ${item.quantidade}`);
  console.log(`Valor unitário: R$ ${item.valorUnitario.toFixed(2)}`);
  console.log(`Valor em estoque: R$ ${valorItem.toFixed(2)}`);
  console.log("-----------------------------------");

}


// EXIBE OS TOTAIS FINAIS DO RELATÓRIO
console.log(`Quantidade de tipos de materiais cadastrados: ${materiais.length}`);
console.log(`Quantidade total de unidades: ${quantidadeTotalUnidades}`);
console.log(`Valor total do estoque: R$ ${valorTotalEstoque.toFixed(2)}`);