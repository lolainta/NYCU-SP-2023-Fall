#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>

char flag[0x30];

int main(void)
{
	setvbuf(stdin, 0, _IONBF, 0);
	setvbuf(stdout, 0, _IONBF, 0);
	int fd = open("/home/chal/flag.txt", O_RDONLY);
	read(fd, flag, 0x30);
	close(fd);
	char buf[0x100];
	read(0, buf, 0x100);
	printf(buf);
	read(0, buf, 0x100);
	printf(buf);
	return 0;
}
