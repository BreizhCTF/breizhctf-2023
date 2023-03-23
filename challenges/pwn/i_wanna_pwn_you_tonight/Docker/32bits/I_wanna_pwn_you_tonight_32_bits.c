#include <stdio.h>
#include <stdlib.h>

void display_banner() {
  puts(" __     ____    __    ____  ___      .__   __. .__   __.      ___         .______   ____    __    ____ .__   __.    ____    ____  ______    __    __     .___________.  ______   .__   __.  __    _______  __    __  .___________.");
  puts("|  |    \\   \\  /  \\  /   / /   \\     |  \\ |  | |  \\ |  |     /   \\        |   _  \\  \\   \\  /  \\  /   / |  \\ |  |    \\   \\  /   / /  __  \\  |  |  |  |    |           | /  __  \\  |  \\ |  | |  |  /  _____||  |  |  | |           |");
  puts("|  |     \\   \\/    \\/   / /  ^  \\    |   \\|  | |   \\|  |    /  ^  \\       |  |_)  |  \\   \\/    \\/   /  |   \\|  |     \\   \\/   / |  |  |  | |  |  |  |    `---|  |----`|  |  |  | |   \\|  | |  | |  |  __  |  |__|  | `---|  |----`");
  puts("|  |      \\            / /  /_\\  \\   |  . `  | |  . `  |   /  /_\\  \\      |   ___/    \\            /   |  . `  |      \\_    _/  |  |  |  | |  |  |  |        |  |     |  |  |  | |  . `  | |  | |  | |_ | |   __   |     |  |     ");
  puts("|  |       \\    /\\    / /  _____  \\  |  |\\   | |  |\\   |  /  _____  \\     |  |         \\    /\\    /    |  |\\   |        |  |    |  `--'  | |  `--'  |        |  |     |  `--'  | |  |\\   | |  | |  |__| | |  |  |  |     |  |     ");
  puts("|__|        \\__/  \\__/ /__/     \\__\\ |__| \\__| |__| \\__| /__/     \\__\\    | _|          \\__/  \\__/     |__| \\__|        |__|     \\______/   \\______/         |__|      \\______/  |__| \\__| |__|  \\______| |__|  |__|     |__|     ");
  puts("                                                                                                                                                                                                                                  ");
}

void pwned(int arg) {
  printf("\n");
  if (arg == 0xdeadbeef) {
    char flag[50];
    FILE* f = fopen("flag.txt", "r");
    if (f == NULL) {
      printf("Fichier flag introuvable, contactez un administrateur");
    }
    else {
      fread(flag, 1, 50, f);
      flag[34] = '\00';
      fclose(f);
      if (arg != 0xdeadbeef) {
        puts("Oh allez, faites le de manière legit ;)");
        exit(0);
      }
      puts(flag);
      exit(0);
    }
  }
}

void vuln() {
  char buf[32];
  puts("I wanna pwn you tonight");
  printf("Do you ? ");
  scanf("%s", &buf);
  return;
}

int main() {
  setvbuf(stdin,NULL,_IONBF,0);
  setvbuf(stdout,NULL,_IONBF,0);
  puts("32-bits");
  display_banner();
  vuln();
  puts("Pas de pwn, pas de flag !");
  puts("Shame");
  return 0;
}
