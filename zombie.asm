
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	51                   	push   %ecx
  12:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  15:	e8 bb 04 00 00       	call   4d5 <fork>
  1a:	85 c0                	test   %eax,%eax
  1c:	7e 0d                	jle    2b <main+0x2b>
    sleep(5);  // Let child exit before parent.
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	6a 05                	push   $0x5
  23:	e8 55 05 00 00       	call   57d <sleep>
  28:	83 c4 10             	add    $0x10,%esp
  exit();
  2b:	e8 ad 04 00 00       	call   4dd <exit>

00000030 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
  30:	f3 0f 1e fb          	endbr32 
  34:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  35:	31 c0                	xor    %eax,%eax
{
  37:	89 e5                	mov    %esp,%ebp
  39:	53                   	push   %ebx
  3a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  3d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	89 c8                	mov    %ecx,%eax
  50:	5b                   	pop    %ebx
  51:	5d                   	pop    %ebp
  52:	c3                   	ret    
  53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	53                   	push   %ebx
  68:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  6e:	0f b6 01             	movzbl (%ecx),%eax
  71:	0f b6 1a             	movzbl (%edx),%ebx
  74:	84 c0                	test   %al,%al
  76:	75 19                	jne    91 <strcmp+0x31>
  78:	eb 26                	jmp    a0 <strcmp+0x40>
  7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  80:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  84:	83 c1 01             	add    $0x1,%ecx
  87:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  8a:	0f b6 1a             	movzbl (%edx),%ebx
  8d:	84 c0                	test   %al,%al
  8f:	74 0f                	je     a0 <strcmp+0x40>
  91:	38 d8                	cmp    %bl,%al
  93:	74 eb                	je     80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  95:	29 d8                	sub    %ebx,%eax
}
  97:	5b                   	pop    %ebx
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  a2:	29 d8                	sub    %ebx,%eax
}
  a4:	5b                   	pop    %ebx
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    
  a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ae:	66 90                	xchg   %ax,%ax

000000b0 <strlen>:

uint
strlen(const char *s)
{
  b0:	f3 0f 1e fb          	endbr32 
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  ba:	80 3a 00             	cmpb   $0x0,(%edx)
  bd:	74 21                	je     e0 <strlen+0x30>
  bf:	31 c0                	xor    %eax,%eax
  c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  c8:	83 c0 01             	add    $0x1,%eax
  cb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  cf:	89 c1                	mov    %eax,%ecx
  d1:	75 f5                	jne    c8 <strlen+0x18>
    ;
  return n;
}
  d3:	89 c8                	mov    %ecx,%eax
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  de:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	57                   	push   %edi
  f8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	89 d7                	mov    %edx,%edi
 103:	fc                   	cld    
 104:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 106:	89 d0                	mov    %edx,%eax
 108:	5f                   	pop    %edi
 109:	5d                   	pop    %ebp
 10a:	c3                   	ret    
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	8b 45 08             	mov    0x8(%ebp),%eax
 11a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11e:	0f b6 10             	movzbl (%eax),%edx
 121:	84 d2                	test   %dl,%dl
 123:	75 16                	jne    13b <strchr+0x2b>
 125:	eb 21                	jmp    148 <strchr+0x38>
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax
 130:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 134:	83 c0 01             	add    $0x1,%eax
 137:	84 d2                	test   %dl,%dl
 139:	74 0d                	je     148 <strchr+0x38>
    if(*s == c)
 13b:	38 d1                	cmp    %dl,%cl
 13d:	75 f1                	jne    130 <strchr+0x20>
      return (char*)s;
  return 0;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 148:	31 c0                	xor    %eax,%eax
}
 14a:	5d                   	pop    %ebp
 14b:	c3                   	ret    
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	57                   	push   %edi
 158:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 159:	31 f6                	xor    %esi,%esi
{
 15b:	53                   	push   %ebx
 15c:	89 f3                	mov    %esi,%ebx
 15e:	83 ec 1c             	sub    $0x1c,%esp
 161:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 164:	eb 33                	jmp    199 <gets+0x49>
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 170:	83 ec 04             	sub    $0x4,%esp
 173:	8d 45 e7             	lea    -0x19(%ebp),%eax
 176:	6a 01                	push   $0x1
 178:	50                   	push   %eax
 179:	6a 00                	push   $0x0
 17b:	e8 75 03 00 00       	call   4f5 <read>
    if(cc < 1)
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	7e 1c                	jle    1a3 <gets+0x53>
      break;
    buf[i++] = c;
 187:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 18b:	83 c7 01             	add    $0x1,%edi
 18e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 191:	3c 0a                	cmp    $0xa,%al
 193:	74 23                	je     1b8 <gets+0x68>
 195:	3c 0d                	cmp    $0xd,%al
 197:	74 1f                	je     1b8 <gets+0x68>
  for(i=0; i+1 < max; ){
 199:	83 c3 01             	add    $0x1,%ebx
 19c:	89 fe                	mov    %edi,%esi
 19e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1a1:	7c cd                	jl     170 <gets+0x20>
 1a3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1a8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ae:	5b                   	pop    %ebx
 1af:	5e                   	pop    %esi
 1b0:	5f                   	pop    %edi
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b7:	90                   	nop
 1b8:	8b 75 08             	mov    0x8(%ebp),%esi
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	01 de                	add    %ebx,%esi
 1c0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1c2:	c6 03 00             	movb   $0x0,(%ebx)
}
 1c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c8:	5b                   	pop    %ebx
 1c9:	5e                   	pop    %esi
 1ca:	5f                   	pop    %edi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	6a 00                	push   $0x0
 1de:	ff 75 08             	pushl  0x8(%ebp)
 1e1:	e8 37 03 00 00       	call   51d <open>
  if(fd < 0)
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	85 c0                	test   %eax,%eax
 1eb:	78 2b                	js     218 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1ed:	83 ec 08             	sub    $0x8,%esp
 1f0:	ff 75 0c             	pushl  0xc(%ebp)
 1f3:	89 c3                	mov    %eax,%ebx
 1f5:	50                   	push   %eax
 1f6:	e8 3a 03 00 00       	call   535 <fstat>
  close(fd);
 1fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1fe:	89 c6                	mov    %eax,%esi
  close(fd);
 200:	e8 00 03 00 00       	call   505 <close>
  return r;
 205:	83 c4 10             	add    $0x10,%esp
}
 208:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20b:	89 f0                	mov    %esi,%eax
 20d:	5b                   	pop    %ebx
 20e:	5e                   	pop    %esi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
 211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 218:	be ff ff ff ff       	mov    $0xffffffff,%esi
 21d:	eb e9                	jmp    208 <stat+0x38>
 21f:	90                   	nop

00000220 <atoi>:

int
atoi(const char *s)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 22b:	0f be 02             	movsbl (%edx),%eax
 22e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 231:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 234:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 239:	77 1a                	ja     255 <atoi+0x35>
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop
    n = n*10 + *s++ - '0';
 240:	83 c2 01             	add    $0x1,%edx
 243:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 246:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 24a:	0f be 02             	movsbl (%edx),%eax
 24d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 250:	80 fb 09             	cmp    $0x9,%bl
 253:	76 eb                	jbe    240 <atoi+0x20>
  return n;
}
 255:	89 c8                	mov    %ecx,%eax
 257:	5b                   	pop    %ebx
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	8b 45 10             	mov    0x10(%ebp),%eax
 26b:	8b 55 08             	mov    0x8(%ebp),%edx
 26e:	56                   	push   %esi
 26f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 272:	85 c0                	test   %eax,%eax
 274:	7e 0f                	jle    285 <memmove+0x25>
 276:	01 d0                	add    %edx,%eax
  dst = vdst;
 278:	89 d7                	mov    %edx,%edi
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 280:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 281:	39 f8                	cmp    %edi,%eax
 283:	75 fb                	jne    280 <memmove+0x20>
  return vdst;
}
 285:	5e                   	pop    %esi
 286:	89 d0                	mov    %edx,%eax
 288:	5f                   	pop    %edi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret    
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop

00000290 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 29a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 29d:	50                   	push   %eax
 29e:	e8 f2 02 00 00       	call   595 <join>
  
  return x;
}
 2a3:	c9                   	leave  
 2a4:	c3                   	ret    
 2a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <lock_init>:

void lock_init(struct lock_t *lk){
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2c0:	5d                   	pop    %ebp
 2c1:	c3                   	ret    
 2c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2d5:	b9 01 00 00 00       	mov    $0x1,%ecx
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	8b 55 08             	mov    0x8(%ebp),%edx
 2df:	90                   	nop
 2e0:	89 c8                	mov    %ecx,%eax
 2e2:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 2e5:	85 c0                	test   %eax,%eax
 2e7:	75 f7                	jne    2e0 <lock_acquire+0x10>
}
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop

000002f0 <lock_release>:
void lock_release(struct lock_t *lk){
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	31 c0                	xor    %eax,%eax
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	8b 55 08             	mov    0x8(%ebp),%edx
 2fc:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 315:	a1 68 0b 00 00       	mov    0xb68,%eax
{
 31a:	89 e5                	mov    %esp,%ebp
 31c:	57                   	push   %edi
 31d:	56                   	push   %esi
 31e:	53                   	push   %ebx
 31f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 322:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 324:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 327:	39 c8                	cmp    %ecx,%eax
 329:	73 15                	jae    340 <free+0x30>
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop
 330:	39 d1                	cmp    %edx,%ecx
 332:	72 14                	jb     348 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 334:	39 d0                	cmp    %edx,%eax
 336:	73 10                	jae    348 <free+0x38>
{
 338:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 33a:	8b 10                	mov    (%eax),%edx
 33c:	39 c8                	cmp    %ecx,%eax
 33e:	72 f0                	jb     330 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 340:	39 d0                	cmp    %edx,%eax
 342:	72 f4                	jb     338 <free+0x28>
 344:	39 d1                	cmp    %edx,%ecx
 346:	73 f0                	jae    338 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 348:	8b 73 fc             	mov    -0x4(%ebx),%esi
 34b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 34e:	39 fa                	cmp    %edi,%edx
 350:	74 1e                	je     370 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 352:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 355:	8b 50 04             	mov    0x4(%eax),%edx
 358:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 35b:	39 f1                	cmp    %esi,%ecx
 35d:	74 28                	je     387 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 35f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 361:	5b                   	pop    %ebx
  freep = p;
 362:	a3 68 0b 00 00       	mov    %eax,0xb68
}
 367:	5e                   	pop    %esi
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 370:	03 72 04             	add    0x4(%edx),%esi
 373:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 376:	8b 10                	mov    (%eax),%edx
 378:	8b 12                	mov    (%edx),%edx
 37a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 37d:	8b 50 04             	mov    0x4(%eax),%edx
 380:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 383:	39 f1                	cmp    %esi,%ecx
 385:	75 d8                	jne    35f <free+0x4f>
    p->s.size += bp->s.size;
 387:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 38a:	a3 68 0b 00 00       	mov    %eax,0xb68
    p->s.size += bp->s.size;
 38f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 392:	8b 53 f8             	mov    -0x8(%ebx),%edx
 395:	89 10                	mov    %edx,(%eax)
}
 397:	5b                   	pop    %ebx
 398:	5e                   	pop    %esi
 399:	5f                   	pop    %edi
 39a:	5d                   	pop    %ebp
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	56                   	push   %esi
 3a9:	53                   	push   %ebx
 3aa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 3b0:	8b 3d 68 0b 00 00    	mov    0xb68,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 3b6:	8d 70 07             	lea    0x7(%eax),%esi
 3b9:	c1 ee 03             	shr    $0x3,%esi
 3bc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 3bf:	85 ff                	test   %edi,%edi
 3c1:	0f 84 a9 00 00 00    	je     470 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3c7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 3c9:	8b 48 04             	mov    0x4(%eax),%ecx
 3cc:	39 f1                	cmp    %esi,%ecx
 3ce:	73 6d                	jae    43d <malloc+0x9d>
 3d0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 3d6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 3db:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 3de:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 3e5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 3e8:	eb 17                	jmp    401 <malloc+0x61>
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 3f2:	8b 4a 04             	mov    0x4(%edx),%ecx
 3f5:	39 f1                	cmp    %esi,%ecx
 3f7:	73 4f                	jae    448 <malloc+0xa8>
 3f9:	8b 3d 68 0b 00 00    	mov    0xb68,%edi
 3ff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 401:	39 c7                	cmp    %eax,%edi
 403:	75 eb                	jne    3f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 405:	83 ec 0c             	sub    $0xc,%esp
 408:	ff 75 e4             	pushl  -0x1c(%ebp)
 40b:	e8 65 01 00 00       	call   575 <sbrk>
  if(p == (char*)-1)
 410:	83 c4 10             	add    $0x10,%esp
 413:	83 f8 ff             	cmp    $0xffffffff,%eax
 416:	74 1b                	je     433 <malloc+0x93>
  hp->s.size = nu;
 418:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 41b:	83 ec 0c             	sub    $0xc,%esp
 41e:	83 c0 08             	add    $0x8,%eax
 421:	50                   	push   %eax
 422:	e8 e9 fe ff ff       	call   310 <free>
  return freep;
 427:	a1 68 0b 00 00       	mov    0xb68,%eax
      if((p = morecore(nunits)) == 0)
 42c:	83 c4 10             	add    $0x10,%esp
 42f:	85 c0                	test   %eax,%eax
 431:	75 bd                	jne    3f0 <malloc+0x50>
        return 0;
  }
}
 433:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 436:	31 c0                	xor    %eax,%eax
}
 438:	5b                   	pop    %ebx
 439:	5e                   	pop    %esi
 43a:	5f                   	pop    %edi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
    if(p->s.size >= nunits){
 43d:	89 c2                	mov    %eax,%edx
 43f:	89 f8                	mov    %edi,%eax
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 448:	39 ce                	cmp    %ecx,%esi
 44a:	74 54                	je     4a0 <malloc+0x100>
        p->s.size -= nunits;
 44c:	29 f1                	sub    %esi,%ecx
 44e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 451:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 454:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 457:	a3 68 0b 00 00       	mov    %eax,0xb68
}
 45c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 45f:	8d 42 08             	lea    0x8(%edx),%eax
}
 462:	5b                   	pop    %ebx
 463:	5e                   	pop    %esi
 464:	5f                   	pop    %edi
 465:	5d                   	pop    %ebp
 466:	c3                   	ret    
 467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 470:	c7 05 68 0b 00 00 6c 	movl   $0xb6c,0xb68
 477:	0b 00 00 
    base.s.size = 0;
 47a:	bf 6c 0b 00 00       	mov    $0xb6c,%edi
    base.s.ptr = freep = prevp = &base;
 47f:	c7 05 6c 0b 00 00 6c 	movl   $0xb6c,0xb6c
 486:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 489:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 48b:	c7 05 70 0b 00 00 00 	movl   $0x0,0xb70
 492:	00 00 00 
    if(p->s.size >= nunits){
 495:	e9 36 ff ff ff       	jmp    3d0 <malloc+0x30>
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 4a0:	8b 0a                	mov    (%edx),%ecx
 4a2:	89 08                	mov    %ecx,(%eax)
 4a4:	eb b1                	jmp    457 <malloc+0xb7>
 4a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi

000004b0 <thread_create>:
{
 4b0:	f3 0f 1e fb          	endbr32 
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 4ba:	68 00 10 00 00       	push   $0x1000
 4bf:	e8 dc fe ff ff       	call   3a0 <malloc>
return clone(start_routine,arg1,arg2,stack);
 4c4:	50                   	push   %eax
 4c5:	ff 75 10             	pushl  0x10(%ebp)
 4c8:	ff 75 0c             	pushl  0xc(%ebp)
 4cb:	ff 75 08             	pushl  0x8(%ebp)
 4ce:	e8 ba 00 00 00       	call   58d <clone>
}
 4d3:	c9                   	leave  
 4d4:	c3                   	ret    

000004d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4d5:	b8 01 00 00 00       	mov    $0x1,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <exit>:
SYSCALL(exit)
 4dd:	b8 02 00 00 00       	mov    $0x2,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <wait>:
SYSCALL(wait)
 4e5:	b8 03 00 00 00       	mov    $0x3,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <pipe>:
SYSCALL(pipe)
 4ed:	b8 04 00 00 00       	mov    $0x4,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <read>:
SYSCALL(read)
 4f5:	b8 05 00 00 00       	mov    $0x5,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <write>:
SYSCALL(write)
 4fd:	b8 10 00 00 00       	mov    $0x10,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <close>:
SYSCALL(close)
 505:	b8 15 00 00 00       	mov    $0x15,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <kill>:
SYSCALL(kill)
 50d:	b8 06 00 00 00       	mov    $0x6,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <exec>:
SYSCALL(exec)
 515:	b8 07 00 00 00       	mov    $0x7,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <open>:
SYSCALL(open)
 51d:	b8 0f 00 00 00       	mov    $0xf,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <mknod>:
SYSCALL(mknod)
 525:	b8 11 00 00 00       	mov    $0x11,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <unlink>:
SYSCALL(unlink)
 52d:	b8 12 00 00 00       	mov    $0x12,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <fstat>:
SYSCALL(fstat)
 535:	b8 08 00 00 00       	mov    $0x8,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <link>:
SYSCALL(link)
 53d:	b8 13 00 00 00       	mov    $0x13,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <mkdir>:
SYSCALL(mkdir)
 545:	b8 14 00 00 00       	mov    $0x14,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <chdir>:
SYSCALL(chdir)
 54d:	b8 09 00 00 00       	mov    $0x9,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <dup>:
SYSCALL(dup)
 555:	b8 0a 00 00 00       	mov    $0xa,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <getpid>:
SYSCALL(getpid)
 55d:	b8 0b 00 00 00       	mov    $0xb,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <getyear>:
SYSCALL(getyear)
 565:	b8 16 00 00 00       	mov    $0x16,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <getreadcount>:
SYSCALL(getreadcount)
 56d:	b8 17 00 00 00       	mov    $0x17,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <sbrk>:
SYSCALL(sbrk)
 575:	b8 0c 00 00 00       	mov    $0xc,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <sleep>:
SYSCALL(sleep)
 57d:	b8 0d 00 00 00       	mov    $0xd,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <uptime>:
SYSCALL(uptime)
 585:	b8 0e 00 00 00       	mov    $0xe,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <clone>:
SYSCALL(clone)
 58d:	b8 18 00 00 00       	mov    $0x18,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <join>:
SYSCALL(join)
 595:	b8 19 00 00 00       	mov    $0x19,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    
 59d:	66 90                	xchg   %ax,%ax
 59f:	90                   	nop

000005a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 3c             	sub    $0x3c,%esp
 5a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ac:	89 d1                	mov    %edx,%ecx
{
 5ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5b1:	85 d2                	test   %edx,%edx
 5b3:	0f 89 7f 00 00 00    	jns    638 <printint+0x98>
 5b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5bd:	74 79                	je     638 <printint+0x98>
    neg = 1;
 5bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5c8:	31 db                	xor    %ebx,%ebx
 5ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5d0:	89 c8                	mov    %ecx,%eax
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	89 cf                	mov    %ecx,%edi
 5d6:	f7 75 c4             	divl   -0x3c(%ebp)
 5d9:	0f b6 92 20 08 00 00 	movzbl 0x820(%edx),%edx
 5e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5e3:	89 d8                	mov    %ebx,%eax
 5e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5f1:	76 dd                	jbe    5d0 <printint+0x30>
  if(neg)
 5f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5f6:	85 c9                	test   %ecx,%ecx
 5f8:	74 0c                	je     606 <printint+0x66>
    buf[i++] = '-';
 5fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 601:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 606:	8b 7d b8             	mov    -0x48(%ebp),%edi
 609:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 60d:	eb 07                	jmp    616 <printint+0x76>
 60f:	90                   	nop
 610:	0f b6 13             	movzbl (%ebx),%edx
 613:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 616:	83 ec 04             	sub    $0x4,%esp
 619:	88 55 d7             	mov    %dl,-0x29(%ebp)
 61c:	6a 01                	push   $0x1
 61e:	56                   	push   %esi
 61f:	57                   	push   %edi
 620:	e8 d8 fe ff ff       	call   4fd <write>
  while(--i >= 0)
 625:	83 c4 10             	add    $0x10,%esp
 628:	39 de                	cmp    %ebx,%esi
 62a:	75 e4                	jne    610 <printint+0x70>
    putc(fd, buf[i]);
}
 62c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62f:	5b                   	pop    %ebx
 630:	5e                   	pop    %esi
 631:	5f                   	pop    %edi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 638:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 63f:	eb 87                	jmp    5c8 <printint+0x28>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 650:	f3 0f 1e fb          	endbr32 
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	57                   	push   %edi
 658:	56                   	push   %esi
 659:	53                   	push   %ebx
 65a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 65d:	8b 75 0c             	mov    0xc(%ebp),%esi
 660:	0f b6 1e             	movzbl (%esi),%ebx
 663:	84 db                	test   %bl,%bl
 665:	0f 84 b4 00 00 00    	je     71f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 66b:	8d 45 10             	lea    0x10(%ebp),%eax
 66e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 671:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 674:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 676:	89 45 d0             	mov    %eax,-0x30(%ebp)
 679:	eb 33                	jmp    6ae <printf+0x5e>
 67b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
 680:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 683:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	74 17                	je     6a4 <printf+0x54>
  write(fd, &c, 1);
 68d:	83 ec 04             	sub    $0x4,%esp
 690:	88 5d e7             	mov    %bl,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	ff 75 08             	pushl  0x8(%ebp)
 699:	e8 5f fe ff ff       	call   4fd <write>
 69e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6a1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6a4:	0f b6 1e             	movzbl (%esi),%ebx
 6a7:	83 c6 01             	add    $0x1,%esi
 6aa:	84 db                	test   %bl,%bl
 6ac:	74 71                	je     71f <printf+0xcf>
    c = fmt[i] & 0xff;
 6ae:	0f be cb             	movsbl %bl,%ecx
 6b1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6b4:	85 d2                	test   %edx,%edx
 6b6:	74 c8                	je     680 <printf+0x30>
      }
    } else if(state == '%'){
 6b8:	83 fa 25             	cmp    $0x25,%edx
 6bb:	75 e7                	jne    6a4 <printf+0x54>
      if(c == 'd'){
 6bd:	83 f8 64             	cmp    $0x64,%eax
 6c0:	0f 84 9a 00 00 00    	je     760 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6c6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6cc:	83 f9 70             	cmp    $0x70,%ecx
 6cf:	74 5f                	je     730 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6d1:	83 f8 73             	cmp    $0x73,%eax
 6d4:	0f 84 d6 00 00 00    	je     7b0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6da:	83 f8 63             	cmp    $0x63,%eax
 6dd:	0f 84 8d 00 00 00    	je     770 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6e3:	83 f8 25             	cmp    $0x25,%eax
 6e6:	0f 84 b4 00 00 00    	je     7a0 <printf+0x150>
  write(fd, &c, 1);
 6ec:	83 ec 04             	sub    $0x4,%esp
 6ef:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6f3:	6a 01                	push   $0x1
 6f5:	57                   	push   %edi
 6f6:	ff 75 08             	pushl  0x8(%ebp)
 6f9:	e8 ff fd ff ff       	call   4fd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6fe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 701:	83 c4 0c             	add    $0xc,%esp
 704:	6a 01                	push   $0x1
 706:	83 c6 01             	add    $0x1,%esi
 709:	57                   	push   %edi
 70a:	ff 75 08             	pushl  0x8(%ebp)
 70d:	e8 eb fd ff ff       	call   4fd <write>
  for(i = 0; fmt[i]; i++){
 712:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 716:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 719:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 71b:	84 db                	test   %bl,%bl
 71d:	75 8f                	jne    6ae <printf+0x5e>
    }
  }
}
 71f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 722:	5b                   	pop    %ebx
 723:	5e                   	pop    %esi
 724:	5f                   	pop    %edi
 725:	5d                   	pop    %ebp
 726:	c3                   	ret    
 727:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 10 00 00 00       	mov    $0x10,%ecx
 738:	6a 00                	push   $0x0
 73a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	8b 13                	mov    (%ebx),%edx
 742:	e8 59 fe ff ff       	call   5a0 <printint>
        ap++;
 747:	89 d8                	mov    %ebx,%eax
 749:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74c:	31 d2                	xor    %edx,%edx
        ap++;
 74e:	83 c0 04             	add    $0x4,%eax
 751:	89 45 d0             	mov    %eax,-0x30(%ebp)
 754:	e9 4b ff ff ff       	jmp    6a4 <printf+0x54>
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 0a 00 00 00       	mov    $0xa,%ecx
 768:	6a 01                	push   $0x1
 76a:	eb ce                	jmp    73a <printf+0xea>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 770:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 773:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 776:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 778:	6a 01                	push   $0x1
        ap++;
 77a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 77d:	57                   	push   %edi
 77e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 781:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 784:	e8 74 fd ff ff       	call   4fd <write>
        ap++;
 789:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 78c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78f:	31 d2                	xor    %edx,%edx
 791:	e9 0e ff ff ff       	jmp    6a4 <printf+0x54>
 796:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7a3:	83 ec 04             	sub    $0x4,%esp
 7a6:	e9 59 ff ff ff       	jmp    704 <printf+0xb4>
 7ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
        s = (char*)*ap;
 7b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7b5:	83 c0 04             	add    $0x4,%eax
 7b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7bb:	85 db                	test   %ebx,%ebx
 7bd:	74 17                	je     7d6 <printf+0x186>
        while(*s != 0){
 7bf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7c2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7c4:	84 c0                	test   %al,%al
 7c6:	0f 84 d8 fe ff ff    	je     6a4 <printf+0x54>
 7cc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7cf:	89 de                	mov    %ebx,%esi
 7d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7d4:	eb 1a                	jmp    7f0 <printf+0x1a0>
          s = "(null)";
 7d6:	bb 18 08 00 00       	mov    $0x818,%ebx
        while(*s != 0){
 7db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7de:	b8 28 00 00 00       	mov    $0x28,%eax
 7e3:	89 de                	mov    %ebx,%esi
 7e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop
  write(fd, &c, 1);
 7f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7f3:	83 c6 01             	add    $0x1,%esi
 7f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7f9:	6a 01                	push   $0x1
 7fb:	57                   	push   %edi
 7fc:	53                   	push   %ebx
 7fd:	e8 fb fc ff ff       	call   4fd <write>
        while(*s != 0){
 802:	0f b6 06             	movzbl (%esi),%eax
 805:	83 c4 10             	add    $0x10,%esp
 808:	84 c0                	test   %al,%al
 80a:	75 e4                	jne    7f0 <printf+0x1a0>
 80c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 80f:	31 d2                	xor    %edx,%edx
 811:	e9 8e fe ff ff       	jmp    6a4 <printf+0x54>
