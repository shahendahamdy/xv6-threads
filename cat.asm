
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	be 01 00 00 00       	mov    $0x1,%esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 18             	sub    $0x18,%esp
  1d:	8b 01                	mov    (%ecx),%eax
  1f:	8b 59 04             	mov    0x4(%ecx),%ebx
  22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  25:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  28:	83 f8 01             	cmp    $0x1,%eax
  2b:	7e 50                	jle    7d <main+0x7d>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 61 05 00 00       	call   59d <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 29 05 00 00       	call   585 <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 f4 04 00 00       	call   55d <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 bb 08 00 00       	push   $0x8bb
  71:	6a 01                	push   $0x1
  73:	e8 58 06 00 00       	call   6d0 <printf>
      exit();
  78:	e8 e0 04 00 00       	call   55d <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 d1 04 00 00       	call   55d <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	56                   	push   %esi
  98:	8b 75 08             	mov    0x8(%ebp),%esi
  9b:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  9c:	eb 19                	jmp    b7 <cat+0x27>
  9e:	66 90                	xchg   %ax,%ax
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 20 0c 00 00       	push   $0xc20
  a9:	6a 01                	push   $0x1
  ab:	e8 cd 04 00 00       	call   57d <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 20 0c 00 00       	push   $0xc20
  c4:	56                   	push   %esi
  c5:	e8 ab 04 00 00       	call   575 <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 98 08 00 00       	push   $0x898
  e4:	6a 01                	push   $0x1
  e6:	e8 e5 05 00 00       	call   6d0 <printf>
      exit();
  eb:	e8 6d 04 00 00       	call   55d <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 aa 08 00 00       	push   $0x8aa
  f7:	6a 01                	push   $0x1
  f9:	e8 d2 05 00 00       	call   6d0 <printf>
    exit();
  fe:	e8 5a 04 00 00       	call   55d <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 115:	31 c0                	xor    %eax,%eax
{
 117:	89 e5                	mov    %esp,%ebp
 119:	53                   	push   %ebx
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	89 c8                	mov    %ecx,%eax
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	53                   	push   %ebx
 148:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14e:	0f b6 01             	movzbl (%ecx),%eax
 151:	0f b6 1a             	movzbl (%edx),%ebx
 154:	84 c0                	test   %al,%al
 156:	75 19                	jne    171 <strcmp+0x31>
 158:	eb 26                	jmp    180 <strcmp+0x40>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 164:	83 c1 01             	add    $0x1,%ecx
 167:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 16a:	0f b6 1a             	movzbl (%edx),%ebx
 16d:	84 c0                	test   %al,%al
 16f:	74 0f                	je     180 <strcmp+0x40>
 171:	38 d8                	cmp    %bl,%al
 173:	74 eb                	je     160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 175:	29 d8                	sub    %ebx,%eax
}
 177:	5b                   	pop    %ebx
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 182:	29 d8                	sub    %ebx,%eax
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 19a:	80 3a 00             	cmpb   $0x0,(%edx)
 19d:	74 21                	je     1c0 <strlen+0x30>
 19f:	31 c0                	xor    %eax,%eax
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a8:	83 c0 01             	add    $0x1,%eax
 1ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1af:	89 c1                	mov    %eax,%ecx
 1b1:	75 f5                	jne    1a8 <strlen+0x18>
    ;
  return n;
}
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1de:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e1:	89 d7                	mov    %edx,%edi
 1e3:	fc                   	cld    
 1e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e6:	89 d0                	mov    %edx,%eax
 1e8:	5f                   	pop    %edi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fe:	0f b6 10             	movzbl (%eax),%edx
 201:	84 d2                	test   %dl,%dl
 203:	75 16                	jne    21b <strchr+0x2b>
 205:	eb 21                	jmp    228 <strchr+0x38>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax
 210:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 214:	83 c0 01             	add    $0x1,%eax
 217:	84 d2                	test   %dl,%dl
 219:	74 0d                	je     228 <strchr+0x38>
    if(*s == c)
 21b:	38 d1                	cmp    %dl,%cl
 21d:	75 f1                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 228:	31 c0                	xor    %eax,%eax
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	57                   	push   %edi
 238:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 239:	31 f6                	xor    %esi,%esi
{
 23b:	53                   	push   %ebx
 23c:	89 f3                	mov    %esi,%ebx
 23e:	83 ec 1c             	sub    $0x1c,%esp
 241:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 244:	eb 33                	jmp    279 <gets+0x49>
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	8d 45 e7             	lea    -0x19(%ebp),%eax
 256:	6a 01                	push   $0x1
 258:	50                   	push   %eax
 259:	6a 00                	push   $0x0
 25b:	e8 15 03 00 00       	call   575 <read>
    if(cc < 1)
 260:	83 c4 10             	add    $0x10,%esp
 263:	85 c0                	test   %eax,%eax
 265:	7e 1c                	jle    283 <gets+0x53>
      break;
    buf[i++] = c;
 267:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 26b:	83 c7 01             	add    $0x1,%edi
 26e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 271:	3c 0a                	cmp    $0xa,%al
 273:	74 23                	je     298 <gets+0x68>
 275:	3c 0d                	cmp    $0xd,%al
 277:	74 1f                	je     298 <gets+0x68>
  for(i=0; i+1 < max; ){
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	89 fe                	mov    %edi,%esi
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7c cd                	jl     250 <gets+0x20>
 283:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 285:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 288:	c6 03 00             	movb   $0x0,(%ebx)
}
 28b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28e:	5b                   	pop    %ebx
 28f:	5e                   	pop    %esi
 290:	5f                   	pop    %edi
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	8b 75 08             	mov    0x8(%ebp),%esi
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	01 de                	add    %ebx,%esi
 2a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2a2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	56                   	push   %esi
 2b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	6a 00                	push   $0x0
 2be:	ff 75 08             	pushl  0x8(%ebp)
 2c1:	e8 d7 02 00 00       	call   59d <open>
  if(fd < 0)
 2c6:	83 c4 10             	add    $0x10,%esp
 2c9:	85 c0                	test   %eax,%eax
 2cb:	78 2b                	js     2f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2cd:	83 ec 08             	sub    $0x8,%esp
 2d0:	ff 75 0c             	pushl  0xc(%ebp)
 2d3:	89 c3                	mov    %eax,%ebx
 2d5:	50                   	push   %eax
 2d6:	e8 da 02 00 00       	call   5b5 <fstat>
  close(fd);
 2db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2de:	89 c6                	mov    %eax,%esi
  close(fd);
 2e0:	e8 a0 02 00 00       	call   585 <close>
  return r;
 2e5:	83 c4 10             	add    $0x10,%esp
}
 2e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2eb:	89 f0                	mov    %esi,%eax
 2ed:	5b                   	pop    %ebx
 2ee:	5e                   	pop    %esi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    
 2f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2fd:	eb e9                	jmp    2e8 <stat+0x38>
 2ff:	90                   	nop

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	53                   	push   %ebx
 308:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 30b:	0f be 02             	movsbl (%edx),%eax
 30e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 311:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 314:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 319:	77 1a                	ja     335 <atoi+0x35>
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	89 c8                	mov    %ecx,%eax
 337:	5b                   	pop    %ebx
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	8b 45 10             	mov    0x10(%ebp),%eax
 34b:	8b 55 08             	mov    0x8(%ebp),%edx
 34e:	56                   	push   %esi
 34f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 352:	85 c0                	test   %eax,%eax
 354:	7e 0f                	jle    365 <memmove+0x25>
 356:	01 d0                	add    %edx,%eax
  dst = vdst;
 358:	89 d7                	mov    %edx,%edi
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 37a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 37d:	50                   	push   %eax
 37e:	e8 92 02 00 00       	call   615 <join>
  
  return x;
}
 383:	c9                   	leave  
 384:	c3                   	ret    
 385:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000390 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 395:	a1 00 0c 00 00       	mov    0xc00,%eax
{
 39a:	89 e5                	mov    %esp,%ebp
 39c:	57                   	push   %edi
 39d:	56                   	push   %esi
 39e:	53                   	push   %ebx
 39f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3a2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 3a4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3a7:	39 c8                	cmp    %ecx,%eax
 3a9:	73 15                	jae    3c0 <free+0x30>
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop
 3b0:	39 d1                	cmp    %edx,%ecx
 3b2:	72 14                	jb     3c8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3b4:	39 d0                	cmp    %edx,%eax
 3b6:	73 10                	jae    3c8 <free+0x38>
{
 3b8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3ba:	8b 10                	mov    (%eax),%edx
 3bc:	39 c8                	cmp    %ecx,%eax
 3be:	72 f0                	jb     3b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3c0:	39 d0                	cmp    %edx,%eax
 3c2:	72 f4                	jb     3b8 <free+0x28>
 3c4:	39 d1                	cmp    %edx,%ecx
 3c6:	73 f0                	jae    3b8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3ce:	39 fa                	cmp    %edi,%edx
 3d0:	74 1e                	je     3f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3d2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3d5:	8b 50 04             	mov    0x4(%eax),%edx
 3d8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3db:	39 f1                	cmp    %esi,%ecx
 3dd:	74 28                	je     407 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 3df:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 3e1:	5b                   	pop    %ebx
  freep = p;
 3e2:	a3 00 0c 00 00       	mov    %eax,0xc00
}
 3e7:	5e                   	pop    %esi
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 3f0:	03 72 04             	add    0x4(%edx),%esi
 3f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 3f6:	8b 10                	mov    (%eax),%edx
 3f8:	8b 12                	mov    (%edx),%edx
 3fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3fd:	8b 50 04             	mov    0x4(%eax),%edx
 400:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 403:	39 f1                	cmp    %esi,%ecx
 405:	75 d8                	jne    3df <free+0x4f>
    p->s.size += bp->s.size;
 407:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 40a:	a3 00 0c 00 00       	mov    %eax,0xc00
    p->s.size += bp->s.size;
 40f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 412:	8b 53 f8             	mov    -0x8(%ebx),%edx
 415:	89 10                	mov    %edx,(%eax)
}
 417:	5b                   	pop    %ebx
 418:	5e                   	pop    %esi
 419:	5f                   	pop    %edi
 41a:	5d                   	pop    %ebp
 41b:	c3                   	ret    
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	57                   	push   %edi
 428:	56                   	push   %esi
 429:	53                   	push   %ebx
 42a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 42d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 430:	8b 3d 00 0c 00 00    	mov    0xc00,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 436:	8d 70 07             	lea    0x7(%eax),%esi
 439:	c1 ee 03             	shr    $0x3,%esi
 43c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 43f:	85 ff                	test   %edi,%edi
 441:	0f 84 a9 00 00 00    	je     4f0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 447:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 449:	8b 48 04             	mov    0x4(%eax),%ecx
 44c:	39 f1                	cmp    %esi,%ecx
 44e:	73 6d                	jae    4bd <malloc+0x9d>
 450:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 456:	bb 00 10 00 00       	mov    $0x1000,%ebx
 45b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 45e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 465:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 468:	eb 17                	jmp    481 <malloc+0x61>
 46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 470:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 472:	8b 4a 04             	mov    0x4(%edx),%ecx
 475:	39 f1                	cmp    %esi,%ecx
 477:	73 4f                	jae    4c8 <malloc+0xa8>
 479:	8b 3d 00 0c 00 00    	mov    0xc00,%edi
 47f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 481:	39 c7                	cmp    %eax,%edi
 483:	75 eb                	jne    470 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 485:	83 ec 0c             	sub    $0xc,%esp
 488:	ff 75 e4             	pushl  -0x1c(%ebp)
 48b:	e8 65 01 00 00       	call   5f5 <sbrk>
  if(p == (char*)-1)
 490:	83 c4 10             	add    $0x10,%esp
 493:	83 f8 ff             	cmp    $0xffffffff,%eax
 496:	74 1b                	je     4b3 <malloc+0x93>
  hp->s.size = nu;
 498:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 49b:	83 ec 0c             	sub    $0xc,%esp
 49e:	83 c0 08             	add    $0x8,%eax
 4a1:	50                   	push   %eax
 4a2:	e8 e9 fe ff ff       	call   390 <free>
  return freep;
 4a7:	a1 00 0c 00 00       	mov    0xc00,%eax
      if((p = morecore(nunits)) == 0)
 4ac:	83 c4 10             	add    $0x10,%esp
 4af:	85 c0                	test   %eax,%eax
 4b1:	75 bd                	jne    470 <malloc+0x50>
        return 0;
  }
}
 4b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 4b6:	31 c0                	xor    %eax,%eax
}
 4b8:	5b                   	pop    %ebx
 4b9:	5e                   	pop    %esi
 4ba:	5f                   	pop    %edi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    
    if(p->s.size >= nunits){
 4bd:	89 c2                	mov    %eax,%edx
 4bf:	89 f8                	mov    %edi,%eax
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 4c8:	39 ce                	cmp    %ecx,%esi
 4ca:	74 54                	je     520 <malloc+0x100>
        p->s.size -= nunits;
 4cc:	29 f1                	sub    %esi,%ecx
 4ce:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 4d1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 4d4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 4d7:	a3 00 0c 00 00       	mov    %eax,0xc00
}
 4dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 4df:	8d 42 08             	lea    0x8(%edx),%eax
}
 4e2:	5b                   	pop    %ebx
 4e3:	5e                   	pop    %esi
 4e4:	5f                   	pop    %edi
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    
 4e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ee:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 4f0:	c7 05 00 0c 00 00 04 	movl   $0xc04,0xc00
 4f7:	0c 00 00 
    base.s.size = 0;
 4fa:	bf 04 0c 00 00       	mov    $0xc04,%edi
    base.s.ptr = freep = prevp = &base;
 4ff:	c7 05 04 0c 00 00 04 	movl   $0xc04,0xc04
 506:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 509:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 50b:	c7 05 08 0c 00 00 00 	movl   $0x0,0xc08
 512:	00 00 00 
    if(p->s.size >= nunits){
 515:	e9 36 ff ff ff       	jmp    450 <malloc+0x30>
 51a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 520:	8b 0a                	mov    (%edx),%ecx
 522:	89 08                	mov    %ecx,(%eax)
 524:	eb b1                	jmp    4d7 <malloc+0xb7>
 526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi

00000530 <thread_create>:
{
 530:	f3 0f 1e fb          	endbr32 
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 53a:	68 00 10 00 00       	push   $0x1000
 53f:	e8 dc fe ff ff       	call   420 <malloc>
return clone(start_routine,arg1,arg2,stack);
 544:	50                   	push   %eax
 545:	ff 75 10             	pushl  0x10(%ebp)
 548:	ff 75 0c             	pushl  0xc(%ebp)
 54b:	ff 75 08             	pushl  0x8(%ebp)
 54e:	e8 ba 00 00 00       	call   60d <clone>
}
 553:	c9                   	leave  
 554:	c3                   	ret    

00000555 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 555:	b8 01 00 00 00       	mov    $0x1,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <exit>:
SYSCALL(exit)
 55d:	b8 02 00 00 00       	mov    $0x2,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <wait>:
SYSCALL(wait)
 565:	b8 03 00 00 00       	mov    $0x3,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <pipe>:
SYSCALL(pipe)
 56d:	b8 04 00 00 00       	mov    $0x4,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <read>:
SYSCALL(read)
 575:	b8 05 00 00 00       	mov    $0x5,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <write>:
SYSCALL(write)
 57d:	b8 10 00 00 00       	mov    $0x10,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <close>:
SYSCALL(close)
 585:	b8 15 00 00 00       	mov    $0x15,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <kill>:
SYSCALL(kill)
 58d:	b8 06 00 00 00       	mov    $0x6,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <exec>:
SYSCALL(exec)
 595:	b8 07 00 00 00       	mov    $0x7,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <open>:
SYSCALL(open)
 59d:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <mknod>:
SYSCALL(mknod)
 5a5:	b8 11 00 00 00       	mov    $0x11,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <unlink>:
SYSCALL(unlink)
 5ad:	b8 12 00 00 00       	mov    $0x12,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <fstat>:
SYSCALL(fstat)
 5b5:	b8 08 00 00 00       	mov    $0x8,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <link>:
SYSCALL(link)
 5bd:	b8 13 00 00 00       	mov    $0x13,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <mkdir>:
SYSCALL(mkdir)
 5c5:	b8 14 00 00 00       	mov    $0x14,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <chdir>:
SYSCALL(chdir)
 5cd:	b8 09 00 00 00       	mov    $0x9,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <dup>:
SYSCALL(dup)
 5d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <getpid>:
SYSCALL(getpid)
 5dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <getyear>:
SYSCALL(getyear)
 5e5:	b8 16 00 00 00       	mov    $0x16,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <getreadcount>:
SYSCALL(getreadcount)
 5ed:	b8 17 00 00 00       	mov    $0x17,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <sbrk>:
SYSCALL(sbrk)
 5f5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <sleep>:
SYSCALL(sleep)
 5fd:	b8 0d 00 00 00       	mov    $0xd,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <uptime>:
SYSCALL(uptime)
 605:	b8 0e 00 00 00       	mov    $0xe,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <clone>:
SYSCALL(clone)
 60d:	b8 18 00 00 00       	mov    $0x18,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <join>:
SYSCALL(join)
 615:	b8 19 00 00 00       	mov    $0x19,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    
 61d:	66 90                	xchg   %ax,%ax
 61f:	90                   	nop

00000620 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 3c             	sub    $0x3c,%esp
 629:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 62c:	89 d1                	mov    %edx,%ecx
{
 62e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 631:	85 d2                	test   %edx,%edx
 633:	0f 89 7f 00 00 00    	jns    6b8 <printint+0x98>
 639:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 63d:	74 79                	je     6b8 <printint+0x98>
    neg = 1;
 63f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 646:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 648:	31 db                	xor    %ebx,%ebx
 64a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 650:	89 c8                	mov    %ecx,%eax
 652:	31 d2                	xor    %edx,%edx
 654:	89 cf                	mov    %ecx,%edi
 656:	f7 75 c4             	divl   -0x3c(%ebp)
 659:	0f b6 92 d8 08 00 00 	movzbl 0x8d8(%edx),%edx
 660:	89 45 c0             	mov    %eax,-0x40(%ebp)
 663:	89 d8                	mov    %ebx,%eax
 665:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 668:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 66b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 66e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 671:	76 dd                	jbe    650 <printint+0x30>
  if(neg)
 673:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 676:	85 c9                	test   %ecx,%ecx
 678:	74 0c                	je     686 <printint+0x66>
    buf[i++] = '-';
 67a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 67f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 681:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 686:	8b 7d b8             	mov    -0x48(%ebp),%edi
 689:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 68d:	eb 07                	jmp    696 <printint+0x76>
 68f:	90                   	nop
 690:	0f b6 13             	movzbl (%ebx),%edx
 693:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 696:	83 ec 04             	sub    $0x4,%esp
 699:	88 55 d7             	mov    %dl,-0x29(%ebp)
 69c:	6a 01                	push   $0x1
 69e:	56                   	push   %esi
 69f:	57                   	push   %edi
 6a0:	e8 d8 fe ff ff       	call   57d <write>
  while(--i >= 0)
 6a5:	83 c4 10             	add    $0x10,%esp
 6a8:	39 de                	cmp    %ebx,%esi
 6aa:	75 e4                	jne    690 <printint+0x70>
    putc(fd, buf[i]);
}
 6ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6af:	5b                   	pop    %ebx
 6b0:	5e                   	pop    %esi
 6b1:	5f                   	pop    %edi
 6b2:	5d                   	pop    %ebp
 6b3:	c3                   	ret    
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6bf:	eb 87                	jmp    648 <printint+0x28>
 6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop

000006d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d0:	f3 0f 1e fb          	endbr32 
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	57                   	push   %edi
 6d8:	56                   	push   %esi
 6d9:	53                   	push   %ebx
 6da:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6dd:	8b 75 0c             	mov    0xc(%ebp),%esi
 6e0:	0f b6 1e             	movzbl (%esi),%ebx
 6e3:	84 db                	test   %bl,%bl
 6e5:	0f 84 b4 00 00 00    	je     79f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6eb:	8d 45 10             	lea    0x10(%ebp),%eax
 6ee:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6f1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6f4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f9:	eb 33                	jmp    72e <printf+0x5e>
 6fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ff:	90                   	nop
 700:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 703:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 708:	83 f8 25             	cmp    $0x25,%eax
 70b:	74 17                	je     724 <printf+0x54>
  write(fd, &c, 1);
 70d:	83 ec 04             	sub    $0x4,%esp
 710:	88 5d e7             	mov    %bl,-0x19(%ebp)
 713:	6a 01                	push   $0x1
 715:	57                   	push   %edi
 716:	ff 75 08             	pushl  0x8(%ebp)
 719:	e8 5f fe ff ff       	call   57d <write>
 71e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 721:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 724:	0f b6 1e             	movzbl (%esi),%ebx
 727:	83 c6 01             	add    $0x1,%esi
 72a:	84 db                	test   %bl,%bl
 72c:	74 71                	je     79f <printf+0xcf>
    c = fmt[i] & 0xff;
 72e:	0f be cb             	movsbl %bl,%ecx
 731:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 734:	85 d2                	test   %edx,%edx
 736:	74 c8                	je     700 <printf+0x30>
      }
    } else if(state == '%'){
 738:	83 fa 25             	cmp    $0x25,%edx
 73b:	75 e7                	jne    724 <printf+0x54>
      if(c == 'd'){
 73d:	83 f8 64             	cmp    $0x64,%eax
 740:	0f 84 9a 00 00 00    	je     7e0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 746:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 74c:	83 f9 70             	cmp    $0x70,%ecx
 74f:	74 5f                	je     7b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 751:	83 f8 73             	cmp    $0x73,%eax
 754:	0f 84 d6 00 00 00    	je     830 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 75a:	83 f8 63             	cmp    $0x63,%eax
 75d:	0f 84 8d 00 00 00    	je     7f0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 763:	83 f8 25             	cmp    $0x25,%eax
 766:	0f 84 b4 00 00 00    	je     820 <printf+0x150>
  write(fd, &c, 1);
 76c:	83 ec 04             	sub    $0x4,%esp
 76f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 773:	6a 01                	push   $0x1
 775:	57                   	push   %edi
 776:	ff 75 08             	pushl  0x8(%ebp)
 779:	e8 ff fd ff ff       	call   57d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 77e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 781:	83 c4 0c             	add    $0xc,%esp
 784:	6a 01                	push   $0x1
 786:	83 c6 01             	add    $0x1,%esi
 789:	57                   	push   %edi
 78a:	ff 75 08             	pushl  0x8(%ebp)
 78d:	e8 eb fd ff ff       	call   57d <write>
  for(i = 0; fmt[i]; i++){
 792:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 796:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 799:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 79b:	84 db                	test   %bl,%bl
 79d:	75 8f                	jne    72e <printf+0x5e>
    }
  }
}
 79f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7a2:	5b                   	pop    %ebx
 7a3:	5e                   	pop    %esi
 7a4:	5f                   	pop    %edi
 7a5:	5d                   	pop    %ebp
 7a6:	c3                   	ret    
 7a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7b8:	6a 00                	push   $0x0
 7ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7bd:	8b 45 08             	mov    0x8(%ebp),%eax
 7c0:	8b 13                	mov    (%ebx),%edx
 7c2:	e8 59 fe ff ff       	call   620 <printint>
        ap++;
 7c7:	89 d8                	mov    %ebx,%eax
 7c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7cc:	31 d2                	xor    %edx,%edx
        ap++;
 7ce:	83 c0 04             	add    $0x4,%eax
 7d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7d4:	e9 4b ff ff ff       	jmp    724 <printf+0x54>
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7e8:	6a 01                	push   $0x1
 7ea:	eb ce                	jmp    7ba <printf+0xea>
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7f6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7f8:	6a 01                	push   $0x1
        ap++;
 7fa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7fd:	57                   	push   %edi
 7fe:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 801:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 804:	e8 74 fd ff ff       	call   57d <write>
        ap++;
 809:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 80c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 80f:	31 d2                	xor    %edx,%edx
 811:	e9 0e ff ff ff       	jmp    724 <printf+0x54>
 816:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 820:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 823:	83 ec 04             	sub    $0x4,%esp
 826:	e9 59 ff ff ff       	jmp    784 <printf+0xb4>
 82b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop
        s = (char*)*ap;
 830:	8b 45 d0             	mov    -0x30(%ebp),%eax
 833:	8b 18                	mov    (%eax),%ebx
        ap++;
 835:	83 c0 04             	add    $0x4,%eax
 838:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 83b:	85 db                	test   %ebx,%ebx
 83d:	74 17                	je     856 <printf+0x186>
        while(*s != 0){
 83f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 842:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 844:	84 c0                	test   %al,%al
 846:	0f 84 d8 fe ff ff    	je     724 <printf+0x54>
 84c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 84f:	89 de                	mov    %ebx,%esi
 851:	8b 5d 08             	mov    0x8(%ebp),%ebx
 854:	eb 1a                	jmp    870 <printf+0x1a0>
          s = "(null)";
 856:	bb d0 08 00 00       	mov    $0x8d0,%ebx
        while(*s != 0){
 85b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 85e:	b8 28 00 00 00       	mov    $0x28,%eax
 863:	89 de                	mov    %ebx,%esi
 865:	8b 5d 08             	mov    0x8(%ebp),%ebx
 868:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86f:	90                   	nop
  write(fd, &c, 1);
 870:	83 ec 04             	sub    $0x4,%esp
          s++;
 873:	83 c6 01             	add    $0x1,%esi
 876:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 879:	6a 01                	push   $0x1
 87b:	57                   	push   %edi
 87c:	53                   	push   %ebx
 87d:	e8 fb fc ff ff       	call   57d <write>
        while(*s != 0){
 882:	0f b6 06             	movzbl (%esi),%eax
 885:	83 c4 10             	add    $0x10,%esp
 888:	84 c0                	test   %al,%al
 88a:	75 e4                	jne    870 <printf+0x1a0>
 88c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 88f:	31 d2                	xor    %edx,%edx
 891:	e9 8e fe ff ff       	jmp    724 <printf+0x54>
