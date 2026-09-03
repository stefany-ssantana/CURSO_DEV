from machine import Pin, time_pulse_us
from time import sleep_us, sleep

trigger = Pin(5, Pin.OUT)
echo = Pin(18, Pin.IN)

def medir_distancia():
    trigger.off()
    sleep_us(2)
    
    trigger.on()
    sleep_us(10)
    trigger.off()
    
    duracao = time_pulse_us(echo, 1)
    
    distancia = (duracao * 0.0343) / 2
    
    return distancia

while True:
    distancia = medir_distancia()
    
    print("Distância: {:.2f} cm".format(distancia))
    sleep(1)
    
    