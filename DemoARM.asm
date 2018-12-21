_demoSevenSegmentDisplay:
;DemoARM.c,65 :: 		void demoSevenSegmentDisplay()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,68 :: 		for(number = 0; number < 10; number++)
; number start address is: 12 (R3)
MOVS	R3, #0
; number end address is: 12 (R3)
L_demoSevenSegmentDisplay0:
; number start address is: 12 (R3)
CMP	R3, #10
IT	CS
BCS	L_demoSevenSegmentDisplay1
;DemoARM.c,70 :: 		for(place = 0; place <= 4; place++)
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
;DemoARM.c,72 :: 		GPIOC_ODR.B0 = SEQUENCE_PLACES[place][0];
LSLS	R1, R4, #2
MOVW	R0, #lo_addr(_SEQUENCE_PLACES+0)
MOVT	R0, #hi_addr(_SEQUENCE_PLACES+0)
ADDS	R2, R0, R1
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,73 :: 		GPIOC_ODR.B1 = SEQUENCE_PLACES[place][1];
ADDS	R0, R2, #1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,74 :: 		GPIOC_ODR.B2 = SEQUENCE_PLACES[place][2];
ADDS	R0, R2, #2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,75 :: 		GPIOC_ODR.B3 = SEQUENCE_PLACES[place][3];
ADDS	R0, R2, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,77 :: 		gpiod_odr = decode(number);
UXTB	R0, R3
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,78 :: 		delay_ms(TIME_INTERVAL);
MOVW	R7, #46899
MOVT	R7, #12
NOP
NOP
L_demoSevenSegmentDisplay6:
SUBS	R7, R7, #1
BNE	L_demoSevenSegmentDisplay6
NOP
NOP
NOP
NOP
;DemoARM.c,70 :: 		for(place = 0; place <= 4; place++)
ADDS	R4, R4, #1
UXTB	R4, R4
;DemoARM.c,79 :: 		}
; place end address is: 16 (R4)
IT	AL
BAL	L_demoSevenSegmentDisplay3
L_demoSevenSegmentDisplay4:
;DemoARM.c,80 :: 		delay_ms(TIME_INTERVAL);
MOVW	R7, #46899
MOVT	R7, #12
NOP
NOP
L_demoSevenSegmentDisplay8:
SUBS	R7, R7, #1
BNE	L_demoSevenSegmentDisplay8
NOP
NOP
NOP
NOP
;DemoARM.c,68 :: 		for(number = 0; number < 10; number++)
ADDS	R3, R3, #1
UXTB	R3, R3
;DemoARM.c,81 :: 		}
; number end address is: 12 (R3)
IT	AL
BAL	L_demoSevenSegmentDisplay0
L_demoSevenSegmentDisplay1:
;DemoARM.c,82 :: 		}
L_end_demoSevenSegmentDisplay:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _demoSevenSegmentDisplay
_drawCustomCharacter:
;DemoARM.c,84 :: 		void drawCustomCharacter(char pos_row, char pos_char, unsigned char character[]) {
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
;DemoARM.c,86 :: 		lcd_cmd(64);
MOVS	R0, #64
BL	_Lcd_Cmd+0
;DemoARM.c,87 :: 		for (i = 0; i<=7; i++) lcd_chr_cp(character[i]);
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
;DemoARM.c,88 :: 		lcd_cmd(_LCD_RETURN_HOME);
MOVS	R0, #2
BL	_Lcd_Cmd+0
;DemoARM.c,89 :: 		lcd_chr(pos_row, pos_char, 0);
MOVS	R2, #0
UXTB	R1, R5
; pos_char end address is: 20 (R5)
UXTB	R0, R6
; pos_row end address is: 24 (R6)
BL	_Lcd_Chr+0
;DemoARM.c,90 :: 		}
L_end_drawCustomCharacter:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _drawCustomCharacter
_demoLiquidCrystalDisplay:
;DemoARM.c,92 :: 		void demoLiquidCrystalDisplay()
SUB	SP, SP, #64
STR	LR, [SP, #0]
;DemoARM.c,95 :: 		unsigned char txt [] = "reticulo endoplasmatico";
ADD	R11, SP, #4
ADD	R10, R11, #59
MOVW	R12, #lo_addr(?ICSdemoLiquidCrystalDisplay_txt_L0+0)
MOVT	R12, #hi_addr(?ICSdemoLiquidCrystalDisplay_txt_L0+0)
BL	___CC2DW+0
;DemoARM.c,96 :: 		unsigned char txt1[] = "Sistemas Embarcados";
;DemoARM.c,97 :: 		unsigned char txt2[] = "Antonio Branco";
;DemoARM.c,99 :: 		lcd_out(1, 3, txt1);
ADD	R0, SP, #28
MOV	R2, R0
MOVS	R1, #3
MOVS	R0, #1
BL	_Lcd_Out+0
;DemoARM.c,100 :: 		lcd_out(2, 1, txt2);
ADD	R0, SP, #48
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;DemoARM.c,101 :: 		delay_ms(5000);
MOVW	R7, #51305
MOVT	R7, #635
NOP
NOP
L_demoLiquidCrystalDisplay13:
SUBS	R7, R7, #1
BNE	L_demoLiquidCrystalDisplay13
NOP
NOP
;DemoARM.c,103 :: 		lcd_cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;DemoARM.c,105 :: 		for(line = 1; line <= 2; line++)
; line start address is: 24 (R6)
MOVS	R6, #1
; line end address is: 24 (R6)
L_demoLiquidCrystalDisplay15:
; line start address is: 24 (R6)
CMP	R6, #2
IT	HI
BHI	L_demoLiquidCrystalDisplay16
;DemoARM.c,107 :: 		for(column = 0; column <= sizeof(txt)/sizeof(char); column++)
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
;DemoARM.c,109 :: 		lcd_out(line, 1, txt);
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #1
UXTB	R0, R6
BL	_Lcd_Out+0
;DemoARM.c,110 :: 		lcd_cmd(_LCD_SHIFT_LEFT);
MOVS	R0, #24
BL	_Lcd_Cmd+0
;DemoARM.c,111 :: 		delay_ms(SCROLLTEXT_SPEED);
MOVW	R7, #33081
MOVT	R7, #44
NOP
NOP
L_demoLiquidCrystalDisplay21:
SUBS	R7, R7, #1
BNE	L_demoLiquidCrystalDisplay21
NOP
NOP
;DemoARM.c,107 :: 		for(column = 0; column <= sizeof(txt)/sizeof(char); column++)
ADD	R8, R8, #1
UXTB	R8, R8
;DemoARM.c,112 :: 		}
; column end address is: 32 (R8)
IT	AL
BAL	L_demoLiquidCrystalDisplay18
L_demoLiquidCrystalDisplay19:
;DemoARM.c,105 :: 		for(line = 1; line <= 2; line++)
ADDS	R6, R6, #1
UXTB	R6, R6
;DemoARM.c,113 :: 		}
; line end address is: 24 (R6)
IT	AL
BAL	L_demoLiquidCrystalDisplay15
L_demoLiquidCrystalDisplay16:
;DemoARM.c,115 :: 		lcd_cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;DemoARM.c,116 :: 		lcd_cmd(_LCD_RETURN_HOME);
MOVS	R0, #2
BL	_Lcd_Cmd+0
;DemoARM.c,117 :: 		lcd_cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;DemoARM.c,118 :: 		}
L_end_demoLiquidCrystalDisplay:
LDR	LR, [SP, #0]
ADD	SP, SP, #64
BX	LR
; end of _demoLiquidCrystalDisplay
_multiplex:
;DemoARM.c,120 :: 		void multiplex()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,122 :: 		GPIOC_ODR.B3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,123 :: 		GPIOC_ODR.B2 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,124 :: 		GPIOC_ODR.B1 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,125 :: 		GPIOC_ODR.B0 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,126 :: 		GPIOD_ODR = decode(unit);
MOVW	R0, #lo_addr(_unit+0)
MOVT	R0, #hi_addr(_unit+0)
LDRB	R0, [R0, #0]
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,127 :: 		delay_ms(1);
MOVW	R7, #8331
MOVT	R7, #0
NOP
NOP
L_multiplex23:
SUBS	R7, R7, #1
BNE	L_multiplex23
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
;DemoARM.c,130 :: 		GPIOC_ODR.B2 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,131 :: 		GPIOC_ODR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,132 :: 		GPIOC_ODR.B0 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,133 :: 		GPIOD_ODR = decode(ten);
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
LDRB	R0, [R0, #0]
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,134 :: 		delay_ms(1);
MOVW	R7, #8331
MOVT	R7, #0
NOP
NOP
L_multiplex25:
SUBS	R7, R7, #1
BNE	L_multiplex25
NOP
NOP
NOP
NOP
;DemoARM.c,136 :: 		GPIOC_ODR.B3 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,137 :: 		GPIOC_ODR.B2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,138 :: 		GPIOC_ODR.B1 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,139 :: 		GPIOC_ODR.B0 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R2, [R0, #0]
;DemoARM.c,140 :: 		GPIOD_ODR = decode(hundred);
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
LDRB	R0, [R0, #0]
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,141 :: 		delay_ms(1);
MOVW	R7, #8331
MOVT	R7, #0
NOP
NOP
L_multiplex27:
SUBS	R7, R7, #1
BNE	L_multiplex27
NOP
NOP
NOP
NOP
;DemoARM.c,143 :: 		GPIOC_ODR.B3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,144 :: 		GPIOC_ODR.B2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,145 :: 		GPIOC_ODR.B1 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,146 :: 		GPIOC_ODR.B0 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;DemoARM.c,147 :: 		GPIOD_ODR = decode(6);
MOVS	R0, #6
BL	_decode+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;DemoARM.c,148 :: 		delay_ms(1);
MOVW	R7, #8331
MOVT	R7, #0
NOP
NOP
L_multiplex29:
SUBS	R7, R7, #1
BNE	L_multiplex29
NOP
NOP
NOP
NOP
;DemoARM.c,149 :: 		}
L_end_multiplex:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _multiplex
_setup:
;DemoARM.c,151 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,157 :: 		_gpio_pinmask_6 |_gpio_pinmask_7);
MOVS	R1, #255
;DemoARM.c,154 :: 		gpio_digital_output(&GPIOD_ODR,
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
;DemoARM.c,157 :: 		_gpio_pinmask_6 |_gpio_pinmask_7);
BL	_GPIO_Digital_Output+0
;DemoARM.c,162 :: 		_gpio_pinmask_7 |_gpio_pinmask_8 |_gpio_pinmask_9);
MOVW	R1, #1000
;DemoARM.c,160 :: 		gpio_digital_output(&GPIOB_ODR,
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
;DemoARM.c,162 :: 		_gpio_pinmask_7 |_gpio_pinmask_8 |_gpio_pinmask_9);
BL	_GPIO_Digital_Output+0
;DemoARM.c,167 :: 		_gpio_pinmask_3 |_gpio_pinmask_4);
MOVS	R1, #31
;DemoARM.c,165 :: 		gpio_digital_output(&GPIOC_ODR,
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
;DemoARM.c,167 :: 		_gpio_pinmask_3 |_gpio_pinmask_4);
BL	_GPIO_Digital_Output+0
;DemoARM.c,173 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_up);
MOVS	R2, #130
;DemoARM.c,172 :: 		_gpio_pinmask_2 | _gpio_pinmask_5,
MOVS	R1, #60
;DemoARM.c,170 :: 		gpio_config(&GPIOE_BASE,
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
;DemoARM.c,173 :: 		_gpio_cfg_mode_input | _gpio_cfg_pull_up);
BL	_GPIO_Config+0
;DemoARM.c,176 :: 		adc1_init();
BL	_ADC1_Init+0
;DemoARM.c,177 :: 		adc_set_input_channel(_adc_channel_1);
MOVW	R0, #2
BL	_ADC_Set_Input_Channel+0
;DemoARM.c,180 :: 		adc1_init();
BL	_ADC1_Init+0
;DemoARM.c,181 :: 		adc_set_input_channel(_adc_channel_2);
MOVW	R0, #4
BL	_ADC_Set_Input_Channel+0
;DemoARM.c,184 :: 		lcd_init();
BL	_Lcd_Init+0
;DemoARM.c,185 :: 		lcd_cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;DemoARM.c,186 :: 		lcd_cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;DemoARM.c,189 :: 		valor  = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_valor+0)
MOVT	R0, #hi_addr(_valor+0)
STRH	R1, [R0, #0]
;DemoARM.c,190 :: 		sentido = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_sentido+0)
MOVT	R0, #hi_addr(_sentido+0)
STRB	R1, [R0, #0]
;DemoARM.c,191 :: 		PWM_TIM1_Init(40000);//frequencia do pwm
MOVW	R0, #40000
BL	_PWM_TIM1_Init+0
;DemoARM.c,192 :: 		PWM_TIM1_Set_Duty(valor, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R0, #lo_addr(_valor+0)
MOVT	R0, #hi_addr(_valor+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;DemoARM.c,194 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;DemoARM.c,195 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_pwm:
;DemoARM.c,197 :: 		void pwm(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,198 :: 		delay_ms(10);
MOVW	R7, #17795
MOVT	R7, #1
NOP
NOP
L_pwm31:
SUBS	R7, R7, #1
BNE	L_pwm31
NOP
NOP
NOP
NOP
;DemoARM.c,199 :: 		PWM_TIM1_Set_Duty(valor,  _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R0, #lo_addr(_valor+0)
MOVT	R0, #hi_addr(_valor+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;DemoARM.c,200 :: 		}
L_end_pwm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _pwm
_readADC1:
;DemoARM.c,202 :: 		void readADC1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;DemoARM.c,204 :: 		lcd_out(1,1,"P=");
MOVW	R0, #lo_addr(?lstr1_DemoARM+0)
MOVT	R0, #hi_addr(?lstr1_DemoARM+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;DemoARM.c,205 :: 		value = adc1_read(1);
MOVS	R0, #1
BL	_ADC1_Read+0
MOVW	R1, #lo_addr(_value+0)
MOVT	R1, #hi_addr(_value+0)
STR	R1, [SP, #4]
STRH	R0, [R1, #0]
;DemoARM.c,206 :: 		sum = sum + adc1_read(1);
MOVS	R0, #1
BL	_ADC1_Read+0
MOVW	R2, #lo_addr(_sum+0)
MOVT	R2, #hi_addr(_sum+0)
LDR	R1, [R2, #0]
ADDS	R0, R1, R0
STR	R0, [R2, #0]
;DemoARM.c,207 :: 		inttostr(value,txt);
LDR	R0, [SP, #4]
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;DemoARM.c,208 :: 		lcd_out_cp(ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
BL	_Lcd_Out_CP+0
;DemoARM.c,209 :: 		readingCountAdc1 ++;
MOVW	R1, #lo_addr(_readingCountAdc1+0)
MOVT	R1, #hi_addr(_readingCountAdc1+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;DemoARM.c,210 :: 		if(readingCountAdc1 >= 50){
CMP	R0, #50
IT	CC
BCC	L_readADC133
;DemoARM.c,211 :: 		avg = sum / readingCountAdc1;
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
;DemoARM.c,212 :: 		sum = 0;
MOVS	R0, #0
STR	R0, [R2, #0]
;DemoARM.c,213 :: 		readingCountAdc1 = 0;
MOVS	R0, #0
STRB	R0, [R3, #0]
;DemoARM.c,214 :: 		lcd_out(2,1,"mP=");
MOVW	R0, #lo_addr(?lstr2_DemoARM+0)
MOVT	R0, #hi_addr(?lstr2_DemoARM+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;DemoARM.c,215 :: 		inttostr(avg,txt_1);
MOVW	R0, #lo_addr(_avg+0)
MOVT	R0, #hi_addr(_avg+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt_1+0)
MOVT	R1, #hi_addr(_txt_1+0)
BL	_IntToStr+0
;DemoARM.c,216 :: 		lcd_out_cp(ltrim(txt_1));
MOVW	R0, #lo_addr(_txt_1+0)
MOVT	R0, #hi_addr(_txt_1+0)
BL	_Ltrim+0
BL	_Lcd_Out_CP+0
;DemoARM.c,217 :: 		}
L_readADC133:
;DemoARM.c,218 :: 		}
L_end_readADC1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _readADC1
_readADC2:
;DemoARM.c,219 :: 		void readADC2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,221 :: 		value = adc1_read(2);
MOVS	R0, #2
BL	_ADC1_Read+0
MOVW	R1, #lo_addr(_value+0)
MOVT	R1, #hi_addr(_value+0)
STRH	R0, [R1, #0]
;DemoARM.c,222 :: 		avg = avg + value;
SXTH	R2, R0
MOVW	R1, #lo_addr(_avg+0)
MOVT	R1, #hi_addr(_avg+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;DemoARM.c,223 :: 		readingCountAdc2 ++;
MOVW	R1, #lo_addr(_readingCountAdc2+0)
MOVT	R1, #hi_addr(_readingCountAdc2+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;DemoARM.c,224 :: 		if (readingCountAdc2 == 15)
CMP	R0, #15
IT	NE
BNE	L_readADC234
;DemoARM.c,226 :: 		sum = avg / readingCountAdc2;
MOVW	R3, #lo_addr(_readingCountAdc2+0)
MOVT	R3, #hi_addr(_readingCountAdc2+0)
LDRB	R2, [R3, #0]
MOVW	R1, #lo_addr(_avg+0)
MOVT	R1, #hi_addr(_avg+0)
LDRSH	R0, [R1, #0]
SDIV	R0, R0, R2
SXTH	R0, R0
MOVW	R2, #lo_addr(_sum+0)
MOVT	R2, #hi_addr(_sum+0)
STR	R0, [R2, #0]
;DemoARM.c,227 :: 		readingCountAdc2 = 0;
MOVS	R0, #0
STRB	R0, [R3, #0]
;DemoARM.c,228 :: 		avg = 0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [R1, #0]
;DemoARM.c,229 :: 		sum = sum - (sum * 100 /515); //ajusta volt ;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVS	R0, #100
MULS	R1, R0, R1
MOVW	R0, #515
SDIV	R1, R1, R0
MOV	R0, R2
LDR	R0, [R0, #0]
SUB	R0, R0, R1
STR	R0, [R2, #0]
;DemoARM.c,230 :: 		sum = ((value * 3.3 / 4096) /0.01) - 3;
MOVW	R0, #lo_addr(_value+0)
MOVT	R0, #hi_addr(_value+0)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #13107
MOVT	R0, #16467
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOV	R0, #1166016512
VMOV	S0, R0
VDIV.F32	S1, S1, S0
MOVW	R0, #55050
MOVT	R0, #15395
VMOV	S0, R0
VDIV.F32	S1, S1, S0
VMOV.F32	S0, #3
VSUB.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
STR	R0, [R2, #0]
;DemoARM.c,231 :: 		inttostr (sum, txt_1);
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt_1+0)
MOVT	R1, #hi_addr(_txt_1+0)
BL	_IntToStr+0
;DemoARM.c,232 :: 		if(sum < 10)
MOVW	R0, #lo_addr(_sum+0)
MOVT	R0, #hi_addr(_sum+0)
LDR	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L_readADC235
;DemoARM.c,234 :: 		lcd_out(2,13," ");
MOVW	R0, #lo_addr(?lstr3_DemoARM+0)
MOVT	R0, #hi_addr(?lstr3_DemoARM+0)
MOV	R2, R0
MOVS	R1, #13
MOVS	R0, #2
BL	_Lcd_Out+0
;DemoARM.c,235 :: 		lcd_out(2,14,ltrim(txt_1));
MOVW	R0, #lo_addr(_txt_1+0)
MOVT	R0, #hi_addr(_txt_1+0)
BL	_Ltrim+0
MOV	R2, R0
MOVS	R1, #14
MOVS	R0, #2
BL	_Lcd_Out+0
;DemoARM.c,236 :: 		}
IT	AL
BAL	L_readADC236
L_readADC235:
;DemoARM.c,239 :: 		lcd_out(2,13,ltrim(txt_1));
MOVW	R0, #lo_addr(_txt_1+0)
MOVT	R0, #hi_addr(_txt_1+0)
BL	_Ltrim+0
MOV	R2, R0
MOVS	R1, #13
MOVS	R0, #2
BL	_Lcd_Out+0
;DemoARM.c,240 :: 		}
L_readADC236:
;DemoARM.c,241 :: 		}
L_readADC234:
;DemoARM.c,242 :: 		}
L_end_readADC2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _readADC2
_counterSystem:
;DemoARM.c,244 :: 		void counterSystem()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,247 :: 		if(GPIOE_IDR.B3 == LOW)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem37
;DemoARM.c,249 :: 		while(GPIOE_IDR.B3 == LOW)multiplex();
L_counterSystem38:
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem39
BL	_multiplex+0
IT	AL
BAL	L_counterSystem38
L_counterSystem39:
;DemoARM.c,250 :: 		unit++;
MOVW	R1, #lo_addr(_unit+0)
MOVT	R1, #hi_addr(_unit+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;DemoARM.c,251 :: 		if(unit == 10)
CMP	R0, #10
IT	NE
BNE	L_counterSystem40
;DemoARM.c,253 :: 		unit = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_unit+0)
MOVT	R0, #hi_addr(_unit+0)
STRB	R1, [R0, #0]
;DemoARM.c,254 :: 		ten++;
MOVW	R1, #lo_addr(_ten+0)
MOVT	R1, #hi_addr(_ten+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,255 :: 		}
L_counterSystem40:
;DemoARM.c,256 :: 		if(ten == 10)
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_counterSystem41
;DemoARM.c,258 :: 		ten = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
STRB	R1, [R0, #0]
;DemoARM.c,259 :: 		hundred++;
MOVW	R1, #lo_addr(_hundred+0)
MOVT	R1, #hi_addr(_hundred+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,260 :: 		}
L_counterSystem41:
;DemoARM.c,261 :: 		if(hundred == 10)
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_counterSystem42
;DemoARM.c,263 :: 		hundred = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
STRB	R1, [R0, #0]
;DemoARM.c,264 :: 		thousand++;
MOVW	R1, #lo_addr(_thousand+0)
MOVT	R1, #hi_addr(_thousand+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,265 :: 		}
L_counterSystem42:
;DemoARM.c,266 :: 		if(thousand == 10)
MOVW	R0, #lo_addr(_thousand+0)
MOVT	R0, #hi_addr(_thousand+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_counterSystem43
;DemoARM.c,268 :: 		unit = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_unit+0)
MOVT	R0, #hi_addr(_unit+0)
STRB	R1, [R0, #0]
;DemoARM.c,269 :: 		ten = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
STRB	R1, [R0, #0]
;DemoARM.c,270 :: 		hundred = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
STRB	R1, [R0, #0]
;DemoARM.c,271 :: 		thousand = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_thousand+0)
MOVT	R0, #hi_addr(_thousand+0)
STRB	R1, [R0, #0]
;DemoARM.c,272 :: 		}
L_counterSystem43:
;DemoARM.c,273 :: 		}
L_counterSystem37:
;DemoARM.c,276 :: 		if(GPIOE_IDR.B4 == LOW)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem44
;DemoARM.c,278 :: 		multiplex();
BL	_multiplex+0
;DemoARM.c,279 :: 		if(GPIOE_IDR.B4 == LOW)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem45
;DemoARM.c,281 :: 		unit--;
MOVW	R1, #lo_addr(_unit+0)
MOVT	R1, #hi_addr(_unit+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;DemoARM.c,282 :: 		if(unit == 0)
CMP	R0, #0
IT	NE
BNE	L_counterSystem46
;DemoARM.c,284 :: 		unit = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_unit+0)
MOVT	R0, #hi_addr(_unit+0)
STRB	R1, [R0, #0]
;DemoARM.c,285 :: 		ten--;
MOVW	R1, #lo_addr(_ten+0)
MOVT	R1, #hi_addr(_ten+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,286 :: 		}
L_counterSystem46:
;DemoARM.c,287 :: 		if(ten == 0)
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem47
;DemoARM.c,289 :: 		ten = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_ten+0)
MOVT	R0, #hi_addr(_ten+0)
STRB	R1, [R0, #0]
;DemoARM.c,290 :: 		hundred--;
MOVW	R1, #lo_addr(_hundred+0)
MOVT	R1, #hi_addr(_hundred+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,291 :: 		}
L_counterSystem47:
;DemoARM.c,292 :: 		if(hundred == 0)
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem48
;DemoARM.c,294 :: 		hundred = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
STRB	R1, [R0, #0]
;DemoARM.c,295 :: 		thousand--;
MOVW	R1, #lo_addr(_thousand+0)
MOVT	R1, #hi_addr(_thousand+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,296 :: 		}
L_counterSystem48:
;DemoARM.c,297 :: 		if(hundred == 0)
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_counterSystem49
;DemoARM.c,299 :: 		hundred = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_hundred+0)
MOVT	R0, #hi_addr(_hundred+0)
STRB	R1, [R0, #0]
;DemoARM.c,300 :: 		thousand--;
MOVW	R1, #lo_addr(_thousand+0)
MOVT	R1, #hi_addr(_thousand+0)
LDRB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
;DemoARM.c,301 :: 		}
L_counterSystem49:
;DemoARM.c,302 :: 		}
L_counterSystem45:
;DemoARM.c,303 :: 		}
L_counterSystem44:
;DemoARM.c,304 :: 		}
L_end_counterSystem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _counterSystem
_changeLEDBright:
;DemoARM.c,307 :: 		void changeLEDBright()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,309 :: 		if(GPIOE_IDR.B2 == HIGH)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_changeLEDBright50
;DemoARM.c,311 :: 		pwm();
BL	_pwm+0
;DemoARM.c,312 :: 		if(GPIOE_IDR.B2 == HIGH)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_changeLEDBright51
;DemoARM.c,314 :: 		if(valor < 2048)
MOVW	R0, #lo_addr(_valor+0)
MOVT	R0, #hi_addr(_valor+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2048
IT	GE
BGE	L_changeLEDBright52
;DemoARM.c,315 :: 		valor++;
MOVW	R1, #lo_addr(_valor+0)
MOVT	R1, #hi_addr(_valor+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
L_changeLEDBright52:
;DemoARM.c,316 :: 		}
L_changeLEDBright51:
;DemoARM.c,317 :: 		}
L_changeLEDBright50:
;DemoARM.c,319 :: 		if(GPIOE_IDR.B5 == HIGH)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_changeLEDBright53
;DemoARM.c,321 :: 		pwm();
BL	_pwm+0
;DemoARM.c,322 :: 		if(GPIOE_IDR.B4 == HIGH)
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_changeLEDBright54
;DemoARM.c,324 :: 		if(valor > 0)
MOVW	R0, #lo_addr(_valor+0)
MOVT	R0, #hi_addr(_valor+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_changeLEDBright55
;DemoARM.c,325 :: 		valor--;
MOVW	R1, #lo_addr(_valor+0)
MOVT	R1, #hi_addr(_valor+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
L_changeLEDBright55:
;DemoARM.c,326 :: 		}
L_changeLEDBright54:
;DemoARM.c,327 :: 		}
L_changeLEDBright53:
;DemoARM.c,329 :: 		}
L_end_changeLEDBright:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _changeLEDBright
_loop:
;DemoARM.c,331 :: 		void loop()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DemoARM.c,334 :: 		multiplex();
BL	_multiplex+0
;DemoARM.c,335 :: 		counterSystem();
BL	_counterSystem+0
;DemoARM.c,338 :: 		readADC1();
BL	_readADC1+0
;DemoARM.c,339 :: 		delay_ms(1);
MOVW	R7, #8331
MOVT	R7, #0
NOP
NOP
L_loop56:
SUBS	R7, R7, #1
BNE	L_loop56
NOP
NOP
NOP
NOP
;DemoARM.c,340 :: 		readADC2();
BL	_readADC2+0
;DemoARM.c,341 :: 		delay_ms(1);
MOVW	R7, #8331
MOVT	R7, #0
NOP
NOP
L_loop58:
SUBS	R7, R7, #1
BNE	L_loop58
NOP
NOP
NOP
NOP
;DemoARM.c,344 :: 		changeLEDBright();
BL	_changeLEDBright+0
;DemoARM.c,345 :: 		}
L_end_loop:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _loop
_main:
;DemoARM.c,347 :: 		void main()
;DemoARM.c,349 :: 		setup();
BL	_setup+0
;DemoARM.c,351 :: 		demoSevenSegmentDisplay();
BL	_demoSevenSegmentDisplay+0
;DemoARM.c,352 :: 		demoLiquidCrystalDisplay();
BL	_demoLiquidCrystalDisplay+0
;DemoARM.c,354 :: 		while(1) loop();
L_main60:
BL	_loop+0
IT	AL
BAL	L_main60
;DemoARM.c,355 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_decode:
;DemoARM.c,358 :: 		unsigned char decode(unsigned char number)
; number start address is: 0 (R0)
; number end address is: 0 (R0)
; number start address is: 0 (R0)
;DemoARM.c,360 :: 		switch(number)
IT	AL
BAL	L_decode62
; number end address is: 0 (R0)
;DemoARM.c,362 :: 		case 0: return 63;
L_decode64:
MOVS	R0, #63
IT	AL
BAL	L_end_decode
;DemoARM.c,363 :: 		case 1: return 6;
L_decode65:
MOVS	R0, #6
IT	AL
BAL	L_end_decode
;DemoARM.c,364 :: 		case 2: return 91;
L_decode66:
MOVS	R0, #91
IT	AL
BAL	L_end_decode
;DemoARM.c,365 :: 		case 3: return 79;
L_decode67:
MOVS	R0, #79
IT	AL
BAL	L_end_decode
;DemoARM.c,366 :: 		case 4: return 102;
L_decode68:
MOVS	R0, #102
IT	AL
BAL	L_end_decode
;DemoARM.c,367 :: 		case 5: return 109;
L_decode69:
MOVS	R0, #109
IT	AL
BAL	L_end_decode
;DemoARM.c,368 :: 		case 6: return 125;
L_decode70:
MOVS	R0, #125
IT	AL
BAL	L_end_decode
;DemoARM.c,369 :: 		case 7: return 7;
L_decode71:
MOVS	R0, #7
IT	AL
BAL	L_end_decode
;DemoARM.c,370 :: 		case 8: return 127;
L_decode72:
MOVS	R0, #127
IT	AL
BAL	L_end_decode
;DemoARM.c,371 :: 		case 9: return 111;
L_decode73:
MOVS	R0, #111
IT	AL
BAL	L_end_decode
;DemoARM.c,372 :: 		}
L_decode62:
; number start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_decode64
CMP	R0, #1
IT	EQ
BEQ	L_decode65
CMP	R0, #2
IT	EQ
BEQ	L_decode66
CMP	R0, #3
IT	EQ
BEQ	L_decode67
CMP	R0, #4
IT	EQ
BEQ	L_decode68
CMP	R0, #5
IT	EQ
BEQ	L_decode69
CMP	R0, #6
IT	EQ
BEQ	L_decode70
CMP	R0, #7
IT	EQ
BEQ	L_decode71
CMP	R0, #8
IT	EQ
BEQ	L_decode72
CMP	R0, #9
IT	EQ
BEQ	L_decode73
; number end address is: 0 (R0)
;DemoARM.c,373 :: 		return 0;
MOVS	R0, #0
;DemoARM.c,374 :: 		}
L_end_decode:
BX	LR
; end of _decode
