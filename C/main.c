#include <stdio.h>
#include "Hash256.h"

int main()
{
    uint32_t x = 0x32;
    uint32_t y = 0xa2;
    uint32_t z = 0xdd;
    uint32_t message[16] = {0x0032, 0x0054, 0x0033, 0x0066, 0x0032, 0x0054, 0x0033, 0x0066,0x80000000,0x00, 0x00,0x00,0x00,0x00,0x00,0x100};
    uint32_t *Hashm= Hash(message, 1);
    for (int i = 0; i < 8; i++) 
    {
        printf("%08x", Hashm[i]);
        
    }
    printf("\n");
    return 0;

}