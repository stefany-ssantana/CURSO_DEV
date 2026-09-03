# AVALIAÇÃO SOMATIVA - CORREÇÃO 
# Exercício 1.
# print("Registro de Operador")
# operador = input("Digite seu nome: ")
# turno = input("Digite seu turno: ")
# print(f"Operador {operador} registrado no turno {turno}. Boa jornada!")


# Exercício 2. 
# print("Cálculo de Produção")
# producao_hora = int(input("Digite a quantidade de peças produzidas em 1hora: "))
# producao_turno = producao_hora * 8
# producao_turno = print(f"Quantidade de peças produzidas em um turno de 8horas: {producao_turno}")

# Exercício 3. 
# print("Conversor de Unidade")
# bar = float(input("Digite a pressão em bar:"))
# psi = bar * 14.5 
# print(f"Pressão em PSI: {psi:.2f}")
# print(f"Pressão em PSI: {psi}" , round(psi, 2))

# Exercício 4. 
# nota1 = int(input("Qual a primeira nota?"))
# nota2 = int(input("Qual a segunda nota?"))
# nota3 = int(input("Qual a terceira nota?"))
# total = ((nota1 + nota2  + nota3) /3)
# print("A média aritimética das notas são igual á:", total )

# Exercício 5. 
# temperatura = float(input("Qual a temperatura do seu motor?"))
# if temperatura < 40:
#     print("Carga baixa")
# elif temperatura < 70: 
#     print("Normal")
# if temperatura > 70: 
#     print("ALERTA: Resfriamento Ativado!")

# Exercício 6.
# print("Bem-Vindo ao classificador de Lotes")
# codigo = input("Insira o código do produto: ")
# if codigo == "A":
#     print("Alimetos")
# elif codigo == "E":
#     print("Eletrônicos")
# else:
#     print("Desconheçido")


# Exercício 7.
# sensor_porta = input("A porta está aberta ou fechada?")
# botao_emergencia = input("Esse botão está ligado ou desligado?")
# if sensor_porta == "fechada":
#     botao_emergencia == "desligado"
#     print("A máquina está ligada ")
#     print("A máquina está iniciando... ")
# if sensor_porta == "aberta":
#     botao_emergencia == "ligado"
#     print("A máquina está deligada")

# Exercício 8.
# produzidas = int(input("Qual a quantidades de peças total?"))
# defeituosas = int(input("Qual a quantidade de peças defeituosas?"))
# descarte = (defeituosas / produzidas) * 100
# if descarte > 5: 
#     print("Revisar processo")
# else:
#     print("Processo otimizado")

# Exercício 9.
# print("Validação de medida")
# medida = float(input("Digite a medida da paça em mm..."))
# if medida < 9.8:
#     print("A peça está abaixo da tolerância.")
# elif medida > 10.2:
#     print("A peça está acima da tolerância.")
# else:
#     print("A peça é dentro da tolerância.")

# Exercício 10.
# print("Contagem Regressiva de Setup")
# for contagem in range(10, 0, -1):
#     print(contagem)
# print("Prensa Ativada!")

# Exercício 11.

# Exercício 12.
# maior = 0 
# for i in range(5):
#     temperatura = float(input(f"Temperatura {i+1}: "))
#     if i == 0 or temperatura > maior: 
#         maior = temperatura
# print(f"Maior temperatura : {maior}")