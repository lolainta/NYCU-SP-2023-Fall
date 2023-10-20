add dword [rsp], 0xdeadbeef
sub dword [rsp+0x4], 0xfaceb00c
mov esi, dword [rsp+0x8]
mov edi, dword [rsp+0xc]
mov dword [rsp+0x8], edi
mov dword [rsp+0xc], esi
add rax, 0x87
sub rbx, 0x63
mov rsi, rdx
mov rdx, rcx
mov rcx, rsi

