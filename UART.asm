#include p18f87k22.inc

    global  UART_Transmit_Byte, UART_Receive_Byte, UART_Setup
    global  noise
    
acs_uart    udata_acs 
noise	res 1 ; reserve one byte for noise variable
UART    code
    
UART_Setup
    bsf	    RCSTA1, SPEN    ; enable serial port
    bcf	    TXSTA1, SYNC    ; synchronous
    bcf	    TXSTA1, BRGH    ; slow speed
    bsf	    TXSTA1, TXEN    ; enable transmit
    bcf	    BAUDCON1, BRG16 ; 8-bit generator only
    movlw   .103	    ; gives 9600 Baud rate (actually 9615)
    movwf   SPBRG1
    bcf	    TRISC, TX1	    ; TX1 pin as output
    bcf     RCSTA1, CREN    ; ensure that CREN is clear
    bcf     RCSTA1, SREN    ; ensure that SREN is clear
    bsf     TXSTA1, CSRC    ; clock internally from BRG
    bsf     RCSTA1, CREN    ; enable continuous receiving of the bits
    bsf	    TRISC,  RX1	    ; RX1 pin as input
    return
    
UART_Transmit_Byte	    ; Transmits byte stored in W
    btfss   PIR1,TX1IF	    ; TX1IF is set when TXREG1 is empty
    bra	    UART_Transmit_Byte
    movwf   TXREG1
    return
    
UART_Receive_Byte
    movff RCREG1, noise ;move the received byte into noise variable
    return
    end
