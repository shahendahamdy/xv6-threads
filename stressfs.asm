
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
  2f:	68 28 09 00 00       	push   $0x928
  34:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  36:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  3d:	74 72 65 
  40:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  47:	73 66 73 
  printf(1, "stressfs starting\n");
  4a:	e8 11 07 00 00       	call   760 <printf>
  memset(data, 'a', sizeof(data));
  4f:	83 c4 0c             	add    $0xc,%esp
  52:	68 00 02 00 00       	push   $0x200
  57:	6a 61                	push   $0x61
  59:	56                   	push   %esi
  5a:	e8 a1 01 00 00       	call   200 <memset>
  5f:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  62:	e8 7e 05 00 00       	call   5e5 <fork>
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
  85:	68 3b 09 00 00       	push   $0x93b
  8a:	6a 01                	push   $0x1
  8c:	e8 cf 06 00 00       	call   760 <printf>
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
  a7:	e8 81 05 00 00       	call   62d <open>
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
  c2:	e8 46 05 00 00       	call   60d <write>
  for(i = 0; i < 20; i++)
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	83 eb 01             	sub    $0x1,%ebx
  cd:	75 e9                	jne    b8 <main+0xb8>
  close(fd);
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	57                   	push   %edi
  d3:	e8 3d 05 00 00       	call   615 <close>

  printf(1, "read\n");
  d8:	58                   	pop    %eax
  d9:	5a                   	pop    %edx
  da:	68 45 09 00 00       	push   $0x945
  df:	6a 01                	push   $0x1
  e1:	e8 7a 06 00 00       	call   760 <printf>

  fd = open(path, O_RDONLY);
  e6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  ec:	59                   	pop    %ecx
  ed:	5b                   	pop    %ebx
  ee:	6a 00                	push   $0x0
  f0:	bb 14 00 00 00       	mov    $0x14,%ebx
  f5:	50                   	push   %eax
  f6:	e8 32 05 00 00       	call   62d <open>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 f6 04 00 00       	call   605 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 f5 04 00 00       	call   615 <close>

  wait();
 120:	e8 d0 04 00 00       	call   5f5 <wait>

  exit();
 125:	e8 c3 04 00 00       	call   5ed <exit>
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
};


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
 28b:	e8 75 03 00 00       	call   605 <read>
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
 2f1:	e8 37 03 00 00       	call   62d <open>
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
 306:	e8 3a 03 00 00       	call   645 <fstat>
  close(fd);
 30b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30e:	89 c6                	mov    %eax,%esi
  close(fd);
 310:	e8 00 03 00 00       	call   615 <close>
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

000003a0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 3aa:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ad:	50                   	push   %eax
 3ae:	e8 f2 02 00 00       	call   6a5 <join>
  
  return x;
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    
 3b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <lock_init>:

void lock_init(struct lock_t *lk){
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3d0:	5d                   	pop    %ebp
 3d1:	c3                   	ret    
 3d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003e0 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3e5:	b9 01 00 00 00       	mov    $0x1,%ecx
 3ea:	89 e5                	mov    %esp,%ebp
 3ec:	8b 55 08             	mov    0x8(%ebp),%edx
 3ef:	90                   	nop
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 3f5:	85 c0                	test   %eax,%eax
 3f7:	75 f7                	jne    3f0 <lock_acquire+0x10>
}
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <lock_release>:
void lock_release(struct lock_t *lk){
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	31 c0                	xor    %eax,%eax
 407:	89 e5                	mov    %esp,%ebp
 409:	8b 55 08             	mov    0x8(%ebp),%edx
 40c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 425:	a1 ac 0c 00 00       	mov    0xcac,%eax
{
 42a:	89 e5                	mov    %esp,%ebp
 42c:	57                   	push   %edi
 42d:	56                   	push   %esi
 42e:	53                   	push   %ebx
 42f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 432:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 434:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 437:	39 c8                	cmp    %ecx,%eax
 439:	73 15                	jae    450 <free+0x30>
 43b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop
 440:	39 d1                	cmp    %edx,%ecx
 442:	72 14                	jb     458 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 444:	39 d0                	cmp    %edx,%eax
 446:	73 10                	jae    458 <free+0x38>
{
 448:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 44a:	8b 10                	mov    (%eax),%edx
 44c:	39 c8                	cmp    %ecx,%eax
 44e:	72 f0                	jb     440 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 450:	39 d0                	cmp    %edx,%eax
 452:	72 f4                	jb     448 <free+0x28>
 454:	39 d1                	cmp    %edx,%ecx
 456:	73 f0                	jae    448 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 458:	8b 73 fc             	mov    -0x4(%ebx),%esi
 45b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 45e:	39 fa                	cmp    %edi,%edx
 460:	74 1e                	je     480 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 462:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 465:	8b 50 04             	mov    0x4(%eax),%edx
 468:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 46b:	39 f1                	cmp    %esi,%ecx
 46d:	74 28                	je     497 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 46f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 471:	5b                   	pop    %ebx
  freep = p;
 472:	a3 ac 0c 00 00       	mov    %eax,0xcac
}
 477:	5e                   	pop    %esi
 478:	5f                   	pop    %edi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 480:	03 72 04             	add    0x4(%edx),%esi
 483:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 486:	8b 10                	mov    (%eax),%edx
 488:	8b 12                	mov    (%edx),%edx
 48a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 48d:	8b 50 04             	mov    0x4(%eax),%edx
 490:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 493:	39 f1                	cmp    %esi,%ecx
 495:	75 d8                	jne    46f <free+0x4f>
    p->s.size += bp->s.size;
 497:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 49a:	a3 ac 0c 00 00       	mov    %eax,0xcac
    p->s.size += bp->s.size;
 49f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 4a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 4a5:	89 10                	mov    %edx,(%eax)
}
 4a7:	5b                   	pop    %ebx
 4a8:	5e                   	pop    %esi
 4a9:	5f                   	pop    %edi
 4aa:	5d                   	pop    %ebp
 4ab:	c3                   	ret    
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 4b0:	f3 0f 1e fb          	endbr32 
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	57                   	push   %edi
 4b8:	56                   	push   %esi
 4b9:	53                   	push   %ebx
 4ba:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4bd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 4c0:	8b 3d ac 0c 00 00    	mov    0xcac,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4c6:	8d 70 07             	lea    0x7(%eax),%esi
 4c9:	c1 ee 03             	shr    $0x3,%esi
 4cc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 4cf:	85 ff                	test   %edi,%edi
 4d1:	0f 84 a9 00 00 00    	je     580 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4d7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 4d9:	8b 48 04             	mov    0x4(%eax),%ecx
 4dc:	39 f1                	cmp    %esi,%ecx
 4de:	73 6d                	jae    54d <malloc+0x9d>
 4e0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 4e6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 4eb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 4ee:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 4f5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 4f8:	eb 17                	jmp    511 <malloc+0x61>
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 500:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 502:	8b 4a 04             	mov    0x4(%edx),%ecx
 505:	39 f1                	cmp    %esi,%ecx
 507:	73 4f                	jae    558 <malloc+0xa8>
 509:	8b 3d ac 0c 00 00    	mov    0xcac,%edi
 50f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 511:	39 c7                	cmp    %eax,%edi
 513:	75 eb                	jne    500 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 515:	83 ec 0c             	sub    $0xc,%esp
 518:	ff 75 e4             	pushl  -0x1c(%ebp)
 51b:	e8 65 01 00 00       	call   685 <sbrk>
  if(p == (char*)-1)
 520:	83 c4 10             	add    $0x10,%esp
 523:	83 f8 ff             	cmp    $0xffffffff,%eax
 526:	74 1b                	je     543 <malloc+0x93>
  hp->s.size = nu;
 528:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 52b:	83 ec 0c             	sub    $0xc,%esp
 52e:	83 c0 08             	add    $0x8,%eax
 531:	50                   	push   %eax
 532:	e8 e9 fe ff ff       	call   420 <free>
  return freep;
 537:	a1 ac 0c 00 00       	mov    0xcac,%eax
      if((p = morecore(nunits)) == 0)
 53c:	83 c4 10             	add    $0x10,%esp
 53f:	85 c0                	test   %eax,%eax
 541:	75 bd                	jne    500 <malloc+0x50>
        return 0;
  }
}
 543:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 546:	31 c0                	xor    %eax,%eax
}
 548:	5b                   	pop    %ebx
 549:	5e                   	pop    %esi
 54a:	5f                   	pop    %edi
 54b:	5d                   	pop    %ebp
 54c:	c3                   	ret    
    if(p->s.size >= nunits){
 54d:	89 c2                	mov    %eax,%edx
 54f:	89 f8                	mov    %edi,%eax
 551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 558:	39 ce                	cmp    %ecx,%esi
 55a:	74 54                	je     5b0 <malloc+0x100>
        p->s.size -= nunits;
 55c:	29 f1                	sub    %esi,%ecx
 55e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 561:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 564:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 567:	a3 ac 0c 00 00       	mov    %eax,0xcac
}
 56c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 56f:	8d 42 08             	lea    0x8(%edx),%eax
}
 572:	5b                   	pop    %ebx
 573:	5e                   	pop    %esi
 574:	5f                   	pop    %edi
 575:	5d                   	pop    %ebp
 576:	c3                   	ret    
 577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 580:	c7 05 ac 0c 00 00 b0 	movl   $0xcb0,0xcac
 587:	0c 00 00 
    base.s.size = 0;
 58a:	bf b0 0c 00 00       	mov    $0xcb0,%edi
    base.s.ptr = freep = prevp = &base;
 58f:	c7 05 b0 0c 00 00 b0 	movl   $0xcb0,0xcb0
 596:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 599:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 59b:	c7 05 b4 0c 00 00 00 	movl   $0x0,0xcb4
 5a2:	00 00 00 
    if(p->s.size >= nunits){
 5a5:	e9 36 ff ff ff       	jmp    4e0 <malloc+0x30>
 5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 5b0:	8b 0a                	mov    (%edx),%ecx
 5b2:	89 08                	mov    %ecx,(%eax)
 5b4:	eb b1                	jmp    567 <malloc+0xb7>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi

000005c0 <thread_create>:
{
 5c0:	f3 0f 1e fb          	endbr32 
 5c4:	55                   	push   %ebp
 5c5:	89 e5                	mov    %esp,%ebp
 5c7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 5ca:	68 00 10 00 00       	push   $0x1000
 5cf:	e8 dc fe ff ff       	call   4b0 <malloc>
return clone(start_routine,arg1,arg2,stack);
 5d4:	50                   	push   %eax
 5d5:	ff 75 10             	pushl  0x10(%ebp)
 5d8:	ff 75 0c             	pushl  0xc(%ebp)
 5db:	ff 75 08             	pushl  0x8(%ebp)
 5de:	e8 ba 00 00 00       	call   69d <clone>
}
 5e3:	c9                   	leave  
 5e4:	c3                   	ret    

000005e5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5e5:	b8 01 00 00 00       	mov    $0x1,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <exit>:
SYSCALL(exit)
 5ed:	b8 02 00 00 00       	mov    $0x2,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <wait>:
SYSCALL(wait)
 5f5:	b8 03 00 00 00       	mov    $0x3,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <pipe>:
SYSCALL(pipe)
 5fd:	b8 04 00 00 00       	mov    $0x4,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <read>:
SYSCALL(read)
 605:	b8 05 00 00 00       	mov    $0x5,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <write>:
SYSCALL(write)
 60d:	b8 10 00 00 00       	mov    $0x10,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <close>:
SYSCALL(close)
 615:	b8 15 00 00 00       	mov    $0x15,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <kill>:
SYSCALL(kill)
 61d:	b8 06 00 00 00       	mov    $0x6,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <exec>:
SYSCALL(exec)
 625:	b8 07 00 00 00       	mov    $0x7,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <open>:
SYSCALL(open)
 62d:	b8 0f 00 00 00       	mov    $0xf,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <mknod>:
SYSCALL(mknod)
 635:	b8 11 00 00 00       	mov    $0x11,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <unlink>:
SYSCALL(unlink)
 63d:	b8 12 00 00 00       	mov    $0x12,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <fstat>:
SYSCALL(fstat)
 645:	b8 08 00 00 00       	mov    $0x8,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <link>:
SYSCALL(link)
 64d:	b8 13 00 00 00       	mov    $0x13,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <mkdir>:
SYSCALL(mkdir)
 655:	b8 14 00 00 00       	mov    $0x14,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <chdir>:
SYSCALL(chdir)
 65d:	b8 09 00 00 00       	mov    $0x9,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <dup>:
SYSCALL(dup)
 665:	b8 0a 00 00 00       	mov    $0xa,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <getpid>:
SYSCALL(getpid)
 66d:	b8 0b 00 00 00       	mov    $0xb,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <getyear>:
SYSCALL(getyear)
 675:	b8 16 00 00 00       	mov    $0x16,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <getreadcount>:
SYSCALL(getreadcount)
 67d:	b8 17 00 00 00       	mov    $0x17,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <sbrk>:
SYSCALL(sbrk)
 685:	b8 0c 00 00 00       	mov    $0xc,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <sleep>:
SYSCALL(sleep)
 68d:	b8 0d 00 00 00       	mov    $0xd,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <uptime>:
SYSCALL(uptime)
 695:	b8 0e 00 00 00       	mov    $0xe,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    

0000069d <clone>:
SYSCALL(clone)
 69d:	b8 18 00 00 00       	mov    $0x18,%eax
 6a2:	cd 40                	int    $0x40
 6a4:	c3                   	ret    

000006a5 <join>:
SYSCALL(join)
 6a5:	b8 19 00 00 00       	mov    $0x19,%eax
 6aa:	cd 40                	int    $0x40
 6ac:	c3                   	ret    
 6ad:	66 90                	xchg   %ax,%ax
 6af:	90                   	nop

000006b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 3c             	sub    $0x3c,%esp
 6b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6bc:	89 d1                	mov    %edx,%ecx
{
 6be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6c1:	85 d2                	test   %edx,%edx
 6c3:	0f 89 7f 00 00 00    	jns    748 <printint+0x98>
 6c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6cd:	74 79                	je     748 <printint+0x98>
    neg = 1;
 6cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6d8:	31 db                	xor    %ebx,%ebx
 6da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6e0:	89 c8                	mov    %ecx,%eax
 6e2:	31 d2                	xor    %edx,%edx
 6e4:	89 cf                	mov    %ecx,%edi
 6e6:	f7 75 c4             	divl   -0x3c(%ebp)
 6e9:	0f b6 92 54 09 00 00 	movzbl 0x954(%edx),%edx
 6f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6f3:	89 d8                	mov    %ebx,%eax
 6f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 701:	76 dd                	jbe    6e0 <printint+0x30>
  if(neg)
 703:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 706:	85 c9                	test   %ecx,%ecx
 708:	74 0c                	je     716 <printint+0x66>
    buf[i++] = '-';
 70a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 70f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 711:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 716:	8b 7d b8             	mov    -0x48(%ebp),%edi
 719:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 71d:	eb 07                	jmp    726 <printint+0x76>
 71f:	90                   	nop
 720:	0f b6 13             	movzbl (%ebx),%edx
 723:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 726:	83 ec 04             	sub    $0x4,%esp
 729:	88 55 d7             	mov    %dl,-0x29(%ebp)
 72c:	6a 01                	push   $0x1
 72e:	56                   	push   %esi
 72f:	57                   	push   %edi
 730:	e8 d8 fe ff ff       	call   60d <write>
  while(--i >= 0)
 735:	83 c4 10             	add    $0x10,%esp
 738:	39 de                	cmp    %ebx,%esi
 73a:	75 e4                	jne    720 <printint+0x70>
    putc(fd, buf[i]);
}
 73c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 73f:	5b                   	pop    %ebx
 740:	5e                   	pop    %esi
 741:	5f                   	pop    %edi
 742:	5d                   	pop    %ebp
 743:	c3                   	ret    
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 748:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 74f:	eb 87                	jmp    6d8 <printint+0x28>
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 758:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75f:	90                   	nop

00000760 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 760:	f3 0f 1e fb          	endbr32 
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	57                   	push   %edi
 768:	56                   	push   %esi
 769:	53                   	push   %ebx
 76a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 76d:	8b 75 0c             	mov    0xc(%ebp),%esi
 770:	0f b6 1e             	movzbl (%esi),%ebx
 773:	84 db                	test   %bl,%bl
 775:	0f 84 b4 00 00 00    	je     82f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 77b:	8d 45 10             	lea    0x10(%ebp),%eax
 77e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 781:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 784:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 786:	89 45 d0             	mov    %eax,-0x30(%ebp)
 789:	eb 33                	jmp    7be <printf+0x5e>
 78b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop
 790:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 793:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 798:	83 f8 25             	cmp    $0x25,%eax
 79b:	74 17                	je     7b4 <printf+0x54>
  write(fd, &c, 1);
 79d:	83 ec 04             	sub    $0x4,%esp
 7a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7a3:	6a 01                	push   $0x1
 7a5:	57                   	push   %edi
 7a6:	ff 75 08             	pushl  0x8(%ebp)
 7a9:	e8 5f fe ff ff       	call   60d <write>
 7ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 7b1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7b4:	0f b6 1e             	movzbl (%esi),%ebx
 7b7:	83 c6 01             	add    $0x1,%esi
 7ba:	84 db                	test   %bl,%bl
 7bc:	74 71                	je     82f <printf+0xcf>
    c = fmt[i] & 0xff;
 7be:	0f be cb             	movsbl %bl,%ecx
 7c1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7c4:	85 d2                	test   %edx,%edx
 7c6:	74 c8                	je     790 <printf+0x30>
      }
    } else if(state == '%'){
 7c8:	83 fa 25             	cmp    $0x25,%edx
 7cb:	75 e7                	jne    7b4 <printf+0x54>
      if(c == 'd'){
 7cd:	83 f8 64             	cmp    $0x64,%eax
 7d0:	0f 84 9a 00 00 00    	je     870 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7d6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7dc:	83 f9 70             	cmp    $0x70,%ecx
 7df:	74 5f                	je     840 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7e1:	83 f8 73             	cmp    $0x73,%eax
 7e4:	0f 84 d6 00 00 00    	je     8c0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7ea:	83 f8 63             	cmp    $0x63,%eax
 7ed:	0f 84 8d 00 00 00    	je     880 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7f3:	83 f8 25             	cmp    $0x25,%eax
 7f6:	0f 84 b4 00 00 00    	je     8b0 <printf+0x150>
  write(fd, &c, 1);
 7fc:	83 ec 04             	sub    $0x4,%esp
 7ff:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 803:	6a 01                	push   $0x1
 805:	57                   	push   %edi
 806:	ff 75 08             	pushl  0x8(%ebp)
 809:	e8 ff fd ff ff       	call   60d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 80e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 811:	83 c4 0c             	add    $0xc,%esp
 814:	6a 01                	push   $0x1
 816:	83 c6 01             	add    $0x1,%esi
 819:	57                   	push   %edi
 81a:	ff 75 08             	pushl  0x8(%ebp)
 81d:	e8 eb fd ff ff       	call   60d <write>
  for(i = 0; fmt[i]; i++){
 822:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 826:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 829:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 82b:	84 db                	test   %bl,%bl
 82d:	75 8f                	jne    7be <printf+0x5e>
    }
  }
}
 82f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 832:	5b                   	pop    %ebx
 833:	5e                   	pop    %esi
 834:	5f                   	pop    %edi
 835:	5d                   	pop    %ebp
 836:	c3                   	ret    
 837:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 840:	83 ec 0c             	sub    $0xc,%esp
 843:	b9 10 00 00 00       	mov    $0x10,%ecx
 848:	6a 00                	push   $0x0
 84a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 84d:	8b 45 08             	mov    0x8(%ebp),%eax
 850:	8b 13                	mov    (%ebx),%edx
 852:	e8 59 fe ff ff       	call   6b0 <printint>
        ap++;
 857:	89 d8                	mov    %ebx,%eax
 859:	83 c4 10             	add    $0x10,%esp
      state = 0;
 85c:	31 d2                	xor    %edx,%edx
        ap++;
 85e:	83 c0 04             	add    $0x4,%eax
 861:	89 45 d0             	mov    %eax,-0x30(%ebp)
 864:	e9 4b ff ff ff       	jmp    7b4 <printf+0x54>
 869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	b9 0a 00 00 00       	mov    $0xa,%ecx
 878:	6a 01                	push   $0x1
 87a:	eb ce                	jmp    84a <printf+0xea>
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 880:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 883:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 886:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 888:	6a 01                	push   $0x1
        ap++;
 88a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 88d:	57                   	push   %edi
 88e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 891:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 894:	e8 74 fd ff ff       	call   60d <write>
        ap++;
 899:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 89c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 89f:	31 d2                	xor    %edx,%edx
 8a1:	e9 0e ff ff ff       	jmp    7b4 <printf+0x54>
 8a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 8b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8b3:	83 ec 04             	sub    $0x4,%esp
 8b6:	e9 59 ff ff ff       	jmp    814 <printf+0xb4>
 8bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8bf:	90                   	nop
        s = (char*)*ap;
 8c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8c3:	8b 18                	mov    (%eax),%ebx
        ap++;
 8c5:	83 c0 04             	add    $0x4,%eax
 8c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8cb:	85 db                	test   %ebx,%ebx
 8cd:	74 17                	je     8e6 <printf+0x186>
        while(*s != 0){
 8cf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 8d2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 8d4:	84 c0                	test   %al,%al
 8d6:	0f 84 d8 fe ff ff    	je     7b4 <printf+0x54>
 8dc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8df:	89 de                	mov    %ebx,%esi
 8e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8e4:	eb 1a                	jmp    900 <printf+0x1a0>
          s = "(null)";
 8e6:	bb 4b 09 00 00       	mov    $0x94b,%ebx
        while(*s != 0){
 8eb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8ee:	b8 28 00 00 00       	mov    $0x28,%eax
 8f3:	89 de                	mov    %ebx,%esi
 8f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ff:	90                   	nop
  write(fd, &c, 1);
 900:	83 ec 04             	sub    $0x4,%esp
          s++;
 903:	83 c6 01             	add    $0x1,%esi
 906:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 909:	6a 01                	push   $0x1
 90b:	57                   	push   %edi
 90c:	53                   	push   %ebx
 90d:	e8 fb fc ff ff       	call   60d <write>
        while(*s != 0){
 912:	0f b6 06             	movzbl (%esi),%eax
 915:	83 c4 10             	add    $0x10,%esp
 918:	84 c0                	test   %al,%al
 91a:	75 e4                	jne    900 <printf+0x1a0>
 91c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 91f:	31 d2                	xor    %edx,%edx
 921:	e9 8e fe ff ff       	jmp    7b4 <printf+0x54>
