/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */
#include "system.h"
#include <stdio.h>
//#define leds (char *) 0x04041050

void main() {

  printf("Hello World\n");

  volatile unsigned int *HEX = (unsigned int *) 0x040410a0;
  volatile unsigned int *LEDR = (unsigned int *) 0x04041090;

  volatile unsigned int *KEYS = (unsigned int *) 0x04041080;
  volatile unsigned int *SWITCHES = (unsigned int *) 0x04041070;
  volatile unsigned int *CONTROL = (unsigned int *) 0x04041060;



  unsigned int i;
  unsigned int control;
  unsigned int j;
  unsigned int k;
  j=*SWITCHES;
  control=*CONTROL;
//  volatile unsigned int *j = (unsigned int *) 0x0;


  if(control==1)
  {
    for (i = 0; i<=j; i++)
    {
    *HEX = i;
    *LEDR=i;
    for (k=0; k<100000; k++)
    {
    }

    printf("%d\n", i);
    }

    usleep(500000);
    exit(0);
  }
  else if (control==2)
  {

      for (i = j; i>0; i--)
      {
      *HEX = i;
      *LEDR=i;
      for (k=0; k<100000; k++)
      {
      }

      printf("%d\n", i);
      }

      usleep(500000);
      exit(0);
  }
      else if (control==3)
      {
        for (i = 0; i<8; i++)
        {
        *HEX = 11259375;//10*16^5+11*16^4+12*16^3+13*16^2+14*16+15
        *LEDR=1<<i;
        for (k=0; k<100000; k++)
        {
        }

        printf("%d\n", i);
        }

        usleep(500000);
        exit(0);
      }
        else
        {
	   *HEX = 2989;//11*16^2+10*16+13
	   *LEDR=j;
        }

}
