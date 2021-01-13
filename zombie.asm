
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
  15:	e8 3b 04 00 00       	call   455 <fork>
  1a:	85 c0                	test   %eax,%eax
  1c:	7e 0d                	jle    2b <main+0x2b>
    sleep(5);  // Let child exit before parent.
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	6a 05                	push   $0x5
  23:	e8 d5 04 00 00       	call   4fd <sleep>
  28:	83 c4 10             	add    $0x10,%esp
  exit();
  2b:	e8 2d 04 00 00       	call   45d <exit>

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
 17b:	e8 f5 02 00 00       	call   475 <read>
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
 1e1:	e8 b7 02 00 00       	call   49d <open>
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
 1f6:	e8 ba 02 00 00       	call   4b5 <fstat>
  close(fd);
 1fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1fe:	89 c6                	mov    %eax,%esi
  close(fd);
 200:	e8 80 02 00 00       	call   485 <close>
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

00000290 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 295:	a1 68 0a 00 00       	mov    0xa68,%eax
{
 29a:	89 e5                	mov    %esp,%ebp
 29c:	57                   	push   %edi
 29d:	56                   	push   %esi
 29e:	53                   	push   %ebx
 29f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2a2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 2a4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2a7:	39 c8                	cmp    %ecx,%eax
 2a9:	73 15                	jae    2c0 <free+0x30>
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop
 2b0:	39 d1                	cmp    %edx,%ecx
 2b2:	72 14                	jb     2c8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 2b4:	39 d0                	cmp    %edx,%eax
 2b6:	73 10                	jae    2c8 <free+0x38>
{
 2b8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2ba:	8b 10                	mov    (%eax),%edx
 2bc:	39 c8                	cmp    %ecx,%eax
 2be:	72 f0                	jb     2b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 2c0:	39 d0                	cmp    %edx,%eax
 2c2:	72 f4                	jb     2b8 <free+0x28>
 2c4:	39 d1                	cmp    %edx,%ecx
 2c6:	73 f0                	jae    2b8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 2c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 2cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 2ce:	39 fa                	cmp    %edi,%edx
 2d0:	74 1e                	je     2f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 2d2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 2d5:	8b 50 04             	mov    0x4(%eax),%edx
 2d8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 2db:	39 f1                	cmp    %esi,%ecx
 2dd:	74 28                	je     307 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 2df:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 2e1:	5b                   	pop    %ebx
  freep = p;
 2e2:	a3 68 0a 00 00       	mov    %eax,0xa68
}
 2e7:	5e                   	pop    %esi
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 2f0:	03 72 04             	add    0x4(%edx),%esi
 2f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 2f6:	8b 10                	mov    (%eax),%edx
 2f8:	8b 12                	mov    (%edx),%edx
 2fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 2fd:	8b 50 04             	mov    0x4(%eax),%edx
 300:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 303:	39 f1                	cmp    %esi,%ecx
 305:	75 d8                	jne    2df <free+0x4f>
    p->s.size += bp->s.size;
 307:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 30a:	a3 68 0a 00 00       	mov    %eax,0xa68
    p->s.size += bp->s.size;
 30f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 312:	8b 53 f8             	mov    -0x8(%ebx),%edx
 315:	89 10                	mov    %edx,(%eax)
}
 317:	5b                   	pop    %ebx
 318:	5e                   	pop    %esi
 319:	5f                   	pop    %edi
 31a:	5d                   	pop    %ebp
 31b:	c3                   	ret    
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000320 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	56                   	push   %esi
 329:	53                   	push   %ebx
 32a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 330:	8b 3d 68 0a 00 00    	mov    0xa68,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 336:	8d 70 07             	lea    0x7(%eax),%esi
 339:	c1 ee 03             	shr    $0x3,%esi
 33c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 33f:	85 ff                	test   %edi,%edi
 341:	0f 84 a9 00 00 00    	je     3f0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 347:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 349:	8b 48 04             	mov    0x4(%eax),%ecx
 34c:	39 f1                	cmp    %esi,%ecx
 34e:	73 6d                	jae    3bd <malloc+0x9d>
 350:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 356:	bb 00 10 00 00       	mov    $0x1000,%ebx
 35b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 35e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 365:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 368:	eb 17                	jmp    381 <malloc+0x61>
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 370:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 372:	8b 4a 04             	mov    0x4(%edx),%ecx
 375:	39 f1                	cmp    %esi,%ecx
 377:	73 4f                	jae    3c8 <malloc+0xa8>
 379:	8b 3d 68 0a 00 00    	mov    0xa68,%edi
 37f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 381:	39 c7                	cmp    %eax,%edi
 383:	75 eb                	jne    370 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 385:	83 ec 0c             	sub    $0xc,%esp
 388:	ff 75 e4             	pushl  -0x1c(%ebp)
 38b:	e8 65 01 00 00       	call   4f5 <sbrk>
  if(p == (char*)-1)
 390:	83 c4 10             	add    $0x10,%esp
 393:	83 f8 ff             	cmp    $0xffffffff,%eax
 396:	74 1b                	je     3b3 <malloc+0x93>
  hp->s.size = nu;
 398:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 39b:	83 ec 0c             	sub    $0xc,%esp
 39e:	83 c0 08             	add    $0x8,%eax
 3a1:	50                   	push   %eax
 3a2:	e8 e9 fe ff ff       	call   290 <free>
  return freep;
 3a7:	a1 68 0a 00 00       	mov    0xa68,%eax
      if((p = morecore(nunits)) == 0)
 3ac:	83 c4 10             	add    $0x10,%esp
 3af:	85 c0                	test   %eax,%eax
 3b1:	75 bd                	jne    370 <malloc+0x50>
        return 0;
  }
}
 3b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 3b6:	31 c0                	xor    %eax,%eax
}
 3b8:	5b                   	pop    %ebx
 3b9:	5e                   	pop    %esi
 3ba:	5f                   	pop    %edi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
    if(p->s.size >= nunits){
 3bd:	89 c2                	mov    %eax,%edx
 3bf:	89 f8                	mov    %edi,%eax
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 3c8:	39 ce                	cmp    %ecx,%esi
 3ca:	74 54                	je     420 <malloc+0x100>
        p->s.size -= nunits;
 3cc:	29 f1                	sub    %esi,%ecx
 3ce:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 3d1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 3d4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 3d7:	a3 68 0a 00 00       	mov    %eax,0xa68
}
 3dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 3df:	8d 42 08             	lea    0x8(%edx),%eax
}
 3e2:	5b                   	pop    %ebx
 3e3:	5e                   	pop    %esi
 3e4:	5f                   	pop    %edi
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 3f0:	c7 05 68 0a 00 00 6c 	movl   $0xa6c,0xa68
 3f7:	0a 00 00 
    base.s.size = 0;
 3fa:	bf 6c 0a 00 00       	mov    $0xa6c,%edi
    base.s.ptr = freep = prevp = &base;
 3ff:	c7 05 6c 0a 00 00 6c 	movl   $0xa6c,0xa6c
 406:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 409:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 40b:	c7 05 70 0a 00 00 00 	movl   $0x0,0xa70
 412:	00 00 00 
    if(p->s.size >= nunits){
 415:	e9 36 ff ff ff       	jmp    350 <malloc+0x30>
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 420:	8b 0a                	mov    (%edx),%ecx
 422:	89 08                	mov    %ecx,(%eax)
 424:	eb b1                	jmp    3d7 <malloc+0xb7>
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <thread_create>:
{
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 43a:	68 00 10 00 00       	push   $0x1000
 43f:	e8 dc fe ff ff       	call   320 <malloc>
return clone(start_routine,arg1,arg2,stack);
 444:	50                   	push   %eax
 445:	ff 75 10             	pushl  0x10(%ebp)
 448:	ff 75 0c             	pushl  0xc(%ebp)
 44b:	ff 75 08             	pushl  0x8(%ebp)
 44e:	e8 ba 00 00 00       	call   50d <clone>
}
 453:	c9                   	leave  
 454:	c3                   	ret    

00000455 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 455:	b8 01 00 00 00       	mov    $0x1,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <exit>:
SYSCALL(exit)
 45d:	b8 02 00 00 00       	mov    $0x2,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <wait>:
SYSCALL(wait)
 465:	b8 03 00 00 00       	mov    $0x3,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <pipe>:
SYSCALL(pipe)
 46d:	b8 04 00 00 00       	mov    $0x4,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <read>:
SYSCALL(read)
 475:	b8 05 00 00 00       	mov    $0x5,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <write>:
SYSCALL(write)
 47d:	b8 10 00 00 00       	mov    $0x10,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <close>:
SYSCALL(close)
 485:	b8 15 00 00 00       	mov    $0x15,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <kill>:
SYSCALL(kill)
 48d:	b8 06 00 00 00       	mov    $0x6,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <exec>:
SYSCALL(exec)
 495:	b8 07 00 00 00       	mov    $0x7,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <open>:
SYSCALL(open)
 49d:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <mknod>:
SYSCALL(mknod)
 4a5:	b8 11 00 00 00       	mov    $0x11,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <unlink>:
SYSCALL(unlink)
 4ad:	b8 12 00 00 00       	mov    $0x12,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <fstat>:
SYSCALL(fstat)
 4b5:	b8 08 00 00 00       	mov    $0x8,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <link>:
SYSCALL(link)
 4bd:	b8 13 00 00 00       	mov    $0x13,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <mkdir>:
SYSCALL(mkdir)
 4c5:	b8 14 00 00 00       	mov    $0x14,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <chdir>:
SYSCALL(chdir)
 4cd:	b8 09 00 00 00       	mov    $0x9,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <dup>:
SYSCALL(dup)
 4d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <getpid>:
SYSCALL(getpid)
 4dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <getyear>:
SYSCALL(getyear)
 4e5:	b8 16 00 00 00       	mov    $0x16,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <getreadcount>:
SYSCALL(getreadcount)
 4ed:	b8 17 00 00 00       	mov    $0x17,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <sbrk>:
SYSCALL(sbrk)
 4f5:	b8 0c 00 00 00       	mov    $0xc,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <sleep>:
SYSCALL(sleep)
 4fd:	b8 0d 00 00 00       	mov    $0xd,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <uptime>:
SYSCALL(uptime)
 505:	b8 0e 00 00 00       	mov    $0xe,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <clone>:
SYSCALL(clone)
 50d:	b8 18 00 00 00       	mov    $0x18,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    
 515:	66 90                	xchg   %ax,%ax
 517:	66 90                	xchg   %ax,%ax
 519:	66 90                	xchg   %ax,%ax
 51b:	66 90                	xchg   %ax,%ax
 51d:	66 90                	xchg   %ax,%ax
 51f:	90                   	nop

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 3c             	sub    $0x3c,%esp
 529:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 52c:	89 d1                	mov    %edx,%ecx
{
 52e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 531:	85 d2                	test   %edx,%edx
 533:	0f 89 7f 00 00 00    	jns    5b8 <printint+0x98>
 539:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 53d:	74 79                	je     5b8 <printint+0x98>
    neg = 1;
 53f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 546:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 548:	31 db                	xor    %ebx,%ebx
 54a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 550:	89 c8                	mov    %ecx,%eax
 552:	31 d2                	xor    %edx,%edx
 554:	89 cf                	mov    %ecx,%edi
 556:	f7 75 c4             	divl   -0x3c(%ebp)
 559:	0f b6 92 a0 07 00 00 	movzbl 0x7a0(%edx),%edx
 560:	89 45 c0             	mov    %eax,-0x40(%ebp)
 563:	89 d8                	mov    %ebx,%eax
 565:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 568:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 56b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 56e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 571:	76 dd                	jbe    550 <printint+0x30>
  if(neg)
 573:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 576:	85 c9                	test   %ecx,%ecx
 578:	74 0c                	je     586 <printint+0x66>
    buf[i++] = '-';
 57a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 57f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 581:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 586:	8b 7d b8             	mov    -0x48(%ebp),%edi
 589:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 58d:	eb 07                	jmp    596 <printint+0x76>
 58f:	90                   	nop
 590:	0f b6 13             	movzbl (%ebx),%edx
 593:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 596:	83 ec 04             	sub    $0x4,%esp
 599:	88 55 d7             	mov    %dl,-0x29(%ebp)
 59c:	6a 01                	push   $0x1
 59e:	56                   	push   %esi
 59f:	57                   	push   %edi
 5a0:	e8 d8 fe ff ff       	call   47d <write>
  while(--i >= 0)
 5a5:	83 c4 10             	add    $0x10,%esp
 5a8:	39 de                	cmp    %ebx,%esi
 5aa:	75 e4                	jne    590 <printint+0x70>
    putc(fd, buf[i]);
}
 5ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5af:	5b                   	pop    %ebx
 5b0:	5e                   	pop    %esi
 5b1:	5f                   	pop    %edi
 5b2:	5d                   	pop    %ebp
 5b3:	c3                   	ret    
 5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5bf:	eb 87                	jmp    548 <printint+0x28>
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop

000005d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d0:	f3 0f 1e fb          	endbr32 
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	57                   	push   %edi
 5d8:	56                   	push   %esi
 5d9:	53                   	push   %ebx
 5da:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5dd:	8b 75 0c             	mov    0xc(%ebp),%esi
 5e0:	0f b6 1e             	movzbl (%esi),%ebx
 5e3:	84 db                	test   %bl,%bl
 5e5:	0f 84 b4 00 00 00    	je     69f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 5eb:	8d 45 10             	lea    0x10(%ebp),%eax
 5ee:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5f1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5f4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 5f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f9:	eb 33                	jmp    62e <printf+0x5e>
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
 600:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 603:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 608:	83 f8 25             	cmp    $0x25,%eax
 60b:	74 17                	je     624 <printf+0x54>
  write(fd, &c, 1);
 60d:	83 ec 04             	sub    $0x4,%esp
 610:	88 5d e7             	mov    %bl,-0x19(%ebp)
 613:	6a 01                	push   $0x1
 615:	57                   	push   %edi
 616:	ff 75 08             	pushl  0x8(%ebp)
 619:	e8 5f fe ff ff       	call   47d <write>
 61e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 621:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 624:	0f b6 1e             	movzbl (%esi),%ebx
 627:	83 c6 01             	add    $0x1,%esi
 62a:	84 db                	test   %bl,%bl
 62c:	74 71                	je     69f <printf+0xcf>
    c = fmt[i] & 0xff;
 62e:	0f be cb             	movsbl %bl,%ecx
 631:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 634:	85 d2                	test   %edx,%edx
 636:	74 c8                	je     600 <printf+0x30>
      }
    } else if(state == '%'){
 638:	83 fa 25             	cmp    $0x25,%edx
 63b:	75 e7                	jne    624 <printf+0x54>
      if(c == 'd'){
 63d:	83 f8 64             	cmp    $0x64,%eax
 640:	0f 84 9a 00 00 00    	je     6e0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 646:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 64c:	83 f9 70             	cmp    $0x70,%ecx
 64f:	74 5f                	je     6b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 651:	83 f8 73             	cmp    $0x73,%eax
 654:	0f 84 d6 00 00 00    	je     730 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 65a:	83 f8 63             	cmp    $0x63,%eax
 65d:	0f 84 8d 00 00 00    	je     6f0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 663:	83 f8 25             	cmp    $0x25,%eax
 666:	0f 84 b4 00 00 00    	je     720 <printf+0x150>
  write(fd, &c, 1);
 66c:	83 ec 04             	sub    $0x4,%esp
 66f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 673:	6a 01                	push   $0x1
 675:	57                   	push   %edi
 676:	ff 75 08             	pushl  0x8(%ebp)
 679:	e8 ff fd ff ff       	call   47d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 67e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 681:	83 c4 0c             	add    $0xc,%esp
 684:	6a 01                	push   $0x1
 686:	83 c6 01             	add    $0x1,%esi
 689:	57                   	push   %edi
 68a:	ff 75 08             	pushl  0x8(%ebp)
 68d:	e8 eb fd ff ff       	call   47d <write>
  for(i = 0; fmt[i]; i++){
 692:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 696:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 699:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 69b:	84 db                	test   %bl,%bl
 69d:	75 8f                	jne    62e <printf+0x5e>
    }
  }
}
 69f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a2:	5b                   	pop    %ebx
 6a3:	5e                   	pop    %esi
 6a4:	5f                   	pop    %edi
 6a5:	5d                   	pop    %ebp
 6a6:	c3                   	ret    
 6a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b8:	6a 00                	push   $0x0
 6ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	8b 13                	mov    (%ebx),%edx
 6c2:	e8 59 fe ff ff       	call   520 <printint>
        ap++;
 6c7:	89 d8                	mov    %ebx,%eax
 6c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6cc:	31 d2                	xor    %edx,%edx
        ap++;
 6ce:	83 c0 04             	add    $0x4,%eax
 6d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6d4:	e9 4b ff ff ff       	jmp    624 <printf+0x54>
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	eb ce                	jmp    6ba <printf+0xea>
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6f6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
        ap++;
 6fa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6fd:	57                   	push   %edi
 6fe:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 701:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 704:	e8 74 fd ff ff       	call   47d <write>
        ap++;
 709:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 70c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70f:	31 d2                	xor    %edx,%edx
 711:	e9 0e ff ff ff       	jmp    624 <printf+0x54>
 716:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 720:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
 726:	e9 59 ff ff ff       	jmp    684 <printf+0xb4>
 72b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
        s = (char*)*ap;
 730:	8b 45 d0             	mov    -0x30(%ebp),%eax
 733:	8b 18                	mov    (%eax),%ebx
        ap++;
 735:	83 c0 04             	add    $0x4,%eax
 738:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 73b:	85 db                	test   %ebx,%ebx
 73d:	74 17                	je     756 <printf+0x186>
        while(*s != 0){
 73f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 742:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 744:	84 c0                	test   %al,%al
 746:	0f 84 d8 fe ff ff    	je     624 <printf+0x54>
 74c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 74f:	89 de                	mov    %ebx,%esi
 751:	8b 5d 08             	mov    0x8(%ebp),%ebx
 754:	eb 1a                	jmp    770 <printf+0x1a0>
          s = "(null)";
 756:	bb 98 07 00 00       	mov    $0x798,%ebx
        while(*s != 0){
 75b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 75e:	b8 28 00 00 00       	mov    $0x28,%eax
 763:	89 de                	mov    %ebx,%esi
 765:	8b 5d 08             	mov    0x8(%ebp),%ebx
 768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
  write(fd, &c, 1);
 770:	83 ec 04             	sub    $0x4,%esp
          s++;
 773:	83 c6 01             	add    $0x1,%esi
 776:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 779:	6a 01                	push   $0x1
 77b:	57                   	push   %edi
 77c:	53                   	push   %ebx
 77d:	e8 fb fc ff ff       	call   47d <write>
        while(*s != 0){
 782:	0f b6 06             	movzbl (%esi),%eax
 785:	83 c4 10             	add    $0x10,%esp
 788:	84 c0                	test   %al,%al
 78a:	75 e4                	jne    770 <printf+0x1a0>
 78c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 78f:	31 d2                	xor    %edx,%edx
 791:	e9 8e fe ff ff       	jmp    624 <printf+0x54>
