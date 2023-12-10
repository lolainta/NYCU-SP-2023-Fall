#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "SECCOMP.h"

long n;
char msg[0x20];
long n2;

struct sock_filter seccompfilter[]={
	BPF_STMT(BPF_LD | BPF_W | BPF_ABS, ArchField),
	BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, AUDIT_ARCH_X86_64, 1, 0),
	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
	BPF_STMT(BPF_LD | BPF_W | BPF_ABS, SyscallNum),
	Allow(open),
	Allow(openat),
	Allow(read),
	Allow(write),
	Allow(close),
	Allow(readlink),
	Allow(getdents),
	Allow(getrandom),
	Allow(brk),
	Allow(rt_sigreturn),
	Allow(exit),
	Allow(exit_group),
	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
};

struct sock_fprog filterprog={
	.len=sizeof(seccompfilter)/sizeof(struct sock_filter),
	.filter=seccompfilter
};

void apply_seccomp(){
	if(prctl(PR_SET_NO_NEW_PRIVS,1,0,0,0)){
		perror("Seccomp Error");
		exit(1);
	}
	if(prctl(PR_SET_SECCOMP,SECCOMP_MODE_FILTER,&filterprog)==-1){
		perror("Seccomp Error");
		exit(1);
	}
	return;
}

int main(void)
{
	setvbuf(stdin, 0, 2, 0);
	setvbuf(stdout, 0, 2, 0);
	apply_seccomp();
	char buf2[0x30];
	// long n2 = 0x30;
	// char msg[0x20];
	char name[0x20];
	// long n = 20;
	n2 = 0x30;
	n = 20;
	printf("Haaton's name? ");
	n = read(0, name, n);
	name[n] = 0;
	strcpy(msg, name);
	strcat(msg, " hachamachama");
	puts(msg);
	puts("ECHO HACHAMA!");
	while (1)
	{
		read(0, buf2, n2);
		if (strcmp(buf2, "HACHAMA") == 0)
			write(1, buf2, n2);
		else
			break;
	}
	return 0;
}
