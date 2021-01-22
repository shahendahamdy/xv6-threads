
_first:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
exit();
}

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	51                   	push   %ecx
  12:	83 ec 0c             	sub    $0xc,%esp
  
  printf(1, "RUNNING..\n");
  15:	68 b1 09 00 00       	push   $0x9b1
  1a:	6a 01                	push   $0x1
  1c:	e8 5f 07 00 00       	call   780 <printf>
  int pid =thread_create(&f1, NULL, NULL);
  21:	83 c4 0c             	add    $0xc,%esp
  24:	6a 00                	push   $0x0
  26:	6a 00                	push   $0x0
  28:	68 00 01 00 00       	push   $0x100
  2d:	e8 ae 05 00 00       	call   5e0 <thread_create>
  if(pid>0)printf(1,"iam parent\n");
  32:	83 c4 10             	add    $0x10,%esp
  35:	85 c0                	test   %eax,%eax
  37:	7f 2a                	jg     63 <main+0x63>
 else if(pid==0)printf(1,"Iam a child\n");
  39:	74 3b                	je     76 <main+0x76>
  
  printf(1,"SECOND CHILD PID IS %d \n",thread_join());
  3b:	e8 80 03 00 00       	call   3c0 <thread_join>
  40:	83 ec 04             	sub    $0x4,%esp
  43:	50                   	push   %eax
  44:	68 d5 09 00 00       	push   $0x9d5
  49:	6a 01                	push   $0x1
  4b:	e8 30 07 00 00       	call   780 <printf>

  printf(1, "FINISHING .\n");
  50:	58                   	pop    %eax
  51:	5a                   	pop    %edx
  52:	68 ee 09 00 00       	push   $0x9ee
  57:	6a 01                	push   $0x1
  59:	e8 22 07 00 00       	call   780 <printf>
  exit();
  5e:	e8 aa 05 00 00       	call   60d <exit>
  if(pid>0)printf(1,"iam parent\n");
  63:	50                   	push   %eax
  64:	50                   	push   %eax
  65:	68 bc 09 00 00       	push   $0x9bc
  6a:	6a 01                	push   $0x1
  6c:	e8 0f 07 00 00       	call   780 <printf>
  71:	83 c4 10             	add    $0x10,%esp
  74:	eb c5                	jmp    3b <main+0x3b>
 else if(pid==0)printf(1,"Iam a child\n");
  76:	51                   	push   %ecx
  77:	51                   	push   %ecx
  78:	68 c8 09 00 00       	push   $0x9c8
  7d:	6a 01                	push   $0x1
  7f:	e8 fc 06 00 00       	call   780 <printf>
  84:	83 c4 10             	add    $0x10,%esp
  87:	eb b2                	jmp    3b <main+0x3b>
  89:	66 90                	xchg   %ax,%ax
  8b:	66 90                	xchg   %ax,%ax
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <f>:
void f(void* x,void *y){
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	83 ec 10             	sub    $0x10,%esp
printf(1,"I'm a thread \n");
  9a:	68 48 09 00 00       	push   $0x948
  9f:	6a 01                	push   $0x1
  a1:	e8 da 06 00 00       	call   780 <printf>
printf(1,"X = %d \nY = %d \n",*(int*)x,*(int*)y);
  a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  a9:	ff 30                	pushl  (%eax)
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	ff 30                	pushl  (%eax)
  b0:	68 57 09 00 00       	push   $0x957
  b5:	6a 01                	push   $0x1
  b7:	e8 c4 06 00 00       	call   780 <printf>
if(getpid()>0)printf(1,"iam parenttttt\n");
  bc:	83 c4 20             	add    $0x20,%esp
  bf:	e8 c9 05 00 00       	call   68d <getpid>
  c4:	85 c0                	test   %eax,%eax
  c6:	7e 16                	jle    de <f+0x4e>
  c8:	52                   	push   %edx
  c9:	52                   	push   %edx
  ca:	68 68 09 00 00       	push   $0x968
  cf:	6a 01                	push   $0x1
  d1:	e8 aa 06 00 00       	call   780 <printf>
  d6:	83 c4 10             	add    $0x10,%esp
exit();
  d9:	e8 2f 05 00 00       	call   60d <exit>
 else if(getpid()==0)printf(1,"Iam a childddd\n");
  de:	e8 aa 05 00 00       	call   68d <getpid>
  e3:	85 c0                	test   %eax,%eax
  e5:	75 f2                	jne    d9 <f+0x49>
  e7:	50                   	push   %eax
  e8:	50                   	push   %eax
  e9:	68 78 09 00 00       	push   $0x978
  ee:	6a 01                	push   $0x1
  f0:	e8 8b 06 00 00       	call   780 <printf>
  f5:	83 c4 10             	add    $0x10,%esp
  f8:	eb df                	jmp    d9 <f+0x49>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000100 <f1>:
void f1(){
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	83 ec 20             	sub    $0x20,%esp
printf(1,"======threads=====\n");
 10a:	68 88 09 00 00       	push   $0x988
 10f:	6a 01                	push   $0x1
int x=3,y=4;
 111:	c7 45 f0 03 00 00 00 	movl   $0x3,-0x10(%ebp)
 118:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
printf(1,"======threads=====\n");
 11f:	e8 5c 06 00 00       	call   780 <printf>
thread_create(&f,&x,&y);
 124:	83 c4 0c             	add    $0xc,%esp
 127:	8d 45 f4             	lea    -0xc(%ebp),%eax
 12a:	50                   	push   %eax
 12b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 12e:	50                   	push   %eax
 12f:	68 90 00 00 00       	push   $0x90
 134:	e8 a7 04 00 00       	call   5e0 <thread_create>
printf(1,"FIRST CHILD PID %d \n",thread_join());
 139:	e8 82 02 00 00       	call   3c0 <thread_join>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	50                   	push   %eax
 142:	68 9c 09 00 00       	push   $0x99c
 147:	6a 01                	push   $0x1
 149:	e8 32 06 00 00       	call   780 <printf>
exit();
 14e:	e8 ba 04 00 00       	call   60d <exit>
 153:	66 90                	xchg   %ax,%ax
 155:	66 90                	xchg   %ax,%ax
 157:	66 90                	xchg   %ax,%ax
 159:	66 90                	xchg   %ax,%ax
 15b:	66 90                	xchg   %ax,%ax
 15d:	66 90                	xchg   %ax,%ax
 15f:	90                   	nop

00000160 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 165:	31 c0                	xor    %eax,%eax
{
 167:	89 e5                	mov    %esp,%ebp
 169:	53                   	push   %ebx
 16a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 16d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 170:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 174:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 177:	83 c0 01             	add    $0x1,%eax
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 17e:	89 c8                	mov    %ecx,%eax
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	53                   	push   %ebx
 198:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 19e:	0f b6 01             	movzbl (%ecx),%eax
 1a1:	0f b6 1a             	movzbl (%edx),%ebx
 1a4:	84 c0                	test   %al,%al
 1a6:	75 19                	jne    1c1 <strcmp+0x31>
 1a8:	eb 26                	jmp    1d0 <strcmp+0x40>
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1b4:	83 c1 01             	add    $0x1,%ecx
 1b7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ba:	0f b6 1a             	movzbl (%edx),%ebx
 1bd:	84 c0                	test   %al,%al
 1bf:	74 0f                	je     1d0 <strcmp+0x40>
 1c1:	38 d8                	cmp    %bl,%al
 1c3:	74 eb                	je     1b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1c5:	29 d8                	sub    %ebx,%eax
}
 1c7:	5b                   	pop    %ebx
 1c8:	5d                   	pop    %ebp
 1c9:	c3                   	ret    
 1ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1d2:	29 d8                	sub    %ebx,%eax
}
 1d4:	5b                   	pop    %ebx
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1de:	66 90                	xchg   %ax,%ax

000001e0 <strlen>:

uint
strlen(const char *s)
{
 1e0:	f3 0f 1e fb          	endbr32 
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1ea:	80 3a 00             	cmpb   $0x0,(%edx)
 1ed:	74 21                	je     210 <strlen+0x30>
 1ef:	31 c0                	xor    %eax,%eax
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f8:	83 c0 01             	add    $0x1,%eax
 1fb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1ff:	89 c1                	mov    %eax,%ecx
 201:	75 f5                	jne    1f8 <strlen+0x18>
    ;
  return n;
}
 203:	89 c8                	mov    %ecx,%eax
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 210:	31 c9                	xor    %ecx,%ecx
}
 212:	5d                   	pop    %ebp
 213:	89 c8                	mov    %ecx,%eax
 215:	c3                   	ret    
 216:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21d:	8d 76 00             	lea    0x0(%esi),%esi

00000220 <memset>:

void*
memset(void *dst, int c, uint n)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	57                   	push   %edi
 228:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 22b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	89 d7                	mov    %edx,%edi
 233:	fc                   	cld    
 234:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 236:	89 d0                	mov    %edx,%eax
 238:	5f                   	pop    %edi
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <strchr>:

char*
strchr(const char *s, char c)
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 24e:	0f b6 10             	movzbl (%eax),%edx
 251:	84 d2                	test   %dl,%dl
 253:	75 16                	jne    26b <strchr+0x2b>
 255:	eb 21                	jmp    278 <strchr+0x38>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax
 260:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 264:	83 c0 01             	add    $0x1,%eax
 267:	84 d2                	test   %dl,%dl
 269:	74 0d                	je     278 <strchr+0x38>
    if(*s == c)
 26b:	38 d1                	cmp    %dl,%cl
 26d:	75 f1                	jne    260 <strchr+0x20>
      return (char*)s;
  return 0;
}
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 278:	31 c0                	xor    %eax,%eax
}
 27a:	5d                   	pop    %ebp
 27b:	c3                   	ret    
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <gets>:

char*
gets(char *buf, int max)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	57                   	push   %edi
 288:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 289:	31 f6                	xor    %esi,%esi
{
 28b:	53                   	push   %ebx
 28c:	89 f3                	mov    %esi,%ebx
 28e:	83 ec 1c             	sub    $0x1c,%esp
 291:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 294:	eb 33                	jmp    2c9 <gets+0x49>
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2a0:	83 ec 04             	sub    $0x4,%esp
 2a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a6:	6a 01                	push   $0x1
 2a8:	50                   	push   %eax
 2a9:	6a 00                	push   $0x0
 2ab:	e8 75 03 00 00       	call   625 <read>
    if(cc < 1)
 2b0:	83 c4 10             	add    $0x10,%esp
 2b3:	85 c0                	test   %eax,%eax
 2b5:	7e 1c                	jle    2d3 <gets+0x53>
      break;
    buf[i++] = c;
 2b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2bb:	83 c7 01             	add    $0x1,%edi
 2be:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2c1:	3c 0a                	cmp    $0xa,%al
 2c3:	74 23                	je     2e8 <gets+0x68>
 2c5:	3c 0d                	cmp    $0xd,%al
 2c7:	74 1f                	je     2e8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2c9:	83 c3 01             	add    $0x1,%ebx
 2cc:	89 fe                	mov    %edi,%esi
 2ce:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d1:	7c cd                	jl     2a0 <gets+0x20>
 2d3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2d8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2de:	5b                   	pop    %ebx
 2df:	5e                   	pop    %esi
 2e0:	5f                   	pop    %edi
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    
 2e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e7:	90                   	nop
 2e8:	8b 75 08             	mov    0x8(%ebp),%esi
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ee:	01 de                	add    %ebx,%esi
 2f0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2f2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2f8:	5b                   	pop    %ebx
 2f9:	5e                   	pop    %esi
 2fa:	5f                   	pop    %edi
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret    
 2fd:	8d 76 00             	lea    0x0(%esi),%esi

00000300 <stat>:

int
stat(const char *n, struct stat *st)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	56                   	push   %esi
 308:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 309:	83 ec 08             	sub    $0x8,%esp
 30c:	6a 00                	push   $0x0
 30e:	ff 75 08             	pushl  0x8(%ebp)
 311:	e8 37 03 00 00       	call   64d <open>
  if(fd < 0)
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	78 2b                	js     348 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 31d:	83 ec 08             	sub    $0x8,%esp
 320:	ff 75 0c             	pushl  0xc(%ebp)
 323:	89 c3                	mov    %eax,%ebx
 325:	50                   	push   %eax
 326:	e8 3a 03 00 00       	call   665 <fstat>
  close(fd);
 32b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 32e:	89 c6                	mov    %eax,%esi
  close(fd);
 330:	e8 00 03 00 00       	call   635 <close>
  return r;
 335:	83 c4 10             	add    $0x10,%esp
}
 338:	8d 65 f8             	lea    -0x8(%ebp),%esp
 33b:	89 f0                	mov    %esi,%eax
 33d:	5b                   	pop    %ebx
 33e:	5e                   	pop    %esi
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 348:	be ff ff ff ff       	mov    $0xffffffff,%esi
 34d:	eb e9                	jmp    338 <stat+0x38>
 34f:	90                   	nop

00000350 <atoi>:

int
atoi(const char *s)
{
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	53                   	push   %ebx
 358:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 35b:	0f be 02             	movsbl (%edx),%eax
 35e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 361:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 364:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 369:	77 1a                	ja     385 <atoi+0x35>
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop
    n = n*10 + *s++ - '0';
 370:	83 c2 01             	add    $0x1,%edx
 373:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 376:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 37a:	0f be 02             	movsbl (%edx),%eax
 37d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 380:	80 fb 09             	cmp    $0x9,%bl
 383:	76 eb                	jbe    370 <atoi+0x20>
  return n;
}
 385:	89 c8                	mov    %ecx,%eax
 387:	5b                   	pop    %ebx
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	57                   	push   %edi
 398:	8b 45 10             	mov    0x10(%ebp),%eax
 39b:	8b 55 08             	mov    0x8(%ebp),%edx
 39e:	56                   	push   %esi
 39f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a2:	85 c0                	test   %eax,%eax
 3a4:	7e 0f                	jle    3b5 <memmove+0x25>
 3a6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3a8:	89 d7                	mov    %edx,%edi
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3b1:	39 f8                	cmp    %edi,%eax
 3b3:	75 fb                	jne    3b0 <memmove+0x20>
  return vdst;
}
 3b5:	5e                   	pop    %esi
 3b6:	89 d0                	mov    %edx,%eax
 3b8:	5f                   	pop    %edi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret    
 3bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 3ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3cd:	50                   	push   %eax
 3ce:	e8 f2 02 00 00       	call   6c5 <join>
  
  return x;
}
 3d3:	c9                   	leave  
 3d4:	c3                   	ret    
 3d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <lock_init>:

void lock_init(struct lock_t *lk){
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 3e7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3f0:	5d                   	pop    %ebp
 3f1:	c3                   	ret    
 3f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 405:	b9 01 00 00 00       	mov    $0x1,%ecx
 40a:	89 e5                	mov    %esp,%ebp
 40c:	8b 55 08             	mov    0x8(%ebp),%edx
 40f:	90                   	nop
 410:	89 c8                	mov    %ecx,%eax
 412:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 415:	85 c0                	test   %eax,%eax
 417:	75 f7                	jne    410 <lock_acquire+0x10>
}
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <lock_release>:
void lock_release(struct lock_t *lk){
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	31 c0                	xor    %eax,%eax
 427:	89 e5                	mov    %esp,%ebp
 429:	8b 55 08             	mov    0x8(%ebp),%edx
 42c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop

00000440 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 445:	a1 84 0d 00 00       	mov    0xd84,%eax
{
 44a:	89 e5                	mov    %esp,%ebp
 44c:	57                   	push   %edi
 44d:	56                   	push   %esi
 44e:	53                   	push   %ebx
 44f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 452:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 454:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 457:	39 c8                	cmp    %ecx,%eax
 459:	73 15                	jae    470 <free+0x30>
 45b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop
 460:	39 d1                	cmp    %edx,%ecx
 462:	72 14                	jb     478 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 464:	39 d0                	cmp    %edx,%eax
 466:	73 10                	jae    478 <free+0x38>
{
 468:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 46a:	8b 10                	mov    (%eax),%edx
 46c:	39 c8                	cmp    %ecx,%eax
 46e:	72 f0                	jb     460 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 470:	39 d0                	cmp    %edx,%eax
 472:	72 f4                	jb     468 <free+0x28>
 474:	39 d1                	cmp    %edx,%ecx
 476:	73 f0                	jae    468 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 478:	8b 73 fc             	mov    -0x4(%ebx),%esi
 47b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 47e:	39 fa                	cmp    %edi,%edx
 480:	74 1e                	je     4a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 482:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 485:	8b 50 04             	mov    0x4(%eax),%edx
 488:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 48b:	39 f1                	cmp    %esi,%ecx
 48d:	74 28                	je     4b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 48f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 491:	5b                   	pop    %ebx
  freep = p;
 492:	a3 84 0d 00 00       	mov    %eax,0xd84
}
 497:	5e                   	pop    %esi
 498:	5f                   	pop    %edi
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 4a0:	03 72 04             	add    0x4(%edx),%esi
 4a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 4a6:	8b 10                	mov    (%eax),%edx
 4a8:	8b 12                	mov    (%edx),%edx
 4aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 4ad:	8b 50 04             	mov    0x4(%eax),%edx
 4b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 4b3:	39 f1                	cmp    %esi,%ecx
 4b5:	75 d8                	jne    48f <free+0x4f>
    p->s.size += bp->s.size;
 4b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 4ba:	a3 84 0d 00 00       	mov    %eax,0xd84
    p->s.size += bp->s.size;
 4bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 4c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 4c5:	89 10                	mov    %edx,(%eax)
}
 4c7:	5b                   	pop    %ebx
 4c8:	5e                   	pop    %esi
 4c9:	5f                   	pop    %edi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	57                   	push   %edi
 4d8:	56                   	push   %esi
 4d9:	53                   	push   %ebx
 4da:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 4e0:	8b 3d 84 0d 00 00    	mov    0xd84,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4e6:	8d 70 07             	lea    0x7(%eax),%esi
 4e9:	c1 ee 03             	shr    $0x3,%esi
 4ec:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 4ef:	85 ff                	test   %edi,%edi
 4f1:	0f 84 a9 00 00 00    	je     5a0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4f7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 4f9:	8b 48 04             	mov    0x4(%eax),%ecx
 4fc:	39 f1                	cmp    %esi,%ecx
 4fe:	73 6d                	jae    56d <malloc+0x9d>
 500:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 506:	bb 00 10 00 00       	mov    $0x1000,%ebx
 50b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 50e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 515:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 518:	eb 17                	jmp    531 <malloc+0x61>
 51a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 520:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 522:	8b 4a 04             	mov    0x4(%edx),%ecx
 525:	39 f1                	cmp    %esi,%ecx
 527:	73 4f                	jae    578 <malloc+0xa8>
 529:	8b 3d 84 0d 00 00    	mov    0xd84,%edi
 52f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 531:	39 c7                	cmp    %eax,%edi
 533:	75 eb                	jne    520 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 535:	83 ec 0c             	sub    $0xc,%esp
 538:	ff 75 e4             	pushl  -0x1c(%ebp)
 53b:	e8 65 01 00 00       	call   6a5 <sbrk>
  if(p == (char*)-1)
 540:	83 c4 10             	add    $0x10,%esp
 543:	83 f8 ff             	cmp    $0xffffffff,%eax
 546:	74 1b                	je     563 <malloc+0x93>
  hp->s.size = nu;
 548:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 54b:	83 ec 0c             	sub    $0xc,%esp
 54e:	83 c0 08             	add    $0x8,%eax
 551:	50                   	push   %eax
 552:	e8 e9 fe ff ff       	call   440 <free>
  return freep;
 557:	a1 84 0d 00 00       	mov    0xd84,%eax
      if((p = morecore(nunits)) == 0)
 55c:	83 c4 10             	add    $0x10,%esp
 55f:	85 c0                	test   %eax,%eax
 561:	75 bd                	jne    520 <malloc+0x50>
        return 0;
  }
}
 563:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 566:	31 c0                	xor    %eax,%eax
}
 568:	5b                   	pop    %ebx
 569:	5e                   	pop    %esi
 56a:	5f                   	pop    %edi
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret    
    if(p->s.size >= nunits){
 56d:	89 c2                	mov    %eax,%edx
 56f:	89 f8                	mov    %edi,%eax
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 578:	39 ce                	cmp    %ecx,%esi
 57a:	74 54                	je     5d0 <malloc+0x100>
        p->s.size -= nunits;
 57c:	29 f1                	sub    %esi,%ecx
 57e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 581:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 584:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 587:	a3 84 0d 00 00       	mov    %eax,0xd84
}
 58c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 58f:	8d 42 08             	lea    0x8(%edx),%eax
}
 592:	5b                   	pop    %ebx
 593:	5e                   	pop    %esi
 594:	5f                   	pop    %edi
 595:	5d                   	pop    %ebp
 596:	c3                   	ret    
 597:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 5a0:	c7 05 84 0d 00 00 88 	movl   $0xd88,0xd84
 5a7:	0d 00 00 
    base.s.size = 0;
 5aa:	bf 88 0d 00 00       	mov    $0xd88,%edi
    base.s.ptr = freep = prevp = &base;
 5af:	c7 05 88 0d 00 00 88 	movl   $0xd88,0xd88
 5b6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5b9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 5bb:	c7 05 8c 0d 00 00 00 	movl   $0x0,0xd8c
 5c2:	00 00 00 
    if(p->s.size >= nunits){
 5c5:	e9 36 ff ff ff       	jmp    500 <malloc+0x30>
 5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 5d0:	8b 0a                	mov    (%edx),%ecx
 5d2:	89 08                	mov    %ecx,(%eax)
 5d4:	eb b1                	jmp    587 <malloc+0xb7>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi

000005e0 <thread_create>:
{
 5e0:	f3 0f 1e fb          	endbr32 
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 5ea:	68 00 10 00 00       	push   $0x1000
 5ef:	e8 dc fe ff ff       	call   4d0 <malloc>
return clone(start_routine,arg1,arg2,stack);
 5f4:	50                   	push   %eax
 5f5:	ff 75 10             	pushl  0x10(%ebp)
 5f8:	ff 75 0c             	pushl  0xc(%ebp)
 5fb:	ff 75 08             	pushl  0x8(%ebp)
 5fe:	e8 ba 00 00 00       	call   6bd <clone>
}
 603:	c9                   	leave  
 604:	c3                   	ret    

00000605 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 605:	b8 01 00 00 00       	mov    $0x1,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <exit>:
SYSCALL(exit)
 60d:	b8 02 00 00 00       	mov    $0x2,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <wait>:
SYSCALL(wait)
 615:	b8 03 00 00 00       	mov    $0x3,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <pipe>:
SYSCALL(pipe)
 61d:	b8 04 00 00 00       	mov    $0x4,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <read>:
SYSCALL(read)
 625:	b8 05 00 00 00       	mov    $0x5,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <write>:
SYSCALL(write)
 62d:	b8 10 00 00 00       	mov    $0x10,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <close>:
SYSCALL(close)
 635:	b8 15 00 00 00       	mov    $0x15,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <kill>:
SYSCALL(kill)
 63d:	b8 06 00 00 00       	mov    $0x6,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <exec>:
SYSCALL(exec)
 645:	b8 07 00 00 00       	mov    $0x7,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <open>:
SYSCALL(open)
 64d:	b8 0f 00 00 00       	mov    $0xf,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <mknod>:
SYSCALL(mknod)
 655:	b8 11 00 00 00       	mov    $0x11,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <unlink>:
SYSCALL(unlink)
 65d:	b8 12 00 00 00       	mov    $0x12,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <fstat>:
SYSCALL(fstat)
 665:	b8 08 00 00 00       	mov    $0x8,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <link>:
SYSCALL(link)
 66d:	b8 13 00 00 00       	mov    $0x13,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <mkdir>:
SYSCALL(mkdir)
 675:	b8 14 00 00 00       	mov    $0x14,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <chdir>:
SYSCALL(chdir)
 67d:	b8 09 00 00 00       	mov    $0x9,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <dup>:
SYSCALL(dup)
 685:	b8 0a 00 00 00       	mov    $0xa,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <getpid>:
SYSCALL(getpid)
 68d:	b8 0b 00 00 00       	mov    $0xb,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <getyear>:
SYSCALL(getyear)
 695:	b8 16 00 00 00       	mov    $0x16,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    

0000069d <getreadcount>:
SYSCALL(getreadcount)
 69d:	b8 17 00 00 00       	mov    $0x17,%eax
 6a2:	cd 40                	int    $0x40
 6a4:	c3                   	ret    

000006a5 <sbrk>:
SYSCALL(sbrk)
 6a5:	b8 0c 00 00 00       	mov    $0xc,%eax
 6aa:	cd 40                	int    $0x40
 6ac:	c3                   	ret    

000006ad <sleep>:
SYSCALL(sleep)
 6ad:	b8 0d 00 00 00       	mov    $0xd,%eax
 6b2:	cd 40                	int    $0x40
 6b4:	c3                   	ret    

000006b5 <uptime>:
SYSCALL(uptime)
 6b5:	b8 0e 00 00 00       	mov    $0xe,%eax
 6ba:	cd 40                	int    $0x40
 6bc:	c3                   	ret    

000006bd <clone>:
SYSCALL(clone)
 6bd:	b8 18 00 00 00       	mov    $0x18,%eax
 6c2:	cd 40                	int    $0x40
 6c4:	c3                   	ret    

000006c5 <join>:
SYSCALL(join)
 6c5:	b8 19 00 00 00       	mov    $0x19,%eax
 6ca:	cd 40                	int    $0x40
 6cc:	c3                   	ret    
 6cd:	66 90                	xchg   %ax,%ax
 6cf:	90                   	nop

000006d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 3c             	sub    $0x3c,%esp
 6d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6dc:	89 d1                	mov    %edx,%ecx
{
 6de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6e1:	85 d2                	test   %edx,%edx
 6e3:	0f 89 7f 00 00 00    	jns    768 <printint+0x98>
 6e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6ed:	74 79                	je     768 <printint+0x98>
    neg = 1;
 6ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6f8:	31 db                	xor    %ebx,%ebx
 6fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 700:	89 c8                	mov    %ecx,%eax
 702:	31 d2                	xor    %edx,%edx
 704:	89 cf                	mov    %ecx,%edi
 706:	f7 75 c4             	divl   -0x3c(%ebp)
 709:	0f b6 92 04 0a 00 00 	movzbl 0xa04(%edx),%edx
 710:	89 45 c0             	mov    %eax,-0x40(%ebp)
 713:	89 d8                	mov    %ebx,%eax
 715:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 718:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 71b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 71e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 721:	76 dd                	jbe    700 <printint+0x30>
  if(neg)
 723:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 726:	85 c9                	test   %ecx,%ecx
 728:	74 0c                	je     736 <printint+0x66>
    buf[i++] = '-';
 72a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 72f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 731:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 736:	8b 7d b8             	mov    -0x48(%ebp),%edi
 739:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 73d:	eb 07                	jmp    746 <printint+0x76>
 73f:	90                   	nop
 740:	0f b6 13             	movzbl (%ebx),%edx
 743:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 746:	83 ec 04             	sub    $0x4,%esp
 749:	88 55 d7             	mov    %dl,-0x29(%ebp)
 74c:	6a 01                	push   $0x1
 74e:	56                   	push   %esi
 74f:	57                   	push   %edi
 750:	e8 d8 fe ff ff       	call   62d <write>
  while(--i >= 0)
 755:	83 c4 10             	add    $0x10,%esp
 758:	39 de                	cmp    %ebx,%esi
 75a:	75 e4                	jne    740 <printint+0x70>
    putc(fd, buf[i]);
}
 75c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 75f:	5b                   	pop    %ebx
 760:	5e                   	pop    %esi
 761:	5f                   	pop    %edi
 762:	5d                   	pop    %ebp
 763:	c3                   	ret    
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 768:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 76f:	eb 87                	jmp    6f8 <printint+0x28>
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 778:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop

00000780 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 780:	f3 0f 1e fb          	endbr32 
 784:	55                   	push   %ebp
 785:	89 e5                	mov    %esp,%ebp
 787:	57                   	push   %edi
 788:	56                   	push   %esi
 789:	53                   	push   %ebx
 78a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 78d:	8b 75 0c             	mov    0xc(%ebp),%esi
 790:	0f b6 1e             	movzbl (%esi),%ebx
 793:	84 db                	test   %bl,%bl
 795:	0f 84 b4 00 00 00    	je     84f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 79b:	8d 45 10             	lea    0x10(%ebp),%eax
 79e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 7a1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7a4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 7a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7a9:	eb 33                	jmp    7de <printf+0x5e>
 7ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
 7b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7b3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 7b8:	83 f8 25             	cmp    $0x25,%eax
 7bb:	74 17                	je     7d4 <printf+0x54>
  write(fd, &c, 1);
 7bd:	83 ec 04             	sub    $0x4,%esp
 7c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7c3:	6a 01                	push   $0x1
 7c5:	57                   	push   %edi
 7c6:	ff 75 08             	pushl  0x8(%ebp)
 7c9:	e8 5f fe ff ff       	call   62d <write>
 7ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 7d1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7d4:	0f b6 1e             	movzbl (%esi),%ebx
 7d7:	83 c6 01             	add    $0x1,%esi
 7da:	84 db                	test   %bl,%bl
 7dc:	74 71                	je     84f <printf+0xcf>
    c = fmt[i] & 0xff;
 7de:	0f be cb             	movsbl %bl,%ecx
 7e1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7e4:	85 d2                	test   %edx,%edx
 7e6:	74 c8                	je     7b0 <printf+0x30>
      }
    } else if(state == '%'){
 7e8:	83 fa 25             	cmp    $0x25,%edx
 7eb:	75 e7                	jne    7d4 <printf+0x54>
      if(c == 'd'){
 7ed:	83 f8 64             	cmp    $0x64,%eax
 7f0:	0f 84 9a 00 00 00    	je     890 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7f6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7fc:	83 f9 70             	cmp    $0x70,%ecx
 7ff:	74 5f                	je     860 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 801:	83 f8 73             	cmp    $0x73,%eax
 804:	0f 84 d6 00 00 00    	je     8e0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 80a:	83 f8 63             	cmp    $0x63,%eax
 80d:	0f 84 8d 00 00 00    	je     8a0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 813:	83 f8 25             	cmp    $0x25,%eax
 816:	0f 84 b4 00 00 00    	je     8d0 <printf+0x150>
  write(fd, &c, 1);
 81c:	83 ec 04             	sub    $0x4,%esp
 81f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 823:	6a 01                	push   $0x1
 825:	57                   	push   %edi
 826:	ff 75 08             	pushl  0x8(%ebp)
 829:	e8 ff fd ff ff       	call   62d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 82e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 831:	83 c4 0c             	add    $0xc,%esp
 834:	6a 01                	push   $0x1
 836:	83 c6 01             	add    $0x1,%esi
 839:	57                   	push   %edi
 83a:	ff 75 08             	pushl  0x8(%ebp)
 83d:	e8 eb fd ff ff       	call   62d <write>
  for(i = 0; fmt[i]; i++){
 842:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 846:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 849:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 84b:	84 db                	test   %bl,%bl
 84d:	75 8f                	jne    7de <printf+0x5e>
    }
  }
}
 84f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 852:	5b                   	pop    %ebx
 853:	5e                   	pop    %esi
 854:	5f                   	pop    %edi
 855:	5d                   	pop    %ebp
 856:	c3                   	ret    
 857:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	b9 10 00 00 00       	mov    $0x10,%ecx
 868:	6a 00                	push   $0x0
 86a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	8b 13                	mov    (%ebx),%edx
 872:	e8 59 fe ff ff       	call   6d0 <printint>
        ap++;
 877:	89 d8                	mov    %ebx,%eax
 879:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87c:	31 d2                	xor    %edx,%edx
        ap++;
 87e:	83 c0 04             	add    $0x4,%eax
 881:	89 45 d0             	mov    %eax,-0x30(%ebp)
 884:	e9 4b ff ff ff       	jmp    7d4 <printf+0x54>
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 890:	83 ec 0c             	sub    $0xc,%esp
 893:	b9 0a 00 00 00       	mov    $0xa,%ecx
 898:	6a 01                	push   $0x1
 89a:	eb ce                	jmp    86a <printf+0xea>
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 8a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 8a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8a6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 8a8:	6a 01                	push   $0x1
        ap++;
 8aa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 8ad:	57                   	push   %edi
 8ae:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 8b1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8b4:	e8 74 fd ff ff       	call   62d <write>
        ap++;
 8b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8bf:	31 d2                	xor    %edx,%edx
 8c1:	e9 0e ff ff ff       	jmp    7d4 <printf+0x54>
 8c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8cd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 8d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8d3:	83 ec 04             	sub    $0x4,%esp
 8d6:	e9 59 ff ff ff       	jmp    834 <printf+0xb4>
 8db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8df:	90                   	nop
        s = (char*)*ap;
 8e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8e3:	8b 18                	mov    (%eax),%ebx
        ap++;
 8e5:	83 c0 04             	add    $0x4,%eax
 8e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8eb:	85 db                	test   %ebx,%ebx
 8ed:	74 17                	je     906 <printf+0x186>
        while(*s != 0){
 8ef:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 8f2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 8f4:	84 c0                	test   %al,%al
 8f6:	0f 84 d8 fe ff ff    	je     7d4 <printf+0x54>
 8fc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8ff:	89 de                	mov    %ebx,%esi
 901:	8b 5d 08             	mov    0x8(%ebp),%ebx
 904:	eb 1a                	jmp    920 <printf+0x1a0>
          s = "(null)";
 906:	bb fb 09 00 00       	mov    $0x9fb,%ebx
        while(*s != 0){
 90b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 90e:	b8 28 00 00 00       	mov    $0x28,%eax
 913:	89 de                	mov    %ebx,%esi
 915:	8b 5d 08             	mov    0x8(%ebp),%ebx
 918:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91f:	90                   	nop
  write(fd, &c, 1);
 920:	83 ec 04             	sub    $0x4,%esp
          s++;
 923:	83 c6 01             	add    $0x1,%esi
 926:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 929:	6a 01                	push   $0x1
 92b:	57                   	push   %edi
 92c:	53                   	push   %ebx
 92d:	e8 fb fc ff ff       	call   62d <write>
        while(*s != 0){
 932:	0f b6 06             	movzbl (%esi),%eax
 935:	83 c4 10             	add    $0x10,%esp
 938:	84 c0                	test   %al,%al
 93a:	75 e4                	jne    920 <printf+0x1a0>
 93c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 93f:	31 d2                	xor    %edx,%edx
 941:	e9 8e fe ff ff       	jmp    7d4 <printf+0x54>
