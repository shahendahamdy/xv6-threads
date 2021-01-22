
_threadtest1:     file format elf32-i386


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
  12:	83 ec 10             	sub    $0x10,%esp

  lock_init(L);
  15:	ff 35 20 0c 00 00    	pushl  0xc20
  1b:	e8 f0 02 00 00       	call   310 <lock_init>
  printf(1, "----------------\n");
  20:	58                   	pop    %eax
  21:	5a                   	pop    %edx
  22:	68 8b 08 00 00       	push   $0x88b
  27:	6a 01                	push   $0x1
  29:	e8 82 06 00 00       	call   6b0 <printf>
  lock_acquire(L);
  2e:	59                   	pop    %ecx
  2f:	ff 35 20 0c 00 00    	pushl  0xc20
  35:	e8 f6 02 00 00       	call   330 <lock_acquire>
  thread_create(&print, NULL,NULL);
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	6a 00                	push   $0x0
  3f:	6a 00                	push   $0x0
  41:	68 70 00 00 00       	push   $0x70
  46:	e8 c5 04 00 00       	call   510 <thread_create>
  lock_release(L);
  4b:	58                   	pop    %eax
  4c:	ff 35 20 0c 00 00    	pushl  0xc20
  52:	e8 f9 02 00 00       	call   350 <lock_release>
  thread_join();
  57:	e8 94 02 00 00       	call   2f0 <thread_join>
  
  printf(1, "EXITING  \n");
  5c:	58                   	pop    %eax
  5d:	5a                   	pop    %edx
  5e:	68 9d 08 00 00       	push   $0x89d
  63:	6a 01                	push   $0x1
  65:	e8 46 06 00 00       	call   6b0 <printf>
  exit();
  6a:	e8 ce 04 00 00       	call   53d <exit>
  6f:	90                   	nop

00000070 <print>:
void print(){
  70:	f3 0f 1e fb          	endbr32 
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	83 ec 10             	sub    $0x10,%esp
printf(1,"====Threads======\n");
  7a:	68 78 08 00 00       	push   $0x878
  7f:	6a 01                	push   $0x1
  81:	e8 2a 06 00 00       	call   6b0 <printf>
exit();
  86:	e8 b2 04 00 00       	call   53d <exit>
  8b:	66 90                	xchg   %ax,%ax
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  95:	31 c0                	xor    %eax,%eax
{
  97:	89 e5                	mov    %esp,%ebp
  99:	53                   	push   %ebx
  9a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  a7:	83 c0 01             	add    $0x1,%eax
  aa:	84 d2                	test   %dl,%dl
  ac:	75 f2                	jne    a0 <strcpy+0x10>
    ;
  return os;
}
  ae:	89 c8                	mov    %ecx,%eax
  b0:	5b                   	pop    %ebx
  b1:	5d                   	pop    %ebp
  b2:	c3                   	ret    
  b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	f3 0f 1e fb          	endbr32 
  c4:	55                   	push   %ebp
  c5:	89 e5                	mov    %esp,%ebp
  c7:	53                   	push   %ebx
  c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ce:	0f b6 01             	movzbl (%ecx),%eax
  d1:	0f b6 1a             	movzbl (%edx),%ebx
  d4:	84 c0                	test   %al,%al
  d6:	75 19                	jne    f1 <strcmp+0x31>
  d8:	eb 26                	jmp    100 <strcmp+0x40>
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  e4:	83 c1 01             	add    $0x1,%ecx
  e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ea:	0f b6 1a             	movzbl (%edx),%ebx
  ed:	84 c0                	test   %al,%al
  ef:	74 0f                	je     100 <strcmp+0x40>
  f1:	38 d8                	cmp    %bl,%al
  f3:	74 eb                	je     e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  f5:	29 d8                	sub    %ebx,%eax
}
  f7:	5b                   	pop    %ebx
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 100:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 102:	29 d8                	sub    %ebx,%eax
}
 104:	5b                   	pop    %ebx
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10e:	66 90                	xchg   %ax,%ax

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 11a:	80 3a 00             	cmpb   $0x0,(%edx)
 11d:	74 21                	je     140 <strlen+0x30>
 11f:	31 c0                	xor    %eax,%eax
 121:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 128:	83 c0 01             	add    $0x1,%eax
 12b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 12f:	89 c1                	mov    %eax,%ecx
 131:	75 f5                	jne    128 <strlen+0x18>
    ;
  return n;
}
 133:	89 c8                	mov    %ecx,%eax
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 140:	31 c9                	xor    %ecx,%ecx
}
 142:	5d                   	pop    %ebp
 143:	89 c8                	mov    %ecx,%eax
 145:	c3                   	ret    
 146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14d:	8d 76 00             	lea    0x0(%esi),%esi

00000150 <memset>:

void*
memset(void *dst, int c, uint n)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	57                   	push   %edi
 158:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 15b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	89 d7                	mov    %edx,%edi
 163:	fc                   	cld    
 164:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 166:	89 d0                	mov    %edx,%eax
 168:	5f                   	pop    %edi
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret    
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	8b 45 08             	mov    0x8(%ebp),%eax
 17a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	84 d2                	test   %dl,%dl
 183:	75 16                	jne    19b <strchr+0x2b>
 185:	eb 21                	jmp    1a8 <strchr+0x38>
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax
 190:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 194:	83 c0 01             	add    $0x1,%eax
 197:	84 d2                	test   %dl,%dl
 199:	74 0d                	je     1a8 <strchr+0x38>
    if(*s == c)
 19b:	38 d1                	cmp    %dl,%cl
 19d:	75 f1                	jne    190 <strchr+0x20>
      return (char*)s;
  return 0;
}
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1a8:	31 c0                	xor    %eax,%eax
}
 1aa:	5d                   	pop    %ebp
 1ab:	c3                   	ret    
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b9:	31 f6                	xor    %esi,%esi
{
 1bb:	53                   	push   %ebx
 1bc:	89 f3                	mov    %esi,%ebx
 1be:	83 ec 1c             	sub    $0x1c,%esp
 1c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1c4:	eb 33                	jmp    1f9 <gets+0x49>
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1d0:	83 ec 04             	sub    $0x4,%esp
 1d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1d6:	6a 01                	push   $0x1
 1d8:	50                   	push   %eax
 1d9:	6a 00                	push   $0x0
 1db:	e8 75 03 00 00       	call   555 <read>
    if(cc < 1)
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	85 c0                	test   %eax,%eax
 1e5:	7e 1c                	jle    203 <gets+0x53>
      break;
    buf[i++] = c;
 1e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1eb:	83 c7 01             	add    $0x1,%edi
 1ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1f1:	3c 0a                	cmp    $0xa,%al
 1f3:	74 23                	je     218 <gets+0x68>
 1f5:	3c 0d                	cmp    $0xd,%al
 1f7:	74 1f                	je     218 <gets+0x68>
  for(i=0; i+1 < max; ){
 1f9:	83 c3 01             	add    $0x1,%ebx
 1fc:	89 fe                	mov    %edi,%esi
 1fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 201:	7c cd                	jl     1d0 <gets+0x20>
 203:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 205:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 208:	c6 03 00             	movb   $0x0,(%ebx)
}
 20b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20e:	5b                   	pop    %ebx
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 217:	90                   	nop
 218:	8b 75 08             	mov    0x8(%ebp),%esi
 21b:	8b 45 08             	mov    0x8(%ebp),%eax
 21e:	01 de                	add    %ebx,%esi
 220:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 222:	c6 03 00             	movb   $0x0,(%ebx)
}
 225:	8d 65 f4             	lea    -0xc(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5f                   	pop    %edi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi

00000230 <stat>:

int
stat(const char *n, struct stat *st)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	56                   	push   %esi
 238:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 239:	83 ec 08             	sub    $0x8,%esp
 23c:	6a 00                	push   $0x0
 23e:	ff 75 08             	pushl  0x8(%ebp)
 241:	e8 37 03 00 00       	call   57d <open>
  if(fd < 0)
 246:	83 c4 10             	add    $0x10,%esp
 249:	85 c0                	test   %eax,%eax
 24b:	78 2b                	js     278 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	ff 75 0c             	pushl  0xc(%ebp)
 253:	89 c3                	mov    %eax,%ebx
 255:	50                   	push   %eax
 256:	e8 3a 03 00 00       	call   595 <fstat>
  close(fd);
 25b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 25e:	89 c6                	mov    %eax,%esi
  close(fd);
 260:	e8 00 03 00 00       	call   565 <close>
  return r;
 265:	83 c4 10             	add    $0x10,%esp
}
 268:	8d 65 f8             	lea    -0x8(%ebp),%esp
 26b:	89 f0                	mov    %esi,%eax
 26d:	5b                   	pop    %ebx
 26e:	5e                   	pop    %esi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 278:	be ff ff ff ff       	mov    $0xffffffff,%esi
 27d:	eb e9                	jmp    268 <stat+0x38>
 27f:	90                   	nop

00000280 <atoi>:

int
atoi(const char *s)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	53                   	push   %ebx
 288:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 28b:	0f be 02             	movsbl (%edx),%eax
 28e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 291:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 294:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 299:	77 1a                	ja     2b5 <atoi+0x35>
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop
    n = n*10 + *s++ - '0';
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2aa:	0f be 02             	movsbl (%edx),%eax
 2ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2b0:	80 fb 09             	cmp    $0x9,%bl
 2b3:	76 eb                	jbe    2a0 <atoi+0x20>
  return n;
}
 2b5:	89 c8                	mov    %ecx,%eax
 2b7:	5b                   	pop    %ebx
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	57                   	push   %edi
 2c8:	8b 45 10             	mov    0x10(%ebp),%eax
 2cb:	8b 55 08             	mov    0x8(%ebp),%edx
 2ce:	56                   	push   %esi
 2cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d2:	85 c0                	test   %eax,%eax
 2d4:	7e 0f                	jle    2e5 <memmove+0x25>
 2d6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2d8:	89 d7                	mov    %edx,%edi
 2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2e1:	39 f8                	cmp    %edi,%eax
 2e3:	75 fb                	jne    2e0 <memmove+0x20>
  return vdst;
}
 2e5:	5e                   	pop    %esi
 2e6:	89 d0                	mov    %edx,%eax
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop

000002f0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 2fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fd:	50                   	push   %eax
 2fe:	e8 f2 02 00 00       	call   5f5 <join>
  
  return x;
}
 303:	c9                   	leave  
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <lock_init>:

void lock_init(struct lock_t *lk){
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 320:	5d                   	pop    %ebp
 321:	c3                   	ret    
 322:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 335:	b9 01 00 00 00       	mov    $0x1,%ecx
 33a:	89 e5                	mov    %esp,%ebp
 33c:	8b 55 08             	mov    0x8(%ebp),%edx
 33f:	90                   	nop
 340:	89 c8                	mov    %ecx,%eax
 342:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 345:	85 c0                	test   %eax,%eax
 347:	75 f7                	jne    340 <lock_acquire+0x10>
}
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <lock_release>:
void lock_release(struct lock_t *lk){
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	31 c0                	xor    %eax,%eax
 357:	89 e5                	mov    %esp,%ebp
 359:	8b 55 08             	mov    0x8(%ebp),%edx
 35c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 368:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 375:	a1 14 0c 00 00       	mov    0xc14,%eax
{
 37a:	89 e5                	mov    %esp,%ebp
 37c:	57                   	push   %edi
 37d:	56                   	push   %esi
 37e:	53                   	push   %ebx
 37f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 382:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 384:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 387:	39 c8                	cmp    %ecx,%eax
 389:	73 15                	jae    3a0 <free+0x30>
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop
 390:	39 d1                	cmp    %edx,%ecx
 392:	72 14                	jb     3a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 394:	39 d0                	cmp    %edx,%eax
 396:	73 10                	jae    3a8 <free+0x38>
{
 398:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 39a:	8b 10                	mov    (%eax),%edx
 39c:	39 c8                	cmp    %ecx,%eax
 39e:	72 f0                	jb     390 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3a0:	39 d0                	cmp    %edx,%eax
 3a2:	72 f4                	jb     398 <free+0x28>
 3a4:	39 d1                	cmp    %edx,%ecx
 3a6:	73 f0                	jae    398 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3ae:	39 fa                	cmp    %edi,%edx
 3b0:	74 1e                	je     3d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3b5:	8b 50 04             	mov    0x4(%eax),%edx
 3b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3bb:	39 f1                	cmp    %esi,%ecx
 3bd:	74 28                	je     3e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 3bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 3c1:	5b                   	pop    %ebx
  freep = p;
 3c2:	a3 14 0c 00 00       	mov    %eax,0xc14
}
 3c7:	5e                   	pop    %esi
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 3d0:	03 72 04             	add    0x4(%edx),%esi
 3d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 3d6:	8b 10                	mov    (%eax),%edx
 3d8:	8b 12                	mov    (%edx),%edx
 3da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3dd:	8b 50 04             	mov    0x4(%eax),%edx
 3e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3e3:	39 f1                	cmp    %esi,%ecx
 3e5:	75 d8                	jne    3bf <free+0x4f>
    p->s.size += bp->s.size;
 3e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 3ea:	a3 14 0c 00 00       	mov    %eax,0xc14
    p->s.size += bp->s.size;
 3ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 3f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 3f5:	89 10                	mov    %edx,(%eax)
}
 3f7:	5b                   	pop    %ebx
 3f8:	5e                   	pop    %esi
 3f9:	5f                   	pop    %edi
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	56                   	push   %esi
 409:	53                   	push   %ebx
 40a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 410:	8b 3d 14 0c 00 00    	mov    0xc14,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 416:	8d 70 07             	lea    0x7(%eax),%esi
 419:	c1 ee 03             	shr    $0x3,%esi
 41c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 41f:	85 ff                	test   %edi,%edi
 421:	0f 84 a9 00 00 00    	je     4d0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 427:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 429:	8b 48 04             	mov    0x4(%eax),%ecx
 42c:	39 f1                	cmp    %esi,%ecx
 42e:	73 6d                	jae    49d <malloc+0x9d>
 430:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 436:	bb 00 10 00 00       	mov    $0x1000,%ebx
 43b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 43e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 445:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 448:	eb 17                	jmp    461 <malloc+0x61>
 44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 450:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 452:	8b 4a 04             	mov    0x4(%edx),%ecx
 455:	39 f1                	cmp    %esi,%ecx
 457:	73 4f                	jae    4a8 <malloc+0xa8>
 459:	8b 3d 14 0c 00 00    	mov    0xc14,%edi
 45f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 461:	39 c7                	cmp    %eax,%edi
 463:	75 eb                	jne    450 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 465:	83 ec 0c             	sub    $0xc,%esp
 468:	ff 75 e4             	pushl  -0x1c(%ebp)
 46b:	e8 65 01 00 00       	call   5d5 <sbrk>
  if(p == (char*)-1)
 470:	83 c4 10             	add    $0x10,%esp
 473:	83 f8 ff             	cmp    $0xffffffff,%eax
 476:	74 1b                	je     493 <malloc+0x93>
  hp->s.size = nu;
 478:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 47b:	83 ec 0c             	sub    $0xc,%esp
 47e:	83 c0 08             	add    $0x8,%eax
 481:	50                   	push   %eax
 482:	e8 e9 fe ff ff       	call   370 <free>
  return freep;
 487:	a1 14 0c 00 00       	mov    0xc14,%eax
      if((p = morecore(nunits)) == 0)
 48c:	83 c4 10             	add    $0x10,%esp
 48f:	85 c0                	test   %eax,%eax
 491:	75 bd                	jne    450 <malloc+0x50>
        return 0;
  }
}
 493:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 496:	31 c0                	xor    %eax,%eax
}
 498:	5b                   	pop    %ebx
 499:	5e                   	pop    %esi
 49a:	5f                   	pop    %edi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    
    if(p->s.size >= nunits){
 49d:	89 c2                	mov    %eax,%edx
 49f:	89 f8                	mov    %edi,%eax
 4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 4a8:	39 ce                	cmp    %ecx,%esi
 4aa:	74 54                	je     500 <malloc+0x100>
        p->s.size -= nunits;
 4ac:	29 f1                	sub    %esi,%ecx
 4ae:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 4b1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 4b4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 4b7:	a3 14 0c 00 00       	mov    %eax,0xc14
}
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 4bf:	8d 42 08             	lea    0x8(%edx),%eax
}
 4c2:	5b                   	pop    %ebx
 4c3:	5e                   	pop    %esi
 4c4:	5f                   	pop    %edi
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret    
 4c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ce:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 4d0:	c7 05 14 0c 00 00 18 	movl   $0xc18,0xc14
 4d7:	0c 00 00 
    base.s.size = 0;
 4da:	bf 18 0c 00 00       	mov    $0xc18,%edi
    base.s.ptr = freep = prevp = &base;
 4df:	c7 05 18 0c 00 00 18 	movl   $0xc18,0xc18
 4e6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4e9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 4eb:	c7 05 1c 0c 00 00 00 	movl   $0x0,0xc1c
 4f2:	00 00 00 
    if(p->s.size >= nunits){
 4f5:	e9 36 ff ff ff       	jmp    430 <malloc+0x30>
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 500:	8b 0a                	mov    (%edx),%ecx
 502:	89 08                	mov    %ecx,(%eax)
 504:	eb b1                	jmp    4b7 <malloc+0xb7>
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi

00000510 <thread_create>:
{
 510:	f3 0f 1e fb          	endbr32 
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 51a:	68 00 10 00 00       	push   $0x1000
 51f:	e8 dc fe ff ff       	call   400 <malloc>
return clone(start_routine,arg1,arg2,stack);
 524:	50                   	push   %eax
 525:	ff 75 10             	pushl  0x10(%ebp)
 528:	ff 75 0c             	pushl  0xc(%ebp)
 52b:	ff 75 08             	pushl  0x8(%ebp)
 52e:	e8 ba 00 00 00       	call   5ed <clone>
}
 533:	c9                   	leave  
 534:	c3                   	ret    

00000535 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 535:	b8 01 00 00 00       	mov    $0x1,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <exit>:
SYSCALL(exit)
 53d:	b8 02 00 00 00       	mov    $0x2,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <wait>:
SYSCALL(wait)
 545:	b8 03 00 00 00       	mov    $0x3,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <pipe>:
SYSCALL(pipe)
 54d:	b8 04 00 00 00       	mov    $0x4,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <read>:
SYSCALL(read)
 555:	b8 05 00 00 00       	mov    $0x5,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <write>:
SYSCALL(write)
 55d:	b8 10 00 00 00       	mov    $0x10,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <close>:
SYSCALL(close)
 565:	b8 15 00 00 00       	mov    $0x15,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <kill>:
SYSCALL(kill)
 56d:	b8 06 00 00 00       	mov    $0x6,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <exec>:
SYSCALL(exec)
 575:	b8 07 00 00 00       	mov    $0x7,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <open>:
SYSCALL(open)
 57d:	b8 0f 00 00 00       	mov    $0xf,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <mknod>:
SYSCALL(mknod)
 585:	b8 11 00 00 00       	mov    $0x11,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <unlink>:
SYSCALL(unlink)
 58d:	b8 12 00 00 00       	mov    $0x12,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <fstat>:
SYSCALL(fstat)
 595:	b8 08 00 00 00       	mov    $0x8,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <link>:
SYSCALL(link)
 59d:	b8 13 00 00 00       	mov    $0x13,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <mkdir>:
SYSCALL(mkdir)
 5a5:	b8 14 00 00 00       	mov    $0x14,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <chdir>:
SYSCALL(chdir)
 5ad:	b8 09 00 00 00       	mov    $0x9,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <dup>:
SYSCALL(dup)
 5b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <getpid>:
SYSCALL(getpid)
 5bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <getyear>:
SYSCALL(getyear)
 5c5:	b8 16 00 00 00       	mov    $0x16,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <getreadcount>:
SYSCALL(getreadcount)
 5cd:	b8 17 00 00 00       	mov    $0x17,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <sbrk>:
SYSCALL(sbrk)
 5d5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <sleep>:
SYSCALL(sleep)
 5dd:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <uptime>:
SYSCALL(uptime)
 5e5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <clone>:
SYSCALL(clone)
 5ed:	b8 18 00 00 00       	mov    $0x18,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <join>:
SYSCALL(join)
 5f5:	b8 19 00 00 00       	mov    $0x19,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    
 5fd:	66 90                	xchg   %ax,%ax
 5ff:	90                   	nop

00000600 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 3c             	sub    $0x3c,%esp
 609:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 60c:	89 d1                	mov    %edx,%ecx
{
 60e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 611:	85 d2                	test   %edx,%edx
 613:	0f 89 7f 00 00 00    	jns    698 <printint+0x98>
 619:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 61d:	74 79                	je     698 <printint+0x98>
    neg = 1;
 61f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 626:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 628:	31 db                	xor    %ebx,%ebx
 62a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 630:	89 c8                	mov    %ecx,%eax
 632:	31 d2                	xor    %edx,%edx
 634:	89 cf                	mov    %ecx,%edi
 636:	f7 75 c4             	divl   -0x3c(%ebp)
 639:	0f b6 92 b0 08 00 00 	movzbl 0x8b0(%edx),%edx
 640:	89 45 c0             	mov    %eax,-0x40(%ebp)
 643:	89 d8                	mov    %ebx,%eax
 645:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 648:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 64b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 64e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 651:	76 dd                	jbe    630 <printint+0x30>
  if(neg)
 653:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 656:	85 c9                	test   %ecx,%ecx
 658:	74 0c                	je     666 <printint+0x66>
    buf[i++] = '-';
 65a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 65f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 661:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 666:	8b 7d b8             	mov    -0x48(%ebp),%edi
 669:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 66d:	eb 07                	jmp    676 <printint+0x76>
 66f:	90                   	nop
 670:	0f b6 13             	movzbl (%ebx),%edx
 673:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 676:	83 ec 04             	sub    $0x4,%esp
 679:	88 55 d7             	mov    %dl,-0x29(%ebp)
 67c:	6a 01                	push   $0x1
 67e:	56                   	push   %esi
 67f:	57                   	push   %edi
 680:	e8 d8 fe ff ff       	call   55d <write>
  while(--i >= 0)
 685:	83 c4 10             	add    $0x10,%esp
 688:	39 de                	cmp    %ebx,%esi
 68a:	75 e4                	jne    670 <printint+0x70>
    putc(fd, buf[i]);
}
 68c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68f:	5b                   	pop    %ebx
 690:	5e                   	pop    %esi
 691:	5f                   	pop    %edi
 692:	5d                   	pop    %ebp
 693:	c3                   	ret    
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 698:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 69f:	eb 87                	jmp    628 <printint+0x28>
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop

000006b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	57                   	push   %edi
 6b8:	56                   	push   %esi
 6b9:	53                   	push   %ebx
 6ba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6bd:	8b 75 0c             	mov    0xc(%ebp),%esi
 6c0:	0f b6 1e             	movzbl (%esi),%ebx
 6c3:	84 db                	test   %bl,%bl
 6c5:	0f 84 b4 00 00 00    	je     77f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6cb:	8d 45 10             	lea    0x10(%ebp),%eax
 6ce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6d1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6d4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6d9:	eb 33                	jmp    70e <printf+0x5e>
 6db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
 6e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6e3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6e8:	83 f8 25             	cmp    $0x25,%eax
 6eb:	74 17                	je     704 <printf+0x54>
  write(fd, &c, 1);
 6ed:	83 ec 04             	sub    $0x4,%esp
 6f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6f3:	6a 01                	push   $0x1
 6f5:	57                   	push   %edi
 6f6:	ff 75 08             	pushl  0x8(%ebp)
 6f9:	e8 5f fe ff ff       	call   55d <write>
 6fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 701:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 704:	0f b6 1e             	movzbl (%esi),%ebx
 707:	83 c6 01             	add    $0x1,%esi
 70a:	84 db                	test   %bl,%bl
 70c:	74 71                	je     77f <printf+0xcf>
    c = fmt[i] & 0xff;
 70e:	0f be cb             	movsbl %bl,%ecx
 711:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 714:	85 d2                	test   %edx,%edx
 716:	74 c8                	je     6e0 <printf+0x30>
      }
    } else if(state == '%'){
 718:	83 fa 25             	cmp    $0x25,%edx
 71b:	75 e7                	jne    704 <printf+0x54>
      if(c == 'd'){
 71d:	83 f8 64             	cmp    $0x64,%eax
 720:	0f 84 9a 00 00 00    	je     7c0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 726:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 72c:	83 f9 70             	cmp    $0x70,%ecx
 72f:	74 5f                	je     790 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 731:	83 f8 73             	cmp    $0x73,%eax
 734:	0f 84 d6 00 00 00    	je     810 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 73a:	83 f8 63             	cmp    $0x63,%eax
 73d:	0f 84 8d 00 00 00    	je     7d0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 743:	83 f8 25             	cmp    $0x25,%eax
 746:	0f 84 b4 00 00 00    	je     800 <printf+0x150>
  write(fd, &c, 1);
 74c:	83 ec 04             	sub    $0x4,%esp
 74f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 753:	6a 01                	push   $0x1
 755:	57                   	push   %edi
 756:	ff 75 08             	pushl  0x8(%ebp)
 759:	e8 ff fd ff ff       	call   55d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 75e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 761:	83 c4 0c             	add    $0xc,%esp
 764:	6a 01                	push   $0x1
 766:	83 c6 01             	add    $0x1,%esi
 769:	57                   	push   %edi
 76a:	ff 75 08             	pushl  0x8(%ebp)
 76d:	e8 eb fd ff ff       	call   55d <write>
  for(i = 0; fmt[i]; i++){
 772:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 776:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 779:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 77b:	84 db                	test   %bl,%bl
 77d:	75 8f                	jne    70e <printf+0x5e>
    }
  }
}
 77f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 782:	5b                   	pop    %ebx
 783:	5e                   	pop    %esi
 784:	5f                   	pop    %edi
 785:	5d                   	pop    %ebp
 786:	c3                   	ret    
 787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	b9 10 00 00 00       	mov    $0x10,%ecx
 798:	6a 00                	push   $0x0
 79a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 79d:	8b 45 08             	mov    0x8(%ebp),%eax
 7a0:	8b 13                	mov    (%ebx),%edx
 7a2:	e8 59 fe ff ff       	call   600 <printint>
        ap++;
 7a7:	89 d8                	mov    %ebx,%eax
 7a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ac:	31 d2                	xor    %edx,%edx
        ap++;
 7ae:	83 c0 04             	add    $0x4,%eax
 7b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7b4:	e9 4b ff ff ff       	jmp    704 <printf+0x54>
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c8:	6a 01                	push   $0x1
 7ca:	eb ce                	jmp    79a <printf+0xea>
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7d6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7d8:	6a 01                	push   $0x1
        ap++;
 7da:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7dd:	57                   	push   %edi
 7de:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7e4:	e8 74 fd ff ff       	call   55d <write>
        ap++;
 7e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ef:	31 d2                	xor    %edx,%edx
 7f1:	e9 0e ff ff ff       	jmp    704 <printf+0x54>
 7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 800:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 803:	83 ec 04             	sub    $0x4,%esp
 806:	e9 59 ff ff ff       	jmp    764 <printf+0xb4>
 80b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
        s = (char*)*ap;
 810:	8b 45 d0             	mov    -0x30(%ebp),%eax
 813:	8b 18                	mov    (%eax),%ebx
        ap++;
 815:	83 c0 04             	add    $0x4,%eax
 818:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 81b:	85 db                	test   %ebx,%ebx
 81d:	74 17                	je     836 <printf+0x186>
        while(*s != 0){
 81f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 822:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 824:	84 c0                	test   %al,%al
 826:	0f 84 d8 fe ff ff    	je     704 <printf+0x54>
 82c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 82f:	89 de                	mov    %ebx,%esi
 831:	8b 5d 08             	mov    0x8(%ebp),%ebx
 834:	eb 1a                	jmp    850 <printf+0x1a0>
          s = "(null)";
 836:	bb a8 08 00 00       	mov    $0x8a8,%ebx
        while(*s != 0){
 83b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 83e:	b8 28 00 00 00       	mov    $0x28,%eax
 843:	89 de                	mov    %ebx,%esi
 845:	8b 5d 08             	mov    0x8(%ebp),%ebx
 848:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
  write(fd, &c, 1);
 850:	83 ec 04             	sub    $0x4,%esp
          s++;
 853:	83 c6 01             	add    $0x1,%esi
 856:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 859:	6a 01                	push   $0x1
 85b:	57                   	push   %edi
 85c:	53                   	push   %ebx
 85d:	e8 fb fc ff ff       	call   55d <write>
        while(*s != 0){
 862:	0f b6 06             	movzbl (%esi),%eax
 865:	83 c4 10             	add    $0x10,%esp
 868:	84 c0                	test   %al,%al
 86a:	75 e4                	jne    850 <printf+0x1a0>
 86c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 86f:	31 d2                	xor    %edx,%edx
 871:	e9 8e fe ff ff       	jmp    704 <printf+0x54>
