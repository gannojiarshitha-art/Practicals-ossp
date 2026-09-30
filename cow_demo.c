#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

#define SIZE (100 * 1024 * 1024)

int main(void)
{
    char *data;
    pid_t pid;

    /* Allocate 100 MB */
    data = malloc(SIZE);

    if (data == NULL)
    {
        perror("malloc");
        return 1;
    }

    /* Initialize memory */
    for (size_t i = 0; i < SIZE; i++)
    {
        data[i] = 1;
    }

    printf("Parent PID: %d\n", getpid());
    printf("Allocated and initialized 100 MB.\n");
    printf("Press Enter to continue to fork...\n");
    getchar();

    /* Create child process */
    pid = fork();

    if (pid < 0)
    {
        perror("fork");
        free(data);
        return 1;
    }

    if (pid == 0)
    {
        /* Child process */
        printf("\nChild PID: %d, Parent PID: %d\n",
               getpid(), getppid());

        printf("Child inherited the memory from parent.\n");
        printf("Press Enter to let child modify memory...\n");
        getchar();

        /* Modify one byte in each 4 KB page */
        for (size_t i = 0; i < SIZE; i += 4096)
        {
            data[i] = 2;
        }

        printf("Child modified one byte in each 4 KB page.\n");
        printf("Copy-on-Write should now have occurred.\n");

        printf("Press Enter to exit child...\n");
        getchar();

        free(data);
        return 0;
    }
    else
    {
        /* Parent process */
        printf("\nParent PID: %d, Child PID: %d\n",
               getpid(), pid);

        printf("Parent and child initially share physical pages.\n");
        printf("Press Enter to allow child to modify memory...\n");
        getchar();

        wait(NULL);

        printf("Child has terminated.\n");

        free(data);
    }

    return 0;
}
