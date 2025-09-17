#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    time_t a = time(NULL);
    printf("The current time is: %ld\n", a);
    return 0;
}
