#include <stdio.h>
#include <sys/mman.h>
#include <unistd.h>
int main()
{
    // char shellcode[0x1000];
    // mprotect(shellcode,0x1000,PROT_READ|PROT_WRITE|PROT_EXEC);
    char *shellcode = mmap(0, 0x1000, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
    // printf("%p\n",shellcode);
    // perror("");
    read(0, shellcode, 0x1000);
    for (int i = 0; i < 0x1000; i++)
    {
        if (shellcode[i] == 0x0f || shellcode[i] == 0x05)
        {
            shellcode[i] = 0;
        }
    }
    __asm__("jmp %0" ::"r"(shellcode));
    return 0;
}
