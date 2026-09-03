# # 1  cadastro de funcionário 
# print("Seja bem vindo ao Cadastro de funcionários")
# print("Projeto Brigada: Sistema de Gestão de Segurança do Trabalho (SESMT)")
# nome = input("Digite seu nome:  ")
# setor = input("Você atua em que setor?  ").lower() # .lower() padroniza para letras minúsculas
# status = input("Qual o seu status de treinamento?  ")
# print(f"Obrigado Sr. {nome}, seu cadastro foi realizado com sucesso!\n")

# # 2 verificação de EPI
# print(f"Verificando EPIs para seu setor: {setor}... ")

# if setor == "elétrica" or setor == "eletrica":
#     print(f"Seus EPIs necessários para o setor de {setor} são: ")
#     print("- Óculos de proteção")
#     print("- Toucas descartáveis (para proteger o cabelo)")
#     print("- Sapatão")
#     print("ATENÇÃO! RETIRAR TODOS OS ADORNOS (piercings, brincos, colares, anéis...)\n") 
    
#     # A pergunta sobre altura deve ficar dentro do setor ou após a definição dos EPIs básicos
#     altura = input("Você faz trabalho em alturas? (responda com sim ou não): ").lower()
    
#     if altura == "sim":
#         print("Seus EPIs adicionais são: cinturão de segurança e talabarte!")
# else:
#     print("Setor não reconhecido ou sem EPIs específicos cadastrados.")


# import tkinter as tk
# from tkinter import messagebox

# # Função do botão
# def cadastrar():

#     nome = caixa_nome.get()
#     setor = caixa_setor.get().lower()
#     status = caixa_status.get().lower()
#     altura = caixa_altura.get().lower()

#     mensagem = "Funcionário: " + nome + "\n"
#     mensagem += "Setor: " + setor + "\n"
#     mensagem += "Status do treinamento: " + status + "\n\n"

#     # Verificação dos EPIs
#     if setor == "eletrica":

#         mensagem += "EPIs necessários:\n"
#         mensagem += "- Óculos de proteção\n"
#         mensagem += "- Touca descartável\n"
#         mensagem += "- Sapatão\n"
#         mensagem += "- Retirar adornos\n"

#         if altura == "sim":
#             mensagem += "- Cinturão de segurança\n"
#             mensagem += "- Talabarte\n"

#     else:
#         mensagem += "Setor sem cadastro no nosso sistema."

#     messagebox.showinfo("Cadastro realizado", mensagem)

# janela = tk.Tk()
# janela.title("Cadastro de Funcionário")
# janela.geometry("800x400")

# texto_nome = tk.Label(janela, text="Digite seu nome")
# texto_nome.pack()

# caixa_nome = tk.Entry(janela)
# caixa_nome.pack()

# texto_setor = tk.Label(janela, text="Digite seu setor")
# texto_setor.pack()

# caixa_setor = tk.Entry(janela)
# caixa_setor.pack()

# texto_status = tk.Label(janela, text="Status do treinamento")
# texto_status.pack()

# caixa_status = tk.Entry(janela)
# caixa_status.pack()

# texto_altura = tk.Label(janela, text="Trabalha em altura? (sim ou não)")
# texto_altura.pack()

# caixa_altura = tk.Entry(janela)
# caixa_altura.pack()

# botao = tk.Button(janela, text="Cadastrar", command=cadastrar)
# botao.pack(pady=20)

# botao_fechar = tk.Button(janela, text="Fechar", command=janela.destroy)
# botao_fechar.pack()

# janela.mainloop()



# esse é o projeto feito por IA

import tkinter as tk

# ---------------- FUNÇÃO ---------------- #

def cadastrar():

    nome = caixa_nome.get()
    setor = caixa_setor.get().lower()
    status = caixa_status.get().lower()
    altura = caixa_altura.get().lower()

    mensagem = "Funcionário: " + nome + "\n"
    mensagem += "Setor: " + setor + "\n"
    mensagem += "Status do treinamento: " + status + "\n\n"

    if setor == "eletrica":

        mensagem += "EPIs necessários:\n"
        mensagem += "- Óculos de proteção\n"
        mensagem += "- Touca descartável\n"
        mensagem += "- Sapatão\n"
        mensagem += "- Retirar adornos\n"

        if altura == "sim":
            mensagem += "- Cinturão de segurança\n"
            mensagem += "- Talabarte\n"

    else:
        mensagem += "Setor sem cadastro."

    # ---------------- JANELA PERSONALIZADA ---------------- #

    janela_msg = tk.Toplevel()
    janela_msg.title("Cadastro")
    janela_msg.geometry("450x350")
    janela_msg.config(bg="#12002b")

    titulo_msg = tk.Label(
        janela_msg,
        text="✦ Cadastro Realizado ✦",
        bg="#12002b",
        fg="#ff66ff",
        font=("Arial", 18, "bold")
    )

    titulo_msg.pack(pady=15)

    texto_msg = tk.Label(
        janela_msg,
        text=mensagem,
        bg="#12002b",
        fg="white",
        font=("Arial", 11),
        justify="left"
    )

    texto_msg.pack(padx=20, pady=10)

    botao_ok = tk.Button(
        janela_msg,
        text="OK",
        command=janela_msg.destroy,
        bg="#ff00cc",
        fg="white",
        font=("Arial", 12, "bold"),
        width=15,
        relief="flat",
        cursor="hand2"
    )

    botao_ok.pack(pady=20)


# ---------------- JANELA PRINCIPAL ---------------- #

janela = tk.Tk()
janela.title("Sistema Galaxy")
janela.geometry("700x550")
janela.resizable(False, False)

# Canvas do degrade
canvas = tk.Canvas(janela, width=700, height=550)
canvas.pack(fill="both", expand=True)

# ---------------- DEGRADE ---------------- #

for i in range(550):

    r = int(25 + (120 - 25) * (i / 550))
    g = int(0 + (0 - 0) * (i / 550))
    b = int(60 + (255 - 60) * (i / 550))

    cor = f'#{r:02x}{g:02x}{b:02x}'

    canvas.create_line(0, i, 700, i, fill=cor)

# ---------------- FRAME ---------------- #

frame = tk.Frame(
    janela,
    bg="#1b1035",
    padx=30,
    pady=30
)

frame.place(relx=0.5, rely=0.5, anchor="center")

# ---------------- TITULO ---------------- #

titulo = tk.Label(
    frame,
    text="✦ Cadastro Galaxy ✦",
    bg="#1b1035",
    fg="#ff66ff",
    font=("Arial", 22, "bold")
)

titulo.pack(pady=15)

# ---------------- CAMPOS ---------------- #

def criar_campo(texto):

    label = tk.Label(
        frame,
        text=texto,
        bg="#1b1035",
        fg="white",
        font=("Arial", 12, "bold")
    )

    label.pack(anchor="w", pady=(10,2))

    entrada = tk.Entry(
        frame,
        width=35,
        font=("Arial", 12),
        bg="#2d1b55",
        fg="white",
        insertbackground="white",
        relief="flat"
    )

    entrada.pack(ipady=6)

    return entrada

caixa_nome = criar_campo("Nome")
caixa_setor = criar_campo("Setor")
caixa_status = criar_campo("Status do treinamento")
caixa_altura = criar_campo("Trabalha em altura?")

# ---------------- BOTÃO CADASTRAR ---------------- #

botao = tk.Button(
    frame,
    text="Cadastrar",
    command=cadastrar,
    bg="#ff00cc",
    fg="white",
    activebackground="#9900ff",
    activeforeground="white",
    font=("Arial", 13, "bold"),
    width=20,
    relief="flat",
    cursor="hand2"
)

botao.pack(pady=20)

# ---------------- BOTÃO FECHAR ---------------- #

botao_fechar = tk.Button(
    frame,
    text="Fechar",
    command=janela.destroy,
    bg="#6a00ff",
    fg="white",
    activebackground="#aa00ff",
    activeforeground="white",
    font=("Arial", 12, "bold"),
    width=20,
    relief="flat",
    cursor="hand2"
)

botao_fechar.pack()

# ---------------- INICIAR ---------------- #

janela.mainloop()