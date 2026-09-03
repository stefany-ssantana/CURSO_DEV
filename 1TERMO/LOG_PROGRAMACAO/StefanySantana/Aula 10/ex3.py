# escreva um programa mais simples com testes de tratamentos de erros, como por exemplo, solicitar ao usuário um número. o programa deve tratar os seguintes erros:
# -ValueError: se o usuário digitar um valor que não seja um número.
# -ZeroDivisionError: se o usuário digitar zero como divizor.
try:
    numero = int(input("Digite um número:"))
    divisor = int(input("Digite o divisor:"))
    resultado = numero/divisor
    print("O resultado é: {resultado}")

except ValueError:
    print("Erro: Esse valor não é considerdo um número.")

except ZeroDivisionError:
    print("Erro: Não é possível dividir por zero.") 