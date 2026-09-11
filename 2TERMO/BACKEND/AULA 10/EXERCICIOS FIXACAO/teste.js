// 1. Entrada de dados e variáveis

// O que é uma variável: É uma caixa na memória do computador para guardar dados (como um texto ou um número) que você vai usar depois no programa.

// Por que precisa converter: Tudo o que o usuário digita no teclado entra no programa como texto (string). Se você tentar somar dois textos, o JavaScript junta as palavras em vez de somar os números (exemplo: "10" + "20" vira "1020"). Por isso, precisamos converter para número antes de fazer contas.

// 2. Estruturas condicionais

// Finalidade do if / else: Serve para o programa tomar caminhos diferentes dependendo de uma resposta (verdadeiro ou falso).

// Como toma decisões: Ele testa uma regra. Se for verdadeira, faz uma ação; se for falsa, faz outra ação.

// Exemplo industrial: Testar a temperatura de uma máquina. Se a temperatura for maior que 80 °C, o programa avisa que a máquina está em estado "CRÍTICO"; se não, avisa que está "NORMAL".

// 3. Estruturas de repetição

// Vantagem: Evita que você repita as mesmas linhas de código várias vezes. O computador faz o trabalho repetitivo sozinho usando poucas linhas de comando.

// Situação da prova: Pedir as 5 medições de um processo no Exercício 6. Em vez de escrever 5 vezes o mesmo código de pergunta, usamos um laço for para perguntar 5 vezes seguidas automaticamente.

// 4. Arrays e objetos

// Diferença:

// Array: É uma lista ordenada de coisas (guardada entre []).

// Objeto: É uma ficha descritiva com várias informações sobre uma única coisa (guardada entre {}).

// No cadastro de estoque:

// O objeto guarda os dados de um item específico (seu nome, quantidade e estoque mínimo).

// O array é a lista inteira que guarda todos esses objetos juntos dentro do estoque.

// 5. Funções e modularização

// Parâmetros: São as entradas da função — as informações que você passa para ela conseguir fazer o cálculo.

// Retorno: É a saída da função — o resultado final que ela devolve para o programa depois de terminar o trabalho.

// module.exports e require():

// module.exports: Serve para exportar (liberar) funções de um arquivo para que outros arquivos possam usá-las.

// require(): Serve para importar (puxar) essas funções para dentro do arquivo principal onde você quer rodar o sistema.


// Aula Backend 11/09/2026 – Celso / Manhã

// ATENÇÃO: O JavaScript que estudamos em aula (backend), é diferente do que usamos nas aulas da tarde (próprios para frontend, linguagem de marcação...)


// LISTA: [  ] coleção ordenada de elementos.
// Imagina uma lista de compras no papel:
// 1.	Pão
// 2.	Leite
// 3.	Café
// Ela é ordenada (tem 1º, 2º, 3º lugar), permite adicionar novos itens no final, remover itens do meio e alterar o que já está anotado.





// ARRAY: [ ] ---> vetor. Ele serve para guardar uma lista de informações, onde cada item fica exatamente no seu lugar (começando sempre do 0). Não pode ter numero com texto misturado!
//  Exemplo: const frutas = ["Maçã", "Banana", "Uva"];
// •	Na posição 0: "Maçã"
// •	Na posição 1: "Banana"
// •	Na posição 2: "Uva"



// LAÇO: ---> loop, repetições. Loop limitado for; loop continuo while

//                     exp: for                                                                    exp: while 



// OBJETO: vai ser sempre oq estiver dentro das chaves [ ], ele guarda dados no formato de chave e valor (atributos e propriedades do elemento). 
// Exemplo:


// FUNÇÃO: serve para criar uma variável que vai repetir a mesma conta, ação e etc varias vezes, com vários valores:
// Exemplo: calcular média alunos.
//                                                       Nota1 + nota2 + nota3 / 3 
// Dai você so vai adicionando e mudando os valores.

//  
// Traduzindo os códigos

// Const – criação de variável (const + nome da variável)
// ReadlineSync – biblioteca do node.js usada para ler dados digitados pelo usuário no terminal, para trabalhar com o javaScript, toda vez que tiver no código o comando entrada.int, entrada.input, entrada.questiofloat, entrada+comando.
// o	question(): Lê a resposta como Texto (String).
// o	questionInt(): Lê a resposta e converte para Número Inteiro (ex: 1, 10, 25).
// o	questionFloat(): Lê a resposta e converte para Número Decimal (ex: 1.5, 9.90).







// Length: as listas funcionam como um predia o térreo é o andar 0, o andar 1 vai ser tecnicamente o 2° porem não mostra. O Length serve pra mostrar essa lista de andar desdo 0, um exemplo:
// 0 – banana                
// 1 – maça 
// 2 – pera
// 3- melancia
// Quem não entende diria que tem comente 3 frutas pois vai do um ate 3, esse comando mostra que tem 4.

