
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
  40:	e8 a8 04 00 00       	call   4ed <kill>
  for(i=1; i<argc; i++)
  45:	83 c4 10             	add    $0x10,%esp
  48:	39 f3                	cmp    %esi,%ebx
  4a:	75 e4                	jne    30 <main+0x30>
  exit();
  4c:	e8 6c 04 00 00       	call   4bd <exit>
    printf(2, "usage: kill pid...\n");
  51:	50                   	push   %eax
  52:	50                   	push   %eax
  53:	68 f8 07 00 00       	push   $0x7f8
  58:	6a 02                	push   $0x2
  5a:	e8 d1 05 00 00       	call   630 <printf>
    exit();
  5f:	e8 59 04 00 00       	call   4bd <exit>
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
 1bb:	e8 15 03 00 00       	call   4d5 <read>
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
 221:	e8 d7 02 00 00       	call   4fd <open>
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
 236:	e8 da 02 00 00       	call   515 <fstat>
  close(fd);
 23b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23e:	89 c6                	mov    %eax,%esi
  close(fd);
 240:	e8 a0 02 00 00       	call   4e5 <close>
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
 2de:	e8 92 02 00 00       	call   575 <join>
  
  return x;
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    
 2e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 2f5:	a1 04 0b 00 00       	mov    0xb04,%eax
{
 2fa:	89 e5                	mov    %esp,%ebp
 2fc:	57                   	push   %edi
 2fd:	56                   	push   %esi
 2fe:	53                   	push   %ebx
 2ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 302:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 304:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 307:	39 c8                	cmp    %ecx,%eax
 309:	73 15                	jae    320 <free+0x30>
 30b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop
 310:	39 d1                	cmp    %edx,%ecx
 312:	72 14                	jb     328 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 314:	39 d0                	cmp    %edx,%eax
 316:	73 10                	jae    328 <free+0x38>
{
 318:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 31a:	8b 10                	mov    (%eax),%edx
 31c:	39 c8                	cmp    %ecx,%eax
 31e:	72 f0                	jb     310 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 320:	39 d0                	cmp    %edx,%eax
 322:	72 f4                	jb     318 <free+0x28>
 324:	39 d1                	cmp    %edx,%ecx
 326:	73 f0                	jae    318 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 328:	8b 73 fc             	mov    -0x4(%ebx),%esi
 32b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 32e:	39 fa                	cmp    %edi,%edx
 330:	74 1e                	je     350 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 332:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 335:	8b 50 04             	mov    0x4(%eax),%edx
 338:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 33b:	39 f1                	cmp    %esi,%ecx
 33d:	74 28                	je     367 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 33f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 341:	5b                   	pop    %ebx
  freep = p;
 342:	a3 04 0b 00 00       	mov    %eax,0xb04
}
 347:	5e                   	pop    %esi
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 350:	03 72 04             	add    0x4(%edx),%esi
 353:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 356:	8b 10                	mov    (%eax),%edx
 358:	8b 12                	mov    (%edx),%edx
 35a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 35d:	8b 50 04             	mov    0x4(%eax),%edx
 360:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 363:	39 f1                	cmp    %esi,%ecx
 365:	75 d8                	jne    33f <free+0x4f>
    p->s.size += bp->s.size;
 367:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 36a:	a3 04 0b 00 00       	mov    %eax,0xb04
    p->s.size += bp->s.size;
 36f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 372:	8b 53 f8             	mov    -0x8(%ebx),%edx
 375:	89 10                	mov    %edx,(%eax)
}
 377:	5b                   	pop    %ebx
 378:	5e                   	pop    %esi
 379:	5f                   	pop    %edi
 37a:	5d                   	pop    %ebp
 37b:	c3                   	ret    
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	56                   	push   %esi
 389:	53                   	push   %ebx
 38a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 390:	8b 3d 04 0b 00 00    	mov    0xb04,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 396:	8d 70 07             	lea    0x7(%eax),%esi
 399:	c1 ee 03             	shr    $0x3,%esi
 39c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 39f:	85 ff                	test   %edi,%edi
 3a1:	0f 84 a9 00 00 00    	je     450 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3a7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 3a9:	8b 48 04             	mov    0x4(%eax),%ecx
 3ac:	39 f1                	cmp    %esi,%ecx
 3ae:	73 6d                	jae    41d <malloc+0x9d>
 3b0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 3b6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 3bb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 3be:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 3c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 3c8:	eb 17                	jmp    3e1 <malloc+0x61>
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3d0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 3d2:	8b 4a 04             	mov    0x4(%edx),%ecx
 3d5:	39 f1                	cmp    %esi,%ecx
 3d7:	73 4f                	jae    428 <malloc+0xa8>
 3d9:	8b 3d 04 0b 00 00    	mov    0xb04,%edi
 3df:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 3e1:	39 c7                	cmp    %eax,%edi
 3e3:	75 eb                	jne    3d0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 3e5:	83 ec 0c             	sub    $0xc,%esp
 3e8:	ff 75 e4             	pushl  -0x1c(%ebp)
 3eb:	e8 65 01 00 00       	call   555 <sbrk>
  if(p == (char*)-1)
 3f0:	83 c4 10             	add    $0x10,%esp
 3f3:	83 f8 ff             	cmp    $0xffffffff,%eax
 3f6:	74 1b                	je     413 <malloc+0x93>
  hp->s.size = nu;
 3f8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 3fb:	83 ec 0c             	sub    $0xc,%esp
 3fe:	83 c0 08             	add    $0x8,%eax
 401:	50                   	push   %eax
 402:	e8 e9 fe ff ff       	call   2f0 <free>
  return freep;
 407:	a1 04 0b 00 00       	mov    0xb04,%eax
      if((p = morecore(nunits)) == 0)
 40c:	83 c4 10             	add    $0x10,%esp
 40f:	85 c0                	test   %eax,%eax
 411:	75 bd                	jne    3d0 <malloc+0x50>
        return 0;
  }
}
 413:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 416:	31 c0                	xor    %eax,%eax
}
 418:	5b                   	pop    %ebx
 419:	5e                   	pop    %esi
 41a:	5f                   	pop    %edi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
    if(p->s.size >= nunits){
 41d:	89 c2                	mov    %eax,%edx
 41f:	89 f8                	mov    %edi,%eax
 421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 428:	39 ce                	cmp    %ecx,%esi
 42a:	74 54                	je     480 <malloc+0x100>
        p->s.size -= nunits;
 42c:	29 f1                	sub    %esi,%ecx
 42e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 431:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 434:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 437:	a3 04 0b 00 00       	mov    %eax,0xb04
}
 43c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 43f:	8d 42 08             	lea    0x8(%edx),%eax
}
 442:	5b                   	pop    %ebx
 443:	5e                   	pop    %esi
 444:	5f                   	pop    %edi
 445:	5d                   	pop    %ebp
 446:	c3                   	ret    
 447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 450:	c7 05 04 0b 00 00 08 	movl   $0xb08,0xb04
 457:	0b 00 00 
    base.s.size = 0;
 45a:	bf 08 0b 00 00       	mov    $0xb08,%edi
    base.s.ptr = freep = prevp = &base;
 45f:	c7 05 08 0b 00 00 08 	movl   $0xb08,0xb08
 466:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 469:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 46b:	c7 05 0c 0b 00 00 00 	movl   $0x0,0xb0c
 472:	00 00 00 
    if(p->s.size >= nunits){
 475:	e9 36 ff ff ff       	jmp    3b0 <malloc+0x30>
 47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 480:	8b 0a                	mov    (%edx),%ecx
 482:	89 08                	mov    %ecx,(%eax)
 484:	eb b1                	jmp    437 <malloc+0xb7>
 486:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi

00000490 <thread_create>:
{
 490:	f3 0f 1e fb          	endbr32 
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 49a:	68 00 10 00 00       	push   $0x1000
 49f:	e8 dc fe ff ff       	call   380 <malloc>
return clone(start_routine,arg1,arg2,stack);
 4a4:	50                   	push   %eax
 4a5:	ff 75 10             	pushl  0x10(%ebp)
 4a8:	ff 75 0c             	pushl  0xc(%ebp)
 4ab:	ff 75 08             	pushl  0x8(%ebp)
 4ae:	e8 ba 00 00 00       	call   56d <clone>
}
 4b3:	c9                   	leave  
 4b4:	c3                   	ret    

000004b5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4b5:	b8 01 00 00 00       	mov    $0x1,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <exit>:
SYSCALL(exit)
 4bd:	b8 02 00 00 00       	mov    $0x2,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <wait>:
SYSCALL(wait)
 4c5:	b8 03 00 00 00       	mov    $0x3,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <pipe>:
SYSCALL(pipe)
 4cd:	b8 04 00 00 00       	mov    $0x4,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <read>:
SYSCALL(read)
 4d5:	b8 05 00 00 00       	mov    $0x5,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <write>:
SYSCALL(write)
 4dd:	b8 10 00 00 00       	mov    $0x10,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <close>:
SYSCALL(close)
 4e5:	b8 15 00 00 00       	mov    $0x15,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <kill>:
SYSCALL(kill)
 4ed:	b8 06 00 00 00       	mov    $0x6,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <exec>:
SYSCALL(exec)
 4f5:	b8 07 00 00 00       	mov    $0x7,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <open>:
SYSCALL(open)
 4fd:	b8 0f 00 00 00       	mov    $0xf,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <mknod>:
SYSCALL(mknod)
 505:	b8 11 00 00 00       	mov    $0x11,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <unlink>:
SYSCALL(unlink)
 50d:	b8 12 00 00 00       	mov    $0x12,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <fstat>:
SYSCALL(fstat)
 515:	b8 08 00 00 00       	mov    $0x8,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <link>:
SYSCALL(link)
 51d:	b8 13 00 00 00       	mov    $0x13,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <mkdir>:
SYSCALL(mkdir)
 525:	b8 14 00 00 00       	mov    $0x14,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <chdir>:
SYSCALL(chdir)
 52d:	b8 09 00 00 00       	mov    $0x9,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <dup>:
SYSCALL(dup)
 535:	b8 0a 00 00 00       	mov    $0xa,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <getpid>:
SYSCALL(getpid)
 53d:	b8 0b 00 00 00       	mov    $0xb,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <getyear>:
SYSCALL(getyear)
 545:	b8 16 00 00 00       	mov    $0x16,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <getreadcount>:
SYSCALL(getreadcount)
 54d:	b8 17 00 00 00       	mov    $0x17,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <sbrk>:
SYSCALL(sbrk)
 555:	b8 0c 00 00 00       	mov    $0xc,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <sleep>:
SYSCALL(sleep)
 55d:	b8 0d 00 00 00       	mov    $0xd,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <uptime>:
SYSCALL(uptime)
 565:	b8 0e 00 00 00       	mov    $0xe,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <clone>:
SYSCALL(clone)
 56d:	b8 18 00 00 00       	mov    $0x18,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <join>:
SYSCALL(join)
 575:	b8 19 00 00 00       	mov    $0x19,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    
 57d:	66 90                	xchg   %ax,%ax
 57f:	90                   	nop

00000580 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
 586:	83 ec 3c             	sub    $0x3c,%esp
 589:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 58c:	89 d1                	mov    %edx,%ecx
{
 58e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 591:	85 d2                	test   %edx,%edx
 593:	0f 89 7f 00 00 00    	jns    618 <printint+0x98>
 599:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 59d:	74 79                	je     618 <printint+0x98>
    neg = 1;
 59f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5a8:	31 db                	xor    %ebx,%ebx
 5aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5b0:	89 c8                	mov    %ecx,%eax
 5b2:	31 d2                	xor    %edx,%edx
 5b4:	89 cf                	mov    %ecx,%edi
 5b6:	f7 75 c4             	divl   -0x3c(%ebp)
 5b9:	0f b6 92 14 08 00 00 	movzbl 0x814(%edx),%edx
 5c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5c3:	89 d8                	mov    %ebx,%eax
 5c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5d1:	76 dd                	jbe    5b0 <printint+0x30>
  if(neg)
 5d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5d6:	85 c9                	test   %ecx,%ecx
 5d8:	74 0c                	je     5e6 <printint+0x66>
    buf[i++] = '-';
 5da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5ed:	eb 07                	jmp    5f6 <printint+0x76>
 5ef:	90                   	nop
 5f0:	0f b6 13             	movzbl (%ebx),%edx
 5f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5f6:	83 ec 04             	sub    $0x4,%esp
 5f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5fc:	6a 01                	push   $0x1
 5fe:	56                   	push   %esi
 5ff:	57                   	push   %edi
 600:	e8 d8 fe ff ff       	call   4dd <write>
  while(--i >= 0)
 605:	83 c4 10             	add    $0x10,%esp
 608:	39 de                	cmp    %ebx,%esi
 60a:	75 e4                	jne    5f0 <printint+0x70>
    putc(fd, buf[i]);
}
 60c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60f:	5b                   	pop    %ebx
 610:	5e                   	pop    %esi
 611:	5f                   	pop    %edi
 612:	5d                   	pop    %ebp
 613:	c3                   	ret    
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 618:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 61f:	eb 87                	jmp    5a8 <printint+0x28>
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop

00000630 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	57                   	push   %edi
 638:	56                   	push   %esi
 639:	53                   	push   %ebx
 63a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 63d:	8b 75 0c             	mov    0xc(%ebp),%esi
 640:	0f b6 1e             	movzbl (%esi),%ebx
 643:	84 db                	test   %bl,%bl
 645:	0f 84 b4 00 00 00    	je     6ff <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 64b:	8d 45 10             	lea    0x10(%ebp),%eax
 64e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 651:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 654:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 656:	89 45 d0             	mov    %eax,-0x30(%ebp)
 659:	eb 33                	jmp    68e <printf+0x5e>
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
 660:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 663:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 668:	83 f8 25             	cmp    $0x25,%eax
 66b:	74 17                	je     684 <printf+0x54>
  write(fd, &c, 1);
 66d:	83 ec 04             	sub    $0x4,%esp
 670:	88 5d e7             	mov    %bl,-0x19(%ebp)
 673:	6a 01                	push   $0x1
 675:	57                   	push   %edi
 676:	ff 75 08             	pushl  0x8(%ebp)
 679:	e8 5f fe ff ff       	call   4dd <write>
 67e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 681:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 684:	0f b6 1e             	movzbl (%esi),%ebx
 687:	83 c6 01             	add    $0x1,%esi
 68a:	84 db                	test   %bl,%bl
 68c:	74 71                	je     6ff <printf+0xcf>
    c = fmt[i] & 0xff;
 68e:	0f be cb             	movsbl %bl,%ecx
 691:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 694:	85 d2                	test   %edx,%edx
 696:	74 c8                	je     660 <printf+0x30>
      }
    } else if(state == '%'){
 698:	83 fa 25             	cmp    $0x25,%edx
 69b:	75 e7                	jne    684 <printf+0x54>
      if(c == 'd'){
 69d:	83 f8 64             	cmp    $0x64,%eax
 6a0:	0f 84 9a 00 00 00    	je     740 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6a6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6ac:	83 f9 70             	cmp    $0x70,%ecx
 6af:	74 5f                	je     710 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6b1:	83 f8 73             	cmp    $0x73,%eax
 6b4:	0f 84 d6 00 00 00    	je     790 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ba:	83 f8 63             	cmp    $0x63,%eax
 6bd:	0f 84 8d 00 00 00    	je     750 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6c3:	83 f8 25             	cmp    $0x25,%eax
 6c6:	0f 84 b4 00 00 00    	je     780 <printf+0x150>
  write(fd, &c, 1);
 6cc:	83 ec 04             	sub    $0x4,%esp
 6cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6d3:	6a 01                	push   $0x1
 6d5:	57                   	push   %edi
 6d6:	ff 75 08             	pushl  0x8(%ebp)
 6d9:	e8 ff fd ff ff       	call   4dd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6de:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6e1:	83 c4 0c             	add    $0xc,%esp
 6e4:	6a 01                	push   $0x1
 6e6:	83 c6 01             	add    $0x1,%esi
 6e9:	57                   	push   %edi
 6ea:	ff 75 08             	pushl  0x8(%ebp)
 6ed:	e8 eb fd ff ff       	call   4dd <write>
  for(i = 0; fmt[i]; i++){
 6f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6f6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6f9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6fb:	84 db                	test   %bl,%bl
 6fd:	75 8f                	jne    68e <printf+0x5e>
    }
  }
}
 6ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 702:	5b                   	pop    %ebx
 703:	5e                   	pop    %esi
 704:	5f                   	pop    %edi
 705:	5d                   	pop    %ebp
 706:	c3                   	ret    
 707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 10 00 00 00       	mov    $0x10,%ecx
 718:	6a 00                	push   $0x0
 71a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	8b 13                	mov    (%ebx),%edx
 722:	e8 59 fe ff ff       	call   580 <printint>
        ap++;
 727:	89 d8                	mov    %ebx,%eax
 729:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72c:	31 d2                	xor    %edx,%edx
        ap++;
 72e:	83 c0 04             	add    $0x4,%eax
 731:	89 45 d0             	mov    %eax,-0x30(%ebp)
 734:	e9 4b ff ff ff       	jmp    684 <printf+0x54>
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 0a 00 00 00       	mov    $0xa,%ecx
 748:	6a 01                	push   $0x1
 74a:	eb ce                	jmp    71a <printf+0xea>
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 750:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 756:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
        ap++;
 75a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 75d:	57                   	push   %edi
 75e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 761:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 764:	e8 74 fd ff ff       	call   4dd <write>
        ap++;
 769:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 76c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76f:	31 d2                	xor    %edx,%edx
 771:	e9 0e ff ff ff       	jmp    684 <printf+0x54>
 776:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 780:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 783:	83 ec 04             	sub    $0x4,%esp
 786:	e9 59 ff ff ff       	jmp    6e4 <printf+0xb4>
 78b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop
        s = (char*)*ap;
 790:	8b 45 d0             	mov    -0x30(%ebp),%eax
 793:	8b 18                	mov    (%eax),%ebx
        ap++;
 795:	83 c0 04             	add    $0x4,%eax
 798:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 79b:	85 db                	test   %ebx,%ebx
 79d:	74 17                	je     7b6 <printf+0x186>
        while(*s != 0){
 79f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7a2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7a4:	84 c0                	test   %al,%al
 7a6:	0f 84 d8 fe ff ff    	je     684 <printf+0x54>
 7ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7af:	89 de                	mov    %ebx,%esi
 7b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7b4:	eb 1a                	jmp    7d0 <printf+0x1a0>
          s = "(null)";
 7b6:	bb 0c 08 00 00       	mov    $0x80c,%ebx
        while(*s != 0){
 7bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7be:	b8 28 00 00 00       	mov    $0x28,%eax
 7c3:	89 de                	mov    %ebx,%esi
 7c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
  write(fd, &c, 1);
 7d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7d3:	83 c6 01             	add    $0x1,%esi
 7d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7d9:	6a 01                	push   $0x1
 7db:	57                   	push   %edi
 7dc:	53                   	push   %ebx
 7dd:	e8 fb fc ff ff       	call   4dd <write>
        while(*s != 0){
 7e2:	0f b6 06             	movzbl (%esi),%eax
 7e5:	83 c4 10             	add    $0x10,%esp
 7e8:	84 c0                	test   %al,%al
 7ea:	75 e4                	jne    7d0 <printf+0x1a0>
 7ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7ef:	31 d2                	xor    %edx,%edx
 7f1:	e9 8e fe ff ff       	jmp    684 <printf+0x54>
