# Lista de temperaturas lidas pelo sensor por minuto
# leituras = [70, 75, 82, 98, 110, 85, 80]

# for temp in leituras:
#     if temp > 100:
#         print(f"CRÍTICO: {temp} °C detectado! Acionando parada de emergência.")
#         break # O loop para aqui e NÃO lê os próximos valores (85 e 80)
#     print(f"Temperatura está em {temp}°C. Operação normal.")

# print("Sistema desligado. Aguardando manuenção.")


# materiais = ["metal", "metal", "plastico", "metal", "vidro", "metal"]
# for peca in materiais:
#     if peca != "metal":
#         print(f"Aviso: Peça de {peca} detectada. Desviando para o descarte...")
#         continue #Pula o restante do código abaixo e vai para a próxima peça

# # Este código só roda se a peça for metal
# print(f"Processando peça de {peca}. Furando e polindo...")

# print("Fim do lote de produção.")

# Exercício 1
# Tente criar um código que conte de 1 a 10, mais use o continue para não imprimir o número 5 (simulando uma falha de sensor específica no item 5).

# print("Iniciando a contagem dos números:")
# for i in range(1,11):
#     if i == 5:
#         continue
#     print(f"Número {i} indisponível")
   

# Exercício 2 
# Simule um semáforo inteligente com parara para cada cor. Determine um tempo que deseja para que quando mudae para tal cor ele represente uma pausa

# def esperar(segundos):
#     for i in range(segundos, 0, -1):
#         print("Tempo restante:", i)

# contador = 0

# import time

# print("SEMÁFORO")

# verde = 10
# amarelo = 9
# vermelho = 8

# print("verde")
# time.sleep(verde)
# print("amarelo")
# time.sleep(amarelo)
# print("vermelho")
# time.sleep(vermelho)
# print("finalizado!")

# Exercício 4 - Soma de cargas de Energia (for)
# Uma fabrica tem 5 maquinas. Peça ao usuário (via input dentro do loop) o consumo de kWh de cada uma das 5 maquinas. Ao final do loop, o programa deve exibir o comsumo total da fabrica.

# print("Bem-Vindo a fábrica!")
# total = 0
# for i in range (1, 6):
#     consumo = float(input(f"Digite o consumo da máquina {i} kWh:"))
#     total += consumo 

# print(f"O consumo total da máquina for de: {total} (kWh)") 

# Exercício 5 - Identificador de peças defeituosas (for + if)
# Percorra uma lista de medidas de peças:
# Medida [5-,1, 49.8, 52.0,50.0, 48.5].
# O padrão de qualidade aceita apenas peças com exatamente 50.0 ou mais.
# Use um for para ler a lista e, para cada peça, diga se ela esta "Aprovada" ou "Reprovada".
   
# medidas = [51.0, 49.8, 52.0, 50.0, 48.5]

# print("Identifiação de peças defeituosas: ")

# for medida in medidas:
#     if medida >= 50.0:
#         print(f"{medida} -> Aprovada")
#     else:
#         print(f"{medida} -> Reprovada")


# Exercício 6 - Uma balança industrial esta pesando um lote de 6 sacos de insumos. O peso ideal para cada saco é de 50kg, mais o sistema aceita variações 
print("Balança industrial: ")
pesos = [51.0, 49.8, 52.0, 50.0, 48.5, 87, 56.9]
for peso in pesos: 
    if 48 <= peso <= 50:
        print(peso, "Dentro do padrão" )
    else:
        print(peso, "Fora do padrão")



# Exercício 7: Sistema Inteligente de Manutenção
# Crie um cronograma que receba dois dados: a pressão atual (float) e as horas de uso acumuladas (int) de uma turbina.
# O programa deve classificar o estado da máquina seguuindo a hierarquia: 
# Crítico (Prioridade 1): Se a pressão for maior que 100 OU as horas de uso forem maior que 10.000.
# Mensagem: "PARADA IMEDIATA: Risco de falha catastrófica". 
# Alerta (Prioridade 2): Se a pressão estiver estiver entre 80 e 100 (inclusive).
# Monitoramento (Prioridade 3):
