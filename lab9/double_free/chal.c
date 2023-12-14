#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

struct note {
  char *content;
  unsigned long len;
};

struct note notes[0x10];

int read_int() {
  char buf[0x20];
  read(0, buf, 0x1f);
  return atoi(buf);
}

unsigned long read_ul() {
  char buf[0x20];
  read(0, buf, 0x1f);
  return strtoul(buf, NULL, 10);
}

int get_idx() {
  int idx = read_int();
  if (idx >= 0x10 || idx < 1) exit(0);
  return idx;
}

void add_note() {
  int idx;
  printf("Index: ");
  idx = get_idx();
  printf("Length: ");
  notes[idx].len = read_ul();
  notes[idx].content = malloc(notes[idx].len);
  puts("Add done");
}

void read_note() {
  int idx;
  printf("Index: ");
  idx = get_idx();
  printf("Note[%d]:\n", idx);
  write(1, notes[idx].content, notes[idx].len);
}

void write_note() {
  int idx;
  printf("Index: ");
  idx = get_idx();
  printf("Content: ");
  read(0, notes[idx].content, notes[idx].len);
}

void delete_note() {
  int idx;
  printf("Index: ");
  idx = get_idx();
  free(notes[idx].content);
  puts("Delete done");
}

void memu() {
  puts("1. add note");
  puts("2. read note");
  puts("3. write note");
  puts("4. delete note");
  printf("choice: ");
}

int main(void) {
  setvbuf(stdin, 0, 2, 0);
  setvbuf(stdout, 0, 2, 0);
  int fd = open("./flag.txt", O_RDONLY);
  notes[0].len = 0x30;
  notes[0].content = malloc(0x30);
  read(fd, notes[0].content, 0x30);
  close(fd);

  for (;;) {
    memu();
    int choice = read_int();
    switch (choice) {
      case 1:
        add_note();
        break;
      case 2:
        read_note();
        break;
      case 3:
        write_note();
        break;
      case 4:
        delete_note();
        break;
      default:
        puts("Invalid command");
    }
  }
  return 0;
}
