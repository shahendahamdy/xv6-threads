
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
  1d:	68 e8 07 00 00       	push   $0x7e8
  22:	6a 02                	push   $0x2
  24:	e8 f7 05 00 00       	call   620 <printf>
    exit();
  29:	e8 7f 04 00 00       	call   4ad <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2e:	50                   	push   %eax
  2f:	50                   	push   %eax
  30:	ff 73 08             	pushl  0x8(%ebx)
  33:	ff 73 04             	pushl  0x4(%ebx)
  36:	e8 d2 04 00 00       	call   50d <link>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 66 04 00 00       	call   4ad <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	ff 73 08             	pushl  0x8(%ebx)
  4a:	ff 73 04             	pushl  0x4(%ebx)
  4d:	68 fb 07 00 00       	push   $0x7fb
  52:	6a 02                	push   $0x2
  54:	e8 c7 05 00 00       	call   620 <printf>
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
 1ab:	e8 15 03 00 00       	call   4c5 <read>
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
 211:	e8 d7 02 00 00       	call   4ed <open>
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
 226:	e8 da 02 00 00       	call   505 <fstat>
  close(fd);
 22b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22e:	89 c6                	mov    %eax,%esi
  close(fd);
 230:	e8 a0 02 00 00       	call   4d5 <close>
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
 2ce:	e8 92 02 00 00       	call   565 <join>
  
  return x;
}
 2d3:	c9                   	leave  
 2d4:	c3                   	ret    
 2d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2e5:	a1 04 0b 00 00       	mov    0xb04,%eax
{
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	57                   	push   %edi
 2ed:	56                   	push   %esi
 2ee:	53                   	push   %ebx
 2ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2f2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 2f4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2f7:	39 c8                	cmp    %ecx,%eax
 2f9:	73 15                	jae    310 <free+0x30>
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop
 300:	39 d1                	cmp    %edx,%ecx
 302:	72 14                	jb     318 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 304:	39 d0                	cmp    %edx,%eax
 306:	73 10                	jae    318 <free+0x38>
{
 308:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 30a:	8b 10                	mov    (%eax),%edx
 30c:	39 c8                	cmp    %ecx,%eax
 30e:	72 f0                	jb     300 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 310:	39 d0                	cmp    %edx,%eax
 312:	72 f4                	jb     308 <free+0x28>
 314:	39 d1                	cmp    %edx,%ecx
 316:	73 f0                	jae    308 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 318:	8b 73 fc             	mov    -0x4(%ebx),%esi
 31b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 31e:	39 fa                	cmp    %edi,%edx
 320:	74 1e                	je     340 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 322:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 325:	8b 50 04             	mov    0x4(%eax),%edx
 328:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 32b:	39 f1                	cmp    %esi,%ecx
 32d:	74 28                	je     357 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 32f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 331:	5b                   	pop    %ebx
  freep = p;
 332:	a3 04 0b 00 00       	mov    %eax,0xb04
}
 337:	5e                   	pop    %esi
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 340:	03 72 04             	add    0x4(%edx),%esi
 343:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 346:	8b 10                	mov    (%eax),%edx
 348:	8b 12                	mov    (%edx),%edx
 34a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 34d:	8b 50 04             	mov    0x4(%eax),%edx
 350:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 353:	39 f1                	cmp    %esi,%ecx
 355:	75 d8                	jne    32f <free+0x4f>
    p->s.size += bp->s.size;
 357:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 35a:	a3 04 0b 00 00       	mov    %eax,0xb04
    p->s.size += bp->s.size;
 35f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 362:	8b 53 f8             	mov    -0x8(%ebx),%edx
 365:	89 10                	mov    %edx,(%eax)
}
 367:	5b                   	pop    %ebx
 368:	5e                   	pop    %esi
 369:	5f                   	pop    %edi
 36a:	5d                   	pop    %ebp
 36b:	c3                   	ret    
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	56                   	push   %esi
 379:	53                   	push   %ebx
 37a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 37d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 380:	8b 3d 04 0b 00 00    	mov    0xb04,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 386:	8d 70 07             	lea    0x7(%eax),%esi
 389:	c1 ee 03             	shr    $0x3,%esi
 38c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 38f:	85 ff                	test   %edi,%edi
 391:	0f 84 a9 00 00 00    	je     440 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 397:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 399:	8b 48 04             	mov    0x4(%eax),%ecx
 39c:	39 f1                	cmp    %esi,%ecx
 39e:	73 6d                	jae    40d <malloc+0x9d>
 3a0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 3a6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 3ab:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 3ae:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 3b5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 3b8:	eb 17                	jmp    3d1 <malloc+0x61>
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3c0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 3c2:	8b 4a 04             	mov    0x4(%edx),%ecx
 3c5:	39 f1                	cmp    %esi,%ecx
 3c7:	73 4f                	jae    418 <malloc+0xa8>
 3c9:	8b 3d 04 0b 00 00    	mov    0xb04,%edi
 3cf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 3d1:	39 c7                	cmp    %eax,%edi
 3d3:	75 eb                	jne    3c0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 3d5:	83 ec 0c             	sub    $0xc,%esp
 3d8:	ff 75 e4             	pushl  -0x1c(%ebp)
 3db:	e8 65 01 00 00       	call   545 <sbrk>
  if(p == (char*)-1)
 3e0:	83 c4 10             	add    $0x10,%esp
 3e3:	83 f8 ff             	cmp    $0xffffffff,%eax
 3e6:	74 1b                	je     403 <malloc+0x93>
  hp->s.size = nu;
 3e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 3eb:	83 ec 0c             	sub    $0xc,%esp
 3ee:	83 c0 08             	add    $0x8,%eax
 3f1:	50                   	push   %eax
 3f2:	e8 e9 fe ff ff       	call   2e0 <free>
  return freep;
 3f7:	a1 04 0b 00 00       	mov    0xb04,%eax
      if((p = morecore(nunits)) == 0)
 3fc:	83 c4 10             	add    $0x10,%esp
 3ff:	85 c0                	test   %eax,%eax
 401:	75 bd                	jne    3c0 <malloc+0x50>
        return 0;
  }
}
 403:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 406:	31 c0                	xor    %eax,%eax
}
 408:	5b                   	pop    %ebx
 409:	5e                   	pop    %esi
 40a:	5f                   	pop    %edi
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
    if(p->s.size >= nunits){
 40d:	89 c2                	mov    %eax,%edx
 40f:	89 f8                	mov    %edi,%eax
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 418:	39 ce                	cmp    %ecx,%esi
 41a:	74 54                	je     470 <malloc+0x100>
        p->s.size -= nunits;
 41c:	29 f1                	sub    %esi,%ecx
 41e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 421:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 424:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 427:	a3 04 0b 00 00       	mov    %eax,0xb04
}
 42c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 42f:	8d 42 08             	lea    0x8(%edx),%eax
}
 432:	5b                   	pop    %ebx
 433:	5e                   	pop    %esi
 434:	5f                   	pop    %edi
 435:	5d                   	pop    %ebp
 436:	c3                   	ret    
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 440:	c7 05 04 0b 00 00 08 	movl   $0xb08,0xb04
 447:	0b 00 00 
    base.s.size = 0;
 44a:	bf 08 0b 00 00       	mov    $0xb08,%edi
    base.s.ptr = freep = prevp = &base;
 44f:	c7 05 08 0b 00 00 08 	movl   $0xb08,0xb08
 456:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 459:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 45b:	c7 05 0c 0b 00 00 00 	movl   $0x0,0xb0c
 462:	00 00 00 
    if(p->s.size >= nunits){
 465:	e9 36 ff ff ff       	jmp    3a0 <malloc+0x30>
 46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 470:	8b 0a                	mov    (%edx),%ecx
 472:	89 08                	mov    %ecx,(%eax)
 474:	eb b1                	jmp    427 <malloc+0xb7>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi

00000480 <thread_create>:
{
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 48a:	68 00 10 00 00       	push   $0x1000
 48f:	e8 dc fe ff ff       	call   370 <malloc>
return clone(start_routine,arg1,arg2,stack);
 494:	50                   	push   %eax
 495:	ff 75 10             	pushl  0x10(%ebp)
 498:	ff 75 0c             	pushl  0xc(%ebp)
 49b:	ff 75 08             	pushl  0x8(%ebp)
 49e:	e8 ba 00 00 00       	call   55d <clone>
}
 4a3:	c9                   	leave  
 4a4:	c3                   	ret    

000004a5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4a5:	b8 01 00 00 00       	mov    $0x1,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <exit>:
SYSCALL(exit)
 4ad:	b8 02 00 00 00       	mov    $0x2,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <wait>:
SYSCALL(wait)
 4b5:	b8 03 00 00 00       	mov    $0x3,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <pipe>:
SYSCALL(pipe)
 4bd:	b8 04 00 00 00       	mov    $0x4,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <read>:
SYSCALL(read)
 4c5:	b8 05 00 00 00       	mov    $0x5,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <write>:
SYSCALL(write)
 4cd:	b8 10 00 00 00       	mov    $0x10,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <close>:
SYSCALL(close)
 4d5:	b8 15 00 00 00       	mov    $0x15,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <kill>:
SYSCALL(kill)
 4dd:	b8 06 00 00 00       	mov    $0x6,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <exec>:
SYSCALL(exec)
 4e5:	b8 07 00 00 00       	mov    $0x7,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <open>:
SYSCALL(open)
 4ed:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <mknod>:
SYSCALL(mknod)
 4f5:	b8 11 00 00 00       	mov    $0x11,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <unlink>:
SYSCALL(unlink)
 4fd:	b8 12 00 00 00       	mov    $0x12,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <fstat>:
SYSCALL(fstat)
 505:	b8 08 00 00 00       	mov    $0x8,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <link>:
SYSCALL(link)
 50d:	b8 13 00 00 00       	mov    $0x13,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <mkdir>:
SYSCALL(mkdir)
 515:	b8 14 00 00 00       	mov    $0x14,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <chdir>:
SYSCALL(chdir)
 51d:	b8 09 00 00 00       	mov    $0x9,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <dup>:
SYSCALL(dup)
 525:	b8 0a 00 00 00       	mov    $0xa,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <getpid>:
SYSCALL(getpid)
 52d:	b8 0b 00 00 00       	mov    $0xb,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <getyear>:
SYSCALL(getyear)
 535:	b8 16 00 00 00       	mov    $0x16,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <getreadcount>:
SYSCALL(getreadcount)
 53d:	b8 17 00 00 00       	mov    $0x17,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <sbrk>:
SYSCALL(sbrk)
 545:	b8 0c 00 00 00       	mov    $0xc,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <sleep>:
SYSCALL(sleep)
 54d:	b8 0d 00 00 00       	mov    $0xd,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <uptime>:
SYSCALL(uptime)
 555:	b8 0e 00 00 00       	mov    $0xe,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <clone>:
SYSCALL(clone)
 55d:	b8 18 00 00 00       	mov    $0x18,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <join>:
SYSCALL(join)
 565:	b8 19 00 00 00       	mov    $0x19,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    
 56d:	66 90                	xchg   %ax,%ax
 56f:	90                   	nop

00000570 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 3c             	sub    $0x3c,%esp
 579:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 57c:	89 d1                	mov    %edx,%ecx
{
 57e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 581:	85 d2                	test   %edx,%edx
 583:	0f 89 7f 00 00 00    	jns    608 <printint+0x98>
 589:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 58d:	74 79                	je     608 <printint+0x98>
    neg = 1;
 58f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 596:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 598:	31 db                	xor    %ebx,%ebx
 59a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5a0:	89 c8                	mov    %ecx,%eax
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	89 cf                	mov    %ecx,%edi
 5a6:	f7 75 c4             	divl   -0x3c(%ebp)
 5a9:	0f b6 92 18 08 00 00 	movzbl 0x818(%edx),%edx
 5b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5b3:	89 d8                	mov    %ebx,%eax
 5b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5c1:	76 dd                	jbe    5a0 <printint+0x30>
  if(neg)
 5c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5c6:	85 c9                	test   %ecx,%ecx
 5c8:	74 0c                	je     5d6 <printint+0x66>
    buf[i++] = '-';
 5ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5dd:	eb 07                	jmp    5e6 <printint+0x76>
 5df:	90                   	nop
 5e0:	0f b6 13             	movzbl (%ebx),%edx
 5e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5ec:	6a 01                	push   $0x1
 5ee:	56                   	push   %esi
 5ef:	57                   	push   %edi
 5f0:	e8 d8 fe ff ff       	call   4cd <write>
  while(--i >= 0)
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	39 de                	cmp    %ebx,%esi
 5fa:	75 e4                	jne    5e0 <printint+0x70>
    putc(fd, buf[i]);
}
 5fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ff:	5b                   	pop    %ebx
 600:	5e                   	pop    %esi
 601:	5f                   	pop    %edi
 602:	5d                   	pop    %ebp
 603:	c3                   	ret    
 604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 608:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 60f:	eb 87                	jmp    598 <printint+0x28>
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 620:	f3 0f 1e fb          	endbr32 
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	57                   	push   %edi
 628:	56                   	push   %esi
 629:	53                   	push   %ebx
 62a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 62d:	8b 75 0c             	mov    0xc(%ebp),%esi
 630:	0f b6 1e             	movzbl (%esi),%ebx
 633:	84 db                	test   %bl,%bl
 635:	0f 84 b4 00 00 00    	je     6ef <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 63b:	8d 45 10             	lea    0x10(%ebp),%eax
 63e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 641:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 644:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 646:	89 45 d0             	mov    %eax,-0x30(%ebp)
 649:	eb 33                	jmp    67e <printf+0x5e>
 64b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
 650:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 653:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 658:	83 f8 25             	cmp    $0x25,%eax
 65b:	74 17                	je     674 <printf+0x54>
  write(fd, &c, 1);
 65d:	83 ec 04             	sub    $0x4,%esp
 660:	88 5d e7             	mov    %bl,-0x19(%ebp)
 663:	6a 01                	push   $0x1
 665:	57                   	push   %edi
 666:	ff 75 08             	pushl  0x8(%ebp)
 669:	e8 5f fe ff ff       	call   4cd <write>
 66e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 671:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 674:	0f b6 1e             	movzbl (%esi),%ebx
 677:	83 c6 01             	add    $0x1,%esi
 67a:	84 db                	test   %bl,%bl
 67c:	74 71                	je     6ef <printf+0xcf>
    c = fmt[i] & 0xff;
 67e:	0f be cb             	movsbl %bl,%ecx
 681:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 684:	85 d2                	test   %edx,%edx
 686:	74 c8                	je     650 <printf+0x30>
      }
    } else if(state == '%'){
 688:	83 fa 25             	cmp    $0x25,%edx
 68b:	75 e7                	jne    674 <printf+0x54>
      if(c == 'd'){
 68d:	83 f8 64             	cmp    $0x64,%eax
 690:	0f 84 9a 00 00 00    	je     730 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 696:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 69c:	83 f9 70             	cmp    $0x70,%ecx
 69f:	74 5f                	je     700 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6a1:	83 f8 73             	cmp    $0x73,%eax
 6a4:	0f 84 d6 00 00 00    	je     780 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6aa:	83 f8 63             	cmp    $0x63,%eax
 6ad:	0f 84 8d 00 00 00    	je     740 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6b3:	83 f8 25             	cmp    $0x25,%eax
 6b6:	0f 84 b4 00 00 00    	je     770 <printf+0x150>
  write(fd, &c, 1);
 6bc:	83 ec 04             	sub    $0x4,%esp
 6bf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6c3:	6a 01                	push   $0x1
 6c5:	57                   	push   %edi
 6c6:	ff 75 08             	pushl  0x8(%ebp)
 6c9:	e8 ff fd ff ff       	call   4cd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6ce:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6d1:	83 c4 0c             	add    $0xc,%esp
 6d4:	6a 01                	push   $0x1
 6d6:	83 c6 01             	add    $0x1,%esi
 6d9:	57                   	push   %edi
 6da:	ff 75 08             	pushl  0x8(%ebp)
 6dd:	e8 eb fd ff ff       	call   4cd <write>
  for(i = 0; fmt[i]; i++){
 6e2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6e6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6e9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6eb:	84 db                	test   %bl,%bl
 6ed:	75 8f                	jne    67e <printf+0x5e>
    }
  }
}
 6ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6f2:	5b                   	pop    %ebx
 6f3:	5e                   	pop    %esi
 6f4:	5f                   	pop    %edi
 6f5:	5d                   	pop    %ebp
 6f6:	c3                   	ret    
 6f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 10 00 00 00       	mov    $0x10,%ecx
 708:	6a 00                	push   $0x0
 70a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	8b 13                	mov    (%ebx),%edx
 712:	e8 59 fe ff ff       	call   570 <printint>
        ap++;
 717:	89 d8                	mov    %ebx,%eax
 719:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71c:	31 d2                	xor    %edx,%edx
        ap++;
 71e:	83 c0 04             	add    $0x4,%eax
 721:	89 45 d0             	mov    %eax,-0x30(%ebp)
 724:	e9 4b ff ff ff       	jmp    674 <printf+0x54>
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 0a 00 00 00       	mov    $0xa,%ecx
 738:	6a 01                	push   $0x1
 73a:	eb ce                	jmp    70a <printf+0xea>
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 740:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 743:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 746:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 748:	6a 01                	push   $0x1
        ap++;
 74a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 74d:	57                   	push   %edi
 74e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 751:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 754:	e8 74 fd ff ff       	call   4cd <write>
        ap++;
 759:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 75c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75f:	31 d2                	xor    %edx,%edx
 761:	e9 0e ff ff ff       	jmp    674 <printf+0x54>
 766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 770:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 773:	83 ec 04             	sub    $0x4,%esp
 776:	e9 59 ff ff ff       	jmp    6d4 <printf+0xb4>
 77b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop
        s = (char*)*ap;
 780:	8b 45 d0             	mov    -0x30(%ebp),%eax
 783:	8b 18                	mov    (%eax),%ebx
        ap++;
 785:	83 c0 04             	add    $0x4,%eax
 788:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 78b:	85 db                	test   %ebx,%ebx
 78d:	74 17                	je     7a6 <printf+0x186>
        while(*s != 0){
 78f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 792:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 794:	84 c0                	test   %al,%al
 796:	0f 84 d8 fe ff ff    	je     674 <printf+0x54>
 79c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 79f:	89 de                	mov    %ebx,%esi
 7a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7a4:	eb 1a                	jmp    7c0 <printf+0x1a0>
          s = "(null)";
 7a6:	bb 0f 08 00 00       	mov    $0x80f,%ebx
        while(*s != 0){
 7ab:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ae:	b8 28 00 00 00       	mov    $0x28,%eax
 7b3:	89 de                	mov    %ebx,%esi
 7b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop
  write(fd, &c, 1);
 7c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7c3:	83 c6 01             	add    $0x1,%esi
 7c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7c9:	6a 01                	push   $0x1
 7cb:	57                   	push   %edi
 7cc:	53                   	push   %ebx
 7cd:	e8 fb fc ff ff       	call   4cd <write>
        while(*s != 0){
 7d2:	0f b6 06             	movzbl (%esi),%eax
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	84 c0                	test   %al,%al
 7da:	75 e4                	jne    7c0 <printf+0x1a0>
 7dc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7df:	31 d2                	xor    %edx,%edx
 7e1:	e9 8e fe ff ff       	jmp    674 <printf+0x54>
