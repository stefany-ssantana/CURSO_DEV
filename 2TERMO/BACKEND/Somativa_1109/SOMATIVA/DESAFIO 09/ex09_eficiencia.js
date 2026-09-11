const entrada = require('readline-sync');

// FUNÇÕES
function calcularEficiencia(real, prevista) {
    return (real / prevista) * 100;
}

function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return 'META ATINGIDA';
    } else if (percentual >= 70) {
        return 'ATENÇÃO';
    } else {
        return 'ABAIXO DA META';
    }
}


const prevista = entrada.question('Producao prevista: ');
const real = entrada.question('Producao real: ');

const percentual = calcularEficiencia(real, prevista);
const classificacao = classificarEficiencia(percentual);


console.log('Produção Prevista:', prevista);
console.log('Produção Real:', real);
console.log('Percentual:', percentual + '%');
console.log('Classificação:', classificacao);