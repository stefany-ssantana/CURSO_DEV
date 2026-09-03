#  Exercício 1
# Criar um algoritimo para calcular a média e com base em notas, podemos inserir duas notas e apresentar a média porém a nota base de 50 é aprovado, e menor que esse valor será reprovado.
# print("Digite sua primeira nota \n")
# print("Digite sua segunda nota \n")
total1 = int(input("Sua primeira nota é: \n"))
total2 = int(input("Sua segunda nota é: \n"))

media = (total1 + total2) 
if media > 50:
    print("Você foi aprovado!")
else:
    print("Você foi reprovado!")   
    