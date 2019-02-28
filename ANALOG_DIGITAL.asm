#include p18f87k22.inc

    global  ADC_Setup, ADC_read_A0, ADC_read_A5, ADC_read_A1
       
ADC code
 
ADC_Setup
    bsf	    TRISA,RA0		    ; use pin A0(==AN0) for input
    bsf	    ANCON0,ANSEL0           ; set A0 to analog
    bsf	    TRISA,RA5		    ; use pin A5(==AN4) for input
    bsf	    ANCON0,ANSEL4           ; set A5 to analog
    bsf	    TRISA,RA1		    ; use pin A1(==AN1) for input
    bsf	    ANCON0,ANSEL1           ; set A1 to analog
    movlw   0x01		    ; select AN0 for measurement
    movwf   ADCON0		    ; and turn ADC on
    movlw   0x30		    ; Select 4.096V positive reference, we will have to change the reference voltage
    movwf   ADCON1		    ; 0V for -ve reference and -ve input
    movlw   0xED		    ; Right justified output
    movwf   ADCON2		    ; Fosc/16 A/D clock and 12x acquisition time
    return
    
ADC_read_A0
    movlw   0x01		    ; select AN0 for measurement
    movwf   ADCON0		    ; and turn ADC on
    bsf	    ADCON0,GO
adc_loop
    btfsc   ADCON0, GO
    bra	    adc_loop
    return
    
ADC_read_A5
    movlw   0x11		    ; select AN4 for measurement
    movwf   ADCON0		    ; and turn ADC on
    bsf	    ADCON0,GO
adc_loop1
    btfsc   ADCON0, GO
    bra	    adc_loop1
    return
    
ADC_read_A1
    movlw   0x05		    ; select AN1 for measurement
    movwf   ADCON0		    ; and turn ADC on
    bsf	    ADCON0,GO
adc_loop2
    btfsc   ADCON0, GO
    bra	    adc_loop2
    return
    
    END
