# -*- coding: utf-8 -*-
"""
Created on Tue Feb 26 12:33:55 2019

@author: rr2016
"""
'''NOTE: Please import pyserial module first 
         for example with:
                  pip install pyserial'''
                  
import serial
import matplotlib.pyplot as plt

ser=serial.Serial()
ser.port="COM4"     # set COM port (for Windows)
ser.open()

decimals=[]         # array for plotting histogram (useful only if looking at noise to determine "randomness")

f = open("serial.txt", "w+")    # file for UART data output

for i in range(100000):
    b=ser.read()        # read data
    i=int.from_bytes(b, byteorder='little')
    f.write(str(i))
    f.write(" ")
    decimals.append(i)  # append data to list
plt.hist(decimals, 100) # plot the histogram (again only useful if only looking at noise)
f.close()
