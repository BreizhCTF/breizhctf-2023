#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

int main(int argc, char ** const argv) {
    setreuid(geteuid(), geteuid());

    printf("Running breizhjack as administrator ...\n");

    char buffer[100] = "x86_64 --addr-no-randomize /challenge/breizhjack/breizhjack ";

    if (argc == 3 && strlen(argv[1]) == 7 && strlen(argv[2]) <= 4) {
        int width = atoi(argv[2]);

        if (strncmp(argv[1], "--width", 7) == 0) {
            strncat(buffer, argv[1], 7);
            strcat(buffer, " ");
            strncat(buffer, argv[2], strlen(argv[2]));

        }
    }
    strcat(buffer, " 2>&1");

    printf("%s\n", buffer);
    
    int code = system(buffer);

    if (code != 0) {
        printf("Exit code %d\n", code);
    }

	return 0;
}
