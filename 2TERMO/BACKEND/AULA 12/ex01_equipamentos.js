// IMPORTA O MÓDULO DO NODE.JS 
const fs = require('fs');

// CRIA O ARRAY COM OS 3 EQUIPAMENTOS SIMPLES
const equipamentos = [
  { codigo: 1, nome: "Computador", setor: "TI", operacional: true },
  { codigo: 2, nome: "Impressora", setor: "Vendas", operacional: true },
  { codigo: 3, nome: "Telefone", setor: "Recepcao", operacional: false }
];

// CONVERTE O ARRAY EM TEXTO NO FORMATO JSON (O 2 DEIXA ORGANIZADO)
const dadosJson = JSON.stringify(equipamentos, null, 2);

// SALVA O TEXTO NO ARQUIVO EQUIPAMENTOS.JSON
fs.writeFileSync('equipamentos.json', dadosJson);


console.log("ARQUIVO EQUIPAMENTOS.JSON CRIADO COM SUCESSO!");

//   ==================================================================
//   EXPLICACAO SIMPLES DOS COMANDOS USADOS: (como faltei na semana passada tive dificuldade na hora de usar esses comandos, e ainda não ficou muito claro)
//   ==================================================================

//   1. ARRAY DE OBJETOS: [ { ... }, { ... } ]
//      - Serve para guardar uma lista de coisas organizadas.
//      - Cada { } é um objeto (equipamento) com suas informacoes.

//   2. JSON.stringify(equipamentos, null, 2):
//      - O Node.js nao consegue salvar um Array/Objeto direto no arquivo.
//      - O stringify serve para TRANSFORMAR o array em TEXTO puro (JSON).
//      - O numero 2 serve apenas para dar espaco/quebra de linha (indentacao),
//        deixando o arquivo bonito e facil de ler.

//   3. fs.writeFileSync('equipamentos.json', dadosJson):
//      - É o comando que CRIA e GRAVA o arquivo no seu computador.
//      - Primeiro argumento ('equipamentos.json'): o nome do arquivo que vai criar.
//      - Segundo argumento (dadosJson): o texto que vai salvar dentro dele.
