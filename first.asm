
_first:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
exit();
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
  11:	51                   	push   %ecx
  12:	83 ec 0c             	sub    $0xc,%esp
  
  printf(1, "RUNNING..\n");
  15:	68 d1 08 00 00       	push   $0x8d1
  1a:	6a 01                	push   $0x1
  1c:	e8 9f 06 00 00       	call   6c0 <printf>
  thread_create(&f1, NULL, NULL);
  21:	83 c4 0c             	add    $0xc,%esp
  24:	6a 00                	push   $0x0
  26:	6a 00                	push   $0x0
  28:	68 a0 00 00 00       	push   $0xa0
  2d:	e8 ee 04 00 00       	call   520 <thread_create>
  printf(1,"SECOND CHILD PID IS %d \n",thread_join());
  32:	e8 29 03 00 00       	call   360 <thread_join>
  37:	83 c4 0c             	add    $0xc,%esp
  3a:	50                   	push   %eax
  3b:	68 dc 08 00 00       	push   $0x8dc
  40:	6a 01                	push   $0x1
  42:	e8 79 06 00 00       	call   6c0 <printf>
  
  printf(1, "FINISHING .\n");
  47:	58                   	pop    %eax
  48:	5a                   	pop    %edx
  49:	68 f5 08 00 00       	push   $0x8f5
  4e:	6a 01                	push   $0x1
  50:	e8 6b 06 00 00       	call   6c0 <printf>
  exit();
  55:	e8 f3 04 00 00       	call   54d <exit>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <f>:
void f(void* x,void *y){
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	83 ec 10             	sub    $0x10,%esp
printf(1,"I'm a thread \n");
  6a:	68 88 08 00 00       	push   $0x888
  6f:	6a 01                	push   $0x1
  71:	e8 4a 06 00 00       	call   6c0 <printf>
printf(1,"X = %d \nY = %d \n",*(int*)x,*(int*)y);
  76:	8b 45 0c             	mov    0xc(%ebp),%eax
  79:	ff 30                	pushl  (%eax)
  7b:	8b 45 08             	mov    0x8(%ebp),%eax
  7e:	ff 30                	pushl  (%eax)
  80:	68 97 08 00 00       	push   $0x897
  85:	6a 01                	push   $0x1
  87:	e8 34 06 00 00       	call   6c0 <printf>
exit();
  8c:	83 c4 20             	add    $0x20,%esp
  8f:	e8 b9 04 00 00       	call   54d <exit>
  94:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  9f:	90                   	nop

000000a0 <f1>:
void f1(){
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 20             	sub    $0x20,%esp
printf(1,"======threads=====\n");
  aa:	68 a8 08 00 00       	push   $0x8a8
  af:	6a 01                	push   $0x1
int x=3,y=4;
  b1:	c7 45 f0 03 00 00 00 	movl   $0x3,-0x10(%ebp)
  b8:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
printf(1,"======threads=====\n");
  bf:	e8 fc 05 00 00       	call   6c0 <printf>
thread_create(&f,&x,&y);
  c4:	83 c4 0c             	add    $0xc,%esp
  c7:	8d 45 f4             	lea    -0xc(%ebp),%eax
  ca:	50                   	push   %eax
  cb:	8d 45 f0             	lea    -0x10(%ebp),%eax
  ce:	50                   	push   %eax
  cf:	68 60 00 00 00       	push   $0x60
  d4:	e8 47 04 00 00       	call   520 <thread_create>
printf(1,"FIRST CHILD PID %d \n",thread_join());
  d9:	e8 82 02 00 00       	call   360 <thread_join>
  de:	83 c4 0c             	add    $0xc,%esp
  e1:	50                   	push   %eax
  e2:	68 bc 08 00 00       	push   $0x8bc
  e7:	6a 01                	push   $0x1
  e9:	e8 d2 05 00 00       	call   6c0 <printf>
exit();
  ee:	e8 5a 04 00 00       	call   54d <exit>
  f3:	66 90                	xchg   %ax,%ax
  f5:	66 90                	xchg   %ax,%ax
  f7:	66 90                	xchg   %ax,%ax
  f9:	66 90                	xchg   %ax,%ax
  fb:	66 90                	xchg   %ax,%ax
  fd:	66 90                	xchg   %ax,%ax
  ff:	90                   	nop

00000100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 105:	31 c0                	xor    %eax,%eax
{
 107:	89 e5                	mov    %esp,%ebp
 109:	53                   	push   %ebx
 10a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 10d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 110:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 114:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 117:	83 c0 01             	add    $0x1,%eax
 11a:	84 d2                	test   %dl,%dl
 11c:	75 f2                	jne    110 <strcpy+0x10>
    ;
  return os;
}
 11e:	89 c8                	mov    %ecx,%eax
 120:	5b                   	pop    %ebx
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    
 123:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 130:	f3 0f 1e fb          	endbr32 
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	53                   	push   %ebx
 138:	8b 4d 08             	mov    0x8(%ebp),%ecx
 13b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 13e:	0f b6 01             	movzbl (%ecx),%eax
 141:	0f b6 1a             	movzbl (%edx),%ebx
 144:	84 c0                	test   %al,%al
 146:	75 19                	jne    161 <strcmp+0x31>
 148:	eb 26                	jmp    170 <strcmp+0x40>
 14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 150:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 154:	83 c1 01             	add    $0x1,%ecx
 157:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 15a:	0f b6 1a             	movzbl (%edx),%ebx
 15d:	84 c0                	test   %al,%al
 15f:	74 0f                	je     170 <strcmp+0x40>
 161:	38 d8                	cmp    %bl,%al
 163:	74 eb                	je     150 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 165:	29 d8                	sub    %ebx,%eax
}
 167:	5b                   	pop    %ebx
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 170:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 172:	29 d8                	sub    %ebx,%eax
}
 174:	5b                   	pop    %ebx
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    
 177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17e:	66 90                	xchg   %ax,%ax

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 18a:	80 3a 00             	cmpb   $0x0,(%edx)
 18d:	74 21                	je     1b0 <strlen+0x30>
 18f:	31 c0                	xor    %eax,%eax
 191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 198:	83 c0 01             	add    $0x1,%eax
 19b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 19f:	89 c1                	mov    %eax,%ecx
 1a1:	75 f5                	jne    198 <strlen+0x18>
    ;
  return n;
}
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
 1a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ae:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1b0:	31 c9                	xor    %ecx,%ecx
}
 1b2:	5d                   	pop    %ebp
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	c3                   	ret    
 1b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bd:	8d 76 00             	lea    0x0(%esi),%esi

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d1:	89 d7                	mov    %edx,%edi
 1d3:	fc                   	cld    
 1d4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d6:	89 d0                	mov    %edx,%eax
 1d8:	5f                   	pop    %edi
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    
 1db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	f3 0f 1e fb          	endbr32 
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ee:	0f b6 10             	movzbl (%eax),%edx
 1f1:	84 d2                	test   %dl,%dl
 1f3:	75 16                	jne    20b <strchr+0x2b>
 1f5:	eb 21                	jmp    218 <strchr+0x38>
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax
 200:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 204:	83 c0 01             	add    $0x1,%eax
 207:	84 d2                	test   %dl,%dl
 209:	74 0d                	je     218 <strchr+0x38>
    if(*s == c)
 20b:	38 d1                	cmp    %dl,%cl
 20d:	75 f1                	jne    200 <strchr+0x20>
      return (char*)s;
  return 0;
}
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
 211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 218:	31 c0                	xor    %eax,%eax
}
 21a:	5d                   	pop    %ebp
 21b:	c3                   	ret    
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	57                   	push   %edi
 228:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 229:	31 f6                	xor    %esi,%esi
{
 22b:	53                   	push   %ebx
 22c:	89 f3                	mov    %esi,%ebx
 22e:	83 ec 1c             	sub    $0x1c,%esp
 231:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 234:	eb 33                	jmp    269 <gets+0x49>
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 240:	83 ec 04             	sub    $0x4,%esp
 243:	8d 45 e7             	lea    -0x19(%ebp),%eax
 246:	6a 01                	push   $0x1
 248:	50                   	push   %eax
 249:	6a 00                	push   $0x0
 24b:	e8 15 03 00 00       	call   565 <read>
    if(cc < 1)
 250:	83 c4 10             	add    $0x10,%esp
 253:	85 c0                	test   %eax,%eax
 255:	7e 1c                	jle    273 <gets+0x53>
      break;
    buf[i++] = c;
 257:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 25b:	83 c7 01             	add    $0x1,%edi
 25e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 261:	3c 0a                	cmp    $0xa,%al
 263:	74 23                	je     288 <gets+0x68>
 265:	3c 0d                	cmp    $0xd,%al
 267:	74 1f                	je     288 <gets+0x68>
  for(i=0; i+1 < max; ){
 269:	83 c3 01             	add    $0x1,%ebx
 26c:	89 fe                	mov    %edi,%esi
 26e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 271:	7c cd                	jl     240 <gets+0x20>
 273:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 275:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 278:	c6 03 00             	movb   $0x0,(%ebx)
}
 27b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27e:	5b                   	pop    %ebx
 27f:	5e                   	pop    %esi
 280:	5f                   	pop    %edi
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 287:	90                   	nop
 288:	8b 75 08             	mov    0x8(%ebp),%esi
 28b:	8b 45 08             	mov    0x8(%ebp),%eax
 28e:	01 de                	add    %ebx,%esi
 290:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 292:	c6 03 00             	movb   $0x0,(%ebx)
}
 295:	8d 65 f4             	lea    -0xc(%ebp),%esp
 298:	5b                   	pop    %ebx
 299:	5e                   	pop    %esi
 29a:	5f                   	pop    %edi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	8d 76 00             	lea    0x0(%esi),%esi

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	56                   	push   %esi
 2a8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	6a 00                	push   $0x0
 2ae:	ff 75 08             	pushl  0x8(%ebp)
 2b1:	e8 d7 02 00 00       	call   58d <open>
  if(fd < 0)
 2b6:	83 c4 10             	add    $0x10,%esp
 2b9:	85 c0                	test   %eax,%eax
 2bb:	78 2b                	js     2e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2bd:	83 ec 08             	sub    $0x8,%esp
 2c0:	ff 75 0c             	pushl  0xc(%ebp)
 2c3:	89 c3                	mov    %eax,%ebx
 2c5:	50                   	push   %eax
 2c6:	e8 da 02 00 00       	call   5a5 <fstat>
  close(fd);
 2cb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ce:	89 c6                	mov    %eax,%esi
  close(fd);
 2d0:	e8 a0 02 00 00       	call   575 <close>
  return r;
 2d5:	83 c4 10             	add    $0x10,%esp
}
 2d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2db:	89 f0                	mov    %esi,%eax
 2dd:	5b                   	pop    %ebx
 2de:	5e                   	pop    %esi
 2df:	5d                   	pop    %ebp
 2e0:	c3                   	ret    
 2e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2e8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2ed:	eb e9                	jmp    2d8 <stat+0x38>
 2ef:	90                   	nop

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	53                   	push   %ebx
 2f8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2fb:	0f be 02             	movsbl (%edx),%eax
 2fe:	8d 48 d0             	lea    -0x30(%eax),%ecx
 301:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 304:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 309:	77 1a                	ja     325 <atoi+0x35>
 30b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop
    n = n*10 + *s++ - '0';
 310:	83 c2 01             	add    $0x1,%edx
 313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 31a:	0f be 02             	movsbl (%edx),%eax
 31d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	89 c8                	mov    %ecx,%eax
 327:	5b                   	pop    %ebx
 328:	5d                   	pop    %ebp
 329:	c3                   	ret    
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	57                   	push   %edi
 338:	8b 45 10             	mov    0x10(%ebp),%eax
 33b:	8b 55 08             	mov    0x8(%ebp),%edx
 33e:	56                   	push   %esi
 33f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 342:	85 c0                	test   %eax,%eax
 344:	7e 0f                	jle    355 <memmove+0x25>
 346:	01 d0                	add    %edx,%eax
  dst = vdst;
 348:	89 d7                	mov    %edx,%edi
 34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 351:	39 f8                	cmp    %edi,%eax
 353:	75 fb                	jne    350 <memmove+0x20>
  return vdst;
}
 355:	5e                   	pop    %esi
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 36a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 36d:	50                   	push   %eax
 36e:	e8 92 02 00 00       	call   605 <join>
  
  return x;
}
 373:	c9                   	leave  
 374:	c3                   	ret    
 375:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 385:	a1 2c 0c 00 00       	mov    0xc2c,%eax
{
 38a:	89 e5                	mov    %esp,%ebp
 38c:	57                   	push   %edi
 38d:	56                   	push   %esi
 38e:	53                   	push   %ebx
 38f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 392:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 394:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 397:	39 c8                	cmp    %ecx,%eax
 399:	73 15                	jae    3b0 <free+0x30>
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
 3a0:	39 d1                	cmp    %edx,%ecx
 3a2:	72 14                	jb     3b8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3a4:	39 d0                	cmp    %edx,%eax
 3a6:	73 10                	jae    3b8 <free+0x38>
{
 3a8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3aa:	8b 10                	mov    (%eax),%edx
 3ac:	39 c8                	cmp    %ecx,%eax
 3ae:	72 f0                	jb     3a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3b0:	39 d0                	cmp    %edx,%eax
 3b2:	72 f4                	jb     3a8 <free+0x28>
 3b4:	39 d1                	cmp    %edx,%ecx
 3b6:	73 f0                	jae    3a8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3be:	39 fa                	cmp    %edi,%edx
 3c0:	74 1e                	je     3e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3c5:	8b 50 04             	mov    0x4(%eax),%edx
 3c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3cb:	39 f1                	cmp    %esi,%ecx
 3cd:	74 28                	je     3f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 3cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 3d1:	5b                   	pop    %ebx
  freep = p;
 3d2:	a3 2c 0c 00 00       	mov    %eax,0xc2c
}
 3d7:	5e                   	pop    %esi
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    
 3db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 3e0:	03 72 04             	add    0x4(%edx),%esi
 3e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 3e6:	8b 10                	mov    (%eax),%edx
 3e8:	8b 12                	mov    (%edx),%edx
 3ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3ed:	8b 50 04             	mov    0x4(%eax),%edx
 3f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3f3:	39 f1                	cmp    %esi,%ecx
 3f5:	75 d8                	jne    3cf <free+0x4f>
    p->s.size += bp->s.size;
 3f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 3fa:	a3 2c 0c 00 00       	mov    %eax,0xc2c
    p->s.size += bp->s.size;
 3ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 402:	8b 53 f8             	mov    -0x8(%ebx),%edx
 405:	89 10                	mov    %edx,(%eax)
}
 407:	5b                   	pop    %ebx
 408:	5e                   	pop    %esi
 409:	5f                   	pop    %edi
 40a:	5d                   	pop    %ebp
 40b:	c3                   	ret    
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 410:	f3 0f 1e fb          	endbr32 
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	57                   	push   %edi
 418:	56                   	push   %esi
 419:	53                   	push   %ebx
 41a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 41d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 420:	8b 3d 2c 0c 00 00    	mov    0xc2c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 426:	8d 70 07             	lea    0x7(%eax),%esi
 429:	c1 ee 03             	shr    $0x3,%esi
 42c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 42f:	85 ff                	test   %edi,%edi
 431:	0f 84 a9 00 00 00    	je     4e0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 437:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 439:	8b 48 04             	mov    0x4(%eax),%ecx
 43c:	39 f1                	cmp    %esi,%ecx
 43e:	73 6d                	jae    4ad <malloc+0x9d>
 440:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 446:	bb 00 10 00 00       	mov    $0x1000,%ebx
 44b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 44e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 455:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 458:	eb 17                	jmp    471 <malloc+0x61>
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 460:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 462:	8b 4a 04             	mov    0x4(%edx),%ecx
 465:	39 f1                	cmp    %esi,%ecx
 467:	73 4f                	jae    4b8 <malloc+0xa8>
 469:	8b 3d 2c 0c 00 00    	mov    0xc2c,%edi
 46f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 471:	39 c7                	cmp    %eax,%edi
 473:	75 eb                	jne    460 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 475:	83 ec 0c             	sub    $0xc,%esp
 478:	ff 75 e4             	pushl  -0x1c(%ebp)
 47b:	e8 65 01 00 00       	call   5e5 <sbrk>
  if(p == (char*)-1)
 480:	83 c4 10             	add    $0x10,%esp
 483:	83 f8 ff             	cmp    $0xffffffff,%eax
 486:	74 1b                	je     4a3 <malloc+0x93>
  hp->s.size = nu;
 488:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 48b:	83 ec 0c             	sub    $0xc,%esp
 48e:	83 c0 08             	add    $0x8,%eax
 491:	50                   	push   %eax
 492:	e8 e9 fe ff ff       	call   380 <free>
  return freep;
 497:	a1 2c 0c 00 00       	mov    0xc2c,%eax
      if((p = morecore(nunits)) == 0)
 49c:	83 c4 10             	add    $0x10,%esp
 49f:	85 c0                	test   %eax,%eax
 4a1:	75 bd                	jne    460 <malloc+0x50>
        return 0;
  }
}
 4a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 4a6:	31 c0                	xor    %eax,%eax
}
 4a8:	5b                   	pop    %ebx
 4a9:	5e                   	pop    %esi
 4aa:	5f                   	pop    %edi
 4ab:	5d                   	pop    %ebp
 4ac:	c3                   	ret    
    if(p->s.size >= nunits){
 4ad:	89 c2                	mov    %eax,%edx
 4af:	89 f8                	mov    %edi,%eax
 4b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 4b8:	39 ce                	cmp    %ecx,%esi
 4ba:	74 54                	je     510 <malloc+0x100>
        p->s.size -= nunits;
 4bc:	29 f1                	sub    %esi,%ecx
 4be:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 4c1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 4c4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 4c7:	a3 2c 0c 00 00       	mov    %eax,0xc2c
}
 4cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 4cf:	8d 42 08             	lea    0x8(%edx),%eax
}
 4d2:	5b                   	pop    %ebx
 4d3:	5e                   	pop    %esi
 4d4:	5f                   	pop    %edi
 4d5:	5d                   	pop    %ebp
 4d6:	c3                   	ret    
 4d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4de:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 4e0:	c7 05 2c 0c 00 00 30 	movl   $0xc30,0xc2c
 4e7:	0c 00 00 
    base.s.size = 0;
 4ea:	bf 30 0c 00 00       	mov    $0xc30,%edi
    base.s.ptr = freep = prevp = &base;
 4ef:	c7 05 30 0c 00 00 30 	movl   $0xc30,0xc30
 4f6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4f9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 4fb:	c7 05 34 0c 00 00 00 	movl   $0x0,0xc34
 502:	00 00 00 
    if(p->s.size >= nunits){
 505:	e9 36 ff ff ff       	jmp    440 <malloc+0x30>
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 510:	8b 0a                	mov    (%edx),%ecx
 512:	89 08                	mov    %ecx,(%eax)
 514:	eb b1                	jmp    4c7 <malloc+0xb7>
 516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi

00000520 <thread_create>:
{
 520:	f3 0f 1e fb          	endbr32 
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 52a:	68 00 10 00 00       	push   $0x1000
 52f:	e8 dc fe ff ff       	call   410 <malloc>
return clone(start_routine,arg1,arg2,stack);
 534:	50                   	push   %eax
 535:	ff 75 10             	pushl  0x10(%ebp)
 538:	ff 75 0c             	pushl  0xc(%ebp)
 53b:	ff 75 08             	pushl  0x8(%ebp)
 53e:	e8 ba 00 00 00       	call   5fd <clone>
}
 543:	c9                   	leave  
 544:	c3                   	ret    

00000545 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 545:	b8 01 00 00 00       	mov    $0x1,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <exit>:
SYSCALL(exit)
 54d:	b8 02 00 00 00       	mov    $0x2,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <wait>:
SYSCALL(wait)
 555:	b8 03 00 00 00       	mov    $0x3,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <pipe>:
SYSCALL(pipe)
 55d:	b8 04 00 00 00       	mov    $0x4,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <read>:
SYSCALL(read)
 565:	b8 05 00 00 00       	mov    $0x5,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <write>:
SYSCALL(write)
 56d:	b8 10 00 00 00       	mov    $0x10,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <close>:
SYSCALL(close)
 575:	b8 15 00 00 00       	mov    $0x15,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <kill>:
SYSCALL(kill)
 57d:	b8 06 00 00 00       	mov    $0x6,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <exec>:
SYSCALL(exec)
 585:	b8 07 00 00 00       	mov    $0x7,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <open>:
SYSCALL(open)
 58d:	b8 0f 00 00 00       	mov    $0xf,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <mknod>:
SYSCALL(mknod)
 595:	b8 11 00 00 00       	mov    $0x11,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <unlink>:
SYSCALL(unlink)
 59d:	b8 12 00 00 00       	mov    $0x12,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <fstat>:
SYSCALL(fstat)
 5a5:	b8 08 00 00 00       	mov    $0x8,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <link>:
SYSCALL(link)
 5ad:	b8 13 00 00 00       	mov    $0x13,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <mkdir>:
SYSCALL(mkdir)
 5b5:	b8 14 00 00 00       	mov    $0x14,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <chdir>:
SYSCALL(chdir)
 5bd:	b8 09 00 00 00       	mov    $0x9,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <dup>:
SYSCALL(dup)
 5c5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <getpid>:
SYSCALL(getpid)
 5cd:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <getyear>:
SYSCALL(getyear)
 5d5:	b8 16 00 00 00       	mov    $0x16,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <getreadcount>:
SYSCALL(getreadcount)
 5dd:	b8 17 00 00 00       	mov    $0x17,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <sbrk>:
SYSCALL(sbrk)
 5e5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <sleep>:
SYSCALL(sleep)
 5ed:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <uptime>:
SYSCALL(uptime)
 5f5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <clone>:
SYSCALL(clone)
 5fd:	b8 18 00 00 00       	mov    $0x18,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <join>:
SYSCALL(join)
 605:	b8 19 00 00 00       	mov    $0x19,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    
 60d:	66 90                	xchg   %ax,%ax
 60f:	90                   	nop

00000610 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 3c             	sub    $0x3c,%esp
 619:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 61c:	89 d1                	mov    %edx,%ecx
{
 61e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 621:	85 d2                	test   %edx,%edx
 623:	0f 89 7f 00 00 00    	jns    6a8 <printint+0x98>
 629:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 62d:	74 79                	je     6a8 <printint+0x98>
    neg = 1;
 62f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 636:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 638:	31 db                	xor    %ebx,%ebx
 63a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 63d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 640:	89 c8                	mov    %ecx,%eax
 642:	31 d2                	xor    %edx,%edx
 644:	89 cf                	mov    %ecx,%edi
 646:	f7 75 c4             	divl   -0x3c(%ebp)
 649:	0f b6 92 0c 09 00 00 	movzbl 0x90c(%edx),%edx
 650:	89 45 c0             	mov    %eax,-0x40(%ebp)
 653:	89 d8                	mov    %ebx,%eax
 655:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 658:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 65b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 65e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 661:	76 dd                	jbe    640 <printint+0x30>
  if(neg)
 663:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 666:	85 c9                	test   %ecx,%ecx
 668:	74 0c                	je     676 <printint+0x66>
    buf[i++] = '-';
 66a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 66f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 671:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 676:	8b 7d b8             	mov    -0x48(%ebp),%edi
 679:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 67d:	eb 07                	jmp    686 <printint+0x76>
 67f:	90                   	nop
 680:	0f b6 13             	movzbl (%ebx),%edx
 683:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 686:	83 ec 04             	sub    $0x4,%esp
 689:	88 55 d7             	mov    %dl,-0x29(%ebp)
 68c:	6a 01                	push   $0x1
 68e:	56                   	push   %esi
 68f:	57                   	push   %edi
 690:	e8 d8 fe ff ff       	call   56d <write>
  while(--i >= 0)
 695:	83 c4 10             	add    $0x10,%esp
 698:	39 de                	cmp    %ebx,%esi
 69a:	75 e4                	jne    680 <printint+0x70>
    putc(fd, buf[i]);
}
 69c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69f:	5b                   	pop    %ebx
 6a0:	5e                   	pop    %esi
 6a1:	5f                   	pop    %edi
 6a2:	5d                   	pop    %ebp
 6a3:	c3                   	ret    
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6af:	eb 87                	jmp    638 <printint+0x28>
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bf:	90                   	nop

000006c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6c0:	f3 0f 1e fb          	endbr32 
 6c4:	55                   	push   %ebp
 6c5:	89 e5                	mov    %esp,%ebp
 6c7:	57                   	push   %edi
 6c8:	56                   	push   %esi
 6c9:	53                   	push   %ebx
 6ca:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6cd:	8b 75 0c             	mov    0xc(%ebp),%esi
 6d0:	0f b6 1e             	movzbl (%esi),%ebx
 6d3:	84 db                	test   %bl,%bl
 6d5:	0f 84 b4 00 00 00    	je     78f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6db:	8d 45 10             	lea    0x10(%ebp),%eax
 6de:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6e1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6e4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6e6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e9:	eb 33                	jmp    71e <printf+0x5e>
 6eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ef:	90                   	nop
 6f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6f3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6f8:	83 f8 25             	cmp    $0x25,%eax
 6fb:	74 17                	je     714 <printf+0x54>
  write(fd, &c, 1);
 6fd:	83 ec 04             	sub    $0x4,%esp
 700:	88 5d e7             	mov    %bl,-0x19(%ebp)
 703:	6a 01                	push   $0x1
 705:	57                   	push   %edi
 706:	ff 75 08             	pushl  0x8(%ebp)
 709:	e8 5f fe ff ff       	call   56d <write>
 70e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 711:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 714:	0f b6 1e             	movzbl (%esi),%ebx
 717:	83 c6 01             	add    $0x1,%esi
 71a:	84 db                	test   %bl,%bl
 71c:	74 71                	je     78f <printf+0xcf>
    c = fmt[i] & 0xff;
 71e:	0f be cb             	movsbl %bl,%ecx
 721:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 724:	85 d2                	test   %edx,%edx
 726:	74 c8                	je     6f0 <printf+0x30>
      }
    } else if(state == '%'){
 728:	83 fa 25             	cmp    $0x25,%edx
 72b:	75 e7                	jne    714 <printf+0x54>
      if(c == 'd'){
 72d:	83 f8 64             	cmp    $0x64,%eax
 730:	0f 84 9a 00 00 00    	je     7d0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 736:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 73c:	83 f9 70             	cmp    $0x70,%ecx
 73f:	74 5f                	je     7a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 741:	83 f8 73             	cmp    $0x73,%eax
 744:	0f 84 d6 00 00 00    	je     820 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 74a:	83 f8 63             	cmp    $0x63,%eax
 74d:	0f 84 8d 00 00 00    	je     7e0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 753:	83 f8 25             	cmp    $0x25,%eax
 756:	0f 84 b4 00 00 00    	je     810 <printf+0x150>
  write(fd, &c, 1);
 75c:	83 ec 04             	sub    $0x4,%esp
 75f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 763:	6a 01                	push   $0x1
 765:	57                   	push   %edi
 766:	ff 75 08             	pushl  0x8(%ebp)
 769:	e8 ff fd ff ff       	call   56d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 76e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 771:	83 c4 0c             	add    $0xc,%esp
 774:	6a 01                	push   $0x1
 776:	83 c6 01             	add    $0x1,%esi
 779:	57                   	push   %edi
 77a:	ff 75 08             	pushl  0x8(%ebp)
 77d:	e8 eb fd ff ff       	call   56d <write>
  for(i = 0; fmt[i]; i++){
 782:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 786:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 789:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 78b:	84 db                	test   %bl,%bl
 78d:	75 8f                	jne    71e <printf+0x5e>
    }
  }
}
 78f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 792:	5b                   	pop    %ebx
 793:	5e                   	pop    %esi
 794:	5f                   	pop    %edi
 795:	5d                   	pop    %ebp
 796:	c3                   	ret    
 797:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 7a0:	83 ec 0c             	sub    $0xc,%esp
 7a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7a8:	6a 00                	push   $0x0
 7aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 7b0:	8b 13                	mov    (%ebx),%edx
 7b2:	e8 59 fe ff ff       	call   610 <printint>
        ap++;
 7b7:	89 d8                	mov    %ebx,%eax
 7b9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7bc:	31 d2                	xor    %edx,%edx
        ap++;
 7be:	83 c0 04             	add    $0x4,%eax
 7c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7c4:	e9 4b ff ff ff       	jmp    714 <printf+0x54>
 7c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7d8:	6a 01                	push   $0x1
 7da:	eb ce                	jmp    7aa <printf+0xea>
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7e0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7e6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7e8:	6a 01                	push   $0x1
        ap++;
 7ea:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7ed:	57                   	push   %edi
 7ee:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7f1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7f4:	e8 74 fd ff ff       	call   56d <write>
        ap++;
 7f9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ff:	31 d2                	xor    %edx,%edx
 801:	e9 0e ff ff ff       	jmp    714 <printf+0x54>
 806:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 810:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 813:	83 ec 04             	sub    $0x4,%esp
 816:	e9 59 ff ff ff       	jmp    774 <printf+0xb4>
 81b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 81f:	90                   	nop
        s = (char*)*ap;
 820:	8b 45 d0             	mov    -0x30(%ebp),%eax
 823:	8b 18                	mov    (%eax),%ebx
        ap++;
 825:	83 c0 04             	add    $0x4,%eax
 828:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 82b:	85 db                	test   %ebx,%ebx
 82d:	74 17                	je     846 <printf+0x186>
        while(*s != 0){
 82f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 832:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 834:	84 c0                	test   %al,%al
 836:	0f 84 d8 fe ff ff    	je     714 <printf+0x54>
 83c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 83f:	89 de                	mov    %ebx,%esi
 841:	8b 5d 08             	mov    0x8(%ebp),%ebx
 844:	eb 1a                	jmp    860 <printf+0x1a0>
          s = "(null)";
 846:	bb 02 09 00 00       	mov    $0x902,%ebx
        while(*s != 0){
 84b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 84e:	b8 28 00 00 00       	mov    $0x28,%eax
 853:	89 de                	mov    %ebx,%esi
 855:	8b 5d 08             	mov    0x8(%ebp),%ebx
 858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85f:	90                   	nop
  write(fd, &c, 1);
 860:	83 ec 04             	sub    $0x4,%esp
          s++;
 863:	83 c6 01             	add    $0x1,%esi
 866:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 869:	6a 01                	push   $0x1
 86b:	57                   	push   %edi
 86c:	53                   	push   %ebx
 86d:	e8 fb fc ff ff       	call   56d <write>
        while(*s != 0){
 872:	0f b6 06             	movzbl (%esi),%eax
 875:	83 c4 10             	add    $0x10,%esp
 878:	84 c0                	test   %al,%al
 87a:	75 e4                	jne    860 <printf+0x1a0>
 87c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 87f:	31 d2                	xor    %edx,%edx
 881:	e9 8e fe ff ff       	jmp    714 <printf+0x54>
