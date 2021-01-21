
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   a:	e8 41 00 00 00       	call   50 <forktest>
  exit();
   f:	e8 89 05 00 00       	call   59d <exit>
  14:	66 90                	xchg   %ax,%ax
  16:	66 90                	xchg   %ax,%ax
  18:	66 90                	xchg   %ax,%ax
  1a:	66 90                	xchg   %ax,%ax
  1c:	66 90                	xchg   %ax,%ax
  1e:	66 90                	xchg   %ax,%ax

00000020 <printf>:
{
  20:	f3 0f 1e fb          	endbr32 
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	53                   	push   %ebx
  28:	83 ec 10             	sub    $0x10,%esp
  2b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2e:	53                   	push   %ebx
  2f:	e8 9c 01 00 00       	call   1d0 <strlen>
  34:	83 c4 0c             	add    $0xc,%esp
  37:	50                   	push   %eax
  38:	53                   	push   %ebx
  39:	ff 75 08             	pushl  0x8(%ebp)
  3c:	e8 7c 05 00 00       	call   5bd <write>
}
  41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  44:	83 c4 10             	add    $0x10,%esp
  47:	c9                   	leave  
  48:	c3                   	ret    
  49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000050 <forktest>:
{
  50:	f3 0f 1e fb          	endbr32 
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	53                   	push   %ebx
  for(n=0; n<N; n++){
  58:	31 db                	xor    %ebx,%ebx
{
  5a:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  5d:	68 60 06 00 00       	push   $0x660
  62:	e8 69 01 00 00       	call   1d0 <strlen>
  67:	83 c4 0c             	add    $0xc,%esp
  6a:	50                   	push   %eax
  6b:	68 60 06 00 00       	push   $0x660
  70:	6a 01                	push   $0x1
  72:	e8 46 05 00 00       	call   5bd <write>
  77:	83 c4 10             	add    $0x10,%esp
  7a:	eb 15                	jmp    91 <forktest+0x41>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
  80:	74 58                	je     da <forktest+0x8a>
  for(n=0; n<N; n++){
  82:	83 c3 01             	add    $0x1,%ebx
  85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8b:	0f 84 92 00 00 00    	je     123 <forktest+0xd3>
    pid = fork();
  91:	e8 ff 04 00 00       	call   595 <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 00 05 00 00       	call   5a5 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 36                	js     df <forktest+0x8f>
  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
  if(wait() != -1){
  ae:	e8 f2 04 00 00       	call   5a5 <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 49                	jne    101 <forktest+0xb1>
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 92 06 00 00       	push   $0x692
  c0:	e8 0b 01 00 00       	call   1d0 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 92 06 00 00       	push   $0x692
  ce:	6a 01                	push   $0x1
  d0:	e8 e8 04 00 00       	call   5bd <write>
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
      exit();
  da:	e8 be 04 00 00       	call   59d <exit>
  write(fd, s, strlen(s));
  df:	83 ec 0c             	sub    $0xc,%esp
  e2:	68 6b 06 00 00       	push   $0x66b
  e7:	e8 e4 00 00 00       	call   1d0 <strlen>
  ec:	83 c4 0c             	add    $0xc,%esp
  ef:	50                   	push   %eax
  f0:	68 6b 06 00 00       	push   $0x66b
  f5:	6a 01                	push   $0x1
  f7:	e8 c1 04 00 00       	call   5bd <write>
      exit();
  fc:	e8 9c 04 00 00       	call   59d <exit>
  write(fd, s, strlen(s));
 101:	83 ec 0c             	sub    $0xc,%esp
 104:	68 7f 06 00 00       	push   $0x67f
 109:	e8 c2 00 00 00       	call   1d0 <strlen>
 10e:	83 c4 0c             	add    $0xc,%esp
 111:	50                   	push   %eax
 112:	68 7f 06 00 00       	push   $0x67f
 117:	6a 01                	push   $0x1
 119:	e8 9f 04 00 00       	call   5bd <write>
    exit();
 11e:	e8 7a 04 00 00       	call   59d <exit>
  write(fd, s, strlen(s));
 123:	83 ec 0c             	sub    $0xc,%esp
 126:	68 a0 06 00 00       	push   $0x6a0
 12b:	e8 a0 00 00 00       	call   1d0 <strlen>
 130:	83 c4 0c             	add    $0xc,%esp
 133:	50                   	push   %eax
 134:	68 a0 06 00 00       	push   $0x6a0
 139:	6a 01                	push   $0x1
 13b:	e8 7d 04 00 00       	call   5bd <write>
    exit();
 140:	e8 58 04 00 00       	call   59d <exit>
 145:	66 90                	xchg   %ax,%ax
 147:	66 90                	xchg   %ax,%ax
 149:	66 90                	xchg   %ax,%ax
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 155:	31 c0                	xor    %eax,%eax
{
 157:	89 e5                	mov    %esp,%ebp
 159:	53                   	push   %ebx
 15a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 160:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 167:	83 c0 01             	add    $0x1,%eax
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 16e:	89 c8                	mov    %ecx,%eax
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	53                   	push   %ebx
 188:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18e:	0f b6 01             	movzbl (%ecx),%eax
 191:	0f b6 1a             	movzbl (%edx),%ebx
 194:	84 c0                	test   %al,%al
 196:	75 19                	jne    1b1 <strcmp+0x31>
 198:	eb 26                	jmp    1c0 <strcmp+0x40>
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1a4:	83 c1 01             	add    $0x1,%ecx
 1a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1aa:	0f b6 1a             	movzbl (%edx),%ebx
 1ad:	84 c0                	test   %al,%al
 1af:	74 0f                	je     1c0 <strcmp+0x40>
 1b1:	38 d8                	cmp    %bl,%al
 1b3:	74 eb                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1b5:	29 d8                	sub    %ebx,%eax
}
 1b7:	5b                   	pop    %ebx
 1b8:	5d                   	pop    %ebp
 1b9:	c3                   	ret    
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1da:	80 3a 00             	cmpb   $0x0,(%edx)
 1dd:	74 21                	je     200 <strlen+0x30>
 1df:	31 c0                	xor    %eax,%eax
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1ef:	89 c1                	mov    %eax,%ecx
 1f1:	75 f5                	jne    1e8 <strlen+0x18>
    ;
  return n;
}
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 21b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21e:	8b 45 0c             	mov    0xc(%ebp),%eax
 221:	89 d7                	mov    %edx,%edi
 223:	fc                   	cld    
 224:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 226:	89 d0                	mov    %edx,%eax
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 23e:	0f b6 10             	movzbl (%eax),%edx
 241:	84 d2                	test   %dl,%dl
 243:	75 16                	jne    25b <strchr+0x2b>
 245:	eb 21                	jmp    268 <strchr+0x38>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
 250:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 254:	83 c0 01             	add    $0x1,%eax
 257:	84 d2                	test   %dl,%dl
 259:	74 0d                	je     268 <strchr+0x38>
    if(*s == c)
 25b:	38 d1                	cmp    %dl,%cl
 25d:	75 f1                	jne    250 <strchr+0x20>
      return (char*)s;
  return 0;
}
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 268:	31 c0                	xor    %eax,%eax
}
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
 278:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 279:	31 f6                	xor    %esi,%esi
{
 27b:	53                   	push   %ebx
 27c:	89 f3                	mov    %esi,%ebx
 27e:	83 ec 1c             	sub    $0x1c,%esp
 281:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 284:	eb 33                	jmp    2b9 <gets+0x49>
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 290:	83 ec 04             	sub    $0x4,%esp
 293:	8d 45 e7             	lea    -0x19(%ebp),%eax
 296:	6a 01                	push   $0x1
 298:	50                   	push   %eax
 299:	6a 00                	push   $0x0
 29b:	e8 15 03 00 00       	call   5b5 <read>
    if(cc < 1)
 2a0:	83 c4 10             	add    $0x10,%esp
 2a3:	85 c0                	test   %eax,%eax
 2a5:	7e 1c                	jle    2c3 <gets+0x53>
      break;
    buf[i++] = c;
 2a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ab:	83 c7 01             	add    $0x1,%edi
 2ae:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2b1:	3c 0a                	cmp    $0xa,%al
 2b3:	74 23                	je     2d8 <gets+0x68>
 2b5:	3c 0d                	cmp    $0xd,%al
 2b7:	74 1f                	je     2d8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2b9:	83 c3 01             	add    $0x1,%ebx
 2bc:	89 fe                	mov    %edi,%esi
 2be:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2c1:	7c cd                	jl     290 <gets+0x20>
 2c3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2c8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5f                   	pop    %edi
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	8b 75 08             	mov    0x8(%ebp),%esi
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
 2de:	01 de                	add    %ebx,%esi
 2e0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2e2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e8:	5b                   	pop    %ebx
 2e9:	5e                   	pop    %esi
 2ea:	5f                   	pop    %edi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	6a 00                	push   $0x0
 2fe:	ff 75 08             	pushl  0x8(%ebp)
 301:	e8 d7 02 00 00       	call   5dd <open>
  if(fd < 0)
 306:	83 c4 10             	add    $0x10,%esp
 309:	85 c0                	test   %eax,%eax
 30b:	78 2b                	js     338 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 30d:	83 ec 08             	sub    $0x8,%esp
 310:	ff 75 0c             	pushl  0xc(%ebp)
 313:	89 c3                	mov    %eax,%ebx
 315:	50                   	push   %eax
 316:	e8 da 02 00 00       	call   5f5 <fstat>
  close(fd);
 31b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31e:	89 c6                	mov    %eax,%esi
  close(fd);
 320:	e8 a0 02 00 00       	call   5c5 <close>
  return r;
 325:	83 c4 10             	add    $0x10,%esp
}
 328:	8d 65 f8             	lea    -0x8(%ebp),%esp
 32b:	89 f0                	mov    %esi,%eax
 32d:	5b                   	pop    %ebx
 32e:	5e                   	pop    %esi
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 338:	be ff ff ff ff       	mov    $0xffffffff,%esi
 33d:	eb e9                	jmp    328 <stat+0x38>
 33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	53                   	push   %ebx
 348:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 34b:	0f be 02             	movsbl (%edx),%eax
 34e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 351:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 354:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 359:	77 1a                	ja     375 <atoi+0x35>
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	89 c8                	mov    %ecx,%eax
 377:	5b                   	pop    %ebx
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	8b 45 10             	mov    0x10(%ebp),%eax
 38b:	8b 55 08             	mov    0x8(%ebp),%edx
 38e:	56                   	push   %esi
 38f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 392:	85 c0                	test   %eax,%eax
 394:	7e 0f                	jle    3a5 <memmove+0x25>
 396:	01 d0                	add    %edx,%eax
  dst = vdst;
 398:	89 d7                	mov    %edx,%edi
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 3ba:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3bd:	50                   	push   %eax
 3be:	e8 92 02 00 00       	call   655 <join>
  
  return x;
}
 3c3:	c9                   	leave  
 3c4:	c3                   	ret    
 3c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

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
 3d5:	a1 78 09 00 00       	mov    0x978,%eax
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
 422:	a3 78 09 00 00       	mov    %eax,0x978
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
 44a:	a3 78 09 00 00       	mov    %eax,0x978
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
 470:	8b 3d 78 09 00 00    	mov    0x978,%edi
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
 4b9:	8b 3d 78 09 00 00    	mov    0x978,%edi
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
 4e7:	a1 78 09 00 00       	mov    0x978,%eax
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
 517:	a3 78 09 00 00       	mov    %eax,0x978
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
 530:	c7 05 78 09 00 00 7c 	movl   $0x97c,0x978
 537:	09 00 00 
    base.s.size = 0;
 53a:	bf 7c 09 00 00       	mov    $0x97c,%edi
    base.s.ptr = freep = prevp = &base;
 53f:	c7 05 7c 09 00 00 7c 	movl   $0x97c,0x97c
 546:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 549:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 54b:	c7 05 80 09 00 00 00 	movl   $0x0,0x980
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
