#include "types.h"
#include "stat.h"
#include "user.h"
#define NULL (void*)(0)

void frsttst(){
printf(1,"I'm a thread");
}
void shahenda(){
thread_create(&frsttst,NULL,NULL);
exit();
}

int main(int argc , char *argv[]){

printf(1,"THE FIRST XV6 PROGRAM %d\n",getyear());
printf(1,"NEW YEAR \n");
printf(1, "countr systm call %d\n",getreadcount());
shahenda();

exit();


}
