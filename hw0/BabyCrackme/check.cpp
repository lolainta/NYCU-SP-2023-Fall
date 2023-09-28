#include<unistd.h>
#include<stdint.h>
#include<iostream>
#include<stdlib.h>
#include<string.h>
#include<bitset>

uint8_t data[0x24];

bool check(const uint8_t*inp,int k,int iv){
    std::cout<<std::hex;
    unsigned long long res[100];
    unsigned int cur = iv;
    for(int i=0;i<k;++i){
        int seed=data[i];
//        *(uint8_t*)((long)&res+(long)i)=(uint8_t)cur^seed;
        res[i]=cur^seed;
        std::cout<<i<<"                         "<<std::bitset<8>(k-i)<<std::endl;
        cur=((cur>>1|(uint32_t)((cur&1)!=0)<<0x1f) ^ (uint32_t)seed) + (k-i);
        std::cout<<i<<' '<<std::bitset<32>(cur)<<std::endl;
    }
    for(int i=0;i<k;++i){
//        std::cout<<i<<' '<<res[i]<<std::endl;
    }
    int ret=0;
    ret=strcmp((char*)&res,(const char*)inp);
    for(int i=0;i<0x30;++i){
        std::cout<<i<<' '<<(uint32_t)((char*)&res)[i]<<' '<<(uint32_t)((const char*)inp)[i]<<' '<<(uint32_t)data[i]<<std::endl;
    }
    return ret==0;
}

int main(){
    data[0]=(uint8_t)0x4a;
    data[1]=(uint8_t)0x3c;
    data[2]=(uint8_t)0x66;
    data[3]=(uint8_t)0xd0;
    data[4]=(uint8_t)0xc7;
    data[5]=(uint8_t)0x4b;
    data[6]=(uint8_t)0xc6;
    data[7]=(uint8_t)0xb7;
    data[8]=(uint8_t)0x1b;
    data[9]=(uint8_t)0x0d;
    data[10]=(uint8_t)0xc0;
    data[11]=(uint8_t)0x56;
    data[12]=(uint8_t)0xb8;
    data[13]=(uint8_t)0xd7;
    data[14]=(uint8_t)0xd3;
    data[15]=(uint8_t)0x47;
    data[16]=(uint8_t)0xb4;
    data[17]=(uint8_t)0xe6;
    data[18]=(uint8_t)0x67;
    data[19]=(uint8_t)0x0e;
    data[20]=(uint8_t)0xb6;
    data[21]=(uint8_t)0x50;
    data[22]=(uint8_t)0x92;
    data[23]=(uint8_t)0x8c;
    data[24]=(uint8_t)0x22;
    data[25]=(uint8_t)0x5c;
    data[26]=(uint8_t)0x63;
    data[27]=(uint8_t)0x8b;
    data[28]=(uint8_t)0x07;
    data[29]=(uint8_t)0x09;
    data[30]=(uint8_t)0xf6;
    data[31]=(uint8_t)0xf1;
    data[32]=(uint8_t)0x64;
    data[33]=(uint8_t)0x8a;
    data[34]=(uint8_t)0x8b;
    data[35]=(uint8_t)0xf2;

    uint8_t input[40];
    memset(input,0,sizeof(input));
    input[0]=0x46;
    input[1]=0xc0;
    input[2]=0xac;
    input[3]=0xba;
    input[8]=0x4c;
    input[9]=0x58;
    input[10]=0x67;
    input[11]=0x5d;
    input[0x10]=0x41;
    input[0x11]=0xac;
    input[0x12]=0xb3;
    input[0x13]=0x2e;
    input[0x18]=0x47;
    input[0x19]=0xd6;
    input[0x1a]=0x59;
    input[0x1b]=0x97;
    input[0x20]=0x7b;
    input[0x21]=0xeb;
    input[0x22]=0xac;
    input[0x23]=0xcb;

    std::cout<<check(input,0x24,0xbaceb00c);

}

