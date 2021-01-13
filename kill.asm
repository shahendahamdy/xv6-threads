
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
  40:	e8 88 04 00 00       	call   4cd <kill>
  for(i=1; i<argc; i++)
  45:	83 c4 10             	add    $0x10,%esp
  48:	39 f3                	cmp    %esi,%ebx
  4a:	75 e4                	jne    30 <main+0x30>
  exit();
  4c:	e8 4c 04 00 00       	call   49d <exit>
    printf(2, "usage: kill pid...\n");
  51:	50                   	push   %eax
  52:	50                   	push   %eax
  53:	68 d8 07 00 00       	push   $0x7d8
  58:	6a 02                	push   $0x2
  5a:	e8 b1 05 00 00       	call   610 <printf>
    exit();
  5f:	e8 39 04 00 00       	call   49d <exit>
  64:	66 90                	xchg   %ax,%ax
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

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
 1bb:	e8 f5 02 00 00       	call   4b5 <read>
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
 221:	e8 b7 02 00 00       	call   4dd <open>
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
 236:	e8 ba 02 00 00       	call   4f5 <fstat>
  close(fd);
 23b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23e:	89 c6                	mov    %eax,%esi
  close(fd);
 240:	e8 80 02 00 00       	call   4c5 <close>
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

000002d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2d5:	a1 c4 0a 00 00       	mov    0xac4,%eax
{
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	57                   	push   %edi
 2dd:	56                   	push   %esi
 2de:	53                   	push   %ebx
 2df:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2e2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 2e4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2e7:	39 c8                	cmp    %ecx,%eax
 2e9:	73 15                	jae    300 <free+0x30>
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop
 2f0:	39 d1                	cmp    %edx,%ecx
 2f2:	72 14                	jb     308 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 2f4:	39 d0                	cmp    %edx,%eax
 2f6:	73 10                	jae    308 <free+0x38>
{
 2f8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2fa:	8b 10                	mov    (%eax),%edx
 2fc:	39 c8                	cmp    %ecx,%eax
 2fe:	72 f0                	jb     2f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 300:	39 d0                	cmp    %edx,%eax
 302:	72 f4                	jb     2f8 <free+0x28>
 304:	39 d1                	cmp    %edx,%ecx
 306:	73 f0                	jae    2f8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 308:	8b 73 fc             	mov    -0x4(%ebx),%esi
 30b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 30e:	39 fa                	cmp    %edi,%edx
 310:	74 1e                	je     330 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 312:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 315:	8b 50 04             	mov    0x4(%eax),%edx
 318:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 31b:	39 f1                	cmp    %esi,%ecx
 31d:	74 28                	je     347 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 31f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 321:	5b                   	pop    %ebx
  freep = p;
 322:	a3 c4 0a 00 00       	mov    %eax,0xac4
}
 327:	5e                   	pop    %esi
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 330:	03 72 04             	add    0x4(%edx),%esi
 333:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 336:	8b 10                	mov    (%eax),%edx
 338:	8b 12                	mov    (%edx),%edx
 33a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 33d:	8b 50 04             	mov    0x4(%eax),%edx
 340:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 343:	39 f1                	cmp    %esi,%ecx
 345:	75 d8                	jne    31f <free+0x4f>
    p->s.size += bp->s.size;
 347:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 34a:	a3 c4 0a 00 00       	mov    %eax,0xac4
    p->s.size += bp->s.size;
 34f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 352:	8b 53 f8             	mov    -0x8(%ebx),%edx
 355:	89 10                	mov    %edx,(%eax)
}
 357:	5b                   	pop    %ebx
 358:	5e                   	pop    %esi
 359:	5f                   	pop    %edi
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	56                   	push   %esi
 369:	53                   	push   %ebx
 36a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 36d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 370:	8b 3d c4 0a 00 00    	mov    0xac4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 376:	8d 70 07             	lea    0x7(%eax),%esi
 379:	c1 ee 03             	shr    $0x3,%esi
 37c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 37f:	85 ff                	test   %edi,%edi
 381:	0f 84 a9 00 00 00    	je     430 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 387:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 389:	8b 48 04             	mov    0x4(%eax),%ecx
 38c:	39 f1                	cmp    %esi,%ecx
 38e:	73 6d                	jae    3fd <malloc+0x9d>
 390:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 396:	bb 00 10 00 00       	mov    $0x1000,%ebx
 39b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 39e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 3a5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 3a8:	eb 17                	jmp    3c1 <malloc+0x61>
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3b0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 3b2:	8b 4a 04             	mov    0x4(%edx),%ecx
 3b5:	39 f1                	cmp    %esi,%ecx
 3b7:	73 4f                	jae    408 <malloc+0xa8>
 3b9:	8b 3d c4 0a 00 00    	mov    0xac4,%edi
 3bf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 3c1:	39 c7                	cmp    %eax,%edi
 3c3:	75 eb                	jne    3b0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 3c5:	83 ec 0c             	sub    $0xc,%esp
 3c8:	ff 75 e4             	pushl  -0x1c(%ebp)
 3cb:	e8 65 01 00 00       	call   535 <sbrk>
  if(p == (char*)-1)
 3d0:	83 c4 10             	add    $0x10,%esp
 3d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 3d6:	74 1b                	je     3f3 <malloc+0x93>
  hp->s.size = nu;
 3d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 3db:	83 ec 0c             	sub    $0xc,%esp
 3de:	83 c0 08             	add    $0x8,%eax
 3e1:	50                   	push   %eax
 3e2:	e8 e9 fe ff ff       	call   2d0 <free>
  return freep;
 3e7:	a1 c4 0a 00 00       	mov    0xac4,%eax
      if((p = morecore(nunits)) == 0)
 3ec:	83 c4 10             	add    $0x10,%esp
 3ef:	85 c0                	test   %eax,%eax
 3f1:	75 bd                	jne    3b0 <malloc+0x50>
        return 0;
  }
}
 3f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 3f6:	31 c0                	xor    %eax,%eax
}
 3f8:	5b                   	pop    %ebx
 3f9:	5e                   	pop    %esi
 3fa:	5f                   	pop    %edi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
    if(p->s.size >= nunits){
 3fd:	89 c2                	mov    %eax,%edx
 3ff:	89 f8                	mov    %edi,%eax
 401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 408:	39 ce                	cmp    %ecx,%esi
 40a:	74 54                	je     460 <malloc+0x100>
        p->s.size -= nunits;
 40c:	29 f1                	sub    %esi,%ecx
 40e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 411:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 414:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 417:	a3 c4 0a 00 00       	mov    %eax,0xac4
}
 41c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 41f:	8d 42 08             	lea    0x8(%edx),%eax
}
 422:	5b                   	pop    %ebx
 423:	5e                   	pop    %esi
 424:	5f                   	pop    %edi
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    
 427:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 430:	c7 05 c4 0a 00 00 c8 	movl   $0xac8,0xac4
 437:	0a 00 00 
    base.s.size = 0;
 43a:	bf c8 0a 00 00       	mov    $0xac8,%edi
    base.s.ptr = freep = prevp = &base;
 43f:	c7 05 c8 0a 00 00 c8 	movl   $0xac8,0xac8
 446:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 449:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 44b:	c7 05 cc 0a 00 00 00 	movl   $0x0,0xacc
 452:	00 00 00 
    if(p->s.size >= nunits){
 455:	e9 36 ff ff ff       	jmp    390 <malloc+0x30>
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 460:	8b 0a                	mov    (%edx),%ecx
 462:	89 08                	mov    %ecx,(%eax)
 464:	eb b1                	jmp    417 <malloc+0xb7>
 466:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46d:	8d 76 00             	lea    0x0(%esi),%esi

00000470 <thread_create>:
{
 470:	f3 0f 1e fb          	endbr32 
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 47a:	68 00 10 00 00       	push   $0x1000
 47f:	e8 dc fe ff ff       	call   360 <malloc>
return clone(start_routine,arg1,arg2,stack);
 484:	50                   	push   %eax
 485:	ff 75 10             	pushl  0x10(%ebp)
 488:	ff 75 0c             	pushl  0xc(%ebp)
 48b:	ff 75 08             	pushl  0x8(%ebp)
 48e:	e8 ba 00 00 00       	call   54d <clone>
}
 493:	c9                   	leave  
 494:	c3                   	ret    

00000495 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 495:	b8 01 00 00 00       	mov    $0x1,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <exit>:
SYSCALL(exit)
 49d:	b8 02 00 00 00       	mov    $0x2,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <wait>:
SYSCALL(wait)
 4a5:	b8 03 00 00 00       	mov    $0x3,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <pipe>:
SYSCALL(pipe)
 4ad:	b8 04 00 00 00       	mov    $0x4,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <read>:
SYSCALL(read)
 4b5:	b8 05 00 00 00       	mov    $0x5,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <write>:
SYSCALL(write)
 4bd:	b8 10 00 00 00       	mov    $0x10,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <close>:
SYSCALL(close)
 4c5:	b8 15 00 00 00       	mov    $0x15,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <kill>:
SYSCALL(kill)
 4cd:	b8 06 00 00 00       	mov    $0x6,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <exec>:
SYSCALL(exec)
 4d5:	b8 07 00 00 00       	mov    $0x7,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <open>:
SYSCALL(open)
 4dd:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <mknod>:
SYSCALL(mknod)
 4e5:	b8 11 00 00 00       	mov    $0x11,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <unlink>:
SYSCALL(unlink)
 4ed:	b8 12 00 00 00       	mov    $0x12,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <fstat>:
SYSCALL(fstat)
 4f5:	b8 08 00 00 00       	mov    $0x8,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <link>:
SYSCALL(link)
 4fd:	b8 13 00 00 00       	mov    $0x13,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <mkdir>:
SYSCALL(mkdir)
 505:	b8 14 00 00 00       	mov    $0x14,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <chdir>:
SYSCALL(chdir)
 50d:	b8 09 00 00 00       	mov    $0x9,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <dup>:
SYSCALL(dup)
 515:	b8 0a 00 00 00       	mov    $0xa,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <getpid>:
SYSCALL(getpid)
 51d:	b8 0b 00 00 00       	mov    $0xb,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <getyear>:
SYSCALL(getyear)
 525:	b8 16 00 00 00       	mov    $0x16,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <getreadcount>:
SYSCALL(getreadcount)
 52d:	b8 17 00 00 00       	mov    $0x17,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <sbrk>:
SYSCALL(sbrk)
 535:	b8 0c 00 00 00       	mov    $0xc,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <sleep>:
SYSCALL(sleep)
 53d:	b8 0d 00 00 00       	mov    $0xd,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <uptime>:
SYSCALL(uptime)
 545:	b8 0e 00 00 00       	mov    $0xe,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <clone>:
SYSCALL(clone)
 54d:	b8 18 00 00 00       	mov    $0x18,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    
 555:	66 90                	xchg   %ax,%ax
 557:	66 90                	xchg   %ax,%ax
 559:	66 90                	xchg   %ax,%ax
 55b:	66 90                	xchg   %ax,%ax
 55d:	66 90                	xchg   %ax,%ax
 55f:	90                   	nop

00000560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 3c             	sub    $0x3c,%esp
 569:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 56c:	89 d1                	mov    %edx,%ecx
{
 56e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 571:	85 d2                	test   %edx,%edx
 573:	0f 89 7f 00 00 00    	jns    5f8 <printint+0x98>
 579:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 57d:	74 79                	je     5f8 <printint+0x98>
    neg = 1;
 57f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 586:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 588:	31 db                	xor    %ebx,%ebx
 58a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 590:	89 c8                	mov    %ecx,%eax
 592:	31 d2                	xor    %edx,%edx
 594:	89 cf                	mov    %ecx,%edi
 596:	f7 75 c4             	divl   -0x3c(%ebp)
 599:	0f b6 92 f4 07 00 00 	movzbl 0x7f4(%edx),%edx
 5a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5a3:	89 d8                	mov    %ebx,%eax
 5a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5b1:	76 dd                	jbe    590 <printint+0x30>
  if(neg)
 5b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5b6:	85 c9                	test   %ecx,%ecx
 5b8:	74 0c                	je     5c6 <printint+0x66>
    buf[i++] = '-';
 5ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5cd:	eb 07                	jmp    5d6 <printint+0x76>
 5cf:	90                   	nop
 5d0:	0f b6 13             	movzbl (%ebx),%edx
 5d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5d6:	83 ec 04             	sub    $0x4,%esp
 5d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5dc:	6a 01                	push   $0x1
 5de:	56                   	push   %esi
 5df:	57                   	push   %edi
 5e0:	e8 d8 fe ff ff       	call   4bd <write>
  while(--i >= 0)
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	39 de                	cmp    %ebx,%esi
 5ea:	75 e4                	jne    5d0 <printint+0x70>
    putc(fd, buf[i]);
}
 5ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ef:	5b                   	pop    %ebx
 5f0:	5e                   	pop    %esi
 5f1:	5f                   	pop    %edi
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5ff:	eb 87                	jmp    588 <printint+0x28>
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop

00000610 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 610:	f3 0f 1e fb          	endbr32 
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	57                   	push   %edi
 618:	56                   	push   %esi
 619:	53                   	push   %ebx
 61a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 61d:	8b 75 0c             	mov    0xc(%ebp),%esi
 620:	0f b6 1e             	movzbl (%esi),%ebx
 623:	84 db                	test   %bl,%bl
 625:	0f 84 b4 00 00 00    	je     6df <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 62b:	8d 45 10             	lea    0x10(%ebp),%eax
 62e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 631:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 634:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 636:	89 45 d0             	mov    %eax,-0x30(%ebp)
 639:	eb 33                	jmp    66e <printf+0x5e>
 63b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
 640:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 643:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 648:	83 f8 25             	cmp    $0x25,%eax
 64b:	74 17                	je     664 <printf+0x54>
  write(fd, &c, 1);
 64d:	83 ec 04             	sub    $0x4,%esp
 650:	88 5d e7             	mov    %bl,-0x19(%ebp)
 653:	6a 01                	push   $0x1
 655:	57                   	push   %edi
 656:	ff 75 08             	pushl  0x8(%ebp)
 659:	e8 5f fe ff ff       	call   4bd <write>
 65e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 661:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 664:	0f b6 1e             	movzbl (%esi),%ebx
 667:	83 c6 01             	add    $0x1,%esi
 66a:	84 db                	test   %bl,%bl
 66c:	74 71                	je     6df <printf+0xcf>
    c = fmt[i] & 0xff;
 66e:	0f be cb             	movsbl %bl,%ecx
 671:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 674:	85 d2                	test   %edx,%edx
 676:	74 c8                	je     640 <printf+0x30>
      }
    } else if(state == '%'){
 678:	83 fa 25             	cmp    $0x25,%edx
 67b:	75 e7                	jne    664 <printf+0x54>
      if(c == 'd'){
 67d:	83 f8 64             	cmp    $0x64,%eax
 680:	0f 84 9a 00 00 00    	je     720 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 686:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 68c:	83 f9 70             	cmp    $0x70,%ecx
 68f:	74 5f                	je     6f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 691:	83 f8 73             	cmp    $0x73,%eax
 694:	0f 84 d6 00 00 00    	je     770 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 69a:	83 f8 63             	cmp    $0x63,%eax
 69d:	0f 84 8d 00 00 00    	je     730 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6a3:	83 f8 25             	cmp    $0x25,%eax
 6a6:	0f 84 b4 00 00 00    	je     760 <printf+0x150>
  write(fd, &c, 1);
 6ac:	83 ec 04             	sub    $0x4,%esp
 6af:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6b3:	6a 01                	push   $0x1
 6b5:	57                   	push   %edi
 6b6:	ff 75 08             	pushl  0x8(%ebp)
 6b9:	e8 ff fd ff ff       	call   4bd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6be:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6c1:	83 c4 0c             	add    $0xc,%esp
 6c4:	6a 01                	push   $0x1
 6c6:	83 c6 01             	add    $0x1,%esi
 6c9:	57                   	push   %edi
 6ca:	ff 75 08             	pushl  0x8(%ebp)
 6cd:	e8 eb fd ff ff       	call   4bd <write>
  for(i = 0; fmt[i]; i++){
 6d2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6d6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6d9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6db:	84 db                	test   %bl,%bl
 6dd:	75 8f                	jne    66e <printf+0x5e>
    }
  }
}
 6df:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e2:	5b                   	pop    %ebx
 6e3:	5e                   	pop    %esi
 6e4:	5f                   	pop    %edi
 6e5:	5d                   	pop    %ebp
 6e6:	c3                   	ret    
 6e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6f0:	83 ec 0c             	sub    $0xc,%esp
 6f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f8:	6a 00                	push   $0x0
 6fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6fd:	8b 45 08             	mov    0x8(%ebp),%eax
 700:	8b 13                	mov    (%ebx),%edx
 702:	e8 59 fe ff ff       	call   560 <printint>
        ap++;
 707:	89 d8                	mov    %ebx,%eax
 709:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70c:	31 d2                	xor    %edx,%edx
        ap++;
 70e:	83 c0 04             	add    $0x4,%eax
 711:	89 45 d0             	mov    %eax,-0x30(%ebp)
 714:	e9 4b ff ff ff       	jmp    664 <printf+0x54>
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 0a 00 00 00       	mov    $0xa,%ecx
 728:	6a 01                	push   $0x1
 72a:	eb ce                	jmp    6fa <printf+0xea>
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 730:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 733:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 736:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 738:	6a 01                	push   $0x1
        ap++;
 73a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 73d:	57                   	push   %edi
 73e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 741:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 744:	e8 74 fd ff ff       	call   4bd <write>
        ap++;
 749:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 74c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74f:	31 d2                	xor    %edx,%edx
 751:	e9 0e ff ff ff       	jmp    664 <printf+0x54>
 756:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 760:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 763:	83 ec 04             	sub    $0x4,%esp
 766:	e9 59 ff ff ff       	jmp    6c4 <printf+0xb4>
 76b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
        s = (char*)*ap;
 770:	8b 45 d0             	mov    -0x30(%ebp),%eax
 773:	8b 18                	mov    (%eax),%ebx
        ap++;
 775:	83 c0 04             	add    $0x4,%eax
 778:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 77b:	85 db                	test   %ebx,%ebx
 77d:	74 17                	je     796 <printf+0x186>
        while(*s != 0){
 77f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 782:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 784:	84 c0                	test   %al,%al
 786:	0f 84 d8 fe ff ff    	je     664 <printf+0x54>
 78c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 78f:	89 de                	mov    %ebx,%esi
 791:	8b 5d 08             	mov    0x8(%ebp),%ebx
 794:	eb 1a                	jmp    7b0 <printf+0x1a0>
          s = "(null)";
 796:	bb ec 07 00 00       	mov    $0x7ec,%ebx
        while(*s != 0){
 79b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 79e:	b8 28 00 00 00       	mov    $0x28,%eax
 7a3:	89 de                	mov    %ebx,%esi
 7a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
  write(fd, &c, 1);
 7b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7b3:	83 c6 01             	add    $0x1,%esi
 7b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7b9:	6a 01                	push   $0x1
 7bb:	57                   	push   %edi
 7bc:	53                   	push   %ebx
 7bd:	e8 fb fc ff ff       	call   4bd <write>
        while(*s != 0){
 7c2:	0f b6 06             	movzbl (%esi),%eax
 7c5:	83 c4 10             	add    $0x10,%esp
 7c8:	84 c0                	test   %al,%al
 7ca:	75 e4                	jne    7b0 <printf+0x1a0>
 7cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7cf:	31 d2                	xor    %edx,%edx
 7d1:	e9 8e fe ff ff       	jmp    664 <printf+0x54>
