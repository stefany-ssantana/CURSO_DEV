from machine import Pin
from time import sleep
import dht

sensor = dht.DHT11(Pin(4))

while True:
    try:
        sensor.measure()
        
        temperatura = sensor.temperature()
        umidade = sensor.humidity()
        
        print("Temperatura: {} °C".format(temperatura))
        print("Umidade: {}".format(umidade))
        print("----------")
        
    except OSError as e:
        print("Erro na leitura do sensor")
    sleep(2)