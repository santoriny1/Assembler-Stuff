#include <msp430.h>                                                                                 // LIB
void init_UART0(void);
void TX_UART(char info);
void config_adc_1();
void config_adc_2();
void config_adc_3();
void enviarNumero(int numero);

unsigned int lecturaADC;
unsigned int estado=0;

void main()
{

      WDTCTL = WDTPW + WDTHOLD;     // stop watchdog timer
      BCSCTL1 = CALBC1_16MHZ;       // establecer la frecuancia del DCO en 16 MHz
      DCOCTL = CALDCO_16MHZ;
      init_UART0();
      config_adc_1();
      
      //Detectar push button 
      P1IES &= ~BIT3;
      P1IE |= BIT3;

      for(;;)
      {
          lecturaADC = ADC10MEM;
          enviarNumero(lecturaADC);

          //Cambio de estado del push button
          if((P1IN & BIT3) == 0){
              volatile unsigned int i;
              estado++;

              if(estado>2)estado=0;

              for(i=0;i<=45000;i++);

              if(estado==0){
                  config_adc_1();
              }

              else if(estado==1){
                  config_adc_2();
              }

              else{
                  config_adc_3();
              }
          }
          TX_UART('E');TX_UART('s');TX_UART('t');TX_UART('a');TX_UART('d');TX_UART('o');TX_UART(':');TX_UART(estado+48);TX_UART(':');TX_UART(' ');
      }
}

//Inicializacion del UART
void init_UART0(void)
{
    UCA0CTL1 |=1;               //poner reset
    UCA0CTL0 = 0;               //sin paridad, lsb, lp, UART sincrono
    UCA0CTL1 = 0X81;
    UCA0BR0 = 0X82;             //16MHz/9600 = 1666 = 682h
    UCA0BR1 = 0X06;
    UCA0MCTL = 0X0A;            //sin sobremuestreo
    UCA0CTL1 &= ~1;             //quitar reset
    IE2 |= UCA0RXIE + UCA0TXIE;
    P1SEL = 6;                  //RX= P1.1   TX=P1.2
    P1SEL2 = 6;
}

//Mostrar caracter leido por el UART
void TX_UART(char info)
{
    while((IFG2&2) == 0);
    UCA0TXBUF = info;
}

//Se manda el numero entero que lee el UART y se imprime a 4 digitos
void enviarNumero(int numero){
    int i=0;
    int divisor=1000;
    int resultado=0;

    while(i<4){
        resultado =(int)numero/divisor;
        numero = (int)numero%divisor;
        divisor/=10;
        TX_UART(resultado+48);
        i++;
    }
    
    //Salto de linea y retorno de carro
    TX_UART(10);
    TX_UART(13);
}

// Configuración del ADC para el canal 1
void config_adc_1()
{
    ADC10CTL0 &= ~ENC;
    ADC10CTL1 = CONSEQ_2 + INCH_4;
    ADC10CTL0 = ADC10SHT_2 + MSC + ADC10ON + ADC10IE;
    ADC10DTC1 = 0x01;
    ADC10AE0 = BIT4;
    ADC10CTL0 |= ENC + ADC10SC;

    //Encender led P1.6
    P1DIR = BIT6;
    P1OUT = BIT6;
}

// Configuración del ADC para el canal 2
void config_adc_2()
{
    ADC10CTL0 &= ~ENC;
    ADC10CTL1 = CONSEQ_2 + INCH_5;
    ADC10CTL0 = ADC10SHT_2 + MSC + ADC10ON + ADC10IE;
    ADC10DTC1 = 0x01;
    ADC10AE0 = BIT5;
    ADC10CTL0 |= ENC + ADC10SC;

    //Encender led P1.0
    P1DIR = BIT0;
    P1OUT = BIT0;
}

// Configuración del ADC para el canal 3
void config_adc_3()
{
    ADC10CTL0 &= ~ENC;
    ADC10CTL1 = CONSEQ_2 + INCH_7;
    ADC10CTL0 = ADC10SHT_2 + MSC + ADC10ON + ADC10IE;
    ADC10DTC1 = 0x01;
    ADC10AE0 = BIT7;
    ADC10CTL0 |= ENC + ADC10SC;

    //Encender leds P1.0 y P1.6
    P1DIR = BIT0+BIT6;
    P1OUT = BIT0+BIT6;
}


