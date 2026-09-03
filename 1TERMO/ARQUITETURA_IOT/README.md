# Curso: Práticas em Arquitetura IoT

---

## Ementa e Conteúdo das Aulas

### Aula 1: Fundamentos de Hardware e Firmware
* Introdução ao ecossistema de hardware livre.
* Estrutura interna do microcontrolador ATmega328P.
* Pinos digitais, analógicos e modulação PWM.
* Protocolos de comunicação serial (UART, I2C, SPI).

### Aula 2: Programação Bare-Metal e C++ com Arduino
* Ciclo de vida do firmware (setup e loop).
* Manipulação direta de registradores vs APIs nativas.
* Gerenciamento de memória RAM restrita em sistemas embarcados.
* Leitura de sensores e controle de atuadores físicos.

### Aula 3: O Papel do Python na Arquitetura IoT
* Python como linguagem de gateway e processamento.
* Comunicação serial entre PC/Gateway e Arduino via código.
* Armazenamento local de dados coletados em formato JSON/CSV.
* Introdução a scripts de automação baseados em eventos.

### Aula 4: Integração de Sistemas e Conectividade
* Criação de um pipeline completo: Sensor -> Arduino -> Python -> Nuvem.
* Tratamento de ruídos em sinais analógicos via software.
* Lógica de tomada de decisão local no gateway Python.

---

## Plataforma de Hardware: Arduino

* Microcontrolador: Base principal para prototipagem rápida de nós sensores.
* Baixo Custo: Facilidade de acesso e vasta comunidade de suporte técnico.
* GPIO: Portas programáveis de entrada e saída para interface com o mundo físico.
* Limitação: Baixo poder de processamento, exigindo delegação de carga para gateways.

---

## Programação do Nó Sensor: C++ (Arduino)

Este código lê um sensor analógico no Arduino e envia o dado formatado via porta serial.

```cpp
// Definição de pinos e constantes
const int SENSOR_PIN = A0;
const int LED_PIN = 13;
const int TAXA_SERIAL = 9600;

void setup() {
  // Inicializa comunicação serial
  Serial.begin(TAXA_SERIAL);
  
  // Configura modos dos pinos
  pinMode(SENSOR_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  // Leitura do valor analógico (0 a 1023)
  int valorSensor = analogRead(SENSOR_PIN);
  
  // Envia o dado via serial com quebra de linha
  Serial.println(valorSensor);
  
  // Feedback visual rápido
  digitalWrite(LED_PIN, HIGH);
  delay(50);
  digitalWrite(LED_PIN, LOW);
  
  // Intervalo de amostragem (1 segundo)
  delay(950);
}
```

---

## Programação do Gateway: Python

Este script roda no computador ou Raspberry Pi, lê os dados enviados pelo Arduino e toma ações.

```python
import serial
import time

# Configurações da porta serial (ajuste a porta conforme seu SO)
PORTA_SERIAL = 'COM3'  # No Linux/Mac use algo como '/dev/ttyUSB0'
BAUD_RATE = 9600

def iniciar_gateway():
    try:
        # Abre a conexão com o Arduino
        arduino = serial.Serial(PORTA_SERIAL, BAUD_RATE, timeout=1)
        time.sleep(2) # Aguarda estabilização do Arduino
        print(f"Conectado com sucesso na porta {PORTA_SERIAL}")
        
        while True:
            if arduino.in_waiting > 0:
                # Lê a linha de dados, decodifica para texto e limpa espaços
                linha = arduino.readline().decode('utf-8').strip()
                
                if linha:
                    valor = int(linha)
                    print(f"Dado recebido do sensor: {valor}")
                    
                    # Lógica de tomada de decisão na Borda (Edge)
                    if valor > 700:
                        print("Alerta: Valor crítico atingido!")
                        
    except Exception as e:
        print(f"Erro: Não foi possível conectar ao Arduino. Detalhes: {e}")
    except KeyboardInterrupt:
        print("\nGateway finalizado pelo usuário.")
    finally:
        if 'arduino' in locals() and arduino.is_open:
            arduino.close()

if __name__ == "__main__":
    iniciar_gateway()
```