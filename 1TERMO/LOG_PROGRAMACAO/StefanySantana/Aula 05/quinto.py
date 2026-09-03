# 1. O laço 'for' (Repetições Determinadas)
# Use o 'for' quando você sabe extamente quantas vezez algo deve acontecer (como ler 10 sensores ou processar uma lista de peças).
# Exemplo: Relatório de Produção Diária
# Imagine que você tem uma meta de produzir 5 lotes e quer numerar cada um:

# # Exemplo 1 
# for lote in range(1, 6):
#     print(f"Processando lote número {lote}...")
#     print(f"Qualidade verificada. [OK]")
#     print("Produção finalizada!")

# # Imagine agora que você queria amazenar 10 carros
# for carros in range(10):
#     print(f"Quantidade de carros {carros}")

# Exemplo 2 
# Contar até 4
# for i in range(5):
#     print("a")

# # Exemplo 3
# pecas = ["Engrenagem", "Eixo", "Rolamento", "Parafuso"]
# maquinas = ["Máquina 1", "Máquina 2"]

# for item in pecas: 
#     print(f"Item de Estoque: {item}")
#     for maq in maquinas:
#         print(f"Máquinas que temos {maq}")

# Exercício 1 
# 1. Contador de Produção (for) 
# Uma esteira processa 10 peças por ciclo. Crie um programa que use um for para contar de 1 a 10 e, para cada núemro imprima: "Peça n° X processada com  sucesso". No final, exiba "Ciclo de programação concluído". 

# print("Contador de ciclos de Produção")
# for ciclo in range(1,11):
#     print(f"Processando ciclos de peças {ciclo}...")
#     print(f"Peça n° {ciclo}. Processada com sucesso")
#     print("Ciclo de produção concluído")

# Exercício 2
# Imagine a produção de frutas em uma feira. Desejo apresentar as frutas banana, manga, melancia, abacaxi. Com uma quantidade de 10 bananas, 5 mangas, 10 melancias, e 13 abacaxi.
# frutas= ["Banana", "Manga", "Melancia", "Abacaxi"]
# quantidades = [10, 5, 10, 13]
# print("Bem-Vindo ao mercado das frutas: \n")
# for i in range(len(frutas)):
#     print(frutas[i], ": ", quantidades[i])

# Montar uma tabuada inicialmente pode ser usado um valor fixo e depois usar a pergunta
numero = int(input("Você deseja a tabuada de qual número?"))
for i in range(1, 11):
     print(numero, "x", i, "=", numero* i)

# Use o while quando você não sabe quando vai parar. Ele depende de uma condição (como um sensor de segurança ou um botão de emergência).
# Exemplo: Monitor de Temperatura (Loop Infinito Controlado)

# Repete enquanto a temperatura estiver segura
#  Início
# Exemplo: Menu de Interação
# opcao = ""

# while opcao!= "sair":
#     opcao= input("Digite a leitura do sensor ou 'sair' para fechar: ").lower()
#     if opcao != "sair":
#         print(f"Dado '{opcao}' registrado no banco de dados.")
# print("Sistema encerrado.")

# Exercicio 4
# Criar um menu de opções com 4 itens ex: Escolher Series apresente sua escolha de serie das outras 3 
# qualquer opçao diferente sair do menu

