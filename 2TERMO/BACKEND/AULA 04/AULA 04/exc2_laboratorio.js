const entrada = require('readline-sync');

// Título
console.log("---   CONTROLE DE ACESSO AO LABORATÓRIO   ---")


// Variáveis
const nome = entrada.question("Bem-Vindo ao laboratorio! Qual o seu nome?  ")
const idade = entrada.questionInt("Qual a sua idade?  ")
const autorizacao = entrada.question(`Obrigado Sr. ${nome}! Voce tem autorizacao para entrar?  ${("S/N")}  `). toUpperCase();
const acompanhado = entrada.question(`Voce esta acompanhado de algum professor? ${("S/N")}  `). toUpperCase();

console.log("----------------------------------------------")


// if e else 
if ((idade >=16 && autorizacao === "S") || acompanhado === "S") {
    console.log("ACESSO LIBERADO!");
} else {
    console.log("ACESSO NEGADO, CONSIGA A AUTORIZACAO OU VENHA ACOMPANHADO DE UM PROFESSOR!")
}