
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
  1d:	68 c8 07 00 00       	push   $0x7c8
  22:	6a 02                	push   $0x2
  24:	e8 d7 05 00 00       	call   600 <printf>
    exit();
  29:	e8 5f 04 00 00       	call   48d <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2e:	50                   	push   %eax
  2f:	50                   	push   %eax
  30:	ff 73 08             	pushl  0x8(%ebx)
  33:	ff 73 04             	pushl  0x4(%ebx)
  36:	e8 b2 04 00 00       	call   4ed <link>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 46 04 00 00       	call   48d <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	ff 73 08             	pushl  0x8(%ebx)
  4a:	ff 73 04             	pushl  0x4(%ebx)
  4d:	68 db 07 00 00       	push   $0x7db
  52:	6a 02                	push   $0x2
  54:	e8 a7 05 00 00       	call   600 <printf>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	eb e4                	jmp    42 <main+0x42>
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

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
 1ab:	e8 f5 02 00 00       	call   4a5 <read>
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
 211:	e8 b7 02 00 00       	call   4cd <open>
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
 226:	e8 ba 02 00 00       	call   4e5 <fstat>
  close(fd);
 22b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22e:	89 c6                	mov    %eax,%esi
  close(fd);
 230:	e8 80 02 00 00       	call   4b5 <close>
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

000002c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2c5:	a1 c4 0a 00 00       	mov    0xac4,%eax
{
 2ca:	89 e5                	mov    %esp,%ebp
 2cc:	57                   	push   %edi
 2cd:	56                   	push   %esi
 2ce:	53                   	push   %ebx
 2cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2d2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 2d4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2d7:	39 c8                	cmp    %ecx,%eax
 2d9:	73 15                	jae    2f0 <free+0x30>
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
 2e0:	39 d1                	cmp    %edx,%ecx
 2e2:	72 14                	jb     2f8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 2e4:	39 d0                	cmp    %edx,%eax
 2e6:	73 10                	jae    2f8 <free+0x38>
{
 2e8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2ea:	8b 10                	mov    (%eax),%edx
 2ec:	39 c8                	cmp    %ecx,%eax
 2ee:	72 f0                	jb     2e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 2f0:	39 d0                	cmp    %edx,%eax
 2f2:	72 f4                	jb     2e8 <free+0x28>
 2f4:	39 d1                	cmp    %edx,%ecx
 2f6:	73 f0                	jae    2e8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 2f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 2fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 2fe:	39 fa                	cmp    %edi,%edx
 300:	74 1e                	je     320 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 302:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 305:	8b 50 04             	mov    0x4(%eax),%edx
 308:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 30b:	39 f1                	cmp    %esi,%ecx
 30d:	74 28                	je     337 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 30f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 311:	5b                   	pop    %ebx
  freep = p;
 312:	a3 c4 0a 00 00       	mov    %eax,0xac4
}
 317:	5e                   	pop    %esi
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 320:	03 72 04             	add    0x4(%edx),%esi
 323:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 326:	8b 10                	mov    (%eax),%edx
 328:	8b 12                	mov    (%edx),%edx
 32a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 32d:	8b 50 04             	mov    0x4(%eax),%edx
 330:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 333:	39 f1                	cmp    %esi,%ecx
 335:	75 d8                	jne    30f <free+0x4f>
    p->s.size += bp->s.size;
 337:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 33a:	a3 c4 0a 00 00       	mov    %eax,0xac4
    p->s.size += bp->s.size;
 33f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 342:	8b 53 f8             	mov    -0x8(%ebx),%edx
 345:	89 10                	mov    %edx,(%eax)
}
 347:	5b                   	pop    %ebx
 348:	5e                   	pop    %esi
 349:	5f                   	pop    %edi
 34a:	5d                   	pop    %ebp
 34b:	c3                   	ret    
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000350 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	57                   	push   %edi
 358:	56                   	push   %esi
 359:	53                   	push   %ebx
 35a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 360:	8b 3d c4 0a 00 00    	mov    0xac4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 366:	8d 70 07             	lea    0x7(%eax),%esi
 369:	c1 ee 03             	shr    $0x3,%esi
 36c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 36f:	85 ff                	test   %edi,%edi
 371:	0f 84 a9 00 00 00    	je     420 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 377:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 379:	8b 48 04             	mov    0x4(%eax),%ecx
 37c:	39 f1                	cmp    %esi,%ecx
 37e:	73 6d                	jae    3ed <malloc+0x9d>
 380:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 386:	bb 00 10 00 00       	mov    $0x1000,%ebx
 38b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 38e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 395:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 398:	eb 17                	jmp    3b1 <malloc+0x61>
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3a0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 3a2:	8b 4a 04             	mov    0x4(%edx),%ecx
 3a5:	39 f1                	cmp    %esi,%ecx
 3a7:	73 4f                	jae    3f8 <malloc+0xa8>
 3a9:	8b 3d c4 0a 00 00    	mov    0xac4,%edi
 3af:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 3b1:	39 c7                	cmp    %eax,%edi
 3b3:	75 eb                	jne    3a0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 3b5:	83 ec 0c             	sub    $0xc,%esp
 3b8:	ff 75 e4             	pushl  -0x1c(%ebp)
 3bb:	e8 65 01 00 00       	call   525 <sbrk>
  if(p == (char*)-1)
 3c0:	83 c4 10             	add    $0x10,%esp
 3c3:	83 f8 ff             	cmp    $0xffffffff,%eax
 3c6:	74 1b                	je     3e3 <malloc+0x93>
  hp->s.size = nu;
 3c8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 3cb:	83 ec 0c             	sub    $0xc,%esp
 3ce:	83 c0 08             	add    $0x8,%eax
 3d1:	50                   	push   %eax
 3d2:	e8 e9 fe ff ff       	call   2c0 <free>
  return freep;
 3d7:	a1 c4 0a 00 00       	mov    0xac4,%eax
      if((p = morecore(nunits)) == 0)
 3dc:	83 c4 10             	add    $0x10,%esp
 3df:	85 c0                	test   %eax,%eax
 3e1:	75 bd                	jne    3a0 <malloc+0x50>
        return 0;
  }
}
 3e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 3e6:	31 c0                	xor    %eax,%eax
}
 3e8:	5b                   	pop    %ebx
 3e9:	5e                   	pop    %esi
 3ea:	5f                   	pop    %edi
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
    if(p->s.size >= nunits){
 3ed:	89 c2                	mov    %eax,%edx
 3ef:	89 f8                	mov    %edi,%eax
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 3f8:	39 ce                	cmp    %ecx,%esi
 3fa:	74 54                	je     450 <malloc+0x100>
        p->s.size -= nunits;
 3fc:	29 f1                	sub    %esi,%ecx
 3fe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 401:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 404:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 407:	a3 c4 0a 00 00       	mov    %eax,0xac4
}
 40c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 40f:	8d 42 08             	lea    0x8(%edx),%eax
}
 412:	5b                   	pop    %ebx
 413:	5e                   	pop    %esi
 414:	5f                   	pop    %edi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 420:	c7 05 c4 0a 00 00 c8 	movl   $0xac8,0xac4
 427:	0a 00 00 
    base.s.size = 0;
 42a:	bf c8 0a 00 00       	mov    $0xac8,%edi
    base.s.ptr = freep = prevp = &base;
 42f:	c7 05 c8 0a 00 00 c8 	movl   $0xac8,0xac8
 436:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 439:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 43b:	c7 05 cc 0a 00 00 00 	movl   $0x0,0xacc
 442:	00 00 00 
    if(p->s.size >= nunits){
 445:	e9 36 ff ff ff       	jmp    380 <malloc+0x30>
 44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 450:	8b 0a                	mov    (%edx),%ecx
 452:	89 08                	mov    %ecx,(%eax)
 454:	eb b1                	jmp    407 <malloc+0xb7>
 456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi

00000460 <thread_create>:
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 46a:	68 00 10 00 00       	push   $0x1000
 46f:	e8 dc fe ff ff       	call   350 <malloc>
return clone(start_routine,arg1,arg2,stack);
 474:	50                   	push   %eax
 475:	ff 75 10             	pushl  0x10(%ebp)
 478:	ff 75 0c             	pushl  0xc(%ebp)
 47b:	ff 75 08             	pushl  0x8(%ebp)
 47e:	e8 ba 00 00 00       	call   53d <clone>
}
 483:	c9                   	leave  
 484:	c3                   	ret    

00000485 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 485:	b8 01 00 00 00       	mov    $0x1,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <exit>:
SYSCALL(exit)
 48d:	b8 02 00 00 00       	mov    $0x2,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <wait>:
SYSCALL(wait)
 495:	b8 03 00 00 00       	mov    $0x3,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <pipe>:
SYSCALL(pipe)
 49d:	b8 04 00 00 00       	mov    $0x4,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <read>:
SYSCALL(read)
 4a5:	b8 05 00 00 00       	mov    $0x5,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <write>:
SYSCALL(write)
 4ad:	b8 10 00 00 00       	mov    $0x10,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <close>:
SYSCALL(close)
 4b5:	b8 15 00 00 00       	mov    $0x15,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <kill>:
SYSCALL(kill)
 4bd:	b8 06 00 00 00       	mov    $0x6,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <exec>:
SYSCALL(exec)
 4c5:	b8 07 00 00 00       	mov    $0x7,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <open>:
SYSCALL(open)
 4cd:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <mknod>:
SYSCALL(mknod)
 4d5:	b8 11 00 00 00       	mov    $0x11,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <unlink>:
SYSCALL(unlink)
 4dd:	b8 12 00 00 00       	mov    $0x12,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <fstat>:
SYSCALL(fstat)
 4e5:	b8 08 00 00 00       	mov    $0x8,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <link>:
SYSCALL(link)
 4ed:	b8 13 00 00 00       	mov    $0x13,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <mkdir>:
SYSCALL(mkdir)
 4f5:	b8 14 00 00 00       	mov    $0x14,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <chdir>:
SYSCALL(chdir)
 4fd:	b8 09 00 00 00       	mov    $0x9,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <dup>:
SYSCALL(dup)
 505:	b8 0a 00 00 00       	mov    $0xa,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <getpid>:
SYSCALL(getpid)
 50d:	b8 0b 00 00 00       	mov    $0xb,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <getyear>:
SYSCALL(getyear)
 515:	b8 16 00 00 00       	mov    $0x16,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <getreadcount>:
SYSCALL(getreadcount)
 51d:	b8 17 00 00 00       	mov    $0x17,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <sbrk>:
SYSCALL(sbrk)
 525:	b8 0c 00 00 00       	mov    $0xc,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <sleep>:
SYSCALL(sleep)
 52d:	b8 0d 00 00 00       	mov    $0xd,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <uptime>:
SYSCALL(uptime)
 535:	b8 0e 00 00 00       	mov    $0xe,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <clone>:
SYSCALL(clone)
 53d:	b8 18 00 00 00       	mov    $0x18,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    
 545:	66 90                	xchg   %ax,%ax
 547:	66 90                	xchg   %ax,%ax
 549:	66 90                	xchg   %ax,%ax
 54b:	66 90                	xchg   %ax,%ax
 54d:	66 90                	xchg   %ax,%ax
 54f:	90                   	nop

00000550 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
 559:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 55c:	89 d1                	mov    %edx,%ecx
{
 55e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 561:	85 d2                	test   %edx,%edx
 563:	0f 89 7f 00 00 00    	jns    5e8 <printint+0x98>
 569:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 56d:	74 79                	je     5e8 <printint+0x98>
    neg = 1;
 56f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 576:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 578:	31 db                	xor    %ebx,%ebx
 57a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 580:	89 c8                	mov    %ecx,%eax
 582:	31 d2                	xor    %edx,%edx
 584:	89 cf                	mov    %ecx,%edi
 586:	f7 75 c4             	divl   -0x3c(%ebp)
 589:	0f b6 92 f8 07 00 00 	movzbl 0x7f8(%edx),%edx
 590:	89 45 c0             	mov    %eax,-0x40(%ebp)
 593:	89 d8                	mov    %ebx,%eax
 595:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 598:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 59b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 59e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5a1:	76 dd                	jbe    580 <printint+0x30>
  if(neg)
 5a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5a6:	85 c9                	test   %ecx,%ecx
 5a8:	74 0c                	je     5b6 <printint+0x66>
    buf[i++] = '-';
 5aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5bd:	eb 07                	jmp    5c6 <printint+0x76>
 5bf:	90                   	nop
 5c0:	0f b6 13             	movzbl (%ebx),%edx
 5c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5c6:	83 ec 04             	sub    $0x4,%esp
 5c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5cc:	6a 01                	push   $0x1
 5ce:	56                   	push   %esi
 5cf:	57                   	push   %edi
 5d0:	e8 d8 fe ff ff       	call   4ad <write>
  while(--i >= 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	39 de                	cmp    %ebx,%esi
 5da:	75 e4                	jne    5c0 <printint+0x70>
    putc(fd, buf[i]);
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5ef:	eb 87                	jmp    578 <printint+0x28>
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	f3 0f 1e fb          	endbr32 
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	57                   	push   %edi
 608:	56                   	push   %esi
 609:	53                   	push   %ebx
 60a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 60d:	8b 75 0c             	mov    0xc(%ebp),%esi
 610:	0f b6 1e             	movzbl (%esi),%ebx
 613:	84 db                	test   %bl,%bl
 615:	0f 84 b4 00 00 00    	je     6cf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 61b:	8d 45 10             	lea    0x10(%ebp),%eax
 61e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 621:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 624:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 626:	89 45 d0             	mov    %eax,-0x30(%ebp)
 629:	eb 33                	jmp    65e <printf+0x5e>
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
 630:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 633:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	74 17                	je     654 <printf+0x54>
  write(fd, &c, 1);
 63d:	83 ec 04             	sub    $0x4,%esp
 640:	88 5d e7             	mov    %bl,-0x19(%ebp)
 643:	6a 01                	push   $0x1
 645:	57                   	push   %edi
 646:	ff 75 08             	pushl  0x8(%ebp)
 649:	e8 5f fe ff ff       	call   4ad <write>
 64e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 651:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 654:	0f b6 1e             	movzbl (%esi),%ebx
 657:	83 c6 01             	add    $0x1,%esi
 65a:	84 db                	test   %bl,%bl
 65c:	74 71                	je     6cf <printf+0xcf>
    c = fmt[i] & 0xff;
 65e:	0f be cb             	movsbl %bl,%ecx
 661:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 664:	85 d2                	test   %edx,%edx
 666:	74 c8                	je     630 <printf+0x30>
      }
    } else if(state == '%'){
 668:	83 fa 25             	cmp    $0x25,%edx
 66b:	75 e7                	jne    654 <printf+0x54>
      if(c == 'd'){
 66d:	83 f8 64             	cmp    $0x64,%eax
 670:	0f 84 9a 00 00 00    	je     710 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 676:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 67c:	83 f9 70             	cmp    $0x70,%ecx
 67f:	74 5f                	je     6e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 681:	83 f8 73             	cmp    $0x73,%eax
 684:	0f 84 d6 00 00 00    	je     760 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 68a:	83 f8 63             	cmp    $0x63,%eax
 68d:	0f 84 8d 00 00 00    	je     720 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 693:	83 f8 25             	cmp    $0x25,%eax
 696:	0f 84 b4 00 00 00    	je     750 <printf+0x150>
  write(fd, &c, 1);
 69c:	83 ec 04             	sub    $0x4,%esp
 69f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6a3:	6a 01                	push   $0x1
 6a5:	57                   	push   %edi
 6a6:	ff 75 08             	pushl  0x8(%ebp)
 6a9:	e8 ff fd ff ff       	call   4ad <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6ae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6b1:	83 c4 0c             	add    $0xc,%esp
 6b4:	6a 01                	push   $0x1
 6b6:	83 c6 01             	add    $0x1,%esi
 6b9:	57                   	push   %edi
 6ba:	ff 75 08             	pushl  0x8(%ebp)
 6bd:	e8 eb fd ff ff       	call   4ad <write>
  for(i = 0; fmt[i]; i++){
 6c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6c6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6c9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6cb:	84 db                	test   %bl,%bl
 6cd:	75 8f                	jne    65e <printf+0x5e>
    }
  }
}
 6cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d2:	5b                   	pop    %ebx
 6d3:	5e                   	pop    %esi
 6d4:	5f                   	pop    %edi
 6d5:	5d                   	pop    %ebp
 6d6:	c3                   	ret    
 6d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e8:	6a 00                	push   $0x0
 6ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
 6f0:	8b 13                	mov    (%ebx),%edx
 6f2:	e8 59 fe ff ff       	call   550 <printint>
        ap++;
 6f7:	89 d8                	mov    %ebx,%eax
 6f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6fc:	31 d2                	xor    %edx,%edx
        ap++;
 6fe:	83 c0 04             	add    $0x4,%eax
 701:	89 45 d0             	mov    %eax,-0x30(%ebp)
 704:	e9 4b ff ff ff       	jmp    654 <printf+0x54>
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 0a 00 00 00       	mov    $0xa,%ecx
 718:	6a 01                	push   $0x1
 71a:	eb ce                	jmp    6ea <printf+0xea>
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 720:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 726:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 728:	6a 01                	push   $0x1
        ap++;
 72a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 72d:	57                   	push   %edi
 72e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 731:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 734:	e8 74 fd ff ff       	call   4ad <write>
        ap++;
 739:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 73c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73f:	31 d2                	xor    %edx,%edx
 741:	e9 0e ff ff ff       	jmp    654 <printf+0x54>
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 750:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
 756:	e9 59 ff ff ff       	jmp    6b4 <printf+0xb4>
 75b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 75f:	90                   	nop
        s = (char*)*ap;
 760:	8b 45 d0             	mov    -0x30(%ebp),%eax
 763:	8b 18                	mov    (%eax),%ebx
        ap++;
 765:	83 c0 04             	add    $0x4,%eax
 768:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 76b:	85 db                	test   %ebx,%ebx
 76d:	74 17                	je     786 <printf+0x186>
        while(*s != 0){
 76f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 772:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 774:	84 c0                	test   %al,%al
 776:	0f 84 d8 fe ff ff    	je     654 <printf+0x54>
 77c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 77f:	89 de                	mov    %ebx,%esi
 781:	8b 5d 08             	mov    0x8(%ebp),%ebx
 784:	eb 1a                	jmp    7a0 <printf+0x1a0>
          s = "(null)";
 786:	bb ef 07 00 00       	mov    $0x7ef,%ebx
        while(*s != 0){
 78b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 78e:	b8 28 00 00 00       	mov    $0x28,%eax
 793:	89 de                	mov    %ebx,%esi
 795:	8b 5d 08             	mov    0x8(%ebp),%ebx
 798:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
  write(fd, &c, 1);
 7a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7a3:	83 c6 01             	add    $0x1,%esi
 7a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7a9:	6a 01                	push   $0x1
 7ab:	57                   	push   %edi
 7ac:	53                   	push   %ebx
 7ad:	e8 fb fc ff ff       	call   4ad <write>
        while(*s != 0){
 7b2:	0f b6 06             	movzbl (%esi),%eax
 7b5:	83 c4 10             	add    $0x10,%esp
 7b8:	84 c0                	test   %al,%al
 7ba:	75 e4                	jne    7a0 <printf+0x1a0>
 7bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7bf:	31 d2                	xor    %edx,%edx
 7c1:	e9 8e fe ff ff       	jmp    654 <printf+0x54>
