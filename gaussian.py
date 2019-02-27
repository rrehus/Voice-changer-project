'''NOTE: Please import pyserial module first 
         for example with:
                  pip install pyserial'''

import numpy as np
import serial

gaussian = np.floor(np.abs(np.random.normal(75,150, 1000)))     # generate gaussian distribution
gaussian[gaussian>255] = 255                                    # set maximum nuber to 255 as can only hadle byte transfers over UART
gaussian_binary = [bin(int(i)) for i in gaussian]               # convert array to binary

#Setup serial transfer over UART
ser = serial.Serial()
ser.baudrate = 9600     # set baud rate
ser.port = "COM4"       # set COM port (for Windows)
ser.open()

for j in gaussian_binary:
    ser.write(j.encode())   # transmit datat in list
