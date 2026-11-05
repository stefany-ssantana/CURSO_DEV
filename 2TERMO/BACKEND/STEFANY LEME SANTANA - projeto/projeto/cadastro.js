const fs = require('fs');
const readline = require('readline-sync');

const funcionarios = [];

console.log("=== CADASTRO DE FUNCIONÁRIOS ===");

for (let i = 0; i < 4; i++) {
  console.log(`\n--- Funcionário ${i + 1} ---`);
  
  const nome = readline.question("Digite o nome: ");
  const idade = Number(readline.question("Digite a idade: "));
  const funcao = readline.question("Digite a funcao: ");

  // PASSO 1 e PASSO 2: Criar objeto com id automatico (i + 1) e dar push no array
  const funcionario = { id: i + 1, nome: nome, idade: idade, funcao: funcao };
  funcionarios.push(funcionario);
}

// PASSO 3: Converter o array em texto JSON formatado
const json = JSON.stringify(funcionarios, null, 2);

// PASSO 4: Gravar no arquivo funcionarios.json
fs.writeFileSync('funcionarios.json', json, 'utf8');

console.log("\nCadastro concluído com sucesso! O arquivo 'funcionarios.json' foi criado.");