# TKINTER

# COMPONENTES WIDGETS
# tk: Tk() #janela
# lb: label() #rotulo
# bt: button() #botão
# et: entry() #caixa de texto


# COMPONENTES WIDGETS
# tk: Tk() #janela
# lb: label() #rotulo
# bt: button() #botão
# et: entry() #caixa de texto

# import tkinter as tk
# from tkinter import messagebox 

# # 1. Criar a janela principal
# janela  = tk.Tk()
# janela.title("Minha primeira janela GUI")
# janela.configure(bg="#290552")
# janela.geometry("800x400") #Largura x Altura

# # 2. Criar a função do botão (evento)
# def mostrar_mensagem():
#     messagebox.showinfo("Sucesso!","Você clicou no botão")

# # 3, Criar os componentes
# lbl_titulo = tk.Label(janela, text="Bem vindo a nossa aula de Tkinter", font=("Arial", 24))
# btn_clique = tk.Button(janela, text="Clique aqui", font=("Arial", 16), bg="#720be7", fg="white", command=mostrar_mensagem)
# btn_close = tk.Button(janela, text="Fechar", font=("Arial", 16), bg="#720be7", fg="white", command=janela.destroy)

# # 4. Posicionar os componentes
# lbl_titulo.pack(pady=20) # 'pady' adiciona um espaçamento vertical
# btn_clique.pack(pady=10)
# btn_close.pack(pady=5)

# # 5. Rodar o loop da interface
# janela.mainloop()


# import tkinter as tkk
# from tkinter import messagebox

# def saudar_usuario():
#     # get(). serve para buscar o texto que vamos digitar

#     nome = campo_nome.get()

#     if nome == "":
#         messagebox.showwarning("Aviso","Por favor digite seu nome!")
#     else:
#         messagebox.showinfo("Saudações Alunos", f"Olá, {nome}! Seja bem-vindo ao mundo das interfaces gráficas")

# # Configurações da janela
# app = tkk.Tk()
# app.title("Exemplo 1")
# app.geometry("350x200")

# # Componentes 
# lbl_instituicao = tkk.Label(app, text="Digite seu nome abaixo:")
# lbl_instituicao.pack(pady=10)

# campo_nome = tkk.Entry(app, font=("Arial", 12))
# campo_nome.pack(pady=15)

# btn_enviar = tkk.Button(app, text="Enviar", command=saudar_usuario)
# btn_enviar.pack(pady=15)

# app.mainloop()

# Exercício: Crie uma interface gráfica que calcule a média de três notas digitadas pelo usuário. A interface deve conter campos para o usuário inserir as notas e um botão para calcular a média. Ao clicar no botão, a média deve ser exibida em uma mensagem.import tkinter as tk.

import tkinter as tk
from tkinter import messagebox

def calcular():
    nome = caixa_nome.get()

    n1 = float(caixa1.get())
    n2 = float(caixa2.get())
    n3 = float(caixa3.get())

    media = (n1 + n2 + n3) / 3

    messagebox.showinfo("Resultado", nome + " sua média foi " + str(media))

janela = tk.Tk()
janela.title("Média")
janela.geometry("400x250")

texto_nome = tk.Label(janela, text="Seu nome")
texto_nome.pack()

caixa_nome = tk.Entry(janela)
caixa_nome.pack()

texto = tk.Label(janela, text="Digite as notas")
texto.pack()

caixa1 = tk.Entry(janela)
caixa1.pack()

caixa2 = tk.Entry(janela)
caixa2.pack()

caixa3 = tk.Entry(janela)
caixa3.pack()

botao = tk.Button(janela, text="Calcular", command=calcular)
botao.pack()

botao_fechar = tk.Button(janela, text="Fechar", command=janela.destroy)
botao_fechar.pack()

janela.mainloop()