
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 28                	jle    49 <main+0x49>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
  27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2e:	66 90                	xchg   %ax,%ax
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	83 c3 04             	add    $0x4,%ebx
  38:	e8 c3 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  3d:	83 c4 10             	add    $0x10,%esp
  40:	39 f3                	cmp    %esi,%ebx
  42:	75 ec                	jne    30 <main+0x30>
  exit();
  44:	e8 a4 07 00 00       	call   7ed <exit>
    ls(".");
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	68 70 0b 00 00       	push   $0xb70
  51:	e8 aa 00 00 00       	call   100 <ls>
    exit();
  56:	e8 92 07 00 00       	call   7ed <exit>
  5b:	66 90                	xchg   %ax,%ax
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <fmtname>:
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	56                   	push   %esi
  68:	53                   	push   %ebx
  69:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  6c:	83 ec 0c             	sub    $0xc,%esp
  6f:	56                   	push   %esi
  70:	e8 4b 03 00 00       	call   3c0 <strlen>
  75:	83 c4 10             	add    $0x10,%esp
  78:	01 f0                	add    %esi,%eax
  7a:	89 c3                	mov    %eax,%ebx
  7c:	73 0b                	jae    89 <fmtname+0x29>
  7e:	eb 0e                	jmp    8e <fmtname+0x2e>
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 44 0f 00 00       	push   $0xf44
  b5:	e8 b6 04 00 00       	call   570 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 44 0f 00 00       	mov    $0xf44,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 44 0f 00 00       	add    $0xf44,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 17 03 00 00       	call   400 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	57                   	push   %edi
 108:	56                   	push   %esi
 109:	53                   	push   %ebx
 10a:	81 ec 64 02 00 00    	sub    $0x264,%esp
 110:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 113:	6a 00                	push   $0x0
 115:	57                   	push   %edi
 116:	e8 12 07 00 00       	call   82d <open>
 11b:	83 c4 10             	add    $0x10,%esp
 11e:	85 c0                	test   %eax,%eax
 120:	0f 88 9a 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 126:	83 ec 08             	sub    $0x8,%esp
 129:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12f:	89 c3                	mov    %eax,%ebx
 131:	56                   	push   %esi
 132:	50                   	push   %eax
 133:	e8 0d 07 00 00       	call   845 <fstat>
 138:	83 c4 10             	add    $0x10,%esp
 13b:	85 c0                	test   %eax,%eax
 13d:	0f 88 bd 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 143:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 14a:	66 83 f8 01          	cmp    $0x1,%ax
 14e:	74 60                	je     1b0 <ls+0xb0>
 150:	66 83 f8 02          	cmp    $0x2,%ax
 154:	74 1a                	je     170 <ls+0x70>
  close(fd);
 156:	83 ec 0c             	sub    $0xc,%esp
 159:	53                   	push   %ebx
 15a:	e8 b6 06 00 00       	call   815 <close>
 15f:	83 c4 10             	add    $0x10,%esp
}
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 50 0b 00 00       	push   $0xb50
 19d:	6a 01                	push   $0x1
 19f:	e8 bc 07 00 00       	call   960 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb ad                	jmp    156 <ls+0x56>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 07 02 00 00       	call   3c0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 de 01 00 00       	call   3c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 f3 05 00 00       	call   805 <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 38 ff ff ff    	jne    156 <ls+0x56>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 23a:	e8 31 03 00 00       	call   570 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 8e 02 00 00       	call   4e0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 50 0b 00 00       	push   $0xb50
 2a7:	6a 01                	push   $0x1
 2a9:	e8 b2 06 00 00       	call   960 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 28 0b 00 00       	push   $0xb28
 2c9:	6a 02                	push   $0x2
 2cb:	e8 90 06 00 00       	call   960 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 5d 0b 00 00       	push   $0xb5d
 2e8:	6a 01                	push   $0x1
 2ea:	e8 71 06 00 00       	call   960 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5f fe ff ff       	jmp    156 <ls+0x56>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 3c 0b 00 00       	push   $0xb3c
 309:	6a 02                	push   $0x2
 30b:	e8 50 06 00 00       	call   960 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 fd 04 00 00       	call   815 <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 3c 0b 00 00       	push   $0xb3c
 331:	6a 01                	push   $0x1
 333:	e8 28 06 00 00       	call   960 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:
};


char*
strcpy(char *s, const char *t)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 345:	31 c0                	xor    %eax,%eax
{
 347:	89 e5                	mov    %esp,%ebp
 349:	53                   	push   %ebx
 34a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	89 c8                	mov    %ecx,%eax
 360:	5b                   	pop    %ebx
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	53                   	push   %ebx
 378:	8b 4d 08             	mov    0x8(%ebp),%ecx
 37b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 37e:	0f b6 01             	movzbl (%ecx),%eax
 381:	0f b6 1a             	movzbl (%edx),%ebx
 384:	84 c0                	test   %al,%al
 386:	75 19                	jne    3a1 <strcmp+0x31>
 388:	eb 26                	jmp    3b0 <strcmp+0x40>
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 390:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39a:	0f b6 1a             	movzbl (%edx),%ebx
 39d:	84 c0                	test   %al,%al
 39f:	74 0f                	je     3b0 <strcmp+0x40>
 3a1:	38 d8                	cmp    %bl,%al
 3a3:	74 eb                	je     390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3a5:	29 d8                	sub    %ebx,%eax
}
 3a7:	5b                   	pop    %ebx
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3b2:	29 d8                	sub    %ebx,%eax
}
 3b4:	5b                   	pop    %ebx
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3ca:	80 3a 00             	cmpb   $0x0,(%edx)
 3cd:	74 21                	je     3f0 <strlen+0x30>
 3cf:	31 c0                	xor    %eax,%eax
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	83 c0 01             	add    $0x1,%eax
 3db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3df:	89 c1                	mov    %eax,%ecx
 3e1:	75 f5                	jne    3d8 <strlen+0x18>
    ;
  return n;
}
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 3f0:	31 c9                	xor    %ecx,%ecx
}
 3f2:	5d                   	pop    %ebp
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	c3                   	ret    
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 40b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	89 d7                	mov    %edx,%edi
 413:	fc                   	cld    
 414:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42e:	0f b6 10             	movzbl (%eax),%edx
 431:	84 d2                	test   %dl,%dl
 433:	75 16                	jne    44b <strchr+0x2b>
 435:	eb 21                	jmp    458 <strchr+0x38>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
 440:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 444:	83 c0 01             	add    $0x1,%eax
 447:	84 d2                	test   %dl,%dl
 449:	74 0d                	je     458 <strchr+0x38>
    if(*s == c)
 44b:	38 d1                	cmp    %dl,%cl
 44d:	75 f1                	jne    440 <strchr+0x20>
      return (char*)s;
  return 0;
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 458:	31 c0                	xor    %eax,%eax
}
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 469:	31 f6                	xor    %esi,%esi
{
 46b:	53                   	push   %ebx
 46c:	89 f3                	mov    %esi,%ebx
 46e:	83 ec 1c             	sub    $0x1c,%esp
 471:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 474:	eb 33                	jmp    4a9 <gets+0x49>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	8d 45 e7             	lea    -0x19(%ebp),%eax
 486:	6a 01                	push   $0x1
 488:	50                   	push   %eax
 489:	6a 00                	push   $0x0
 48b:	e8 75 03 00 00       	call   805 <read>
    if(cc < 1)
 490:	83 c4 10             	add    $0x10,%esp
 493:	85 c0                	test   %eax,%eax
 495:	7e 1c                	jle    4b3 <gets+0x53>
      break;
    buf[i++] = c;
 497:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 49b:	83 c7 01             	add    $0x1,%edi
 49e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 4a1:	3c 0a                	cmp    $0xa,%al
 4a3:	74 23                	je     4c8 <gets+0x68>
 4a5:	3c 0d                	cmp    $0xd,%al
 4a7:	74 1f                	je     4c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	89 fe                	mov    %edi,%esi
 4ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4b1:	7c cd                	jl     480 <gets+0x20>
 4b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c7:	90                   	nop
 4c8:	8b 75 08             	mov    0x8(%ebp),%esi
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	01 de                	add    %ebx,%esi
 4d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 4d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d8:	5b                   	pop    %ebx
 4d9:	5e                   	pop    %esi
 4da:	5f                   	pop    %edi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret    
 4dd:	8d 76 00             	lea    0x0(%esi),%esi

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	56                   	push   %esi
 4e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	6a 00                	push   $0x0
 4ee:	ff 75 08             	pushl  0x8(%ebp)
 4f1:	e8 37 03 00 00       	call   82d <open>
  if(fd < 0)
 4f6:	83 c4 10             	add    $0x10,%esp
 4f9:	85 c0                	test   %eax,%eax
 4fb:	78 2b                	js     528 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 4fd:	83 ec 08             	sub    $0x8,%esp
 500:	ff 75 0c             	pushl  0xc(%ebp)
 503:	89 c3                	mov    %eax,%ebx
 505:	50                   	push   %eax
 506:	e8 3a 03 00 00       	call   845 <fstat>
  close(fd);
 50b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50e:	89 c6                	mov    %eax,%esi
  close(fd);
 510:	e8 00 03 00 00       	call   815 <close>
  return r;
 515:	83 c4 10             	add    $0x10,%esp
}
 518:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51b:	89 f0                	mov    %esi,%eax
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 528:	be ff ff ff ff       	mov    $0xffffffff,%esi
 52d:	eb e9                	jmp    518 <stat+0x38>
 52f:	90                   	nop

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	f3 0f 1e fb          	endbr32 
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	53                   	push   %ebx
 538:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 53b:	0f be 02             	movsbl (%edx),%eax
 53e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 541:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 544:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 549:	77 1a                	ja     565 <atoi+0x35>
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
    n = n*10 + *s++ - '0';
 550:	83 c2 01             	add    $0x1,%edx
 553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 55a:	0f be 02             	movsbl (%edx),%eax
 55d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	89 c8                	mov    %ecx,%eax
 567:	5b                   	pop    %ebx
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    
 56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	57                   	push   %edi
 578:	8b 45 10             	mov    0x10(%ebp),%eax
 57b:	8b 55 08             	mov    0x8(%ebp),%edx
 57e:	56                   	push   %esi
 57f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 582:	85 c0                	test   %eax,%eax
 584:	7e 0f                	jle    595 <memmove+0x25>
 586:	01 d0                	add    %edx,%eax
  dst = vdst;
 588:	89 d7                	mov    %edx,%edi
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 591:	39 f8                	cmp    %edi,%eax
 593:	75 fb                	jne    590 <memmove+0x20>
  return vdst;
}
 595:	5e                   	pop    %esi
 596:	89 d0                	mov    %edx,%eax
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <thread_join>:
void* stack;
stack =malloc(4096);  //pgsize
return clone(start_routine,arg1,arg2,stack);
}
int thread_join()
{
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 5aa:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5ad:	50                   	push   %eax
 5ae:	e8 f2 02 00 00       	call   8a5 <join>
  
  return x;
}
 5b3:	c9                   	leave  
 5b4:	c3                   	ret    
 5b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005c0 <lock_init>:

void lock_init(struct lock_t *lk){
 5c0:	f3 0f 1e fb          	endbr32 
 5c4:	55                   	push   %ebp
 5c5:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 5c7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5d0:	5d                   	pop    %ebp
 5d1:	c3                   	ret    
 5d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005e0 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 5e0:	f3 0f 1e fb          	endbr32 
 5e4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5e5:	b9 01 00 00 00       	mov    $0x1,%ecx
 5ea:	89 e5                	mov    %esp,%ebp
 5ec:	8b 55 08             	mov    0x8(%ebp),%edx
 5ef:	90                   	nop
 5f0:	89 c8                	mov    %ecx,%eax
 5f2:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 5f5:	85 c0                	test   %eax,%eax
 5f7:	75 f7                	jne    5f0 <lock_acquire+0x10>
}
 5f9:	5d                   	pop    %ebp
 5fa:	c3                   	ret    
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <lock_release>:
void lock_release(struct lock_t *lk){
 600:	f3 0f 1e fb          	endbr32 
 604:	55                   	push   %ebp
 605:	31 c0                	xor    %eax,%eax
 607:	89 e5                	mov    %esp,%ebp
 609:	8b 55 08             	mov    0x8(%ebp),%edx
 60c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 60f:	5d                   	pop    %ebp
 610:	c3                   	ret    
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	f3 0f 1e fb          	endbr32 
 624:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 625:	a1 54 0f 00 00       	mov    0xf54,%eax
{
 62a:	89 e5                	mov    %esp,%ebp
 62c:	57                   	push   %edi
 62d:	56                   	push   %esi
 62e:	53                   	push   %ebx
 62f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 632:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 634:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 637:	39 c8                	cmp    %ecx,%eax
 639:	73 15                	jae    650 <free+0x30>
 63b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
 640:	39 d1                	cmp    %edx,%ecx
 642:	72 14                	jb     658 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	39 d0                	cmp    %edx,%eax
 646:	73 10                	jae    658 <free+0x38>
{
 648:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64a:	8b 10                	mov    (%eax),%edx
 64c:	39 c8                	cmp    %ecx,%eax
 64e:	72 f0                	jb     640 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 650:	39 d0                	cmp    %edx,%eax
 652:	72 f4                	jb     648 <free+0x28>
 654:	39 d1                	cmp    %edx,%ecx
 656:	73 f0                	jae    648 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 658:	8b 73 fc             	mov    -0x4(%ebx),%esi
 65b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65e:	39 fa                	cmp    %edi,%edx
 660:	74 1e                	je     680 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 662:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 665:	8b 50 04             	mov    0x4(%eax),%edx
 668:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 66b:	39 f1                	cmp    %esi,%ecx
 66d:	74 28                	je     697 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 66f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 671:	5b                   	pop    %ebx
  freep = p;
 672:	a3 54 0f 00 00       	mov    %eax,0xf54
}
 677:	5e                   	pop    %esi
 678:	5f                   	pop    %edi
 679:	5d                   	pop    %ebp
 67a:	c3                   	ret    
 67b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 680:	03 72 04             	add    0x4(%edx),%esi
 683:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 686:	8b 10                	mov    (%eax),%edx
 688:	8b 12                	mov    (%edx),%edx
 68a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 68d:	8b 50 04             	mov    0x4(%eax),%edx
 690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 693:	39 f1                	cmp    %esi,%ecx
 695:	75 d8                	jne    66f <free+0x4f>
    p->s.size += bp->s.size;
 697:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 69a:	a3 54 0f 00 00       	mov    %eax,0xf54
    p->s.size += bp->s.size;
 69f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a5:	89 10                	mov    %edx,(%eax)
}
 6a7:	5b                   	pop    %ebx
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	57                   	push   %edi
 6b8:	56                   	push   %esi
 6b9:	53                   	push   %ebx
 6ba:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6c0:	8b 3d 54 0f 00 00    	mov    0xf54,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c6:	8d 70 07             	lea    0x7(%eax),%esi
 6c9:	c1 ee 03             	shr    $0x3,%esi
 6cc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6cf:	85 ff                	test   %edi,%edi
 6d1:	0f 84 a9 00 00 00    	je     780 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 6d9:	8b 48 04             	mov    0x4(%eax),%ecx
 6dc:	39 f1                	cmp    %esi,%ecx
 6de:	73 6d                	jae    74d <malloc+0x9d>
 6e0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 6e6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6eb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 6ee:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 6f5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 6f8:	eb 17                	jmp    711 <malloc+0x61>
 6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 700:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 702:	8b 4a 04             	mov    0x4(%edx),%ecx
 705:	39 f1                	cmp    %esi,%ecx
 707:	73 4f                	jae    758 <malloc+0xa8>
 709:	8b 3d 54 0f 00 00    	mov    0xf54,%edi
 70f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 711:	39 c7                	cmp    %eax,%edi
 713:	75 eb                	jne    700 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 715:	83 ec 0c             	sub    $0xc,%esp
 718:	ff 75 e4             	pushl  -0x1c(%ebp)
 71b:	e8 65 01 00 00       	call   885 <sbrk>
  if(p == (char*)-1)
 720:	83 c4 10             	add    $0x10,%esp
 723:	83 f8 ff             	cmp    $0xffffffff,%eax
 726:	74 1b                	je     743 <malloc+0x93>
  hp->s.size = nu;
 728:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 72b:	83 ec 0c             	sub    $0xc,%esp
 72e:	83 c0 08             	add    $0x8,%eax
 731:	50                   	push   %eax
 732:	e8 e9 fe ff ff       	call   620 <free>
  return freep;
 737:	a1 54 0f 00 00       	mov    0xf54,%eax
      if((p = morecore(nunits)) == 0)
 73c:	83 c4 10             	add    $0x10,%esp
 73f:	85 c0                	test   %eax,%eax
 741:	75 bd                	jne    700 <malloc+0x50>
        return 0;
  }
}
 743:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 746:	31 c0                	xor    %eax,%eax
}
 748:	5b                   	pop    %ebx
 749:	5e                   	pop    %esi
 74a:	5f                   	pop    %edi
 74b:	5d                   	pop    %ebp
 74c:	c3                   	ret    
    if(p->s.size >= nunits){
 74d:	89 c2                	mov    %eax,%edx
 74f:	89 f8                	mov    %edi,%eax
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 758:	39 ce                	cmp    %ecx,%esi
 75a:	74 54                	je     7b0 <malloc+0x100>
        p->s.size -= nunits;
 75c:	29 f1                	sub    %esi,%ecx
 75e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 761:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 764:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 767:	a3 54 0f 00 00       	mov    %eax,0xf54
}
 76c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 76f:	8d 42 08             	lea    0x8(%edx),%eax
}
 772:	5b                   	pop    %ebx
 773:	5e                   	pop    %esi
 774:	5f                   	pop    %edi
 775:	5d                   	pop    %ebp
 776:	c3                   	ret    
 777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 780:	c7 05 54 0f 00 00 58 	movl   $0xf58,0xf54
 787:	0f 00 00 
    base.s.size = 0;
 78a:	bf 58 0f 00 00       	mov    $0xf58,%edi
    base.s.ptr = freep = prevp = &base;
 78f:	c7 05 58 0f 00 00 58 	movl   $0xf58,0xf58
 796:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 799:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 79b:	c7 05 5c 0f 00 00 00 	movl   $0x0,0xf5c
 7a2:	00 00 00 
    if(p->s.size >= nunits){
 7a5:	e9 36 ff ff ff       	jmp    6e0 <malloc+0x30>
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7b0:	8b 0a                	mov    (%edx),%ecx
 7b2:	89 08                	mov    %ecx,(%eax)
 7b4:	eb b1                	jmp    767 <malloc+0xb7>
 7b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bd:	8d 76 00             	lea    0x0(%esi),%esi

000007c0 <thread_create>:
{
 7c0:	f3 0f 1e fb          	endbr32 
 7c4:	55                   	push   %ebp
 7c5:	89 e5                	mov    %esp,%ebp
 7c7:	83 ec 14             	sub    $0x14,%esp
stack =malloc(4096);  //pgsize
 7ca:	68 00 10 00 00       	push   $0x1000
 7cf:	e8 dc fe ff ff       	call   6b0 <malloc>
return clone(start_routine,arg1,arg2,stack);
 7d4:	50                   	push   %eax
 7d5:	ff 75 10             	pushl  0x10(%ebp)
 7d8:	ff 75 0c             	pushl  0xc(%ebp)
 7db:	ff 75 08             	pushl  0x8(%ebp)
 7de:	e8 ba 00 00 00       	call   89d <clone>
}
 7e3:	c9                   	leave  
 7e4:	c3                   	ret    

000007e5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7e5:	b8 01 00 00 00       	mov    $0x1,%eax
 7ea:	cd 40                	int    $0x40
 7ec:	c3                   	ret    

000007ed <exit>:
SYSCALL(exit)
 7ed:	b8 02 00 00 00       	mov    $0x2,%eax
 7f2:	cd 40                	int    $0x40
 7f4:	c3                   	ret    

000007f5 <wait>:
SYSCALL(wait)
 7f5:	b8 03 00 00 00       	mov    $0x3,%eax
 7fa:	cd 40                	int    $0x40
 7fc:	c3                   	ret    

000007fd <pipe>:
SYSCALL(pipe)
 7fd:	b8 04 00 00 00       	mov    $0x4,%eax
 802:	cd 40                	int    $0x40
 804:	c3                   	ret    

00000805 <read>:
SYSCALL(read)
 805:	b8 05 00 00 00       	mov    $0x5,%eax
 80a:	cd 40                	int    $0x40
 80c:	c3                   	ret    

0000080d <write>:
SYSCALL(write)
 80d:	b8 10 00 00 00       	mov    $0x10,%eax
 812:	cd 40                	int    $0x40
 814:	c3                   	ret    

00000815 <close>:
SYSCALL(close)
 815:	b8 15 00 00 00       	mov    $0x15,%eax
 81a:	cd 40                	int    $0x40
 81c:	c3                   	ret    

0000081d <kill>:
SYSCALL(kill)
 81d:	b8 06 00 00 00       	mov    $0x6,%eax
 822:	cd 40                	int    $0x40
 824:	c3                   	ret    

00000825 <exec>:
SYSCALL(exec)
 825:	b8 07 00 00 00       	mov    $0x7,%eax
 82a:	cd 40                	int    $0x40
 82c:	c3                   	ret    

0000082d <open>:
SYSCALL(open)
 82d:	b8 0f 00 00 00       	mov    $0xf,%eax
 832:	cd 40                	int    $0x40
 834:	c3                   	ret    

00000835 <mknod>:
SYSCALL(mknod)
 835:	b8 11 00 00 00       	mov    $0x11,%eax
 83a:	cd 40                	int    $0x40
 83c:	c3                   	ret    

0000083d <unlink>:
SYSCALL(unlink)
 83d:	b8 12 00 00 00       	mov    $0x12,%eax
 842:	cd 40                	int    $0x40
 844:	c3                   	ret    

00000845 <fstat>:
SYSCALL(fstat)
 845:	b8 08 00 00 00       	mov    $0x8,%eax
 84a:	cd 40                	int    $0x40
 84c:	c3                   	ret    

0000084d <link>:
SYSCALL(link)
 84d:	b8 13 00 00 00       	mov    $0x13,%eax
 852:	cd 40                	int    $0x40
 854:	c3                   	ret    

00000855 <mkdir>:
SYSCALL(mkdir)
 855:	b8 14 00 00 00       	mov    $0x14,%eax
 85a:	cd 40                	int    $0x40
 85c:	c3                   	ret    

0000085d <chdir>:
SYSCALL(chdir)
 85d:	b8 09 00 00 00       	mov    $0x9,%eax
 862:	cd 40                	int    $0x40
 864:	c3                   	ret    

00000865 <dup>:
SYSCALL(dup)
 865:	b8 0a 00 00 00       	mov    $0xa,%eax
 86a:	cd 40                	int    $0x40
 86c:	c3                   	ret    

0000086d <getpid>:
SYSCALL(getpid)
 86d:	b8 0b 00 00 00       	mov    $0xb,%eax
 872:	cd 40                	int    $0x40
 874:	c3                   	ret    

00000875 <getyear>:
SYSCALL(getyear)
 875:	b8 16 00 00 00       	mov    $0x16,%eax
 87a:	cd 40                	int    $0x40
 87c:	c3                   	ret    

0000087d <getreadcount>:
SYSCALL(getreadcount)
 87d:	b8 17 00 00 00       	mov    $0x17,%eax
 882:	cd 40                	int    $0x40
 884:	c3                   	ret    

00000885 <sbrk>:
SYSCALL(sbrk)
 885:	b8 0c 00 00 00       	mov    $0xc,%eax
 88a:	cd 40                	int    $0x40
 88c:	c3                   	ret    

0000088d <sleep>:
SYSCALL(sleep)
 88d:	b8 0d 00 00 00       	mov    $0xd,%eax
 892:	cd 40                	int    $0x40
 894:	c3                   	ret    

00000895 <uptime>:
SYSCALL(uptime)
 895:	b8 0e 00 00 00       	mov    $0xe,%eax
 89a:	cd 40                	int    $0x40
 89c:	c3                   	ret    

0000089d <clone>:
SYSCALL(clone)
 89d:	b8 18 00 00 00       	mov    $0x18,%eax
 8a2:	cd 40                	int    $0x40
 8a4:	c3                   	ret    

000008a5 <join>:
SYSCALL(join)
 8a5:	b8 19 00 00 00       	mov    $0x19,%eax
 8aa:	cd 40                	int    $0x40
 8ac:	c3                   	ret    
 8ad:	66 90                	xchg   %ax,%ax
 8af:	90                   	nop

000008b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	57                   	push   %edi
 8b4:	56                   	push   %esi
 8b5:	53                   	push   %ebx
 8b6:	83 ec 3c             	sub    $0x3c,%esp
 8b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 8bc:	89 d1                	mov    %edx,%ecx
{
 8be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 8c1:	85 d2                	test   %edx,%edx
 8c3:	0f 89 7f 00 00 00    	jns    948 <printint+0x98>
 8c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 8cd:	74 79                	je     948 <printint+0x98>
    neg = 1;
 8cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 8d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 8d8:	31 db                	xor    %ebx,%ebx
 8da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 8dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 8e0:	89 c8                	mov    %ecx,%eax
 8e2:	31 d2                	xor    %edx,%edx
 8e4:	89 cf                	mov    %ecx,%edi
 8e6:	f7 75 c4             	divl   -0x3c(%ebp)
 8e9:	0f b6 92 7c 0b 00 00 	movzbl 0xb7c(%edx),%edx
 8f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8f3:	89 d8                	mov    %ebx,%eax
 8f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 901:	76 dd                	jbe    8e0 <printint+0x30>
  if(neg)
 903:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 906:	85 c9                	test   %ecx,%ecx
 908:	74 0c                	je     916 <printint+0x66>
    buf[i++] = '-';
 90a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 90f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 911:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 916:	8b 7d b8             	mov    -0x48(%ebp),%edi
 919:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 91d:	eb 07                	jmp    926 <printint+0x76>
 91f:	90                   	nop
 920:	0f b6 13             	movzbl (%ebx),%edx
 923:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 926:	83 ec 04             	sub    $0x4,%esp
 929:	88 55 d7             	mov    %dl,-0x29(%ebp)
 92c:	6a 01                	push   $0x1
 92e:	56                   	push   %esi
 92f:	57                   	push   %edi
 930:	e8 d8 fe ff ff       	call   80d <write>
  while(--i >= 0)
 935:	83 c4 10             	add    $0x10,%esp
 938:	39 de                	cmp    %ebx,%esi
 93a:	75 e4                	jne    920 <printint+0x70>
    putc(fd, buf[i]);
}
 93c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 93f:	5b                   	pop    %ebx
 940:	5e                   	pop    %esi
 941:	5f                   	pop    %edi
 942:	5d                   	pop    %ebp
 943:	c3                   	ret    
 944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 948:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 94f:	eb 87                	jmp    8d8 <printint+0x28>
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 958:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 95f:	90                   	nop

00000960 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 960:	f3 0f 1e fb          	endbr32 
 964:	55                   	push   %ebp
 965:	89 e5                	mov    %esp,%ebp
 967:	57                   	push   %edi
 968:	56                   	push   %esi
 969:	53                   	push   %ebx
 96a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 96d:	8b 75 0c             	mov    0xc(%ebp),%esi
 970:	0f b6 1e             	movzbl (%esi),%ebx
 973:	84 db                	test   %bl,%bl
 975:	0f 84 b4 00 00 00    	je     a2f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 97b:	8d 45 10             	lea    0x10(%ebp),%eax
 97e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 981:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 984:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 986:	89 45 d0             	mov    %eax,-0x30(%ebp)
 989:	eb 33                	jmp    9be <printf+0x5e>
 98b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 98f:	90                   	nop
 990:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 993:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 998:	83 f8 25             	cmp    $0x25,%eax
 99b:	74 17                	je     9b4 <printf+0x54>
  write(fd, &c, 1);
 99d:	83 ec 04             	sub    $0x4,%esp
 9a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 9a3:	6a 01                	push   $0x1
 9a5:	57                   	push   %edi
 9a6:	ff 75 08             	pushl  0x8(%ebp)
 9a9:	e8 5f fe ff ff       	call   80d <write>
 9ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 9b1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 9b4:	0f b6 1e             	movzbl (%esi),%ebx
 9b7:	83 c6 01             	add    $0x1,%esi
 9ba:	84 db                	test   %bl,%bl
 9bc:	74 71                	je     a2f <printf+0xcf>
    c = fmt[i] & 0xff;
 9be:	0f be cb             	movsbl %bl,%ecx
 9c1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 9c4:	85 d2                	test   %edx,%edx
 9c6:	74 c8                	je     990 <printf+0x30>
      }
    } else if(state == '%'){
 9c8:	83 fa 25             	cmp    $0x25,%edx
 9cb:	75 e7                	jne    9b4 <printf+0x54>
      if(c == 'd'){
 9cd:	83 f8 64             	cmp    $0x64,%eax
 9d0:	0f 84 9a 00 00 00    	je     a70 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9d6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9dc:	83 f9 70             	cmp    $0x70,%ecx
 9df:	74 5f                	je     a40 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9e1:	83 f8 73             	cmp    $0x73,%eax
 9e4:	0f 84 d6 00 00 00    	je     ac0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ea:	83 f8 63             	cmp    $0x63,%eax
 9ed:	0f 84 8d 00 00 00    	je     a80 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9f3:	83 f8 25             	cmp    $0x25,%eax
 9f6:	0f 84 b4 00 00 00    	je     ab0 <printf+0x150>
  write(fd, &c, 1);
 9fc:	83 ec 04             	sub    $0x4,%esp
 9ff:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a03:	6a 01                	push   $0x1
 a05:	57                   	push   %edi
 a06:	ff 75 08             	pushl  0x8(%ebp)
 a09:	e8 ff fd ff ff       	call   80d <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 a0e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 a11:	83 c4 0c             	add    $0xc,%esp
 a14:	6a 01                	push   $0x1
 a16:	83 c6 01             	add    $0x1,%esi
 a19:	57                   	push   %edi
 a1a:	ff 75 08             	pushl  0x8(%ebp)
 a1d:	e8 eb fd ff ff       	call   80d <write>
  for(i = 0; fmt[i]; i++){
 a22:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 a26:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a29:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 a2b:	84 db                	test   %bl,%bl
 a2d:	75 8f                	jne    9be <printf+0x5e>
    }
  }
}
 a2f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a32:	5b                   	pop    %ebx
 a33:	5e                   	pop    %esi
 a34:	5f                   	pop    %edi
 a35:	5d                   	pop    %ebp
 a36:	c3                   	ret    
 a37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a3e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 a40:	83 ec 0c             	sub    $0xc,%esp
 a43:	b9 10 00 00 00       	mov    $0x10,%ecx
 a48:	6a 00                	push   $0x0
 a4a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
 a50:	8b 13                	mov    (%ebx),%edx
 a52:	e8 59 fe ff ff       	call   8b0 <printint>
        ap++;
 a57:	89 d8                	mov    %ebx,%eax
 a59:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a5c:	31 d2                	xor    %edx,%edx
        ap++;
 a5e:	83 c0 04             	add    $0x4,%eax
 a61:	89 45 d0             	mov    %eax,-0x30(%ebp)
 a64:	e9 4b ff ff ff       	jmp    9b4 <printf+0x54>
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 a70:	83 ec 0c             	sub    $0xc,%esp
 a73:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a78:	6a 01                	push   $0x1
 a7a:	eb ce                	jmp    a4a <printf+0xea>
 a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 a80:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 a83:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a86:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 a88:	6a 01                	push   $0x1
        ap++;
 a8a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 a8d:	57                   	push   %edi
 a8e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 a91:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a94:	e8 74 fd ff ff       	call   80d <write>
        ap++;
 a99:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a9c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a9f:	31 d2                	xor    %edx,%edx
 aa1:	e9 0e ff ff ff       	jmp    9b4 <printf+0x54>
 aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aad:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 ab0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 ab3:	83 ec 04             	sub    $0x4,%esp
 ab6:	e9 59 ff ff ff       	jmp    a14 <printf+0xb4>
 abb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 abf:	90                   	nop
        s = (char*)*ap;
 ac0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 ac3:	8b 18                	mov    (%eax),%ebx
        ap++;
 ac5:	83 c0 04             	add    $0x4,%eax
 ac8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 acb:	85 db                	test   %ebx,%ebx
 acd:	74 17                	je     ae6 <printf+0x186>
        while(*s != 0){
 acf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 ad2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 ad4:	84 c0                	test   %al,%al
 ad6:	0f 84 d8 fe ff ff    	je     9b4 <printf+0x54>
 adc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 adf:	89 de                	mov    %ebx,%esi
 ae1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ae4:	eb 1a                	jmp    b00 <printf+0x1a0>
          s = "(null)";
 ae6:	bb 72 0b 00 00       	mov    $0xb72,%ebx
        while(*s != 0){
 aeb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 aee:	b8 28 00 00 00       	mov    $0x28,%eax
 af3:	89 de                	mov    %ebx,%esi
 af5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 af8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aff:	90                   	nop
  write(fd, &c, 1);
 b00:	83 ec 04             	sub    $0x4,%esp
          s++;
 b03:	83 c6 01             	add    $0x1,%esi
 b06:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b09:	6a 01                	push   $0x1
 b0b:	57                   	push   %edi
 b0c:	53                   	push   %ebx
 b0d:	e8 fb fc ff ff       	call   80d <write>
        while(*s != 0){
 b12:	0f b6 06             	movzbl (%esi),%eax
 b15:	83 c4 10             	add    $0x10,%esp
 b18:	84 c0                	test   %al,%al
 b1a:	75 e4                	jne    b00 <printf+0x1a0>
 b1c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 b1f:	31 d2                	xor    %edx,%edx
 b21:	e9 8e fe ff ff       	jmp    9b4 <printf+0x54>
