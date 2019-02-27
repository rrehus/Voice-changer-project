# Voice-changer-project
Repository for Microprocessor Labs Project

An assembly program for PIC18 that takes two analogue inputs mixes (multiplication) them adds noise to them (uniform if internally generated, any if externally generated and transmitted through UART). Outputs the signal to a 12-bit SPI DAC and UART.

Python files have been included for saving signal transmitted through UART to a file as well as sending noise via UART

NOTE: to change from internally generated pseudorandom numbers to externally generated random numbers, please change line 31 in main.asm from 

    call    noise_loop
to

    call    gaussian_noise_loop
