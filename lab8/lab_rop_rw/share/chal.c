#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>

char flag[0x10];
long secret;
char empty_buf[0x30];

void check(char *input)
{
	char pass[0x10];
	char output[0x10];
	for (int i = 0; i < 2; ++i)
	{
		((long *)pass)[i] = ((long *)input)[i] ^ secret;
	}
	if (strcmp(pass, "kyoumokawaii") == 0)
	{
		for (int i = 0; i < 2; ++i)
			((long *)output)[i] = ((long *)flag)[i] ^ ((long *)pass)[i];
	}
	printf("flag = %s\n", output);
}

int main(void)
{
	setvbuf(stdin, 0, _IONBF, 0);
	setvbuf(stdout, 0, _IONBF, 0);
	int fd = 0;
	char buf[0x10];
	fd = open("/home/chal/flag.txt", O_RDONLY);
	read(fd, flag, 0x10);
	close(fd);

	fd = open("/dev/urandom", O_RDONLY);
	read(fd, &secret, sizeof(secret));
	for (int i = 0; i < 2; ++i)
		((long *)flag)[i] = ((long *)flag)[i] ^ secret;

	printf("secret = %lx\n", secret);
	printf("> ");
	gets(buf);

	return 0;
}
