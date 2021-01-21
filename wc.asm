
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  2b:	7e 52                	jle    7f <main+0x7f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 e1 05 00 00       	call   61d <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 a7 05 00 00       	call   605 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 72 05 00 00       	call   5dd <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 3b 09 00 00       	push   $0x93b
  73:	6a 01                	push   $0x1
  75:	e8 d6 06 00 00       	call   750 <printf>
      exit();
  7a:	e8 5e 05 00 00       	call   5dd <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 2d 09 00 00       	push   $0x92d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 4b 05 00 00       	call   5dd <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	56                   	push   %esi
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c8:	83 ec 04             	sub    $0x4,%esp
  cb:	68 00 02 00 00       	push   $0x200
  d0:	68 a0 0c 00 00       	push   $0xca0
  d5:	ff 75 08             	pushl  0x8(%ebp)
  d8:	e8 18 05 00 00       	call   5f5 <read>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	89 c6                	mov    %eax,%esi
  e2:	85 c0                	test   %eax,%eax
  e4:	7e 62                	jle    148 <wc+0xa8>
    for(i=0; i<n; i++){
  e6:	31 ff                	xor    %edi,%edi
  e8:	eb 14                	jmp    fe <wc+0x5e>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  f7:	83 c7 01             	add    $0x1,%edi
  fa:	39 fe                	cmp    %edi,%esi
  fc:	74 42                	je     140 <wc+0xa0>
      if(buf[i] == '\n')
  fe:	0f be 87 a0 0c 00 00 	movsbl 0xca0(%edi),%eax
        l++;
 105:	31 c9                	xor    %ecx,%ecx
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	83 ec 08             	sub    $0x8,%esp
 10f:	50                   	push   %eax
        l++;
 110:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 112:	68 18 09 00 00       	push   $0x918
 117:	e8 54 01 00 00       	call   270 <strchr>
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	75 cd                	jne    f0 <wc+0x50>
      else if(!inword){
 123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 126:	85 d2                	test   %edx,%edx
 128:	75 cd                	jne    f7 <wc+0x57>
    for(i=0; i<n; i++){
 12a:	83 c7 01             	add    $0x1,%edi
        w++;
 12d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 131:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 138:	39 fe                	cmp    %edi,%esi
 13a:	75 c2                	jne    fe <wc+0x5e>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	01 75 dc             	add    %esi,-0x24(%ebp)
 143:	eb 83                	jmp    c8 <wc+0x28>
 145:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 148:	75 24                	jne    16e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 14a:	83 ec 08             	sub    $0x8,%esp
 14d:	ff 75 0c             	pushl  0xc(%ebp)
 150:	ff 75 dc             	pushl  -0x24(%ebp)
 153:	ff 75 e0             	pushl  -0x20(%ebp)
 156:	53                   	push   %ebx
 157:	68 2e 09 00 00       	push   $0x92e
 15c:	6a 01                	push   $0x1
 15e:	e8 ed 05 00 00       	call   750 <printf>
}
 163:	83 c4 20             	add    $0x20,%esp
 166:	8d 65 f4             	lea    -0xc(%ebp),%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
    printf(1, "wc: read error\n");
 16e:	50                   	push   %eax
 16f:	50                   	push   %eax
 170:	68 1e 09 00 00       	push   $0x91e
 175:	6a 01                	push   $0x1
 177:	e8 d4 05 00 00       	call   750 <printf>
    exit();
 17c:	e8 5c 04 00 00       	call   5dd <exit>
 181:	66 90                	xchg   %ax,%ax
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 195:	31 c0                	xor    %eax,%eax
{
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	89 c8                	mov    %ecx,%eax
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	0f b6 1a             	movzbl (%edx),%ebx
 1d4:	84 c0                	test   %al,%al
 1d6:	75 19                	jne    1f1 <strcmp+0x31>
 1d8:	eb 26                	jmp    200 <strcmp+0x40>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1e4:	83 c1 01             	add    $0x1,%ecx
 1e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ea:	0f b6 1a             	movzbl (%edx),%ebx
 1ed:	84 c0                	test   %al,%al
 1ef:	74 0f                	je     200 <strcmp+0x40>
 1f1:	38 d8                	cmp    %bl,%al
 1f3:	74 eb                	je     1e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1f5:	29 d8                	sub    %ebx,%eax
}
 1f7:	5b                   	pop    %ebx
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 200:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 202:	29 d8                	sub    %ebx,%eax
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 21a:	80 3a 00             	cmpb   $0x0,(%edx)
 21d:	74 21                	je     240 <strlen+0x30>
 21f:	31 c0                	xor    %eax,%eax
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	83 c0 01             	add    $0x1,%eax
 22b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 22f:	89 c1                	mov    %eax,%ecx
 231:	75 f5                	jne    228 <strlen+0x18>
    ;
  return n;
}
 233:	89 c8                	mov    %ecx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	89 d7                	mov    %edx,%edi
 263:	fc                   	cld    
 264:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27e:	0f b6 10             	movzbl (%eax),%edx
 281:	84 d2                	test   %dl,%dl
 283:	75 16                	jne    29b <strchr+0x2b>
 285:	eb 21                	jmp    2a8 <strchr+0x38>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax
 290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 294:	83 c0 01             	add    $0x1,%eax
 297:	84 d2                	test   %dl,%dl
 299:	74 0d                	je     2a8 <strchr+0x38>
    if(*s == c)
 29b:	38 d1                	cmp    %dl,%cl
 29d:	75 f1                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a8:	31 c0                	xor    %eax,%eax
}
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b9:	31 f6                	xor    %esi,%esi
{
 2bb:	53                   	push   %ebx
 2bc:	89 f3                	mov    %esi,%ebx
 2be:	83 ec 1c             	sub    $0x1c,%esp
 2c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2c4:	eb 33                	jmp    2f9 <gets+0x49>
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2d6:	6a 01                	push   $0x1
 2d8:	50                   	push   %eax
 2d9:	6a 00                	push   $0x0
 2db:	e8 15 03 00 00       	call   5f5 <read>
    if(cc < 1)
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	85 c0                	test   %eax,%eax
 2e5:	7e 1c                	jle    303 <gets+0x53>
      break;
    buf[i++] = c;
 2e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2eb:	83 c7 01             	add    $0x1,%edi
 2ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2f1:	3c 0a                	cmp    $0xa,%al
 2f3:	74 23                	je     318 <gets+0x68>
 2f5:	3c 0d                	cmp    $0xd,%al
 2f7:	74 1f                	je     318 <gets+0x68>
  for(i=0; i+1 < max; ){
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	89 fe                	mov    %edi,%esi
 2fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 301:	7c cd                	jl     2d0 <gets+0x20>
 303:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 305:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 308:	c6 03 00             	movb   $0x0,(%ebx)
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 317:	90                   	nop
 318:	8b 75 08             	mov    0x8(%ebp),%esi
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	01 de                	add    %ebx,%esi
 320:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 322:	c6 03 00             	movb   $0x0,(%ebx)
}
 325:	8d 65 f4             	lea    -0xc(%ebp),%esp
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5f                   	pop    %edi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	56                   	push   %esi
 338:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	6a 00                	push   $0x0
 33e:	ff 75 08             	pushl  0x8(%ebp)
 341:	e8 d7 02 00 00       	call   61d <open>
  if(fd < 0)
 346:	83 c4 10             	add    $0x10,%esp
 349:	85 c0                	test   %eax,%eax
 34b:	78 2b                	js     378 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 34d:	83 ec 08             	sub    $0x8,%esp
 350:	ff 75 0c             	pushl  0xc(%ebp)
 353:	89 c3                	mov    %eax,%ebx
 355:	50                   	push   %eax
 356:	e8 da 02 00 00       	call   635 <fstat>
  close(fd);
 35b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35e:	89 c6                	mov    %eax,%esi
  close(fd);
 360:	e8 a0 02 00 00       	call   605 <close>
  return r;
 365:	83 c4 10             	add    $0x10,%esp
}
 368:	8d 65 f8             	lea    -0x8(%ebp),%esp
 36b:	89 f0                	mov    %esi,%eax
 36d:	5b                   	pop    %ebx
 36e:	5e                   	pop    %esi
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 378:	be ff ff ff ff       	mov    $0xffffffff,%esi
 37d:	eb e9                	jmp    368 <stat+0x38>
 37f:	90                   	nop

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	53                   	push   %ebx
 388:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 38b:	0f be 02             	movsbl (%edx),%eax
 38e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 391:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 394:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 399:	77 1a                	ja     3b5 <atoi+0x35>
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	89 c8                	mov    %ecx,%eax
 3b7:	5b                   	pop    %ebx
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	8b 45 10             	mov    0x10(%ebp),%eax
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
 3ce:	56                   	push   %esi
 3cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 0f                	jle    3e5 <memmove+0x25>
 3d6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d8:	89 d7                	mov    %edx,%edi
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 3fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3fd:	50                   	push   %eax
 3fe:	e8 92 02 00 00       	call   695 <join>
  
  return x;
}
 403:	c9                   	leave  
 404:	c3                   	ret    
 405:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 410:	f3 0f 1e fb          	endbr32 
 414:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 415:	a1 80 0c 00 00       	mov    0xc80,%eax
{
 41a:	89 e5                	mov    %esp,%ebp
 41c:	57                   	push   %edi
 41d:	56                   	push   %esi
 41e:	53                   	push   %ebx
 41f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 422:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 424:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 427:	39 c8                	cmp    %ecx,%eax
 429:	73 15                	jae    440 <free+0x30>
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop
 430:	39 d1                	cmp    %edx,%ecx
 432:	72 14                	jb     448 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 434:	39 d0                	cmp    %edx,%eax
 436:	73 10                	jae    448 <free+0x38>
{
 438:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 43a:	8b 10                	mov    (%eax),%edx
 43c:	39 c8                	cmp    %ecx,%eax
 43e:	72 f0                	jb     430 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 440:	39 d0                	cmp    %edx,%eax
 442:	72 f4                	jb     438 <free+0x28>
 444:	39 d1                	cmp    %edx,%ecx
 446:	73 f0                	jae    438 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 448:	8b 73 fc             	mov    -0x4(%ebx),%esi
 44b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 44e:	39 fa                	cmp    %edi,%edx
 450:	74 1e                	je     470 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 452:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 455:	8b 50 04             	mov    0x4(%eax),%edx
 458:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 45b:	39 f1                	cmp    %esi,%ecx
 45d:	74 28                	je     487 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 45f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 461:	5b                   	pop    %ebx
  freep = p;
 462:	a3 80 0c 00 00       	mov    %eax,0xc80
}
 467:	5e                   	pop    %esi
 468:	5f                   	pop    %edi
 469:	5d                   	pop    %ebp
 46a:	c3                   	ret    
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 470:	03 72 04             	add    0x4(%edx),%esi
 473:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 476:	8b 10                	mov    (%eax),%edx
 478:	8b 12                	mov    (%edx),%edx
 47a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 47d:	8b 50 04             	mov    0x4(%eax),%edx
 480:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 483:	39 f1                	cmp    %esi,%ecx
 485:	75 d8                	jne    45f <free+0x4f>
    p->s.size += bp->s.size;
 487:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 48a:	a3 80 0c 00 00       	mov    %eax,0xc80
    p->s.size += bp->s.size;
 48f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 492:	8b 53 f8             	mov    -0x8(%ebx),%edx
 495:	89 10                	mov    %edx,(%eax)
}
 497:	5b                   	pop    %ebx
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 4a0:	f3 0f 1e fb          	endbr32 
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	57                   	push   %edi
 4a8:	56                   	push   %esi
 4a9:	53                   	push   %ebx
 4aa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 4b0:	8b 3d 80 0c 00 00    	mov    0xc80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4b6:	8d 70 07             	lea    0x7(%eax),%esi
 4b9:	c1 ee 03             	shr    $0x3,%esi
 4bc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 4bf:	85 ff                	test   %edi,%edi
 4c1:	0f 84 a9 00 00 00    	je     570 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4c7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 4c9:	8b 48 04             	mov    0x4(%eax),%ecx
 4cc:	39 f1                	cmp    %esi,%ecx
 4ce:	73 6d                	jae    53d <malloc+0x9d>
 4d0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 4d6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 4db:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 4de:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 4e5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 4e8:	eb 17                	jmp    501 <malloc+0x61>
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 4f2:	8b 4a 04             	mov    0x4(%edx),%ecx
 4f5:	39 f1                	cmp    %esi,%ecx
 4f7:	73 4f                	jae    548 <malloc+0xa8>
 4f9:	8b 3d 80 0c 00 00    	mov    0xc80,%edi
 4ff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 501:	39 c7                	cmp    %eax,%edi
 503:	75 eb                	jne    4f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 505:	83 ec 0c             	sub    $0xc,%esp
 508:	ff 75 e4             	pushl  -0x1c(%ebp)
 50b:	e8 65 01 00 00       	call   675 <sbrk>
  if(p == (char*)-1)
 510:	83 c4 10             	add    $0x10,%esp
 513:	83 f8 ff             	cmp    $0xffffffff,%eax
 516:	74 1b                	je     533 <malloc+0x93>
  hp->s.size = nu;
 518:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 51b:	83 ec 0c             	sub    $0xc,%esp
 51e:	83 c0 08             	add    $0x8,%eax
 521:	50                   	push   %eax
 522:	e8 e9 fe ff ff       	call   410 <free>
  return freep;
 527:	a1 80 0c 00 00       	mov    0xc80,%eax
      if((p = morecore(nunits)) == 0)
 52c:	83 c4 10             	add    $0x10,%esp
 52f:	85 c0                	test   %eax,%eax
 531:	75 bd                	jne    4f0 <malloc+0x50>
        return 0;
  }
}
 533:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 536:	31 c0                	xor    %eax,%eax
}
 538:	5b                   	pop    %ebx
 539:	5e                   	pop    %esi
 53a:	5f                   	pop    %edi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
    if(p->s.size >= nunits){
 53d:	89 c2                	mov    %eax,%edx
 53f:	89 f8                	mov    %edi,%eax
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 548:	39 ce                	cmp    %ecx,%esi
 54a:	74 54                	je     5a0 <malloc+0x100>
        p->s.size -= nunits;
 54c:	29 f1                	sub    %esi,%ecx
 54e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 551:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 554:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 557:	a3 80 0c 00 00       	mov    %eax,0xc80
}
 55c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 55f:	8d 42 08             	lea    0x8(%edx),%eax
}
 562:	5b                   	pop    %ebx
 563:	5e                   	pop    %esi
 564:	5f                   	pop    %edi
 565:	5d                   	pop    %ebp
 566:	c3                   	ret    
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 570:	c7 05 80 0c 00 00 84 	movl   $0xc84,0xc80
 577:	0c 00 00 
    base.s.size = 0;
 57a:	bf 84 0c 00 00       	mov    $0xc84,%edi
    base.s.ptr = freep = prevp = &base;
 57f:	c7 05 84 0c 00 00 84 	movl   $0xc84,0xc84
 586:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 589:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 58b:	c7 05 88 0c 00 00 00 	movl   $0x0,0xc88
 592:	00 00 00 
    if(p->s.size >= nunits){
 595:	e9 36 ff ff ff       	jmp    4d0 <malloc+0x30>
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 5a0:	8b 0a                	mov    (%edx),%ecx
 5a2:	89 08                	mov    %ecx,(%eax)
 5a4:	eb b1                	jmp    557 <malloc+0xb7>
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi

000005b0 <thread_create>:
{
 5b0:	f3 0f 1e fb          	endbr32 
 5b4:	55                   	push   %ebp
 5b5:	89 e5                	mov    %esp,%ebp
 5b7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 5ba:	68 00 10 00 00       	push   $0x1000
 5bf:	e8 dc fe ff ff       	call   4a0 <malloc>
return clone(start_routine,arg1,arg2,stack);
 5c4:	50                   	push   %eax
 5c5:	ff 75 10             	pushl  0x10(%ebp)
 5c8:	ff 75 0c             	pushl  0xc(%ebp)
 5cb:	ff 75 08             	pushl  0x8(%ebp)
 5ce:	e8 ba 00 00 00       	call   68d <clone>
}
 5d3:	c9                   	leave  
 5d4:	c3                   	ret    

000005d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5d5:	b8 01 00 00 00       	mov    $0x1,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <exit>:
SYSCALL(exit)
 5dd:	b8 02 00 00 00       	mov    $0x2,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <wait>:
SYSCALL(wait)
 5e5:	b8 03 00 00 00       	mov    $0x3,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <pipe>:
SYSCALL(pipe)
 5ed:	b8 04 00 00 00       	mov    $0x4,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <read>:
SYSCALL(read)
 5f5:	b8 05 00 00 00       	mov    $0x5,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <write>:
SYSCALL(write)
 5fd:	b8 10 00 00 00       	mov    $0x10,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <close>:
SYSCALL(close)
 605:	b8 15 00 00 00       	mov    $0x15,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <kill>:
SYSCALL(kill)
 60d:	b8 06 00 00 00       	mov    $0x6,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <exec>:
SYSCALL(exec)
 615:	b8 07 00 00 00       	mov    $0x7,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <open>:
SYSCALL(open)
 61d:	b8 0f 00 00 00       	mov    $0xf,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <mknod>:
SYSCALL(mknod)
 625:	b8 11 00 00 00       	mov    $0x11,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <unlink>:
SYSCALL(unlink)
 62d:	b8 12 00 00 00       	mov    $0x12,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <fstat>:
SYSCALL(fstat)
 635:	b8 08 00 00 00       	mov    $0x8,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <link>:
SYSCALL(link)
 63d:	b8 13 00 00 00       	mov    $0x13,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <mkdir>:
SYSCALL(mkdir)
 645:	b8 14 00 00 00       	mov    $0x14,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <chdir>:
SYSCALL(chdir)
 64d:	b8 09 00 00 00       	mov    $0x9,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <dup>:
SYSCALL(dup)
 655:	b8 0a 00 00 00       	mov    $0xa,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <getpid>:
SYSCALL(getpid)
 65d:	b8 0b 00 00 00       	mov    $0xb,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <getyear>:
SYSCALL(getyear)
 665:	b8 16 00 00 00       	mov    $0x16,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <getreadcount>:
SYSCALL(getreadcount)
 66d:	b8 17 00 00 00       	mov    $0x17,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <sbrk>:
SYSCALL(sbrk)
 675:	b8 0c 00 00 00       	mov    $0xc,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <sleep>:
SYSCALL(sleep)
 67d:	b8 0d 00 00 00       	mov    $0xd,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <uptime>:
SYSCALL(uptime)
 685:	b8 0e 00 00 00       	mov    $0xe,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <clone>:
SYSCALL(clone)
 68d:	b8 18 00 00 00       	mov    $0x18,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <join>:
SYSCALL(join)
 695:	b8 19 00 00 00       	mov    $0x19,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    
 69d:	66 90                	xchg   %ax,%ax
 69f:	90                   	nop

000006a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 3c             	sub    $0x3c,%esp
 6a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6ac:	89 d1                	mov    %edx,%ecx
{
 6ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6b1:	85 d2                	test   %edx,%edx
 6b3:	0f 89 7f 00 00 00    	jns    738 <printint+0x98>
 6b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6bd:	74 79                	je     738 <printint+0x98>
    neg = 1;
 6bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6c8:	31 db                	xor    %ebx,%ebx
 6ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6d0:	89 c8                	mov    %ecx,%eax
 6d2:	31 d2                	xor    %edx,%edx
 6d4:	89 cf                	mov    %ecx,%edi
 6d6:	f7 75 c4             	divl   -0x3c(%ebp)
 6d9:	0f b6 92 58 09 00 00 	movzbl 0x958(%edx),%edx
 6e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6e3:	89 d8                	mov    %ebx,%eax
 6e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6f1:	76 dd                	jbe    6d0 <printint+0x30>
  if(neg)
 6f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6f6:	85 c9                	test   %ecx,%ecx
 6f8:	74 0c                	je     706 <printint+0x66>
    buf[i++] = '-';
 6fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 701:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 706:	8b 7d b8             	mov    -0x48(%ebp),%edi
 709:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 70d:	eb 07                	jmp    716 <printint+0x76>
 70f:	90                   	nop
 710:	0f b6 13             	movzbl (%ebx),%edx
 713:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 716:	83 ec 04             	sub    $0x4,%esp
 719:	88 55 d7             	mov    %dl,-0x29(%ebp)
 71c:	6a 01                	push   $0x1
 71e:	56                   	push   %esi
 71f:	57                   	push   %edi
 720:	e8 d8 fe ff ff       	call   5fd <write>
  while(--i >= 0)
 725:	83 c4 10             	add    $0x10,%esp
 728:	39 de                	cmp    %ebx,%esi
 72a:	75 e4                	jne    710 <printint+0x70>
    putc(fd, buf[i]);
}
 72c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 72f:	5b                   	pop    %ebx
 730:	5e                   	pop    %esi
 731:	5f                   	pop    %edi
 732:	5d                   	pop    %ebp
 733:	c3                   	ret    
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 738:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 73f:	eb 87                	jmp    6c8 <printint+0x28>
 741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 748:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop

00000750 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 750:	f3 0f 1e fb          	endbr32 
 754:	55                   	push   %ebp
 755:	89 e5                	mov    %esp,%ebp
 757:	57                   	push   %edi
 758:	56                   	push   %esi
 759:	53                   	push   %ebx
 75a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 75d:	8b 75 0c             	mov    0xc(%ebp),%esi
 760:	0f b6 1e             	movzbl (%esi),%ebx
 763:	84 db                	test   %bl,%bl
 765:	0f 84 b4 00 00 00    	je     81f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 76b:	8d 45 10             	lea    0x10(%ebp),%eax
 76e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 771:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 774:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 776:	89 45 d0             	mov    %eax,-0x30(%ebp)
 779:	eb 33                	jmp    7ae <printf+0x5e>
 77b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop
 780:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 783:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 788:	83 f8 25             	cmp    $0x25,%eax
 78b:	74 17                	je     7a4 <printf+0x54>
  write(fd, &c, 1);
 78d:	83 ec 04             	sub    $0x4,%esp
 790:	88 5d e7             	mov    %bl,-0x19(%ebp)
 793:	6a 01                	push   $0x1
 795:	57                   	push   %edi
 796:	ff 75 08             	pushl  0x8(%ebp)
 799:	e8 5f fe ff ff       	call   5fd <write>
 79e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 7a1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7a4:	0f b6 1e             	movzbl (%esi),%ebx
 7a7:	83 c6 01             	add    $0x1,%esi
 7aa:	84 db                	test   %bl,%bl
 7ac:	74 71                	je     81f <printf+0xcf>
    c = fmt[i] & 0xff;
 7ae:	0f be cb             	movsbl %bl,%ecx
 7b1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7b4:	85 d2                	test   %edx,%edx
 7b6:	74 c8                	je     780 <printf+0x30>
      }
    } else if(state == '%'){
 7b8:	83 fa 25             	cmp    $0x25,%edx
 7bb:	75 e7                	jne    7a4 <printf+0x54>
      if(c == 'd'){
 7bd:	83 f8 64             	cmp    $0x64,%eax
 7c0:	0f 84 9a 00 00 00    	je     860 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7c6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7cc:	83 f9 70             	cmp    $0x70,%ecx
 7cf:	74 5f                	je     830 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7d1:	83 f8 73             	cmp    $0x73,%eax
 7d4:	0f 84 d6 00 00 00    	je     8b0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7da:	83 f8 63             	cmp    $0x63,%eax
 7dd:	0f 84 8d 00 00 00    	je     870 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7e3:	83 f8 25             	cmp    $0x25,%eax
 7e6:	0f 84 b4 00 00 00    	je     8a0 <printf+0x150>
  write(fd, &c, 1);
 7ec:	83 ec 04             	sub    $0x4,%esp
 7ef:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7f3:	6a 01                	push   $0x1
 7f5:	57                   	push   %edi
 7f6:	ff 75 08             	pushl  0x8(%ebp)
 7f9:	e8 ff fd ff ff       	call   5fd <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 7fe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 801:	83 c4 0c             	add    $0xc,%esp
 804:	6a 01                	push   $0x1
 806:	83 c6 01             	add    $0x1,%esi
 809:	57                   	push   %edi
 80a:	ff 75 08             	pushl  0x8(%ebp)
 80d:	e8 eb fd ff ff       	call   5fd <write>
  for(i = 0; fmt[i]; i++){
 812:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 816:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 819:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 81b:	84 db                	test   %bl,%bl
 81d:	75 8f                	jne    7ae <printf+0x5e>
    }
  }
}
 81f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 822:	5b                   	pop    %ebx
 823:	5e                   	pop    %esi
 824:	5f                   	pop    %edi
 825:	5d                   	pop    %ebp
 826:	c3                   	ret    
 827:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 830:	83 ec 0c             	sub    $0xc,%esp
 833:	b9 10 00 00 00       	mov    $0x10,%ecx
 838:	6a 00                	push   $0x0
 83a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 83d:	8b 45 08             	mov    0x8(%ebp),%eax
 840:	8b 13                	mov    (%ebx),%edx
 842:	e8 59 fe ff ff       	call   6a0 <printint>
        ap++;
 847:	89 d8                	mov    %ebx,%eax
 849:	83 c4 10             	add    $0x10,%esp
      state = 0;
 84c:	31 d2                	xor    %edx,%edx
        ap++;
 84e:	83 c0 04             	add    $0x4,%eax
 851:	89 45 d0             	mov    %eax,-0x30(%ebp)
 854:	e9 4b ff ff ff       	jmp    7a4 <printf+0x54>
 859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	b9 0a 00 00 00       	mov    $0xa,%ecx
 868:	6a 01                	push   $0x1
 86a:	eb ce                	jmp    83a <printf+0xea>
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 870:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 873:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 876:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 878:	6a 01                	push   $0x1
        ap++;
 87a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 87d:	57                   	push   %edi
 87e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 881:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 884:	e8 74 fd ff ff       	call   5fd <write>
        ap++;
 889:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 88c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 88f:	31 d2                	xor    %edx,%edx
 891:	e9 0e ff ff ff       	jmp    7a4 <printf+0x54>
 896:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 89d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 8a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8a3:	83 ec 04             	sub    $0x4,%esp
 8a6:	e9 59 ff ff ff       	jmp    804 <printf+0xb4>
 8ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8af:	90                   	nop
        s = (char*)*ap;
 8b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 8b5:	83 c0 04             	add    $0x4,%eax
 8b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8bb:	85 db                	test   %ebx,%ebx
 8bd:	74 17                	je     8d6 <printf+0x186>
        while(*s != 0){
 8bf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 8c2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 8c4:	84 c0                	test   %al,%al
 8c6:	0f 84 d8 fe ff ff    	je     7a4 <printf+0x54>
 8cc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8cf:	89 de                	mov    %ebx,%esi
 8d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8d4:	eb 1a                	jmp    8f0 <printf+0x1a0>
          s = "(null)";
 8d6:	bb 4f 09 00 00       	mov    $0x94f,%ebx
        while(*s != 0){
 8db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8de:	b8 28 00 00 00       	mov    $0x28,%eax
 8e3:	89 de                	mov    %ebx,%esi
 8e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ef:	90                   	nop
  write(fd, &c, 1);
 8f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8f3:	83 c6 01             	add    $0x1,%esi
 8f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8f9:	6a 01                	push   $0x1
 8fb:	57                   	push   %edi
 8fc:	53                   	push   %ebx
 8fd:	e8 fb fc ff ff       	call   5fd <write>
        while(*s != 0){
 902:	0f b6 06             	movzbl (%esi),%eax
 905:	83 c4 10             	add    $0x10,%esp
 908:	84 c0                	test   %al,%al
 90a:	75 e4                	jne    8f0 <printf+0x1a0>
 90c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 90f:	31 d2                	xor    %edx,%edx
 911:	e9 8e fe ff ff       	jmp    7a4 <printf+0x54>
