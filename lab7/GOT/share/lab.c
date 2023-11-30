#include <stdio.h>
#include <sys/mman.h>
#include <unistd.h>
unsigned long long arr[1] = {1234};
int main()
{
    setvbuf(stdin, 0, _IONBF, 0);
    setvbuf(stdout, 0, _IONBF, 0);
    int index;
    printf("idx: ");
    scanf("%d", &index);
    printf("arr[%d] = %lu\n", index, arr[index]);
    printf("val: ");
    scanf("%lu", &arr[index]);
    printf("/bin/sh");
    return 0;
}
