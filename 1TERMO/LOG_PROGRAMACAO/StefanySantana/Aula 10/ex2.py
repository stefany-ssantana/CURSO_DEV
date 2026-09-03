# escreva um programa que solicite ao usuário uma lista de palavras e conte quantas vezes cada palavra aparece na lista. o programa deve tratar os seguintes erros:
# -ValueError: se o usuário digitar um valor que não seja uma string.
# print("Bem vindo ao bloco de notas. Organize sua listas!")
# lista = []
# for i in range (lista):
#    input("Digite uma lista de nomes...") 


# except ValueError:
#     print("Erro no sitema! String não váldia")


contagem = {}
while True:
    palavra = input("Digite uma palavra (ou 'fim' para parar): ")
    if palavra == "fim":
        break
    try:
        int(palavra)
        print("ERRO: digite apenas palavras")
    except ValueError:
        if palavra in contagem:
            contagem[palavra] += 1
        else:
            contagem[palavra] = 1
print(contagem)
