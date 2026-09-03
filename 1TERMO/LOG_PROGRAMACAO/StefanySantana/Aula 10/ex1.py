# escreva o programa que solicite ao usuário um número inteiro e calcule a media de uma lista de números. o programa deve tratar ps seguintes erros:
# -ValueError: se o usuário digitar um valor que não seja um número inteiro
try:
    num1 = int(input("Digite o primeiro número..."))
    num2 = int(input("Digite o segundo número..."))
    num3 = int(input("Digite o terceiro número..."))
    resultado = (num1 + num2 + num3) / 3
    print(f"O resultado da divisão é: {resultado}")

except Exception as e:
    print(f"Ocorreu um erro inesperado: {e}")

except ValueError:
    print("Erro: Entrada inválida. Por favor, digite um número inteiro.")

except NameError:
    print("Erro: Variável não definida.")