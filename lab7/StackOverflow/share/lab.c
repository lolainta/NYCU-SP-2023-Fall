#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
void win()
{
    system("/bin/sh");
}

int main()
{
    setvbuf(stdin, 0, _IONBF, 0);
    setvbuf(stdout, 0, _IONBF, 0);
    char buf[8];
    printf("Gift: %p\n", win);
    printf("Gift2: ");
    write(1, buf, 32);
    read(0, buf, 32);
    return 0;
}