# Explicação de def: A palavra chave "def" é usada para definir uma função no python. Uma função é um bloco de código reutilizavel que realiza uma tarefa específica.
# return: a palavra chave "return" é usada para finalizar a execução de uma função e retomar um valor local onde a função foi chamada.
# O valor retornado pode ser usado posteriormente no codigo.
# def nome():
#     nome = input("Digite seu nome:  ")
#     return nome
# print(f"Olá, {nome()}!")


# def valores():
#     print("Digite três valores:  ")
#     a = int(input("Digite o primeiro valor: "))
#     b = int(input("Digite o segundo valor: "))
#     c = int(input("Digite o terceiro valor: "))
#     return a, b, c 
# print(f"O maior valor é: {max(valores())}")
# # Reutilizando as funções
# nome()
# valores()

## Conceitos chaves 
# def: indica o inicio da definição da função
# nome: identifica a funçaõ para vc chama-la dps
# parametros: dados da função que recebe (opicional)
# return: envia o resultado de volta para quem chamou a função (opiciional)
def calcular_dobro(numero):
    return numero * 2
# como usar: resultado = calcular-dobro(5)
print(calcular_dobro(5))