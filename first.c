#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#define NULL (void *)(0)

void f(void* x,void *y){
printf(1,"I'm a thread \n");
printf(1,"X = %d \nY = %d \n",*(int*)x,*(int*)y);
if(getpid()>0)printf(1,"iam parenttttt\n");
 else if(getpid()==0)printf(1,"Iam a childddd\n");
exit();
}

void f1(){
int x=3,y=4;
printf(1,"======threads=====\n");
thread_create(&f,&x,&y);

printf(1,"FIRST CHILD PID %d \n",thread_join());
exit();
}

int
main(int argc, char *argv[])
{
  
  printf(1, "RUNNING..\n");
  int pid =thread_create(&f1, NULL, NULL);
  if(pid>0)printf(1,"iam parent\n");
 else if(pid==0)printf(1,"Iam a child\n");
  
  printf(1,"SECOND CHILD PID IS %d \n",thread_join());

  printf(1, "FINISHING .\n");
  exit();

}
