// BIBLIOTECA
const entrada = require(`readline-sync`);

// TITULO
console.log(" === CLASSIFICAÇÃO DE TEMPERATURA === ");

// VARIAVEL E PERGUNTA
const temperatura = entrada.questionFloat("Digite a temperatura: ");

// LINHA SEPARAÇÃO + TEXTOS 
console.log("--------------------------------------------------")
console.log(`A temperatura digitada foi: ${temperatura}°C`);
console.log("Com essa informacao: ");

// (if, else e else if)
if (temperatura <= 60) {
    console.log("A temperatura esta NORMAL ✅.");
} else if (temperatura >= 61 && temperatura <= 80) {
    console.log("A temperatura esta em situacao de ATENCAO ⚠️.");
} else {
    console.log("A temperatura esta em situacao CRITICA ❌.");
}