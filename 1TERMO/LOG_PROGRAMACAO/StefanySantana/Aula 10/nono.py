# tratamento de erros ocm python
# erros comuns:
# -ZeroDivisionError: divisão por zero
# ValueError: conversão de tipo inválida
# -IndexError: acesso a índice fora do limite 
# -KeyError: acesso a chave inexistente em dicionário

# exempllo de tratamento de erros
print("Exemplo de tratamento de erros")
try:
    num1 = int(input("Digite o primeiro número..."))
    num2 = int(input("Digite o segundo múmero..."))
    resultado = num1 / num2
    print(f"O resultado da divisão é: {resultado:.2f}")

except ZeroDivisionError:
    print("Erro: Não é possível dividir por zero.")
    
except ValueError:
    print("Erro: Entrada inválida. Por favor, digite um número inteiro.")

except Exception as e:
    print(f"Ocorreu um erro inesperado: {e}")

except NameError:
    print("Erro: Variável não definida.")

if num1 > 100:
    print("O numero digitado é maior que 100.")
    for i in range(1, 6):
        print(f"{num1} x {i} = {num1 * i}")
        if num1 * i > 1000:
            print("O resultado da multiplicação é maior que 1000.")
            try:
                pass
            except Exception as e:
                print("Ocorreu um erro inesperado: {e}")
else:
    print("O número digitado é menor ou igual a 100.")