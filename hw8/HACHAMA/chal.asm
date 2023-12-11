
share/chal:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 42 2f 00 00    	push   QWORD PTR [rip+0x2f42]        # 3f68 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 43 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f43]        # 3f70 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64
    1044:	68 01 00 00 00       	push   0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64
    1054:	68 02 00 00 00       	push   0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64
    1064:	68 03 00 00 00       	push   0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64
    1074:	68 04 00 00 00       	push   0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64
    1084:	68 05 00 00 00       	push   0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmp 1020 <_init+0x20>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64
    1094:	68 06 00 00 00       	push   0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmp 1020 <_init+0x20>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	68 07 00 00 00       	push   0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64
    10b4:	68 08 00 00 00       	push   0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64
    10c4:	68 09 00 00 00       	push   0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64
    10d4:	68 0a 00 00 00       	push   0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	68 0b 00 00 00       	push   0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10ef:	90                   	nop

Disassembly of section .plt.got:

00000000000010f0 <__cxa_finalize@plt>:
    10f0:	f3 0f 1e fa          	endbr64
    10f4:	f2 ff 25 fd 2e 00 00 	bnd jmp QWORD PTR [rip+0x2efd]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001100 <strcpy@plt>:
    1100:	f3 0f 1e fa          	endbr64
    1104:	f2 ff 25 6d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e6d]        # 3f78 <strcpy@GLIBC_2.2.5>
    110b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001110 <puts@plt>:
    1110:	f3 0f 1e fa          	endbr64
    1114:	f2 ff 25 65 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e65]        # 3f80 <puts@GLIBC_2.2.5>
    111b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001120 <write@plt>:
    1120:	f3 0f 1e fa          	endbr64
    1124:	f2 ff 25 5d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e5d]        # 3f88 <write@GLIBC_2.2.5>
    112b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001130 <strlen@plt>:
    1130:	f3 0f 1e fa          	endbr64
    1134:	f2 ff 25 55 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e55]        # 3f90 <strlen@GLIBC_2.2.5>
    113b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001140 <__stack_chk_fail@plt>:
    1140:	f3 0f 1e fa          	endbr64
    1144:	f2 ff 25 4d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e4d]        # 3f98 <__stack_chk_fail@GLIBC_2.4>
    114b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001150 <printf@plt>:
    1150:	f3 0f 1e fa          	endbr64
    1154:	f2 ff 25 45 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e45]        # 3fa0 <printf@GLIBC_2.2.5>
    115b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001160 <read@plt>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	f2 ff 25 3d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e3d]        # 3fa8 <read@GLIBC_2.2.5>
    116b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001170 <strcmp@plt>:
    1170:	f3 0f 1e fa          	endbr64
    1174:	f2 ff 25 35 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e35]        # 3fb0 <strcmp@GLIBC_2.2.5>
    117b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001180 <prctl@plt>:
    1180:	f3 0f 1e fa          	endbr64
    1184:	f2 ff 25 2d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e2d]        # 3fb8 <prctl@GLIBC_2.2.5>
    118b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001190 <setvbuf@plt>:
    1190:	f3 0f 1e fa          	endbr64
    1194:	f2 ff 25 25 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e25]        # 3fc0 <setvbuf@GLIBC_2.2.5>
    119b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011a0 <perror@plt>:
    11a0:	f3 0f 1e fa          	endbr64
    11a4:	f2 ff 25 1d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e1d]        # 3fc8 <perror@GLIBC_2.2.5>
    11ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011b0 <exit@plt>:
    11b0:	f3 0f 1e fa          	endbr64
    11b4:	f2 ff 25 15 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e15]        # 3fd0 <exit@GLIBC_2.2.5>
    11bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000000011c0 <_start>:
    11c0:	f3 0f 1e fa          	endbr64
    11c4:	31 ed                	xor    ebp,ebp
    11c6:	49 89 d1             	mov    r9,rdx
    11c9:	5e                   	pop    rsi
    11ca:	48 89 e2             	mov    rdx,rsp
    11cd:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    11d1:	50                   	push   rax
    11d2:	54                   	push   rsp
    11d3:	45 31 c0             	xor    r8d,r8d
    11d6:	31 c9                	xor    ecx,ecx
    11d8:	48 8d 3d 52 01 00 00 	lea    rdi,[rip+0x152]        # 1331 <main>
    11df:	ff 15 f3 2d 00 00    	call   QWORD PTR [rip+0x2df3]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    11e5:	f4                   	hlt
    11e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    11ed:	00 00 00 

00000000000011f0 <deregister_tm_clones>:
    11f0:	48 8d 3d 29 2f 00 00 	lea    rdi,[rip+0x2f29]        # 4120 <stdout@GLIBC_2.2.5>
    11f7:	48 8d 05 22 2f 00 00 	lea    rax,[rip+0x2f22]        # 4120 <stdout@GLIBC_2.2.5>
    11fe:	48 39 f8             	cmp    rax,rdi
    1201:	74 15                	je     1218 <deregister_tm_clones+0x28>
    1203:	48 8b 05 d6 2d 00 00 	mov    rax,QWORD PTR [rip+0x2dd6]        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    120a:	48 85 c0             	test   rax,rax
    120d:	74 09                	je     1218 <deregister_tm_clones+0x28>
    120f:	ff e0                	jmp    rax
    1211:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1218:	c3                   	ret
    1219:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001220 <register_tm_clones>:
    1220:	48 8d 3d f9 2e 00 00 	lea    rdi,[rip+0x2ef9]        # 4120 <stdout@GLIBC_2.2.5>
    1227:	48 8d 35 f2 2e 00 00 	lea    rsi,[rip+0x2ef2]        # 4120 <stdout@GLIBC_2.2.5>
    122e:	48 29 fe             	sub    rsi,rdi
    1231:	48 89 f0             	mov    rax,rsi
    1234:	48 c1 ee 3f          	shr    rsi,0x3f
    1238:	48 c1 f8 03          	sar    rax,0x3
    123c:	48 01 c6             	add    rsi,rax
    123f:	48 d1 fe             	sar    rsi,1
    1242:	74 14                	je     1258 <register_tm_clones+0x38>
    1244:	48 8b 05 a5 2d 00 00 	mov    rax,QWORD PTR [rip+0x2da5]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    124b:	48 85 c0             	test   rax,rax
    124e:	74 08                	je     1258 <register_tm_clones+0x38>
    1250:	ff e0                	jmp    rax
    1252:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1258:	c3                   	ret
    1259:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001260 <__do_global_dtors_aux>:
    1260:	f3 0f 1e fa          	endbr64
    1264:	80 3d cd 2e 00 00 00 	cmp    BYTE PTR [rip+0x2ecd],0x0        # 4138 <completed.0>
    126b:	75 2b                	jne    1298 <__do_global_dtors_aux+0x38>
    126d:	55                   	push   rbp
    126e:	48 83 3d 82 2d 00 00 	cmp    QWORD PTR [rip+0x2d82],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1275:	00 
    1276:	48 89 e5             	mov    rbp,rsp
    1279:	74 0c                	je     1287 <__do_global_dtors_aux+0x27>
    127b:	48 8b 3d 86 2d 00 00 	mov    rdi,QWORD PTR [rip+0x2d86]        # 4008 <__dso_handle>
    1282:	e8 69 fe ff ff       	call   10f0 <__cxa_finalize@plt>
    1287:	e8 64 ff ff ff       	call   11f0 <deregister_tm_clones>
    128c:	c6 05 a5 2e 00 00 01 	mov    BYTE PTR [rip+0x2ea5],0x1        # 4138 <completed.0>
    1293:	5d                   	pop    rbp
    1294:	c3                   	ret
    1295:	0f 1f 00             	nop    DWORD PTR [rax]
    1298:	c3                   	ret
    1299:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000012a0 <frame_dummy>:
    12a0:	f3 0f 1e fa          	endbr64
    12a4:	e9 77 ff ff ff       	jmp    1220 <register_tm_clones>

00000000000012a9 <apply_seccomp>:
    12a9:	f3 0f 1e fa          	endbr64
    12ad:	55                   	push   rbp
    12ae:	48 89 e5             	mov    rbp,rsp
    12b1:	41 b8 00 00 00 00    	mov    r8d,0x0
    12b7:	b9 00 00 00 00       	mov    ecx,0x0
    12bc:	ba 00 00 00 00       	mov    edx,0x0
    12c1:	be 01 00 00 00       	mov    esi,0x1
    12c6:	bf 26 00 00 00       	mov    edi,0x26
    12cb:	b8 00 00 00 00       	mov    eax,0x0
    12d0:	e8 ab fe ff ff       	call   1180 <prctl@plt>
    12d5:	85 c0                	test   eax,eax
    12d7:	74 19                	je     12f2 <apply_seccomp+0x49>
    12d9:	48 8d 05 24 0d 00 00 	lea    rax,[rip+0xd24]        # 2004 <_IO_stdin_used+0x4>
    12e0:	48 89 c7             	mov    rdi,rax
    12e3:	e8 b8 fe ff ff       	call   11a0 <perror@plt>
    12e8:	bf 01 00 00 00       	mov    edi,0x1
    12ed:	e8 be fe ff ff       	call   11b0 <exit@plt>
    12f2:	48 8d 05 17 2e 00 00 	lea    rax,[rip+0x2e17]        # 4110 <filterprog>
    12f9:	48 89 c2             	mov    rdx,rax
    12fc:	be 02 00 00 00       	mov    esi,0x2
    1301:	bf 16 00 00 00       	mov    edi,0x16
    1306:	b8 00 00 00 00       	mov    eax,0x0
    130b:	e8 70 fe ff ff       	call   1180 <prctl@plt>
    1310:	83 f8 ff             	cmp    eax,0xffffffff
    1313:	75 19                	jne    132e <apply_seccomp+0x85>
    1315:	48 8d 05 e8 0c 00 00 	lea    rax,[rip+0xce8]        # 2004 <_IO_stdin_used+0x4>
    131c:	48 89 c7             	mov    rdi,rax
    131f:	e8 7c fe ff ff       	call   11a0 <perror@plt>
    1324:	bf 01 00 00 00       	mov    edi,0x1
    1329:	e8 82 fe ff ff       	call   11b0 <exit@plt>
    132e:	90                   	nop
    132f:	5d                   	pop    rbp
    1330:	c3                   	ret

0000000000001331 <main>:
    1331:	f3 0f 1e fa          	endbr64
    1335:	55                   	push   rbp
    1336:	48 89 e5             	mov    rbp,rsp
    1339:	48 83 ec 60          	sub    rsp,0x60
    133d:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1344:	00 00 
    1346:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    134a:	31 c0                	xor    eax,eax
    134c:	48 8b 05 dd 2d 00 00 	mov    rax,QWORD PTR [rip+0x2ddd]        # 4130 <stdin@GLIBC_2.2.5>
    1353:	b9 00 00 00 00       	mov    ecx,0x0
    1358:	ba 02 00 00 00       	mov    edx,0x2
    135d:	be 00 00 00 00       	mov    esi,0x0
    1362:	48 89 c7             	mov    rdi,rax
    1365:	e8 26 fe ff ff       	call   1190 <setvbuf@plt>
    136a:	48 8b 05 af 2d 00 00 	mov    rax,QWORD PTR [rip+0x2daf]        # 4120 <stdout@GLIBC_2.2.5>
    1371:	b9 00 00 00 00       	mov    ecx,0x0
    1376:	ba 02 00 00 00       	mov    edx,0x2
    137b:	be 00 00 00 00       	mov    esi,0x0
    1380:	48 89 c7             	mov    rdi,rax
    1383:	e8 08 fe ff ff       	call   1190 <setvbuf@plt>
    1388:	b8 00 00 00 00       	mov    eax,0x0
    138d:	e8 17 ff ff ff       	call   12a9 <apply_seccomp>
    1392:	48 c7 05 e3 2d 00 00 	mov    QWORD PTR [rip+0x2de3],0x30        # 4180 <n2>
    1399:	30 00 00 00 
    139d:	48 c7 05 98 2d 00 00 	mov    QWORD PTR [rip+0x2d98],0x14        # 4140 <n>
    13a4:	14 00 00 00 
    13a8:	48 8d 05 63 0c 00 00 	lea    rax,[rip+0xc63]        # 2012 <_IO_stdin_used+0x12>
    13af:	48 89 c7             	mov    rdi,rax
    13b2:	b8 00 00 00 00       	mov    eax,0x0
    13b7:	e8 94 fd ff ff       	call   1150 <printf@plt>
    13bc:	48 8b 05 7d 2d 00 00 	mov    rax,QWORD PTR [rip+0x2d7d]        # 4140 <n>
    13c3:	48 89 c2             	mov    rdx,rax
    13c6:	48 8d 45 a0          	lea    rax,[rbp-0x60]
    13ca:	48 89 c6             	mov    rsi,rax
    13cd:	bf 00 00 00 00       	mov    edi,0x0
    13d2:	e8 89 fd ff ff       	call   1160 <read@plt>
    13d7:	48 89 05 62 2d 00 00 	mov    QWORD PTR [rip+0x2d62],rax        # 4140 <n>
    13de:	48 8b 05 5b 2d 00 00 	mov    rax,QWORD PTR [rip+0x2d5b]        # 4140 <n>
    13e5:	c6 44 05 a0 00       	mov    BYTE PTR [rbp+rax*1-0x60],0x0
    13ea:	48 8d 45 a0          	lea    rax,[rbp-0x60]
    13ee:	48 89 c6             	mov    rsi,rax
    13f1:	48 8d 05 68 2d 00 00 	lea    rax,[rip+0x2d68]        # 4160 <msg>
    13f8:	48 89 c7             	mov    rdi,rax
    13fb:	e8 00 fd ff ff       	call   1100 <strcpy@plt>
    1400:	48 8d 05 59 2d 00 00 	lea    rax,[rip+0x2d59]        # 4160 <msg>
    1407:	48 89 c7             	mov    rdi,rax
    140a:	e8 21 fd ff ff       	call   1130 <strlen@plt>
    140f:	48 89 c2             	mov    rdx,rax
    1412:	48 8d 05 47 2d 00 00 	lea    rax,[rip+0x2d47]        # 4160 <msg>
    1419:	48 01 d0             	add    rax,rdx
    141c:	48 b9 20 68 61 63 68 	movabs rcx,0x616d616863616820
    1423:	61 6d 61 
    1426:	48 89 08             	mov    QWORD PTR [rax],rcx
    1429:	c7 40 08 63 68 61 6d 	mov    DWORD PTR [rax+0x8],0x6d616863
    1430:	66 c7 40 0c 61 00    	mov    WORD PTR [rax+0xc],0x61
    1436:	48 8d 05 23 2d 00 00 	lea    rax,[rip+0x2d23]        # 4160 <msg>
    143d:	48 89 c7             	mov    rdi,rax
    1440:	e8 cb fc ff ff       	call   1110 <puts@plt
    1445:	48 8d 05 d6 0b 00 00 	lea    rax,[rip+0xbd6]        # 2022 <_IO_stdin_used+0x22>
    144c:	48 89 c7             	mov    rdi,rax
    144f:	e8 bc fc ff ff       	call   1110 <puts@plt>
    1454:	48 8b 05 25 2d 00 00 	mov    rax,QWORD PTR [rip+0x2d25]        # 4180 <n2>
    145b:	48 89 c2             	mov    rdx,rax
    145e:	48 8d 45 c0          	lea    rax,[rbp-0x40]
    1462:	48 89 c6             	mov    rsi,rax
    1465:	bf 00 00 00 00       	mov    edi,0x0
    146a:	e8 f1 fc ff ff       	call   1160 <read@plt>
    146f:	48 8d 45 c0          	lea    rax,[rbp-0x40]
    1473:	48 8d 15 b6 0b 00 00 	lea    rdx,[rip+0xbb6]        # 2030 <_IO_stdin_used+0x30>
    147a:	48 89 d6             	mov    rsi,rdx
    147d:	48 89 c7             	mov    rdi,rax
    1480:	e8 eb fc ff ff       	call   1170 <strcmp@plt>
    1485:	85 c0                	test   eax,eax
    1487:	75 1d                	jne    14a6 <main+0x175>
    1489:	48 8b 05 f0 2c 00 00 	mov    rax,QWORD PTR [rip+0x2cf0]        # 4180 <n2>
    1490:	48 89 c2             	mov    rdx,rax
    1493:	48 8d 45 c0          	lea    rax,[rbp-0x40]
    1497:	48 89 c6             	mov    rsi,rax
    149a:	bf 01 00 00 00       	mov    edi,0x1
    149f:	e8 7c fc ff ff       	call   1120 <write@plt>
    14a4:	eb ae                	jmp    1454 <main+0x123>
    14a6:	90                   	nop
    14a7:	b8 00 00 00 00       	mov    eax,0x0
    14ac:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    14b0:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    14b7:	00 00 
    14b9:	74 05                	je     14c0 <main+0x18f>
    14bb:	e8 80 fc ff ff       	call   1140 <__stack_chk_fail@plt>
    14c0:	c9                   	leave
    14c1:	c3                   	ret

Disassembly of section .fini:

00000000000014c4 <_fini>:
    14c4:	f3 0f 1e fa          	endbr64
    14c8:	48 83 ec 08          	sub    rsp,0x8
    14cc:	48 83 c4 08          	add    rsp,0x8
    14d0:	c3                   	ret
