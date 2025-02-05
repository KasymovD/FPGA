#include "system.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define HEX_ADDR        0x040410c0
#define LEDR_ADDR       0x040410b0
#define SWITCHES_ADDR   0x04041080

unsigned int xor_cipher(unsigned int input, unsigned int key) {
    return input ^ key;
}

unsigned int generate_random() {
    return (rand() * 1103515245 + 12345) & 0x7FFFFFFF;
}

unsigned int reverse_digits(unsigned int n) {
    unsigned int reversed = 0;
    while (n > 0) {
        reversed = reversed * 10 + (n % 10);
        n /= 10;
    }
    return reversed;
}

void main() {
    volatile unsigned int *HEX = (unsigned int *) HEX_ADDR;
    volatile unsigned int *LEDR = (unsigned int *) LEDR_ADDR;
    volatile unsigned int *SWITCHES = (unsigned int *) SWITCHES_ADDR;

    unsigned int current_value = 0;
    unsigned int prev_switches = 0;
    unsigned int switches;
    unsigned int cipher_key = 0x5A;
    int blink_state = 0;
    static unsigned int random_value = 0;

    while (1) {
        switches = *SWITCHES;

        if ((prev_switches & 0x1) == 0 && (switches & 0x1)) {
            current_value++;
        }

        if ((prev_switches & 0x8) == 0 && (switches & 0x8)) {
            if (current_value > 0) {
                current_value--;
            }
        }

        if ((prev_switches & 0x10) == 0 && (switches & 0x10)) {
            current_value *= 2;
        }

        if ((prev_switches & 0x20) == 0 && (switches & 0x20)) {
            current_value /= 2;
        }

        if (switches & 0x80) {
			current_value = (current_value * 1103515245 + 12345) & 0x7FFFFFFF;
			*LEDR = current_value;
			*HEX = current_value;
			printf("Random Value: %X\n", current_value);
			usleep(500000);
		}

        if ((switches & 0x100) && (switches & 0x200)) {
			unsigned int reversed = reverse_digits(current_value);
			*LEDR = reversed;
			*HEX = reversed;
			printf("Reversed Digits: %X\n", reversed);
			usleep(500000);
		}

        if (switches & 0x40) {
            blink_state = !blink_state;
            *LEDR = 0xFFFFFF;
            *HEX = 0x09306A;
            usleep(500000);
        } else if (switches & 0x4) {
            unsigned int encrypted_value = xor_cipher(current_value, cipher_key);
            *LEDR = encrypted_value;
            *HEX = encrypted_value;
            printf("Encrypted Value (XOR): %X\n", encrypted_value);
            usleep(500000);
        } else if (switches & 0x2) {
            *LEDR = current_value;
            *HEX = ((current_value / 1000 % 10) << 12) |
                   ((current_value / 100 % 10) << 8) |
                   ((current_value / 10 % 10) << 4) |
                   (current_value % 10);
        } else {
            *LEDR = current_value;
            *HEX = current_value;
        }

        prev_switches = switches;
        usleep(100000);
    }
}
