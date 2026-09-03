# Projeto Cancela Automática
# Criar um algorítimo que consiga gerenciar entrada e saída de veículos, inserindo valores por hora permanecida.
# A forma de entrada e saída deve ser específicada e permitir o usuário inserir os dados necessários para registro do veículo
# Passos
# 1 - Preessionar o botão, imprimiu um ticket
# Calcular tempo de permanencia 
# Pegar o ticket na saída
# Liberar e fechar cancelas

# 2 - Acesso por TAGs (sem parar, Connect Car...)
# Calcular tempo de permanencia 
# Gerar pagamento em fatura
# Liberar e fechar cancelas

# Erros
# Verificar sinal de transmissão de TAG

import time
print("Bem-vindo ao Estacionamento")
veiculos = {}

while True:
    print("\n1- Entrada de veículo (ticket)")
    print("2- Saída")
    print("3- Sair")

    opcao = input("Escolha: ")

    if opcao == "1":
        placa = input("Digite a placa: ")
        hora_entrada = time.time()
        veiculos[placa] = hora_entrada
        print("Ticket gerado! Cancela aberta.")

    elif opcao == "2":
        placa = input("Digite a placa: ")

        if placa in veiculos:
            hora_saida = time.time()
            tempo = hora_saida - veiculos[placa]

            horas = tempo / 3600
            valor = horas * 5

            print("Tempo:", round(horas, 2), "horas")
            print("Valor: R$", round(valor, 2))

            del veiculos[placa]
            print("Cancela liberada e fechada.")
        else:
            print("Veículo não encontrado!")

    elif opcao == "3":
        print("Sistema encerrado.")
        break

    else:
        print("Opção inválida!")