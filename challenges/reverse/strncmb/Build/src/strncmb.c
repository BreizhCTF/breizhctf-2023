#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char *nope_pas_assez = "Nope pas assez de strnCMB\n";
    if(argc != 2) {
        printf("Usage ./strncmb FLAG\n");
        return 1;
    } 

    if(strlen(argv[1]) != 26) {
        printf("%s", nope_pas_assez);
        return 1;
    }

    if(!strncmp(argv[1], "BZHCTF{", 7)) {
        printf("1 strnCMB validé\n");
        if(!strncmp(argv[1] + 7, "C0mB13n", 7)) {
            printf("2 strnCMB validés\n");
            if(!strncmp(argv[1] + 14, "_dE_", 4)) {
                printf("3 strnCMB validés\n");
                if(!strncmp(argv[1] + 18, "strnCMB}", 8)) {
                    printf("Tellement de strnCMB, vous avez le flag %s\n", argv[1]);
                    return 0;
                }
            }
        }
    }
    printf("%s", nope_pas_assez);
    return 1;
}
