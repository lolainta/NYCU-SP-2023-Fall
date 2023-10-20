mov eax, dword [rsp]
add eax, dword [rsp+4]
mov ebx, dword [rsp]
sub ebx, dword [rsp+4]
mov ecx, dword [rsp+8]
neg ecx
mov edx, dword [rsp]
imul edx, 9
add edx, 7