#include p18f87k22.inc

    global  ADC_Setup, ADC_read, ADC_read_other
       
ADC code
 
ADC_Setup
    bsf	    TRISA,RA0		    ; use pin A0(==AN0) for input
    bsf	    ANCON0,ANSEL0           ; set A0 to analog
    bsf	    TRISA,RA5		    ; use pin A5(==AN5) for input
    bsf	    ANCON5,ANSEL5	    ; set A5 to analog
    movlw   0x01		    ; select AN5 for measurement
    movwf   ADCON5
    movlw   0x01		    ; select AN0 for measurement
    movwf   ADCON0		    ; and turn ADC on
    movlw   0x30		    ; Select 4.096V positive reference, we will have to change the reference voltage
    movwf   ADCON1		    ; 0V for -ve reference and -ve input
    movlw   0xF6		    ; Right justified output
    movwf   ADCON2		    ; Fosc/64 A/D clock and 20x acquisition time
    return

ADC_read
    bsf	    ADCON0,GO
adc_loop
    btfsc   ADCON0, GO
    bra	    adc_loop
    return
ADC_read_other
    bsf    ADCON5, GO
adc_loop_other
    btfsc  ADCON5, GO
    bra    adc_loop_other
    return
    END