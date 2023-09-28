#include<stdio.h>
void sleep(int x){
    FILE*fptr;
    fptr=fopen("flag.txt","r");
    char flag[100];
    fgets(flag,100,fptr);
    printf("%s\n",flag);
}
