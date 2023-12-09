#include <stdio.h>
#include <unistd.h>

int main(void)
{
	char buf[0x20];
	read(0, buf, 0x80);
	return 0;
}
