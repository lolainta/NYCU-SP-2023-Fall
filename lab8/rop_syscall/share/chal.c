#include <stdio.h>

char *QQ = "QQ I don't have code to execve /bin/sh";

int main(void)
{
	setvbuf(stdin, 0, _IONBF, 0);
	setvbuf(stdout, 0, _IONBF, 0);
	puts(QQ);
	printf("> ");
	char buf[0x10];
	gets(buf);
	return 0;
}
