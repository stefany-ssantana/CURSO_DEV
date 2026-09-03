# Curso: Desenvolvimento de Sistemas IoT com Engenharia de Requisitos

---

## 1. Engenharia de Requisitos do Sistema IoT

### Elicitação de Requisitos
* **Brainstorming:** Dinâmica inicial com stakeholders para mapear os sensores necessários e os limites críticos de monitoramento.
* **Entrevistas:** Alinhamento com a equipe de operações para definir o tempo de resposta aceitável para os alertas gerados pelo hardware.

### Requisitos Funcionais (RF)
* **RF01:** O nó sensor (Arduino) deve realizar a leitura analógica do ambiente e transmitir os dados via porta serial a cada 1 segundo.
* **RF02:** O gateway (Python) deve ler os dados da porta serial, decodificar a informação e exibir o valor em tempo real no console.
* **RF03:** O gateway deve disparar uma mensagem de alerta visual no console sempre que a leitura do sensor ultrapassar o limite crítico de 700.

### Requisitos Não Funcionais (RNF)
* **RNF01 (Confiabilidade):** O script Python deve restabelecer a varredura automaticamente ou encerrar a conexão de forma segura sem travar o sistema operacional em caso de desconexão física do hardware.
* **RNF02 (Desempenho):** O firmware do microcontrolador deve processar a leitura e o envio do sinal em menos de 100 milissegundos por ciclo.

### Modelagem do Fluxo de Dados (Diagrama)
### Prototipagem e Relatório Técnico
* **Baixa Fidelidade:** Esquema textual de pinagem indicando a conexão do sensor na porta analógica A0 e o LED na porta digital 13.
* **Relatório Técnico:** Documento de Especificação de Requisitos de Software (ERS) contendo a assinatura das funções de comunicação serial e os parâmetros de configuração da taxa de transmissão (Baud Rate).

---

## 2. Implementação Técnica Integrada

### Código do Nó Sensor: C++ (Arduino)

```cpp
// Definição de pinos e constantes de hardware
const int SENSOR_PIN = A0;
const int LED_PIN = 13;
const int TAXA_SERIAL = 9600;

void setup() {
  // Inicializa comunicação serial conforme especificado no RNF02
  Serial.begin(TAXA_SERIAL);
  
  // Configura modos dos pinos (Entrada para sensor e Saída para atuador de feedback)
  pinMode(SENSOR_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  // Atende ao RF01: Leitura analógica (0 a 1023)
  int valorSensor = analogRead(SENSOR_PIN);
  
  // Atende ao RF01: Envia o dado via serial com quebra de linha
  Serial.println(valorSensor);
  
  // Prototipagem de feedback visual rápido no hardware
  digitalWrite(LED_PIN, HIGH);
  delay(50);
  digitalWrite(LED_PIN, LOW);
  
  // Intervalo de amostragem de 1 segundo conforme especificado no RF01
  delay(950);
}
```

### Código do Gateway: Python

```python
import serial
import time

# Configurações da interface física mapeadas no relatório técnico
PORTA_SERIAL = 'COM3'  # No Linux/Mac substitua por '/dev/ttyUSB0'
BAUD_RATE = 9600

def iniciar_gateway():
    try:
        # Abre a conexão física com o nó sensor
        arduino = serial.Serial(PORTA_SERIAL, BAUD_RATE, timeout=1)
        time.sleep(2)  # Tempo necessário para estabilização do hardware
        print(f"Conectado com sucesso na porta {PORTA_SERIAL}")
        
        while True:
            if arduino.in_waiting > 0:
                # Atende ao RF02: Lê a linha de dados e decodifica para texto limpo
                linha = arduino.readline().decode('utf-8').strip()
                
                if linha:
                    valor = int(linha)
                    print(f"Dado recebido do sensor: {valor}")
                    
                    # Atende ao RF03: Validação de limite crítico na borda do sistema
                    if valor > 700:
                        print("Alerta: Valor crítico atingido!")
                        
    except Exception as e:
        # Atende ao RNF01: Tratamento de exceções para garantir a estabilidade do sistema
        print(f"Erro: Falha na comunicação com o hardware. Detalhes: {e}")
    except KeyboardInterrupt:
        print("\nGateway finalizado pelo usuário de forma segura.")
    finally:
        # Atende ao RNF01: Garante o fechamento da porta serial ao encerrar o script
        if 'arduino' in locals() and arduino.is_open:
            arduino.close()

if __name__ == "__main__":
    iniciar_gateway()