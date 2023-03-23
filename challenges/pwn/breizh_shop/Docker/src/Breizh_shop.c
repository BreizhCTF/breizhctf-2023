#include <stdio.h>
#include <stdlib.h>

void getFlag() {
  char flag[50];
  FILE* f = fopen("flag.txt", "r");
  if (f == NULL) {
    puts("Fichier flag introuvable, contactez un administrateur");
  }
  else {
    fread(flag, 1, 50, f);
    flag[37] = '\00';
    fclose(f);
    puts(flag);
  }
}

void display_banner() {
  puts("                                                                                ");
  puts("██████╗ ██████╗ ███████╗██╗███████╗██╗  ██╗    ███████╗██╗  ██╗ ██████╗ ██████╗ ");
  puts("██╔══██╗██╔══██╗██╔════╝██║╚══███╔╝██║  ██║    ██╔════╝██║  ██║██╔═══██╗██╔══██╗");
  puts("██████╔╝██████╔╝█████╗  ██║  ███╔╝ ███████║    ███████╗███████║██║   ██║██████╔╝");
  puts("██╔══██╗██╔══██╗██╔══╝  ██║ ███╔╝  ██╔══██║    ╚════██║██╔══██║██║   ██║██╔═══╝ ");
  puts("██████╔╝██║  ██║███████╗██║███████╗██║  ██║    ███████║██║  ██║╚██████╔╝██║     ");
  puts("╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ");
  puts("                                                                                ");
}

void display_menu() {
  puts(".---------------------------------.");
  puts("| 1) Acheter des articles         |");
  puts("| 2) Consulter votre compte       |");
  puts("| 3) Quitter                      |");
  puts(".---------------------------------.");
  printf("> ");
}

void display_articles() {
  puts(".---------------------------------------------------.");
  puts("| 1) License IDA Pro                         299.99B|");
  puts("| 2) Place de spectateur à Bruzzz Quiz        99.99B|");
  puts("| 3) Compte Fwitter blue                      49.99B|");
  puts("| 4) Place de contributeur Breizh OS         499.99B|");
  puts("| 5) Partie de Guitar Hero contre Kaluche     19.99B|");
  puts("| 6) Cours de japonais                        89.99B|");
  puts("| 7) Cours de résolution de Mastermind        49.99B|");
  puts("| 8) Plus de chall de crypto                 299.99B|");
  puts("| 9) Flag                                   1337.42B|");
  puts(".---------------------------------------------------.");
  printf("> ");
}

int main() {
  display_banner();
  float balance = 100.0;
  char article = 0;
  char choice = 0;
  int quantity = 0;
  char nl = 0;
  while (1) {
    setvbuf(stdin,NULL,_IONBF,0);
    setvbuf(stdout,NULL,_IONBF,0);
    display_menu();
    choice = getc(stdin);
    nl = getc(stdin);
    if (nl != '\n') {
      exit(1);
    }

    switch (choice) {
      case '1':
        display_articles();
        article = getc(stdin);
        nl = getc(stdin);
        if (nl != '\n') {
          exit(1);
        }
        printf("Quelle quantité en voulez-vous : ");
        scanf("%d", &quantity);
        switch(article) {
          case '1':
            if (balance < (299.99 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (299.99 * quantity);
              puts("Promis, la license n'est pas tombée du camion ;)");
            }
          break;

          case '2':
            if (balance < (99.99 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (99.99 * quantity);
              puts("J'ai entendu dire que le présentateur de l'émission était très charismatique");
            }
          break;

          case '3':
            if (balance < (49.99 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (49.99 * quantity);
              puts("Pour que les gens importants vous remarquent vous like");
            }
          break;

          case '4':
            if (balance < (499.99 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (499.99 * quantity);
              puts("Ce sera une expérience qui vous fera monter en compétences");
            }
          break;

          case '5':
            if (balance < (19.99 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (19.99 * quantity);
              puts("Clairement la partie la plus cool de la nuit :D");
            }
          break;

          case '6':
            if (balance < (89.99 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (89.99 * quantity);
              puts("Pas très Breizh, mais ça vous servira peut-être ;)");
            }
          break;

          case '7':
            if (balance < (49.99 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (49.99 * quantity);
              puts("Vous gagnerez à tous les coups maintenant :D");
            }
          break;

          case '8':
            if (balance < (299.99 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (299.99 * quantity);
              puts("On a jamais assez de challs de crypto");
            }
          break;

          case '9':
            if (balance < (1337.42 * quantity)) {
              puts("Vous n'avez pas assez de BreizhCoins pour cet achat");
            }
            else {
              balance = balance - (1337.42 * quantity);
              getFlag();
            }
          break;

        }
        break;

      case '2':
        printf("Votre compte contient actuellement %.2fB\n", balance);
        break;

      case '3':
        puts("A bientôt pour de nouveaux achats");
        exit(0);
    }
  }
  return 0;
}
