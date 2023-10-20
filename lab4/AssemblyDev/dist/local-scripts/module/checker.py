#!/usr/bin/python

from unicorn import *
from unicorn.x86_const import *
from keystone import *

BASE_ADDRESS = 0x1000000
DATA_ADDRESS = 0x4000000
STACK_ADDRESS = 0x7000000
RSP_DEFAULT = STACK_ADDRESS + 1024 * 1024

DEFAULT_SIZE = 8  # qword


class C:
    RED = '\033[38;5;1m'
    GREEN = '\033[38;5;2m'
    YELLOW = '\033[38;5;3m'
    BLUE = '\033[38;5;4m'
    NC = '\033[0m'


class Checker:
    def __init__(self, init_list, ans_list, code) -> None:

        # Assemble
        self.CODE = self._asm(code)

        # Init memory
        self.mu = self._mu_init()
        for el in init_list:
            self._set_data(*el)
        print(f"{C.BLUE}[ Initial Context ]{C.NC}")
        self._show_context()
        print()

        # Emulate
        self.mu.emu_start(BASE_ADDRESS, BASE_ADDRESS + len(self.CODE))
        print(f"{C.BLUE}[ Final Context ]{C.NC}")
        self._show_context()

        # Check
        self._show_header("Result")
        if self._check(ans_list):
            print(f"{C.GREEN}[+] CORRECT :){C.NC}")
        else:
            print(f"{C.RED}[+] WRONG :({C.NC}")
        print()

    def _mu_init(self):
        try:
            mu = Uc(UC_ARCH_X86, UC_MODE_64)
            mu.mem_map(BASE_ADDRESS, 2 * 1024 * 1024)
            mu.mem_map(DATA_ADDRESS, 2 * 1024 * 1024)
            mu.mem_map(STACK_ADDRESS, 2 * 1024 * 1024)

            # set rsp
            mu.reg_write(UC_X86_REG_RSP, RSP_DEFAULT)

            mu.mem_write(BASE_ADDRESS, self.CODE)

            return mu

        except UcError as e:
            print("ERROR: %s" % e)

    def _check(self, ans_list):
        correct = True
        for ans in ans_list:  # [(expr, ans_val, size)]
            size = DEFAULT_SIZE if len(ans) == 2 else ans[2]
            val = self._get_data(ans[0], size)
            msg = "%s = 0x%x" % (self._expr_str(ans[0]), ans[1])
            if ans[1] != val:
                print(f"{C.RED}[X]{C.NC} {msg} (Your result: {hex(val)})")
                correct = False
                continue
            print(f"{C.GREEN}[O]{C.NC} {msg}")
        return correct

    def _asm(self, code):
        try:
            ks = Ks(KS_ARCH_X86, KS_MODE_64)
            ks.syntax = KS_OPT_SYNTAX_NASM

            code = bytes(ks.asm(code)[0])
            return code
        except KsError as e:
            print(f"{C.RED}[-]{C.NC} _asm error (KsError): %s" % e)
            exit(1)
        except Exception as e:
            print(f"{C.RED}[-]{C.NC} _asm error: %s" % e)
            exit(1)

    def _get_data(self, expr, size=DEFAULT_SIZE):
        if self._is_number(expr):  # get 8 bytes from memory
            temp = self.mu.mem_read(expr, size)
            return int.from_bytes(temp, 'little')
        else:  # register
            return self.mu.reg_read(eval("UC_X86_REG_{}".format(expr.upper())))

    def _set_data(self, expr, val, size=DEFAULT_SIZE):
        if self._is_number(expr):  # set `size` bytes to memory
            self.mu.mem_write(expr, int.to_bytes(val, size, 'little'))
        else:  # register
            self.mu.reg_write(eval("UC_X86_REG_{}".format(expr.upper())), val)

    def _expr_str(self, expr):
        if self._is_number(expr):
            return "[0x07%x]" % expr
        else:  # register
            return "$%-3s" % expr

    def _is_number(self, expr) -> bool:
        return type(expr) == int

    def _show_context(self):
        # register
        self._show_header("register")
        reg_list = ["rax", "rbx", "rcx", "rdx", "rdi", "rsi", "rbp", "rsp"]
        for reg in reg_list:
            print(f"{C.RED}$%-3s{C.NC}: 0x%016x" % (reg, self._get_data(reg)))

        # memory
        '''
        self._show_header("memory")
        for i in range(4):
            addr = DATA_ADDRESS + DEFAULT_SIZE * i
            val = self._get_data(addr)
            print(f"{C.BLUE}0x%07x{C.NC}|+0x%04x: 0x%016x" % (addr, DEFAULT_SIZE * i, val))
        '''

        # stack
        self._show_header("stack")
        stack_top_addr = self._get_data("rsp")
        for i in range(8):
            addr = stack_top_addr + DEFAULT_SIZE * i
            val = self._get_data(addr)
            print(f"{C.BLUE}0x%07x{C.NC}|+0x%04x: 0x%016x" %
                  (addr, DEFAULT_SIZE * i, val), f"{C.BLUE}    ← $rsp{C.NC}" if i == 0 else "")

    def _show_header(self, title: str):
        print(f"\n──── {C.YELLOW}{title}{C.NC} ".ljust(80, "─"))
