#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    time_t current_time = time(NULL);
    printf("The current time is: %ld\n", current_time);
    return EXIT_SUCCESS;
}