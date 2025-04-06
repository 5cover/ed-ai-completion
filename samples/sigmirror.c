/// @brief Just a silly script I made to see if it would break my terminal. Or delete my home directory. Who knows?

#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <limits.h>

static void handle_sig(int sig, siginfo_t *info, void *)
{
    if (sig == SIGUSR1) _exit(0);
    if (-1 == kill(info->si_pid, sig)) _exit(errno);
}

int main()
{
    printf("pid %d\n", getpid());

    struct sigaction act = {
        .sa_flags = SA_SIGINFO,
        .sa_sigaction = handle_sig,
    };
    sigemptyset(&act.sa_mask);
    // To include real-time signals, replace upper bound by _NSIG.
    for (int i = 1; i < SIGRTMIN; ++i) {
        errno = 0;
        sigaction(i, &act, NULL); // Some will fail, that's normal. Not all signals can have handlers.
        // printf("signal %2d: %-25s: %s\n", i, strsignal(i), strerror(errno));
    }

    while (true) sleep(INT_MAX);
}