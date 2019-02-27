import numpy as np
import serial

gaussian = np.floor(np.abs(np.random.normal(75,150, 1000)))
gaussian[gaussian>255] = 255
#gaussian = [255 for i in range(100)]
gaussian_binary = [bin(int(i)) for i in gaussian]

ser = serial.Serial()
ser.baudrate = 9600
ser.port = "COM4"
ser.open()

for j in gaussian_binary:
    #print(i)
    #i = int(i)
    ser.write(j.encode())
