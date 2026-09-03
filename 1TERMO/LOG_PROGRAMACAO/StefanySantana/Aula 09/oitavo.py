# # Clean Code - Aula 8
# # Pra que usar?
# # Como usar?
# print("Clean Code - Aula 8")
# aula = 8 
# print(f"Estamos na aula {aula} de Clean Code")


# # Manipulação de arquivos e Texto
# texto = " Python "
# print(texto.sprint (). upper()) # PYTHON
# print(texto.sprint().lower())


# # Escrevendo 
# with open("notas.txt", "w") as f:
#     f.write("Estudar Pythom hoje!")


# # Lendo
# with open("notas.txt", "r") as f:
#     conteudo = f.read()
#     print(conteudo)


# Execução de comandos do sistema
import os #importa o módulo os para interagir com o sistema operacional 

# Onde estou?
# print(os.getcwd())

# Listar arquivos na pasta
# print(os.listdir())
# print(os.listdir("..")) #lista de arquivos da pasta pai
# print(os.listdir("..\\..")) #lista de arquivos da pasta avô
# print(os.listdir("C:\\")) #lista de arquivos da raiz do C
# print(os.listdir("C:\\Users")) #lista de arquivos da pasta Users
# print(os.listdir("C:\\Users\\Public")) #lista de arquivos da pasta publica


# Outros comandos uteis
# Criar pasta
# os.mkdir("nova_pasta")
# Renomear pasta
# os.rename("nova_pasta", "pasta_renomeada")
# # Excluir pasta
# os.rmdir("pasta_renomeada")


# EXERCÍCIO 1 
# Crie um script que mostre o caminho da pasta atual 
# print(os.getcwd())

# # EXERCÍCIO 2 
# # Liste os arquivos da pasta atual
# caminho = os.getcwd
# print(f"Caminho da pasta: {caminho}")

# EXERCÍCIO 3
# Crie uma pasta chamada "projetos" e depois renomeie para "meus_projetos". Por fim, exclua a conta
# os.mkdir("projetos")
# os.rename("projetos", "meus_projetos")
# os.rmdir("meus_projetos")

# EXERCÍCIO 4
# Crie um arquivo chamado "log.txte escreva a mensagem "Log de atividades". Depois, leia o conteúdo do arquivo e exiba na tela.
# with open("log.txt", "w") as arquivo:
#     arquivo.write("Log de atividades")
# with open("log.txt", "r") as arquivo:
#     conteudo = arquivo.read()
#     print(conteudo)


# EXEMPLO DE DICIONÁRIO:
# Crie um dicionário com informações sobre uma pessoa e acesse um valor usando a chave.
# pessoa = {
#     "nome": "Alice",
#     "idade": 30, 
#     "cidade": "São Paulo",
#     "profissão": "Engenharia",
# }

# pessoa = {
#     "nome": "Alice",
#     "idade": 30, 
#     "cidade": "São Paulo",
#     "profissão": "Engenharia",
# }

# pessoa2 = {
#     "nome": "Steh",
#     "idade": 15, 
#     "cidade": "Limeira",
#     "profissão": "Engenharia",
# }

# print(pessoa[""])
# print(pessoa2["nome", "idade"])

# EXERCÍCIO 6: Desligar o PC (comando do Windows)
# with open("desliga.bat", "w") as desligar: 
#     desligar.write("shutdown -s -t 3600 -c \"Desligamento programado para daqui 1 hora. Salve seu trabalho!\"")
#     # -s comando para desligar
#     # -tempo definido
#     # -a cancelar desligamento

# with open("desliga.bat", "r") as desligar:
#     conteudo = desligar.read()
#     print(conteudo)


# EXERCÍCIO 7: Criar um arquivo de backup
# Escreva um sript que crie um arquivo de backup do arquivo "notas.txt" com nome "notas_backup.txt". O script devw lwe o conteúdo de "notas.txt" e escrever no novo arquivo.
# def criar_backup():
#     # Lê o conteúdo de notas.txt
#     with open('notas.txt', 'r', encoding='utf-8') as arquivo_origem:
#         conteudo = arquivo_origem.read()
    
#     # Escreve o conteúdo no arquivo de backup
#     with open('notas_backup.txt', 'w', encoding='utf-8') as arquivo_backup:
#         arquivo_backup.write(conteudo)
    
    # print("Backup criado com sucesso! Conteúdo copiado de notas.txt para notas_backup.txt")


# Exemplo 2:
# pasta = os.listdir()
# for arquivo in pasta:
#     if arquivo.endswith(".txt"):
#         os.remove(arquivo) #remove irá apagar o arquivo 
#         print(f"Arquivo {arquivo} excuído.")
# print("Limpeza de arquivos concluída")


# EXERCÍCIO 8: Criar um script de monitoramento de temperatura
# Escreva um script que monitorana temperatura de um motor. O script deve ler a temperatura de um arquivo "temperatura.txt" e exibir uma mensagem de alerta se a temperatura estiver acima de 70° Ctemperatura = float(open("temperatura.txt").read())
