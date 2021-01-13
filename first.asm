
_first:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void shahenda(){
thread_create(&frsttst,NULL,NULL);
exit();
}

int main(int argc , char *argv[]){
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	51                   	push   %ecx
  12:	83 ec 04             	sub    $0x4,%esp

printf(1,"THE FIRST XV6 PROGRAM %d\n",getyear());
  15:	e8 3b 05 00 00       	call   555 <getyear>
  1a:	83 ec 04             	sub    $0x4,%esp
  1d:	50                   	push   %eax
  1e:	68 15 08 00 00       	push   $0x815
  23:	6a 01                	push   $0x1
  25:	e8 16 06 00 00       	call   640 <printf>
printf(1,"NEW YEAR \n");
  2a:	58                   	pop    %eax
  2b:	5a                   	pop    %edx
  2c:	68 2f 08 00 00       	push   $0x82f
  31:	6a 01                	push   $0x1
  33:	e8 08 06 00 00       	call   640 <printf>
printf(1, "countr systm call %d\n",getreadcount());
  38:	e8 20 05 00 00       	call   55d <getreadcount>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	50                   	push   %eax
  41:	68 3a 08 00 00       	push   $0x83a
  46:	6a 01                	push   $0x1
  48:	e8 f3 05 00 00       	call   640 <printf>
shahenda();
  4d:	e8 2e 00 00 00       	call   80 <shahenda>
  52:	66 90                	xchg   %ax,%ax
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <frsttst>:
void frsttst(){
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	83 ec 10             	sub    $0x10,%esp
printf(1,"I'm a thread");
  6a:	68 08 08 00 00       	push   $0x808
  6f:	6a 01                	push   $0x1
  71:	e8 ca 05 00 00       	call   640 <printf>
}
  76:	83 c4 10             	add    $0x10,%esp
  79:	c9                   	leave  
  7a:	c3                   	ret    
  7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  7f:	90                   	nop

00000080 <shahenda>:
void shahenda(){
  80:	f3 0f 1e fb          	endbr32 
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	83 ec 0c             	sub    $0xc,%esp
thread_create(&frsttst,NULL,NULL);
  8a:	6a 00                	push   $0x0
  8c:	6a 00                	push   $0x0
  8e:	68 60 00 00 00       	push   $0x60
  93:	e8 08 04 00 00       	call   4a0 <thread_create>
exit();
  98:	e8 30 04 00 00       	call   4cd <exit>
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  a5:	31 c0                	xor    %eax,%eax
{
  a7:	89 e5                	mov    %esp,%ebp
  a9:	53                   	push   %ebx
  aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	84 d2                	test   %dl,%dl
  bc:	75 f2                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  be:	89 c8                	mov    %ecx,%eax
  c0:	5b                   	pop    %ebx
  c1:	5d                   	pop    %ebp
  c2:	c3                   	ret    
  c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	f3 0f 1e fb          	endbr32 
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  d7:	53                   	push   %ebx
  d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  de:	0f b6 01             	movzbl (%ecx),%eax
  e1:	0f b6 1a             	movzbl (%edx),%ebx
  e4:	84 c0                	test   %al,%al
  e6:	75 19                	jne    101 <strcmp+0x31>
  e8:	eb 26                	jmp    110 <strcmp+0x40>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  f4:	83 c1 01             	add    $0x1,%ecx
  f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  fa:	0f b6 1a             	movzbl (%edx),%ebx
  fd:	84 c0                	test   %al,%al
  ff:	74 0f                	je     110 <strcmp+0x40>
 101:	38 d8                	cmp    %bl,%al
 103:	74 eb                	je     f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 105:	29 d8                	sub    %ebx,%eax
}
 107:	5b                   	pop    %ebx
 108:	5d                   	pop    %ebp
 109:	c3                   	ret    
 10a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 110:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 112:	29 d8                	sub    %ebx,%eax
}
 114:	5b                   	pop    %ebx
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11e:	66 90                	xchg   %ax,%ax

00000120 <strlen>:

uint
strlen(const char *s)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 12a:	80 3a 00             	cmpb   $0x0,(%edx)
 12d:	74 21                	je     150 <strlen+0x30>
 12f:	31 c0                	xor    %eax,%eax
 131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 138:	83 c0 01             	add    $0x1,%eax
 13b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 13f:	89 c1                	mov    %eax,%ecx
 141:	75 f5                	jne    138 <strlen+0x18>
    ;
  return n;
}
 143:	89 c8                	mov    %ecx,%eax
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 150:	31 c9                	xor    %ecx,%ecx
}
 152:	5d                   	pop    %ebp
 153:	89 c8                	mov    %ecx,%eax
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi

00000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	57                   	push   %edi
 168:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 16b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16e:	8b 45 0c             	mov    0xc(%ebp),%eax
 171:	89 d7                	mov    %edx,%edi
 173:	fc                   	cld    
 174:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 176:	89 d0                	mov    %edx,%eax
 178:	5f                   	pop    %edi
 179:	5d                   	pop    %ebp
 17a:	c3                   	ret    
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strchr>:

char*
strchr(const char *s, char c)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 18e:	0f b6 10             	movzbl (%eax),%edx
 191:	84 d2                	test   %dl,%dl
 193:	75 16                	jne    1ab <strchr+0x2b>
 195:	eb 21                	jmp    1b8 <strchr+0x38>
 197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19e:	66 90                	xchg   %ax,%ax
 1a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1a4:	83 c0 01             	add    $0x1,%eax
 1a7:	84 d2                	test   %dl,%dl
 1a9:	74 0d                	je     1b8 <strchr+0x38>
    if(*s == c)
 1ab:	38 d1                	cmp    %dl,%cl
 1ad:	75 f1                	jne    1a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1b8:	31 c0                	xor    %eax,%eax
}
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <gets>:

char*
gets(char *buf, int max)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c9:	31 f6                	xor    %esi,%esi
{
 1cb:	53                   	push   %ebx
 1cc:	89 f3                	mov    %esi,%ebx
 1ce:	83 ec 1c             	sub    $0x1c,%esp
 1d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1d4:	eb 33                	jmp    209 <gets+0x49>
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1e6:	6a 01                	push   $0x1
 1e8:	50                   	push   %eax
 1e9:	6a 00                	push   $0x0
 1eb:	e8 f5 02 00 00       	call   4e5 <read>
    if(cc < 1)
 1f0:	83 c4 10             	add    $0x10,%esp
 1f3:	85 c0                	test   %eax,%eax
 1f5:	7e 1c                	jle    213 <gets+0x53>
      break;
    buf[i++] = c;
 1f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1fb:	83 c7 01             	add    $0x1,%edi
 1fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 201:	3c 0a                	cmp    $0xa,%al
 203:	74 23                	je     228 <gets+0x68>
 205:	3c 0d                	cmp    $0xd,%al
 207:	74 1f                	je     228 <gets+0x68>
  for(i=0; i+1 < max; ){
 209:	83 c3 01             	add    $0x1,%ebx
 20c:	89 fe                	mov    %edi,%esi
 20e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 211:	7c cd                	jl     1e0 <gets+0x20>
 213:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 215:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 218:	c6 03 00             	movb   $0x0,(%ebx)
}
 21b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21e:	5b                   	pop    %ebx
 21f:	5e                   	pop    %esi
 220:	5f                   	pop    %edi
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 227:	90                   	nop
 228:	8b 75 08             	mov    0x8(%ebp),%esi
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
 22e:	01 de                	add    %ebx,%esi
 230:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 232:	c6 03 00             	movb   $0x0,(%ebx)
}
 235:	8d 65 f4             	lea    -0xc(%ebp),%esp
 238:	5b                   	pop    %ebx
 239:	5e                   	pop    %esi
 23a:	5f                   	pop    %edi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <stat>:

int
stat(const char *n, struct stat *st)
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	56                   	push   %esi
 248:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 249:	83 ec 08             	sub    $0x8,%esp
 24c:	6a 00                	push   $0x0
 24e:	ff 75 08             	pushl  0x8(%ebp)
 251:	e8 b7 02 00 00       	call   50d <open>
  if(fd < 0)
 256:	83 c4 10             	add    $0x10,%esp
 259:	85 c0                	test   %eax,%eax
 25b:	78 2b                	js     288 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 25d:	83 ec 08             	sub    $0x8,%esp
 260:	ff 75 0c             	pushl  0xc(%ebp)
 263:	89 c3                	mov    %eax,%ebx
 265:	50                   	push   %eax
 266:	e8 ba 02 00 00       	call   525 <fstat>
  close(fd);
 26b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 26e:	89 c6                	mov    %eax,%esi
  close(fd);
 270:	e8 80 02 00 00       	call   4f5 <close>
  return r;
 275:	83 c4 10             	add    $0x10,%esp
}
 278:	8d 65 f8             	lea    -0x8(%ebp),%esp
 27b:	89 f0                	mov    %esi,%eax
 27d:	5b                   	pop    %ebx
 27e:	5e                   	pop    %esi
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    
 281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 288:	be ff ff ff ff       	mov    $0xffffffff,%esi
 28d:	eb e9                	jmp    278 <stat+0x38>
 28f:	90                   	nop

00000290 <atoi>:

int
atoi(const char *s)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	53                   	push   %ebx
 298:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 29b:	0f be 02             	movsbl (%edx),%eax
 29e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2a9:	77 1a                	ja     2c5 <atoi+0x35>
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop
    n = n*10 + *s++ - '0';
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ba:	0f be 02             	movsbl (%edx),%eax
 2bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
  return n;
}
 2c5:	89 c8                	mov    %ecx,%eax
 2c7:	5b                   	pop    %ebx
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	57                   	push   %edi
 2d8:	8b 45 10             	mov    0x10(%ebp),%eax
 2db:	8b 55 08             	mov    0x8(%ebp),%edx
 2de:	56                   	push   %esi
 2df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2e2:	85 c0                	test   %eax,%eax
 2e4:	7e 0f                	jle    2f5 <memmove+0x25>
 2e6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2e8:	89 d7                	mov    %edx,%edi
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2f1:	39 f8                	cmp    %edi,%eax
 2f3:	75 fb                	jne    2f0 <memmove+0x20>
  return vdst;
}
 2f5:	5e                   	pop    %esi
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5f                   	pop    %edi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret    
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop

00000300 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 305:	a1 5c 0b 00 00       	mov    0xb5c,%eax
{
 30a:	89 e5                	mov    %esp,%ebp
 30c:	57                   	push   %edi
 30d:	56                   	push   %esi
 30e:	53                   	push   %ebx
 30f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 312:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 314:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 317:	39 c8                	cmp    %ecx,%eax
 319:	73 15                	jae    330 <free+0x30>
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop
 320:	39 d1                	cmp    %edx,%ecx
 322:	72 14                	jb     338 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 324:	39 d0                	cmp    %edx,%eax
 326:	73 10                	jae    338 <free+0x38>
{
 328:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 32a:	8b 10                	mov    (%eax),%edx
 32c:	39 c8                	cmp    %ecx,%eax
 32e:	72 f0                	jb     320 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 330:	39 d0                	cmp    %edx,%eax
 332:	72 f4                	jb     328 <free+0x28>
 334:	39 d1                	cmp    %edx,%ecx
 336:	73 f0                	jae    328 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 338:	8b 73 fc             	mov    -0x4(%ebx),%esi
 33b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 33e:	39 fa                	cmp    %edi,%edx
 340:	74 1e                	je     360 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 342:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 345:	8b 50 04             	mov    0x4(%eax),%edx
 348:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 34b:	39 f1                	cmp    %esi,%ecx
 34d:	74 28                	je     377 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 34f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 351:	5b                   	pop    %ebx
  freep = p;
 352:	a3 5c 0b 00 00       	mov    %eax,0xb5c
}
 357:	5e                   	pop    %esi
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 360:	03 72 04             	add    0x4(%edx),%esi
 363:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 366:	8b 10                	mov    (%eax),%edx
 368:	8b 12                	mov    (%edx),%edx
 36a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 36d:	8b 50 04             	mov    0x4(%eax),%edx
 370:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 373:	39 f1                	cmp    %esi,%ecx
 375:	75 d8                	jne    34f <free+0x4f>
    p->s.size += bp->s.size;
 377:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 37a:	a3 5c 0b 00 00       	mov    %eax,0xb5c
    p->s.size += bp->s.size;
 37f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 382:	8b 53 f8             	mov    -0x8(%ebx),%edx
 385:	89 10                	mov    %edx,(%eax)
}
 387:	5b                   	pop    %ebx
 388:	5e                   	pop    %esi
 389:	5f                   	pop    %edi
 38a:	5d                   	pop    %ebp
 38b:	c3                   	ret    
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000390 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	57                   	push   %edi
 398:	56                   	push   %esi
 399:	53                   	push   %ebx
 39a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 39d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 3a0:	8b 3d 5c 0b 00 00    	mov    0xb5c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 3a6:	8d 70 07             	lea    0x7(%eax),%esi
 3a9:	c1 ee 03             	shr    $0x3,%esi
 3ac:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 3af:	85 ff                	test   %edi,%edi
 3b1:	0f 84 a9 00 00 00    	je     460 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3b7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 3b9:	8b 48 04             	mov    0x4(%eax),%ecx
 3bc:	39 f1                	cmp    %esi,%ecx
 3be:	73 6d                	jae    42d <malloc+0x9d>
 3c0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 3c6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 3cb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 3ce:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 3d5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 3d8:	eb 17                	jmp    3f1 <malloc+0x61>
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 3e0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 3e2:	8b 4a 04             	mov    0x4(%edx),%ecx
 3e5:	39 f1                	cmp    %esi,%ecx
 3e7:	73 4f                	jae    438 <malloc+0xa8>
 3e9:	8b 3d 5c 0b 00 00    	mov    0xb5c,%edi
 3ef:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 3f1:	39 c7                	cmp    %eax,%edi
 3f3:	75 eb                	jne    3e0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 3f5:	83 ec 0c             	sub    $0xc,%esp
 3f8:	ff 75 e4             	pushl  -0x1c(%ebp)
 3fb:	e8 65 01 00 00       	call   565 <sbrk>
  if(p == (char*)-1)
 400:	83 c4 10             	add    $0x10,%esp
 403:	83 f8 ff             	cmp    $0xffffffff,%eax
 406:	74 1b                	je     423 <malloc+0x93>
  hp->s.size = nu;
 408:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 40b:	83 ec 0c             	sub    $0xc,%esp
 40e:	83 c0 08             	add    $0x8,%eax
 411:	50                   	push   %eax
 412:	e8 e9 fe ff ff       	call   300 <free>
  return freep;
 417:	a1 5c 0b 00 00       	mov    0xb5c,%eax
      if((p = morecore(nunits)) == 0)
 41c:	83 c4 10             	add    $0x10,%esp
 41f:	85 c0                	test   %eax,%eax
 421:	75 bd                	jne    3e0 <malloc+0x50>
        return 0;
  }
}
 423:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 426:	31 c0                	xor    %eax,%eax
}
 428:	5b                   	pop    %ebx
 429:	5e                   	pop    %esi
 42a:	5f                   	pop    %edi
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret    
    if(p->s.size >= nunits){
 42d:	89 c2                	mov    %eax,%edx
 42f:	89 f8                	mov    %edi,%eax
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 438:	39 ce                	cmp    %ecx,%esi
 43a:	74 54                	je     490 <malloc+0x100>
        p->s.size -= nunits;
 43c:	29 f1                	sub    %esi,%ecx
 43e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 441:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 444:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 447:	a3 5c 0b 00 00       	mov    %eax,0xb5c
}
 44c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 44f:	8d 42 08             	lea    0x8(%edx),%eax
}
 452:	5b                   	pop    %ebx
 453:	5e                   	pop    %esi
 454:	5f                   	pop    %edi
 455:	5d                   	pop    %ebp
 456:	c3                   	ret    
 457:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 460:	c7 05 5c 0b 00 00 60 	movl   $0xb60,0xb5c
 467:	0b 00 00 
    base.s.size = 0;
 46a:	bf 60 0b 00 00       	mov    $0xb60,%edi
    base.s.ptr = freep = prevp = &base;
 46f:	c7 05 60 0b 00 00 60 	movl   $0xb60,0xb60
 476:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 479:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 47b:	c7 05 64 0b 00 00 00 	movl   $0x0,0xb64
 482:	00 00 00 
    if(p->s.size >= nunits){
 485:	e9 36 ff ff ff       	jmp    3c0 <malloc+0x30>
 48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 490:	8b 0a                	mov    (%edx),%ecx
 492:	89 08                	mov    %ecx,(%eax)
 494:	eb b1                	jmp    447 <malloc+0xb7>
 496:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49d:	8d 76 00             	lea    0x0(%esi),%esi

000004a0 <thread_create>:
{
 4a0:	f3 0f 1e fb          	endbr32 
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 4aa:	68 00 10 00 00       	push   $0x1000
 4af:	e8 dc fe ff ff       	call   390 <malloc>
return clone(start_routine,arg1,arg2,stack);
 4b4:	50                   	push   %eax
 4b5:	ff 75 10             	pushl  0x10(%ebp)
 4b8:	ff 75 0c             	pushl  0xc(%ebp)
 4bb:	ff 75 08             	pushl  0x8(%ebp)
 4be:	e8 ba 00 00 00       	call   57d <clone>
}
 4c3:	c9                   	leave  
 4c4:	c3                   	ret    

000004c5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4c5:	b8 01 00 00 00       	mov    $0x1,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <exit>:
SYSCALL(exit)
 4cd:	b8 02 00 00 00       	mov    $0x2,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <wait>:
SYSCALL(wait)
 4d5:	b8 03 00 00 00       	mov    $0x3,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <pipe>:
SYSCALL(pipe)
 4dd:	b8 04 00 00 00       	mov    $0x4,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <read>:
SYSCALL(read)
 4e5:	b8 05 00 00 00       	mov    $0x5,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <write>:
SYSCALL(write)
 4ed:	b8 10 00 00 00       	mov    $0x10,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <close>:
SYSCALL(close)
 4f5:	b8 15 00 00 00       	mov    $0x15,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <kill>:
SYSCALL(kill)
 4fd:	b8 06 00 00 00       	mov    $0x6,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <exec>:
SYSCALL(exec)
 505:	b8 07 00 00 00       	mov    $0x7,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <open>:
SYSCALL(open)
 50d:	b8 0f 00 00 00       	mov    $0xf,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <mknod>:
SYSCALL(mknod)
 515:	b8 11 00 00 00       	mov    $0x11,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <unlink>:
SYSCALL(unlink)
 51d:	b8 12 00 00 00       	mov    $0x12,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <fstat>:
SYSCALL(fstat)
 525:	b8 08 00 00 00       	mov    $0x8,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <link>:
SYSCALL(link)
 52d:	b8 13 00 00 00       	mov    $0x13,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <mkdir>:
SYSCALL(mkdir)
 535:	b8 14 00 00 00       	mov    $0x14,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <chdir>:
SYSCALL(chdir)
 53d:	b8 09 00 00 00       	mov    $0x9,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <dup>:
SYSCALL(dup)
 545:	b8 0a 00 00 00       	mov    $0xa,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <getpid>:
SYSCALL(getpid)
 54d:	b8 0b 00 00 00       	mov    $0xb,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <getyear>:
SYSCALL(getyear)
 555:	b8 16 00 00 00       	mov    $0x16,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <getreadcount>:
SYSCALL(getreadcount)
 55d:	b8 17 00 00 00       	mov    $0x17,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <sbrk>:
SYSCALL(sbrk)
 565:	b8 0c 00 00 00       	mov    $0xc,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <sleep>:
SYSCALL(sleep)
 56d:	b8 0d 00 00 00       	mov    $0xd,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <uptime>:
SYSCALL(uptime)
 575:	b8 0e 00 00 00       	mov    $0xe,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <clone>:
SYSCALL(clone)
 57d:	b8 18 00 00 00       	mov    $0x18,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    
 585:	66 90                	xchg   %ax,%ax
 587:	66 90                	xchg   %ax,%ax
 589:	66 90                	xchg   %ax,%ax
 58b:	66 90                	xchg   %ax,%ax
 58d:	66 90                	xchg   %ax,%ax
 58f:	90                   	nop

00000590 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 3c             	sub    $0x3c,%esp
 599:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 59c:	89 d1                	mov    %edx,%ecx
{
 59e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5a1:	85 d2                	test   %edx,%edx
 5a3:	0f 89 7f 00 00 00    	jns    628 <printint+0x98>
 5a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5ad:	74 79                	je     628 <printint+0x98>
    neg = 1;
 5af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5b8:	31 db                	xor    %ebx,%ebx
 5ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5c0:	89 c8                	mov    %ecx,%eax
 5c2:	31 d2                	xor    %edx,%edx
 5c4:	89 cf                	mov    %ecx,%edi
 5c6:	f7 75 c4             	divl   -0x3c(%ebp)
 5c9:	0f b6 92 58 08 00 00 	movzbl 0x858(%edx),%edx
 5d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5d3:	89 d8                	mov    %ebx,%eax
 5d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5e1:	76 dd                	jbe    5c0 <printint+0x30>
  if(neg)
 5e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5e6:	85 c9                	test   %ecx,%ecx
 5e8:	74 0c                	je     5f6 <printint+0x66>
    buf[i++] = '-';
 5ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5fd:	eb 07                	jmp    606 <printint+0x76>
 5ff:	90                   	nop
 600:	0f b6 13             	movzbl (%ebx),%edx
 603:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 606:	83 ec 04             	sub    $0x4,%esp
 609:	88 55 d7             	mov    %dl,-0x29(%ebp)
 60c:	6a 01                	push   $0x1
 60e:	56                   	push   %esi
 60f:	57                   	push   %edi
 610:	e8 d8 fe ff ff       	call   4ed <write>
  while(--i >= 0)
 615:	83 c4 10             	add    $0x10,%esp
 618:	39 de                	cmp    %ebx,%esi
 61a:	75 e4                	jne    600 <printint+0x70>
    putc(fd, buf[i]);
}
 61c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61f:	5b                   	pop    %ebx
 620:	5e                   	pop    %esi
 621:	5f                   	pop    %edi
 622:	5d                   	pop    %ebp
 623:	c3                   	ret    
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 628:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 62f:	eb 87                	jmp    5b8 <printint+0x28>
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop

00000640 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 640:	f3 0f 1e fb          	endbr32 
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 64d:	8b 75 0c             	mov    0xc(%ebp),%esi
 650:	0f b6 1e             	movzbl (%esi),%ebx
 653:	84 db                	test   %bl,%bl
 655:	0f 84 b4 00 00 00    	je     70f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 65b:	8d 45 10             	lea    0x10(%ebp),%eax
 65e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 661:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 664:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 666:	89 45 d0             	mov    %eax,-0x30(%ebp)
 669:	eb 33                	jmp    69e <printf+0x5e>
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
 670:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 673:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 678:	83 f8 25             	cmp    $0x25,%eax
 67b:	74 17                	je     694 <printf+0x54>
  write(fd, &c, 1);
 67d:	83 ec 04             	sub    $0x4,%esp
 680:	88 5d e7             	mov    %bl,-0x19(%ebp)
 683:	6a 01                	push   $0x1
 685:	57                   	push   %edi
 686:	ff 75 08             	pushl  0x8(%ebp)
 689:	e8 5f fe ff ff       	call   4ed <write>
 68e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 691:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 694:	0f b6 1e             	movzbl (%esi),%ebx
 697:	83 c6 01             	add    $0x1,%esi
 69a:	84 db                	test   %bl,%bl
 69c:	74 71                	je     70f <printf+0xcf>
    c = fmt[i] & 0xff;
 69e:	0f be cb             	movsbl %bl,%ecx
 6a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6a4:	85 d2                	test   %edx,%edx
 6a6:	74 c8                	je     670 <printf+0x30>
      }
    } else if(state == '%'){
 6a8:	83 fa 25             	cmp    $0x25,%edx
 6ab:	75 e7                	jne    694 <printf+0x54>
      if(c == 'd'){
 6ad:	83 f8 64             	cmp    $0x64,%eax
 6b0:	0f 84 9a 00 00 00    	je     750 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6bc:	83 f9 70             	cmp    $0x70,%ecx
 6bf:	74 5f                	je     720 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6c1:	83 f8 73             	cmp    $0x73,%eax
 6c4:	0f 84 d6 00 00 00    	je     7a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ca:	83 f8 63             	cmp    $0x63,%eax
 6cd:	0f 84 8d 00 00 00    	je     760 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6d3:	83 f8 25             	cmp    $0x25,%eax
 6d6:	0f 84 b4 00 00 00    	je     790 <printf+0x150>
  write(fd, &c, 1);
 6dc:	83 ec 04             	sub    $0x4,%esp
 6df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6e3:	6a 01                	push   $0x1
 6e5:	57                   	push   %edi
 6e6:	ff 75 08             	pushl  0x8(%ebp)
 6e9:	e8 ff fd ff ff       	call   4ed <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6f1:	83 c4 0c             	add    $0xc,%esp
 6f4:	6a 01                	push   $0x1
 6f6:	83 c6 01             	add    $0x1,%esi
 6f9:	57                   	push   %edi
 6fa:	ff 75 08             	pushl  0x8(%ebp)
 6fd:	e8 eb fd ff ff       	call   4ed <write>
  for(i = 0; fmt[i]; i++){
 702:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 706:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 709:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 70b:	84 db                	test   %bl,%bl
 70d:	75 8f                	jne    69e <printf+0x5e>
    }
  }
}
 70f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 712:	5b                   	pop    %ebx
 713:	5e                   	pop    %esi
 714:	5f                   	pop    %edi
 715:	5d                   	pop    %ebp
 716:	c3                   	ret    
 717:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 10 00 00 00       	mov    $0x10,%ecx
 728:	6a 00                	push   $0x0
 72a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	8b 13                	mov    (%ebx),%edx
 732:	e8 59 fe ff ff       	call   590 <printint>
        ap++;
 737:	89 d8                	mov    %ebx,%eax
 739:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73c:	31 d2                	xor    %edx,%edx
        ap++;
 73e:	83 c0 04             	add    $0x4,%eax
 741:	89 45 d0             	mov    %eax,-0x30(%ebp)
 744:	e9 4b ff ff ff       	jmp    694 <printf+0x54>
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 0a 00 00 00       	mov    $0xa,%ecx
 758:	6a 01                	push   $0x1
 75a:	eb ce                	jmp    72a <printf+0xea>
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 760:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 763:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 766:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 768:	6a 01                	push   $0x1
        ap++;
 76a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 76d:	57                   	push   %edi
 76e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 771:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 774:	e8 74 fd ff ff       	call   4ed <write>
        ap++;
 779:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 77c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77f:	31 d2                	xor    %edx,%edx
 781:	e9 0e ff ff ff       	jmp    694 <printf+0x54>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 790:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
 796:	e9 59 ff ff ff       	jmp    6f4 <printf+0xb4>
 79b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
        s = (char*)*ap;
 7a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7a3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7a5:	83 c0 04             	add    $0x4,%eax
 7a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7ab:	85 db                	test   %ebx,%ebx
 7ad:	74 17                	je     7c6 <printf+0x186>
        while(*s != 0){
 7af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7b4:	84 c0                	test   %al,%al
 7b6:	0f 84 d8 fe ff ff    	je     694 <printf+0x54>
 7bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7bf:	89 de                	mov    %ebx,%esi
 7c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7c4:	eb 1a                	jmp    7e0 <printf+0x1a0>
          s = "(null)";
 7c6:	bb 50 08 00 00       	mov    $0x850,%ebx
        while(*s != 0){
 7cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ce:	b8 28 00 00 00       	mov    $0x28,%eax
 7d3:	89 de                	mov    %ebx,%esi
 7d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
  write(fd, &c, 1);
 7e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7e3:	83 c6 01             	add    $0x1,%esi
 7e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7e9:	6a 01                	push   $0x1
 7eb:	57                   	push   %edi
 7ec:	53                   	push   %ebx
 7ed:	e8 fb fc ff ff       	call   4ed <write>
        while(*s != 0){
 7f2:	0f b6 06             	movzbl (%esi),%eax
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	84 c0                	test   %al,%al
 7fa:	75 e4                	jne    7e0 <printf+0x1a0>
 7fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7ff:	31 d2                	xor    %edx,%edx
 801:	e9 8e fe ff ff       	jmp    694 <printf+0x54>
