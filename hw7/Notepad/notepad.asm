
notepad:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fd9]        # 4fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 e2 3e 00 00    	push   QWORD PTR [rip+0x3ee2]        # 4f08 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 e3 3e 00 00 	bnd jmp QWORD PTR [rip+0x3ee3]        # 4f10 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    10f0:	f3 0f 1e fa          	endbr64
    10f4:	68 0c 00 00 00       	push   0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64
    1104:	68 0d 00 00 00       	push   0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmp 1020 <_init+0x20>
    110f:	90                   	nop
    1110:	f3 0f 1e fa          	endbr64
    1114:	68 0e 00 00 00       	push   0xe
    1119:	f2 e9 01 ff ff ff    	bnd jmp 1020 <_init+0x20>
    111f:	90                   	nop
    1120:	f3 0f 1e fa          	endbr64
    1124:	68 0f 00 00 00       	push   0xf
    1129:	f2 e9 f1 fe ff ff    	bnd jmp 1020 <_init+0x20>
    112f:	90                   	nop
    1130:	f3 0f 1e fa          	endbr64
    1134:	68 10 00 00 00       	push   0x10
    1139:	f2 e9 e1 fe ff ff    	bnd jmp 1020 <_init+0x20>
    113f:	90                   	nop
    1140:	f3 0f 1e fa          	endbr64
    1144:	68 11 00 00 00       	push   0x11
    1149:	f2 e9 d1 fe ff ff    	bnd jmp 1020 <_init+0x20>
    114f:	90                   	nop
    1150:	f3 0f 1e fa          	endbr64
    1154:	68 12 00 00 00       	push   0x12
    1159:	f2 e9 c1 fe ff ff    	bnd jmp 1020 <_init+0x20>
    115f:	90                   	nop
    1160:	f3 0f 1e fa          	endbr64
    1164:	68 13 00 00 00       	push   0x13
    1169:	f2 e9 b1 fe ff ff    	bnd jmp 1020 <_init+0x20>
    116f:	90                   	nop
    1170:	f3 0f 1e fa          	endbr64
    1174:	68 14 00 00 00       	push   0x14
    1179:	f2 e9 a1 fe ff ff    	bnd jmp 1020 <_init+0x20>
    117f:	90                   	nop
    1180:	f3 0f 1e fa          	endbr64
    1184:	68 15 00 00 00       	push   0x15
    1189:	f2 e9 91 fe ff ff    	bnd jmp 1020 <_init+0x20>
    118f:	90                   	nop
    1190:	f3 0f 1e fa          	endbr64
    1194:	68 16 00 00 00       	push   0x16
    1199:	f2 e9 81 fe ff ff    	bnd jmp 1020 <_init+0x20>
    119f:	90                   	nop
    11a0:	f3 0f 1e fa          	endbr64
    11a4:	68 17 00 00 00       	push   0x17
    11a9:	f2 e9 71 fe ff ff    	bnd jmp 1020 <_init+0x20>
    11af:	90                   	nop

Disassembly of section .plt.got:

00000000000011b0 <__cxa_finalize@plt>:
    11b0:	f3 0f 1e fa          	endbr64
    11b4:	f2 ff 25 3d 3e 00 00 	bnd jmp QWORD PTR [rip+0x3e3d]        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    11bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

00000000000011c0 <strncpy@plt>:
    11c0:	f3 0f 1e fa          	endbr64
    11c4:	f2 ff 25 4d 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d4d]        # 4f18 <strncpy@GLIBC_2.2.5>
    11cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011d0 <strcpy@plt>:
    11d0:	f3 0f 1e fa          	endbr64
    11d4:	f2 ff 25 45 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d45]        # 4f20 <strcpy@GLIBC_2.2.5>
    11db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011e0 <puts@plt>:
    11e0:	f3 0f 1e fa          	endbr64
    11e4:	f2 ff 25 3d 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d3d]        # 4f28 <puts@GLIBC_2.2.5>
    11eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011f0 <write@plt>:
    11f0:	f3 0f 1e fa          	endbr64
    11f4:	f2 ff 25 35 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d35]        # 4f30 <write@GLIBC_2.2.5>
    11fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001200 <strlen@plt>:
    1200:	f3 0f 1e fa          	endbr64
    1204:	f2 ff 25 2d 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d2d]        # 4f38 <strlen@GLIBC_2.2.5>
    120b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001210 <__stack_chk_fail@plt>:
    1210:	f3 0f 1e fa          	endbr64
    1214:	f2 ff 25 25 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d25]        # 4f40 <__stack_chk_fail@GLIBC_2.4>
    121b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001220 <htons@plt>:
    1220:	f3 0f 1e fa          	endbr64
    1224:	f2 ff 25 1d 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d1d]        # 4f48 <htons@GLIBC_2.2.5>
    122b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001230 <printf@plt>:
    1230:	f3 0f 1e fa          	endbr64
    1234:	f2 ff 25 15 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d15]        # 4f50 <printf@GLIBC_2.2.5>
    123b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001240 <snprintf@plt>:
    1240:	f3 0f 1e fa          	endbr64
    1244:	f2 ff 25 0d 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d0d]        # 4f58 <snprintf@GLIBC_2.2.5>
    124b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001250 <lseek@plt>:
    1250:	f3 0f 1e fa          	endbr64
    1254:	f2 ff 25 05 3d 00 00 	bnd jmp QWORD PTR [rip+0x3d05]        # 4f60 <lseek@GLIBC_2.2.5>
    125b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001260 <memset@plt>:
    1260:	f3 0f 1e fa          	endbr64
    1264:	f2 ff 25 fd 3c 00 00 	bnd jmp QWORD PTR [rip+0x3cfd]        # 4f68 <memset@GLIBC_2.2.5>
    126b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001270 <close@plt>:
    1270:	f3 0f 1e fa          	endbr64
    1274:	f2 ff 25 f5 3c 00 00 	bnd jmp QWORD PTR [rip+0x3cf5]        # 4f70 <close@GLIBC_2.2.5>
    127b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001280 <read@plt>:
    1280:	f3 0f 1e fa          	endbr64
    1284:	f2 ff 25 ed 3c 00 00 	bnd jmp QWORD PTR [rip+0x3ced]        # 4f78 <read@GLIBC_2.2.5>
    128b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001290 <inet_addr@plt>:
    1290:	f3 0f 1e fa          	endbr64
    1294:	f2 ff 25 e5 3c 00 00 	bnd jmp QWORD PTR [rip+0x3ce5]        # 4f80 <inet_addr@GLIBC_2.2.5>
    129b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000012a0 <prctl@plt>:
    12a0:	f3 0f 1e fa          	endbr64
    12a4:	f2 ff 25 dd 3c 00 00 	bnd jmp QWORD PTR [rip+0x3cdd]        # 4f88 <prctl@GLIBC_2.2.5>
    12ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000012b0 <malloc@plt>:
    12b0:	f3 0f 1e fa          	endbr64
    12b4:	f2 ff 25 d5 3c 00 00 	bnd jmp QWORD PTR [rip+0x3cd5]        # 4f90 <malloc@GLIBC_2.2.5>
    12bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000012c0 <setvbuf@plt>:
    12c0:	f3 0f 1e fa          	endbr64
    12c4:	f2 ff 25 cd 3c 00 00 	bnd jmp QWORD PTR [rip+0x3ccd]        # 4f98 <setvbuf@GLIBC_2.2.5>
    12cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000012d0 <atol@plt>:
    12d0:	f3 0f 1e fa          	endbr64
    12d4:	f2 ff 25 c5 3c 00 00 	bnd jmp QWORD PTR [rip+0x3cc5]        # 4fa0 <atol@GLIBC_2.2.5>
    12db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000012e0 <open@plt>:
    12e0:	f3 0f 1e fa          	endbr64
    12e4:	f2 ff 25 bd 3c 00 00 	bnd jmp QWORD PTR [rip+0x3cbd]        # 4fa8 <open@GLIBC_2.2.5>
    12eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000012f0 <perror@plt>:
    12f0:	f3 0f 1e fa          	endbr64
    12f4:	f2 ff 25 b5 3c 00 00 	bnd jmp QWORD PTR [rip+0x3cb5]        # 4fb0 <perror@GLIBC_2.2.5>
    12fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001300 <exit@plt>:
    1300:	f3 0f 1e fa          	endbr64
    1304:	f2 ff 25 ad 3c 00 00 	bnd jmp QWORD PTR [rip+0x3cad]        # 4fb8 <exit@GLIBC_2.2.5>
    130b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001310 <connect@plt>:
    1310:	f3 0f 1e fa          	endbr64
    1314:	f2 ff 25 a5 3c 00 00 	bnd jmp QWORD PTR [rip+0x3ca5]        # 4fc0 <connect@GLIBC_2.2.5>
    131b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001320 <strdup@plt>:
    1320:	f3 0f 1e fa          	endbr64
    1324:	f2 ff 25 9d 3c 00 00 	bnd jmp QWORD PTR [rip+0x3c9d]        # 4fc8 <strdup@GLIBC_2.2.5>
    132b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001330 <socket@plt>:
    1330:	f3 0f 1e fa          	endbr64
    1334:	f2 ff 25 95 3c 00 00 	bnd jmp QWORD PTR [rip+0x3c95]        # 4fd0 <socket@GLIBC_2.2.5>
    133b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001340 <_start>:
    1340:	f3 0f 1e fa          	endbr64
    1344:	31 ed                	xor    ebp,ebp
    1346:	49 89 d1             	mov    r9,rdx
    1349:	5e                   	pop    rsi
    134a:	48 89 e2             	mov    rdx,rsp
    134d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1351:	50                   	push   rax
    1352:	54                   	push   rsp
    1353:	45 31 c0             	xor    r8d,r8d
    1356:	31 c9                	xor    ecx,ecx
    1358:	48 8d 3d ef 0b 00 00 	lea    rdi,[rip+0xbef]        # 1f4e <main>
    135f:	ff 15 73 3c 00 00    	call   QWORD PTR [rip+0x3c73]        # 4fd8 <__libc_start_main@GLIBC_2.34>
    1365:	f4                   	hlt
    1366:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    136d:	00 00 00 

0000000000001370 <deregister_tm_clones>:
    1370:	48 8d 3d d9 3d 00 00 	lea    rdi,[rip+0x3dd9]        # 5150 <stdout@GLIBC_2.2.5>
    1377:	48 8d 05 d2 3d 00 00 	lea    rax,[rip+0x3dd2]        # 5150 <stdout@GLIBC_2.2.5>
    137e:	48 39 f8             	cmp    rax,rdi
    1381:	74 15                	je     1398 <deregister_tm_clones+0x28>
    1383:	48 8b 05 56 3c 00 00 	mov    rax,QWORD PTR [rip+0x3c56]        # 4fe0 <_ITM_deregisterTMCloneTable@Base>
    138a:	48 85 c0             	test   rax,rax
    138d:	74 09                	je     1398 <deregister_tm_clones+0x28>
    138f:	ff e0                	jmp    rax
    1391:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1398:	c3                   	ret
    1399:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000013a0 <register_tm_clones>:
    13a0:	48 8d 3d a9 3d 00 00 	lea    rdi,[rip+0x3da9]        # 5150 <stdout@GLIBC_2.2.5>
    13a7:	48 8d 35 a2 3d 00 00 	lea    rsi,[rip+0x3da2]        # 5150 <stdout@GLIBC_2.2.5>
    13ae:	48 29 fe             	sub    rsi,rdi
    13b1:	48 89 f0             	mov    rax,rsi
    13b4:	48 c1 ee 3f          	shr    rsi,0x3f
    13b8:	48 c1 f8 03          	sar    rax,0x3
    13bc:	48 01 c6             	add    rsi,rax
    13bf:	48 d1 fe             	sar    rsi,1
    13c2:	74 14                	je     13d8 <register_tm_clones+0x38>
    13c4:	48 8b 05 25 3c 00 00 	mov    rax,QWORD PTR [rip+0x3c25]        # 4ff0 <_ITM_registerTMCloneTable@Base>
    13cb:	48 85 c0             	test   rax,rax
    13ce:	74 08                	je     13d8 <register_tm_clones+0x38>
    13d0:	ff e0                	jmp    rax
    13d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    13d8:	c3                   	ret
    13d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000013e0 <__do_global_dtors_aux>:
    13e0:	f3 0f 1e fa          	endbr64
    13e4:	80 3d 7d 3d 00 00 00 	cmp    BYTE PTR [rip+0x3d7d],0x0        # 5168 <completed.0>
    13eb:	75 2b                	jne    1418 <__do_global_dtors_aux+0x38>
    13ed:	55                   	push   rbp
    13ee:	48 83 3d 02 3c 00 00 	cmp    QWORD PTR [rip+0x3c02],0x0        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    13f5:	00 
    13f6:	48 89 e5             	mov    rbp,rsp
    13f9:	74 0c                	je     1407 <__do_global_dtors_aux+0x27>
    13fb:	48 8b 3d 06 3c 00 00 	mov    rdi,QWORD PTR [rip+0x3c06]        # 5008 <__dso_handle>
    1402:	e8 a9 fd ff ff       	call   11b0 <__cxa_finalize@plt>
    1407:	e8 64 ff ff ff       	call   1370 <deregister_tm_clones>
    140c:	c6 05 55 3d 00 00 01 	mov    BYTE PTR [rip+0x3d55],0x1        # 5168 <completed.0>
    1413:	5d                   	pop    rbp
    1414:	c3                   	ret
    1415:	0f 1f 00             	nop    DWORD PTR [rax]
    1418:	c3                   	ret
    1419:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001420 <frame_dummy>:
    1420:	f3 0f 1e fa          	endbr64
    1424:	e9 77 ff ff ff       	jmp    13a0 <register_tm_clones>

0000000000001429 <apply_seccomp>:
    1429:	f3 0f 1e fa          	endbr64
    142d:	55                   	push   rbp
    142e:	48 89 e5             	mov    rbp,rsp
    1431:	41 b8 00 00 00 00    	mov    r8d,0x0
    1437:	b9 00 00 00 00       	mov    ecx,0x0
    143c:	ba 00 00 00 00       	mov    edx,0x0
    1441:	be 01 00 00 00       	mov    esi,0x1
    1446:	bf 26 00 00 00       	mov    edi,0x26
    144b:	b8 00 00 00 00       	mov    eax,0x0
    1450:	e8 4b fe ff ff       	call   12a0 <prctl@plt>
    1455:	85 c0                	test   eax,eax
    1457:	74 19                	je     1472 <apply_seccomp+0x49>
    1459:	48 8d 05 a8 1b 00 00 	lea    rax,[rip+0x1ba8]        # 3008 <_IO_stdin_used+0x8>
    1460:	48 89 c7             	mov    rdi,rax
    1463:	e8 88 fe ff ff       	call   12f0 <perror@plt>
    1468:	bf 01 00 00 00       	mov    edi,0x1
    146d:	e8 8e fe ff ff       	call   1300 <exit@plt>
    1472:	48 8d 05 c7 3c 00 00 	lea    rax,[rip+0x3cc7]        # 5140 <filterprog>
    1479:	48 89 c2             	mov    rdx,rax
    147c:	be 02 00 00 00       	mov    esi,0x2
    1481:	bf 16 00 00 00       	mov    edi,0x16
    1486:	b8 00 00 00 00       	mov    eax,0x0
    148b:	e8 10 fe ff ff       	call   12a0 <prctl@plt>
    1490:	83 f8 ff             	cmp    eax,0xffffffff
    1493:	75 19                	jne    14ae <apply_seccomp+0x85>
    1495:	48 8d 05 6c 1b 00 00 	lea    rax,[rip+0x1b6c]        # 3008 <_IO_stdin_used+0x8>
    149c:	48 89 c7             	mov    rdi,rax
    149f:	e8 4c fe ff ff       	call   12f0 <perror@plt>
    14a4:	bf 01 00 00 00       	mov    edi,0x1
    14a9:	e8 52 fe ff ff       	call   1300 <exit@plt>
    14ae:	90                   	nop
    14af:	5d                   	pop    rbp
    14b0:	c3                   	ret

00000000000014b1 <errorexit>:
    14b1:	f3 0f 1e fa          	endbr64
    14b5:	55                   	push   rbp
    14b6:	48 89 e5             	mov    rbp,rsp
    14b9:	48 83 ec 10          	sub    rsp,0x10
    14bd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    14c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    14c5:	48 89 c7             	mov    rdi,rax
    14c8:	e8 13 fd ff ff       	call   11e0 <puts@plt>
    14cd:	bf ff ff ff ff       	mov    edi,0xffffffff
    14d2:	e8 29 fe ff ff       	call   1300 <exit@plt>

00000000000014d7 <connect_backend>:
    14d7:	f3 0f 1e fa          	endbr64
    14db:	55                   	push   rbp
    14dc:	48 89 e5             	mov    rbp,rsp
    14df:	48 83 ec 30          	sub    rsp,0x30
    14e3:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    14ea:	00 00 
    14ec:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    14f0:	31 c0                	xor    eax,eax
    14f2:	ba 00 00 00 00       	mov    edx,0x0
    14f7:	be 01 00 00 00       	mov    esi,0x1
    14fc:	bf 02 00 00 00       	mov    edi,0x2
    1501:	e8 2a fe ff ff       	call   1330 <socket@plt>
    1506:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    1509:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    150d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    1514:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
    151b:	00 
    151c:	66 c7 45 e0 02 00    	mov    WORD PTR [rbp-0x20],0x2
    1522:	48 8d 05 ed 1a 00 00 	lea    rax,[rip+0x1aed]        # 3016 <_IO_stdin_used+0x16>
    1529:	48 89 c7             	mov    rdi,rax
    152c:	e8 5f fd ff ff       	call   1290 <inet_addr@plt>
    1531:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    1534:	bf 3d 22 00 00       	mov    edi,0x223d
    1539:	e8 e2 fc ff ff       	call   1220 <htons@plt>
    153e:	66 89 45 e2          	mov    WORD PTR [rbp-0x1e],ax
    1542:	48 8d 4d e0          	lea    rcx,[rbp-0x20]
    1546:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    1549:	ba 10 00 00 00       	mov    edx,0x10
    154e:	48 89 ce             	mov    rsi,rcx
    1551:	89 c7                	mov    edi,eax
    1553:	e8 b8 fd ff ff       	call   1310 <connect@plt>
    1558:	83 f8 ff             	cmp    eax,0xffffffff
    155b:	75 07                	jne    1564 <connect_backend+0x8d>
    155d:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1562:	eb 03                	jmp    1567 <connect_backend+0x90>
    1564:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    1567:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    156b:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    1572:	00 00 
    1574:	74 05                	je     157b <connect_backend+0xa4>
    1576:	e8 95 fc ff ff       	call   1210 <__stack_chk_fail@plt>
    157b:	c9                   	leave
    157c:	c3                   	ret

000000000000157d <command_login>:
    157d:	f3 0f 1e fa          	endbr64
    1581:	55                   	push   rbp
    1582:	48 89 e5             	mov    rbp,rsp
    1585:	48 81 ec e0 01 00 00 	sub    rsp,0x1e0
    158c:	89 bd 3c fe ff ff    	mov    DWORD PTR [rbp-0x1c4],edi
    1592:	48 89 b5 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rsi
    1599:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
    15a0:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    15a7:	00 00 
    15a9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    15ad:	31 c0                	xor    eax,eax
    15af:	48 8b 85 30 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d0]
    15b6:	48 89 c7             	mov    rdi,rax
    15b9:	e8 42 fc ff ff       	call   1200 <strlen@plt>
    15be:	48 83 f8 0f          	cmp    rax,0xf
    15c2:	77 15                	ja     15d9 <command_login+0x5c>
    15c4:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
    15cb:	48 89 c7             	mov    rdi,rax
    15ce:	e8 2d fc ff ff       	call   1200 <strlen@plt>
    15d3:	48 83 f8 0f          	cmp    rax,0xf
    15d7:	76 14                	jbe    15ed <command_login+0x70>
    15d9:	48 8d 05 40 1a 00 00 	lea    rax,[rip+0x1a40]        # 3020 <_IO_stdin_used+0x20>
    15e0:	48 89 c7             	mov    rdi,rax
    15e3:	e8 c9 fe ff ff       	call   14b1 <errorexit>
    15e8:	e9 32 01 00 00       	jmp    171f <command_login+0x1a2>
    15ed:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
    15f4:	ba a4 00 00 00       	mov    edx,0xa4
    15f9:	be 00 00 00 00       	mov    esi,0x0
    15fe:	48 89 c7             	mov    rdi,rax
    1601:	e8 5a fc ff ff       	call   1260 <memset@plt>
    1606:	c7 85 40 fe ff ff 02 	mov    DWORD PTR [rbp-0x1c0],0x2
    160d:	00 00 00 
    1610:	48 8b 85 30 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d0]
    1617:	48 8d 95 40 fe ff ff 	lea    rdx,[rbp-0x1c0]
    161e:	48 83 c2 24          	add    rdx,0x24
    1622:	48 89 c6             	mov    rsi,rax
    1625:	48 89 d7             	mov    rdi,rdx
    1628:	e8 a3 fb ff ff       	call   11d0 <strcpy@plt>
    162d:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
    1634:	48 83 c0 24          	add    rax,0x24
    1638:	48 89 c7             	mov    rdi,rax
    163b:	e8 c0 fb ff ff       	call   1200 <strlen@plt>
    1640:	48 83 c0 01          	add    rax,0x1
    1644:	48 8d 95 40 fe ff ff 	lea    rdx,[rbp-0x1c0]
    164b:	48 83 c0 20          	add    rax,0x20
    164f:	48 01 d0             	add    rax,rdx
    1652:	48 8d 50 04          	lea    rdx,[rax+0x4]
    1656:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
    165d:	48 89 c6             	mov    rsi,rax
    1660:	48 89 d7             	mov    rdi,rdx
    1663:	e8 68 fb ff ff       	call   11d0 <strcpy@plt>
    1668:	48 8d 8d 40 fe ff ff 	lea    rcx,[rbp-0x1c0]
    166f:	8b 85 3c fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c4]
    1675:	ba a4 00 00 00       	mov    edx,0xa4
    167a:	48 89 ce             	mov    rsi,rcx
    167d:	89 c7                	mov    edi,eax
    167f:	e8 6c fb ff ff       	call   11f0 <write@plt>
    1684:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    168b:	ba 04 01 00 00       	mov    edx,0x104
    1690:	be 00 00 00 00       	mov    esi,0x0
    1695:	48 89 c7             	mov    rdi,rax
    1698:	e8 c3 fb ff ff       	call   1260 <memset@plt>
    169d:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
    16a4:	8b 85 3c fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c4]
    16aa:	ba 04 01 00 00       	mov    edx,0x104
    16af:	48 89 ce             	mov    rsi,rcx
    16b2:	89 c7                	mov    edi,eax
    16b4:	e8 c7 fb ff ff       	call   1280 <read@plt>
    16b9:	48 3d 04 01 00 00    	cmp    rax,0x104
    16bf:	74 0f                	je     16d0 <command_login+0x153>
    16c1:	48 8d 05 78 19 00 00 	lea    rax,[rip+0x1978]        # 3040 <_IO_stdin_used+0x40>
    16c8:	48 89 c7             	mov    rdi,rax
    16cb:	e8 e1 fd ff ff       	call   14b1 <errorexit>
    16d0:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x110]
    16d6:	85 c0                	test   eax,eax
    16d8:	75 2b                	jne    1705 <command_login+0x188>
    16da:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    16e1:	48 83 c0 04          	add    rax,0x4
    16e5:	48 89 c7             	mov    rdi,rax
    16e8:	e8 33 fc ff ff       	call   1320 <strdup@plt>
    16ed:	48 89 05 7c 3a 00 00 	mov    QWORD PTR [rip+0x3a7c],rax        # 5170 <Token>
    16f4:	48 8d 05 68 19 00 00 	lea    rax,[rip+0x1968]        # 3063 <_IO_stdin_used+0x63>
    16fb:	48 89 c7             	mov    rdi,rax
    16fe:	e8 dd fa ff ff       	call   11e0 <puts@plt>
    1703:	eb 1a                	jmp    171f <command_login+0x1a2>
    1705:	48 c7 05 60 3a 00 00 	mov    QWORD PTR [rip+0x3a60],0x0        # 5170 <Token>
    170c:	00 00 00 00 
    1710:	48 8d 05 5b 19 00 00 	lea    rax,[rip+0x195b]        # 3072 <_IO_stdin_used+0x72>
    1717:	48 89 c7             	mov    rdi,rax
    171a:	e8 c1 fa ff ff       	call   11e0 <puts@plt>
    171f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1723:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    172a:	00 00 
    172c:	74 05                	je     1733 <command_login+0x1b6>
    172e:	e8 dd fa ff ff       	call   1210 <__stack_chk_fail@plt>
    1733:	c9                   	leave
    1734:	c3                   	ret

0000000000001735 <command_register>:
    1735:	f3 0f 1e fa          	endbr64
    1739:	55                   	push   rbp
    173a:	48 89 e5             	mov    rbp,rsp
    173d:	48 81 ec e0 01 00 00 	sub    rsp,0x1e0
    1744:	89 bd 3c fe ff ff    	mov    DWORD PTR [rbp-0x1c4],edi
    174a:	48 89 b5 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rsi
    1751:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
    1758:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    175f:	00 00 
    1761:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1765:	31 c0                	xor    eax,eax
    1767:	48 8b 85 30 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d0]
    176e:	48 89 c7             	mov    rdi,rax
    1771:	e8 8a fa ff ff       	call   1200 <strlen@plt>
    1776:	48 83 f8 0f          	cmp    rax,0xf
    177a:	77 15                	ja     1791 <command_register+0x5c>
    177c:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
    1783:	48 89 c7             	mov    rdi,rax
    1786:	e8 75 fa ff ff       	call   1200 <strlen@plt>
    178b:	48 83 f8 0f          	cmp    rax,0xf
    178f:	76 14                	jbe    17a5 <command_register+0x70>
    1791:	48 8d 05 88 18 00 00 	lea    rax,[rip+0x1888]        # 3020 <_IO_stdin_used+0x20>
    1798:	48 89 c7             	mov    rdi,rax
    179b:	e8 40 fa ff ff       	call   11e0 <puts@plt>
    17a0:	e9 0f 01 00 00       	jmp    18b4 <command_register+0x17f>
    17a5:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
    17ac:	ba a4 00 00 00       	mov    edx,0xa4
    17b1:	be 00 00 00 00       	mov    esi,0x0
    17b6:	48 89 c7             	mov    rdi,rax
    17b9:	e8 a2 fa ff ff       	call   1260 <memset@plt>
    17be:	c7 85 40 fe ff ff 01 	mov    DWORD PTR [rbp-0x1c0],0x1
    17c5:	00 00 00 
    17c8:	48 8b 85 30 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d0]
    17cf:	48 8d 95 40 fe ff ff 	lea    rdx,[rbp-0x1c0]
    17d6:	48 83 c2 24          	add    rdx,0x24
    17da:	48 89 c6             	mov    rsi,rax
    17dd:	48 89 d7             	mov    rdi,rdx
    17e0:	e8 eb f9 ff ff       	call   11d0 <strcpy@plt>
    17e5:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
    17ec:	48 83 c0 24          	add    rax,0x24
    17f0:	48 89 c7             	mov    rdi,rax
    17f3:	e8 08 fa ff ff       	call   1200 <strlen@plt>
    17f8:	48 83 c0 01          	add    rax,0x1
    17fc:	48 8d 95 40 fe ff ff 	lea    rdx,[rbp-0x1c0]
    1803:	48 83 c0 20          	add    rax,0x20
    1807:	48 01 d0             	add    rax,rdx
    180a:	48 8d 50 04          	lea    rdx,[rax+0x4]
    180e:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
    1815:	48 89 c6             	mov    rsi,rax
    1818:	48 89 d7             	mov    rdi,rdx
    181b:	e8 b0 f9 ff ff       	call   11d0 <strcpy@plt>
    1820:	48 8d 8d 40 fe ff ff 	lea    rcx,[rbp-0x1c0]
    1827:	8b 85 3c fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c4]
    182d:	ba a4 00 00 00       	mov    edx,0xa4
    1832:	48 89 ce             	mov    rsi,rcx
    1835:	89 c7                	mov    edi,eax
    1837:	e8 b4 f9 ff ff       	call   11f0 <write@plt>
    183c:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    1843:	ba 04 01 00 00       	mov    edx,0x104
    1848:	be 00 00 00 00       	mov    esi,0x0
    184d:	48 89 c7             	mov    rdi,rax
    1850:	e8 0b fa ff ff       	call   1260 <memset@plt>
    1855:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
    185c:	8b 85 3c fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c4]
    1862:	ba 04 01 00 00       	mov    edx,0x104
    1867:	48 89 ce             	mov    rsi,rcx
    186a:	89 c7                	mov    edi,eax
    186c:	e8 0f fa ff ff       	call   1280 <read@plt>
    1871:	48 3d 04 01 00 00    	cmp    rax,0x104
    1877:	74 11                	je     188a <command_register+0x155>
    1879:	48 8d 05 c0 17 00 00 	lea    rax,[rip+0x17c0]        # 3040 <_IO_stdin_used+0x40>
    1880:	48 89 c7             	mov    rdi,rax
    1883:	e8 58 f9 ff ff       	call   11e0 <puts@plt>
    1888:	eb 2a                	jmp    18b4 <command_register+0x17f>
    188a:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x110]
    1890:	85 c0                	test   eax,eax
    1892:	75 11                	jne    18a5 <command_register+0x170>
    1894:	48 8d 05 e5 17 00 00 	lea    rax,[rip+0x17e5]        # 3080 <_IO_stdin_used+0x80>
    189b:	48 89 c7             	mov    rdi,rax
    189e:	e8 3d f9 ff ff       	call   11e0 <puts@plt>
    18a3:	eb 0f                	jmp    18b4 <command_register+0x17f>
    18a5:	48 8d 05 e6 17 00 00 	lea    rax,[rip+0x17e6]        # 3092 <_IO_stdin_used+0x92>
    18ac:	48 89 c7             	mov    rdi,rax
    18af:	e8 2c f9 ff ff       	call   11e0 <puts@plt>
    18b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    18b8:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    18bf:	00 00 
    18c1:	74 05                	je     18c8 <command_register+0x193>
    18c3:	e8 48 f9 ff ff       	call   1210 <__stack_chk_fail@plt>
    18c8:	c9                   	leave
    18c9:	c3                   	ret

00000000000018ca <command_newnote>:
    18ca:	f3 0f 1e fa          	endbr64
    18ce:	55                   	push   rbp
    18cf:	48 89 e5             	mov    rbp,rsp
    18d2:	48 81 ec f0 01 00 00 	sub    rsp,0x1f0
    18d9:	89 bd 2c fe ff ff    	mov    DWORD PTR [rbp-0x1d4],edi
    18df:	48 89 b5 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rsi
    18e6:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
    18ed:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    18f4:	00 00 
    18f6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    18fa:	31 c0                	xor    eax,eax
    18fc:	48 8b 05 6d 38 00 00 	mov    rax,QWORD PTR [rip+0x386d]        # 5170 <Token>
    1903:	48 85 c0             	test   rax,rax
    1906:	75 14                	jne    191c <command_newnote+0x52>
    1908:	48 8d 05 94 17 00 00 	lea    rax,[rip+0x1794]        # 30a3 <_IO_stdin_used+0xa3>
    190f:	48 89 c7             	mov    rdi,rax
    1912:	e8 c9 f8 ff ff       	call   11e0 <puts@plt>
    1917:	e9 6f 01 00 00       	jmp    1a8b <command_newnote+0x1c1>
    191c:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
    1923:	ba a4 00 00 00       	mov    edx,0xa4
    1928:	be 00 00 00 00       	mov    esi,0x0
    192d:	48 89 c7             	mov    rdi,rax
    1930:	e8 2b f9 ff ff       	call   1260 <memset@plt>
    1935:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    193c:	ba 04 01 00 00       	mov    edx,0x104
    1941:	be 00 00 00 00       	mov    esi,0x0
    1946:	48 89 c7             	mov    rdi,rax
    1949:	e8 12 f9 ff ff       	call   1260 <memset@plt>
    194e:	c7 85 40 fe ff ff 12 	mov    DWORD PTR [rbp-0x1c0],0x12
    1955:	00 00 00 
    1958:	48 8b 05 11 38 00 00 	mov    rax,QWORD PTR [rip+0x3811]        # 5170 <Token>
    195f:	48 8d 95 40 fe ff ff 	lea    rdx,[rbp-0x1c0]
    1966:	48 83 c2 04          	add    rdx,0x4
    196a:	48 89 c6             	mov    rsi,rax
    196d:	48 89 d7             	mov    rdi,rdx
    1970:	e8 5b f8 ff ff       	call   11d0 <strcpy@plt>
    1975:	48 8b 85 20 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1e0]
    197c:	48 8d 95 40 fe ff ff 	lea    rdx,[rbp-0x1c0]
    1983:	48 8d 4a 24          	lea    rcx,[rdx+0x24]
    1987:	ba 80 00 00 00       	mov    edx,0x80
    198c:	48 89 c6             	mov    rsi,rax
    198f:	48 89 cf             	mov    rdi,rcx
    1992:	e8 29 f8 ff ff       	call   11c0 <strncpy@plt>
    1997:	48 8d 8d 40 fe ff ff 	lea    rcx,[rbp-0x1c0]
    199e:	8b 85 2c fe ff ff    	mov    eax,DWORD PTR [rbp-0x1d4]
    19a4:	ba a4 00 00 00       	mov    edx,0xa4
    19a9:	48 89 ce             	mov    rsi,rcx
    19ac:	89 c7                	mov    edi,eax
    19ae:	e8 3d f8 ff ff       	call   11f0 <write@plt>
    19b3:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
    19ba:	8b 85 2c fe ff ff    	mov    eax,DWORD PTR [rbp-0x1d4]
    19c0:	ba 04 01 00 00       	mov    edx,0x104
    19c5:	48 89 ce             	mov    rsi,rcx
    19c8:	89 c7                	mov    edi,eax
    19ca:	e8 b1 f8 ff ff       	call   1280 <read@plt>
    19cf:	48 3d 04 01 00 00    	cmp    rax,0x104
    19d5:	74 14                	je     19eb <command_newnote+0x121>
    19d7:	48 8d 05 62 16 00 00 	lea    rax,[rip+0x1662]        # 3040 <_IO_stdin_used+0x40>
    19de:	48 89 c7             	mov    rdi,rax
    19e1:	e8 fa f7 ff ff       	call   11e0 <puts@plt>
    19e6:	e9 a0 00 00 00       	jmp    1a8b <command_newnote+0x1c1>
    19eb:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x110]
    19f1:	85 c0                	test   eax,eax
    19f3:	74 14                	je     1a09 <command_newnote+0x13f>
    19f5:	48 8d 05 bb 16 00 00 	lea    rax,[rip+0x16bb]        # 30b7 <_IO_stdin_used+0xb7>
    19fc:	48 89 c7             	mov    rdi,rax
    19ff:	e8 dc f7 ff ff       	call   11e0 <puts@plt>
    1a04:	e9 82 00 00 00       	jmp    1a8b <command_newnote+0x1c1>
    1a09:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    1a10:	48 83 c0 04          	add    rax,0x4
    1a14:	be 02 00 00 00       	mov    esi,0x2
    1a19:	48 89 c7             	mov    rdi,rax
    1a1c:	b8 00 00 00 00       	mov    eax,0x0
    1a21:	e8 ba f8 ff ff       	call   12e0 <open@plt>
    1a26:	89 85 3c fe ff ff    	mov    DWORD PTR [rbp-0x1c4],eax
    1a2c:	83 bd 3c fe ff ff 00 	cmp    DWORD PTR [rbp-0x1c4],0x0
    1a33:	79 11                	jns    1a46 <command_newnote+0x17c>
    1a35:	48 8d 05 7b 16 00 00 	lea    rax,[rip+0x167b]        # 30b7 <_IO_stdin_used+0xb7>
    1a3c:	48 89 c7             	mov    rdi,rax
    1a3f:	e8 9c f7 ff ff       	call   11e0 <puts@plt>
    1a44:	eb 45                	jmp    1a8b <command_newnote+0x1c1>
    1a46:	48 8b 85 18 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1e8]
    1a4d:	48 89 c7             	mov    rdi,rax
    1a50:	e8 ab f7 ff ff       	call   1200 <strlen@plt>
    1a55:	48 89 c2             	mov    rdx,rax
    1a58:	48 8b 8d 18 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e8]
    1a5f:	8b 85 3c fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c4]
    1a65:	48 89 ce             	mov    rsi,rcx
    1a68:	89 c7                	mov    edi,eax
    1a6a:	e8 81 f7 ff ff       	call   11f0 <write@plt>
    1a6f:	8b 85 3c fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c4]
    1a75:	89 c7                	mov    edi,eax
    1a77:	e8 f4 f7 ff ff       	call   1270 <close@plt>
    1a7c:	48 8d 05 48 16 00 00 	lea    rax,[rip+0x1648]        # 30cb <_IO_stdin_used+0xcb>
    1a83:	48 89 c7             	mov    rdi,rax
    1a86:	e8 55 f7 ff ff       	call   11e0 <puts@plt>
    1a8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a8f:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1a96:	00 00 
    1a98:	74 05                	je     1a9f <command_newnote+0x1d5>
    1a9a:	e8 71 f7 ff ff       	call   1210 <__stack_chk_fail@plt>
    1a9f:	c9                   	leave
    1aa0:	c3                   	ret

0000000000001aa1 <openfile>:
    1aa1:	f3 0f 1e fa          	endbr64
    1aa5:	55                   	push   rbp
    1aa6:	48 89 e5             	mov    rbp,rsp
    1aa9:	48 81 ec 80 02 00 00 	sub    rsp,0x280
    1ab0:	89 bd 9c fd ff ff    	mov    DWORD PTR [rbp-0x264],edi
    1ab6:	48 89 b5 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],rsi
    1abd:	48 89 95 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],rdx
    1ac4:	89 8d 98 fd ff ff    	mov    DWORD PTR [rbp-0x268],ecx
    1aca:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1ad1:	00 00 
    1ad3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1ad7:	31 c0                	xor    eax,eax
    1ad9:	48 8b 05 90 36 00 00 	mov    rax,QWORD PTR [rip+0x3690]        # 5170 <Token>
    1ae0:	48 85 c0             	test   rax,rax
    1ae3:	75 19                	jne    1afe <openfile+0x5d>
    1ae5:	48 8d 05 b7 15 00 00 	lea    rax,[rip+0x15b7]        # 30a3 <_IO_stdin_used+0xa3>
    1aec:	48 89 c7             	mov    rdi,rax
    1aef:	e8 ec f6 ff ff       	call   11e0 <puts@plt>
    1af4:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1af9:	e9 70 01 00 00       	jmp    1c6e <openfile+0x1cd>
    1afe:	48 8d 85 b0 fd ff ff 	lea    rax,[rbp-0x250]
    1b05:	ba a4 00 00 00       	mov    edx,0xa4
    1b0a:	be 00 00 00 00       	mov    esi,0x0
    1b0f:	48 89 c7             	mov    rdi,rax
    1b12:	e8 49 f7 ff ff       	call   1260 <memset@plt>
    1b17:	48 8d 85 60 fe ff ff 	lea    rax,[rbp-0x1a0]
    1b1e:	ba 04 01 00 00       	mov    edx,0x104
    1b23:	be 00 00 00 00       	mov    esi,0x0
    1b28:	48 89 c7             	mov    rdi,rax
    1b2b:	e8 30 f7 ff ff       	call   1260 <memset@plt>
    1b30:	c7 85 b0 fd ff ff 11 	mov    DWORD PTR [rbp-0x250],0x11
    1b37:	00 00 00 
    1b3a:	48 8b 05 2f 36 00 00 	mov    rax,QWORD PTR [rip+0x362f]        # 5170 <Token>
    1b41:	48 8d 95 b0 fd ff ff 	lea    rdx,[rbp-0x250]
    1b48:	48 83 c2 04          	add    rdx,0x4
    1b4c:	48 89 c6             	mov    rsi,rax
    1b4f:	48 89 d7             	mov    rdi,rdx
    1b52:	e8 79 f6 ff ff       	call   11d0 <strcpy@plt>
    1b57:	48 8d 8d b0 fd ff ff 	lea    rcx,[rbp-0x250]
    1b5e:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    1b64:	ba a4 00 00 00       	mov    edx,0xa4
    1b69:	48 89 ce             	mov    rsi,rcx
    1b6c:	89 c7                	mov    edi,eax
    1b6e:	e8 7d f6 ff ff       	call   11f0 <write@plt>
    1b73:	48 8d 8d 60 fe ff ff 	lea    rcx,[rbp-0x1a0]
    1b7a:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    1b80:	ba 04 01 00 00       	mov    edx,0x104
    1b85:	48 89 ce             	mov    rsi,rcx
    1b88:	89 c7                	mov    edi,eax
    1b8a:	e8 f1 f6 ff ff       	call   1280 <read@plt>
    1b8f:	48 3d 04 01 00 00    	cmp    rax,0x104
    1b95:	74 19                	je     1bb0 <openfile+0x10f>
    1b97:	48 8d 05 a2 14 00 00 	lea    rax,[rip+0x14a2]        # 3040 <_IO_stdin_used+0x40>
    1b9e:	48 89 c7             	mov    rdi,rax
    1ba1:	e8 3a f6 ff ff       	call   11e0 <puts@plt>
    1ba6:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1bab:	e9 be 00 00 00       	jmp    1c6e <openfile+0x1cd>
    1bb0:	8b 85 60 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1a0]
    1bb6:	85 c0                	test   eax,eax
    1bb8:	74 19                	je     1bd3 <openfile+0x132>
    1bba:	48 8d 05 1f 15 00 00 	lea    rax,[rip+0x151f]        # 30e0 <_IO_stdin_used+0xe0>
    1bc1:	48 89 c7             	mov    rdi,rax
    1bc4:	e8 17 f6 ff ff       	call   11e0 <puts@plt>
    1bc9:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1bce:	e9 9b 00 00 00       	jmp    1c6e <openfile+0x1cd>
    1bd3:	48 8b 8d 90 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x270]
    1bda:	48 8d 85 60 fe ff ff 	lea    rax,[rbp-0x1a0]
    1be1:	48 8d 50 04          	lea    rdx,[rax+0x4]
    1be5:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
    1bec:	49 89 c8             	mov    r8,rcx
    1bef:	48 89 d1             	mov    rcx,rdx
    1bf2:	48 8d 15 07 15 00 00 	lea    rdx,[rip+0x1507]        # 3100 <_IO_stdin_used+0x100>
    1bf9:	be 80 00 00 00       	mov    esi,0x80
    1bfe:	48 89 c7             	mov    rdi,rax
    1c01:	b8 00 00 00 00       	mov    eax,0x0
    1c06:	e8 35 f6 ff ff       	call   1240 <snprintf@plt>
    1c0b:	8b 95 98 fd ff ff    	mov    edx,DWORD PTR [rbp-0x268]
    1c11:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
    1c18:	89 d6                	mov    esi,edx
    1c1a:	48 89 c7             	mov    rdi,rax
    1c1d:	b8 00 00 00 00       	mov    eax,0x0
    1c22:	e8 b9 f6 ff ff       	call   12e0 <open@plt>
    1c27:	89 85 ac fd ff ff    	mov    DWORD PTR [rbp-0x254],eax
    1c2d:	83 bd ac fd ff ff 00 	cmp    DWORD PTR [rbp-0x254],0x0
    1c34:	79 16                	jns    1c4c <openfile+0x1ab>
    1c36:	48 8d 05 cc 14 00 00 	lea    rax,[rip+0x14cc]        # 3109 <_IO_stdin_used+0x109>
    1c3d:	48 89 c7             	mov    rdi,rax
    1c40:	e8 9b f5 ff ff       	call   11e0 <puts@plt>
    1c45:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1c4a:	eb 22                	jmp    1c6e <openfile+0x1cd>
    1c4c:	48 8b 8d 88 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x278]
    1c53:	8b 85 ac fd ff ff    	mov    eax,DWORD PTR [rbp-0x254]
    1c59:	ba 00 00 00 00       	mov    edx,0x0
    1c5e:	48 89 ce             	mov    rsi,rcx
    1c61:	89 c7                	mov    edi,eax
    1c63:	e8 e8 f5 ff ff       	call   1250 <lseek@plt>
    1c68:	8b 85 ac fd ff ff    	mov    eax,DWORD PTR [rbp-0x254]
    1c6e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    1c72:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    1c79:	00 00 
    1c7b:	74 05                	je     1c82 <openfile+0x1e1>
    1c7d:	e8 8e f5 ff ff       	call   1210 <__stack_chk_fail@plt>
    1c82:	c9                   	leave
    1c83:	c3                   	ret

0000000000001c84 <command_editnote>:
    1c84:	f3 0f 1e fa          	endbr64
    1c88:	55                   	push   rbp
    1c89:	48 89 e5             	mov    rbp,rsp
    1c8c:	48 83 ec 30          	sub    rsp,0x30
    1c90:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    1c93:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    1c97:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    1c9b:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    1c9f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    1ca3:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
    1ca7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    1caa:	b9 02 00 00 00       	mov    ecx,0x2
    1caf:	89 c7                	mov    edi,eax
    1cb1:	e8 eb fd ff ff       	call   1aa1 <openfile>
    1cb6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    1cb9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1cbd:	48 89 c7             	mov    rdi,rax
    1cc0:	e8 3b f5 ff ff       	call   1200 <strlen@plt>
    1cc5:	48 89 c2             	mov    rdx,rax
    1cc8:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
    1ccc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1ccf:	48 89 ce             	mov    rsi,rcx
    1cd2:	89 c7                	mov    edi,eax
    1cd4:	e8 17 f5 ff ff       	call   11f0 <write@plt>
    1cd9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1cdc:	89 c7                	mov    edi,eax
    1cde:	e8 8d f5 ff ff       	call   1270 <close@plt>
    1ce3:	48 8d 05 37 14 00 00 	lea    rax,[rip+0x1437]        # 3121 <_IO_stdin_used+0x121>
    1cea:	48 89 c7             	mov    rdi,rax
    1ced:	e8 ee f4 ff ff       	call   11e0 <puts@plt>
    1cf2:	90                   	nop
    1cf3:	c9                   	leave
    1cf4:	c3                   	ret

0000000000001cf5 <command_shownote>:
    1cf5:	f3 0f 1e fa          	endbr64
    1cf9:	55                   	push   rbp
    1cfa:	48 89 e5             	mov    rbp,rsp
    1cfd:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    1d04:	89 bd 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edi
    1d0a:	48 89 b5 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rsi
    1d11:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
    1d18:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1d1f:	00 00 
    1d21:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1d25:	31 c0                	xor    eax,eax
    1d27:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    1d2e:	48 8b b5 50 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xb0]
    1d35:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
    1d3b:	b9 00 00 00 00       	mov    ecx,0x0
    1d40:	89 c7                	mov    edi,eax
    1d42:	e8 5a fd ff ff       	call   1aa1 <openfile>
    1d47:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    1d4d:	48 8d 8d 70 ff ff ff 	lea    rcx,[rbp-0x90]
    1d54:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
    1d5a:	ba 80 00 00 00       	mov    edx,0x80
    1d5f:	48 89 ce             	mov    rsi,rcx
    1d62:	89 c7                	mov    edi,eax
    1d64:	e8 17 f5 ff ff       	call   1280 <read@plt>
    1d69:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    1d70:	48 83 bd 68 ff ff ff 	cmp    QWORD PTR [rbp-0x98],0x0
    1d77:	00 
    1d78:	7f 11                	jg     1d8b <command_shownote+0x96>
    1d7a:	48 8d 05 af 13 00 00 	lea    rax,[rip+0x13af]        # 3130 <_IO_stdin_used+0x130>
    1d81:	48 89 c7             	mov    rdi,rax
    1d84:	e8 57 f4 ff ff       	call   11e0 <puts@plt>
    1d89:	eb 1b                	jmp    1da6 <command_shownote+0xb1>
    1d8b:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    1d92:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
    1d99:	48 89 c6             	mov    rsi,rax
    1d9c:	bf 01 00 00 00       	mov    edi,0x1
    1da1:	e8 4a f4 ff ff       	call   11f0 <write@plt>
    1da6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1daa:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1db1:	00 00 
    1db3:	74 05                	je     1dba <command_shownote+0xc5>
    1db5:	e8 56 f4 ff ff       	call   1210 <__stack_chk_fail@plt>
    1dba:	c9                   	leave
    1dbb:	c3                   	ret

0000000000001dbc <menu>:
    1dbc:	f3 0f 1e fa          	endbr64
    1dc0:	55                   	push   rbp
    1dc1:	48 89 e5             	mov    rbp,rsp
    1dc4:	48 8d 05 7d 13 00 00 	lea    rax,[rip+0x137d]        # 3148 <_IO_stdin_used+0x148>
    1dcb:	48 89 c7             	mov    rdi,rax
    1dce:	e8 0d f4 ff ff       	call   11e0 <puts@plt>
    1dd3:	48 8d 05 9e 13 00 00 	lea    rax,[rip+0x139e]        # 3178 <_IO_stdin_used+0x178>
    1dda:	48 89 c7             	mov    rdi,rax
    1ddd:	e8 fe f3 ff ff       	call   11e0 <puts@plt>
    1de2:	48 8d 05 bf 13 00 00 	lea    rax,[rip+0x13bf]        # 31a8 <_IO_stdin_used+0x1a8>
    1de9:	48 89 c7             	mov    rdi,rax
    1dec:	e8 ef f3 ff ff       	call   11e0 <puts@plt>
    1df1:	48 8d 05 e0 13 00 00 	lea    rax,[rip+0x13e0]        # 31d8 <_IO_stdin_used+0x1d8>
    1df8:	48 89 c7             	mov    rdi,rax
    1dfb:	e8 e0 f3 ff ff       	call   11e0 <puts@plt>
    1e00:	48 8d 05 01 14 00 00 	lea    rax,[rip+0x1401]        # 3208 <_IO_stdin_used+0x208>
    1e07:	48 89 c7             	mov    rdi,rax
    1e0a:	e8 d1 f3 ff ff       	call   11e0 <puts@plt>
    1e0f:	48 8d 05 22 14 00 00 	lea    rax,[rip+0x1422]        # 3238 <_IO_stdin_used+0x238>
    1e16:	48 89 c7             	mov    rdi,rax
    1e19:	e8 c2 f3 ff ff       	call   11e0 <puts@plt>
    1e1e:	48 8d 05 43 14 00 00 	lea    rax,[rip+0x1443]        # 3268 <_IO_stdin_used+0x268>
    1e25:	48 89 c7             	mov    rdi,rax
    1e28:	e8 b3 f3 ff ff       	call   11e0 <puts@plt>
    1e2d:	48 8d 05 5f 14 00 00 	lea    rax,[rip+0x145f]        # 3293 <_IO_stdin_used+0x293>
    1e34:	48 89 c7             	mov    rdi,rax
    1e37:	b8 00 00 00 00       	mov    eax,0x0
    1e3c:	e8 ef f3 ff ff       	call   1230 <printf@plt>
    1e41:	90                   	nop
    1e42:	5d                   	pop    rbp
    1e43:	c3                   	ret

0000000000001e44 <readint>:
    1e44:	f3 0f 1e fa          	endbr64
    1e48:	55                   	push   rbp
    1e49:	48 89 e5             	mov    rbp,rsp
    1e4c:	48 83 ec 40          	sub    rsp,0x40
    1e50:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1e57:	00 00 
    1e59:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1e5d:	31 c0                	xor    eax,eax
    1e5f:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [rbp-0x34],0x0
    1e66:	eb 42                	jmp    1eaa <readint+0x66>
    1e68:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
    1e6c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
    1e6f:	48 98                	cdqe
    1e71:	48 01 d0             	add    rax,rdx
    1e74:	ba 01 00 00 00       	mov    edx,0x1
    1e79:	48 89 c6             	mov    rsi,rax
    1e7c:	bf 00 00 00 00       	mov    edi,0x0
    1e81:	e8 fa f3 ff ff       	call   1280 <read@plt>
    1e86:	48 83 f8 01          	cmp    rax,0x1
    1e8a:	75 26                	jne    1eb2 <readint+0x6e>
    1e8c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
    1e8f:	48 98                	cdqe
    1e91:	0f b6 44 05 d0       	movzx  eax,BYTE PTR [rbp+rax*1-0x30]
    1e96:	3c 0a                	cmp    al,0xa
    1e98:	75 0c                	jne    1ea6 <readint+0x62>
    1e9a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
    1e9d:	48 98                	cdqe
    1e9f:	c6 44 05 d0 00       	mov    BYTE PTR [rbp+rax*1-0x30],0x0
    1ea4:	eb 0d                	jmp    1eb3 <readint+0x6f>
    1ea6:	83 45 cc 01          	add    DWORD PTR [rbp-0x34],0x1
    1eaa:	83 7d cc 1e          	cmp    DWORD PTR [rbp-0x34],0x1e
    1eae:	7e b8                	jle    1e68 <readint+0x24>
    1eb0:	eb 01                	jmp    1eb3 <readint+0x6f>
    1eb2:	90                   	nop
    1eb3:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    1eb7:	48 89 c7             	mov    rdi,rax
    1eba:	e8 11 f4 ff ff       	call   12d0 <atol@plt>
    1ebf:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    1ec3:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    1eca:	00 00 
    1ecc:	74 05                	je     1ed3 <readint+0x8f>
    1ece:	e8 3d f3 ff ff       	call   1210 <__stack_chk_fail@plt>
    1ed3:	c9                   	leave
    1ed4:	c3                   	ret

0000000000001ed5 <readlen>:
    1ed5:	f3 0f 1e fa          	endbr64
    1ed9:	55                   	push   rbp
    1eda:	48 89 e5             	mov    rbp,rsp
    1edd:	48 83 ec 20          	sub    rsp,0x20
    1ee1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    1ee5:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    1ee9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    1ef0:	00 
    1ef1:	eb 48                	jmp    1f3b <readlen+0x66>
    1ef3:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1ef7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1efb:	48 01 d0             	add    rax,rdx
    1efe:	ba 01 00 00 00       	mov    edx,0x1
    1f03:	48 89 c6             	mov    rsi,rax
    1f06:	bf 00 00 00 00       	mov    edi,0x0
    1f0b:	e8 70 f3 ff ff       	call   1280 <read@plt>
    1f10:	48 83 f8 01          	cmp    rax,0x1
    1f14:	75 31                	jne    1f47 <readlen+0x72>
    1f16:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1f1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1f1e:	48 01 d0             	add    rax,rdx
    1f21:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    1f24:	3c 0a                	cmp    al,0xa
    1f26:	75 0e                	jne    1f36 <readlen+0x61>
    1f28:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1f2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1f30:	48 01 d0             	add    rax,rdx
    1f33:	c6 00 00             	mov    BYTE PTR [rax],0x0
    1f36:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    1f3b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1f3f:	48 3b 45 e0          	cmp    rax,QWORD PTR [rbp-0x20]
    1f43:	72 ae                	jb     1ef3 <readlen+0x1e>
    1f45:	eb 01                	jmp    1f48 <readlen+0x73>
    1f47:	90                   	nop
    1f48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1f4c:	c9                   	leave
    1f4d:	c3                   	ret

0000000000001f4e <main>:
    1f4e:	f3 0f 1e fa          	endbr64
    1f52:	55                   	push   rbp
    1f53:	48 89 e5             	mov    rbp,rsp
    1f56:	48 81 ec 70 01 00 00 	sub    rsp,0x170
    1f5d:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1f64:	00 00 
    1f66:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1f6a:	31 c0                	xor    eax,eax
    1f6c:	48 8b 05 ed 31 00 00 	mov    rax,QWORD PTR [rip+0x31ed]        # 5160 <stdin@GLIBC_2.2.5>
    1f73:	b9 00 00 00 00       	mov    ecx,0x0
    1f78:	ba 02 00 00 00       	mov    edx,0x2
    1f7d:	be 00 00 00 00       	mov    esi,0x0
    1f82:	48 89 c7             	mov    rdi,rax
    1f85:	e8 36 f3 ff ff       	call   12c0 <setvbuf@plt>
    1f8a:	48 8b 05 bf 31 00 00 	mov    rax,QWORD PTR [rip+0x31bf]        # 5150 <stdout@GLIBC_2.2.5>
    1f91:	b9 00 00 00 00       	mov    ecx,0x0
    1f96:	ba 02 00 00 00       	mov    edx,0x2
    1f9b:	be 00 00 00 00       	mov    esi,0x0
    1fa0:	48 89 c7             	mov    rdi,rax
    1fa3:	e8 18 f3 ff ff       	call   12c0 <setvbuf@plt>
    1fa8:	b8 00 00 00 00       	mov    eax,0x0
    1fad:	e8 77 f4 ff ff       	call   1429 <apply_seccomp>
    1fb2:	b8 00 00 00 00       	mov    eax,0x0
    1fb7:	e8 00 fe ff ff       	call   1dbc <menu>
    1fbc:	b8 00 00 00 00       	mov    eax,0x0
    1fc1:	e8 7e fe ff ff       	call   1e44 <readint>
    1fc6:	89 85 90 fe ff ff    	mov    DWORD PTR [rbp-0x170],eax
    1fcc:	b8 00 00 00 00       	mov    eax,0x0
    1fd1:	e8 01 f5 ff ff       	call   14d7 <connect_backend>
    1fd6:	89 85 94 fe ff ff    	mov    DWORD PTR [rbp-0x16c],eax
    1fdc:	83 bd 94 fe ff ff 00 	cmp    DWORD PTR [rbp-0x16c],0x0
    1fe3:	7f 0f                	jg     1ff4 <main+0xa6>
    1fe5:	48 8d 05 aa 12 00 00 	lea    rax,[rip+0x12aa]        # 3296 <_IO_stdin_used+0x296>
    1fec:	48 89 c7             	mov    rdi,rax
    1fef:	e8 bd f4 ff ff       	call   14b1 <errorexit>
    1ff4:	83 bd 90 fe ff ff 05 	cmp    DWORD PTR [rbp-0x170],0x5
    1ffb:	0f 87 4e 04 00 00    	ja     244f <main+0x501>
    2001:	8b 85 90 fe ff ff    	mov    eax,DWORD PTR [rbp-0x170]
    2007:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    200e:	00 
    200f:	48 8d 05 ee 12 00 00 	lea    rax,[rip+0x12ee]        # 3304 <_IO_stdin_used+0x304>
    2016:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2019:	48 98                	cdqe
    201b:	48 8d 15 e2 12 00 00 	lea    rdx,[rip+0x12e2]        # 3304 <_IO_stdin_used+0x304>
    2022:	48 01 d0             	add    rax,rdx
    2025:	3e ff e0             	notrack jmp rax
    2028:	48 8d 05 84 12 00 00 	lea    rax,[rip+0x1284]        # 32b3 <_IO_stdin_used+0x2b3>
    202f:	48 89 c7             	mov    rdi,rax
    2032:	b8 00 00 00 00       	mov    eax,0x0
    2037:	e8 f4 f1 ff ff       	call   1230 <printf@plt>
    203c:	48 8d 85 b0 fe ff ff 	lea    rax,[rbp-0x150]
    2043:	ba 10 00 00 00       	mov    edx,0x10
    2048:	48 89 c6             	mov    rsi,rax
    204b:	bf 00 00 00 00       	mov    edi,0x0
    2050:	e8 2b f2 ff ff       	call   1280 <read@plt>
    2055:	48 8d 05 62 12 00 00 	lea    rax,[rip+0x1262]        # 32be <_IO_stdin_used+0x2be>
    205c:	48 89 c7             	mov    rdi,rax
    205f:	b8 00 00 00 00       	mov    eax,0x0
    2064:	e8 c7 f1 ff ff       	call   1230 <printf@plt>
    2069:	48 8d 85 d0 fe ff ff 	lea    rax,[rbp-0x130]
    2070:	ba 10 00 00 00       	mov    edx,0x10
    2075:	48 89 c6             	mov    rsi,rax
    2078:	bf 00 00 00 00       	mov    edi,0x0
    207d:	e8 fe f1 ff ff       	call   1280 <read@plt>
    2082:	48 8d 95 d0 fe ff ff 	lea    rdx,[rbp-0x130]
    2089:	48 8d 8d b0 fe ff ff 	lea    rcx,[rbp-0x150]
    2090:	8b 85 94 fe ff ff    	mov    eax,DWORD PTR [rbp-0x16c]
    2096:	48 89 ce             	mov    rsi,rcx
    2099:	89 c7                	mov    edi,eax
    209b:	e8 dd f4 ff ff       	call   157d <command_login>
    20a0:	e9 ab 03 00 00       	jmp    2450 <main+0x502>
    20a5:	48 8d 05 07 12 00 00 	lea    rax,[rip+0x1207]        # 32b3 <_IO_stdin_used+0x2b3>
    20ac:	48 89 c7             	mov    rdi,rax
    20af:	b8 00 00 00 00       	mov    eax,0x0
    20b4:	e8 77 f1 ff ff       	call   1230 <printf@plt>
    20b9:	48 8d 85 b0 fe ff ff 	lea    rax,[rbp-0x150]
    20c0:	ba 10 00 00 00       	mov    edx,0x10
    20c5:	48 89 c6             	mov    rsi,rax
    20c8:	bf 00 00 00 00       	mov    edi,0x0
    20cd:	e8 ae f1 ff ff       	call   1280 <read@plt>
    20d2:	48 8d 05 e5 11 00 00 	lea    rax,[rip+0x11e5]        # 32be <_IO_stdin_used+0x2be>
    20d9:	48 89 c7             	mov    rdi,rax
    20dc:	b8 00 00 00 00       	mov    eax,0x0
    20e1:	e8 4a f1 ff ff       	call   1230 <printf@plt>
    20e6:	48 8d 85 d0 fe ff ff 	lea    rax,[rbp-0x130]
    20ed:	ba 10 00 00 00       	mov    edx,0x10
    20f2:	48 89 c6             	mov    rsi,rax
    20f5:	bf 00 00 00 00       	mov    edi,0x0
    20fa:	e8 81 f1 ff ff       	call   1280 <read@plt>
    20ff:	48 8d 95 d0 fe ff ff 	lea    rdx,[rbp-0x130]
    2106:	48 8d 8d b0 fe ff ff 	lea    rcx,[rbp-0x150]
    210d:	8b 85 94 fe ff ff    	mov    eax,DWORD PTR [rbp-0x16c]
    2113:	48 89 ce             	mov    rsi,rcx
    2116:	89 c7                	mov    edi,eax
    2118:	e8 18 f6 ff ff       	call   1735 <command_register>
    211d:	e9 2e 03 00 00       	jmp    2450 <main+0x502>
    2122:	48 8d 05 a0 11 00 00 	lea    rax,[rip+0x11a0]        # 32c9 <_IO_stdin_used+0x2c9>
    2129:	48 89 c7             	mov    rdi,rax
    212c:	b8 00 00 00 00       	mov    eax,0x0
    2131:	e8 fa f0 ff ff       	call   1230 <printf@plt>
    2136:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    213d:	ba 80 00 00 00       	mov    edx,0x80
    2142:	48 89 c6             	mov    rsi,rax
    2145:	bf 00 00 00 00       	mov    edi,0x0
    214a:	e8 31 f1 ff ff       	call   1280 <read@plt>
    214f:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    2156:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2159:	84 c0                	test   al,al
    215b:	74 3a                	je     2197 <main+0x249>
    215d:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    2164:	48 89 c7             	mov    rdi,rax
    2167:	e8 94 f0 ff ff       	call   1200 <strlen@plt>
    216c:	48 83 e8 01          	sub    rax,0x1
    2170:	0f b6 84 05 f0 fe ff 	movzx  eax,BYTE PTR [rbp+rax*1-0x110]
    2177:	ff 
    2178:	3c 0a                	cmp    al,0xa
    217a:	75 1b                	jne    2197 <main+0x249>
    217c:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    2183:	48 89 c7             	mov    rdi,rax
    2186:	e8 75 f0 ff ff       	call   1200 <strlen@plt>
    218b:	48 83 e8 01          	sub    rax,0x1
    218f:	c6 84 05 f0 fe ff ff 	mov    BYTE PTR [rbp+rax*1-0x110],0x0
    2196:	00 
    2197:	48 8d 05 37 11 00 00 	lea    rax,[rip+0x1137]        # 32d5 <_IO_stdin_used+0x2d5>
    219e:	48 89 c7             	mov    rdi,rax
    21a1:	b8 00 00 00 00       	mov    eax,0x0
    21a6:	e8 85 f0 ff ff       	call   1230 <printf@plt>
    21ab:	b8 00 00 00 00       	mov    eax,0x0
    21b0:	e8 8f fc ff ff       	call   1e44 <readint>
    21b5:	48 89 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rax
    21bc:	48 81 bd a0 fe ff ff 	cmp    QWORD PTR [rbp-0x160],0x400
    21c3:	00 04 00 00 
    21c7:	76 14                	jbe    21dd <main+0x28f>
    21c9:	48 8d 05 16 11 00 00 	lea    rax,[rip+0x1116]        # 32e6 <_IO_stdin_used+0x2e6>
    21d0:	48 89 c7             	mov    rdi,rax
    21d3:	e8 08 f0 ff ff       	call   11e0 <puts@plt>
    21d8:	e9 73 02 00 00       	jmp    2450 <main+0x502>
    21dd:	48 8b 85 a0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x160]
    21e4:	48 83 c0 01          	add    rax,0x1
    21e8:	48 89 c7             	mov    rdi,rax
    21eb:	e8 c0 f0 ff ff       	call   12b0 <malloc@plt>
    21f0:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
    21f7:	48 8d 05 f1 10 00 00 	lea    rax,[rip+0x10f1]        # 32ef <_IO_stdin_used+0x2ef>
    21fe:	48 89 c7             	mov    rdi,rax
    2201:	b8 00 00 00 00       	mov    eax,0x0
    2206:	e8 25 f0 ff ff       	call   1230 <printf@plt>
    220b:	48 8b 95 a0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x160]
    2212:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
    2219:	48 89 d6             	mov    rsi,rdx
    221c:	48 89 c7             	mov    rdi,rax
    221f:	e8 b1 fc ff ff       	call   1ed5 <readlen>
    2224:	48 8b 95 a8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x158]
    222b:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
    2232:	8b 85 94 fe ff ff    	mov    eax,DWORD PTR [rbp-0x16c]
    2238:	48 89 ce             	mov    rsi,rcx
    223b:	89 c7                	mov    edi,eax
    223d:	e8 88 f6 ff ff       	call   18ca <command_newnote>
    2242:	e9 09 02 00 00       	jmp    2450 <main+0x502>
    2247:	48 8d 05 7b 10 00 00 	lea    rax,[rip+0x107b]        # 32c9 <_IO_stdin_used+0x2c9>
    224e:	48 89 c7             	mov    rdi,rax
    2251:	b8 00 00 00 00       	mov    eax,0x0
    2256:	e8 d5 ef ff ff       	call   1230 <printf@plt>
    225b:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    2262:	ba 80 00 00 00       	mov    edx,0x80
    2267:	48 89 c6             	mov    rsi,rax
    226a:	bf 00 00 00 00       	mov    edi,0x0
    226f:	e8 0c f0 ff ff       	call   1280 <read@plt>
    2274:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    227b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    227e:	84 c0                	test   al,al
    2280:	74 3a                	je     22bc <main+0x36e>
    2282:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    2289:	48 89 c7             	mov    rdi,rax
    228c:	e8 6f ef ff ff       	call   1200 <strlen@plt>
    2291:	48 83 e8 01          	sub    rax,0x1
    2295:	0f b6 84 05 f0 fe ff 	movzx  eax,BYTE PTR [rbp+rax*1-0x110]
    229c:	ff 
    229d:	3c 0a                	cmp    al,0xa
    229f:	75 1b                	jne    22bc <main+0x36e>
    22a1:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    22a8:	48 89 c7             	mov    rdi,rax
    22ab:	e8 50 ef ff ff       	call   1200 <strlen@plt>
    22b0:	48 83 e8 01          	sub    rax,0x1
    22b4:	c6 84 05 f0 fe ff ff 	mov    BYTE PTR [rbp+rax*1-0x110],0x0
    22bb:	00 
    22bc:	48 8d 05 36 10 00 00 	lea    rax,[rip+0x1036]        # 32f9 <_IO_stdin_used+0x2f9>
    22c3:	48 89 c7             	mov    rdi,rax
    22c6:	b8 00 00 00 00       	mov    eax,0x0
    22cb:	e8 60 ef ff ff       	call   1230 <printf@plt>
    22d0:	b8 00 00 00 00       	mov    eax,0x0
    22d5:	e8 6a fb ff ff       	call   1e44 <readint>
    22da:	48 89 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rax
    22e1:	48 8d 05 ed 0f 00 00 	lea    rax,[rip+0xfed]        # 32d5 <_IO_stdin_used+0x2d5>
    22e8:	48 89 c7             	mov    rdi,rax
    22eb:	b8 00 00 00 00       	mov    eax,0x0
    22f0:	e8 3b ef ff ff       	call   1230 <printf@plt>
    22f5:	b8 00 00 00 00       	mov    eax,0x0
    22fa:	e8 45 fb ff ff       	call   1e44 <readint>
    22ff:	48 89 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rax
    2306:	48 81 bd a0 fe ff ff 	cmp    QWORD PTR [rbp-0x160],0x400
    230d:	00 04 00 00 
    2311:	76 14                	jbe    2327 <main+0x3d9>
    2313:	48 8d 05 cc 0f 00 00 	lea    rax,[rip+0xfcc]        # 32e6 <_IO_stdin_used+0x2e6>
    231a:	48 89 c7             	mov    rdi,rax
    231d:	e8 be ee ff ff       	call   11e0 <puts@plt>
    2322:	e9 29 01 00 00       	jmp    2450 <main+0x502>
    2327:	48 8b 85 a0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x160]
    232e:	48 83 c0 01          	add    rax,0x1
    2332:	48 89 c7             	mov    rdi,rax
    2335:	e8 76 ef ff ff       	call   12b0 <malloc@plt>
    233a:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
    2341:	48 8d 05 a7 0f 00 00 	lea    rax,[rip+0xfa7]        # 32ef <_IO_stdin_used+0x2ef>
    2348:	48 89 c7             	mov    rdi,rax
    234b:	b8 00 00 00 00       	mov    eax,0x0
    2350:	e8 db ee ff ff       	call   1230 <printf@plt>
    2355:	48 8b 95 a0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x160]
    235c:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
    2363:	48 89 d6             	mov    rsi,rdx
    2366:	48 89 c7             	mov    rdi,rax
    2369:	e8 67 fb ff ff       	call   1ed5 <readlen>
    236e:	48 8b 8d a8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x158]
    2375:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
    237c:	48 8d b5 f0 fe ff ff 	lea    rsi,[rbp-0x110]
    2383:	8b 85 94 fe ff ff    	mov    eax,DWORD PTR [rbp-0x16c]
    2389:	89 c7                	mov    edi,eax
    238b:	e8 f4 f8 ff ff       	call   1c84 <command_editnote>
    2390:	e9 bb 00 00 00       	jmp    2450 <main+0x502>
    2395:	48 8d 05 2d 0f 00 00 	lea    rax,[rip+0xf2d]        # 32c9 <_IO_stdin_used+0x2c9>
    239c:	48 89 c7             	mov    rdi,rax
    239f:	b8 00 00 00 00       	mov    eax,0x0
    23a4:	e8 87 ee ff ff       	call   1230 <printf@plt>
    23a9:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    23b0:	ba 80 00 00 00       	mov    edx,0x80
    23b5:	48 89 c6             	mov    rsi,rax
    23b8:	bf 00 00 00 00       	mov    edi,0x0
    23bd:	e8 be ee ff ff       	call   1280 <read@plt>
    23c2:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    23c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    23cc:	84 c0                	test   al,al
    23ce:	74 3a                	je     240a <main+0x4bc>
    23d0:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    23d7:	48 89 c7             	mov    rdi,rax
    23da:	e8 21 ee ff ff       	call   1200 <strlen@plt>
    23df:	48 83 e8 01          	sub    rax,0x1
    23e3:	0f b6 84 05 f0 fe ff 	movzx  eax,BYTE PTR [rbp+rax*1-0x110]
    23ea:	ff 
    23eb:	3c 0a                	cmp    al,0xa
    23ed:	75 1b                	jne    240a <main+0x4bc>
    23ef:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
    23f6:	48 89 c7             	mov    rdi,rax
    23f9:	e8 02 ee ff ff       	call   1200 <strlen@plt>
    23fe:	48 83 e8 01          	sub    rax,0x1
    2402:	c6 84 05 f0 fe ff ff 	mov    BYTE PTR [rbp+rax*1-0x110],0x0
    2409:	00 
    240a:	48 8d 05 e8 0e 00 00 	lea    rax,[rip+0xee8]        # 32f9 <_IO_stdin_used+0x2f9>
    2411:	48 89 c7             	mov    rdi,rax
    2414:	b8 00 00 00 00       	mov    eax,0x0
    2419:	e8 12 ee ff ff       	call   1230 <printf@plt>
    241e:	b8 00 00 00 00       	mov    eax,0x0
    2423:	e8 1c fa ff ff       	call   1e44 <readint>
    2428:	48 89 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rax
    242f:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
    2436:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
    243d:	8b 85 94 fe ff ff    	mov    eax,DWORD PTR [rbp-0x16c]
    2443:	48 89 ce             	mov    rsi,rcx
    2446:	89 c7                	mov    edi,eax
    2448:	e8 a8 f8 ff ff       	call   1cf5 <command_shownote>
    244d:	eb 01                	jmp    2450 <main+0x502>
    244f:	90                   	nop
    2450:	8b 85 94 fe ff ff    	mov    eax,DWORD PTR [rbp-0x16c]
    2456:	89 c7                	mov    edi,eax
    2458:	e8 13 ee ff ff       	call   1270 <close@plt>
    245d:	e9 50 fb ff ff       	jmp    1fb2 <main+0x64>

Disassembly of section .fini:

0000000000002464 <_fini>:
    2464:	f3 0f 1e fa          	endbr64
    2468:	48 83 ec 08          	sub    rsp,0x8
    246c:	48 83 c4 08          	add    rsp,0x8
    2470:	c3                   	ret
