# Curso: Fundamentos de Sistemas Operacionais (Linux, Windows e iOS)

---

## 1. Ementa e Conteúdo das Aulas

### Aula 1: Introdução, Evolução e Arquitetura de Sistemas Operacionais
* Conceito de Sistema Operacional, Kernel (Núcleo) e espaço de usuário.
* Evolução histórica dos sistemas: Monotarefa vs Multitarefa.
* Arquiteturas Monolíticas (Linux), Híbridas (Windows) e Microkernel.
* Tipos de Interfaces: CLI (Linha de Comando) e GUI (Interface Gráfica).

### Aula 2: Gerenciamento de Processos, Memória e Arquivos
* Ciclo de vida de um processo, threads e estados (Pronto, Execução, Bloqueado).
* Gerenciamento de memória: Paginação, segmentação e memória virtual.
* Sistemas de arquivos e tabelas de alocação: NTFS, ext4 e APFS.
* Permissões de acesso, segurança e propriedade de arquivos.

### Aula 3: Administração e Linha de Comando (Linux vs Windows)
* Estrutura de diretórios padrão: Padrão FHS do Linux contra a estrutura do Windows.
* Comandos essenciais de terminal para manipulação de arquivos e navegação.
* Gerenciamento de usuários, grupos e elevação de privilégios (sudo vs Admin).
* Automação básica de tarefas por meio de scripts Bash e PowerShell.

### Aula 4: Ecossistemas Móveis, Segurança e Sandbox (Foco em iOS)
* Arquitetura de segurança do ecossistema Apple iOS (Darwin e camada XNU).
* O conceito de Sandbox: Isolamento de aplicativos e controle de permissões.
* Ciclo de vida de aplicativos móveis e eficiência no gerenciamento de energia.
* Comparativo técnico final: Desktop (Linux/Windows) contra Mobile (iOS).

---

## 2. Comparativo Técnico entre Sistemas Operacionais

### Linux
* **Kernel:** Monolítico.
* **Sistema de Arquivos Padrão:** ext4 (Extended File System 4).
* **Interface Nativa:** CLI (Bash/Zsh). GUIs variadas (GNOME, KDE, XFCE).
* **Licenciamento:** Código Aberto (Open Source) sob licenças como GNU GPL.

### Windows
* **Kernel:** Híbrido.
* **Sistema de Arquivos Padrão:** NTFS (New Technology File System).
* **Interface Nativa:** GUI (Ambiente Windows Shell). CLI via CMD e PowerShell.
* **Licenciamento:** Proprietário (Código Fechado comercializado pela Microsoft).

### iOS
* **Kernel:** Híbrido (XNU baseado em Mach e componentes BSD).
* **Sistema de Arquivos Padrão:** APFS (Apple File System).
* **Interface Nativa:** GUI (Cocoa Touch otimizada para telas sensíveis ao toque).
* **Licenciamento:** Proprietário (Código Fechado restrito ao hardware da Apple).

---

## 3. Laboratório Prático: Equivalência de Comandos no Terminal

Guia prático para os alunos compararem a execução de tarefas via linha de comando nos ambientes administrativos.


| Ação no Sistema | Terminal Linux (Bash) | Terminal Windows (PowerShell) |
| :--- | :--- | :--- |
| Listar conteúdo do diretório | `ls -la` | `Get-ChildItem` (ou `dir`) |
| Navegar entre pastas | `cd /var/log/` | `Set-Location C:\Windows\` (ou `cd`) |
| Criar um novo diretório | `mkdir nova_pasta` | `New-Item -ItemType Directory nova_pasta` |
| Copiar arquivos | `cp arquivo.txt /destino/` | `Copy-Item arquivo.txt -Destination C:\destino\` |
| Mover ou renomear arquivos | `mv antigo.txt novo.txt` | `Move-Item antigo.txt novo.txt` |
| Excluir arquivos | `rm arquivo.txt` | `Remove-Item arquivo.txt` |
| Exibir o conteúdo de um arquivo | `cat configuracao.conf` | `Get-Content configuracao.conf` |
| Visualizar processos ativos | `ps aux` | `Get-Process` |
| Elevar privilégios de comando | `sudo comando` | Executar o PowerShell como Administrador |

---

## 4. Estudo de Caso: Segurança e Isolamento no iOS (Sandbox)

Diferente do Linux e do Windows, onde os programas podem interagir mais livremente com o sistema de arquivos caso tenham permissão do usuário, o iOS adota uma postura restrita por padrão.

### Regras de Arquitetura do iOS para Alunos:
* **Acesso ao Disco:** Um aplicativo não consegue ler ou modificar arquivos gerados por outro aplicativo diretamente no armazenamento.
* **Acesso ao Hardware:** Recursos como câmera, microfone e localização exigem uma requisição explícita para o sistema operacional, que exibe uma caixa de diálogo para aprovação do usuário.
* **Instalação de Binários:** O sistema bloqueia a execução de códigos que não sejam assinados digitalmente por chaves criptográficas reconhecidas pela Apple.