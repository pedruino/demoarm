        /******************************************************************************************
1) Implementar um sequencial de leds que acenda e teste todos os segmentos dos 4 displays do kit de
demonstração, esta parte do programa deverá ser iniciada assim que a placa for energizada, como sugestão,
poderá ser utilizado um intervalo de 100ms entre as transições.

2) Assim que o ítem 1 for concluído no programa de teste, deverá ser iniciado o teste do LCD, este
teste consiste em acionar os segmentos do display do LCD da linha 1 e da linha 2 em sequencia. Também
como sugestão poderá ser utilizada uma transição de 100ms entre os segmentos.

3) Leitura de dois sensores analógicos através do conversor AD, um para a leitura do potenciômetro
conectado no pino RA0 e outro conectado ao sensor de temperatura no pino RA1. Os valores lidos deverão
ser escritos no LCD.

4) Implementar um contador Up Down com os displays de LEDs em 4 dígitos no modo multiplexado
utilizando a leitura de pulso de clock para o modo crescente e o modo de leitura de transição de nível lógico
para o modo decrescente.

5) Utilizar o modulo PWM para o controle de luminosidade de um LED controlado por 2
interruptores, um interruptor aumenta o brilho e o outro interruptor diminui o brilho.

******************************************************************************************/
#define HIGH 1
#define LOW 0

//LCD module connections
sbit LCD_RS at GPIOB_ODR.B3;
sbit LCD_EN at GPIOB_ODR.B5;
sbit LCD_D4 at GPIOB_ODR.B6;
sbit LCD_D5 at GPIOB_ODR.B7;
sbit LCD_D6 at GPIOB_ODR.B8;
sbit LCD_D7 at GPIOB_ODR.B9;

/************* Variables ***********/
const char unsigned SEQUENCE_PLACES[4][4]=
{
    {1, 0, 0, 0},
    {0, 1, 0, 0},
    {0, 0, 1, 0},
    {0, 0, 0, 1}
};

const char unsigned SEVEN_SEGMENTS[] = {1, 2, 4, 8, 16, 32, 64, 128};
const unsigned char TIME_INTERVAL = 100;
const unsigned char SCROLLTEXT_SPEED = 350;
const unsigned char GIFT_ICON[] = {17,10,31,21,31,21,31,0};
unsigned char unit, ten, hundred, thousand, readingCountAdc1, readingCountAdc2;
unsigned char txt[7], txt_1[7];
int value, avg;
long sum;

int valor;
char sentido;

/************* Headers ***********/
void demoSevenSegmentDisplay();
unsigned char decode(unsigned char number);
void drawCustomCharacter(char pos_row, char pos_char, unsigned char character[]);
void demoLiquidCrystalDisplay();
void counterSystem();
void setup();
void loop();
void pwm();

/************* Functions ***********/
void demoSevenSegmentDisplay()
{
    unsigned char number, place;
    for(number = 0; number < 10; number++)
    {
        for(place = 0; place <= 4; place++)
        {
            GPIOC_ODR.B0 = SEQUENCE_PLACES[place][0];
            GPIOC_ODR.B1 = SEQUENCE_PLACES[place][1];
            GPIOC_ODR.B2 = SEQUENCE_PLACES[place][2];
            GPIOC_ODR.B3 = SEQUENCE_PLACES[place][3];

            gpiod_odr = decode(number);
            delay_ms(TIME_INTERVAL);
        }
        delay_ms(TIME_INTERVAL);
    }
}

void drawCustomCharacter(char pos_row, char pos_char, unsigned char character[]) {
    unsigned char i;
    lcd_cmd(64);
    for (i = 0; i<=7; i++) lcd_chr_cp(character[i]);
    lcd_cmd(_LCD_RETURN_HOME);
    lcd_chr(pos_row, pos_char, 0);
}

void demoLiquidCrystalDisplay()
{
    unsigned char line, column;    
    unsigned char txt [] = "reticulo endoplasmatico";
    unsigned char txt1[] = "Sistemas Embarcados";
    unsigned char txt2[] = "Antonio Branco";
    
    lcd_out(1, 3, txt1);
    lcd_out(2, 1, txt2);
    delay_ms(5000);

    lcd_cmd(_LCD_CLEAR);

    for(line = 1; line <= 2; line++)
    {
        for(column = 0; column <= sizeof(txt)/sizeof(char); column++)
        {
            lcd_out(line, 1, txt);
            lcd_cmd(_LCD_SHIFT_LEFT);
            delay_ms(SCROLLTEXT_SPEED);
        }
    }

    lcd_cmd(_LCD_CURSOR_OFF);
    lcd_cmd(_LCD_RETURN_HOME);
    lcd_cmd(_LCD_CLEAR);
}

void multiplex()
{
    GPIOC_ODR.B3 = 0;
    GPIOC_ODR.B2 = 0;
    GPIOC_ODR.B1 = 0;
    GPIOC_ODR.B0 = 1;
    GPIOD_ODR = decode(unit);
    delay_ms(1);
    
    GPIOC_ODR.B3 = 0;
    GPIOC_ODR.B2 = 0;
    GPIOC_ODR.B1 = 1;
    GPIOC_ODR.B0 = 0;
    GPIOD_ODR = decode(ten);
    delay_ms(1);

    GPIOC_ODR.B3 = 0;
    GPIOC_ODR.B2 = 1;
    GPIOC_ODR.B1 = 0;
    GPIOC_ODR.B0 = 0;
    GPIOD_ODR = decode(hundred);
    delay_ms(1);

    GPIOC_ODR.B3 = 1;
    GPIOC_ODR.B2 = 0;
    GPIOC_ODR.B1 = 0;
    GPIOC_ODR.B0 = 0;
    GPIOD_ODR = decode(6);
    delay_ms(1);
}

void setup()
{
    //PORTD (7-segments-LED)
    gpio_digital_output(&GPIOD_ODR,
        _gpio_pinmask_0 |_gpio_pinmask_1 |_gpio_pinmask_2 |
        _gpio_pinmask_3 |_gpio_pinmask_4 |_gpio_pinmask_5 |
        _gpio_pinmask_6 |_gpio_pinmask_7);

    //PORTB (LCD)
    gpio_digital_output(&GPIOB_ODR,
        _gpio_pinmask_3 |_gpio_pinmask_5 |_gpio_pinmask_6 |
        _gpio_pinmask_7 |_gpio_pinmask_8 |_gpio_pinmask_9);    

    //PORTC (7-segments-trigger)
    gpio_digital_output(&GPIOC_ODR, 
        _gpio_pinmask_0 |_gpio_pinmask_1 | _gpio_pinmask_2 |
        _gpio_pinmask_3 |_gpio_pinmask_4);

    //PORTE (k0-k1)
    gpio_config(&GPIOE_BASE,
        _gpio_pinmask_3 | _gpio_pinmask_4 |
        _gpio_pinmask_2 | _gpio_pinmask_5,
        _gpio_cfg_mode_input | _gpio_cfg_pull_up);

    //Potenciometro
    adc1_init();
    adc_set_input_channel(_adc_channel_1);

    //Temperatura
    adc1_init();
    adc_set_input_channel(_adc_channel_2);

    //SETUP LCD
    lcd_init();
    lcd_cmd(_LCD_CLEAR);
    lcd_cmd(_LCD_CURSOR_OFF);

    //SETUP PWM
    valor  = 0;
    sentido = 0;
    PWM_TIM1_Init(40000);//frequencia do pwm
    PWM_TIM1_Set_Duty(valor, _PWM_NON_INVERTED, _PWM_CHANNEL1);
    //ciclo de trabalho 0 ... 2047
    PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
}

void pwm(){
    delay_ms(10);
    PWM_TIM1_Set_Duty(valor,  _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

void readADC1()
{
    lcd_out(1,1,"P=");
    value = adc1_read(1);
    sum = sum + adc1_read(1);
    inttostr(value,txt);
    lcd_out_cp(ltrim(txt));
    readingCountAdc1 ++;
    if(readingCountAdc1 >= 50){
        avg = sum / readingCountAdc1;
        sum = 0;
        readingCountAdc1 = 0;
        lcd_out(2,1,"mP=");
        inttostr(avg,txt_1);
        lcd_out_cp(ltrim(txt_1));
    }
}
void readADC2()
{
    value = adc1_read(2);
    avg = avg + value;
    readingCountAdc2 ++;
    if (readingCountAdc2 == 15)
    {
        sum = avg / readingCountAdc2;
        readingCountAdc2 = 0;
        avg = 0;
        sum = sum - (sum * 100 /515); //ajusta volt ;
        sum = ((value * 3.3 / 4096) /0.01) - 3;
        inttostr (sum, txt_1);
        if(sum < 10)
        {
            lcd_out(2,13," ");
            lcd_out(2,14,ltrim(txt_1));
        }
        else
        {
            lcd_out(2,13,ltrim(txt_1));
        }
    }
}

void counterSystem()
{
    //Increment
    if(GPIOE_IDR.B3 == LOW)
    {
        while(GPIOE_IDR.B3 == LOW)multiplex();
        unit++;
        if(unit == 10)
        {
            unit = 0;
            ten++;
        }
        if(ten == 10)
        {
            ten = 0;
            hundred++;
        }
        if(hundred == 10)
        {
            hundred = 0;
            thousand++;
        }
        if(thousand == 10)
        {
            unit = 0;
            ten = 0;
            hundred = 0;
            thousand = 0;
        }
    }
    
    //Decrement
    if(GPIOE_IDR.B4 == LOW)
    {
        multiplex();
        if(GPIOE_IDR.B4 == LOW)
        {
            unit--;
            if(unit == 0)
            {
                unit = 9;
                ten--;
            }
            if(ten == 0)
            {
                ten = 9;
                hundred--;
            }
            if(hundred == 0)
            {
                hundred = 9;
                thousand--;
            }
            if(hundred == 0)
            {
                hundred = 9;
                thousand--;
            }
        }
    }
}


void changeLEDBright()
{
    if(GPIOE_IDR.B2 == HIGH)
    {
        pwm();
        if(GPIOE_IDR.B2 == HIGH)
        {
            if(valor < 2048)
                valor++;
        }
    }

    if(GPIOE_IDR.B5 == HIGH)
    {        
        pwm();
        if(GPIOE_IDR.B4 == HIGH)
        {
            if(valor > 0)
                valor--;
        }
    }
    //pwm();
}

void loop()
{
    //Counter System
    multiplex();    
    counterSystem();

    //ADC
    readADC1();
    delay_ms(1);
    readADC2();
    delay_ms(1);

    //LED bright
    changeLEDBright();
}

void main()
{
    setup();
    
    demoSevenSegmentDisplay();
    demoLiquidCrystalDisplay();

    while(1) loop();
}

//Convert to SSD code 
unsigned char decode(unsigned char number)
{
    switch(number)
    {
        case 0: return 63;
        case 1: return 6;
        case 2: return 91;
        case 3: return 79;
        case 4: return 102;
        case 5: return 109;
        case 6: return 125;
        case 7: return 7;
        case 8: return 127;
        case 9: return 111;
    }
    return 0;
}