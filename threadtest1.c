#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#define NULL (void *)(0)
struct lock_t *L;
void print(){
printf(1,"====Threads======\n");
exit();
}

int
main(int argc, char *argv[])
{

  lock_init(L);
  printf(1, "----------------\n");
  lock_acquire(L);
  thread_create(&print, NULL,NULL);
  lock_release(L);
  thread_join();
  
  printf(1, "EXITING  \n");
  exit();

}
