#include p18f87k22.inc

    global  Volume_Setup, VolumeDo
    extern  division16x16, dividh, dividl, divish, divisl, quoth, quotl
    extern  ADC_read_A1, multiplication16x16, multiplication8x16, k16, k8, mul16, prod8x16, prod16x16
    extern  LCD_Setup, LCD_Write_Hex, LCD_Hex_Nib, LCD_hex_tmp, LCD_Write_Message, LCD_Send_Byte_D
    
acs_vol	    udata_acs		    ; Define variables in user access data
volume	    res 1		    ; reserve 1 byte for volume
voldisp	    res 2		    ; reserve 2 bytes for voldisp
voltmp	    res 1		    ; reserve 1 byte for voltmp
counter	    res 1		    ; reserve one byte for a counter variable
	    
acs_tmp	    access_ovr		    ; Define temporary variables
delay_count res	1		    ; reserve 1 byte for delay_count
voltmp1	    res	1		    ; reserve 1 byte for voltmp1
 
tables	udata	0x400		    ; reserve data anywhere in RAM (here at 0x400)
Array	res	0x80		    ; reserve 128 bytes for message data
	
pdata	code			    ; a section of programme memory for storing data
	; ******* myTable, data in programme memory, and its length *****
Table	data	    "Volume: "	    ; message, plus carriage return
	constant    Table_l=.8	    ; length of data
       
VolumeControl code

Volume_Setup
    movlw   0x0
    movwf   TRISE		    ; make port E output (where voltage to be output)
    movwf   TRISG		    ; make port G output (for WR pin)
    movwf   LATE		    ; clear LATE
    movwf   LATG		    ; clear LATG
    call    table_write		    ; move 'Volume: ' into memory
    return

table_write
    lfsr	FSR0, Array	    ; Load FSR0 with address in RAM	
    movlw	upper(Table)	    ; address of data in PM
    movwf	TBLPTRU		    ; load upper bits to TBLPTRU
    movlw	high(Table)	    ; address of data in PM
    movwf	TBLPTRH		    ; load high byte to TBLPTRH
    movlw	low(Table)	    ; address of data in PM
    movwf	TBLPTRL		    ; load low byte to TBLPTRL
    movlw	Table_l		    ; bytes to read
    movwf 	counter		    ; our counter register
table_loop
    tblrd*+			    ; one byte from PM to TABLAT, increment TBLPRT
    movff	TABLAT, POSTINC0    ; move data from TABLAT to (FSR0), inc FSR0	
    decfsz	counter		    ; count down to zero
    bra		table_loop	    ; keep going until finished
    return
    
VolumeSet
    clrf	PORTG		    ; Set WR pin low
    nop
    movff	volume, PORTE	    ; write volume to DAC
    nop
    setf	PORTG		    ; Set WR pin high
    nop
    return
    
VolumeRead
    call	ADC_read_A1	    ; read volume on pin RA1
    swapf	ADRESL, 0	    ; take only upper 8-bits of 12-bit ADC output
    andlw	0x0F
    movwf	volume
    swapf	ADRESH, 0
    andlw	0xF0
    addwf	volume, 1
    return
    
VolumeDisp
    call	LCD_Setup	    ; clear LCD and set cursor at beginning
    rrncf	volume, 0	    ; divide volume by 2 save in W
    movwf	voltmp		    ; save to voltmp
    bcf		voltmp, 7	    ; clear highest bit incase this was 1 (from rotate)
    movlw	0x64		    ; move 100 to W for multiplying
    mulwf	voltmp		    ; multiply voltmp by 100
    movff	PRODH, dividh	    ; move high product to high dividend
    movff	PRODL, dividl	    ; move low product to low dividend
    clrf	divish		    ; clear high byte of divisor
    movlw	0x7F		    ; set divisor to 127
    movwf	divisl
    call	division16x16	    ; divide the dividend by divisor
    movff	quotl, voltmp	    ; move lower byte of result to voltmp (as high byte is 0x0)
    movlw	0x29		    ; move 41 to W for multiplication
    mulwf	voltmp		    ; multiply voltmp by 41
    swapf	PRODH, 0	    ; get high nibble of high byte of result
    andlw	0x0F
    movwf	voldisp		    ; save in voldisp
    movlw	0x0F		    ; get low nibble of high byte of result
    andwf	PRODH, 0	    ; save in W
    movwf	k16		    ; move low nibble to k16 for multiplication
    movff	PRODL, k16+1	    ; move low byte of result to low byte of k16 for multiplication
    movlw	0xA		    ; move 10 into W
    call	multiplication8x16  ; multiply lowest 3 nibble of result by 10
    movlw	0xF0		    ; get high nibble of middle byte of result
    andwf	prod8x16+1, 0	    ; save in W
    movwf	voldisp+1	    ; move to high nibble low byte of voldisp
    movlw	0x0F		    ; get low nibble of middle byte of result
    andwf	prod8x16+1, 0	    ; save in W
    movwf	k16		    ; move to k16
    movff	prod8x16+2, k16+1   ; move low byte of result to low byte of k16
    movlw	0xA		    ; move 10 to W for multiplying
    call	multiplication8x16  ; multiply lowest 3 bytes of result by 10
    swapf	prod8x16+1, 0	    ; get high nibble of middle byte of result
    andlw	0x0F		    
    addwf	voldisp+1	    ; save in low nibble of low byte of voldisp
    ; Display 'Volume: ' on LCD
    movlw	Table_l		    ; set lenght of message
    lfsr	FSR2, Array	    ; set beginning address of message
    call	LCD_Write_Message   ; write message
    ; Format Volume Display to replace unnecessary 0s with spaces
    movlw	0x00		    ; move 0 into W for comparing
    cpfseq	voldisp		    ; check for 0 in first position of volume display
    bra		cond1		    ; if not send the digit
    movlw	0x20		    ; and send space instead
    call	LCD_Send_Byte_D	    ; send space
    bra		next		    ; continue to check if next digit is 0
cond1
    movf	voldisp, W	    ; move digit to W
    call	LCD_Hex_Nib	    ; send digit
    bra		cond2		    ; continue with rest of message
next
    movff	voldisp+1, voltmp1  ; move lower 2 digits into temporary storage
    movlw	0xF0		    ; look at 2nd digit
    andwf	voltmp1, 1
    movlw	0x0		    ; move 0 into W for comparing
    cpfseq	voltmp1		    ; check if 2nd digit 0
    bra		cond2		    ; if not output last 2 digits
    movff	voldisp+1, voltmp1  ; if so move last 2 digits to temporary storage
    movlw	0x0F		    ; look at 3rd digit
    andwf	voltmp1, 1
    movlw	0x0		    ; move 0 into W for comparison
    cpfseq	voltmp1		    ; check if 3rd digit 0
    bra		cond3		    ; if not go to cond3 to output space and then last digit
    movlw	0x20		    ; if so
    call	LCD_Send_Byte_D	    ; send space
    movlw	0x30		    ; then 0
    call	LCD_Send_Byte_D	    ; send
    bra		next1		    ; go to next1 to send %
cond3
    movlw	0x20		    ; send space
    call	LCD_Send_Byte_D
    movf	voldisp+1, W	    ; move last 2 digits into W
    andlw	0x0F		    ; take only 3rd digit
    call	LCD_Hex_Nib	    ; send to LCD
    bra		next1		    ; go to next1 to send %
cond2
    movf	voldisp+1, W	    ; send last 2 digits to LCD
    call	LCD_Write_Hex	    ; send
next1
    movlw	0x25		    ; send %
    call	LCD_Send_Byte_D	    ; to LCD
    return
    
VolumeDo
    call	VolumeRead	    ; read volume on pin RA1
    call	VolumeSet	    ; set volume on DAC
    ;call	VolumeDisp	    ; display volume
    return
    
delay				    ; A delay loop for setting the volume
    movlw	0x8
    movwf	delay_count
delay_loop_nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    decfsz	delay_count
    bra		delay_loop_nop
    return
    
    END

