// IMPORTAR
const fs = require('fs');

// LÊ E CONVERTE O ARQUIVO JSON PARA ARRAY
const texto = fs.readFileSync('temperaturas.json', 'utf-8');
const temperaturas = JSON.parse(texto);


try {

  // PERCORRE CADA MEDIÇÃO DE TEMPERATURA
  for (let temp of temperaturas) {

    // SE A TEMPERATURA PASSAR DE 350, DISPARA UM ERRO IMEDIATAMENTE
    if (temp > 350) {
      throw new Error(`Temperatura de ${temp}°C excedeu o limite permitido.`);
    }

    // SE FOR MENOR OU IGUAL A 350, CONTINUA NORMAL
    console.log(`Leitura: ${temp}°C - NORMAL`);
  }

} catch (erro) {

  // CAPTURA E EXIBE O ERRO LANÇADO PELO THROW
  console.log("ALARME:");
  console.log(erro.message);

}


//   ==================================================================
//   RESUMO DOS COMANDOS USADOS:
//   ==================================================================

//   1. try { ... }
//      - Bloco onde colocamos o código que pode dar algum erro ou lançar uma exceção.

//   2. throw new Error("mensagem")
//      - Lança (dispara) um erro de propósito.
//      - O programa PARA a execução do bloco try no mesmo instante e pula para o catch.

//   3. catch (erro) { ... }
//      - Bloco que "pega" o erro lançado.
//      - erro.message contém o texto que foi passado dentro do Error.