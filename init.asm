
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 d8 08 00 00       	push   $0x8d8
  1d:	e8 bb 05 00 00       	call   5dd <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 9b 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  2d:	83 ec 0c             	sub    $0xc,%esp
  30:	6a 00                	push   $0x0
  32:	e8 de 05 00 00       	call   615 <dup>
  dup(0);  // stderr
  37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3e:	e8 d2 05 00 00       	call   615 <dup>
  43:	83 c4 10             	add    $0x10,%esp
  46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4d:	8d 76 00             	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 e0 08 00 00       	push   $0x8e0
  58:	6a 01                	push   $0x1
  5a:	e8 b1 06 00 00       	call   710 <printf>
    pid = fork();
  5f:	e8 31 05 00 00       	call   595 <fork>
    if(pid < 0){
  64:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  67:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  69:	85 c0                	test   %eax,%eax
  6b:	78 24                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  6d:	74 35                	je     a4 <main+0xa4>
  6f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 30 05 00 00       	call   5a5 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 d7                	js     50 <main+0x50>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 d3                	je     50 <main+0x50>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 1f 09 00 00       	push   $0x91f
  85:	6a 01                	push   $0x1
  87:	e8 84 06 00 00       	call   710 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 f3 08 00 00       	push   $0x8f3
  98:	6a 01                	push   $0x1
  9a:	e8 71 06 00 00       	call   710 <printf>
      exit();
  9f:	e8 f9 04 00 00       	call   59d <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 7c 0c 00 00       	push   $0xc7c
  ab:	68 06 09 00 00       	push   $0x906
  b0:	e8 20 05 00 00       	call   5d5 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 09 09 00 00       	push   $0x909
  bc:	6a 01                	push   $0x1
  be:	e8 4d 06 00 00       	call   710 <printf>
      exit();
  c3:	e8 d5 04 00 00       	call   59d <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 d8 08 00 00       	push   $0x8d8
  d2:	e8 0e 05 00 00       	call   5e5 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 d8 08 00 00       	push   $0x8d8
  e0:	e8 f8 04 00 00       	call   5dd <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 40 ff ff ff       	jmp    2d <main+0x2d>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f5:	31 c0                	xor    %eax,%eax
{
  f7:	89 e5                	mov    %esp,%ebp
  f9:	53                   	push   %ebx
  fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	89 c8                	mov    %ecx,%eax
 110:	5b                   	pop    %ebx
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
 113:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	53                   	push   %ebx
 128:	8b 4d 08             	mov    0x8(%ebp),%ecx
 12b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 12e:	0f b6 01             	movzbl (%ecx),%eax
 131:	0f b6 1a             	movzbl (%edx),%ebx
 134:	84 c0                	test   %al,%al
 136:	75 19                	jne    151 <strcmp+0x31>
 138:	eb 26                	jmp    160 <strcmp+0x40>
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 140:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 144:	83 c1 01             	add    $0x1,%ecx
 147:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 14a:	0f b6 1a             	movzbl (%edx),%ebx
 14d:	84 c0                	test   %al,%al
 14f:	74 0f                	je     160 <strcmp+0x40>
 151:	38 d8                	cmp    %bl,%al
 153:	74 eb                	je     140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 155:	29 d8                	sub    %ebx,%eax
}
 157:	5b                   	pop    %ebx
 158:	5d                   	pop    %ebp
 159:	c3                   	ret    
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 162:	29 d8                	sub    %ebx,%eax
}
 164:	5b                   	pop    %ebx
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 17a:	80 3a 00             	cmpb   $0x0,(%edx)
 17d:	74 21                	je     1a0 <strlen+0x30>
 17f:	31 c0                	xor    %eax,%eax
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 188:	83 c0 01             	add    $0x1,%eax
 18b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 18f:	89 c1                	mov    %eax,%ecx
 191:	75 f5                	jne    188 <strlen+0x18>
    ;
  return n;
}
 193:	89 c8                	mov    %ecx,%eax
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 d7                	mov    %edx,%edi
 1c3:	fc                   	cld    
 1c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c6:	89 d0                	mov    %edx,%eax
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1de:	0f b6 10             	movzbl (%eax),%edx
 1e1:	84 d2                	test   %dl,%dl
 1e3:	75 16                	jne    1fb <strchr+0x2b>
 1e5:	eb 21                	jmp    208 <strchr+0x38>
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
 1f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	84 d2                	test   %dl,%dl
 1f9:	74 0d                	je     208 <strchr+0x38>
    if(*s == c)
 1fb:	38 d1                	cmp    %dl,%cl
 1fd:	75 f1                	jne    1f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 208:	31 c0                	xor    %eax,%eax
}
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 219:	31 f6                	xor    %esi,%esi
{
 21b:	53                   	push   %ebx
 21c:	89 f3                	mov    %esi,%ebx
 21e:	83 ec 1c             	sub    $0x1c,%esp
 221:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 224:	eb 33                	jmp    259 <gets+0x49>
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 230:	83 ec 04             	sub    $0x4,%esp
 233:	8d 45 e7             	lea    -0x19(%ebp),%eax
 236:	6a 01                	push   $0x1
 238:	50                   	push   %eax
 239:	6a 00                	push   $0x0
 23b:	e8 75 03 00 00       	call   5b5 <read>
    if(cc < 1)
 240:	83 c4 10             	add    $0x10,%esp
 243:	85 c0                	test   %eax,%eax
 245:	7e 1c                	jle    263 <gets+0x53>
      break;
    buf[i++] = c;
 247:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 24b:	83 c7 01             	add    $0x1,%edi
 24e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 251:	3c 0a                	cmp    $0xa,%al
 253:	74 23                	je     278 <gets+0x68>
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 1f                	je     278 <gets+0x68>
  for(i=0; i+1 < max; ){
 259:	83 c3 01             	add    $0x1,%ebx
 25c:	89 fe                	mov    %edi,%esi
 25e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 261:	7c cd                	jl     230 <gets+0x20>
 263:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 265:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 268:	c6 03 00             	movb   $0x0,(%ebx)
}
 26b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26e:	5b                   	pop    %ebx
 26f:	5e                   	pop    %esi
 270:	5f                   	pop    %edi
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	8b 75 08             	mov    0x8(%ebp),%esi
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	01 de                	add    %ebx,%esi
 280:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 282:	c6 03 00             	movb   $0x0,(%ebx)
}
 285:	8d 65 f4             	lea    -0xc(%ebp),%esp
 288:	5b                   	pop    %ebx
 289:	5e                   	pop    %esi
 28a:	5f                   	pop    %edi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	56                   	push   %esi
 298:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	6a 00                	push   $0x0
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 37 03 00 00       	call   5dd <open>
  if(fd < 0)
 2a6:	83 c4 10             	add    $0x10,%esp
 2a9:	85 c0                	test   %eax,%eax
 2ab:	78 2b                	js     2d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	89 c3                	mov    %eax,%ebx
 2b5:	50                   	push   %eax
 2b6:	e8 3a 03 00 00       	call   5f5 <fstat>
  close(fd);
 2bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2be:	89 c6                	mov    %eax,%esi
  close(fd);
 2c0:	e8 00 03 00 00       	call   5c5 <close>
  return r;
 2c5:	83 c4 10             	add    $0x10,%esp
}
 2c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    
 2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2dd:	eb e9                	jmp    2c8 <stat+0x38>
 2df:	90                   	nop

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	53                   	push   %ebx
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2eb:	0f be 02             	movsbl (%edx),%eax
 2ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2f1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2f4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2f9:	77 1a                	ja     315 <atoi+0x35>
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop
    n = n*10 + *s++ - '0';
 300:	83 c2 01             	add    $0x1,%edx
 303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 30a:	0f be 02             	movsbl (%edx),%eax
 30d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	89 c8                	mov    %ecx,%eax
 317:	5b                   	pop    %ebx
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	8b 45 10             	mov    0x10(%ebp),%eax
 32b:	8b 55 08             	mov    0x8(%ebp),%edx
 32e:	56                   	push   %esi
 32f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 332:	85 c0                	test   %eax,%eax
 334:	7e 0f                	jle    345 <memmove+0x25>
 336:	01 d0                	add    %edx,%eax
  dst = vdst;
 338:	89 d7                	mov    %edx,%edi
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 341:	39 f8                	cmp    %edi,%eax
 343:	75 fb                	jne    340 <memmove+0x20>
  return vdst;
}
 345:	5e                   	pop    %esi
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 35a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 35d:	50                   	push   %eax
 35e:	e8 f2 02 00 00       	call   655 <join>
  
  return x;
}
 363:	c9                   	leave  
 364:	c3                   	ret    
 365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <lock_init>:

void lock_init(struct lock_t *lk){
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 377:	8b 45 08             	mov    0x8(%ebp),%eax
 37a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 380:	5d                   	pop    %ebp
 381:	c3                   	ret    
 382:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 395:	b9 01 00 00 00       	mov    $0x1,%ecx
 39a:	89 e5                	mov    %esp,%ebp
 39c:	8b 55 08             	mov    0x8(%ebp),%edx
 39f:	90                   	nop
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 3a5:	85 c0                	test   %eax,%eax
 3a7:	75 f7                	jne    3a0 <lock_acquire+0x10>
}
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <lock_release>:
void lock_release(struct lock_t *lk){
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	31 c0                	xor    %eax,%eax
 3b7:	89 e5                	mov    %esp,%ebp
 3b9:	8b 55 08             	mov    0x8(%ebp),%edx
 3bc:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 3bf:	5d                   	pop    %ebp
 3c0:	c3                   	ret    
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3d5:	a1 84 0c 00 00       	mov    0xc84,%eax
{
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	57                   	push   %edi
 3dd:	56                   	push   %esi
 3de:	53                   	push   %ebx
 3df:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3e2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 3e4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3e7:	39 c8                	cmp    %ecx,%eax
 3e9:	73 15                	jae    400 <free+0x30>
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop
 3f0:	39 d1                	cmp    %edx,%ecx
 3f2:	72 14                	jb     408 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3f4:	39 d0                	cmp    %edx,%eax
 3f6:	73 10                	jae    408 <free+0x38>
{
 3f8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3fa:	8b 10                	mov    (%eax),%edx
 3fc:	39 c8                	cmp    %ecx,%eax
 3fe:	72 f0                	jb     3f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 400:	39 d0                	cmp    %edx,%eax
 402:	72 f4                	jb     3f8 <free+0x28>
 404:	39 d1                	cmp    %edx,%ecx
 406:	73 f0                	jae    3f8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 408:	8b 73 fc             	mov    -0x4(%ebx),%esi
 40b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 40e:	39 fa                	cmp    %edi,%edx
 410:	74 1e                	je     430 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 412:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 415:	8b 50 04             	mov    0x4(%eax),%edx
 418:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 41b:	39 f1                	cmp    %esi,%ecx
 41d:	74 28                	je     447 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 41f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 421:	5b                   	pop    %ebx
  freep = p;
 422:	a3 84 0c 00 00       	mov    %eax,0xc84
}
 427:	5e                   	pop    %esi
 428:	5f                   	pop    %edi
 429:	5d                   	pop    %ebp
 42a:	c3                   	ret    
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 430:	03 72 04             	add    0x4(%edx),%esi
 433:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 436:	8b 10                	mov    (%eax),%edx
 438:	8b 12                	mov    (%edx),%edx
 43a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 43d:	8b 50 04             	mov    0x4(%eax),%edx
 440:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 443:	39 f1                	cmp    %esi,%ecx
 445:	75 d8                	jne    41f <free+0x4f>
    p->s.size += bp->s.size;
 447:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 44a:	a3 84 0c 00 00       	mov    %eax,0xc84
    p->s.size += bp->s.size;
 44f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 452:	8b 53 f8             	mov    -0x8(%ebx),%edx
 455:	89 10                	mov    %edx,(%eax)
}
 457:	5b                   	pop    %ebx
 458:	5e                   	pop    %esi
 459:	5f                   	pop    %edi
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	56                   	push   %esi
 469:	53                   	push   %ebx
 46a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 46d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 470:	8b 3d 84 0c 00 00    	mov    0xc84,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 476:	8d 70 07             	lea    0x7(%eax),%esi
 479:	c1 ee 03             	shr    $0x3,%esi
 47c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 47f:	85 ff                	test   %edi,%edi
 481:	0f 84 a9 00 00 00    	je     530 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 487:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 489:	8b 48 04             	mov    0x4(%eax),%ecx
 48c:	39 f1                	cmp    %esi,%ecx
 48e:	73 6d                	jae    4fd <malloc+0x9d>
 490:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 496:	bb 00 10 00 00       	mov    $0x1000,%ebx
 49b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 49e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 4a5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 4a8:	eb 17                	jmp    4c1 <malloc+0x61>
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4b0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 4b2:	8b 4a 04             	mov    0x4(%edx),%ecx
 4b5:	39 f1                	cmp    %esi,%ecx
 4b7:	73 4f                	jae    508 <malloc+0xa8>
 4b9:	8b 3d 84 0c 00 00    	mov    0xc84,%edi
 4bf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 4c1:	39 c7                	cmp    %eax,%edi
 4c3:	75 eb                	jne    4b0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 4c5:	83 ec 0c             	sub    $0xc,%esp
 4c8:	ff 75 e4             	pushl  -0x1c(%ebp)
 4cb:	e8 65 01 00 00       	call   635 <sbrk>
  if(p == (char*)-1)
 4d0:	83 c4 10             	add    $0x10,%esp
 4d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 4d6:	74 1b                	je     4f3 <malloc+0x93>
  hp->s.size = nu;
 4d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 4db:	83 ec 0c             	sub    $0xc,%esp
 4de:	83 c0 08             	add    $0x8,%eax
 4e1:	50                   	push   %eax
 4e2:	e8 e9 fe ff ff       	call   3d0 <free>
  return freep;
 4e7:	a1 84 0c 00 00       	mov    0xc84,%eax
      if((p = morecore(nunits)) == 0)
 4ec:	83 c4 10             	add    $0x10,%esp
 4ef:	85 c0                	test   %eax,%eax
 4f1:	75 bd                	jne    4b0 <malloc+0x50>
        return 0;
  }
}
 4f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 4f6:	31 c0                	xor    %eax,%eax
}
 4f8:	5b                   	pop    %ebx
 4f9:	5e                   	pop    %esi
 4fa:	5f                   	pop    %edi
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    
    if(p->s.size >= nunits){
 4fd:	89 c2                	mov    %eax,%edx
 4ff:	89 f8                	mov    %edi,%eax
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 508:	39 ce                	cmp    %ecx,%esi
 50a:	74 54                	je     560 <malloc+0x100>
        p->s.size -= nunits;
 50c:	29 f1                	sub    %esi,%ecx
 50e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 511:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 514:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 517:	a3 84 0c 00 00       	mov    %eax,0xc84
}
 51c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 51f:	8d 42 08             	lea    0x8(%edx),%eax
}
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 530:	c7 05 84 0c 00 00 88 	movl   $0xc88,0xc84
 537:	0c 00 00 
    base.s.size = 0;
 53a:	bf 88 0c 00 00       	mov    $0xc88,%edi
    base.s.ptr = freep = prevp = &base;
 53f:	c7 05 88 0c 00 00 88 	movl   $0xc88,0xc88
 546:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 549:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 54b:	c7 05 8c 0c 00 00 00 	movl   $0x0,0xc8c
 552:	00 00 00 
    if(p->s.size >= nunits){
 555:	e9 36 ff ff ff       	jmp    490 <malloc+0x30>
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 560:	8b 0a                	mov    (%edx),%ecx
 562:	89 08                	mov    %ecx,(%eax)
 564:	eb b1                	jmp    517 <malloc+0xb7>
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi

00000570 <thread_create>:
{
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 57a:	68 00 10 00 00       	push   $0x1000
 57f:	e8 dc fe ff ff       	call   460 <malloc>
return clone(start_routine,arg1,arg2,stack);
 584:	50                   	push   %eax
 585:	ff 75 10             	pushl  0x10(%ebp)
 588:	ff 75 0c             	pushl  0xc(%ebp)
 58b:	ff 75 08             	pushl  0x8(%ebp)
 58e:	e8 ba 00 00 00       	call   64d <clone>
}
 593:	c9                   	leave  
 594:	c3                   	ret    

00000595 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 595:	b8 01 00 00 00       	mov    $0x1,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <exit>:
SYSCALL(exit)
 59d:	b8 02 00 00 00       	mov    $0x2,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <wait>:
SYSCALL(wait)
 5a5:	b8 03 00 00 00       	mov    $0x3,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <pipe>:
SYSCALL(pipe)
 5ad:	b8 04 00 00 00       	mov    $0x4,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <read>:
SYSCALL(read)
 5b5:	b8 05 00 00 00       	mov    $0x5,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <write>:
SYSCALL(write)
 5bd:	b8 10 00 00 00       	mov    $0x10,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <close>:
SYSCALL(close)
 5c5:	b8 15 00 00 00       	mov    $0x15,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <kill>:
SYSCALL(kill)
 5cd:	b8 06 00 00 00       	mov    $0x6,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <exec>:
SYSCALL(exec)
 5d5:	b8 07 00 00 00       	mov    $0x7,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <open>:
SYSCALL(open)
 5dd:	b8 0f 00 00 00       	mov    $0xf,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <mknod>:
SYSCALL(mknod)
 5e5:	b8 11 00 00 00       	mov    $0x11,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <unlink>:
SYSCALL(unlink)
 5ed:	b8 12 00 00 00       	mov    $0x12,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <fstat>:
SYSCALL(fstat)
 5f5:	b8 08 00 00 00       	mov    $0x8,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <link>:
SYSCALL(link)
 5fd:	b8 13 00 00 00       	mov    $0x13,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <mkdir>:
SYSCALL(mkdir)
 605:	b8 14 00 00 00       	mov    $0x14,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <chdir>:
SYSCALL(chdir)
 60d:	b8 09 00 00 00       	mov    $0x9,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <dup>:
SYSCALL(dup)
 615:	b8 0a 00 00 00       	mov    $0xa,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <getpid>:
SYSCALL(getpid)
 61d:	b8 0b 00 00 00       	mov    $0xb,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <getyear>:
SYSCALL(getyear)
 625:	b8 16 00 00 00       	mov    $0x16,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <getreadcount>:
SYSCALL(getreadcount)
 62d:	b8 17 00 00 00       	mov    $0x17,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <sbrk>:
SYSCALL(sbrk)
 635:	b8 0c 00 00 00       	mov    $0xc,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <sleep>:
SYSCALL(sleep)
 63d:	b8 0d 00 00 00       	mov    $0xd,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <uptime>:
SYSCALL(uptime)
 645:	b8 0e 00 00 00       	mov    $0xe,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <clone>:
SYSCALL(clone)
 64d:	b8 18 00 00 00       	mov    $0x18,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <join>:
SYSCALL(join)
 655:	b8 19 00 00 00       	mov    $0x19,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    
 65d:	66 90                	xchg   %ax,%ax
 65f:	90                   	nop

00000660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 3c             	sub    $0x3c,%esp
 669:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 66c:	89 d1                	mov    %edx,%ecx
{
 66e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 671:	85 d2                	test   %edx,%edx
 673:	0f 89 7f 00 00 00    	jns    6f8 <printint+0x98>
 679:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 67d:	74 79                	je     6f8 <printint+0x98>
    neg = 1;
 67f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 686:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 688:	31 db                	xor    %ebx,%ebx
 68a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 68d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 690:	89 c8                	mov    %ecx,%eax
 692:	31 d2                	xor    %edx,%edx
 694:	89 cf                	mov    %ecx,%edi
 696:	f7 75 c4             	divl   -0x3c(%ebp)
 699:	0f b6 92 30 09 00 00 	movzbl 0x930(%edx),%edx
 6a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6a3:	89 d8                	mov    %ebx,%eax
 6a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6b1:	76 dd                	jbe    690 <printint+0x30>
  if(neg)
 6b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6b6:	85 c9                	test   %ecx,%ecx
 6b8:	74 0c                	je     6c6 <printint+0x66>
    buf[i++] = '-';
 6ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6cd:	eb 07                	jmp    6d6 <printint+0x76>
 6cf:	90                   	nop
 6d0:	0f b6 13             	movzbl (%ebx),%edx
 6d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6d6:	83 ec 04             	sub    $0x4,%esp
 6d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6dc:	6a 01                	push   $0x1
 6de:	56                   	push   %esi
 6df:	57                   	push   %edi
 6e0:	e8 d8 fe ff ff       	call   5bd <write>
  while(--i >= 0)
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	39 de                	cmp    %ebx,%esi
 6ea:	75 e4                	jne    6d0 <printint+0x70>
    putc(fd, buf[i]);
}
 6ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ef:	5b                   	pop    %ebx
 6f0:	5e                   	pop    %esi
 6f1:	5f                   	pop    %edi
 6f2:	5d                   	pop    %ebp
 6f3:	c3                   	ret    
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6ff:	eb 87                	jmp    688 <printint+0x28>
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop

00000710 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 710:	f3 0f 1e fb          	endbr32 
 714:	55                   	push   %ebp
 715:	89 e5                	mov    %esp,%ebp
 717:	57                   	push   %edi
 718:	56                   	push   %esi
 719:	53                   	push   %ebx
 71a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 71d:	8b 75 0c             	mov    0xc(%ebp),%esi
 720:	0f b6 1e             	movzbl (%esi),%ebx
 723:	84 db                	test   %bl,%bl
 725:	0f 84 b4 00 00 00    	je     7df <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 72b:	8d 45 10             	lea    0x10(%ebp),%eax
 72e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 731:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 734:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 736:	89 45 d0             	mov    %eax,-0x30(%ebp)
 739:	eb 33                	jmp    76e <printf+0x5e>
 73b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop
 740:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 743:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 748:	83 f8 25             	cmp    $0x25,%eax
 74b:	74 17                	je     764 <printf+0x54>
  write(fd, &c, 1);
 74d:	83 ec 04             	sub    $0x4,%esp
 750:	88 5d e7             	mov    %bl,-0x19(%ebp)
 753:	6a 01                	push   $0x1
 755:	57                   	push   %edi
 756:	ff 75 08             	pushl  0x8(%ebp)
 759:	e8 5f fe ff ff       	call   5bd <write>
 75e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 761:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 764:	0f b6 1e             	movzbl (%esi),%ebx
 767:	83 c6 01             	add    $0x1,%esi
 76a:	84 db                	test   %bl,%bl
 76c:	74 71                	je     7df <printf+0xcf>
    c = fmt[i] & 0xff;
 76e:	0f be cb             	movsbl %bl,%ecx
 771:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 774:	85 d2                	test   %edx,%edx
 776:	74 c8                	je     740 <printf+0x30>
      }
    } else if(state == '%'){
 778:	83 fa 25             	cmp    $0x25,%edx
 77b:	75 e7                	jne    764 <printf+0x54>
      if(c == 'd'){
 77d:	83 f8 64             	cmp    $0x64,%eax
 780:	0f 84 9a 00 00 00    	je     820 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 786:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 78c:	83 f9 70             	cmp    $0x70,%ecx
 78f:	74 5f                	je     7f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 791:	83 f8 73             	cmp    $0x73,%eax
 794:	0f 84 d6 00 00 00    	je     870 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 79a:	83 f8 63             	cmp    $0x63,%eax
 79d:	0f 84 8d 00 00 00    	je     830 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7a3:	83 f8 25             	cmp    $0x25,%eax
 7a6:	0f 84 b4 00 00 00    	je     860 <printf+0x150>
  write(fd, &c, 1);
 7ac:	83 ec 04             	sub    $0x4,%esp
 7af:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7b3:	6a 01                	push   $0x1
 7b5:	57                   	push   %edi
 7b6:	ff 75 08             	pushl  0x8(%ebp)
 7b9:	e8 ff fd ff ff       	call   5bd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 7be:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7c1:	83 c4 0c             	add    $0xc,%esp
 7c4:	6a 01                	push   $0x1
 7c6:	83 c6 01             	add    $0x1,%esi
 7c9:	57                   	push   %edi
 7ca:	ff 75 08             	pushl  0x8(%ebp)
 7cd:	e8 eb fd ff ff       	call   5bd <write>
  for(i = 0; fmt[i]; i++){
 7d2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 7d6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 7d9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 7db:	84 db                	test   %bl,%bl
 7dd:	75 8f                	jne    76e <printf+0x5e>
    }
  }
}
 7df:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e2:	5b                   	pop    %ebx
 7e3:	5e                   	pop    %esi
 7e4:	5f                   	pop    %edi
 7e5:	5d                   	pop    %ebp
 7e6:	c3                   	ret    
 7e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f8:	6a 00                	push   $0x0
 7fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	8b 13                	mov    (%ebx),%edx
 802:	e8 59 fe ff ff       	call   660 <printint>
        ap++;
 807:	89 d8                	mov    %ebx,%eax
 809:	83 c4 10             	add    $0x10,%esp
      state = 0;
 80c:	31 d2                	xor    %edx,%edx
        ap++;
 80e:	83 c0 04             	add    $0x4,%eax
 811:	89 45 d0             	mov    %eax,-0x30(%ebp)
 814:	e9 4b ff ff ff       	jmp    764 <printf+0x54>
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 820:	83 ec 0c             	sub    $0xc,%esp
 823:	b9 0a 00 00 00       	mov    $0xa,%ecx
 828:	6a 01                	push   $0x1
 82a:	eb ce                	jmp    7fa <printf+0xea>
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 830:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 833:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 836:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 838:	6a 01                	push   $0x1
        ap++;
 83a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 83d:	57                   	push   %edi
 83e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 841:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 844:	e8 74 fd ff ff       	call   5bd <write>
        ap++;
 849:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 84c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 84f:	31 d2                	xor    %edx,%edx
 851:	e9 0e ff ff ff       	jmp    764 <printf+0x54>
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 860:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 863:	83 ec 04             	sub    $0x4,%esp
 866:	e9 59 ff ff ff       	jmp    7c4 <printf+0xb4>
 86b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 86f:	90                   	nop
        s = (char*)*ap;
 870:	8b 45 d0             	mov    -0x30(%ebp),%eax
 873:	8b 18                	mov    (%eax),%ebx
        ap++;
 875:	83 c0 04             	add    $0x4,%eax
 878:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 87b:	85 db                	test   %ebx,%ebx
 87d:	74 17                	je     896 <printf+0x186>
        while(*s != 0){
 87f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 882:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 884:	84 c0                	test   %al,%al
 886:	0f 84 d8 fe ff ff    	je     764 <printf+0x54>
 88c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 88f:	89 de                	mov    %ebx,%esi
 891:	8b 5d 08             	mov    0x8(%ebp),%ebx
 894:	eb 1a                	jmp    8b0 <printf+0x1a0>
          s = "(null)";
 896:	bb 28 09 00 00       	mov    $0x928,%ebx
        while(*s != 0){
 89b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 89e:	b8 28 00 00 00       	mov    $0x28,%eax
 8a3:	89 de                	mov    %ebx,%esi
 8a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8af:	90                   	nop
  write(fd, &c, 1);
 8b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8b3:	83 c6 01             	add    $0x1,%esi
 8b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8b9:	6a 01                	push   $0x1
 8bb:	57                   	push   %edi
 8bc:	53                   	push   %ebx
 8bd:	e8 fb fc ff ff       	call   5bd <write>
        while(*s != 0){
 8c2:	0f b6 06             	movzbl (%esi),%eax
 8c5:	83 c4 10             	add    $0x10,%esp
 8c8:	84 c0                	test   %al,%al
 8ca:	75 e4                	jne    8b0 <printf+0x1a0>
 8cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 8cf:	31 d2                	xor    %edx,%edx
 8d1:	e9 8e fe ff ff       	jmp    764 <printf+0x54>
