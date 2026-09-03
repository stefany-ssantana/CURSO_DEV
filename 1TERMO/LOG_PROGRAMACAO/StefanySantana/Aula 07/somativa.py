# Exercício 1 Registro de Operador: Peça o nome do operador e o turno (A, B ou C). Exiba: "Operador [Nome] registrado no Turno [Turno]. Boa jornada!"

# print("Bom dia! Me informe os dados seguintes para o recolhimento de dados: \n")
# nome = input("Qual o seu nome? ")
# turno = input("Qual o seu turno? ")
# print("Operador", nome, "registrado no turno", turno)

# Exercício 2: Cálculo de Produção: Peça a quantidade de peças produzidas em 1 hora. Calcule e exiba quantas peças serão produzidas em um turno de 8 horas.

# print("Cálculo de Produção:")
# quantidade = int(input("Qual a quantidade de peças produzidas por hora? "))
# horas = int(input("Qual o turno desejado para o cálculo das peças? "))
# total = quantidade * horas 
# print("Em um turno de", horas, "horas são produzidas", total, "peças")

# Exercício 3: Conversor de Unidade: O sistema lê uma pressão em Bar. Converta para PSI (1 Bar ≈ 14.5 PSI) e exiba com duas casas decimais.
# pressao = int(input("Qual é a pessão atual?"))
# bar = 15.5
# total = bar * pressao
# print("A pressão atual convertida em bar é de: ", total)

# Exercício 4: Média de Qualidade: Peça 3 notas de inspeção de uma peça (0 a 10). Exiba a média aritmética simples delas.
# nota1 = int(input("Qual a primeira nota?"))
# nota2 = int(input("Qual a segunda nota?"))
# nota3 = int(input("Qual a terceira nota?"))
# total = ((nota1 + nota2  + nota3) /3)
# print("A média aritimética das notas são igual á:", total )

# Exercício 5: Termostato Inteligente: Peça a temperatura de um motor.Abaixo de 40°C: "Baixa carga". Entre 40°C e 70°C: "Normal". Acima de 70°C: "ALERTA: Resfriamento Ativado!".
# temperatura = float(input("Qual a temperatura do seu motor?"))
# if temperatura < 40:
#     print("Carga baixa")
# elif temperatura < 70: 
#     print("Normal")
# if temperatura > 70: 
#     print("ALERTA: Resfriamento Ativado!")

# Exercício 6: Classificador de Lotes: O usuário insere o código do produto. Se começar com "A", exiba "Alimentos". Se "E", "Eletrônicos". Para qualquer outro, "Desconhecido".
# print("Bem-Vindo ao classificador de Lotes")
# codigo = input("Insira o código do produto: ")
# if codigo == "A":
#     print("Alimetos")
# elif codigo == "E":
#     print("Eletrônicos")
# else:
#     print("Desconheçido")


# Exercício 7: Segurança de Operação: A máquina só liga se o sensor_porta == "fechada" E o botao_emergencia == "desligado". Peça esses dois inputs e diga se a máquina pode iniciar.
# sensor_porta = input("A porta está aberta ou fechada?")
# botao_emergencia = input("Esse botão está ligado ou desligado?")
# if sensor_porta == "fechada":
#     botao_emergencia == "desligado"
#     print("A máquina está ligada ")
#     print("A máquina está iniciando... ")
# if sensor_porta == "aberta":
#     botao_emergencia == "ligado"
#     print("A máquina está deligada")

    

# Exercício 8: Cálculo de Descarte: Peça o total de peças produzidas e o total de defeituosas. Se o descarte for maior que 5% do total, exiba "Revisar Processo", caso contrário, "Processo Otimizado".
# produzidas = int(input("Qual a quantidades de peças total?"))
# defeituosas = int(input("Qual a quantidade de peças defeituosas?"))
# descarte = (defeituosas / produzidas) * 100
# if descarte > 5: 
#     print("Revisar processo")
# else:
#     print("Processo otimizado")


# Exercício 9: Validação de Medida: Uma peça deve ter entre 9.8mm e 10.2mm. Peça a medida e diga se está dentro da tolerância, acima ou abaixo.
# print("Validação de Medidas") 
# peca = input("Qual a medida da peça?") 
# if peca > "9.8":
#     print("")


# Exercício 10: Contagem Regressiva de Setup: Use um for para fazer uma contagem regressiva de 10 até 1 para o início de uma prensa, e finalize com "Prensa Ativada!".


# Exercício 11: 11.Soma de Produção (Acumulador): Use um while para pedir o peso de várias caixas. O loop para quando o usuário digitar 0. No fim, mostre o peso total acumulado.


    
# Exercício 12: 12.Múltiplas Leituras: Use um for para pedir a temperatura de 5 sensores diferentes.Ao final, mostre qual foi a maior temperatura lida.
# maior = 0 
# for i in range(5):
#     temperatura = float(input(f"Temperatura {i+1}: "))
#     if i == 0 or temperatura > maior: 
#         maior = temperatura
# print(f"Maior temperatura : {maior}")


# Exercício 13: Painel de Login: Crie um while que peça a senha do supervisor ("admin123"). Enquanto ele errar, o programa diz "Acesso Negado". Ele tem apenas 3 tentativas. Se esgotar, exiba "Painel Bloqueado".