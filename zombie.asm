
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
  15:	e8 5b 04 00 00       	call   475 <fork>
  1a:	85 c0                	test   %eax,%eax
  1c:	7e 0d                	jle    2b <main+0x2b>
    sleep(5);  // Let child exit before parent.
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	6a 05                	push   $0x5
  23:	e8 f5 04 00 00       	call   51d <sleep>
  28:	83 c4 10             	add    $0x10,%esp
  exit();
  2b:	e8 4d 04 00 00       	call   47d <exit>

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

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
 17b:	e8 15 03 00 00       	call   495 <read>
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
 1e1:	e8 d7 02 00 00       	call   4bd <open>
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
 1f6:	e8 da 02 00 00       	call   4d5 <fstat>
  close(fd);
 1fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1fe:	89 c6                	mov    %eax,%esi
  close(fd);
 200:	e8 a0 02 00 00       	call   4a5 <close>
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
 29e:	e8 92 02 00 00       	call   535 <join>
  
  return x;
}
 2a3:	c9                   	leave  
 2a4:	c3                   	ret    
 2a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2b5:	a1 a8 0a 00 00       	mov    0xaa8,%eax
{
 2ba:	89 e5                	mov    %esp,%ebp
 2bc:	57                   	push   %edi
 2bd:	56                   	push   %esi
 2be:	53                   	push   %ebx
 2bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2c2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 2c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2c7:	39 c8                	cmp    %ecx,%eax
 2c9:	73 15                	jae    2e0 <free+0x30>
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop
 2d0:	39 d1                	cmp    %edx,%ecx
 2d2:	72 14                	jb     2e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 2d4:	39 d0                	cmp    %edx,%eax
 2d6:	73 10                	jae    2e8 <free+0x38>
{
 2d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2da:	8b 10                	mov    (%eax),%edx
 2dc:	39 c8                	cmp    %ecx,%eax
 2de:	72 f0                	jb     2d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 2e0:	39 d0                	cmp    %edx,%eax
 2e2:	72 f4                	jb     2d8 <free+0x28>
 2e4:	39 d1                	cmp    %edx,%ecx
 2e6:	73 f0                	jae    2d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 2e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 2eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 2ee:	39 fa                	cmp    %edi,%edx
 2f0:	74 1e                	je     310 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 2f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 2f5:	8b 50 04             	mov    0x4(%eax),%edx
 2f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 2fb:	39 f1                	cmp    %esi,%ecx
 2fd:	74 28                	je     327 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 2ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 301:	5b                   	pop    %ebx
  freep = p;
 302:	a3 a8 0a 00 00       	mov    %eax,0xaa8
}
 307:	5e                   	pop    %esi
 308:	5f                   	pop    %edi
 309:	5d                   	pop    %ebp
 30a:	c3                   	ret    
 30b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 310:	03 72 04             	add    0x4(%edx),%esi
 313:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 316:	8b 10                	mov    (%eax),%edx
 318:	8b 12                	mov    (%edx),%edx
 31a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 31d:	8b 50 04             	mov    0x4(%eax),%edx
 320:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 323:	39 f1                	cmp    %esi,%ecx
 325:	75 d8                	jne    2ff <free+0x4f>
    p->s.size += bp->s.size;
 327:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 32a:	a3 a8 0a 00 00       	mov    %eax,0xaa8
    p->s.size += bp->s.size;
 32f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 332:	8b 53 f8             	mov    -0x8(%ebx),%edx
 335:	89 10                	mov    %edx,(%eax)
}
 337:	5b                   	pop    %ebx
 338:	5e                   	pop    %esi
 339:	5f                   	pop    %edi
 33a:	5d                   	pop    %ebp
 33b:	c3                   	ret    
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	56                   	push   %esi
 349:	53                   	push   %ebx
 34a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 350:	8b 3d a8 0a 00 00    	mov    0xaa8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 356:	8d 70 07             	lea    0x7(%eax),%esi
 359:	c1 ee 03             	shr    $0x3,%esi
 35c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 35f:	85 ff                	test   %edi,%edi
 361:	0f 84 a9 00 00 00    	je     410 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 367:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 369:	8b 48 04             	mov    0x4(%eax),%ecx
 36c:	39 f1                	cmp    %esi,%ecx
 36e:	73 6d                	jae    3dd <malloc+0x9d>
 370:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 376:	bb 00 10 00 00       	mov    $0x1000,%ebx
 37b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 37e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 385:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 388:	eb 17                	jmp    3a1 <malloc+0x61>
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 390:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 392:	8b 4a 04             	mov    0x4(%edx),%ecx
 395:	39 f1                	cmp    %esi,%ecx
 397:	73 4f                	jae    3e8 <malloc+0xa8>
 399:	8b 3d a8 0a 00 00    	mov    0xaa8,%edi
 39f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 3a1:	39 c7                	cmp    %eax,%edi
 3a3:	75 eb                	jne    390 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 3a5:	83 ec 0c             	sub    $0xc,%esp
 3a8:	ff 75 e4             	pushl  -0x1c(%ebp)
 3ab:	e8 65 01 00 00       	call   515 <sbrk>
  if(p == (char*)-1)
 3b0:	83 c4 10             	add    $0x10,%esp
 3b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 3b6:	74 1b                	je     3d3 <malloc+0x93>
  hp->s.size = nu;
 3b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 3bb:	83 ec 0c             	sub    $0xc,%esp
 3be:	83 c0 08             	add    $0x8,%eax
 3c1:	50                   	push   %eax
 3c2:	e8 e9 fe ff ff       	call   2b0 <free>
  return freep;
 3c7:	a1 a8 0a 00 00       	mov    0xaa8,%eax
      if((p = morecore(nunits)) == 0)
 3cc:	83 c4 10             	add    $0x10,%esp
 3cf:	85 c0                	test   %eax,%eax
 3d1:	75 bd                	jne    390 <malloc+0x50>
        return 0;
  }
}
 3d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 3d6:	31 c0                	xor    %eax,%eax
}
 3d8:	5b                   	pop    %ebx
 3d9:	5e                   	pop    %esi
 3da:	5f                   	pop    %edi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
    if(p->s.size >= nunits){
 3dd:	89 c2                	mov    %eax,%edx
 3df:	89 f8                	mov    %edi,%eax
 3e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 3e8:	39 ce                	cmp    %ecx,%esi
 3ea:	74 54                	je     440 <malloc+0x100>
        p->s.size -= nunits;
 3ec:	29 f1                	sub    %esi,%ecx
 3ee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 3f1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 3f4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 3f7:	a3 a8 0a 00 00       	mov    %eax,0xaa8
}
 3fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 3ff:	8d 42 08             	lea    0x8(%edx),%eax
}
 402:	5b                   	pop    %ebx
 403:	5e                   	pop    %esi
 404:	5f                   	pop    %edi
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    
 407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 410:	c7 05 a8 0a 00 00 ac 	movl   $0xaac,0xaa8
 417:	0a 00 00 
    base.s.size = 0;
 41a:	bf ac 0a 00 00       	mov    $0xaac,%edi
    base.s.ptr = freep = prevp = &base;
 41f:	c7 05 ac 0a 00 00 ac 	movl   $0xaac,0xaac
 426:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 429:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 42b:	c7 05 b0 0a 00 00 00 	movl   $0x0,0xab0
 432:	00 00 00 
    if(p->s.size >= nunits){
 435:	e9 36 ff ff ff       	jmp    370 <malloc+0x30>
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 440:	8b 0a                	mov    (%edx),%ecx
 442:	89 08                	mov    %ecx,(%eax)
 444:	eb b1                	jmp    3f7 <malloc+0xb7>
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi

00000450 <thread_create>:
{
 450:	f3 0f 1e fb          	endbr32 
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 45a:	68 00 10 00 00       	push   $0x1000
 45f:	e8 dc fe ff ff       	call   340 <malloc>
return clone(start_routine,arg1,arg2,stack);
 464:	50                   	push   %eax
 465:	ff 75 10             	pushl  0x10(%ebp)
 468:	ff 75 0c             	pushl  0xc(%ebp)
 46b:	ff 75 08             	pushl  0x8(%ebp)
 46e:	e8 ba 00 00 00       	call   52d <clone>
}
 473:	c9                   	leave  
 474:	c3                   	ret    

00000475 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 475:	b8 01 00 00 00       	mov    $0x1,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <exit>:
SYSCALL(exit)
 47d:	b8 02 00 00 00       	mov    $0x2,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <wait>:
SYSCALL(wait)
 485:	b8 03 00 00 00       	mov    $0x3,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <pipe>:
SYSCALL(pipe)
 48d:	b8 04 00 00 00       	mov    $0x4,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <read>:
SYSCALL(read)
 495:	b8 05 00 00 00       	mov    $0x5,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <write>:
SYSCALL(write)
 49d:	b8 10 00 00 00       	mov    $0x10,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <close>:
SYSCALL(close)
 4a5:	b8 15 00 00 00       	mov    $0x15,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <kill>:
SYSCALL(kill)
 4ad:	b8 06 00 00 00       	mov    $0x6,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <exec>:
SYSCALL(exec)
 4b5:	b8 07 00 00 00       	mov    $0x7,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <open>:
SYSCALL(open)
 4bd:	b8 0f 00 00 00       	mov    $0xf,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <mknod>:
SYSCALL(mknod)
 4c5:	b8 11 00 00 00       	mov    $0x11,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <unlink>:
SYSCALL(unlink)
 4cd:	b8 12 00 00 00       	mov    $0x12,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <fstat>:
SYSCALL(fstat)
 4d5:	b8 08 00 00 00       	mov    $0x8,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <link>:
SYSCALL(link)
 4dd:	b8 13 00 00 00       	mov    $0x13,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <mkdir>:
SYSCALL(mkdir)
 4e5:	b8 14 00 00 00       	mov    $0x14,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <chdir>:
SYSCALL(chdir)
 4ed:	b8 09 00 00 00       	mov    $0x9,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <dup>:
SYSCALL(dup)
 4f5:	b8 0a 00 00 00       	mov    $0xa,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <getpid>:
SYSCALL(getpid)
 4fd:	b8 0b 00 00 00       	mov    $0xb,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <getyear>:
SYSCALL(getyear)
 505:	b8 16 00 00 00       	mov    $0x16,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <getreadcount>:
SYSCALL(getreadcount)
 50d:	b8 17 00 00 00       	mov    $0x17,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <sbrk>:
SYSCALL(sbrk)
 515:	b8 0c 00 00 00       	mov    $0xc,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <sleep>:
SYSCALL(sleep)
 51d:	b8 0d 00 00 00       	mov    $0xd,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <uptime>:
SYSCALL(uptime)
 525:	b8 0e 00 00 00       	mov    $0xe,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <clone>:
SYSCALL(clone)
 52d:	b8 18 00 00 00       	mov    $0x18,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <join>:
SYSCALL(join)
 535:	b8 19 00 00 00       	mov    $0x19,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    
 53d:	66 90                	xchg   %ax,%ax
 53f:	90                   	nop

00000540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 3c             	sub    $0x3c,%esp
 549:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 54c:	89 d1                	mov    %edx,%ecx
{
 54e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 551:	85 d2                	test   %edx,%edx
 553:	0f 89 7f 00 00 00    	jns    5d8 <printint+0x98>
 559:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 55d:	74 79                	je     5d8 <printint+0x98>
    neg = 1;
 55f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 566:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 568:	31 db                	xor    %ebx,%ebx
 56a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 570:	89 c8                	mov    %ecx,%eax
 572:	31 d2                	xor    %edx,%edx
 574:	89 cf                	mov    %ecx,%edi
 576:	f7 75 c4             	divl   -0x3c(%ebp)
 579:	0f b6 92 c0 07 00 00 	movzbl 0x7c0(%edx),%edx
 580:	89 45 c0             	mov    %eax,-0x40(%ebp)
 583:	89 d8                	mov    %ebx,%eax
 585:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 588:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 58b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 58e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 591:	76 dd                	jbe    570 <printint+0x30>
  if(neg)
 593:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 596:	85 c9                	test   %ecx,%ecx
 598:	74 0c                	je     5a6 <printint+0x66>
    buf[i++] = '-';
 59a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 59f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5ad:	eb 07                	jmp    5b6 <printint+0x76>
 5af:	90                   	nop
 5b0:	0f b6 13             	movzbl (%ebx),%edx
 5b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5b6:	83 ec 04             	sub    $0x4,%esp
 5b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5bc:	6a 01                	push   $0x1
 5be:	56                   	push   %esi
 5bf:	57                   	push   %edi
 5c0:	e8 d8 fe ff ff       	call   49d <write>
  while(--i >= 0)
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	39 de                	cmp    %ebx,%esi
 5ca:	75 e4                	jne    5b0 <printint+0x70>
    putc(fd, buf[i]);
}
 5cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cf:	5b                   	pop    %ebx
 5d0:	5e                   	pop    %esi
 5d1:	5f                   	pop    %edi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5df:	eb 87                	jmp    568 <printint+0x28>
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop

000005f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f0:	f3 0f 1e fb          	endbr32 
 5f4:	55                   	push   %ebp
 5f5:	89 e5                	mov    %esp,%ebp
 5f7:	57                   	push   %edi
 5f8:	56                   	push   %esi
 5f9:	53                   	push   %ebx
 5fa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5fd:	8b 75 0c             	mov    0xc(%ebp),%esi
 600:	0f b6 1e             	movzbl (%esi),%ebx
 603:	84 db                	test   %bl,%bl
 605:	0f 84 b4 00 00 00    	je     6bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 60b:	8d 45 10             	lea    0x10(%ebp),%eax
 60e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 611:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 614:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 616:	89 45 d0             	mov    %eax,-0x30(%ebp)
 619:	eb 33                	jmp    64e <printf+0x5e>
 61b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop
 620:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 623:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	74 17                	je     644 <printf+0x54>
  write(fd, &c, 1);
 62d:	83 ec 04             	sub    $0x4,%esp
 630:	88 5d e7             	mov    %bl,-0x19(%ebp)
 633:	6a 01                	push   $0x1
 635:	57                   	push   %edi
 636:	ff 75 08             	pushl  0x8(%ebp)
 639:	e8 5f fe ff ff       	call   49d <write>
 63e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 641:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 644:	0f b6 1e             	movzbl (%esi),%ebx
 647:	83 c6 01             	add    $0x1,%esi
 64a:	84 db                	test   %bl,%bl
 64c:	74 71                	je     6bf <printf+0xcf>
    c = fmt[i] & 0xff;
 64e:	0f be cb             	movsbl %bl,%ecx
 651:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 654:	85 d2                	test   %edx,%edx
 656:	74 c8                	je     620 <printf+0x30>
      }
    } else if(state == '%'){
 658:	83 fa 25             	cmp    $0x25,%edx
 65b:	75 e7                	jne    644 <printf+0x54>
      if(c == 'd'){
 65d:	83 f8 64             	cmp    $0x64,%eax
 660:	0f 84 9a 00 00 00    	je     700 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 666:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 66c:	83 f9 70             	cmp    $0x70,%ecx
 66f:	74 5f                	je     6d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 671:	83 f8 73             	cmp    $0x73,%eax
 674:	0f 84 d6 00 00 00    	je     750 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67a:	83 f8 63             	cmp    $0x63,%eax
 67d:	0f 84 8d 00 00 00    	je     710 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 683:	83 f8 25             	cmp    $0x25,%eax
 686:	0f 84 b4 00 00 00    	je     740 <printf+0x150>
  write(fd, &c, 1);
 68c:	83 ec 04             	sub    $0x4,%esp
 68f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	ff 75 08             	pushl  0x8(%ebp)
 699:	e8 ff fd ff ff       	call   49d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 69e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6a1:	83 c4 0c             	add    $0xc,%esp
 6a4:	6a 01                	push   $0x1
 6a6:	83 c6 01             	add    $0x1,%esi
 6a9:	57                   	push   %edi
 6aa:	ff 75 08             	pushl  0x8(%ebp)
 6ad:	e8 eb fd ff ff       	call   49d <write>
  for(i = 0; fmt[i]; i++){
 6b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6bb:	84 db                	test   %bl,%bl
 6bd:	75 8f                	jne    64e <printf+0x5e>
    }
  }
}
 6bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c2:	5b                   	pop    %ebx
 6c3:	5e                   	pop    %esi
 6c4:	5f                   	pop    %edi
 6c5:	5d                   	pop    %ebp
 6c6:	c3                   	ret    
 6c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d8:	6a 00                	push   $0x0
 6da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	8b 13                	mov    (%ebx),%edx
 6e2:	e8 59 fe ff ff       	call   540 <printint>
        ap++;
 6e7:	89 d8                	mov    %ebx,%eax
 6e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ec:	31 d2                	xor    %edx,%edx
        ap++;
 6ee:	83 c0 04             	add    $0x4,%eax
 6f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f4:	e9 4b ff ff ff       	jmp    644 <printf+0x54>
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	eb ce                	jmp    6da <printf+0xea>
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 710:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 713:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 716:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
        ap++;
 71a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 71d:	57                   	push   %edi
 71e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 721:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 724:	e8 74 fd ff ff       	call   49d <write>
        ap++;
 729:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 72c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72f:	31 d2                	xor    %edx,%edx
 731:	e9 0e ff ff ff       	jmp    644 <printf+0x54>
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 740:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 743:	83 ec 04             	sub    $0x4,%esp
 746:	e9 59 ff ff ff       	jmp    6a4 <printf+0xb4>
 74b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop
        s = (char*)*ap;
 750:	8b 45 d0             	mov    -0x30(%ebp),%eax
 753:	8b 18                	mov    (%eax),%ebx
        ap++;
 755:	83 c0 04             	add    $0x4,%eax
 758:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 75b:	85 db                	test   %ebx,%ebx
 75d:	74 17                	je     776 <printf+0x186>
        while(*s != 0){
 75f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 762:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 764:	84 c0                	test   %al,%al
 766:	0f 84 d8 fe ff ff    	je     644 <printf+0x54>
 76c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 76f:	89 de                	mov    %ebx,%esi
 771:	8b 5d 08             	mov    0x8(%ebp),%ebx
 774:	eb 1a                	jmp    790 <printf+0x1a0>
          s = "(null)";
 776:	bb b8 07 00 00       	mov    $0x7b8,%ebx
        while(*s != 0){
 77b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 77e:	b8 28 00 00 00       	mov    $0x28,%eax
 783:	89 de                	mov    %ebx,%esi
 785:	8b 5d 08             	mov    0x8(%ebp),%ebx
 788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
          s++;
 793:	83 c6 01             	add    $0x1,%esi
 796:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 799:	6a 01                	push   $0x1
 79b:	57                   	push   %edi
 79c:	53                   	push   %ebx
 79d:	e8 fb fc ff ff       	call   49d <write>
        while(*s != 0){
 7a2:	0f b6 06             	movzbl (%esi),%eax
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	84 c0                	test   %al,%al
 7aa:	75 e4                	jne    790 <printf+0x1a0>
 7ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7af:	31 d2                	xor    %edx,%edx
 7b1:	e9 8e fe ff ff       	jmp    644 <printf+0x54>
