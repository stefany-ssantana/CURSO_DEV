# Curso: Lógica de Programação com Python e Versionamento no GitHub

---

## 1. Ementa e Conteúdo das Aulas

### Aula 1: Fundamentos de Lógica e Variáveis
* Conceito de algoritmo, lógica de programação e pensamento computacional.
* Variáveis, tipos de dados primitivos (Inteiro, Ponto Flutuante, Texto, Booleano).
* Operadores aritméticos, relacionais e lógicos.
* Entrada de dados (`input`) e saída de dados (`print`).

### Aula 2: Estruturas de Controle e Tomada de Decisão
* Estruturas condicionais simples e compostas (`if`, `elif`, `else`).
* Escopo de blocos e identação obrigatória no Python.
* Estruturas de repetição baseadas em condições (`while`).
* Estruturas de repetição baseadas em coleções (`for` e função `range`).

### Aula 3: Modularização e Coleções de Dados
* Declaração de funções (`def`), passagem de parâmetros e retorno de valores.
* Manipulação de listas: indexação, métodos de adição, remoção e ordenação.
* Tratamento de exceções e erros de execução (`try`, `except`).

### Aula 4: Versionamento de Código com Git e GitHub
* Introdução ao controle de versão e conceitos de repositório.
* Configuração inicial do ambiente local com Git.
* Ciclo de vida dos arquivos (Área de trabalho, Área de preparação, Repositório local).
* Criação de repositórios no GitHub e sincronização via comandos de terminal.

---

## 2. Prática Computacional: Script em Python

Este programa em Python consolida os conceitos de funções, estruturas condicionais, laços de repetição, listas e tratamento de exceções. O código simula um validador de dados para sensores ambientais.

```python
def analisar_leituras(limite_alerta):
    """
    Processa uma lista de dados fornecida pelo usuário,
    valida os valores e monitora ocorrências acima do limite.
    """
    historico_valores = []
    alertas_disparados = 0

    print("--- Sistema de Análise de Dados Iniciado ---")
    print("Digite os valores inteiros ou 'sair' para encerrar o programa.")

    while True:
        entrada = input("Digite o valor do sensor: ").strip()

        if entrada.lower() == 'sair':
            break

        try:
            # Converte a entrada de texto para número inteiro
            valor = int(entrada)
            historico_valores.append(valor)

            # Estrutura condicional para validação de limite
            if valor > limite_alerta:
                print(f"Alerta: O valor {valor} ultrapassou o limite de {limite_alerta}!")
                alertas_disparados += 1
            else:
                print(f"Valor {valor} registrado com sucesso.")

        except ValueError:
            print("Erro: Entrada inválida. Por favor, insira um número inteiro.")

    # Processamento final dos dados coletados
    if historico_valores:
        total_leituras = len(historico_valores)
        media = sum(historico_valores) / total_leituras
        
        print("\n--- Relatório Final de Execução ---")
        print(f"Total de leituras válidas: {total_leituras}")
        print(f"Média dos valores registrados: {media:.2f}")
        print(f"Total de alertas críticos disparados: {alertas_disparados}")
    else:
        print("\nNenhum dado válido foi registrado no histórico.")

if __name__ == "__main__":
    # Define o limite crítico para execução da função
    analisar_leituras(limite_alerta=700)
```

---

## 3. Prática de Versionamento: Fluxo Git e GitHub

Roteiro de comandos de terminal para criar um repositório local, rastrear o script Python desenvolvido e enviá-lo para um repositório remoto no GitHub.

### Configuração Inicial (Executar apenas uma vez no computador)
```bash
# Define o nome global do desenvolvedor
git config --global user.name "Seu Nome Completo"

# Define o e-mail global vinculado à conta do GitHub
git config --global user.email "seu-email@provedor.com"
```

### Inicialização e Criação do Histórico Local
```bash
# Inicializa um repositório Git vazio na pasta atual do projeto
git init

# Cria o arquivo .gitignore para evitar o envio de arquivos temporários do Python
echo "__pycache__/" > .gitignore

# Verifica o status atual dos arquivos na pasta de trabalho
git status

# Adiciona todos os arquivos modificados e criados à área de preparação (Stage)
git add .

# Grava o estado atual dos arquivos criando um ponto na história (Commit)
git commit -m "Commit inicial: Adiciona script de analise de dados em Python"
```

### Conexão e Envio para o GitHub
```bash
# Altera o nome do ramo principal do repositório para o padrão 'main'
git branch -M main

# Associa o repositório local ao repositório remoto criado previamente no GitHub
git remote add origin github.com

# Envia o histórico de commits do repositório local para o GitHub (Ramo main)
git push -u origin main
```
