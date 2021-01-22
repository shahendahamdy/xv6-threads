
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 30                	jle    51 <main+0x51>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
  27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2e:	66 90                	xchg   %ax,%ax
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	83 c3 04             	add    $0x4,%ebx
  38:	e8 23 02 00 00       	call   260 <atoi>
  3d:	89 04 24             	mov    %eax,(%esp)
  40:	e8 08 05 00 00       	call   54d <kill>
  for(i=1; i<argc; i++)
  45:	83 c4 10             	add    $0x10,%esp
  48:	39 f3                	cmp    %esi,%ebx
  4a:	75 e4                	jne    30 <main+0x30>
  exit();
  4c:	e8 cc 04 00 00       	call   51d <exit>
    printf(2, "usage: kill pid...\n");
  51:	50                   	push   %eax
  52:	50                   	push   %eax
  53:	68 58 08 00 00       	push   $0x858
  58:	6a 02                	push   $0x2
  5a:	e8 31 06 00 00       	call   690 <printf>
    exit();
  5f:	e8 b9 04 00 00       	call   51d <exit>
  64:	66 90                	xchg   %ax,%ax
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
  70:	f3 0f 1e fb          	endbr32 
  74:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  75:	31 c0                	xor    %eax,%eax
{
  77:	89 e5                	mov    %esp,%ebp
  79:	53                   	push   %ebx
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	89 c8                	mov    %ecx,%eax
  90:	5b                   	pop    %ebx
  91:	5d                   	pop    %ebp
  92:	c3                   	ret    
  93:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	53                   	push   %ebx
  a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ae:	0f b6 01             	movzbl (%ecx),%eax
  b1:	0f b6 1a             	movzbl (%edx),%ebx
  b4:	84 c0                	test   %al,%al
  b6:	75 19                	jne    d1 <strcmp+0x31>
  b8:	eb 26                	jmp    e0 <strcmp+0x40>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  c4:	83 c1 01             	add    $0x1,%ecx
  c7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ca:	0f b6 1a             	movzbl (%edx),%ebx
  cd:	84 c0                	test   %al,%al
  cf:	74 0f                	je     e0 <strcmp+0x40>
  d1:	38 d8                	cmp    %bl,%al
  d3:	74 eb                	je     c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  d5:	29 d8                	sub    %ebx,%eax
}
  d7:	5b                   	pop    %ebx
  d8:	5d                   	pop    %ebp
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  e2:	29 d8                	sub    %ebx,%eax
}
  e4:	5b                   	pop    %ebx
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ee:	66 90                	xchg   %ax,%ax

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  fa:	80 3a 00             	cmpb   $0x0,(%edx)
  fd:	74 21                	je     120 <strlen+0x30>
  ff:	31 c0                	xor    %eax,%eax
 101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 108:	83 c0 01             	add    $0x1,%eax
 10b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 10f:	89 c1                	mov    %eax,%ecx
 111:	75 f5                	jne    108 <strlen+0x18>
    ;
  return n;
}
 113:	89 c8                	mov    %ecx,%eax
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	f3 0f 1e fb          	endbr32 
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	57                   	push   %edi
 138:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 13b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13e:	8b 45 0c             	mov    0xc(%ebp),%eax
 141:	89 d7                	mov    %edx,%edi
 143:	fc                   	cld    
 144:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 146:	89 d0                	mov    %edx,%eax
 148:	5f                   	pop    %edi
 149:	5d                   	pop    %ebp
 14a:	c3                   	ret    
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15e:	0f b6 10             	movzbl (%eax),%edx
 161:	84 d2                	test   %dl,%dl
 163:	75 16                	jne    17b <strchr+0x2b>
 165:	eb 21                	jmp    188 <strchr+0x38>
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax
 170:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 174:	83 c0 01             	add    $0x1,%eax
 177:	84 d2                	test   %dl,%dl
 179:	74 0d                	je     188 <strchr+0x38>
    if(*s == c)
 17b:	38 d1                	cmp    %dl,%cl
 17d:	75 f1                	jne    170 <strchr+0x20>
      return (char*)s;
  return 0;
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 188:	31 c0                	xor    %eax,%eax
}
 18a:	5d                   	pop    %ebp
 18b:	c3                   	ret    
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 199:	31 f6                	xor    %esi,%esi
{
 19b:	53                   	push   %ebx
 19c:	89 f3                	mov    %esi,%ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1a4:	eb 33                	jmp    1d9 <gets+0x49>
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1b6:	6a 01                	push   $0x1
 1b8:	50                   	push   %eax
 1b9:	6a 00                	push   $0x0
 1bb:	e8 75 03 00 00       	call   535 <read>
    if(cc < 1)
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	85 c0                	test   %eax,%eax
 1c5:	7e 1c                	jle    1e3 <gets+0x53>
      break;
    buf[i++] = c;
 1c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1cb:	83 c7 01             	add    $0x1,%edi
 1ce:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	74 23                	je     1f8 <gets+0x68>
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 1f                	je     1f8 <gets+0x68>
  for(i=0; i+1 < max; ){
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	89 fe                	mov    %edi,%esi
 1de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1e1:	7c cd                	jl     1b0 <gets+0x20>
 1e3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1e8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5f                   	pop    %edi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f7:	90                   	nop
 1f8:	8b 75 08             	mov    0x8(%ebp),%esi
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 de                	add    %ebx,%esi
 200:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 202:	c6 03 00             	movb   $0x0,(%ebx)
}
 205:	8d 65 f4             	lea    -0xc(%ebp),%esp
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5f                   	pop    %edi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	56                   	push   %esi
 218:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	6a 00                	push   $0x0
 21e:	ff 75 08             	pushl  0x8(%ebp)
 221:	e8 37 03 00 00       	call   55d <open>
  if(fd < 0)
 226:	83 c4 10             	add    $0x10,%esp
 229:	85 c0                	test   %eax,%eax
 22b:	78 2b                	js     258 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 22d:	83 ec 08             	sub    $0x8,%esp
 230:	ff 75 0c             	pushl  0xc(%ebp)
 233:	89 c3                	mov    %eax,%ebx
 235:	50                   	push   %eax
 236:	e8 3a 03 00 00       	call   575 <fstat>
  close(fd);
 23b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23e:	89 c6                	mov    %eax,%esi
  close(fd);
 240:	e8 00 03 00 00       	call   545 <close>
  return r;
 245:	83 c4 10             	add    $0x10,%esp
}
 248:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24b:	89 f0                	mov    %esi,%eax
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 258:	be ff ff ff ff       	mov    $0xffffffff,%esi
 25d:	eb e9                	jmp    248 <stat+0x38>
 25f:	90                   	nop

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	53                   	push   %ebx
 268:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26b:	0f be 02             	movsbl (%edx),%eax
 26e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 271:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 274:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 279:	77 1a                	ja     295 <atoi+0x35>
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	89 c8                	mov    %ecx,%eax
 297:	5b                   	pop    %ebx
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	57                   	push   %edi
 2a8:	8b 45 10             	mov    0x10(%ebp),%eax
 2ab:	8b 55 08             	mov    0x8(%ebp),%edx
 2ae:	56                   	push   %esi
 2af:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b2:	85 c0                	test   %eax,%eax
 2b4:	7e 0f                	jle    2c5 <memmove+0x25>
 2b6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b8:	89 d7                	mov    %edx,%edi
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 2da:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2dd:	50                   	push   %eax
 2de:	e8 f2 02 00 00       	call   5d5 <join>
  
  return x;
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    
 2e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <lock_init>:

void lock_init(struct lock_t *lk){
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 300:	5d                   	pop    %ebp
 301:	c3                   	ret    
 302:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 315:	b9 01 00 00 00       	mov    $0x1,%ecx
 31a:	89 e5                	mov    %esp,%ebp
 31c:	8b 55 08             	mov    0x8(%ebp),%edx
 31f:	90                   	nop
 320:	89 c8                	mov    %ecx,%eax
 322:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 325:	85 c0                	test   %eax,%eax
 327:	75 f7                	jne    320 <lock_acquire+0x10>
}
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <lock_release>:
void lock_release(struct lock_t *lk){
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	31 c0                	xor    %eax,%eax
 337:	89 e5                	mov    %esp,%ebp
 339:	8b 55 08             	mov    0x8(%ebp),%edx
 33c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 355:	a1 c4 0b 00 00       	mov    0xbc4,%eax
{
 35a:	89 e5                	mov    %esp,%ebp
 35c:	57                   	push   %edi
 35d:	56                   	push   %esi
 35e:	53                   	push   %ebx
 35f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 362:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 364:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 367:	39 c8                	cmp    %ecx,%eax
 369:	73 15                	jae    380 <free+0x30>
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop
 370:	39 d1                	cmp    %edx,%ecx
 372:	72 14                	jb     388 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 374:	39 d0                	cmp    %edx,%eax
 376:	73 10                	jae    388 <free+0x38>
{
 378:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 37a:	8b 10                	mov    (%eax),%edx
 37c:	39 c8                	cmp    %ecx,%eax
 37e:	72 f0                	jb     370 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 380:	39 d0                	cmp    %edx,%eax
 382:	72 f4                	jb     378 <free+0x28>
 384:	39 d1                	cmp    %edx,%ecx
 386:	73 f0                	jae    378 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 388:	8b 73 fc             	mov    -0x4(%ebx),%esi
 38b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 38e:	39 fa                	cmp    %edi,%edx
 390:	74 1e                	je     3b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 392:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 395:	8b 50 04             	mov    0x4(%eax),%edx
 398:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 39b:	39 f1                	cmp    %esi,%ecx
 39d:	74 28                	je     3c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 39f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 3a1:	5b                   	pop    %ebx
  freep = p;
 3a2:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 3a7:	5e                   	pop    %esi
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 3b0:	03 72 04             	add    0x4(%edx),%esi
 3b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 3b6:	8b 10                	mov    (%eax),%edx
 3b8:	8b 12                	mov    (%edx),%edx
 3ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3bd:	8b 50 04             	mov    0x4(%eax),%edx
 3c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3c3:	39 f1                	cmp    %esi,%ecx
 3c5:	75 d8                	jne    39f <free+0x4f>
    p->s.size += bp->s.size;
 3c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 3ca:	a3 c4 0b 00 00       	mov    %eax,0xbc4
    p->s.size += bp->s.size;
 3cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 3d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 3d5:	89 10                	mov    %edx,(%eax)
}
 3d7:	5b                   	pop    %ebx
 3d8:	5e                   	pop    %esi
 3d9:	5f                   	pop    %edi
 3da:	5d                   	pop    %ebp
 3db:	c3                   	ret    
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	57                   	push   %edi
 3e8:	56                   	push   %esi
 3e9:	53                   	push   %ebx
 3ea:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 3f0:	8b 3d c4 0b 00 00    	mov    0xbc4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 3f6:	8d 70 07             	lea    0x7(%eax),%esi
 3f9:	c1 ee 03             	shr    $0x3,%esi
 3fc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 3ff:	85 ff                	test   %edi,%edi
 401:	0f 84 a9 00 00 00    	je     4b0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 407:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 409:	8b 48 04             	mov    0x4(%eax),%ecx
 40c:	39 f1                	cmp    %esi,%ecx
 40e:	73 6d                	jae    47d <malloc+0x9d>
 410:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 416:	bb 00 10 00 00       	mov    $0x1000,%ebx
 41b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 41e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 425:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 428:	eb 17                	jmp    441 <malloc+0x61>
 42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 430:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 432:	8b 4a 04             	mov    0x4(%edx),%ecx
 435:	39 f1                	cmp    %esi,%ecx
 437:	73 4f                	jae    488 <malloc+0xa8>
 439:	8b 3d c4 0b 00 00    	mov    0xbc4,%edi
 43f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 441:	39 c7                	cmp    %eax,%edi
 443:	75 eb                	jne    430 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 445:	83 ec 0c             	sub    $0xc,%esp
 448:	ff 75 e4             	pushl  -0x1c(%ebp)
 44b:	e8 65 01 00 00       	call   5b5 <sbrk>
  if(p == (char*)-1)
 450:	83 c4 10             	add    $0x10,%esp
 453:	83 f8 ff             	cmp    $0xffffffff,%eax
 456:	74 1b                	je     473 <malloc+0x93>
  hp->s.size = nu;
 458:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 45b:	83 ec 0c             	sub    $0xc,%esp
 45e:	83 c0 08             	add    $0x8,%eax
 461:	50                   	push   %eax
 462:	e8 e9 fe ff ff       	call   350 <free>
  return freep;
 467:	a1 c4 0b 00 00       	mov    0xbc4,%eax
      if((p = morecore(nunits)) == 0)
 46c:	83 c4 10             	add    $0x10,%esp
 46f:	85 c0                	test   %eax,%eax
 471:	75 bd                	jne    430 <malloc+0x50>
        return 0;
  }
}
 473:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 476:	31 c0                	xor    %eax,%eax
}
 478:	5b                   	pop    %ebx
 479:	5e                   	pop    %esi
 47a:	5f                   	pop    %edi
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    
    if(p->s.size >= nunits){
 47d:	89 c2                	mov    %eax,%edx
 47f:	89 f8                	mov    %edi,%eax
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 488:	39 ce                	cmp    %ecx,%esi
 48a:	74 54                	je     4e0 <malloc+0x100>
        p->s.size -= nunits;
 48c:	29 f1                	sub    %esi,%ecx
 48e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 491:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 494:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 497:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 49c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 49f:	8d 42 08             	lea    0x8(%edx),%eax
}
 4a2:	5b                   	pop    %ebx
 4a3:	5e                   	pop    %esi
 4a4:	5f                   	pop    %edi
 4a5:	5d                   	pop    %ebp
 4a6:	c3                   	ret    
 4a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 4b0:	c7 05 c4 0b 00 00 c8 	movl   $0xbc8,0xbc4
 4b7:	0b 00 00 
    base.s.size = 0;
 4ba:	bf c8 0b 00 00       	mov    $0xbc8,%edi
    base.s.ptr = freep = prevp = &base;
 4bf:	c7 05 c8 0b 00 00 c8 	movl   $0xbc8,0xbc8
 4c6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4c9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 4cb:	c7 05 cc 0b 00 00 00 	movl   $0x0,0xbcc
 4d2:	00 00 00 
    if(p->s.size >= nunits){
 4d5:	e9 36 ff ff ff       	jmp    410 <malloc+0x30>
 4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 4e0:	8b 0a                	mov    (%edx),%ecx
 4e2:	89 08                	mov    %ecx,(%eax)
 4e4:	eb b1                	jmp    497 <malloc+0xb7>
 4e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi

000004f0 <thread_create>:
{
 4f0:	f3 0f 1e fb          	endbr32 
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 4fa:	68 00 10 00 00       	push   $0x1000
 4ff:	e8 dc fe ff ff       	call   3e0 <malloc>
return clone(start_routine,arg1,arg2,stack);
 504:	50                   	push   %eax
 505:	ff 75 10             	pushl  0x10(%ebp)
 508:	ff 75 0c             	pushl  0xc(%ebp)
 50b:	ff 75 08             	pushl  0x8(%ebp)
 50e:	e8 ba 00 00 00       	call   5cd <clone>
}
 513:	c9                   	leave  
 514:	c3                   	ret    

00000515 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 515:	b8 01 00 00 00       	mov    $0x1,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <exit>:
SYSCALL(exit)
 51d:	b8 02 00 00 00       	mov    $0x2,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <wait>:
SYSCALL(wait)
 525:	b8 03 00 00 00       	mov    $0x3,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <pipe>:
SYSCALL(pipe)
 52d:	b8 04 00 00 00       	mov    $0x4,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <read>:
SYSCALL(read)
 535:	b8 05 00 00 00       	mov    $0x5,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <write>:
SYSCALL(write)
 53d:	b8 10 00 00 00       	mov    $0x10,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <close>:
SYSCALL(close)
 545:	b8 15 00 00 00       	mov    $0x15,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <kill>:
SYSCALL(kill)
 54d:	b8 06 00 00 00       	mov    $0x6,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <exec>:
SYSCALL(exec)
 555:	b8 07 00 00 00       	mov    $0x7,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <open>:
SYSCALL(open)
 55d:	b8 0f 00 00 00       	mov    $0xf,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <mknod>:
SYSCALL(mknod)
 565:	b8 11 00 00 00       	mov    $0x11,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <unlink>:
SYSCALL(unlink)
 56d:	b8 12 00 00 00       	mov    $0x12,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <fstat>:
SYSCALL(fstat)
 575:	b8 08 00 00 00       	mov    $0x8,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <link>:
SYSCALL(link)
 57d:	b8 13 00 00 00       	mov    $0x13,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <mkdir>:
SYSCALL(mkdir)
 585:	b8 14 00 00 00       	mov    $0x14,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <chdir>:
SYSCALL(chdir)
 58d:	b8 09 00 00 00       	mov    $0x9,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <dup>:
SYSCALL(dup)
 595:	b8 0a 00 00 00       	mov    $0xa,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <getpid>:
SYSCALL(getpid)
 59d:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <getyear>:
SYSCALL(getyear)
 5a5:	b8 16 00 00 00       	mov    $0x16,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <getreadcount>:
SYSCALL(getreadcount)
 5ad:	b8 17 00 00 00       	mov    $0x17,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <sbrk>:
SYSCALL(sbrk)
 5b5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <sleep>:
SYSCALL(sleep)
 5bd:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <uptime>:
SYSCALL(uptime)
 5c5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <clone>:
SYSCALL(clone)
 5cd:	b8 18 00 00 00       	mov    $0x18,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <join>:
SYSCALL(join)
 5d5:	b8 19 00 00 00       	mov    $0x19,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    
 5dd:	66 90                	xchg   %ax,%ax
 5df:	90                   	nop

000005e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 3c             	sub    $0x3c,%esp
 5e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ec:	89 d1                	mov    %edx,%ecx
{
 5ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5f1:	85 d2                	test   %edx,%edx
 5f3:	0f 89 7f 00 00 00    	jns    678 <printint+0x98>
 5f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5fd:	74 79                	je     678 <printint+0x98>
    neg = 1;
 5ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 606:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 608:	31 db                	xor    %ebx,%ebx
 60a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 610:	89 c8                	mov    %ecx,%eax
 612:	31 d2                	xor    %edx,%edx
 614:	89 cf                	mov    %ecx,%edi
 616:	f7 75 c4             	divl   -0x3c(%ebp)
 619:	0f b6 92 74 08 00 00 	movzbl 0x874(%edx),%edx
 620:	89 45 c0             	mov    %eax,-0x40(%ebp)
 623:	89 d8                	mov    %ebx,%eax
 625:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 628:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 62b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 62e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 631:	76 dd                	jbe    610 <printint+0x30>
  if(neg)
 633:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 636:	85 c9                	test   %ecx,%ecx
 638:	74 0c                	je     646 <printint+0x66>
    buf[i++] = '-';
 63a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 63f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 641:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 646:	8b 7d b8             	mov    -0x48(%ebp),%edi
 649:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 64d:	eb 07                	jmp    656 <printint+0x76>
 64f:	90                   	nop
 650:	0f b6 13             	movzbl (%ebx),%edx
 653:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 656:	83 ec 04             	sub    $0x4,%esp
 659:	88 55 d7             	mov    %dl,-0x29(%ebp)
 65c:	6a 01                	push   $0x1
 65e:	56                   	push   %esi
 65f:	57                   	push   %edi
 660:	e8 d8 fe ff ff       	call   53d <write>
  while(--i >= 0)
 665:	83 c4 10             	add    $0x10,%esp
 668:	39 de                	cmp    %ebx,%esi
 66a:	75 e4                	jne    650 <printint+0x70>
    putc(fd, buf[i]);
}
 66c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 678:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 67f:	eb 87                	jmp    608 <printint+0x28>
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop

00000690 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 690:	f3 0f 1e fb          	endbr32 
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	57                   	push   %edi
 698:	56                   	push   %esi
 699:	53                   	push   %ebx
 69a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 69d:	8b 75 0c             	mov    0xc(%ebp),%esi
 6a0:	0f b6 1e             	movzbl (%esi),%ebx
 6a3:	84 db                	test   %bl,%bl
 6a5:	0f 84 b4 00 00 00    	je     75f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6ab:	8d 45 10             	lea    0x10(%ebp),%eax
 6ae:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6b1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6b4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6b6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6b9:	eb 33                	jmp    6ee <printf+0x5e>
 6bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6bf:	90                   	nop
 6c0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6c3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6c8:	83 f8 25             	cmp    $0x25,%eax
 6cb:	74 17                	je     6e4 <printf+0x54>
  write(fd, &c, 1);
 6cd:	83 ec 04             	sub    $0x4,%esp
 6d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6d3:	6a 01                	push   $0x1
 6d5:	57                   	push   %edi
 6d6:	ff 75 08             	pushl  0x8(%ebp)
 6d9:	e8 5f fe ff ff       	call   53d <write>
 6de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6e1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6e4:	0f b6 1e             	movzbl (%esi),%ebx
 6e7:	83 c6 01             	add    $0x1,%esi
 6ea:	84 db                	test   %bl,%bl
 6ec:	74 71                	je     75f <printf+0xcf>
    c = fmt[i] & 0xff;
 6ee:	0f be cb             	movsbl %bl,%ecx
 6f1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6f4:	85 d2                	test   %edx,%edx
 6f6:	74 c8                	je     6c0 <printf+0x30>
      }
    } else if(state == '%'){
 6f8:	83 fa 25             	cmp    $0x25,%edx
 6fb:	75 e7                	jne    6e4 <printf+0x54>
      if(c == 'd'){
 6fd:	83 f8 64             	cmp    $0x64,%eax
 700:	0f 84 9a 00 00 00    	je     7a0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 706:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 70c:	83 f9 70             	cmp    $0x70,%ecx
 70f:	74 5f                	je     770 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 711:	83 f8 73             	cmp    $0x73,%eax
 714:	0f 84 d6 00 00 00    	je     7f0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 71a:	83 f8 63             	cmp    $0x63,%eax
 71d:	0f 84 8d 00 00 00    	je     7b0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 723:	83 f8 25             	cmp    $0x25,%eax
 726:	0f 84 b4 00 00 00    	je     7e0 <printf+0x150>
  write(fd, &c, 1);
 72c:	83 ec 04             	sub    $0x4,%esp
 72f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 733:	6a 01                	push   $0x1
 735:	57                   	push   %edi
 736:	ff 75 08             	pushl  0x8(%ebp)
 739:	e8 ff fd ff ff       	call   53d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 73e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 741:	83 c4 0c             	add    $0xc,%esp
 744:	6a 01                	push   $0x1
 746:	83 c6 01             	add    $0x1,%esi
 749:	57                   	push   %edi
 74a:	ff 75 08             	pushl  0x8(%ebp)
 74d:	e8 eb fd ff ff       	call   53d <write>
  for(i = 0; fmt[i]; i++){
 752:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 756:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 759:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 75b:	84 db                	test   %bl,%bl
 75d:	75 8f                	jne    6ee <printf+0x5e>
    }
  }
}
 75f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 762:	5b                   	pop    %ebx
 763:	5e                   	pop    %esi
 764:	5f                   	pop    %edi
 765:	5d                   	pop    %ebp
 766:	c3                   	ret    
 767:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 770:	83 ec 0c             	sub    $0xc,%esp
 773:	b9 10 00 00 00       	mov    $0x10,%ecx
 778:	6a 00                	push   $0x0
 77a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	8b 13                	mov    (%ebx),%edx
 782:	e8 59 fe ff ff       	call   5e0 <printint>
        ap++;
 787:	89 d8                	mov    %ebx,%eax
 789:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78c:	31 d2                	xor    %edx,%edx
        ap++;
 78e:	83 c0 04             	add    $0x4,%eax
 791:	89 45 d0             	mov    %eax,-0x30(%ebp)
 794:	e9 4b ff ff ff       	jmp    6e4 <printf+0x54>
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7a0:	83 ec 0c             	sub    $0xc,%esp
 7a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7a8:	6a 01                	push   $0x1
 7aa:	eb ce                	jmp    77a <printf+0xea>
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7b0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7b6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7b8:	6a 01                	push   $0x1
        ap++;
 7ba:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7bd:	57                   	push   %edi
 7be:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7c1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7c4:	e8 74 fd ff ff       	call   53d <write>
        ap++;
 7c9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7cc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7cf:	31 d2                	xor    %edx,%edx
 7d1:	e9 0e ff ff ff       	jmp    6e4 <printf+0x54>
 7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7e3:	83 ec 04             	sub    $0x4,%esp
 7e6:	e9 59 ff ff ff       	jmp    744 <printf+0xb4>
 7eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop
        s = (char*)*ap;
 7f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7f3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7f5:	83 c0 04             	add    $0x4,%eax
 7f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7fb:	85 db                	test   %ebx,%ebx
 7fd:	74 17                	je     816 <printf+0x186>
        while(*s != 0){
 7ff:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 802:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 804:	84 c0                	test   %al,%al
 806:	0f 84 d8 fe ff ff    	je     6e4 <printf+0x54>
 80c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 80f:	89 de                	mov    %ebx,%esi
 811:	8b 5d 08             	mov    0x8(%ebp),%ebx
 814:	eb 1a                	jmp    830 <printf+0x1a0>
          s = "(null)";
 816:	bb 6c 08 00 00       	mov    $0x86c,%ebx
        while(*s != 0){
 81b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 81e:	b8 28 00 00 00       	mov    $0x28,%eax
 823:	89 de                	mov    %ebx,%esi
 825:	8b 5d 08             	mov    0x8(%ebp),%ebx
 828:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop
  write(fd, &c, 1);
 830:	83 ec 04             	sub    $0x4,%esp
          s++;
 833:	83 c6 01             	add    $0x1,%esi
 836:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 839:	6a 01                	push   $0x1
 83b:	57                   	push   %edi
 83c:	53                   	push   %ebx
 83d:	e8 fb fc ff ff       	call   53d <write>
        while(*s != 0){
 842:	0f b6 06             	movzbl (%esi),%eax
 845:	83 c4 10             	add    $0x10,%esp
 848:	84 c0                	test   %al,%al
 84a:	75 e4                	jne    830 <printf+0x1a0>
 84c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 84f:	31 d2                	xor    %edx,%edx
 851:	e9 8e fe ff ff       	jmp    6e4 <printf+0x54>
