_demoSevenSegmentDisplay:
;DemoARM.c,59 :: 		void demoSevenSegmentDisplay()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,62 :: 		for(number = 0; number < 10; number++)
; number start address is: 12 (R3)
MOVS	R3, #0
; number end address is: 12 (R3)
L_demoSevenSegmentDisplay0:
; number start address is: 12 (R3)
CMP	R3, #10
IT	CS
BCS	L_demoSevenSegmentDisplay1
;DemoARM.c,64 :: 		for(place = 0; place <= 4; place++)
; place start address is: 16 (R4)
MOVS	R4, #0
; place end address is: 16 (R4)
; number end address is: 12 (R3)
L_demoSevenSegmentDisplay3:
; place start address is: 16 (R4)
; number start address is: 12 (R3)
CMP	R4, #4
IT	HI
BHI	L_demoSevenSegmentDisplay4
;DemoARM.c,66 :: 		GPIOC_ODR.B0 = SEQUENCE_PLACES[place][0];
LSLS	R1, R4, #2
MOVW	R0, #lo_addr(_SEQUENCE_PLACES+0)
MOVT	R0, #hi_addr(_SEQUENCE_PLACES+0)
ADDS	R2, R0, R1
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,67 :: 		GPIOC_ODR.B1 = SEQUENCE_PLACES[place][1];
ADDS	R0, R2, #1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,68 :: 		GPIOC_ODR.B2 = SEQUENCE_PLACES[place][2];
ADDS	R0, R2, #2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,69 :: 		GPIOC_ODR.B3 = SEQUENCE_PLACES[place][3];
ADDS	R0, R2, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,71 :: 		gpiod_odr = decode(number);
UXTB	R0, R3
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,72 :: 		delay_ms(TIME_INTERVAL);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_demoSevenSegmentDisplay6:
SUBS	R7, R7, #1
BNE	L_demoSevenSegmentDisplay6
NOP
NOP
NOP
NOP
;DemoARM.c,64 :: 		for(place = 0; place <= 4; place++)
ADDS	R4, R4, #1
UXTB	R4, R4
;DemoARM.c,73 :: 		}
; place end address is: 16 (R4)
IT	AL
BAL	L_demoSevenSegmentDisplay3
L_demoSevenSegmentDisplay4:
;DemoARM.c,74 :: 		delay_ms(2*TIME_INTERVAL);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_demoSevenSegmentDisplay8:
SUBS	R7, R7, #1
BNE	L_demoSevenSegmentDisplay8
NOP
NOP
;DemoARM.c,62 :: 		for(number = 0; number < 10; number++)
ADDS	R3, R3, #1
UXTB	R3, R3
;DemoARM.c,75 :: 		}
; number end address is: 12 (R3)
IT	AL
BAL	L_demoSevenSegmentDisplay0
L_demoSevenSegmentDisplay1:
;DemoARM.c,76 :: 		}
L_end_demoSevenSegmentDisplay:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _demoSevenSegmentDisplay
_drawCustomCharacter:
;DemoARM.c,78 :: 		void drawCustomCharacter(char pos_row, char pos_char, unsigned char character[]) {
; character start address is: 8 (R2)
; pos_char start address is: 4 (R1)
; pos_row start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R3, R0
UXTB	R4, R1
MOV	R5, R2
; character end address is: 8 (R2)
; pos_char end address is: 4 (R1)
; pos_row end address is: 0 (R0)
; pos_row start address is: 12 (R3)
; pos_char start address is: 16 (R4)
; character start address is: 20 (R5)
;DemoARM.c,80 :: 		lcd_cmd(64);
MOVS	R0, #64
BL	_Lcd_Cmd+0
;DemoARM.c,81 :: 		for (i = 0; i<=7; i++) lcd_chr_cp(character[i]);
; i start address is: 32 (R8)
MOVW	R8, #0
; pos_row end address is: 12 (R3)
; pos_char end address is: 16 (R4)
; character end address is: 20 (R5)
; i end address is: 32 (R8)
STR	R5, [SP, #4]
UXTB	R6, R3
UXTB	R5, R4
LDR	R4, [SP, #4]
L_drawCustomCharacter10:
; i start address is: 32 (R8)
; character start address is: 16 (R4)
; character start address is: 16 (R4)
; character end address is: 16 (R4)
; pos_char start address is: 20 (R5)
; pos_row start address is: 24 (R6)
CMP	R8, #7
IT	HI
BHI	L_drawCustomCharacter11
; character end address is: 16 (R4)
; character start address is: 16 (R4)
ADD	R3, R4, R8, LSL #0
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
ADD	R8, R8, #1
UXTB	R8, R8
; character end address is: 16 (R4)
; i end address is: 32 (R8)
IT	AL
BAL	L_drawCustomCharacter10
L_drawCustomCharacter11:
;DemoARM.c,82 :: 		lcd_cmd(_LCD_RETURN_HOME);
MOVS	R0, #2
BL	_Lcd_Cmd+0
;DemoARM.c,83 :: 		lcd_chr(pos_row, pos_char, 0);
MOVS	R2, #0
UXTB	R1, R5
; pos_char end address is: 20 (R5)
UXTB	R0, R6
; pos_row end address is: 24 (R6)
BL	_Lcd_Chr+0
;DemoARM.c,84 :: 		}
L_end_drawCustomCharacter:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _drawCustomCharacter
_demoLiquidCrystalDisplay:
;DemoARM.c,86 :: 		void demoLiquidCrystalDisplay()
SUB	SP, SP, #64
STR	LR, [SP, #0]
;DemoARM.c,89 :: 		unsigned char txt [] = "reticulo endoplasmatico";
ADD	R11, SP, #4
ADD	R10, R11, #59
MOVW	R12, #lo_addr(?ICSdemoLiquidCrystalDisplay_txt_L0+0)
MOVT	R12, #hi_addr(?ICSdemoLiquidCrystalDisplay_txt_L0+0)
BL	___CC2DW+0
;DemoARM.c,90 :: 		unsigned char txt1[] = "Sistemas Embarcados";
;DemoARM.c,91 :: 		unsigned char txt2[] = "Antonio Branco";
;DemoARM.c,93 :: 		lcd_out(1, 3, txt1);
ADD	R0, SP, #28
MOV	R2, R0
MOVS	R1, #3
MOVS	R0, #1
BL	_Lcd_Out+0
;DemoARM.c,94 :: 		lcd_out(2, 1, txt2);
ADD	R0, SP, #48
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;DemoARM.c,95 :: 		delay_ms(5000);
MOVW	R7, #59049
MOVT	R7, #406
NOP
NOP
L_demoLiquidCrystalDisplay13:
SUBS	R7, R7, #1
BNE	L_demoLiquidCrystalDisplay13
NOP
NOP
;DemoARM.c,97 :: 		lcd_cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;DemoARM.c,99 :: 		for(line = 1; line <= 2; line++)
; line start address is: 24 (R6)
MOVS	R6, #1
; line end address is: 24 (R6)
L_demoLiquidCrystalDisplay15:
; line start address is: 24 (R6)
CMP	R6, #2
IT	HI
BHI	L_demoLiquidCrystalDisplay16
;DemoARM.c,101 :: 		for(column = 0; column <= sizeof(txt)/sizeof(char); column++)
; column start address is: 32 (R8)
MOVW	R8, #0
; column end address is: 32 (R8)
; line end address is: 24 (R6)
L_demoLiquidCrystalDisplay18:
; column start address is: 32 (R8)
; line start address is: 24 (R6)
CMP	R8, #24
IT	HI
BHI	L_demoLiquidCrystalDisplay19
;DemoARM.c,103 :: 		lcd_out(line, 1, txt);
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #1
UXTB	R0, R6
BL	_Lcd_Out+0
;DemoARM.c,104 :: 		lcd_cmd(_LCD_SHIFT_LEFT);
MOVS	R0, #24
BL	_Lcd_Cmd+0
;DemoARM.c,105 :: 		delay_ms(SCROLLTEXT_SPEED);
MOVW	R7, #31657
MOVT	R7, #28
NOP
NOP
L_demoLiquidCrystalDisplay21:
SUBS	R7, R7, #1
BNE	L_demoLiquidCrystalDisplay21
NOP
NOP
;DemoARM.c,101 :: 		for(column = 0; column <= sizeof(txt)/sizeof(char); column++)
ADD	R8, R8, #1
UXTB	R8, R8
;DemoARM.c,106 :: 		}
; column end address is: 32 (R8)
IT	AL
BAL	L_demoLiquidCrystalDisplay18
L_demoLiquidCrystalDisplay19:
;DemoARM.c,99 :: 		for(line = 1; line <= 2; line++)
ADDS	R6, R6, #1
UXTB	R6, R6
;DemoARM.c,107 :: 		}
; line end address is: 24 (R6)
IT	AL
BAL	L_demoLiquidCrystalDisplay15
L_demoLiquidCrystalDisplay16:
;DemoARM.c,109 :: 		lcd_cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;DemoARM.c,110 :: 		lcd_cmd(_LCD_RETURN_HOME);
MOVS	R0, #2
BL	_Lcd_Cmd+0
;DemoARM.c,111 :: 		lcd_cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;DemoARM.c,112 :: 		}
L_end_demoLiquidCrystalDisplay:
LDR	LR, [SP, #0]
ADD	SP, SP, #64
BX	LR
; end of _demoLiquidCrystalDisplay
_multiplex:
;DemoARM.c,114 :: 		void multiplex(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,115 :: 		GPIOC_ODR.B3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,116 :: 		GPIOC_ODR.B2 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,117 :: 		GPIOC_ODR.B1 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,118 :: 		GPIOC_ODR.B0 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,119 :: 		GPIOD_ODR = decode(unit);
MOVW	R0, #lo_addr(_unit+0)
MOVT	R0, #hi_addr(_unit+0)
LDRB	R0, [R0, #0]
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,120 :: 		delay_ms(TIME_INTERVAL);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_multiplex23:
SUBS	R7, R7, #1
BNE	L_multiplex23
NOP
NOP
NOP
NOP
;DemoARM.c,122 :: 		GPIOC_ODR.B3 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,123 :: 		GPIOC_ODR.B2 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,124 :: 		GPIOC_ODR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,125 :: 		GPIOC_ODR.B0 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,126 :: 		GPIOD_ODR = decode(ten);
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
LDRB	R0, [R0, #0]
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,127 :: 		delay_ms(TIME_INTERVAL);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_multiplex25:
SUBS	R7, R7, #1
BNE	L_multiplex25
NOP
NOP
NOP
NOP
;DemoARM.c,129 :: 		GPIOC_ODR.B3 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,130 :: 		GPIOC_ODR.B2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,131 :: 		GPIOC_ODR.B1 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,132 :: 		GPIOC_ODR.B0 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,133 :: 		GPIOD_ODR = decode(hundred);
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
LDRB	R0, [R0, #0]
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,134 :: 		delay_ms(TIME_INTERVAL);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_multiplex27:
SUBS	R7, R7, #1
BNE	L_multiplex27
NOP
NOP
NOP
NOP
;DemoARM.c,136 :: 		GPIOC_ODR.B3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,137 :: 		GPIOC_ODR.B2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,138 :: 		GPIOC_ODR.B1 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,139 :: 		GPIOC_ODR.B0 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,140 :: 		GPIOD_ODR = decode(thousand);
MOVW	R0, #lo_addr(_thousand+0)
MOVT	R0, #hi_addr(_thousand+0)
LDRB	R0, [R0, #0]
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,141 :: 		delay_ms(TIME_INTERVAL);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_multiplex29:
SUBS	R7, R7, #1
BNE	L_multiplex29
NOP
NOP
NOP
NOP
;DemoARM.c,142 :: 		}
L_end_multiplex:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _multiplex
_setup:
;DemoARM.c,144 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,150 :: 		_gpio_pinmask_6 |_gpio_pinmask_7);
MOVS	R1, #255
;DemoARM.c,147 :: 		gpio_digital_output(&GPIOD_ODR, //output data register (ODR)
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
;DemoARM.c,150 :: 		_gpio_pinmask_6 |_gpio_pinmask_7);
BL	_GPIO_Digital_Output+0
;DemoARM.c,155 :: 		_gpio_pinmask_4 /*led*/ );
MOVS	R1, #31
;DemoARM.c,153 :: 		gpio_digital_output(&GPIOC_ODR,
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
;DemoARM.c,155 :: 		_gpio_pinmask_4 /*led*/ );
BL	_GPIO_Digital_Output+0
;DemoARM.c,161 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_up); //configuracao dos bits como entrada com pull up ativo
MOVS	R2, #130
;DemoARM.c,160 :: 		_gpio_pinmask_2 | _gpio_pinmask_5,/*bits 3 e 4*/
MOVS	R1, #60
;DemoARM.c,158 :: 		gpio_config(&GPIOE_BASE,
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
;DemoARM.c,161 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_up); //configuracao dos bits como entrada com pull up ativo
BL	_GPIO_Config+0
;DemoARM.c,163 :: 		adc1_init();
BL	_ADC1_Init+0
;DemoARM.c,164 :: 		adc_set_input_channel(_adc_channel_1);
MOVW	R0, #2
BL	_ADC_Set_Input_Channel+0
;DemoARM.c,166 :: 		adc2_init();
BL	_ADC2_Init+0
;DemoARM.c,167 :: 		adc_set_input_channel(_adc_channel_2);
MOVW	R0, #4
BL	_ADC_Set_Input_Channel+0
;DemoARM.c,170 :: 		lcd_init();
BL	_Lcd_Init+0
;DemoARM.c,171 :: 		lcd_cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;DemoARM.c,172 :: 		lcd_cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;DemoARM.c,178 :: 		_gpio_pinmask_6 |_gpio_pinmask_7);
MOVS	R1, #255
;DemoARM.c,175 :: 		gpio_digital_output(&GPIOD_ODR, //output data register (ODR)
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
;DemoARM.c,178 :: 		_gpio_pinmask_6 |_gpio_pinmask_7);
BL	_GPIO_Digital_Output+0
;DemoARM.c,179 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_readADC1:
;DemoARM.c,181 :: 		void readADC1()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,183 :: 		lcd_out(1,1,"V1=");
MOVW	R0, #lo_addr(?lstr1_DemoARM+0)
MOVT	R0, #hi_addr(?lstr1_DemoARM+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;DemoARM.c,184 :: 		value = adc1_read(1);
MOVS	R0, #1
BL	_ADC1_Read+0
MOVW	R1, #lo_addr(_value+0)
MOVT	R1, #hi_addr(_value+0)
STRH	R0, [R1, #0]
;DemoARM.c,185 :: 		sum = sum + value;
SXTH	R3, R0
MOVW	R2, #lo_addr(_sum+0)
MOVT	R2, #hi_addr(_sum+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, R3
STR	R1, [R2, #0]
;DemoARM.c,186 :: 		inttostr(value,txt);
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;DemoARM.c,187 :: 		lcd_out_cp(ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
BL	_Lcd_Out_CP+0
;DemoARM.c,188 :: 		readingCountAdc1 ++;
MOVW	R1, #lo_addr(_readingCountAdc1+0)
MOVT	R1, #hi_addr(_readingCountAdc1+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;DemoARM.c,189 :: 		if(readingCountAdc1 >= 50){
CMP	R0, #50
IT	CC
BCC	L_readADC131
;DemoARM.c,190 :: 		avg = sum / readingCountAdc1;
MOVW	R3, #lo_addr(_readingCountAdc1+0)
MOVT	R3, #hi_addr(_readingCountAdc1+0)
LDRB	R1, [R3, #0]
MOVW	R2, #lo_addr(_sum+0)
MOVT	R2, #hi_addr(_sum+0)
LDR	R0, [R2, #0]
SDIV	R1, R0, R1
MOVW	R0, #lo_addr(_avg+0)
MOVT	R0, #hi_addr(_avg+0)
STRH	R1, [R0, #0]
;DemoARM.c,191 :: 		sum = 0;
MOVS	R0, #0
STR	R0, [R2, #0]
;DemoARM.c,192 :: 		readingCountAdc1 = 0;
MOVS	R0, #0
STRB	R0, [R3, #0]
;DemoARM.c,193 :: 		lcd_out(2,1,"M1=");
MOVW	R0, #lo_addr(?lstr2_DemoARM+0)
MOVT	R0, #hi_addr(?lstr2_DemoARM+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;DemoARM.c,194 :: 		inttostr(avg,txt_1);
MOVW	R0, #lo_addr(_avg+0)
MOVT	R0, #hi_addr(_avg+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt_1+0)
MOVT	R1, #hi_addr(_txt_1+0)
BL	_IntToStr+0
;DemoARM.c,195 :: 		lcd_out_cp(ltrim(txt_1));
MOVW	R0, #lo_addr(_txt_1+0)
MOVT	R0, #hi_addr(_txt_1+0)
BL	_Ltrim+0
BL	_Lcd_Out_CP+0
;DemoARM.c,196 :: 		}
L_readADC131:
;DemoARM.c,197 :: 		}
L_end_readADC1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _readADC1
_readADC2:
;DemoARM.c,198 :: 		void readADC2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,200 :: 		lcd_out(1,10,"V2=");
MOVW	R0, #lo_addr(?lstr3_DemoARM+0)
MOVT	R0, #hi_addr(?lstr3_DemoARM+0)
MOV	R2, R0
MOVS	R1, #10
MOVS	R0, #1
BL	_Lcd_Out+0
;DemoARM.c,201 :: 		value = adc2_read(2);
MOVS	R0, #2
BL	_ADC2_Read+0
MOVW	R1, #lo_addr(_value+0)
MOVT	R1, #hi_addr(_value+0)
STRH	R0, [R1, #0]
;DemoARM.c,202 :: 		sum = sum + value;
SXTH	R3, R0
MOVW	R2, #lo_addr(_sum+0)
MOVT	R2, #hi_addr(_sum+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, R3
STR	R1, [R2, #0]
;DemoARM.c,203 :: 		inttostr(value,txt);
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;DemoARM.c,204 :: 		lcd_out_cp(ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
BL	_Lcd_Out_CP+0
;DemoARM.c,205 :: 		readingCountAdc2 ++;
MOVW	R1, #lo_addr(_readingCountAdc2+0)
MOVT	R1, #hi_addr(_readingCountAdc2+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;DemoARM.c,206 :: 		if(readingCountAdc2 >= 50){
CMP	R0, #50
IT	CC
BCC	L_readADC232
;DemoARM.c,207 :: 		avg = sum / readingCountAdc2;
MOVW	R3, #lo_addr(_readingCountAdc2+0)
MOVT	R3, #hi_addr(_readingCountAdc2+0)
LDRB	R1, [R3, #0]
MOVW	R2, #lo_addr(_sum+0)
MOVT	R2, #hi_addr(_sum+0)
LDR	R0, [R2, #0]
SDIV	R1, R0, R1
MOVW	R0, #lo_addr(_avg+0)
MOVT	R0, #hi_addr(_avg+0)
STRH	R1, [R0, #0]
;DemoARM.c,208 :: 		sum = 0;
MOVS	R0, #0
STR	R0, [R2, #0]
;DemoARM.c,209 :: 		readingCountAdc2 = 0;
MOVS	R0, #0
STRB	R0, [R3, #0]
;DemoARM.c,210 :: 		lcd_out(2,10,"M2=");
MOVW	R0, #lo_addr(?lstr4_DemoARM+0)
MOVT	R0, #hi_addr(?lstr4_DemoARM+0)
MOV	R2, R0
MOVS	R1, #10
MOVS	R0, #2
BL	_Lcd_Out+0
;DemoARM.c,211 :: 		inttostr(avg,txt_1);
MOVW	R0, #lo_addr(_avg+0)
MOVT	R0, #hi_addr(_avg+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt_1+0)
MOVT	R1, #hi_addr(_txt_1+0)
BL	_IntToStr+0
;DemoARM.c,212 :: 		lcd_out_cp(ltrim(txt_1));
MOVW	R0, #lo_addr(_txt_1+0)
MOVT	R0, #hi_addr(_txt_1+0)
BL	_Ltrim+0
BL	_Lcd_Out_CP+0
;DemoARM.c,213 :: 		}
L_readADC232:
;DemoARM.c,214 :: 		}
L_end_readADC2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _readADC2
_counterSystem:
;DemoARM.c,216 :: 		void counterSystem()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,219 :: 		if(GPIOE_IDR.B3 == LOW)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem33
;DemoARM.c,221 :: 		while(GPIOE_IDR.B3 == LOW)multiplex();
L_counterSystem34:
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem35
BL	_multiplex+0
IT	AL
BAL	L_counterSystem34
L_counterSystem35:
;DemoARM.c,222 :: 		unit ++;
MOVW	R1, #lo_addr(_unit+0)
MOVT	R1, #hi_addr(_unit+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;DemoARM.c,223 :: 		if(unit == 10)
CMP	R0, #10
IT	NE
BNE	L_counterSystem36
;DemoARM.c,225 :: 		unit = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_unit+0)
MOVT	R0, #hi_addr(_unit+0)
STRB	R1, [R0, #0]
;DemoARM.c,226 :: 		ten ++;
MOVW	R1, #lo_addr(_ten+0)
MOVT	R1, #hi_addr(_ten+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,227 :: 		}
L_counterSystem36:
;DemoARM.c,228 :: 		if(ten == 10)
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_counterSystem37
;DemoARM.c,230 :: 		ten = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
STRB	R1, [R0, #0]
;DemoARM.c,231 :: 		hundred ++;
MOVW	R1, #lo_addr(_hundred+0)
MOVT	R1, #hi_addr(_hundred+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,232 :: 		}
L_counterSystem37:
;DemoARM.c,233 :: 		if(hundred == 10)
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_counterSystem38
;DemoARM.c,235 :: 		hundred = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
STRB	R1, [R0, #0]
;DemoARM.c,236 :: 		thousand ++;
MOVW	R1, #lo_addr(_thousand+0)
MOVT	R1, #hi_addr(_thousand+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,237 :: 		}
L_counterSystem38:
;DemoARM.c,238 :: 		if(thousand == 10)
MOVW	R0, #lo_addr(_thousand+0)
MOVT	R0, #hi_addr(_thousand+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_counterSystem39
;DemoARM.c,240 :: 		unit = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_unit+0)
MOVT	R0, #hi_addr(_unit+0)
STRB	R1, [R0, #0]
;DemoARM.c,241 :: 		ten = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
STRB	R1, [R0, #0]
;DemoARM.c,242 :: 		hundred = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
STRB	R1, [R0, #0]
;DemoARM.c,243 :: 		thousand = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_thousand+0)
MOVT	R0, #hi_addr(_thousand+0)
STRB	R1, [R0, #0]
;DemoARM.c,244 :: 		}
L_counterSystem39:
;DemoARM.c,245 :: 		}
L_counterSystem33:
;DemoARM.c,248 :: 		if(GPIOE_IDR.B4 == LOW)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem40
;DemoARM.c,250 :: 		multiplex();
BL	_multiplex+0
;DemoARM.c,251 :: 		if(GPIOE_IDR.B4 == LOW)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem41
;DemoARM.c,253 :: 		unit --;
MOVW	R1, #lo_addr(_unit+0)
MOVT	R1, #hi_addr(_unit+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;DemoARM.c,254 :: 		if(unit == -1)
CMP	R0, #-1
IT	NE
BNE	L_counterSystem42
;DemoARM.c,256 :: 		unit = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_unit+0)
MOVT	R0, #hi_addr(_unit+0)
STRB	R1, [R0, #0]
;DemoARM.c,257 :: 		ten --;
MOVW	R1, #lo_addr(_ten+0)
MOVT	R1, #hi_addr(_ten+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,258 :: 		}
L_counterSystem42:
;DemoARM.c,259 :: 		if(ten == -1)
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
LDRB	R0, [R0, #0]
CMP	R0, #-1
IT	NE
BNE	L_counterSystem43
;DemoARM.c,261 :: 		ten = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
STRB	R1, [R0, #0]
;DemoARM.c,262 :: 		hundred --;
MOVW	R1, #lo_addr(_hundred+0)
MOVT	R1, #hi_addr(_hundred+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,263 :: 		}
L_counterSystem43:
;DemoARM.c,264 :: 		if(hundred == -1)
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
LDRB	R0, [R0, #0]
CMP	R0, #-1
IT	NE
BNE	L_counterSystem44
;DemoARM.c,266 :: 		hundred = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
STRB	R1, [R0, #0]
;DemoARM.c,267 :: 		thousand --;
MOVW	R1, #lo_addr(_thousand+0)
MOVT	R1, #hi_addr(_thousand+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,268 :: 		}
L_counterSystem44:
;DemoARM.c,269 :: 		if(thousand == -1) thousand = 0;
MOVW	R0, #lo_addr(_thousand+0)
MOVT	R0, #hi_addr(_thousand+0)
LDRB	R0, [R0, #0]
CMP	R0, #-1
IT	NE
BNE	L_counterSystem45
MOVS	R1, #0
MOVW	R0, #lo_addr(_thousand+0)
MOVT	R0, #hi_addr(_thousand+0)
STRB	R1, [R0, #0]
L_counterSystem45:
;DemoARM.c,270 :: 		}
L_counterSystem41:
;DemoARM.c,271 :: 		}
L_counterSystem40:
;DemoARM.c,272 :: 		}
L_end_counterSystem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _counterSystem
_changeLEDBright:
;DemoARM.c,275 :: 		void changeLEDBright()
;DemoARM.c,278 :: 		}
L_end_changeLEDBright:
BX	LR
; end of _changeLEDBright
_loop:
;DemoARM.c,280 :: 		void loop()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,283 :: 		multiplex();
BL	_multiplex+0
;DemoARM.c,284 :: 		counterSystem();
BL	_counterSystem+0
;DemoARM.c,287 :: 		readADC1();
BL	_readADC1+0
;DemoARM.c,288 :: 		delay_ms(1);
MOVW	R7, #5331
MOVT	R7, #0
NOP
NOP
L_loop46:
SUBS	R7, R7, #1
BNE	L_loop46
NOP
NOP
NOP
NOP
;DemoARM.c,289 :: 		readADC2();
BL	_readADC2+0
;DemoARM.c,290 :: 		delay_ms(1);
MOVW	R7, #5331
MOVT	R7, #0
NOP
NOP
L_loop48:
SUBS	R7, R7, #1
BNE	L_loop48
NOP
NOP
NOP
NOP
;DemoARM.c,293 :: 		changeLEDBright();
BL	_changeLEDBright+0
;DemoARM.c,294 :: 		}
L_end_loop:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _loop
_main:
;DemoARM.c,296 :: 		void main()
;DemoARM.c,298 :: 		setup();
BL	_setup+0
;DemoARM.c,303 :: 		while(1) loop();
L_main50:
BL	_loop+0
IT	AL
BAL	L_main50
;DemoARM.c,304 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_decode:
;DemoARM.c,307 :: 		unsigned char decode(unsigned char number)
; number start address is: 0 (R0)
; number end address is: 0 (R0)
; number start address is: 0 (R0)
;DemoARM.c,309 :: 		switch(number)
IT	AL
BAL	L_decode52
; number end address is: 0 (R0)
;DemoARM.c,311 :: 		case 0: return 63;
L_decode54:
MOVS	R0, #63
IT	AL
BAL	L_end_decode
;DemoARM.c,312 :: 		case 1: return 6;
L_decode55:
MOVS	R0, #6
IT	AL
BAL	L_end_decode
;DemoARM.c,313 :: 		case 2: return 91;
L_decode56:
MOVS	R0, #91
IT	AL
BAL	L_end_decode
;DemoARM.c,314 :: 		case 3: return 79;
L_decode57:
MOVS	R0, #79
IT	AL
BAL	L_end_decode
;DemoARM.c,315 :: 		case 4: return 102;
L_decode58:
MOVS	R0, #102
IT	AL
BAL	L_end_decode
;DemoARM.c,316 :: 		case 5: return 109;
L_decode59:
MOVS	R0, #109
IT	AL
BAL	L_end_decode
;DemoARM.c,317 :: 		case 6: return 125;
L_decode60:
MOVS	R0, #125
IT	AL
BAL	L_end_decode
;DemoARM.c,318 :: 		case 7: return 7;
L_decode61:
MOVS	R0, #7
IT	AL
BAL	L_end_decode
;DemoARM.c,319 :: 		case 8: return 127;
L_decode62:
MOVS	R0, #127
IT	AL
BAL	L_end_decode
;DemoARM.c,320 :: 		case 9: return 111;
L_decode63:
MOVS	R0, #111
IT	AL
BAL	L_end_decode
;DemoARM.c,321 :: 		}
L_decode52:
; number start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_decode54
CMP	R0, #1
IT	EQ
BEQ	L_decode55
CMP	R0, #2
IT	EQ
BEQ	L_decode56
CMP	R0, #3
IT	EQ
BEQ	L_decode57
CMP	R0, #4
IT	EQ
BEQ	L_decode58
CMP	R0, #5
IT	EQ
BEQ	L_decode59
CMP	R0, #6
IT	EQ
BEQ	L_decode60
CMP	R0, #7
IT	EQ
BEQ	L_decode61
CMP	R0, #8
IT	EQ
BEQ	L_decode62
CMP	R0, #9
IT	EQ
BEQ	L_decode63
; number end address is: 0 (R0)
;DemoARM.c,322 :: 		return 0;
MOVS	R0, #0
;DemoARM.c,323 :: 		}
L_end_decode:
BX	LR
; end of _decode
