#include p18f87k22.inc

    global  Volume_Setup, VolumeDo
    extern  division16x16, dividh, dividl, divish, divisl, quoth, quotl
    extern  ADC_read_A1, multiplication16x16, multiplication8x16, k16, k8, mul16, prod8x16, prod16x16
    extern  LCD_Setup, LCD_Write_Hex, LCD_Hex_Nib, LCD_hex_tmp, LCD_Write_Message, LCD_Send_Byte_D
    
acs_vol	    udata_acs	; Define variables in user access data
volume	    res 1	; reserve 1 byte for volume
voldisp	    res 2	; reserve 2 bytes for voldisp
voltmp	    res 1	; reserve 1 byte for voltmp
counter	    res 1   ; reserve one byte for a counter variable
	    
acs_tmp	    access_ovr	; Define temporary variables
delay_count res	1	; reserve 1 byte for delay_count
voltmp1	    res	1	; reserve 1 byte for voltmp1
 
tables	udata	0x400    ; reserve data anywhere in RAM (here at 0x400)
Array	res	0x80    ; reserve 128 bytes for message data
	
pdata	code    ; a section of programme memory for storing data
	; ******* myTable, data in programme memory, and its length *****
Table	data	    "Volume: "	    ; message, plus carriage return
	constant    Table_l=.8	    ; length of data
       
VolumeControl code

Volume_Setup
    movlw   0x0
    movwf   TRISE	; make port E output (where voltage to be output)
    movwf   TRISG	; make port F output (for WR pin)
    movwf   LATE
    movwf   LATG
    bsf	    PORTG, 1
    call    table_write
    return

table_write
    lfsr	FSR0, Array	; Load FSR0 with address in RAM	
    movlw	upper(Table)	; address of data in PM
    movwf	TBLPTRU		; load upper bits to TBLPTRU
    movlw	high(Table)	; address of data in PM
    movwf	TBLPTRH		; load high byte to TBLPTRH
    movlw	low(Table)	; address of data in PM
    movwf	TBLPTRL		; load low byte to TBLPTRL
    movlw	Table_l		; bytes to read
    movwf 	counter		; our counter register
table_loop
    tblrd*+			; one byte from PM to TABLAT, increment TBLPRT
    movff	TABLAT, POSTINC0; move data from TABLAT to (FSR0), inc FSR0	
    decfsz	counter		; count down to zero
    bra		table_loop	; keep going until finished
    return
    
VolumeSet
    clrf	PORTG
    call	delay
    movff	volume, PORTE
    call	delay
    setf	PORTG
    call	delay
    return
    
VolumeRead
    call	ADC_read_A1
    swapf	ADRESL, 0
    andlw	0x0F
    movwf	volume
    swapf	ADRESH, 0
    andlw	0xF0
    addwf	volume, 1
    return
    
VolumeDisp
    rrncf	volume, 0
    movwf	voltmp
    bcf		voltmp, 7
    movlw	0x64
    mulwf	voltmp
    movff	PRODH, dividh
    movff	PRODL, dividl
    clrf	divish
    movlw	0x7F
    movwf	divisl
    call	division16x16
    movff	quotl, voltmp
    movlw	0x29
    mulwf	voltmp
    swapf	PRODH, 0
    andlw	0x0F
    movwf	voldisp
    movlw	0x0F
    andwf	PRODH, 0
    movwf	k16
    movff	PRODL, k16+1
    movlw	0xA
    call	multiplication8x16
    movlw	0xF0
    andwf	prod8x16+1, 0
    movwf	voldisp+1
    movlw	0x0F
    andwf	prod8x16+1, 0
    movwf	k16
    movff	prod8x16+2, k16+1
    movlw	0xA
    call	multiplication8x16
    swapf	prod8x16+1, 0
    andlw	0x0F
    addwf	voldisp+1
    movlw	0x0
    return
    
VolumeDo
    call	VolumeRead
    call	VolumeSet
    call	VolumeDisp
    movlw	Table_l
    lfsr	FSR2, Array
    call	LCD_Write_Message
    cpfseq	voldisp
    bra		cond1
    movlw	0x20
    call	LCD_Send_Byte_D
    bra		next
cond1
    movf	voldisp, W
    call	LCD_Hex_Nib
    bra		cond2
next
    movff	voldisp+1, voltmp1
    movlw	0xF0
    andwf	voltmp1, 1
    movlw	0x0
    cpfseq	voltmp1
    bra		cond2
    movff	voldisp+1, voltmp1
    movlw	0x0F
    andwf	voltmp1, 1
    movlw	0x0
    cpfseq	voltmp1
    bra		cond3
    movlw	0x20
    call	LCD_Send_Byte_D
    movlw	0x30
    call	LCD_Send_Byte_D
    bra		next1
cond3
    movlw	0x20
    call	LCD_Send_Byte_D
    movf	voldisp+1, W
    andlw	0x0F
    call	LCD_Hex_Nib
    bra		next1
cond2
    movf	voldisp+1, W
    call	LCD_Write_Hex
next1
    movlw	0x25
    call	LCD_Send_Byte_D
    call	LCD_Setup
    return
    
delay
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

