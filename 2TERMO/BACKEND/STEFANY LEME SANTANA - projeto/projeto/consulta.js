const fs = require('fs');

// Verifica se o arquivo existe antes de tentar ler (evita erro ENOENT)
if (!fs.existsSync('funcionarios.json')) {
  console.log("Erro: O arquivo 'funcionarios.json' não foi encontrado. Execute primeiro o 'node cadastro.js'!");
  process.exit(1);
}

// Leitura do arquivo e conversao com JSON.parse()
const dados = fs.readFileSync('funcionarios.json', 'utf8');
const funcionarios = JSON.parse(dados);

// PASSO A PASSO DA AULA 4: Funcoes com return obrigatorio
function buscarPorId(id) {
  return funcionarios.find(pessoa => pessoa.id === id);
}

function buscarPorNome(nome) {
  return funcionarios.find(pessoa => pessoa.nome.toLowerCase() === nome.toLowerCase());
}

function filtrarPorFuncao(funcao) {
  return funcionarios.filter(pessoa => pessoa.funcao.toLowerCase() === funcao.toLowerCase());
}

// === EXECUTANDO E EXIBINDO OS TESTES NO TERMINAL ===
console.log("=== LISTA DE FUNCIONÁRIOS ===");
console.log(funcionarios);

console.log("\n--- Teste 1: Buscar ID 2 ---");
console.log(buscarPorId(2));

console.log("\n--- Teste 2: Buscar ID 99 (Inexistente) ---");
console.log(buscarPorId(99));

console.log("\n--- Teste 3: Buscar por Nome ---");
console.log(buscarPorNome("Carlos Eduardo"));

console.log("\n--- Teste 4: Filtrar por Função Compartilhada ---");
console.log(filtrarPorFuncao("Desenvolvedor"));