
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
  if(argc != 3){
   e:	83 39 03             	cmpl   $0x3,(%ecx)
{
  11:	55                   	push   %ebp
  12:	89 e5                	mov    %esp,%ebp
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  19:	74 13                	je     2e <main+0x2e>
    printf(2, "Usage: ln old new\n");
  1b:	52                   	push   %edx
  1c:	52                   	push   %edx
  1d:	68 48 08 00 00       	push   $0x848
  22:	6a 02                	push   $0x2
  24:	e8 57 06 00 00       	call   680 <printf>
    exit();
  29:	e8 df 04 00 00       	call   50d <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2e:	50                   	push   %eax
  2f:	50                   	push   %eax
  30:	ff 73 08             	pushl  0x8(%ebx)
  33:	ff 73 04             	pushl  0x4(%ebx)
  36:	e8 32 05 00 00       	call   56d <link>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 c6 04 00 00       	call   50d <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	ff 73 08             	pushl  0x8(%ebx)
  4a:	ff 73 04             	pushl  0x4(%ebx)
  4d:	68 5b 08 00 00       	push   $0x85b
  52:	6a 02                	push   $0x2
  54:	e8 27 06 00 00       	call   680 <printf>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	eb e4                	jmp    42 <main+0x42>
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  65:	31 c0                	xor    %eax,%eax
{
  67:	89 e5                	mov    %esp,%ebp
  69:	53                   	push   %ebx
  6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	89 c8                	mov    %ecx,%eax
  80:	5b                   	pop    %ebx
  81:	5d                   	pop    %ebp
  82:	c3                   	ret    
  83:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	53                   	push   %ebx
  98:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  9e:	0f b6 01             	movzbl (%ecx),%eax
  a1:	0f b6 1a             	movzbl (%edx),%ebx
  a4:	84 c0                	test   %al,%al
  a6:	75 19                	jne    c1 <strcmp+0x31>
  a8:	eb 26                	jmp    d0 <strcmp+0x40>
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  b4:	83 c1 01             	add    $0x1,%ecx
  b7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ba:	0f b6 1a             	movzbl (%edx),%ebx
  bd:	84 c0                	test   %al,%al
  bf:	74 0f                	je     d0 <strcmp+0x40>
  c1:	38 d8                	cmp    %bl,%al
  c3:	74 eb                	je     b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  c5:	29 d8                	sub    %ebx,%eax
}
  c7:	5b                   	pop    %ebx
  c8:	5d                   	pop    %ebp
  c9:	c3                   	ret    
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  de:	66 90                	xchg   %ax,%ax

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  ea:	80 3a 00             	cmpb   $0x0,(%edx)
  ed:	74 21                	je     110 <strlen+0x30>
  ef:	31 c0                	xor    %eax,%eax
  f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  f8:	83 c0 01             	add    $0x1,%eax
  fb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  ff:	89 c1                	mov    %eax,%ecx
 101:	75 f5                	jne    f8 <strlen+0x18>
    ;
  return n;
}
 103:	89 c8                	mov    %ecx,%eax
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 12b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12e:	8b 45 0c             	mov    0xc(%ebp),%eax
 131:	89 d7                	mov    %edx,%edi
 133:	fc                   	cld    
 134:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 136:	89 d0                	mov    %edx,%eax
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14e:	0f b6 10             	movzbl (%eax),%edx
 151:	84 d2                	test   %dl,%dl
 153:	75 16                	jne    16b <strchr+0x2b>
 155:	eb 21                	jmp    178 <strchr+0x38>
 157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15e:	66 90                	xchg   %ax,%ax
 160:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 164:	83 c0 01             	add    $0x1,%eax
 167:	84 d2                	test   %dl,%dl
 169:	74 0d                	je     178 <strchr+0x38>
    if(*s == c)
 16b:	38 d1                	cmp    %dl,%cl
 16d:	75 f1                	jne    160 <strchr+0x20>
      return (char*)s;
  return 0;
}
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 178:	31 c0                	xor    %eax,%eax
}
 17a:	5d                   	pop    %ebp
 17b:	c3                   	ret    
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	57                   	push   %edi
 188:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 189:	31 f6                	xor    %esi,%esi
{
 18b:	53                   	push   %ebx
 18c:	89 f3                	mov    %esi,%ebx
 18e:	83 ec 1c             	sub    $0x1c,%esp
 191:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 194:	eb 33                	jmp    1c9 <gets+0x49>
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a6:	6a 01                	push   $0x1
 1a8:	50                   	push   %eax
 1a9:	6a 00                	push   $0x0
 1ab:	e8 75 03 00 00       	call   525 <read>
    if(cc < 1)
 1b0:	83 c4 10             	add    $0x10,%esp
 1b3:	85 c0                	test   %eax,%eax
 1b5:	7e 1c                	jle    1d3 <gets+0x53>
      break;
    buf[i++] = c;
 1b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1bb:	83 c7 01             	add    $0x1,%edi
 1be:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1c1:	3c 0a                	cmp    $0xa,%al
 1c3:	74 23                	je     1e8 <gets+0x68>
 1c5:	3c 0d                	cmp    $0xd,%al
 1c7:	74 1f                	je     1e8 <gets+0x68>
  for(i=0; i+1 < max; ){
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	89 fe                	mov    %edi,%esi
 1ce:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d1:	7c cd                	jl     1a0 <gets+0x20>
 1d3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1d5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1d8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1de:	5b                   	pop    %ebx
 1df:	5e                   	pop    %esi
 1e0:	5f                   	pop    %edi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	8b 75 08             	mov    0x8(%ebp),%esi
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ee:	01 de                	add    %ebx,%esi
 1f0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1f2:	c6 03 00             	movb   $0x0,(%ebx)
}
 1f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f8:	5b                   	pop    %ebx
 1f9:	5e                   	pop    %esi
 1fa:	5f                   	pop    %edi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	56                   	push   %esi
 208:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	6a 00                	push   $0x0
 20e:	ff 75 08             	pushl  0x8(%ebp)
 211:	e8 37 03 00 00       	call   54d <open>
  if(fd < 0)
 216:	83 c4 10             	add    $0x10,%esp
 219:	85 c0                	test   %eax,%eax
 21b:	78 2b                	js     248 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 21d:	83 ec 08             	sub    $0x8,%esp
 220:	ff 75 0c             	pushl  0xc(%ebp)
 223:	89 c3                	mov    %eax,%ebx
 225:	50                   	push   %eax
 226:	e8 3a 03 00 00       	call   565 <fstat>
  close(fd);
 22b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22e:	89 c6                	mov    %eax,%esi
  close(fd);
 230:	e8 00 03 00 00       	call   535 <close>
  return r;
 235:	83 c4 10             	add    $0x10,%esp
}
 238:	8d 65 f8             	lea    -0x8(%ebp),%esp
 23b:	89 f0                	mov    %esi,%eax
 23d:	5b                   	pop    %ebx
 23e:	5e                   	pop    %esi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 248:	be ff ff ff ff       	mov    $0xffffffff,%esi
 24d:	eb e9                	jmp    238 <stat+0x38>
 24f:	90                   	nop

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	53                   	push   %ebx
 258:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25b:	0f be 02             	movsbl (%edx),%eax
 25e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 261:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 264:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 269:	77 1a                	ja     285 <atoi+0x35>
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	89 c8                	mov    %ecx,%eax
 287:	5b                   	pop    %ebx
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	8b 45 10             	mov    0x10(%ebp),%eax
 29b:	8b 55 08             	mov    0x8(%ebp),%edx
 29e:	56                   	push   %esi
 29f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a2:	85 c0                	test   %eax,%eax
 2a4:	7e 0f                	jle    2b5 <memmove+0x25>
 2a6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a8:	89 d7                	mov    %edx,%edi
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 2ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2cd:	50                   	push   %eax
 2ce:	e8 f2 02 00 00       	call   5c5 <join>
  
  return x;
}
 2d3:	c9                   	leave  
 2d4:	c3                   	ret    
 2d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002e0 <lock_init>:

void lock_init(struct lock_t *lk){
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2f0:	5d                   	pop    %ebp
 2f1:	c3                   	ret    
 2f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000300 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 305:	b9 01 00 00 00       	mov    $0x1,%ecx
 30a:	89 e5                	mov    %esp,%ebp
 30c:	8b 55 08             	mov    0x8(%ebp),%edx
 30f:	90                   	nop
 310:	89 c8                	mov    %ecx,%eax
 312:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 315:	85 c0                	test   %eax,%eax
 317:	75 f7                	jne    310 <lock_acquire+0x10>
}
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop

00000320 <lock_release>:
void lock_release(struct lock_t *lk){
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	31 c0                	xor    %eax,%eax
 327:	89 e5                	mov    %esp,%ebp
 329:	8b 55 08             	mov    0x8(%ebp),%edx
 32c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 338:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 345:	a1 c4 0b 00 00       	mov    0xbc4,%eax
{
 34a:	89 e5                	mov    %esp,%ebp
 34c:	57                   	push   %edi
 34d:	56                   	push   %esi
 34e:	53                   	push   %ebx
 34f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 352:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 354:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 357:	39 c8                	cmp    %ecx,%eax
 359:	73 15                	jae    370 <free+0x30>
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
 360:	39 d1                	cmp    %edx,%ecx
 362:	72 14                	jb     378 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 364:	39 d0                	cmp    %edx,%eax
 366:	73 10                	jae    378 <free+0x38>
{
 368:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 36a:	8b 10                	mov    (%eax),%edx
 36c:	39 c8                	cmp    %ecx,%eax
 36e:	72 f0                	jb     360 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 370:	39 d0                	cmp    %edx,%eax
 372:	72 f4                	jb     368 <free+0x28>
 374:	39 d1                	cmp    %edx,%ecx
 376:	73 f0                	jae    368 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 378:	8b 73 fc             	mov    -0x4(%ebx),%esi
 37b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 37e:	39 fa                	cmp    %edi,%edx
 380:	74 1e                	je     3a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 382:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 385:	8b 50 04             	mov    0x4(%eax),%edx
 388:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 38b:	39 f1                	cmp    %esi,%ecx
 38d:	74 28                	je     3b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 38f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 391:	5b                   	pop    %ebx
  freep = p;
 392:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 397:	5e                   	pop    %esi
 398:	5f                   	pop    %edi
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 3a0:	03 72 04             	add    0x4(%edx),%esi
 3a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 3a6:	8b 10                	mov    (%eax),%edx
 3a8:	8b 12                	mov    (%edx),%edx
 3aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3ad:	8b 50 04             	mov    0x4(%eax),%edx
 3b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3b3:	39 f1                	cmp    %esi,%ecx
 3b5:	75 d8                	jne    38f <free+0x4f>
    p->s.size += bp->s.size;
 3b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 3ba:	a3 c4 0b 00 00       	mov    %eax,0xbc4
    p->s.size += bp->s.size;
 3bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 3c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 3c5:	89 10                	mov    %edx,(%eax)
}
 3c7:	5b                   	pop    %ebx
 3c8:	5e                   	pop    %esi
 3c9:	5f                   	pop    %edi
 3ca:	5d                   	pop    %ebp
 3cb:	c3                   	ret    
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	57                   	push   %edi
 3d8:	56                   	push   %esi
 3d9:	53                   	push   %ebx
 3da:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 3e0:	8b 3d c4 0b 00 00    	mov    0xbc4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 3e6:	8d 70 07             	lea    0x7(%eax),%esi
 3e9:	c1 ee 03             	shr    $0x3,%esi
 3ec:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 3ef:	85 ff                	test   %edi,%edi
 3f1:	0f 84 a9 00 00 00    	je     4a0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3f7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 3f9:	8b 48 04             	mov    0x4(%eax),%ecx
 3fc:	39 f1                	cmp    %esi,%ecx
 3fe:	73 6d                	jae    46d <malloc+0x9d>
 400:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 406:	bb 00 10 00 00       	mov    $0x1000,%ebx
 40b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 40e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 415:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 418:	eb 17                	jmp    431 <malloc+0x61>
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 420:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 422:	8b 4a 04             	mov    0x4(%edx),%ecx
 425:	39 f1                	cmp    %esi,%ecx
 427:	73 4f                	jae    478 <malloc+0xa8>
 429:	8b 3d c4 0b 00 00    	mov    0xbc4,%edi
 42f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 431:	39 c7                	cmp    %eax,%edi
 433:	75 eb                	jne    420 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 435:	83 ec 0c             	sub    $0xc,%esp
 438:	ff 75 e4             	pushl  -0x1c(%ebp)
 43b:	e8 65 01 00 00       	call   5a5 <sbrk>
  if(p == (char*)-1)
 440:	83 c4 10             	add    $0x10,%esp
 443:	83 f8 ff             	cmp    $0xffffffff,%eax
 446:	74 1b                	je     463 <malloc+0x93>
  hp->s.size = nu;
 448:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 44b:	83 ec 0c             	sub    $0xc,%esp
 44e:	83 c0 08             	add    $0x8,%eax
 451:	50                   	push   %eax
 452:	e8 e9 fe ff ff       	call   340 <free>
  return freep;
 457:	a1 c4 0b 00 00       	mov    0xbc4,%eax
      if((p = morecore(nunits)) == 0)
 45c:	83 c4 10             	add    $0x10,%esp
 45f:	85 c0                	test   %eax,%eax
 461:	75 bd                	jne    420 <malloc+0x50>
        return 0;
  }
}
 463:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 466:	31 c0                	xor    %eax,%eax
}
 468:	5b                   	pop    %ebx
 469:	5e                   	pop    %esi
 46a:	5f                   	pop    %edi
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    
    if(p->s.size >= nunits){
 46d:	89 c2                	mov    %eax,%edx
 46f:	89 f8                	mov    %edi,%eax
 471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 478:	39 ce                	cmp    %ecx,%esi
 47a:	74 54                	je     4d0 <malloc+0x100>
        p->s.size -= nunits;
 47c:	29 f1                	sub    %esi,%ecx
 47e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 481:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 484:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 487:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 48c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 48f:	8d 42 08             	lea    0x8(%edx),%eax
}
 492:	5b                   	pop    %ebx
 493:	5e                   	pop    %esi
 494:	5f                   	pop    %edi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 4a0:	c7 05 c4 0b 00 00 c8 	movl   $0xbc8,0xbc4
 4a7:	0b 00 00 
    base.s.size = 0;
 4aa:	bf c8 0b 00 00       	mov    $0xbc8,%edi
    base.s.ptr = freep = prevp = &base;
 4af:	c7 05 c8 0b 00 00 c8 	movl   $0xbc8,0xbc8
 4b6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4b9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 4bb:	c7 05 cc 0b 00 00 00 	movl   $0x0,0xbcc
 4c2:	00 00 00 
    if(p->s.size >= nunits){
 4c5:	e9 36 ff ff ff       	jmp    400 <malloc+0x30>
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 4d0:	8b 0a                	mov    (%edx),%ecx
 4d2:	89 08                	mov    %ecx,(%eax)
 4d4:	eb b1                	jmp    487 <malloc+0xb7>
 4d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4dd:	8d 76 00             	lea    0x0(%esi),%esi

000004e0 <thread_create>:
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 4ea:	68 00 10 00 00       	push   $0x1000
 4ef:	e8 dc fe ff ff       	call   3d0 <malloc>
return clone(start_routine,arg1,arg2,stack);
 4f4:	50                   	push   %eax
 4f5:	ff 75 10             	pushl  0x10(%ebp)
 4f8:	ff 75 0c             	pushl  0xc(%ebp)
 4fb:	ff 75 08             	pushl  0x8(%ebp)
 4fe:	e8 ba 00 00 00       	call   5bd <clone>
}
 503:	c9                   	leave  
 504:	c3                   	ret    

00000505 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 505:	b8 01 00 00 00       	mov    $0x1,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <exit>:
SYSCALL(exit)
 50d:	b8 02 00 00 00       	mov    $0x2,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <wait>:
SYSCALL(wait)
 515:	b8 03 00 00 00       	mov    $0x3,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <pipe>:
SYSCALL(pipe)
 51d:	b8 04 00 00 00       	mov    $0x4,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <read>:
SYSCALL(read)
 525:	b8 05 00 00 00       	mov    $0x5,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <write>:
SYSCALL(write)
 52d:	b8 10 00 00 00       	mov    $0x10,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <close>:
SYSCALL(close)
 535:	b8 15 00 00 00       	mov    $0x15,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <kill>:
SYSCALL(kill)
 53d:	b8 06 00 00 00       	mov    $0x6,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <exec>:
SYSCALL(exec)
 545:	b8 07 00 00 00       	mov    $0x7,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <open>:
SYSCALL(open)
 54d:	b8 0f 00 00 00       	mov    $0xf,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <mknod>:
SYSCALL(mknod)
 555:	b8 11 00 00 00       	mov    $0x11,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <unlink>:
SYSCALL(unlink)
 55d:	b8 12 00 00 00       	mov    $0x12,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <fstat>:
SYSCALL(fstat)
 565:	b8 08 00 00 00       	mov    $0x8,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <link>:
SYSCALL(link)
 56d:	b8 13 00 00 00       	mov    $0x13,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <mkdir>:
SYSCALL(mkdir)
 575:	b8 14 00 00 00       	mov    $0x14,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <chdir>:
SYSCALL(chdir)
 57d:	b8 09 00 00 00       	mov    $0x9,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <dup>:
SYSCALL(dup)
 585:	b8 0a 00 00 00       	mov    $0xa,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <getpid>:
SYSCALL(getpid)
 58d:	b8 0b 00 00 00       	mov    $0xb,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <getyear>:
SYSCALL(getyear)
 595:	b8 16 00 00 00       	mov    $0x16,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <getreadcount>:
SYSCALL(getreadcount)
 59d:	b8 17 00 00 00       	mov    $0x17,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <sbrk>:
SYSCALL(sbrk)
 5a5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <sleep>:
SYSCALL(sleep)
 5ad:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <uptime>:
SYSCALL(uptime)
 5b5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <clone>:
SYSCALL(clone)
 5bd:	b8 18 00 00 00       	mov    $0x18,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <join>:
SYSCALL(join)
 5c5:	b8 19 00 00 00       	mov    $0x19,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    
 5cd:	66 90                	xchg   %ax,%ax
 5cf:	90                   	nop

000005d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 3c             	sub    $0x3c,%esp
 5d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5dc:	89 d1                	mov    %edx,%ecx
{
 5de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5e1:	85 d2                	test   %edx,%edx
 5e3:	0f 89 7f 00 00 00    	jns    668 <printint+0x98>
 5e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5ed:	74 79                	je     668 <printint+0x98>
    neg = 1;
 5ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5f8:	31 db                	xor    %ebx,%ebx
 5fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 600:	89 c8                	mov    %ecx,%eax
 602:	31 d2                	xor    %edx,%edx
 604:	89 cf                	mov    %ecx,%edi
 606:	f7 75 c4             	divl   -0x3c(%ebp)
 609:	0f b6 92 78 08 00 00 	movzbl 0x878(%edx),%edx
 610:	89 45 c0             	mov    %eax,-0x40(%ebp)
 613:	89 d8                	mov    %ebx,%eax
 615:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 618:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 61b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 61e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 621:	76 dd                	jbe    600 <printint+0x30>
  if(neg)
 623:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 626:	85 c9                	test   %ecx,%ecx
 628:	74 0c                	je     636 <printint+0x66>
    buf[i++] = '-';
 62a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 62f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 631:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 636:	8b 7d b8             	mov    -0x48(%ebp),%edi
 639:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 63d:	eb 07                	jmp    646 <printint+0x76>
 63f:	90                   	nop
 640:	0f b6 13             	movzbl (%ebx),%edx
 643:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 646:	83 ec 04             	sub    $0x4,%esp
 649:	88 55 d7             	mov    %dl,-0x29(%ebp)
 64c:	6a 01                	push   $0x1
 64e:	56                   	push   %esi
 64f:	57                   	push   %edi
 650:	e8 d8 fe ff ff       	call   52d <write>
  while(--i >= 0)
 655:	83 c4 10             	add    $0x10,%esp
 658:	39 de                	cmp    %ebx,%esi
 65a:	75 e4                	jne    640 <printint+0x70>
    putc(fd, buf[i]);
}
 65c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 65f:	5b                   	pop    %ebx
 660:	5e                   	pop    %esi
 661:	5f                   	pop    %edi
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 668:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 66f:	eb 87                	jmp    5f8 <printint+0x28>
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop

00000680 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 680:	f3 0f 1e fb          	endbr32 
 684:	55                   	push   %ebp
 685:	89 e5                	mov    %esp,%ebp
 687:	57                   	push   %edi
 688:	56                   	push   %esi
 689:	53                   	push   %ebx
 68a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 68d:	8b 75 0c             	mov    0xc(%ebp),%esi
 690:	0f b6 1e             	movzbl (%esi),%ebx
 693:	84 db                	test   %bl,%bl
 695:	0f 84 b4 00 00 00    	je     74f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 69b:	8d 45 10             	lea    0x10(%ebp),%eax
 69e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6a1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6a4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a9:	eb 33                	jmp    6de <printf+0x5e>
 6ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop
 6b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6b3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6b8:	83 f8 25             	cmp    $0x25,%eax
 6bb:	74 17                	je     6d4 <printf+0x54>
  write(fd, &c, 1);
 6bd:	83 ec 04             	sub    $0x4,%esp
 6c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6c3:	6a 01                	push   $0x1
 6c5:	57                   	push   %edi
 6c6:	ff 75 08             	pushl  0x8(%ebp)
 6c9:	e8 5f fe ff ff       	call   52d <write>
 6ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6d1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6d4:	0f b6 1e             	movzbl (%esi),%ebx
 6d7:	83 c6 01             	add    $0x1,%esi
 6da:	84 db                	test   %bl,%bl
 6dc:	74 71                	je     74f <printf+0xcf>
    c = fmt[i] & 0xff;
 6de:	0f be cb             	movsbl %bl,%ecx
 6e1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6e4:	85 d2                	test   %edx,%edx
 6e6:	74 c8                	je     6b0 <printf+0x30>
      }
    } else if(state == '%'){
 6e8:	83 fa 25             	cmp    $0x25,%edx
 6eb:	75 e7                	jne    6d4 <printf+0x54>
      if(c == 'd'){
 6ed:	83 f8 64             	cmp    $0x64,%eax
 6f0:	0f 84 9a 00 00 00    	je     790 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6f6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6fc:	83 f9 70             	cmp    $0x70,%ecx
 6ff:	74 5f                	je     760 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 701:	83 f8 73             	cmp    $0x73,%eax
 704:	0f 84 d6 00 00 00    	je     7e0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 70a:	83 f8 63             	cmp    $0x63,%eax
 70d:	0f 84 8d 00 00 00    	je     7a0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 713:	83 f8 25             	cmp    $0x25,%eax
 716:	0f 84 b4 00 00 00    	je     7d0 <printf+0x150>
  write(fd, &c, 1);
 71c:	83 ec 04             	sub    $0x4,%esp
 71f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 723:	6a 01                	push   $0x1
 725:	57                   	push   %edi
 726:	ff 75 08             	pushl  0x8(%ebp)
 729:	e8 ff fd ff ff       	call   52d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 72e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 731:	83 c4 0c             	add    $0xc,%esp
 734:	6a 01                	push   $0x1
 736:	83 c6 01             	add    $0x1,%esi
 739:	57                   	push   %edi
 73a:	ff 75 08             	pushl  0x8(%ebp)
 73d:	e8 eb fd ff ff       	call   52d <write>
  for(i = 0; fmt[i]; i++){
 742:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 746:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 749:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 74b:	84 db                	test   %bl,%bl
 74d:	75 8f                	jne    6de <printf+0x5e>
    }
  }
}
 74f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 752:	5b                   	pop    %ebx
 753:	5e                   	pop    %esi
 754:	5f                   	pop    %edi
 755:	5d                   	pop    %ebp
 756:	c3                   	ret    
 757:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 10 00 00 00       	mov    $0x10,%ecx
 768:	6a 00                	push   $0x0
 76a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 76d:	8b 45 08             	mov    0x8(%ebp),%eax
 770:	8b 13                	mov    (%ebx),%edx
 772:	e8 59 fe ff ff       	call   5d0 <printint>
        ap++;
 777:	89 d8                	mov    %ebx,%eax
 779:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77c:	31 d2                	xor    %edx,%edx
        ap++;
 77e:	83 c0 04             	add    $0x4,%eax
 781:	89 45 d0             	mov    %eax,-0x30(%ebp)
 784:	e9 4b ff ff ff       	jmp    6d4 <printf+0x54>
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	b9 0a 00 00 00       	mov    $0xa,%ecx
 798:	6a 01                	push   $0x1
 79a:	eb ce                	jmp    76a <printf+0xea>
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7a6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7a8:	6a 01                	push   $0x1
        ap++;
 7aa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7ad:	57                   	push   %edi
 7ae:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7b1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7b4:	e8 74 fd ff ff       	call   52d <write>
        ap++;
 7b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7bf:	31 d2                	xor    %edx,%edx
 7c1:	e9 0e ff ff ff       	jmp    6d4 <printf+0x54>
 7c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7d3:	83 ec 04             	sub    $0x4,%esp
 7d6:	e9 59 ff ff ff       	jmp    734 <printf+0xb4>
 7db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
        s = (char*)*ap;
 7e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7e3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7e5:	83 c0 04             	add    $0x4,%eax
 7e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7eb:	85 db                	test   %ebx,%ebx
 7ed:	74 17                	je     806 <printf+0x186>
        while(*s != 0){
 7ef:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7f2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7f4:	84 c0                	test   %al,%al
 7f6:	0f 84 d8 fe ff ff    	je     6d4 <printf+0x54>
 7fc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ff:	89 de                	mov    %ebx,%esi
 801:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804:	eb 1a                	jmp    820 <printf+0x1a0>
          s = "(null)";
 806:	bb 6f 08 00 00       	mov    $0x86f,%ebx
        while(*s != 0){
 80b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 80e:	b8 28 00 00 00       	mov    $0x28,%eax
 813:	89 de                	mov    %ebx,%esi
 815:	8b 5d 08             	mov    0x8(%ebp),%ebx
 818:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81f:	90                   	nop
  write(fd, &c, 1);
 820:	83 ec 04             	sub    $0x4,%esp
          s++;
 823:	83 c6 01             	add    $0x1,%esi
 826:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 829:	6a 01                	push   $0x1
 82b:	57                   	push   %edi
 82c:	53                   	push   %ebx
 82d:	e8 fb fc ff ff       	call   52d <write>
        while(*s != 0){
 832:	0f b6 06             	movzbl (%esi),%eax
 835:	83 c4 10             	add    $0x10,%esp
 838:	84 c0                	test   %al,%al
 83a:	75 e4                	jne    820 <printf+0x1a0>
 83c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 83f:	31 d2                	xor    %edx,%edx
 841:	e9 8e fe ff ff       	jmp    6d4 <printf+0x54>
