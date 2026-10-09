// IMPORTAR 
const fs = require('fs');
const readline = require('readline-sync');

// LÊ E CONVERTE O ARQUIVO JSON PARA ARRAY DE OBJETOS
const texto = fs.readFileSync('funcionarios.json', 'utf-8');
const funcionarios = JSON.parse(texto);

const matriculaDigitada = readline.question("Informe a matricula: ");

// VARIÁVEL
let funcionarioEncontrado = null;

// LISTA
for (let item of funcionarios) {


  if (item.matricula == matriculaDigitada) {
    funcionarioEncontrado = item;
  }

}

if (funcionarioEncontrado) {
  console.log("Funcionário encontrado!");
  console.log(`Nome: ${funcionarioEncontrado.nome}`);
  console.log(`Setor: ${funcionarioEncontrado.setor}`);
  console.log(`Cargo: ${funcionarioEncontrado.cargo}`);
} else {
  console.log("Funcionário não encontrado!");
}