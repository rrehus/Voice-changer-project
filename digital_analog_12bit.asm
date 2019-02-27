	#include p18f87k22.inc
	
	global	DAC_Setup, DAC_write, DAC_end_write
	extern SPI_MasterInit, SPI_MasterTransmit
	
int_hi	code	0x0008	; high vector, no low vector
	btfss	INTCON,TMR0IF	; check that this is timer0 interrupt
	retfie	FAST		; if not then return
	incf	LATD		; increment PORTD
	bcf	INTCON,TMR0IF	; clear interrupt flag
	retfie	FAST		; fast return from interrupt

DAC	code
DAC_Setup
	call    SPI_MasterInit
	clrf	TRISD		; Set PORTD as all outputs
	clrf	LATD		; Clear PORTD outputs
	bsf	PORTD, 1	; set LDAC to high
	bsf	PORTD, 0	; set CS to high
	movlw	b'10000111'	; Set timer0 to 16-bit, Fosc/4/256
	movwf	T0CON		; = 62.5KHz clock rate, approx 1sec rollover
	bsf	INTCON,TMR0IE	; Enable timer0 interrupt
	bsf	INTCON,GIE	; Enable all interrupts
	return

delay
	nop
	nop
	return

DAC_write 
    bcf PORTD, 0		; set CS to low
    bsf	PORTD, 1		; set LDAC to high
    call delay
    call SPI_MasterTransmit
    return
DAC_end_write
    bsf PORTD, 0		; set CS to 1
    call delay
    bcf  PORTD, 1		; set LDAC to 0
    call delay
    bsf  PORTD, 1		; set LDAC to 1
    return

    END