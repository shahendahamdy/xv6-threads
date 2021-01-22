
_rm:     file format elf32-i386


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
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	bf 01 00 00 00       	mov    $0x1,%edi
  17:	56                   	push   %esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 08             	sub    $0x8,%esp
  1d:	8b 59 04             	mov    0x4(%ecx),%ebx
  20:	8b 31                	mov    (%ecx),%esi
  22:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  25:	83 fe 01             	cmp    $0x1,%esi
  28:	7e 3a                	jle    64 <main+0x64>
  2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 43 05 00 00       	call   57d <unlink>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 dd 04 00 00       	call   52d <exit>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	pushl  (%ebx)
  53:	68 7c 08 00 00       	push   $0x87c
  58:	6a 02                	push   $0x2
  5a:	e8 41 06 00 00       	call   6a0 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: rm files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 68 08 00 00       	push   $0x868
  6b:	6a 02                	push   $0x2
  6d:	e8 2e 06 00 00       	call   6a0 <printf>
    exit();
  72:	e8 b6 04 00 00       	call   52d <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
  80:	f3 0f 1e fb          	endbr32 
  84:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  85:	31 c0                	xor    %eax,%eax
{
  87:	89 e5                	mov    %esp,%ebp
  89:	53                   	push   %ebx
  8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	89 c8                	mov    %ecx,%eax
  a0:	5b                   	pop    %ebx
  a1:	5d                   	pop    %ebp
  a2:	c3                   	ret    
  a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	f3 0f 1e fb          	endbr32 
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	53                   	push   %ebx
  b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  be:	0f b6 01             	movzbl (%ecx),%eax
  c1:	0f b6 1a             	movzbl (%edx),%ebx
  c4:	84 c0                	test   %al,%al
  c6:	75 19                	jne    e1 <strcmp+0x31>
  c8:	eb 26                	jmp    f0 <strcmp+0x40>
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  d4:	83 c1 01             	add    $0x1,%ecx
  d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  da:	0f b6 1a             	movzbl (%edx),%ebx
  dd:	84 c0                	test   %al,%al
  df:	74 0f                	je     f0 <strcmp+0x40>
  e1:	38 d8                	cmp    %bl,%al
  e3:	74 eb                	je     d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  e5:	29 d8                	sub    %ebx,%eax
}
  e7:	5b                   	pop    %ebx
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  f2:	29 d8                	sub    %ebx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fe:	66 90                	xchg   %ax,%ax

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 10a:	80 3a 00             	cmpb   $0x0,(%edx)
 10d:	74 21                	je     130 <strlen+0x30>
 10f:	31 c0                	xor    %eax,%eax
 111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 118:	83 c0 01             	add    $0x1,%eax
 11b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 11f:	89 c1                	mov    %eax,%ecx
 121:	75 f5                	jne    118 <strlen+0x18>
    ;
  return n;
}
 123:	89 c8                	mov    %ecx,%eax
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 130:	31 c9                	xor    %ecx,%ecx
}
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret    
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	57                   	push   %edi
 148:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 14b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14e:	8b 45 0c             	mov    0xc(%ebp),%eax
 151:	89 d7                	mov    %edx,%edi
 153:	fc                   	cld    
 154:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 156:	89 d0                	mov    %edx,%eax
 158:	5f                   	pop    %edi
 159:	5d                   	pop    %ebp
 15a:	c3                   	ret    
 15b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 15f:	90                   	nop

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	8b 45 08             	mov    0x8(%ebp),%eax
 16a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16e:	0f b6 10             	movzbl (%eax),%edx
 171:	84 d2                	test   %dl,%dl
 173:	75 16                	jne    18b <strchr+0x2b>
 175:	eb 21                	jmp    198 <strchr+0x38>
 177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17e:	66 90                	xchg   %ax,%ax
 180:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 184:	83 c0 01             	add    $0x1,%eax
 187:	84 d2                	test   %dl,%dl
 189:	74 0d                	je     198 <strchr+0x38>
    if(*s == c)
 18b:	38 d1                	cmp    %dl,%cl
 18d:	75 f1                	jne    180 <strchr+0x20>
      return (char*)s;
  return 0;
}
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    
 191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 198:	31 c0                	xor    %eax,%eax
}
 19a:	5d                   	pop    %ebp
 19b:	c3                   	ret    
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	57                   	push   %edi
 1a8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a9:	31 f6                	xor    %esi,%esi
{
 1ab:	53                   	push   %ebx
 1ac:	89 f3                	mov    %esi,%ebx
 1ae:	83 ec 1c             	sub    $0x1c,%esp
 1b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1b4:	eb 33                	jmp    1e9 <gets+0x49>
 1b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1c6:	6a 01                	push   $0x1
 1c8:	50                   	push   %eax
 1c9:	6a 00                	push   $0x0
 1cb:	e8 75 03 00 00       	call   545 <read>
    if(cc < 1)
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	85 c0                	test   %eax,%eax
 1d5:	7e 1c                	jle    1f3 <gets+0x53>
      break;
    buf[i++] = c;
 1d7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1db:	83 c7 01             	add    $0x1,%edi
 1de:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1e1:	3c 0a                	cmp    $0xa,%al
 1e3:	74 23                	je     208 <gets+0x68>
 1e5:	3c 0d                	cmp    $0xd,%al
 1e7:	74 1f                	je     208 <gets+0x68>
  for(i=0; i+1 < max; ){
 1e9:	83 c3 01             	add    $0x1,%ebx
 1ec:	89 fe                	mov    %edi,%esi
 1ee:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f1:	7c cd                	jl     1c0 <gets+0x20>
 1f3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1f8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fe:	5b                   	pop    %ebx
 1ff:	5e                   	pop    %esi
 200:	5f                   	pop    %edi
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	8b 75 08             	mov    0x8(%ebp),%esi
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	01 de                	add    %ebx,%esi
 210:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 212:	c6 03 00             	movb   $0x0,(%ebx)
}
 215:	8d 65 f4             	lea    -0xc(%ebp),%esp
 218:	5b                   	pop    %ebx
 219:	5e                   	pop    %esi
 21a:	5f                   	pop    %edi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi

00000220 <stat>:

int
stat(const char *n, struct stat *st)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	56                   	push   %esi
 228:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	6a 00                	push   $0x0
 22e:	ff 75 08             	pushl  0x8(%ebp)
 231:	e8 37 03 00 00       	call   56d <open>
  if(fd < 0)
 236:	83 c4 10             	add    $0x10,%esp
 239:	85 c0                	test   %eax,%eax
 23b:	78 2b                	js     268 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 23d:	83 ec 08             	sub    $0x8,%esp
 240:	ff 75 0c             	pushl  0xc(%ebp)
 243:	89 c3                	mov    %eax,%ebx
 245:	50                   	push   %eax
 246:	e8 3a 03 00 00       	call   585 <fstat>
  close(fd);
 24b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 24e:	89 c6                	mov    %eax,%esi
  close(fd);
 250:	e8 00 03 00 00       	call   555 <close>
  return r;
 255:	83 c4 10             	add    $0x10,%esp
}
 258:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25b:	89 f0                	mov    %esi,%eax
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 268:	be ff ff ff ff       	mov    $0xffffffff,%esi
 26d:	eb e9                	jmp    258 <stat+0x38>
 26f:	90                   	nop

00000270 <atoi>:

int
atoi(const char *s)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	53                   	push   %ebx
 278:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27b:	0f be 02             	movsbl (%edx),%eax
 27e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 281:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 284:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 289:	77 1a                	ja     2a5 <atoi+0x35>
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop
    n = n*10 + *s++ - '0';
 290:	83 c2 01             	add    $0x1,%edx
 293:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 296:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 29a:	0f be 02             	movsbl (%edx),%eax
 29d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2a0:	80 fb 09             	cmp    $0x9,%bl
 2a3:	76 eb                	jbe    290 <atoi+0x20>
  return n;
}
 2a5:	89 c8                	mov    %ecx,%eax
 2a7:	5b                   	pop    %ebx
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	8b 45 10             	mov    0x10(%ebp),%eax
 2bb:	8b 55 08             	mov    0x8(%ebp),%edx
 2be:	56                   	push   %esi
 2bf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c2:	85 c0                	test   %eax,%eax
 2c4:	7e 0f                	jle    2d5 <memmove+0x25>
 2c6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2c8:	89 d7                	mov    %edx,%edi
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2d1:	39 f8                	cmp    %edi,%eax
 2d3:	75 fb                	jne    2d0 <memmove+0x20>
  return vdst;
}
 2d5:	5e                   	pop    %esi
 2d6:	89 d0                	mov    %edx,%eax
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 2ea:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2ed:	50                   	push   %eax
 2ee:	e8 f2 02 00 00       	call   5e5 <join>
  
  return x;
}
 2f3:	c9                   	leave  
 2f4:	c3                   	ret    
 2f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <lock_init>:

void lock_init(struct lock_t *lk){
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 307:	8b 45 08             	mov    0x8(%ebp),%eax
 30a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 310:	5d                   	pop    %ebp
 311:	c3                   	ret    
 312:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 325:	b9 01 00 00 00       	mov    $0x1,%ecx
 32a:	89 e5                	mov    %esp,%ebp
 32c:	8b 55 08             	mov    0x8(%ebp),%edx
 32f:	90                   	nop
 330:	89 c8                	mov    %ecx,%eax
 332:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 335:	85 c0                	test   %eax,%eax
 337:	75 f7                	jne    330 <lock_acquire+0x10>
}
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <lock_release>:
void lock_release(struct lock_t *lk){
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	31 c0                	xor    %eax,%eax
 347:	89 e5                	mov    %esp,%ebp
 349:	8b 55 08             	mov    0x8(%ebp),%edx
 34c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 365:	a1 f4 0b 00 00       	mov    0xbf4,%eax
{
 36a:	89 e5                	mov    %esp,%ebp
 36c:	57                   	push   %edi
 36d:	56                   	push   %esi
 36e:	53                   	push   %ebx
 36f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 372:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 374:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 377:	39 c8                	cmp    %ecx,%eax
 379:	73 15                	jae    390 <free+0x30>
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop
 380:	39 d1                	cmp    %edx,%ecx
 382:	72 14                	jb     398 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 384:	39 d0                	cmp    %edx,%eax
 386:	73 10                	jae    398 <free+0x38>
{
 388:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 38a:	8b 10                	mov    (%eax),%edx
 38c:	39 c8                	cmp    %ecx,%eax
 38e:	72 f0                	jb     380 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 390:	39 d0                	cmp    %edx,%eax
 392:	72 f4                	jb     388 <free+0x28>
 394:	39 d1                	cmp    %edx,%ecx
 396:	73 f0                	jae    388 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 398:	8b 73 fc             	mov    -0x4(%ebx),%esi
 39b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 39e:	39 fa                	cmp    %edi,%edx
 3a0:	74 1e                	je     3c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3a5:	8b 50 04             	mov    0x4(%eax),%edx
 3a8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3ab:	39 f1                	cmp    %esi,%ecx
 3ad:	74 28                	je     3d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 3af:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 3b1:	5b                   	pop    %ebx
  freep = p;
 3b2:	a3 f4 0b 00 00       	mov    %eax,0xbf4
}
 3b7:	5e                   	pop    %esi
 3b8:	5f                   	pop    %edi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret    
 3bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 3c0:	03 72 04             	add    0x4(%edx),%esi
 3c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 3c6:	8b 10                	mov    (%eax),%edx
 3c8:	8b 12                	mov    (%edx),%edx
 3ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3cd:	8b 50 04             	mov    0x4(%eax),%edx
 3d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3d3:	39 f1                	cmp    %esi,%ecx
 3d5:	75 d8                	jne    3af <free+0x4f>
    p->s.size += bp->s.size;
 3d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 3da:	a3 f4 0b 00 00       	mov    %eax,0xbf4
    p->s.size += bp->s.size;
 3df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 3e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 3e5:	89 10                	mov    %edx,(%eax)
}
 3e7:	5b                   	pop    %ebx
 3e8:	5e                   	pop    %esi
 3e9:	5f                   	pop    %edi
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	57                   	push   %edi
 3f8:	56                   	push   %esi
 3f9:	53                   	push   %ebx
 3fa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 400:	8b 3d f4 0b 00 00    	mov    0xbf4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 406:	8d 70 07             	lea    0x7(%eax),%esi
 409:	c1 ee 03             	shr    $0x3,%esi
 40c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 40f:	85 ff                	test   %edi,%edi
 411:	0f 84 a9 00 00 00    	je     4c0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 417:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 419:	8b 48 04             	mov    0x4(%eax),%ecx
 41c:	39 f1                	cmp    %esi,%ecx
 41e:	73 6d                	jae    48d <malloc+0x9d>
 420:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 426:	bb 00 10 00 00       	mov    $0x1000,%ebx
 42b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 42e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 435:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 438:	eb 17                	jmp    451 <malloc+0x61>
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 440:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 442:	8b 4a 04             	mov    0x4(%edx),%ecx
 445:	39 f1                	cmp    %esi,%ecx
 447:	73 4f                	jae    498 <malloc+0xa8>
 449:	8b 3d f4 0b 00 00    	mov    0xbf4,%edi
 44f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 451:	39 c7                	cmp    %eax,%edi
 453:	75 eb                	jne    440 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 455:	83 ec 0c             	sub    $0xc,%esp
 458:	ff 75 e4             	pushl  -0x1c(%ebp)
 45b:	e8 65 01 00 00       	call   5c5 <sbrk>
  if(p == (char*)-1)
 460:	83 c4 10             	add    $0x10,%esp
 463:	83 f8 ff             	cmp    $0xffffffff,%eax
 466:	74 1b                	je     483 <malloc+0x93>
  hp->s.size = nu;
 468:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 46b:	83 ec 0c             	sub    $0xc,%esp
 46e:	83 c0 08             	add    $0x8,%eax
 471:	50                   	push   %eax
 472:	e8 e9 fe ff ff       	call   360 <free>
  return freep;
 477:	a1 f4 0b 00 00       	mov    0xbf4,%eax
      if((p = morecore(nunits)) == 0)
 47c:	83 c4 10             	add    $0x10,%esp
 47f:	85 c0                	test   %eax,%eax
 481:	75 bd                	jne    440 <malloc+0x50>
        return 0;
  }
}
 483:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 486:	31 c0                	xor    %eax,%eax
}
 488:	5b                   	pop    %ebx
 489:	5e                   	pop    %esi
 48a:	5f                   	pop    %edi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    
    if(p->s.size >= nunits){
 48d:	89 c2                	mov    %eax,%edx
 48f:	89 f8                	mov    %edi,%eax
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 498:	39 ce                	cmp    %ecx,%esi
 49a:	74 54                	je     4f0 <malloc+0x100>
        p->s.size -= nunits;
 49c:	29 f1                	sub    %esi,%ecx
 49e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 4a1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 4a4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 4a7:	a3 f4 0b 00 00       	mov    %eax,0xbf4
}
 4ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 4af:	8d 42 08             	lea    0x8(%edx),%eax
}
 4b2:	5b                   	pop    %ebx
 4b3:	5e                   	pop    %esi
 4b4:	5f                   	pop    %edi
 4b5:	5d                   	pop    %ebp
 4b6:	c3                   	ret    
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 4c0:	c7 05 f4 0b 00 00 f8 	movl   $0xbf8,0xbf4
 4c7:	0b 00 00 
    base.s.size = 0;
 4ca:	bf f8 0b 00 00       	mov    $0xbf8,%edi
    base.s.ptr = freep = prevp = &base;
 4cf:	c7 05 f8 0b 00 00 f8 	movl   $0xbf8,0xbf8
 4d6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4d9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 4db:	c7 05 fc 0b 00 00 00 	movl   $0x0,0xbfc
 4e2:	00 00 00 
    if(p->s.size >= nunits){
 4e5:	e9 36 ff ff ff       	jmp    420 <malloc+0x30>
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 4f0:	8b 0a                	mov    (%edx),%ecx
 4f2:	89 08                	mov    %ecx,(%eax)
 4f4:	eb b1                	jmp    4a7 <malloc+0xb7>
 4f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi

00000500 <thread_create>:
{
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 50a:	68 00 10 00 00       	push   $0x1000
 50f:	e8 dc fe ff ff       	call   3f0 <malloc>
return clone(start_routine,arg1,arg2,stack);
 514:	50                   	push   %eax
 515:	ff 75 10             	pushl  0x10(%ebp)
 518:	ff 75 0c             	pushl  0xc(%ebp)
 51b:	ff 75 08             	pushl  0x8(%ebp)
 51e:	e8 ba 00 00 00       	call   5dd <clone>
}
 523:	c9                   	leave  
 524:	c3                   	ret    

00000525 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 525:	b8 01 00 00 00       	mov    $0x1,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <exit>:
SYSCALL(exit)
 52d:	b8 02 00 00 00       	mov    $0x2,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <wait>:
SYSCALL(wait)
 535:	b8 03 00 00 00       	mov    $0x3,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <pipe>:
SYSCALL(pipe)
 53d:	b8 04 00 00 00       	mov    $0x4,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <read>:
SYSCALL(read)
 545:	b8 05 00 00 00       	mov    $0x5,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <write>:
SYSCALL(write)
 54d:	b8 10 00 00 00       	mov    $0x10,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <close>:
SYSCALL(close)
 555:	b8 15 00 00 00       	mov    $0x15,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <kill>:
SYSCALL(kill)
 55d:	b8 06 00 00 00       	mov    $0x6,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <exec>:
SYSCALL(exec)
 565:	b8 07 00 00 00       	mov    $0x7,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <open>:
SYSCALL(open)
 56d:	b8 0f 00 00 00       	mov    $0xf,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <mknod>:
SYSCALL(mknod)
 575:	b8 11 00 00 00       	mov    $0x11,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <unlink>:
SYSCALL(unlink)
 57d:	b8 12 00 00 00       	mov    $0x12,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <fstat>:
SYSCALL(fstat)
 585:	b8 08 00 00 00       	mov    $0x8,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <link>:
SYSCALL(link)
 58d:	b8 13 00 00 00       	mov    $0x13,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <mkdir>:
SYSCALL(mkdir)
 595:	b8 14 00 00 00       	mov    $0x14,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <chdir>:
SYSCALL(chdir)
 59d:	b8 09 00 00 00       	mov    $0x9,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <dup>:
SYSCALL(dup)
 5a5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <getpid>:
SYSCALL(getpid)
 5ad:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <getyear>:
SYSCALL(getyear)
 5b5:	b8 16 00 00 00       	mov    $0x16,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <getreadcount>:
SYSCALL(getreadcount)
 5bd:	b8 17 00 00 00       	mov    $0x17,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <sbrk>:
SYSCALL(sbrk)
 5c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <sleep>:
SYSCALL(sleep)
 5cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <uptime>:
SYSCALL(uptime)
 5d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <clone>:
SYSCALL(clone)
 5dd:	b8 18 00 00 00       	mov    $0x18,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <join>:
SYSCALL(join)
 5e5:	b8 19 00 00 00       	mov    $0x19,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    
 5ed:	66 90                	xchg   %ax,%ax
 5ef:	90                   	nop

000005f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 3c             	sub    $0x3c,%esp
 5f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5fc:	89 d1                	mov    %edx,%ecx
{
 5fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 601:	85 d2                	test   %edx,%edx
 603:	0f 89 7f 00 00 00    	jns    688 <printint+0x98>
 609:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 60d:	74 79                	je     688 <printint+0x98>
    neg = 1;
 60f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 616:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 618:	31 db                	xor    %ebx,%ebx
 61a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 620:	89 c8                	mov    %ecx,%eax
 622:	31 d2                	xor    %edx,%edx
 624:	89 cf                	mov    %ecx,%edi
 626:	f7 75 c4             	divl   -0x3c(%ebp)
 629:	0f b6 92 9c 08 00 00 	movzbl 0x89c(%edx),%edx
 630:	89 45 c0             	mov    %eax,-0x40(%ebp)
 633:	89 d8                	mov    %ebx,%eax
 635:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 638:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 63b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 63e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 641:	76 dd                	jbe    620 <printint+0x30>
  if(neg)
 643:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 646:	85 c9                	test   %ecx,%ecx
 648:	74 0c                	je     656 <printint+0x66>
    buf[i++] = '-';
 64a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 64f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 651:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 656:	8b 7d b8             	mov    -0x48(%ebp),%edi
 659:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 65d:	eb 07                	jmp    666 <printint+0x76>
 65f:	90                   	nop
 660:	0f b6 13             	movzbl (%ebx),%edx
 663:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 666:	83 ec 04             	sub    $0x4,%esp
 669:	88 55 d7             	mov    %dl,-0x29(%ebp)
 66c:	6a 01                	push   $0x1
 66e:	56                   	push   %esi
 66f:	57                   	push   %edi
 670:	e8 d8 fe ff ff       	call   54d <write>
  while(--i >= 0)
 675:	83 c4 10             	add    $0x10,%esp
 678:	39 de                	cmp    %ebx,%esi
 67a:	75 e4                	jne    660 <printint+0x70>
    putc(fd, buf[i]);
}
 67c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 67f:	5b                   	pop    %ebx
 680:	5e                   	pop    %esi
 681:	5f                   	pop    %edi
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 688:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 68f:	eb 87                	jmp    618 <printint+0x28>
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop

000006a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6a0:	f3 0f 1e fb          	endbr32 
 6a4:	55                   	push   %ebp
 6a5:	89 e5                	mov    %esp,%ebp
 6a7:	57                   	push   %edi
 6a8:	56                   	push   %esi
 6a9:	53                   	push   %ebx
 6aa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6ad:	8b 75 0c             	mov    0xc(%ebp),%esi
 6b0:	0f b6 1e             	movzbl (%esi),%ebx
 6b3:	84 db                	test   %bl,%bl
 6b5:	0f 84 b4 00 00 00    	je     76f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6bb:	8d 45 10             	lea    0x10(%ebp),%eax
 6be:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6c1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6c4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6c6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c9:	eb 33                	jmp    6fe <printf+0x5e>
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop
 6d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6d3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6d8:	83 f8 25             	cmp    $0x25,%eax
 6db:	74 17                	je     6f4 <printf+0x54>
  write(fd, &c, 1);
 6dd:	83 ec 04             	sub    $0x4,%esp
 6e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6e3:	6a 01                	push   $0x1
 6e5:	57                   	push   %edi
 6e6:	ff 75 08             	pushl  0x8(%ebp)
 6e9:	e8 5f fe ff ff       	call   54d <write>
 6ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6f1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6f4:	0f b6 1e             	movzbl (%esi),%ebx
 6f7:	83 c6 01             	add    $0x1,%esi
 6fa:	84 db                	test   %bl,%bl
 6fc:	74 71                	je     76f <printf+0xcf>
    c = fmt[i] & 0xff;
 6fe:	0f be cb             	movsbl %bl,%ecx
 701:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 704:	85 d2                	test   %edx,%edx
 706:	74 c8                	je     6d0 <printf+0x30>
      }
    } else if(state == '%'){
 708:	83 fa 25             	cmp    $0x25,%edx
 70b:	75 e7                	jne    6f4 <printf+0x54>
      if(c == 'd'){
 70d:	83 f8 64             	cmp    $0x64,%eax
 710:	0f 84 9a 00 00 00    	je     7b0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 716:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 71c:	83 f9 70             	cmp    $0x70,%ecx
 71f:	74 5f                	je     780 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 721:	83 f8 73             	cmp    $0x73,%eax
 724:	0f 84 d6 00 00 00    	je     800 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 72a:	83 f8 63             	cmp    $0x63,%eax
 72d:	0f 84 8d 00 00 00    	je     7c0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 733:	83 f8 25             	cmp    $0x25,%eax
 736:	0f 84 b4 00 00 00    	je     7f0 <printf+0x150>
  write(fd, &c, 1);
 73c:	83 ec 04             	sub    $0x4,%esp
 73f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 743:	6a 01                	push   $0x1
 745:	57                   	push   %edi
 746:	ff 75 08             	pushl  0x8(%ebp)
 749:	e8 ff fd ff ff       	call   54d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 74e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 751:	83 c4 0c             	add    $0xc,%esp
 754:	6a 01                	push   $0x1
 756:	83 c6 01             	add    $0x1,%esi
 759:	57                   	push   %edi
 75a:	ff 75 08             	pushl  0x8(%ebp)
 75d:	e8 eb fd ff ff       	call   54d <write>
  for(i = 0; fmt[i]; i++){
 762:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 766:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 769:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 76b:	84 db                	test   %bl,%bl
 76d:	75 8f                	jne    6fe <printf+0x5e>
    }
  }
}
 76f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 772:	5b                   	pop    %ebx
 773:	5e                   	pop    %esi
 774:	5f                   	pop    %edi
 775:	5d                   	pop    %ebp
 776:	c3                   	ret    
 777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	b9 10 00 00 00       	mov    $0x10,%ecx
 788:	6a 00                	push   $0x0
 78a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 78d:	8b 45 08             	mov    0x8(%ebp),%eax
 790:	8b 13                	mov    (%ebx),%edx
 792:	e8 59 fe ff ff       	call   5f0 <printint>
        ap++;
 797:	89 d8                	mov    %ebx,%eax
 799:	83 c4 10             	add    $0x10,%esp
      state = 0;
 79c:	31 d2                	xor    %edx,%edx
        ap++;
 79e:	83 c0 04             	add    $0x4,%eax
 7a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7a4:	e9 4b ff ff ff       	jmp    6f4 <printf+0x54>
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7b8:	6a 01                	push   $0x1
 7ba:	eb ce                	jmp    78a <printf+0xea>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7c6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7c8:	6a 01                	push   $0x1
        ap++;
 7ca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7cd:	57                   	push   %edi
 7ce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7d4:	e8 74 fd ff ff       	call   54d <write>
        ap++;
 7d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7df:	31 d2                	xor    %edx,%edx
 7e1:	e9 0e ff ff ff       	jmp    6f4 <printf+0x54>
 7e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7f3:	83 ec 04             	sub    $0x4,%esp
 7f6:	e9 59 ff ff ff       	jmp    754 <printf+0xb4>
 7fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop
        s = (char*)*ap;
 800:	8b 45 d0             	mov    -0x30(%ebp),%eax
 803:	8b 18                	mov    (%eax),%ebx
        ap++;
 805:	83 c0 04             	add    $0x4,%eax
 808:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 80b:	85 db                	test   %ebx,%ebx
 80d:	74 17                	je     826 <printf+0x186>
        while(*s != 0){
 80f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 812:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 814:	84 c0                	test   %al,%al
 816:	0f 84 d8 fe ff ff    	je     6f4 <printf+0x54>
 81c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 81f:	89 de                	mov    %ebx,%esi
 821:	8b 5d 08             	mov    0x8(%ebp),%ebx
 824:	eb 1a                	jmp    840 <printf+0x1a0>
          s = "(null)";
 826:	bb 95 08 00 00       	mov    $0x895,%ebx
        while(*s != 0){
 82b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 82e:	b8 28 00 00 00       	mov    $0x28,%eax
 833:	89 de                	mov    %ebx,%esi
 835:	8b 5d 08             	mov    0x8(%ebp),%ebx
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
  write(fd, &c, 1);
 840:	83 ec 04             	sub    $0x4,%esp
          s++;
 843:	83 c6 01             	add    $0x1,%esi
 846:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 849:	6a 01                	push   $0x1
 84b:	57                   	push   %edi
 84c:	53                   	push   %ebx
 84d:	e8 fb fc ff ff       	call   54d <write>
        while(*s != 0){
 852:	0f b6 06             	movzbl (%esi),%eax
 855:	83 c4 10             	add    $0x10,%esp
 858:	84 c0                	test   %al,%al
 85a:	75 e4                	jne    840 <printf+0x1a0>
 85c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 85f:	31 d2                	xor    %edx,%edx
 861:	e9 8e fe ff ff       	jmp    6f4 <printf+0x54>
