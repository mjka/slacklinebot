import machine
from machine import Pin, PWM, I2C, TouchPad
import mpu6050

en = Pin(32, Pin.OUT)
pm = Pin(33, Pin.OUT)

touch1 = TouchPad(Pin(12))
touch2 = TouchPad(Pin(13))


i2c = I2C(scl=Pin(22), sda=Pin(21))
accel = mpu6050.accel(i2c, 104)

print("WHILE")

while 1:
    t1 = touch1.read() < 300
    t2 = touch2.read() < 300
    if t1 == t2:
        en.off()
    else:
        en.on()
        if t1:
            pm.on()
        else:
            pm.off()
    



while 0:
    a = accel.get_values()
    if a['GyZ'] > 1000:
        en.on()
        pm.on()
    elif a['GyZ'] < -1000:
        en.on()
        pm.off()
    else:
        en.off()



