.PHONY: clean

# ANSI Color
RED = \033[38;5;1m
GREEN = \033[38;5;2m
YELLOW = \033[38;5;3m
BLUE = \033[38;5;4m
NC = \033[0m

# Function
define build_log
	@printf "${BLUE}[+]${NC} Building: ${1}\n"
endef

PROG := $(shell find . -name '*.asm')
PROG := $(basename $(PROG))

OUTDIR=./build

all: $(PROG)

%: %.o
	@ld -m elf_x86_64 -o $(OUTDIR)/$@ $< 2>/dev/null

%.o: %.asm
	$(call build_log,$<)
	yasm -f elf64 -g dwarf2 -DYASM -D__x86_64__ -DPIC $< -o $@

clean:
	rm -rf $(OUTDIR)/*
