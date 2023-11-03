mov eax, dword [rsp+0x0]
mov ebx, dword [rsp+0x4]
cmp eax, ebx
jge PA
mov eax, dword [rsp+0x4]
PA:
mov ecx, dword [rsp+0x8]
mov edx, dword [rsp+0xc]
mov ebx, ecx
cmp ecx, edx
jb PB
mov ebx, edx
PB:
mov edx, ecx
and edx, 0x1
jnz PC
imul ecx, 4
jmp final
PC:
sar ecx, 0x3
final: