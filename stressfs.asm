
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   b:	b8 30 00 00 00       	mov    $0x30,%eax
{
  10:	ff 71 fc             	pushl  -0x4(%ecx)
  13:	55                   	push   %ebp
  14:	89 e5                	mov    %esp,%ebp
  16:	57                   	push   %edi
  17:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  18:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1e:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1f:	31 db                	xor    %ebx,%ebx
{
  21:	51                   	push   %ecx
  22:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  28:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2f:	68 a8 08 00 00       	push   $0x8a8
  34:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  36:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  3d:	74 72 65 
  40:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  47:	73 66 73 
  printf(1, "stressfs starting\n");
  4a:	e8 91 06 00 00       	call   6e0 <printf>
  memset(data, 'a', sizeof(data));
  4f:	83 c4 0c             	add    $0xc,%esp
  52:	68 00 02 00 00       	push   $0x200
  57:	6a 61                	push   $0x61
  59:	56                   	push   %esi
  5a:	e8 a1 01 00 00       	call   200 <memset>
  5f:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  62:	e8 fe 04 00 00       	call   565 <fork>
  67:	85 c0                	test   %eax,%eax
  69:	0f 8f bb 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6f:	83 c3 01             	add    $0x1,%ebx
  72:	83 fb 04             	cmp    $0x4,%ebx
  75:	75 eb                	jne    62 <main+0x62>
  77:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  7c:	83 ec 04             	sub    $0x4,%esp
  7f:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  80:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  85:	68 bb 08 00 00       	push   $0x8bb
  8a:	6a 01                	push   $0x1
  8c:	e8 4f 06 00 00       	call   6e0 <printf>
  path[8] += i;
  91:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  93:	5f                   	pop    %edi
  path[8] += i;
  94:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  9a:	58                   	pop    %eax
  9b:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a1:	68 02 02 00 00       	push   $0x202
  a6:	50                   	push   %eax
  a7:	e8 01 05 00 00       	call   5ad <open>
  ac:	83 c4 10             	add    $0x10,%esp
  af:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b8:	83 ec 04             	sub    $0x4,%esp
  bb:	68 00 02 00 00       	push   $0x200
  c0:	56                   	push   %esi
  c1:	57                   	push   %edi
  c2:	e8 c6 04 00 00       	call   58d <write>
  for(i = 0; i < 20; i++)
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	83 eb 01             	sub    $0x1,%ebx
  cd:	75 e9                	jne    b8 <main+0xb8>
  close(fd);
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	57                   	push   %edi
  d3:	e8 bd 04 00 00       	call   595 <close>

  printf(1, "read\n");
  d8:	58                   	pop    %eax
  d9:	5a                   	pop    %edx
  da:	68 c5 08 00 00       	push   $0x8c5
  df:	6a 01                	push   $0x1
  e1:	e8 fa 05 00 00       	call   6e0 <printf>

  fd = open(path, O_RDONLY);
  e6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  ec:	59                   	pop    %ecx
  ed:	5b                   	pop    %ebx
  ee:	6a 00                	push   $0x0
  f0:	bb 14 00 00 00       	mov    $0x14,%ebx
  f5:	50                   	push   %eax
  f6:	e8 b2 04 00 00       	call   5ad <open>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 76 04 00 00       	call   585 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 75 04 00 00       	call   595 <close>

  wait();
 120:	e8 50 04 00 00       	call   575 <wait>

  exit();
 125:	e8 43 04 00 00       	call   56d <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 4b ff ff ff       	jmp    7c <main+0x7c>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 145:	31 c0                	xor    %eax,%eax
{
 147:	89 e5                	mov    %esp,%ebp
 149:	53                   	push   %ebx
 14a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	89 c8                	mov    %ecx,%eax
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	53                   	push   %ebx
 178:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 17e:	0f b6 01             	movzbl (%ecx),%eax
 181:	0f b6 1a             	movzbl (%edx),%ebx
 184:	84 c0                	test   %al,%al
 186:	75 19                	jne    1a1 <strcmp+0x31>
 188:	eb 26                	jmp    1b0 <strcmp+0x40>
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 190:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 194:	83 c1 01             	add    $0x1,%ecx
 197:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 19a:	0f b6 1a             	movzbl (%edx),%ebx
 19d:	84 c0                	test   %al,%al
 19f:	74 0f                	je     1b0 <strcmp+0x40>
 1a1:	38 d8                	cmp    %bl,%al
 1a3:	74 eb                	je     190 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1a5:	29 d8                	sub    %ebx,%eax
}
 1a7:	5b                   	pop    %ebx
 1a8:	5d                   	pop    %ebp
 1a9:	c3                   	ret    
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1b2:	29 d8                	sub    %ebx,%eax
}
 1b4:	5b                   	pop    %ebx
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1ca:	80 3a 00             	cmpb   $0x0,(%edx)
 1cd:	74 21                	je     1f0 <strlen+0x30>
 1cf:	31 c0                	xor    %eax,%eax
 1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d8:	83 c0 01             	add    $0x1,%eax
 1db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1df:	89 c1                	mov    %eax,%ecx
 1e1:	75 f5                	jne    1d8 <strlen+0x18>
    ;
  return n;
}
 1e3:	89 c8                	mov    %ecx,%eax
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 20b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20e:	8b 45 0c             	mov    0xc(%ebp),%eax
 211:	89 d7                	mov    %edx,%edi
 213:	fc                   	cld    
 214:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 216:	89 d0                	mov    %edx,%eax
 218:	5f                   	pop    %edi
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22e:	0f b6 10             	movzbl (%eax),%edx
 231:	84 d2                	test   %dl,%dl
 233:	75 16                	jne    24b <strchr+0x2b>
 235:	eb 21                	jmp    258 <strchr+0x38>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
 240:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 244:	83 c0 01             	add    $0x1,%eax
 247:	84 d2                	test   %dl,%dl
 249:	74 0d                	je     258 <strchr+0x38>
    if(*s == c)
 24b:	38 d1                	cmp    %dl,%cl
 24d:	75 f1                	jne    240 <strchr+0x20>
      return (char*)s;
  return 0;
}
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 258:	31 c0                	xor    %eax,%eax
}
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	31 f6                	xor    %esi,%esi
{
 26b:	53                   	push   %ebx
 26c:	89 f3                	mov    %esi,%ebx
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 274:	eb 33                	jmp    2a9 <gets+0x49>
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 280:	83 ec 04             	sub    $0x4,%esp
 283:	8d 45 e7             	lea    -0x19(%ebp),%eax
 286:	6a 01                	push   $0x1
 288:	50                   	push   %eax
 289:	6a 00                	push   $0x0
 28b:	e8 f5 02 00 00       	call   585 <read>
    if(cc < 1)
 290:	83 c4 10             	add    $0x10,%esp
 293:	85 c0                	test   %eax,%eax
 295:	7e 1c                	jle    2b3 <gets+0x53>
      break;
    buf[i++] = c;
 297:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29b:	83 c7 01             	add    $0x1,%edi
 29e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	74 23                	je     2c8 <gets+0x68>
 2a5:	3c 0d                	cmp    $0xd,%al
 2a7:	74 1f                	je     2c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2a9:	83 c3 01             	add    $0x1,%ebx
 2ac:	89 fe                	mov    %edi,%esi
 2ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2b1:	7c cd                	jl     280 <gets+0x20>
 2b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2be:	5b                   	pop    %ebx
 2bf:	5e                   	pop    %esi
 2c0:	5f                   	pop    %edi
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c7:	90                   	nop
 2c8:	8b 75 08             	mov    0x8(%ebp),%esi
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	01 de                	add    %ebx,%esi
 2d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	56                   	push   %esi
 2e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	6a 00                	push   $0x0
 2ee:	ff 75 08             	pushl  0x8(%ebp)
 2f1:	e8 b7 02 00 00       	call   5ad <open>
  if(fd < 0)
 2f6:	83 c4 10             	add    $0x10,%esp
 2f9:	85 c0                	test   %eax,%eax
 2fb:	78 2b                	js     328 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2fd:	83 ec 08             	sub    $0x8,%esp
 300:	ff 75 0c             	pushl  0xc(%ebp)
 303:	89 c3                	mov    %eax,%ebx
 305:	50                   	push   %eax
 306:	e8 ba 02 00 00       	call   5c5 <fstat>
  close(fd);
 30b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30e:	89 c6                	mov    %eax,%esi
  close(fd);
 310:	e8 80 02 00 00       	call   595 <close>
  return r;
 315:	83 c4 10             	add    $0x10,%esp
}
 318:	8d 65 f8             	lea    -0x8(%ebp),%esp
 31b:	89 f0                	mov    %esi,%eax
 31d:	5b                   	pop    %ebx
 31e:	5e                   	pop    %esi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 328:	be ff ff ff ff       	mov    $0xffffffff,%esi
 32d:	eb e9                	jmp    318 <stat+0x38>
 32f:	90                   	nop

00000330 <atoi>:

int
atoi(const char *s)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	53                   	push   %ebx
 338:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 33b:	0f be 02             	movsbl (%edx),%eax
 33e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 341:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 344:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 349:	77 1a                	ja     365 <atoi+0x35>
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop
    n = n*10 + *s++ - '0';
 350:	83 c2 01             	add    $0x1,%edx
 353:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 356:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 35a:	0f be 02             	movsbl (%edx),%eax
 35d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
  return n;
}
 365:	89 c8                	mov    %ecx,%eax
 367:	5b                   	pop    %ebx
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	8b 45 10             	mov    0x10(%ebp),%eax
 37b:	8b 55 08             	mov    0x8(%ebp),%edx
 37e:	56                   	push   %esi
 37f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 382:	85 c0                	test   %eax,%eax
 384:	7e 0f                	jle    395 <memmove+0x25>
 386:	01 d0                	add    %edx,%eax
  dst = vdst;
 388:	89 d7                	mov    %edx,%edi
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 390:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 391:	39 f8                	cmp    %edi,%eax
 393:	75 fb                	jne    390 <memmove+0x20>
  return vdst;
}
 395:	5e                   	pop    %esi
 396:	89 d0                	mov    %edx,%eax
 398:	5f                   	pop    %edi
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3a5:	a1 ac 0b 00 00       	mov    0xbac,%eax
{
 3aa:	89 e5                	mov    %esp,%ebp
 3ac:	57                   	push   %edi
 3ad:	56                   	push   %esi
 3ae:	53                   	push   %ebx
 3af:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3b2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 3b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3b7:	39 c8                	cmp    %ecx,%eax
 3b9:	73 15                	jae    3d0 <free+0x30>
 3bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop
 3c0:	39 d1                	cmp    %edx,%ecx
 3c2:	72 14                	jb     3d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3c4:	39 d0                	cmp    %edx,%eax
 3c6:	73 10                	jae    3d8 <free+0x38>
{
 3c8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3ca:	8b 10                	mov    (%eax),%edx
 3cc:	39 c8                	cmp    %ecx,%eax
 3ce:	72 f0                	jb     3c0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3d0:	39 d0                	cmp    %edx,%eax
 3d2:	72 f4                	jb     3c8 <free+0x28>
 3d4:	39 d1                	cmp    %edx,%ecx
 3d6:	73 f0                	jae    3c8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3de:	39 fa                	cmp    %edi,%edx
 3e0:	74 1e                	je     400 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3e5:	8b 50 04             	mov    0x4(%eax),%edx
 3e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3eb:	39 f1                	cmp    %esi,%ecx
 3ed:	74 28                	je     417 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 3ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 3f1:	5b                   	pop    %ebx
  freep = p;
 3f2:	a3 ac 0b 00 00       	mov    %eax,0xbac
}
 3f7:	5e                   	pop    %esi
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 400:	03 72 04             	add    0x4(%edx),%esi
 403:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 406:	8b 10                	mov    (%eax),%edx
 408:	8b 12                	mov    (%edx),%edx
 40a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 40d:	8b 50 04             	mov    0x4(%eax),%edx
 410:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 413:	39 f1                	cmp    %esi,%ecx
 415:	75 d8                	jne    3ef <free+0x4f>
    p->s.size += bp->s.size;
 417:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 41a:	a3 ac 0b 00 00       	mov    %eax,0xbac
    p->s.size += bp->s.size;
 41f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 422:	8b 53 f8             	mov    -0x8(%ebx),%edx
 425:	89 10                	mov    %edx,(%eax)
}
 427:	5b                   	pop    %ebx
 428:	5e                   	pop    %esi
 429:	5f                   	pop    %edi
 42a:	5d                   	pop    %ebp
 42b:	c3                   	ret    
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	57                   	push   %edi
 438:	56                   	push   %esi
 439:	53                   	push   %ebx
 43a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 440:	8b 3d ac 0b 00 00    	mov    0xbac,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 446:	8d 70 07             	lea    0x7(%eax),%esi
 449:	c1 ee 03             	shr    $0x3,%esi
 44c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 44f:	85 ff                	test   %edi,%edi
 451:	0f 84 a9 00 00 00    	je     500 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 457:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 459:	8b 48 04             	mov    0x4(%eax),%ecx
 45c:	39 f1                	cmp    %esi,%ecx
 45e:	73 6d                	jae    4cd <malloc+0x9d>
 460:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 466:	bb 00 10 00 00       	mov    $0x1000,%ebx
 46b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 46e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 475:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 478:	eb 17                	jmp    491 <malloc+0x61>
 47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 480:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 482:	8b 4a 04             	mov    0x4(%edx),%ecx
 485:	39 f1                	cmp    %esi,%ecx
 487:	73 4f                	jae    4d8 <malloc+0xa8>
 489:	8b 3d ac 0b 00 00    	mov    0xbac,%edi
 48f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 491:	39 c7                	cmp    %eax,%edi
 493:	75 eb                	jne    480 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 495:	83 ec 0c             	sub    $0xc,%esp
 498:	ff 75 e4             	pushl  -0x1c(%ebp)
 49b:	e8 65 01 00 00       	call   605 <sbrk>
  if(p == (char*)-1)
 4a0:	83 c4 10             	add    $0x10,%esp
 4a3:	83 f8 ff             	cmp    $0xffffffff,%eax
 4a6:	74 1b                	je     4c3 <malloc+0x93>
  hp->s.size = nu;
 4a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 4ab:	83 ec 0c             	sub    $0xc,%esp
 4ae:	83 c0 08             	add    $0x8,%eax
 4b1:	50                   	push   %eax
 4b2:	e8 e9 fe ff ff       	call   3a0 <free>
  return freep;
 4b7:	a1 ac 0b 00 00       	mov    0xbac,%eax
      if((p = morecore(nunits)) == 0)
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	85 c0                	test   %eax,%eax
 4c1:	75 bd                	jne    480 <malloc+0x50>
        return 0;
  }
}
 4c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 4c6:	31 c0                	xor    %eax,%eax
}
 4c8:	5b                   	pop    %ebx
 4c9:	5e                   	pop    %esi
 4ca:	5f                   	pop    %edi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
    if(p->s.size >= nunits){
 4cd:	89 c2                	mov    %eax,%edx
 4cf:	89 f8                	mov    %edi,%eax
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 4d8:	39 ce                	cmp    %ecx,%esi
 4da:	74 54                	je     530 <malloc+0x100>
        p->s.size -= nunits;
 4dc:	29 f1                	sub    %esi,%ecx
 4de:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 4e1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 4e4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 4e7:	a3 ac 0b 00 00       	mov    %eax,0xbac
}
 4ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 4ef:	8d 42 08             	lea    0x8(%edx),%eax
}
 4f2:	5b                   	pop    %ebx
 4f3:	5e                   	pop    %esi
 4f4:	5f                   	pop    %edi
 4f5:	5d                   	pop    %ebp
 4f6:	c3                   	ret    
 4f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 500:	c7 05 ac 0b 00 00 b0 	movl   $0xbb0,0xbac
 507:	0b 00 00 
    base.s.size = 0;
 50a:	bf b0 0b 00 00       	mov    $0xbb0,%edi
    base.s.ptr = freep = prevp = &base;
 50f:	c7 05 b0 0b 00 00 b0 	movl   $0xbb0,0xbb0
 516:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 519:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 51b:	c7 05 b4 0b 00 00 00 	movl   $0x0,0xbb4
 522:	00 00 00 
    if(p->s.size >= nunits){
 525:	e9 36 ff ff ff       	jmp    460 <malloc+0x30>
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 530:	8b 0a                	mov    (%edx),%ecx
 532:	89 08                	mov    %ecx,(%eax)
 534:	eb b1                	jmp    4e7 <malloc+0xb7>
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi

00000540 <thread_create>:
{
 540:	f3 0f 1e fb          	endbr32 
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 54a:	68 00 10 00 00       	push   $0x1000
 54f:	e8 dc fe ff ff       	call   430 <malloc>
return clone(start_routine,arg1,arg2,stack);
 554:	50                   	push   %eax
 555:	ff 75 10             	pushl  0x10(%ebp)
 558:	ff 75 0c             	pushl  0xc(%ebp)
 55b:	ff 75 08             	pushl  0x8(%ebp)
 55e:	e8 ba 00 00 00       	call   61d <clone>
}
 563:	c9                   	leave  
 564:	c3                   	ret    

00000565 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 565:	b8 01 00 00 00       	mov    $0x1,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <exit>:
SYSCALL(exit)
 56d:	b8 02 00 00 00       	mov    $0x2,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <wait>:
SYSCALL(wait)
 575:	b8 03 00 00 00       	mov    $0x3,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <pipe>:
SYSCALL(pipe)
 57d:	b8 04 00 00 00       	mov    $0x4,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <read>:
SYSCALL(read)
 585:	b8 05 00 00 00       	mov    $0x5,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <write>:
SYSCALL(write)
 58d:	b8 10 00 00 00       	mov    $0x10,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <close>:
SYSCALL(close)
 595:	b8 15 00 00 00       	mov    $0x15,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <kill>:
SYSCALL(kill)
 59d:	b8 06 00 00 00       	mov    $0x6,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <exec>:
SYSCALL(exec)
 5a5:	b8 07 00 00 00       	mov    $0x7,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <open>:
SYSCALL(open)
 5ad:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <mknod>:
SYSCALL(mknod)
 5b5:	b8 11 00 00 00       	mov    $0x11,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <unlink>:
SYSCALL(unlink)
 5bd:	b8 12 00 00 00       	mov    $0x12,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <fstat>:
SYSCALL(fstat)
 5c5:	b8 08 00 00 00       	mov    $0x8,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <link>:
SYSCALL(link)
 5cd:	b8 13 00 00 00       	mov    $0x13,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <mkdir>:
SYSCALL(mkdir)
 5d5:	b8 14 00 00 00       	mov    $0x14,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <chdir>:
SYSCALL(chdir)
 5dd:	b8 09 00 00 00       	mov    $0x9,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <dup>:
SYSCALL(dup)
 5e5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <getpid>:
SYSCALL(getpid)
 5ed:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <getyear>:
SYSCALL(getyear)
 5f5:	b8 16 00 00 00       	mov    $0x16,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <getreadcount>:
SYSCALL(getreadcount)
 5fd:	b8 17 00 00 00       	mov    $0x17,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <sbrk>:
SYSCALL(sbrk)
 605:	b8 0c 00 00 00       	mov    $0xc,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <sleep>:
SYSCALL(sleep)
 60d:	b8 0d 00 00 00       	mov    $0xd,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <uptime>:
SYSCALL(uptime)
 615:	b8 0e 00 00 00       	mov    $0xe,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <clone>:
SYSCALL(clone)
 61d:	b8 18 00 00 00       	mov    $0x18,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    
 625:	66 90                	xchg   %ax,%ax
 627:	66 90                	xchg   %ax,%ax
 629:	66 90                	xchg   %ax,%ax
 62b:	66 90                	xchg   %ax,%ax
 62d:	66 90                	xchg   %ax,%ax
 62f:	90                   	nop

00000630 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 3c             	sub    $0x3c,%esp
 639:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 63c:	89 d1                	mov    %edx,%ecx
{
 63e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 641:	85 d2                	test   %edx,%edx
 643:	0f 89 7f 00 00 00    	jns    6c8 <printint+0x98>
 649:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 64d:	74 79                	je     6c8 <printint+0x98>
    neg = 1;
 64f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 656:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 658:	31 db                	xor    %ebx,%ebx
 65a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 65d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 660:	89 c8                	mov    %ecx,%eax
 662:	31 d2                	xor    %edx,%edx
 664:	89 cf                	mov    %ecx,%edi
 666:	f7 75 c4             	divl   -0x3c(%ebp)
 669:	0f b6 92 d4 08 00 00 	movzbl 0x8d4(%edx),%edx
 670:	89 45 c0             	mov    %eax,-0x40(%ebp)
 673:	89 d8                	mov    %ebx,%eax
 675:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 678:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 67b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 67e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 681:	76 dd                	jbe    660 <printint+0x30>
  if(neg)
 683:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 686:	85 c9                	test   %ecx,%ecx
 688:	74 0c                	je     696 <printint+0x66>
    buf[i++] = '-';
 68a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 68f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 691:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 696:	8b 7d b8             	mov    -0x48(%ebp),%edi
 699:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 69d:	eb 07                	jmp    6a6 <printint+0x76>
 69f:	90                   	nop
 6a0:	0f b6 13             	movzbl (%ebx),%edx
 6a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6a6:	83 ec 04             	sub    $0x4,%esp
 6a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6ac:	6a 01                	push   $0x1
 6ae:	56                   	push   %esi
 6af:	57                   	push   %edi
 6b0:	e8 d8 fe ff ff       	call   58d <write>
  while(--i >= 0)
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	39 de                	cmp    %ebx,%esi
 6ba:	75 e4                	jne    6a0 <printint+0x70>
    putc(fd, buf[i]);
}
 6bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5f                   	pop    %edi
 6c2:	5d                   	pop    %ebp
 6c3:	c3                   	ret    
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6cf:	eb 87                	jmp    658 <printint+0x28>
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop

000006e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6e0:	f3 0f 1e fb          	endbr32 
 6e4:	55                   	push   %ebp
 6e5:	89 e5                	mov    %esp,%ebp
 6e7:	57                   	push   %edi
 6e8:	56                   	push   %esi
 6e9:	53                   	push   %ebx
 6ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6ed:	8b 75 0c             	mov    0xc(%ebp),%esi
 6f0:	0f b6 1e             	movzbl (%esi),%ebx
 6f3:	84 db                	test   %bl,%bl
 6f5:	0f 84 b4 00 00 00    	je     7af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6fb:	8d 45 10             	lea    0x10(%ebp),%eax
 6fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 701:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 704:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 706:	89 45 d0             	mov    %eax,-0x30(%ebp)
 709:	eb 33                	jmp    73e <printf+0x5e>
 70b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
 710:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 713:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 718:	83 f8 25             	cmp    $0x25,%eax
 71b:	74 17                	je     734 <printf+0x54>
  write(fd, &c, 1);
 71d:	83 ec 04             	sub    $0x4,%esp
 720:	88 5d e7             	mov    %bl,-0x19(%ebp)
 723:	6a 01                	push   $0x1
 725:	57                   	push   %edi
 726:	ff 75 08             	pushl  0x8(%ebp)
 729:	e8 5f fe ff ff       	call   58d <write>
 72e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 731:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 734:	0f b6 1e             	movzbl (%esi),%ebx
 737:	83 c6 01             	add    $0x1,%esi
 73a:	84 db                	test   %bl,%bl
 73c:	74 71                	je     7af <printf+0xcf>
    c = fmt[i] & 0xff;
 73e:	0f be cb             	movsbl %bl,%ecx
 741:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 744:	85 d2                	test   %edx,%edx
 746:	74 c8                	je     710 <printf+0x30>
      }
    } else if(state == '%'){
 748:	83 fa 25             	cmp    $0x25,%edx
 74b:	75 e7                	jne    734 <printf+0x54>
      if(c == 'd'){
 74d:	83 f8 64             	cmp    $0x64,%eax
 750:	0f 84 9a 00 00 00    	je     7f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 756:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 75c:	83 f9 70             	cmp    $0x70,%ecx
 75f:	74 5f                	je     7c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 761:	83 f8 73             	cmp    $0x73,%eax
 764:	0f 84 d6 00 00 00    	je     840 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 76a:	83 f8 63             	cmp    $0x63,%eax
 76d:	0f 84 8d 00 00 00    	je     800 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 773:	83 f8 25             	cmp    $0x25,%eax
 776:	0f 84 b4 00 00 00    	je     830 <printf+0x150>
  write(fd, &c, 1);
 77c:	83 ec 04             	sub    $0x4,%esp
 77f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 783:	6a 01                	push   $0x1
 785:	57                   	push   %edi
 786:	ff 75 08             	pushl  0x8(%ebp)
 789:	e8 ff fd ff ff       	call   58d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 78e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 791:	83 c4 0c             	add    $0xc,%esp
 794:	6a 01                	push   $0x1
 796:	83 c6 01             	add    $0x1,%esi
 799:	57                   	push   %edi
 79a:	ff 75 08             	pushl  0x8(%ebp)
 79d:	e8 eb fd ff ff       	call   58d <write>
  for(i = 0; fmt[i]; i++){
 7a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 7a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 7a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 7ab:	84 db                	test   %bl,%bl
 7ad:	75 8f                	jne    73e <printf+0x5e>
    }
  }
}
 7af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b2:	5b                   	pop    %ebx
 7b3:	5e                   	pop    %esi
 7b4:	5f                   	pop    %edi
 7b5:	5d                   	pop    %ebp
 7b6:	c3                   	ret    
 7b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7c8:	6a 00                	push   $0x0
 7ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7cd:	8b 45 08             	mov    0x8(%ebp),%eax
 7d0:	8b 13                	mov    (%ebx),%edx
 7d2:	e8 59 fe ff ff       	call   630 <printint>
        ap++;
 7d7:	89 d8                	mov    %ebx,%eax
 7d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7dc:	31 d2                	xor    %edx,%edx
        ap++;
 7de:	83 c0 04             	add    $0x4,%eax
 7e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7e4:	e9 4b ff ff ff       	jmp    734 <printf+0x54>
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f8:	6a 01                	push   $0x1
 7fa:	eb ce                	jmp    7ca <printf+0xea>
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 800:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 803:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 806:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 808:	6a 01                	push   $0x1
        ap++;
 80a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 80d:	57                   	push   %edi
 80e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 811:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 814:	e8 74 fd ff ff       	call   58d <write>
        ap++;
 819:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 81c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 81f:	31 d2                	xor    %edx,%edx
 821:	e9 0e ff ff ff       	jmp    734 <printf+0x54>
 826:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 830:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 833:	83 ec 04             	sub    $0x4,%esp
 836:	e9 59 ff ff ff       	jmp    794 <printf+0xb4>
 83b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
        s = (char*)*ap;
 840:	8b 45 d0             	mov    -0x30(%ebp),%eax
 843:	8b 18                	mov    (%eax),%ebx
        ap++;
 845:	83 c0 04             	add    $0x4,%eax
 848:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 84b:	85 db                	test   %ebx,%ebx
 84d:	74 17                	je     866 <printf+0x186>
        while(*s != 0){
 84f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 852:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 854:	84 c0                	test   %al,%al
 856:	0f 84 d8 fe ff ff    	je     734 <printf+0x54>
 85c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 85f:	89 de                	mov    %ebx,%esi
 861:	8b 5d 08             	mov    0x8(%ebp),%ebx
 864:	eb 1a                	jmp    880 <printf+0x1a0>
          s = "(null)";
 866:	bb cb 08 00 00       	mov    $0x8cb,%ebx
        while(*s != 0){
 86b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 86e:	b8 28 00 00 00       	mov    $0x28,%eax
 873:	89 de                	mov    %ebx,%esi
 875:	8b 5d 08             	mov    0x8(%ebp),%ebx
 878:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop
  write(fd, &c, 1);
 880:	83 ec 04             	sub    $0x4,%esp
          s++;
 883:	83 c6 01             	add    $0x1,%esi
 886:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 889:	6a 01                	push   $0x1
 88b:	57                   	push   %edi
 88c:	53                   	push   %ebx
 88d:	e8 fb fc ff ff       	call   58d <write>
        while(*s != 0){
 892:	0f b6 06             	movzbl (%esi),%eax
 895:	83 c4 10             	add    $0x10,%esp
 898:	84 c0                	test   %al,%al
 89a:	75 e4                	jne    880 <printf+0x1a0>
 89c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 89f:	31 d2                	xor    %edx,%edx
 8a1:	e9 8e fe ff ff       	jmp    734 <printf+0x54>
