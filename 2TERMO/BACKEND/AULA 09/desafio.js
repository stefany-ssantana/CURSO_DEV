// // Desafio na louza 
// const fs = require('fs');

// // Frase inicial 
// console.log(" === SISTEMA DE CADASTRO DE ESTOQUE DO MERCADO 🛒 === \n");
// const produtos = [
    
//         {id: 1, nome: "Arroz", qtd: 100},
//         {id: 2, nome: "Feijão", qtd: 250},
//         {id: 3, nome: "Milho", qtd: 50},
//         {id: 4, nome: "Trigo", qtd: 75},
//         {id: 5, nome: "Açúcar", qtd: 30},
//         {id: 6, nome: "Sal", qtd: 200},

// ];

// function salvarDados() {
//     const dadosTexto = JSON.stringify(produtos, null, 2);

//     fs.writeFileSync('estoque_mercado.json', dadosTexto);
//     console.log("Dados salvos com sucesso no arquivo estoque_mercado.json ");
// }
// function verEstoqueBaixo() {
//     console.log("\n --- Produtos abaixo de 100 unidades no estoque --- ");

//      const baixoEstoque = produtos.filter(produto => produto.qtd < 100);
//      console.log(baixoEstoque);
// }
// salvarDados();
// verEstoqueBaixo();

// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 🚀 Desafio 1: Sistema de Alerta de Manutenção (Uso de .filter)
// "Olá, pessoal! O gerente da fábrica notou que algumas máquinas estão trabalhando demais e precisam de manutenção preventiva. O nosso desafio é criar um sistema que varre o banco de dados e gera uma lista de 'máquinas em perigo'.
// O que vocês devem fazer:
// Crie um arquivo chamado maquinas.json com esta lista inicial:
// code
// JSON
// [
//   { "id": 1, "nome": "Torno CNC", "horasUso": 1200 },
//   { "id": 2, "nome": "Fresadora", "horasUso": 800 },
//   { "id": 3, "nome": "Prensa Hidraulica", "horasUso": 1500 },
//   { "id": 4, "nome": "Corte a Laser", "horasUso": 500 }
// ]
// Crie um programa que leia esse arquivo.
// Use o método .filter() para criar uma nova lista apenas com as máquinas que tenham mais de 1000 horas de uso.
// O programa deve exibir os nomes dessas máquinas no terminal e salvar essa lista de alertas em um novo arquivo chamado manutencao_urgente.json."
// Dica do Professor: "Lembrem-se: o .filter() traz TODOS que combinam com a regra, enquanto o .find() traz apenas o primeiro!"
const fs = require('fs');

console.log(" === SISTEMA DE ALERTA DE MANUTANÇÃO  === \n");

const produtos = [
  { "id": 1, "nome": "Torno CNC", "horasUso": 1200 },
  { "id": 2, "nome": "Fresadora", "horasUso": 800 },
  { "id": 3, "nome": "Prensa Hidraulica", "horasUso": 1500 },
  { "id": 4, "nome": "Corte a Laser", "horasUso": 500 }
        
];

function salvarDados() {
    const dadosTexto = JSON.stringify(produtos, null, 2);

fs.writeFileSync('manutencao.json', dadosTexto);
    console.log("Dados salvos com sucesso no arquivo manutencao.json ");
};

function manutencaoUrgente() {
    console.log("\n --- Máquinas com mais de 1000 horas de uso --- ");

    const maquinasUrgentes = produtos.filter(p => p.horasUso > 1000);
    console.log(maquinasUrgentes);
}

salvarDados();
manutencaoUrgente();


// obs: não terminei porem enviei mesmo assim para mostrar ate onde eu consegui 