# -*- coding: utf-8 -*-
"""
Created on Tue Feb 26 12:33:55 2019

@author: rr2016
"""

import serial
import matplotlib.pyplot as plt
ser=serial.Serial()
ser.port="COM4"
ser.open()
decimals=[]
f = open("serial.txt", "w+")
for i in range(100000):
    b=ser.read()
    i=int.from_bytes(b, byteorder='little')
    f.write(str(i))
    f.write(" ")
    decimals.append(i)
plt.hist(decimals, 100)
f.close()
