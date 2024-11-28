#include <stdio.h>
#include "Hash256.h"

//https://sha256algorithm.com/

uint32_t Ch(uint32_t x, uint32_t y, uint32_t z)
{
    return (x & y) ^ (~x & z);
}

uint32_t M(uint32_t x, uint32_t y, uint32_t z)
{
    return (x & y) ^ (x & z) ^ (y & z);
}

uint32_t R(uint32_t x, uint16_t n)
{
    return x >> n;
}

uint32_t S(uint32_t x, uint16_t n)
{
    return (x << (32 - n)) | (x >> n);
}

uint32_t Sigma0(uint32_t x)
{
    return S(x, 2) ^ S(x, 13) ^ S(x, 22);
}

uint32_t Sigma1(uint32_t x)
{
    return S(x, 6) ^ S(x, 11) ^ S(x, 25);
}

uint32_t sigma0(uint32_t x)
{
    return S(x, 7) ^ S(x, 18) ^ R(x, 3);
}

uint32_t sigma1(uint32_t x)
{
    return S(x, 17) ^ S(x, 19) ^ R(x, 10);
}


uint32_t* Hash(uint32_t* Message, uint16_t N)
{
    uint32_t H[65][8];
    uint32_t W[64];

    H[0][0] = H0;
    H[0][1] = H1;
    H[0][2] = H2;
    H[0][3] = H3;
    H[0][4] = H4;
    H[0][5] = H5;
    H[0][6] = H6;
    H[0][7] = H7;
    for (int k = 1; k < 65; k ++ ) {
        for (int m = 0; m < 8; m++) {
            H[k][m] = 0;
            W[k - 1] = 0;
        }
    }    
    
    printf("H10 = %x\n", H[0][0]);

    uint16_t i = 0;
    uint16_t j = 0;

    uint32_t T1 = 0;
    uint32_t T2 = 0;

    uint32_t a = 0;
    uint32_t b = 0;
    uint32_t c = 0;
    uint32_t d = 0;
    uint32_t e = 0;
    uint32_t f = 0;
    uint32_t g = 0;
    uint32_t h = 0;

    static uint32_t HashM[8];
    HashM[0] = 0;
    HashM[1] = 0;
    HashM[2] = 0;
    HashM[3] = 0;
    HashM[4] = 0;
    HashM[5] = 0;
    HashM[6] = 0;
    HashM[7] = 0;


    for (i = 0; i < N; i++)
    {
        a = H[i][0];
        b = H[i][1];
        c = H[i][2];
        d = H[i][3];
        e = H[i][4];
        f = H[i][5];
        g = H[i][6];
        h = H[i][7];

        

        for (j = 0; j < 64; j++)
        {
            if(j < 16)
                W[j] = Message[i * 8 + j];
            else
                W[j] = sigma1(W[j - 2]) + W[j - 7] + sigma0(W[j - 15]) + W[j - 16];

            
            T1 = h + Sigma1(e) + Ch(e, f, g) + K[j] + W[j];
            T2 = Sigma0(a) + M(a, b, c);
            h = g;
            g = f;
            f = e;
            e = d + T1;
            d = c;
            c = b;
            b = a;
            a = T1 + T2;   
        }
        printf("%d H0 =       %x\n",i,H[i][0]);

        H[i+1][0] = a + H[i][0];
        H[i+1][1] = b + H[i][1];
        H[i+1][2] = c + H[i][2];
        H[i+1][3] = d + H[i][3];
        H[i+1][4] = f + H[i][4];
        H[i+1][5] = e + H[i][5];
        H[i+1][6] = g + H[i][6];
        H[i+1][7] = h + H[i][7];
    }

    HashM[0] = H[N][0];
    HashM[1] = H[N][1];
    HashM[2] = H[N][2];
    HashM[3] = H[N][3];
    HashM[4] = H[N][4];
    HashM[5] = H[N][5];
    HashM[6] = H[N][6];
    HashM[7] = H[N][7];

    return HashM;
}

