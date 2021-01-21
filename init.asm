
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
  18:	68 78 08 00 00       	push   $0x878
  1d:	e8 5b 05 00 00       	call   57d <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 9b 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  2d:	83 ec 0c             	sub    $0xc,%esp
  30:	6a 00                	push   $0x0
  32:	e8 7e 05 00 00       	call   5b5 <dup>
  dup(0);  // stderr
  37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3e:	e8 72 05 00 00       	call   5b5 <dup>
  43:	83 c4 10             	add    $0x10,%esp
  46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4d:	8d 76 00             	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 80 08 00 00       	push   $0x880
  58:	6a 01                	push   $0x1
  5a:	e8 51 06 00 00       	call   6b0 <printf>
    pid = fork();
  5f:	e8 d1 04 00 00       	call   535 <fork>
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
  70:	e8 d0 04 00 00       	call   545 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 d7                	js     50 <main+0x50>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 d3                	je     50 <main+0x50>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 bf 08 00 00       	push   $0x8bf
  85:	6a 01                	push   $0x1
  87:	e8 24 06 00 00       	call   6b0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 93 08 00 00       	push   $0x893
  98:	6a 01                	push   $0x1
  9a:	e8 11 06 00 00       	call   6b0 <printf>
      exit();
  9f:	e8 99 04 00 00       	call   53d <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 bc 0b 00 00       	push   $0xbbc
  ab:	68 a6 08 00 00       	push   $0x8a6
  b0:	e8 c0 04 00 00       	call   575 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 a9 08 00 00       	push   $0x8a9
  bc:	6a 01                	push   $0x1
  be:	e8 ed 05 00 00       	call   6b0 <printf>
      exit();
  c3:	e8 75 04 00 00       	call   53d <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 78 08 00 00       	push   $0x878
  d2:	e8 ae 04 00 00       	call   585 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 78 08 00 00       	push   $0x878
  e0:	e8 98 04 00 00       	call   57d <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 40 ff ff ff       	jmp    2d <main+0x2d>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

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
 23b:	e8 15 03 00 00       	call   555 <read>
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
 2a1:	e8 d7 02 00 00       	call   57d <open>
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
 2b6:	e8 da 02 00 00       	call   595 <fstat>
  close(fd);
 2bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2be:	89 c6                	mov    %eax,%esi
  close(fd);
 2c0:	e8 a0 02 00 00       	call   565 <close>
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
 35e:	e8 92 02 00 00       	call   5f5 <join>
  
  return x;
}
 363:	c9                   	leave  
 364:	c3                   	ret    
 365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 375:	a1 c4 0b 00 00       	mov    0xbc4,%eax
{
 37a:	89 e5                	mov    %esp,%ebp
 37c:	57                   	push   %edi
 37d:	56                   	push   %esi
 37e:	53                   	push   %ebx
 37f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 382:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 384:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 387:	39 c8                	cmp    %ecx,%eax
 389:	73 15                	jae    3a0 <free+0x30>
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop
 390:	39 d1                	cmp    %edx,%ecx
 392:	72 14                	jb     3a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 394:	39 d0                	cmp    %edx,%eax
 396:	73 10                	jae    3a8 <free+0x38>
{
 398:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 39a:	8b 10                	mov    (%eax),%edx
 39c:	39 c8                	cmp    %ecx,%eax
 39e:	72 f0                	jb     390 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3a0:	39 d0                	cmp    %edx,%eax
 3a2:	72 f4                	jb     398 <free+0x28>
 3a4:	39 d1                	cmp    %edx,%ecx
 3a6:	73 f0                	jae    398 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3ae:	39 fa                	cmp    %edi,%edx
 3b0:	74 1e                	je     3d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3b5:	8b 50 04             	mov    0x4(%eax),%edx
 3b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3bb:	39 f1                	cmp    %esi,%ecx
 3bd:	74 28                	je     3e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 3bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 3c1:	5b                   	pop    %ebx
  freep = p;
 3c2:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 3c7:	5e                   	pop    %esi
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 3d0:	03 72 04             	add    0x4(%edx),%esi
 3d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 3d6:	8b 10                	mov    (%eax),%edx
 3d8:	8b 12                	mov    (%edx),%edx
 3da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3dd:	8b 50 04             	mov    0x4(%eax),%edx
 3e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3e3:	39 f1                	cmp    %esi,%ecx
 3e5:	75 d8                	jne    3bf <free+0x4f>
    p->s.size += bp->s.size;
 3e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 3ea:	a3 c4 0b 00 00       	mov    %eax,0xbc4
    p->s.size += bp->s.size;
 3ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 3f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 3f5:	89 10                	mov    %edx,(%eax)
}
 3f7:	5b                   	pop    %ebx
 3f8:	5e                   	pop    %esi
 3f9:	5f                   	pop    %edi
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	56                   	push   %esi
 409:	53                   	push   %ebx
 40a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 410:	8b 3d c4 0b 00 00    	mov    0xbc4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 416:	8d 70 07             	lea    0x7(%eax),%esi
 419:	c1 ee 03             	shr    $0x3,%esi
 41c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 41f:	85 ff                	test   %edi,%edi
 421:	0f 84 a9 00 00 00    	je     4d0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 427:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 429:	8b 48 04             	mov    0x4(%eax),%ecx
 42c:	39 f1                	cmp    %esi,%ecx
 42e:	73 6d                	jae    49d <malloc+0x9d>
 430:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 436:	bb 00 10 00 00       	mov    $0x1000,%ebx
 43b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 43e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 445:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 448:	eb 17                	jmp    461 <malloc+0x61>
 44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 450:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 452:	8b 4a 04             	mov    0x4(%edx),%ecx
 455:	39 f1                	cmp    %esi,%ecx
 457:	73 4f                	jae    4a8 <malloc+0xa8>
 459:	8b 3d c4 0b 00 00    	mov    0xbc4,%edi
 45f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 461:	39 c7                	cmp    %eax,%edi
 463:	75 eb                	jne    450 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 465:	83 ec 0c             	sub    $0xc,%esp
 468:	ff 75 e4             	pushl  -0x1c(%ebp)
 46b:	e8 65 01 00 00       	call   5d5 <sbrk>
  if(p == (char*)-1)
 470:	83 c4 10             	add    $0x10,%esp
 473:	83 f8 ff             	cmp    $0xffffffff,%eax
 476:	74 1b                	je     493 <malloc+0x93>
  hp->s.size = nu;
 478:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 47b:	83 ec 0c             	sub    $0xc,%esp
 47e:	83 c0 08             	add    $0x8,%eax
 481:	50                   	push   %eax
 482:	e8 e9 fe ff ff       	call   370 <free>
  return freep;
 487:	a1 c4 0b 00 00       	mov    0xbc4,%eax
      if((p = morecore(nunits)) == 0)
 48c:	83 c4 10             	add    $0x10,%esp
 48f:	85 c0                	test   %eax,%eax
 491:	75 bd                	jne    450 <malloc+0x50>
        return 0;
  }
}
 493:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 496:	31 c0                	xor    %eax,%eax
}
 498:	5b                   	pop    %ebx
 499:	5e                   	pop    %esi
 49a:	5f                   	pop    %edi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    
    if(p->s.size >= nunits){
 49d:	89 c2                	mov    %eax,%edx
 49f:	89 f8                	mov    %edi,%eax
 4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 4a8:	39 ce                	cmp    %ecx,%esi
 4aa:	74 54                	je     500 <malloc+0x100>
        p->s.size -= nunits;
 4ac:	29 f1                	sub    %esi,%ecx
 4ae:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 4b1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 4b4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 4b7:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 4bf:	8d 42 08             	lea    0x8(%edx),%eax
}
 4c2:	5b                   	pop    %ebx
 4c3:	5e                   	pop    %esi
 4c4:	5f                   	pop    %edi
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret    
 4c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ce:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 4d0:	c7 05 c4 0b 00 00 c8 	movl   $0xbc8,0xbc4
 4d7:	0b 00 00 
    base.s.size = 0;
 4da:	bf c8 0b 00 00       	mov    $0xbc8,%edi
    base.s.ptr = freep = prevp = &base;
 4df:	c7 05 c8 0b 00 00 c8 	movl   $0xbc8,0xbc8
 4e6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4e9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 4eb:	c7 05 cc 0b 00 00 00 	movl   $0x0,0xbcc
 4f2:	00 00 00 
    if(p->s.size >= nunits){
 4f5:	e9 36 ff ff ff       	jmp    430 <malloc+0x30>
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 500:	8b 0a                	mov    (%edx),%ecx
 502:	89 08                	mov    %ecx,(%eax)
 504:	eb b1                	jmp    4b7 <malloc+0xb7>
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi

00000510 <thread_create>:
{
 510:	f3 0f 1e fb          	endbr32 
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 51a:	68 00 10 00 00       	push   $0x1000
 51f:	e8 dc fe ff ff       	call   400 <malloc>
return clone(start_routine,arg1,arg2,stack);
 524:	50                   	push   %eax
 525:	ff 75 10             	pushl  0x10(%ebp)
 528:	ff 75 0c             	pushl  0xc(%ebp)
 52b:	ff 75 08             	pushl  0x8(%ebp)
 52e:	e8 ba 00 00 00       	call   5ed <clone>
}
 533:	c9                   	leave  
 534:	c3                   	ret    

00000535 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 535:	b8 01 00 00 00       	mov    $0x1,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <exit>:
SYSCALL(exit)
 53d:	b8 02 00 00 00       	mov    $0x2,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <wait>:
SYSCALL(wait)
 545:	b8 03 00 00 00       	mov    $0x3,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <pipe>:
SYSCALL(pipe)
 54d:	b8 04 00 00 00       	mov    $0x4,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <read>:
SYSCALL(read)
 555:	b8 05 00 00 00       	mov    $0x5,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <write>:
SYSCALL(write)
 55d:	b8 10 00 00 00       	mov    $0x10,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <close>:
SYSCALL(close)
 565:	b8 15 00 00 00       	mov    $0x15,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <kill>:
SYSCALL(kill)
 56d:	b8 06 00 00 00       	mov    $0x6,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <exec>:
SYSCALL(exec)
 575:	b8 07 00 00 00       	mov    $0x7,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <open>:
SYSCALL(open)
 57d:	b8 0f 00 00 00       	mov    $0xf,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <mknod>:
SYSCALL(mknod)
 585:	b8 11 00 00 00       	mov    $0x11,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <unlink>:
SYSCALL(unlink)
 58d:	b8 12 00 00 00       	mov    $0x12,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <fstat>:
SYSCALL(fstat)
 595:	b8 08 00 00 00       	mov    $0x8,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <link>:
SYSCALL(link)
 59d:	b8 13 00 00 00       	mov    $0x13,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <mkdir>:
SYSCALL(mkdir)
 5a5:	b8 14 00 00 00       	mov    $0x14,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <chdir>:
SYSCALL(chdir)
 5ad:	b8 09 00 00 00       	mov    $0x9,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <dup>:
SYSCALL(dup)
 5b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <getpid>:
SYSCALL(getpid)
 5bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <getyear>:
SYSCALL(getyear)
 5c5:	b8 16 00 00 00       	mov    $0x16,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <getreadcount>:
SYSCALL(getreadcount)
 5cd:	b8 17 00 00 00       	mov    $0x17,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <sbrk>:
SYSCALL(sbrk)
 5d5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <sleep>:
SYSCALL(sleep)
 5dd:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <uptime>:
SYSCALL(uptime)
 5e5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <clone>:
SYSCALL(clone)
 5ed:	b8 18 00 00 00       	mov    $0x18,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <join>:
SYSCALL(join)
 5f5:	b8 19 00 00 00       	mov    $0x19,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    
 5fd:	66 90                	xchg   %ax,%ax
 5ff:	90                   	nop

00000600 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 3c             	sub    $0x3c,%esp
 609:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 60c:	89 d1                	mov    %edx,%ecx
{
 60e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 611:	85 d2                	test   %edx,%edx
 613:	0f 89 7f 00 00 00    	jns    698 <printint+0x98>
 619:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 61d:	74 79                	je     698 <printint+0x98>
    neg = 1;
 61f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 626:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 628:	31 db                	xor    %ebx,%ebx
 62a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 630:	89 c8                	mov    %ecx,%eax
 632:	31 d2                	xor    %edx,%edx
 634:	89 cf                	mov    %ecx,%edi
 636:	f7 75 c4             	divl   -0x3c(%ebp)
 639:	0f b6 92 d0 08 00 00 	movzbl 0x8d0(%edx),%edx
 640:	89 45 c0             	mov    %eax,-0x40(%ebp)
 643:	89 d8                	mov    %ebx,%eax
 645:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 648:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 64b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 64e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 651:	76 dd                	jbe    630 <printint+0x30>
  if(neg)
 653:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 656:	85 c9                	test   %ecx,%ecx
 658:	74 0c                	je     666 <printint+0x66>
    buf[i++] = '-';
 65a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 65f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 661:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 666:	8b 7d b8             	mov    -0x48(%ebp),%edi
 669:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 66d:	eb 07                	jmp    676 <printint+0x76>
 66f:	90                   	nop
 670:	0f b6 13             	movzbl (%ebx),%edx
 673:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 676:	83 ec 04             	sub    $0x4,%esp
 679:	88 55 d7             	mov    %dl,-0x29(%ebp)
 67c:	6a 01                	push   $0x1
 67e:	56                   	push   %esi
 67f:	57                   	push   %edi
 680:	e8 d8 fe ff ff       	call   55d <write>
  while(--i >= 0)
 685:	83 c4 10             	add    $0x10,%esp
 688:	39 de                	cmp    %ebx,%esi
 68a:	75 e4                	jne    670 <printint+0x70>
    putc(fd, buf[i]);
}
 68c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68f:	5b                   	pop    %ebx
 690:	5e                   	pop    %esi
 691:	5f                   	pop    %edi
 692:	5d                   	pop    %ebp
 693:	c3                   	ret    
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 698:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 69f:	eb 87                	jmp    628 <printint+0x28>
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop

000006b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	57                   	push   %edi
 6b8:	56                   	push   %esi
 6b9:	53                   	push   %ebx
 6ba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6bd:	8b 75 0c             	mov    0xc(%ebp),%esi
 6c0:	0f b6 1e             	movzbl (%esi),%ebx
 6c3:	84 db                	test   %bl,%bl
 6c5:	0f 84 b4 00 00 00    	je     77f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6cb:	8d 45 10             	lea    0x10(%ebp),%eax
 6ce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6d1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6d4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6d9:	eb 33                	jmp    70e <printf+0x5e>
 6db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
 6e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6e3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6e8:	83 f8 25             	cmp    $0x25,%eax
 6eb:	74 17                	je     704 <printf+0x54>
  write(fd, &c, 1);
 6ed:	83 ec 04             	sub    $0x4,%esp
 6f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6f3:	6a 01                	push   $0x1
 6f5:	57                   	push   %edi
 6f6:	ff 75 08             	pushl  0x8(%ebp)
 6f9:	e8 5f fe ff ff       	call   55d <write>
 6fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 701:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 704:	0f b6 1e             	movzbl (%esi),%ebx
 707:	83 c6 01             	add    $0x1,%esi
 70a:	84 db                	test   %bl,%bl
 70c:	74 71                	je     77f <printf+0xcf>
    c = fmt[i] & 0xff;
 70e:	0f be cb             	movsbl %bl,%ecx
 711:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 714:	85 d2                	test   %edx,%edx
 716:	74 c8                	je     6e0 <printf+0x30>
      }
    } else if(state == '%'){
 718:	83 fa 25             	cmp    $0x25,%edx
 71b:	75 e7                	jne    704 <printf+0x54>
      if(c == 'd'){
 71d:	83 f8 64             	cmp    $0x64,%eax
 720:	0f 84 9a 00 00 00    	je     7c0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 726:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 72c:	83 f9 70             	cmp    $0x70,%ecx
 72f:	74 5f                	je     790 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 731:	83 f8 73             	cmp    $0x73,%eax
 734:	0f 84 d6 00 00 00    	je     810 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 73a:	83 f8 63             	cmp    $0x63,%eax
 73d:	0f 84 8d 00 00 00    	je     7d0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 743:	83 f8 25             	cmp    $0x25,%eax
 746:	0f 84 b4 00 00 00    	je     800 <printf+0x150>
  write(fd, &c, 1);
 74c:	83 ec 04             	sub    $0x4,%esp
 74f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 753:	6a 01                	push   $0x1
 755:	57                   	push   %edi
 756:	ff 75 08             	pushl  0x8(%ebp)
 759:	e8 ff fd ff ff       	call   55d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 75e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 761:	83 c4 0c             	add    $0xc,%esp
 764:	6a 01                	push   $0x1
 766:	83 c6 01             	add    $0x1,%esi
 769:	57                   	push   %edi
 76a:	ff 75 08             	pushl  0x8(%ebp)
 76d:	e8 eb fd ff ff       	call   55d <write>
  for(i = 0; fmt[i]; i++){
 772:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 776:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 779:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 77b:	84 db                	test   %bl,%bl
 77d:	75 8f                	jne    70e <printf+0x5e>
    }
  }
}
 77f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 782:	5b                   	pop    %ebx
 783:	5e                   	pop    %esi
 784:	5f                   	pop    %edi
 785:	5d                   	pop    %ebp
 786:	c3                   	ret    
 787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	b9 10 00 00 00       	mov    $0x10,%ecx
 798:	6a 00                	push   $0x0
 79a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 79d:	8b 45 08             	mov    0x8(%ebp),%eax
 7a0:	8b 13                	mov    (%ebx),%edx
 7a2:	e8 59 fe ff ff       	call   600 <printint>
        ap++;
 7a7:	89 d8                	mov    %ebx,%eax
 7a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ac:	31 d2                	xor    %edx,%edx
        ap++;
 7ae:	83 c0 04             	add    $0x4,%eax
 7b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7b4:	e9 4b ff ff ff       	jmp    704 <printf+0x54>
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c8:	6a 01                	push   $0x1
 7ca:	eb ce                	jmp    79a <printf+0xea>
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7d6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7d8:	6a 01                	push   $0x1
        ap++;
 7da:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7dd:	57                   	push   %edi
 7de:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7e4:	e8 74 fd ff ff       	call   55d <write>
        ap++;
 7e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ef:	31 d2                	xor    %edx,%edx
 7f1:	e9 0e ff ff ff       	jmp    704 <printf+0x54>
 7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 800:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 803:	83 ec 04             	sub    $0x4,%esp
 806:	e9 59 ff ff ff       	jmp    764 <printf+0xb4>
 80b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
        s = (char*)*ap;
 810:	8b 45 d0             	mov    -0x30(%ebp),%eax
 813:	8b 18                	mov    (%eax),%ebx
        ap++;
 815:	83 c0 04             	add    $0x4,%eax
 818:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 81b:	85 db                	test   %ebx,%ebx
 81d:	74 17                	je     836 <printf+0x186>
        while(*s != 0){
 81f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 822:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 824:	84 c0                	test   %al,%al
 826:	0f 84 d8 fe ff ff    	je     704 <printf+0x54>
 82c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 82f:	89 de                	mov    %ebx,%esi
 831:	8b 5d 08             	mov    0x8(%ebp),%ebx
 834:	eb 1a                	jmp    850 <printf+0x1a0>
          s = "(null)";
 836:	bb c8 08 00 00       	mov    $0x8c8,%ebx
        while(*s != 0){
 83b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 83e:	b8 28 00 00 00       	mov    $0x28,%eax
 843:	89 de                	mov    %ebx,%esi
 845:	8b 5d 08             	mov    0x8(%ebp),%ebx
 848:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
  write(fd, &c, 1);
 850:	83 ec 04             	sub    $0x4,%esp
          s++;
 853:	83 c6 01             	add    $0x1,%esi
 856:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 859:	6a 01                	push   $0x1
 85b:	57                   	push   %edi
 85c:	53                   	push   %ebx
 85d:	e8 fb fc ff ff       	call   55d <write>
        while(*s != 0){
 862:	0f b6 06             	movzbl (%esi),%eax
 865:	83 c4 10             	add    $0x10,%esp
 868:	84 c0                	test   %al,%al
 86a:	75 e4                	jne    850 <printf+0x1a0>
 86c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 86f:	31 d2                	xor    %edx,%edx
 871:	e9 8e fe ff ff       	jmp    704 <printf+0x54>
