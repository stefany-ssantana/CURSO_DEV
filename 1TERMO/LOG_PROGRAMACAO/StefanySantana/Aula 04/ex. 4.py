# Exercício 4 
total1 = int(input("Sua primeira nota é: \n"))
total2 = int(input("Sua segunda nota é: \n"))

media = (total1 + total2) 
if media >= 70:
     print("Você foi aprovado!")
elif media  < 50:
     print("Você ficou de recuperação!")
else:
    print("Você foi reprovado!")   
    