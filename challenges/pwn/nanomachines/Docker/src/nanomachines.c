#include <stdio.h>
#include <stdio_ext.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

typedef struct combo {
  char moves[256];
  int saved;
}combo;


void display_banner() {
  puts("\n\n\n");
  puts("----    ----    ------    ----    ----   --------     ********      ------    ------------ ----    ---- --------  ----    ---- ------------ ------------ ");
  puts("*****   ****   ********   *****   ****  **********   ----------    ********   ************ ****    **** ********  *****   **** ************ ************");
  puts("------  ----  ----------  ------  ---- ----    ---- ************  ----------  ---          ----    ----   ----    ------  ---- ----         ----        ");
  puts("************ ****    **** ************ ***      *** ---  --  --- ****    **** ***          ************   ****    ************ ************ ************ ");
  puts("------------ ------------ ------------ ---      --- ***  **  *** ------------ ---          ------------   ----    ------------ ------------ ------------ ");
  puts("****  ****** ************ ****  ****** ****    **** ---  --  --- ************ ***          ****    ****   ****    ****  ****** ****                *****");
  puts("----   ----- ----    ---- ----   -----  ----------  ***  **  *** ----    ---- ------------ ----    ---- --------  ----   ----- ------------ ------------");
  puts("****    **** ****    **** ****    ****   ********   ---      --- ****    **** ************ ****    **** ********  ****    **** ************ ************");
  __asm__("pop %rbp; push %rdi; pop %rdi; ret"); // Oui c'est une backdoor, si vous avez une meiilleure idée je suis preneur
}

void display_menu() {
  puts("\n\n\n");
  puts("1. Preparer un combo");
  puts("2. Exécuter un combo");
  puts("3. Dire une phrase badass et/ou cheesy");
  printf("> ");
}

struct combo* copy_new_combo(struct combo* c, char buf[], int idx) {
  for(int i = idx; i < 256; i++) {
      c->moves[i] = buf[i];
  }
  return c;
}

struct combo* prepare_combo(struct combo* c) {
  if (c != NULL) {
    puts("\nCombo précédent effacé");
    free(c);
    c = NULL;
  }
  c = malloc(sizeof(struct combo));
  c->saved = 1;
  printf("\nC'est le moment de montrer de quoi vous êtes capable : ");
  read(0, c->moves, sizeof(c->moves));
  puts("Combo créé");
  return c;
}

struct combo* execute_combo(struct combo* c) {
  puts("\n***Standing here, I realize ...***");
  sleep(1);
  puts("\n1. Utiliser le combo préparé");
  puts("2. Improviser un nouveau combo");
  char buf1[5];
  char buf2[256];
  int idx;
  int len;
  char choice;
  char nl;
  choice = getc(stdin);
  nl = getc(stdin);
  if (choice == '1') {
    if (c == NULL) {
      puts("Aucun combo préparé");
      return c;
    }
    puts("Exécution du combo sauvegardé");
    for (int i = 0; i < 256; i++) {
      if (c->moves[i] <= 0x20 || c->moves[i] >= 0x7f) {
        len = i;
        break;
      }
      printf("Coup : %c\n", c->moves[i]);
    }
    puts("You can't hurt me Jack !");
    sleep(1);
    printf("Ce combo n'était pas très efficace, voulez-vous ajouter de nouveaux coups ? [oui/non] ");
    read(0, buf1, 4);
    buf1[4] = 0;
    if (strcmp(buf1, "oui\n") == 0) {
      for (int i = 0; i < 256; i++) {
        buf2[i] = c->moves[i];
      }
      for (;;) {
        printf("\nQuel est le numéro du coup que vous souhaitez modifier ? ");
        scanf("%d", &idx);
        if (idx < 256) {
          printf("\nEntrez le nouveau coup : ");
          read(0, buf1, 5);
          buf2[idx] = buf1[0];
        }
        else {
          puts("\nI could break the president in two with my BARE HANDS ! Don't fuck with THIS senator !");
          exit(1);
        }
        printf("\nContinuer les modifications ? [oui/non] ");
        read(0, buf1, 5);
        buf1[4] = 0;
        if (strcmp(buf1, "oui\n") != 0) {
          break;
        }
      }
      free(c);
      struct combo* c2;
      c2 = malloc(sizeof(struct combo));
      c2->saved = 1;
      c2 = copy_new_combo(c2, buf2, len);
      return c2;
    }
    return c;
  }
  else if (choice == '2') {
    struct combo* c2;
    c2 = malloc(sizeof(struct combo));
    c2->saved = 0;
    printf("\nWhy won't you DIE ? ");
    read(0, c2->moves, sizeof(c2->moves));
    for (int i = 0; i < 256; i++) {
      if (c2->moves[i] <= 0x20 || c2->moves[i] >= 0x7f) {
        break;
      }
      printf("Coup : %c\n", c2->moves[i]);
    }
    sleep(0.5);
    puts("\nNANOMACHINES SON !");
    sleep(1);
    printf("Voulez vous remplacer le combo enregistré par celui-ci ? [oui/non] ");
    read(0, buf1, 5);
    buf1[4] = 0;
    if (strcmp(buf1, "oui\n") == 0) {
      free(c);
      return c2;
    }
    else {
      free(c2);
      return c;
    }

  }
}

void badass() {
  char buf[64];
  printf("\nC'est le moment pour une réplique stylée : ");
  read(0, buf, sizeof(buf));
  puts("\nDon't fuck with this senator !");
  printf("%s", buf);
}


int main (int argc, char* argv[]) {
  setvbuf(stdin,NULL,_IONBF,0);
  setvbuf(stdout,NULL,_IONBF,0);
  struct combo* c = NULL;
  char choice = 0;
  char nl = 0;
  display_banner();
  for (;;) {
    display_menu();
    __fpurge(stdin);
    choice = getc(stdin);
    nl = getc(stdin);
    if (nl != '\n') {
      exit(1);
    }
    fseek(stdin,0,SEEK_END);

    switch(choice) {
      case '1':
        c = prepare_combo(c);
        break;

      case '2':
        c = execute_combo(c);
        break;

      case '3':
        badass();
        break;
    }
  }
  return 0;
}
