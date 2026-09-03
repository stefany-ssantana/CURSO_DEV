# EXERCÍCIO - Crie uma aplicação que faça o cálculo de idadde das pessoas 
# Deve perguntar o nome da pessoa e do ano de nascimento

# import  tkinter as tk
# from tkinter import messagebox, tkk

# janela = tk.Tk()
# janela.title("Cálculo de Idades")
# janela.geometry("500x500")
# janela.configure(bg="purple")

# lbl_nome_usuario = tk.Label(janela, text="Digite o primeiro nome.:", font=("Arial", 14),fg="black")
# lbl_nome_usuario.grid(row=0, column=0, pady=10, padx=10)
# lbl_curso_usuario = tk.Label(janela, text="Digite a idade.:", font=("Arial", 14),fg="black")
# lbl_curso_usuario.grid(row=1, column=1, pady=10, padx=10)
# lbl_nome_escola = tk.Label(janela, text="Escolha sua escola.:", font=("Arial", 14),fg="black")
# janela.mainloop()

import tkinter as tk
from tkinter import messagebox, ttk

# DEF funções de bloco 
def calcular_idade_designer():
    # get
    nome_designer = ent_nome.get()
    ano_nascimento = ent_ano_nascimento.get()
    calculo = ent_calulo.get()

    if nome_designer == "" or ano_nascimento == "" or calculo == "":
        messagebox.showinfo("Aviso", "Por favor, preencha todos os campos!")
    else:
    
        try:

            idade = 2026 - int(ano_nascimento)
            messagebox.showinfo("Resultado", f"Olá {nome_designer}! Você tem (ou vai completar) {idade} anos em 2026.")
        except ValueError:
            messagebox.showerror("Erro", "Por favor, digite um ano válido com números!")


janela = tk.Tk()
janela.title("Cálculo de Idade - Designer Gráfico")
janela.geometry("550x500")
janela.configure(bg="purple")
lbl_nome = tk.Label(janela, text="Digite seu nome.:", font=("Arial", 14), fg="black", bg="purple")
lbl_nome.grid(row=0, column=0, pady=10, padx=10)
lbl_ano_nascimento = tk.Label(janela, text="Ano de nascimento.:", font=("Arial", 14), fg="black", bg="purple")
lbl_ano_nascimento.grid(row=1, column=0, pady=10, padx=10)
lbl_calculo = tk.Label(janela, text="Ano atual:", font=("Arial", 14), fg="black", bg="purple")
lbl_calculo.grid(row=2, column=0, pady=10, padx=10)
ent_nome = tk.Entry(janela, font=("Arial", 14), width=25)
ent_nome.grid(row=0, column=1, pady=10, padx=10)
ent_ano_nascimento = tk.Entry(janela, font=("Arial", 14), width=25)
ent_ano_nascimento.grid(row=1, column=1, pady=10, padx=10)
ent_calulo =  tk.Entry(janela, font=("Arial", 14), width=25)
ent_calulo.grid(row=2, column=1, pady=10, padx=10)
btn_calcular = tk.Button(janela, text="Calcular Idade", font=("Arial", 14), fg="black", command=calcular_idade_designer)
btn_calcular.grid(row=5, column=1, pady=10, padx=10)
btn_fechar_janela = tk.Button(janela, text="Fechar", font=("Arial", 12), command=janela.destroy)
btn_fechar_janela.grid(row=6, column=1, pady=10, padx=10)
janela.mainloop()


