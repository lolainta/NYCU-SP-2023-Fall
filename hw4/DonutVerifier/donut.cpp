#include <stdio.h>
#include <math.h>
#include <string.h>

void dump(u_int8_t *buf, int len){
    for(int i=0;i<len;++i){
        if(i && i%64==0) putchar(10);
        printf("0x%02hhx,", (u_int8_t)buf[i]);
    }
    printf("\n\n");
}

u_int8_t target[1024] = {
    0x47,0x56,0xf8,0xbe,0xfd,0xfb,0xa6,0xfb,0xa7,0xff,0xf2,0xf2,0x0c,0x63,0x33,0x11,0x65,0x2f,0x18,0x21,0x69,0x63,0x35,0x25,0x2d,0x1f,0x27,0x70,0x2a,0x30,0x00,0x1e,0x02,0xbc,0xc8,0x9a,0x52,0x6f,0x56,0x6a,0x42,0x4d,0x68,0x32,0x51,0x4f,0x4b,0x3f,0x01,0x01,0x00,0xb1,0xb5,0xba,0xba,0xba,0xba,0xba,0xa7,0xa7,0xa8,0xa8,0xa8,0xab,
    0xab,0xa9,0x78,0x78,0x77,0x77,0x77,0x76,0x76,0x75,0xc4,0xcb,0xcc,0xcc,0xcd,0xcd,0xce,0xcf,0xcf,0xcf,0x30,0x30,0x31,0x31,0x32,0x33,0x3a,0x38,0x39,0x8a,0x8a,0x89,0x89,0x89,0x88,0x88,0x88,0x88,0x59,0x5b,0x5b,0x5b,0x59,0x59,0x59,0x27,0x27,0x57,0x57,0x4b,0x48,0x48,0x49,0x49,0x4e,0x4e,0x4f,0x4b,0xf9,0xf9,0xf8,0x07,0x07,0x05,
    0x04,0x04,0x07,0x07,0x06,0x01,0x01,0x00,0x00,0x03,0x01,0xb0,0xb1,0xb1,0xb1,0xba,0xba,0xba,0xba,0xba,0xe9,0xd7,0xd7,0xa9,0xa9,0xa9,0x78,0x78,0x77,0x77,0x77,0x76,0x76,0xc6,0xc6,0xc7,0xc5,0xc2,0xc2,0xc3,0xc3,0xc0,0xc1,0xc1,0xc1,0x3e,0x3e,0x3f,0x3f,0x3c,0x3d,0x3d,0x38,0x39,0x39,0x8a,0x89,0x89,0x89,0x88,0x88,0x88,0x88,0x88,
    0x5b,0x5b,0x5b,0x59,0x59,0x59,0x27,0x26,0x57,0x57,0x48,0x48,0x48,0x49,0x49,0x4e,0x4e,0x4f,0x4b,0xf9,0xf8,0xf8,0x07,0x07,0x05,0x04,0x04,0x07,0x07,0x06,0x01,0x01,0x00,0x00,0x03,0x03,0xb0,0xb1,0xb1,0xb1,0xbe,0xbe,0xba,0xba,0xeb,0xe9,0xe9,0xe9,0xd7,0xd7,0x78,0x78,0x77,0x77,0x77,0x76,0xc1,0xc1,0xc4,0xc4,0xc5,0xc7,0xc0,0xc1,
    0xc1,0xc2,0xc2,0xc1,0xc1,0xc1,0x3e,0x3e,0x3f,0x3c,0x3e,0x3f,0x3f,0x38,0x3b,0x3b,0x3b,0x89,0x89,0x89,0x88,0x88,0x88,0x88,0x88,0x5b,0x5b,0x59,0x59,0x59,0x59,0x26,0x26,0x57,0x57,0x48,0x48,0x49,0x49,0x4e,0x4e,0x4f,0x4f,0xf9,0xf9,0xf8,0xf8,0x07,0x07,0x05,0x04,0x04,0x07,0x06,0x06,0x01,0x01,0x00,0x00,0x03,0x03,0xb0,0xb1,0xb1,
    0xb1,0xbe,0xbe,0xbe,0xbe,0xeb,0xeb,0xeb,0xe9,0xe9,0xe9,0x78,0x77,0x77,0x77,0x77,0xc7,0xc7,0xc4,0xc2,0xc3,0xc3,0xc2,0xc2,0xc3,0xc3,0x93,0x93,0x92,0x92,0x92,0x6d,0x3c,0x3d,0x3e,0x3e,0x3f,0x3f,0x38,0x3a,0x3b,0x3b,0x3e,0x89,0x89,0x89,0x88,0x88,0x88,0x88,0x88,0x5b,0x59,0x59,0x59,0x58,0x26,0x26,0x57,0x54,0x48,0x48,0x49,0x49,
    0x4e,0x4e,0x4f,0x4f,0xfb,0xf9,0xf8,0x07,0x07,0x07,0x05,0x04,0x07,0x07,0x06,0x06,0x01,0x01,0x00,0x00,0x03,0x03,0x03,0xb1,0xb1,0xb1,0xb1,0xbe,0xbe,0xbe,0xe9,0xe9,0xeb,0xeb,0xeb,0xe9,0x17,0x17,0x77,0x77,0x76,0xc5,0xc5,0xc6,0xc4,0xc5,0xc5,0xc4,0xc4,0x94,0x97,0x93,0x92,0x92,0x92,0x92,0x6d,0x6c,0x6c,0x6f,0x3c,0x3d,0x3d,0x3a,
    0x3a,0x3b,0x3d,0x3e,0x3e,0x89,0x89,0x88,0x88,0x88,0x88,0x88,0x59,0x59,0x59,0x59,0x58,0x26,0x26,0x57,0x54,0x48,0x49,0x49,0x49,0x4e,0x4e,0x4f,0x4c,0xfb,0xf8,0xf8,0x07,0x07,0x07,0x06,0x04,0x07,0x07,0x06,0x06,0x01,0x01,0x00,0x00,0x03,0x03,0x03,0xb1,0xb1,0xb1,0xb1,0xbe,0xbe,0xbe,0xe9,0xe9,0xe9,0xe9,0xeb,0xe4,0x17,0x17,0x17,
    0x16,0x16,0xc7,0xc4,0xc4,0xc7,0xc7,0xc0,0xc2,0x94,0x94,0x97,0x97,0x96,0x96,0x96,0x69,0x69,0x68,0x68,0x6b,0x6b,0x3b,0x3b,0x3c,0x3c,0x3d,0x3d,0x3e,0x38,0x38,0x89,0x88,0x88,0x88,0x88,0x88,0x88,0x59,0x59,0x58,0x26,0x26,0x26,0x25,0x54,0x48,0x49,0x49,0x4e,0x4e,0x4f,0x4f,0xfb,0xfb,0xfa,0xf8,0x07,0x07,0x07,0x06,0x04,0x07,0x07,
    0x06,0x01,0x01,0x00,0x00,0x00,0x03,0x03,0x02,0x02,0xb1,0xb1,0xb1,0xbe,0xbe,0xbe,0xbe,0xef,0xef,0xe9,0xe9,0xe6,0x17,0x17,0x17,0x16,0x16,0x39,0x3a,0x3a,0xc5,0xc5,0xc2,0xc0,0x90,0x90,0x93,0x96,0x96,0x96,0x96,0x69,0x69,0x68,0x6b,0x6b,0x6a,0x6a,0x6d,0x3c,0x3c,0x3d,0x3d,0x3e,0x38,0x38,0x39,0x88,0x88,0x88,0x88,0x88,0x88,0x59,
    0x58,0x58,0x26,0x26,0x26,0x25,0x54,0x49,0x49,0x49,0x4e,0x4e,0x4f,0x4f,0xfb,0xfa,0xfa,0x07,0x07,0x07,0x07,0x06,0x05,0x07,0x06,0x06,0x01,0x01,0x00,0x00,0x03,0x05,0x05,0x04,0x04,0x04,0xb5,0xba,0xba,0xbe,0xbe,0xbe,0xef,0xef,0xef,0xe0,0xe6,0x17,0x17,0x17,0x16,0x16,0x44,0x44,0x3a,0x3b,0x3b,0x3c,0xc2,0x90,0x93,0x93,0x92,0x92,
    0x92,0x92,0x6d,0x68,0x68,0x6b,0x6b,0x6a,0x6a,0x6d,0x6d,0x3b,0x3b,0x3b,0x38,0x38,0x38,0x39,0x88,0x88,0x88,0x88,0x88,0x88,0x88,0x58,0x58,0x26,0x26,0x25,0x25,0x54,0x55,0x49,0x4e,0x4e,0x4f,0x4f,0x4c,0xfb,0xfa,0xfa,0x05,0x07,0x07,0x06,0x06,0x05,0x05,0x06,0x06,0x01,0x01,0x00,0x00,0x03,0x03,0x05,0x04,0x04,0x04,0x04,0xba,0xba,
    0xba,0xba,0xba,0xba,0xef,0xef,0xe0,0xe0,0xe0,0x17,0x16,0x16,0x16,0x15,0x44,0x45,0x45,0x42,0x3c,0x3d,0x8c,0x8f,0x93,0x92,0x92,0x92,0x6d,0x6d,0x6c,0x6c,0x6f,0x6f,0x6e,0x6e,0x6d,0x6d,0x3b,0x3b,0x3b,0x38,0x38,0x38,0x3b,0x3b,0x88,0x88,0x88,0x88,0x88,0x88,0x58,0x26,0x26,0x26,0x25,0x25,0x54,0x55,0x49,0x4e,0x4e,0x4f,0x4f,0x4c,
    0xfb,0xfa,0xfa,0x05,0x05,0x07,0x06,0x06,0x05,0x04,0x04,0x01,0x01,0x00,0x00,0x00,0x03,0x03,0x04,0x04,0x04,0x04,0x0b,0x0b,0xba,0xba,0xba,0xba,0xba,0xba,0xe9,0xe6,0xe0,0xe0,0xe0,0x16,0x16,0x16,0x15,0x15,0x47,0x47,0x40,0x42,0x43,0x43,0x8f,0x8e,0x8e,0x8e,0x8e,0x6d,0x6d,0x6c,0x6f,0x6f,0x6e,0x6e,0x69,0x69,0x68,0x68,0x39,0x3a,
    0x3a,0x3a,0x3a,0x3b,0x3b,0x88,0x88,0x88,0x88,0x88,0x88,0x27,0x26,0x26,0x26,0x25,0x25,0x25,0x55,0x55,0x4e,0x4e,0x4f,0x4f,0x4c,0xfd,0xfa,0x05,0x05,0x05,0x05,0x04,0x05,0x05,0x04,0x04,0x03,0x01,0x00,0x00,0x03,0x03,0x03,0x02,0x04,0x04,0x0b,0x0b,0x0b,0x0b,0xba,0xba,0xba,0xba,0xba,0xba,0xe6,0xe6,0xe6,0xe6,0xe7,0x16,0x16,0x15,
    0x15,0x45,0x47,0x40,0x40,0x41,0x41,0x40,0x8e,0x8e,0x8e,0x8e,0x71,0x70,0x70,0x73,0x6f,0x6e,0x6e,0x69,0x69,0x68,0x68,0x3b,0x3a,0x3a,0x3a,0x3b,0x3b,0x3b,0x88,0x88,0x88,0x88,0x88,0x88,0x88,0x26,0x26,0x26,0x25,0x25,0x25,0x55,0x55,0x4e,0x4e,0x4f,0x4f,0x4c,0xfc,0xfc,0x05,0x05,0x05,0x04,0x04,0x07,0x00,0x00,0x00,0x00,0x00,0x00,
};

void donut(u_int8_t*input){
    u_int8_t s[1760];
    float buffer[1760];
    float p = 0, q = 0;
    int offset = 0;
    for (int i = 0; i < 500; ++i)
    {
        memset(buffer, 0, sizeof(buffer));
        memset(s, 32, sizeof(s));
        for (float j = 0; j < 6.28; j += 0.07)
        {
            int cnt = 0;
            for (float k = 0; k < 6.28; k += 0.02, ++cnt)
            {
                float sin_j = sin(j), cos_j = cos(j);
                float sin_k = sin(k), cos_k = cos(k);
                float sin_p = sin(p), cos_p = cos(p);
                float sin_q = sin(q), cos_q = cos(q);

                float u = sin_k * (cos_j + 2), v = sin_j;
                float f31 = 1.0 / (u * sin_p + v * cos_p + 5);
                float f27 = u * cos_p - v * sin_p;
                // rotation matrix with angle q?
                int col = 40 + 30 * f31 * (cos_k * (cos_j + 2) * cos_q - f27 * sin_q);
                int row = 12 + 15 * f31 * (cos_k * (cos_j + 2) * sin_q + f27 * cos_q);
                int pos = row * 80 + col;
                int i23 = (int)(8 * (cos_q * (sin_j * sin_p - sin_k * cos_j * cos_p) - sin_k * cos_j * sin_p - sin_j * cos_p - cos_k * cos_j * sin_q));
                if (22 > row && row > 0 && col > 0 && 80 > col)
                    if (f31 > buffer[pos])
                    {
                        buffer[pos] = f31;
                        s[pos] = ".,-~:;=!*#$@"[std::max(0, i23)];
                    }
                if (cnt == 30 && offset < 1023)
                    input[offset++] ^= pos ^ i23 ^ (row + col);
            }
        }
        p += 0.00004 * 1760;
        q += 0.00002 * 1760;
    }
}

int main(){
    u_int8_t zero[1024];
    memset(zero, 0, sizeof(zero));
    donut(zero);
    // dump(zero, 1024);
    u_int8_t ans[1024];
    for(int i=0;i<1024;++i)
        ans[i] = zero[i] ^ target[i];
    // dump(ans, 1024);
    printf("%s\n", ans);
    donut(ans);
    memcmp(ans, target, 1024) ? puts("Wrong") : puts("Correct");
    return 0;
}
