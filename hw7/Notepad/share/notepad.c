#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <time.h>
#include <arpa/inet.h>
#include <limits.h>
#include "SECCOMP.h"

#define USERNAME_LEN 0x10
#define PASSWORD_LEN 0x10

#define CMD_Register 0x1
#define CMD_Login 0x2
#define CMD_GetFolder 0x11
#define CMD_NewNote 0x12
#define CMD_Flag 0x8787

#define RES_Success 0x0
#define RES_Failed 0x1
#define RES_NotFound 0x2

struct sock_filter seccompfilter[]={
  BPF_STMT(BPF_LD | BPF_W | BPF_ABS, ArchField),
  BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, AUDIT_ARCH_X86_64, 1, 0),
  BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
  BPF_STMT(BPF_LD | BPF_W | BPF_ABS, SyscallNum),
  Allow(open),
  Allow(openat),
  Allow(lseek),
  Allow(read),
  Allow(write),
  Allow(socket),
  Allow(connect),
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

struct Command
{
    __uint32_t cmd;
    u_char token[32];
    u_char args[128];
};

struct Response
{
    __uint32_t code;
    u_char res[256];
};

char *Token;

void errorexit(char *msg)
{
    puts(msg);
    exit(-1);
}

int connect_backend()
{
    int fd = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in info;
    bzero(&info, sizeof(info));
    info.sin_family = PF_INET;
    info.sin_addr.s_addr = inet_addr("127.0.0.1");
    info.sin_port = htons(8765);
    if(connect(fd, (struct sockaddr *)&info, sizeof(info))==-1){
        return -1;
    }
    return fd;
}

void command_login(int fd, char *username, char *password)
{
    if(strlen(username)>=USERNAME_LEN || strlen(password)>=PASSWORD_LEN){
        errorexit("Username or Password too long.");
        return ;
    }
    struct Command cmd;
    memset(&cmd, 0, sizeof(cmd));
    cmd.cmd = CMD_Login;
    strcpy(cmd.args, username);
    strcpy(&cmd.args[strlen(cmd.args)+1], password);
    write(fd, &cmd, sizeof(cmd));
    struct Response res;
    memset(&res, 0, sizeof(res));
    if(read(fd, &res, sizeof(res))!=sizeof(res)){
        errorexit("Error while recv backend response.");
    }
    if(res.code==RES_Success){
        Token = strdup(res.res);
        puts("Login Success!");
    }
    else{
        Token = 0;
        puts("Login Failed!");
    }
}

void command_register(int fd, char *username, char *password)
{
    if(strlen(username)>=USERNAME_LEN || strlen(password)>=PASSWORD_LEN){
        puts("Username or Password too long.");
        return ;
    }
    struct Command cmd;
    memset(&cmd, 0, sizeof(cmd));
    cmd.cmd = CMD_Register;
    strcpy(cmd.args, username);
    strcpy(&cmd.args[strlen(cmd.args)+1], password);
    write(fd, &cmd, sizeof(cmd));
    struct Response res;
    memset(&res, 0, sizeof(res));
    if(read(fd, &res, sizeof(res))!=sizeof(res)){
        puts("Error while recv backend response.");
        return ;
    }
    if(res.code==RES_Success){
        puts("Register Success!");
    }
    else{
        puts("Register Failed!");
    }
}

void command_newnote(int fd, char *notename, char *content)
{
    if(!Token)
    {
        puts("Please login first.");
        return ;
    }
    struct Command cmd;
    memset(&cmd, 0, sizeof(cmd));
    struct Response res;
    memset(&res, 0, sizeof(res));
    cmd.cmd = CMD_NewNote;
    strcpy(cmd.token, Token);
    strncpy(cmd.args, notename, sizeof(cmd.args));
    write(fd, &cmd, sizeof(cmd));
    if(read(fd, &res, sizeof(res))!=sizeof(res)){
        puts("Error while recv backend response.");
        return ;
    }
    if(res.code!=RES_Success){
        puts("Note create failed.");
        return ;
    }
    //puts("Backend has created the note file.");
    int newfile_fd = open(res.res, O_RDWR);
    if(newfile_fd<0){
        puts("Note create failed.");
        return ;
    }
    write(newfile_fd, content, strlen(content));
    close(newfile_fd);
    puts("Note created!");
}

int openfile(int fd, char *notename, off_t offset, int oflag)
{
    if(!Token)
    {
        puts("Please login first.");
        return -1;
    }
    struct Command cmd;
    memset(&cmd, 0, sizeof(cmd));
    struct Response res;
    memset(&res, 0, sizeof(res));
    cmd.cmd = CMD_GetFolder;
    strcpy(cmd.token, Token);
    write(fd, &cmd, sizeof(cmd));
    if(read(fd, &res, sizeof(res))!=sizeof(res)){
        puts("Error while recv backend response.");
        return -1;
    }
    if(res.code!=RES_Success){
        puts("Couldn't get note storage path.");
        return -1;
    }
    char path[128];
    //strcpy(path, res.res);
    snprintf(path, sizeof(path), "%s%s.txt",res.res, notename);
    //char rpath[128];
    //realpath(path, rpath);
    //puts(rpath);
    int filefd = open(path, oflag);
    if(filefd < 0){
        puts("Couldn't open the file.");
        return -1;
    }
    lseek(filefd, offset, SEEK_SET);
    return filefd;
}

void command_editnote(int fd, char *notename, off_t offset, char *content)
{
    
    int filefd = openfile(fd, notename, offset, O_RDWR);
    write(filefd, content, strlen(content));
    close(filefd);
    puts("Note modified.");
}

void command_shownote(int fd, char *notename, off_t offset)
{
    int filefd = openfile(fd, notename, offset, O_RDONLY);
    char buf[128];
    ssize_t readlen = read(filefd, buf, sizeof(buf));
    if(readlen<=0){
        puts("Read note failed.");
        return ;
    }
    write(1, buf, readlen);
}

void menu()
{
    puts("+==========      Notepad       ==========+");
    puts("| 1. Login                               |");
    puts("| 2. Register                            |");
    puts("| 3. New Note                            |");
    puts("| 4. Edit Note                           |");
    puts("| 5. Show Note                           |");
    puts("+========================================+");
    printf("> ");
}

long readint()
{
    char buf[32];
    for(int i=0;i<31;i++){
        if(read(0, &buf[i], 1)!=1){
            break;
        }
        if(buf[i]=='\n'){
            buf[i] = 0;
            break;
        }
    }
    return atol(buf);
}

size_t readlen(char *buf, size_t len)
{
    size_t i=0;
    for(;i<len;i++){
        if(read(0, &buf[i], 1)!=1) break;
        if(buf[i]=='\n') buf[i] = 0;
    }
    return i;
}

int main()
{
    setvbuf(stdin, 0, _IONBF, 0);
    setvbuf(stdout, 0, _IONBF, 0);
    apply_seccomp();
    char username[0x20];
    char password[0x20];
    char notename[256];
    char *content;
    size_t clen;
    off_t offset;
    while(1){
        menu();
        int choice = readint();
        int backendfd = connect_backend();
        if(backendfd<=0)errorexit("Couldn't connect to backend.");
        switch(choice){
            case 1:
                printf("Username: ");
                read(0, username, 0x10);
                printf("Password: ");
                read(0, password, 0x10);
                command_login(backendfd, username, password);
                break;
            case 2:
                printf("Username: ");
                read(0, username, 0x10);
                printf("Password: ");
                read(0, password, 0x10);
                command_register(backendfd, username, password);
                break;
            case 3:
                printf("Note Name: ");
                read(0, notename, 128);
                if(strlen(notename) && notename[strlen(notename)-1]=='\n')
                    notename[strlen(notename)-1] = 0;
                printf("Content Length: ");
                clen = (size_t)readint();
                if(clen > 1024){
                    puts("Too Long");
                    break;
                }
                content = malloc(clen+1);
                printf("Content: ");
                readlen(content, clen);
                command_newnote(backendfd, notename, content);
                break;
            case 4:
                printf("Note Name: ");
                read(0, notename, 128);
                if(strlen(notename) && notename[strlen(notename)-1]=='\n')
                    notename[strlen(notename)-1] = 0;
                printf("Offset: ");
                offset = (off_t)readint();
                printf("Content Length: ");
                clen = (size_t)readint();
                if(clen > 1024){
                    puts("Too Long");
                    break;
                }
                content = malloc(clen+1);
                printf("Content: ");
                readlen(content, clen);
                command_editnote(backendfd, notename, offset, content);
                break;
            case 5:
                printf("Note Name: ");
                read(0, notename, 128);
                if(strlen(notename) && notename[strlen(notename)-1]=='\n')
                    notename[strlen(notename)-1] = 0;
                printf("Offset: ");
                offset = (off_t)readint();
                command_shownote(backendfd, notename, offset);
                break;
            default:
                break;
        }
        close(backendfd);
    }
    return 0;
}