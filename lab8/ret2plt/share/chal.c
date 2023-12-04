//gcc -no-pie -fno-stack-protector -z norelro ret2plt.c -o ret2plt
#include <stdio.h>
#include <stdlib.h>

int main(){
	char buf[20];
	setvbuf(stdout,0,2,0);
	printf("Try your best :");
	gets(buf);
	puts("boom !");	
}
