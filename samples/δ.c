#include <time.h>
#include <stdio.h>
int main(){unsigned long i=0;time_t t1, t2;while(time(&t1)==time(&t2))printf("%ld\r",++i);printf("\n%ld¤%ld\n",t1,t2);return 43;}