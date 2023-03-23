#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define BUFLEN 8

int mine_n = 25;
int X_n = 16*16;
char difficulty[BUFLEN];


void banner() {
  printf("\n###############################################\n");
  printf("####            Breizh demineur            ####\n");
  printf("###############################################\n\n");
}

void display_choice() {
  printf("\n1> Examiner une case\n");
  printf("2> Placer un drapeau sur une case\n");
  printf("3> Quitter \n");
  printf(">> ");
}

void screen(char d[][16], char* v, char* h, char* n) {
  printf(difficulty);
  printf("\n      ");
  for (int i = 0 ; i < 19 ; i++) {
    printf(" %c", h[i]);
  }

  printf("\n          ");
  for (int i = 0 ; i < 16 ; i++) {
    printf(" %c", n[i]);
  }

  printf("\n");
  for (int j = 0 ; j < 19; j++) {
    if (j >= 2 && j < 18) {
      printf("   %c %c     ", v[j], n[j-2]);

      for (int k = 0 ; k < 16 ; k++) {
        printf("%c ", d[j-2][k]);
      }
      printf("\n");

    }
    else {
      printf("   %c\n", v[j]);
    }

  }

}

char check_around(char d[][16], char p[][16], int x, int y) {
  if (p[x][y] == 'O') {
    return 1;
  }
  char count = 0;
  for (char xi = -1 ; xi <= 1; xi++) {
    for (char yi = -1 ; yi <= 1; yi++) {
      if ((x+xi) >= 0 && (x+xi) <= 15 && (y+yi) >= 0 && (y+yi) <= 15) {
        if (p[x+xi][y+yi] == 'O') {
          count++;
        }
      }
    }
  }
  d[x][y] = count + 0x30;
  X_n -= 1;
  if (count == 0) {
    for (char xi = -1 ; xi <= 1; xi++) {
      for (char yi = -1 ; yi <= 1; yi++) {
        if ((x+xi) >= 0 && (x+xi) <= 15 && (y+yi) >= 0 && (y+yi) <= 15) {
          if ((xi != 0 || yi != 0) && (d[x+xi][y+yi] == 'X' || d[x+xi][y+yi] == '@')) {
            check_around(d, p, x+xi, y+yi);
          }
        }
      }
    }
  }
  return 0;
}

int check_current(char d[][16], char p[][16], int x, int y) {
  if (x < 0 || x >= 16 || y < 0 || y >= 16) {
    return 1;
  }
  if (d[x][y] != 'X' && d[x][y] != '@') {
    return 1;
  }
  if (p[x][y] == 'O') {
    printf("\nBOOM ! Dommage ...\n");
    exit(0);
  }

  check_around(d, p, x, y);
}

void quit() {
  char choice[BUFLEN];
  printf("Voulez-vous vraiment quitter Breizh deminage ? [oui/non] ");
  scanf("%s", &choice);
  if (strcmp(choice, "oui") == 0) {
    exit(0);
  }
}



int main(int argc, char* argv[]) {
  setvbuf(stdin,NULL,_IONBF,0);
  setvbuf(stdout,NULL,_IONBF,0);

  banner();


  printf("\nVeuillez entrer le niveau de difficulté [easy/medium/hard] : ");
  scanf("%8s", &difficulty);

  if (strcmp(difficulty, "easy") == 0) {
    mine_n = 15;
  }
  else if (strcmp(difficulty, "medium") == 0) {
    mine_n = 25;
  }
  else if (strcmp(difficulty, "hard") == 0) {
    mine_n = 40;
  }

  printf("\n\n\n");

  char plateau[16][16] = {{'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'}};

  char display[16][16] = {{'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'},
                          {'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'}};

  char vertical[19] = {'y', ' ', '|', '|', '|', '|', '|', '|', '|', '|', '|', '|', '|', '|', '|', '|', '|', '|', 'V'};
  char horizontal[19] = {'x', ' ', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '>'};
  char n[16] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};


  srand((unsigned)time(NULL));
  int x;
  int y;
  for (int i = 0; i < mine_n; i++) {
    x = rand() % 16;
    y = rand() % 16;
    plateau[x][y] = 'O';
  }

  screen(display, vertical, horizontal, n);

  char c;

  display_choice();


  while (1) {
    c = getchar();

    switch (c) {
      case '1':
        printf("\nIndiquez les coordonnées x et y: ");
        printf("\nx : ");
        scanf("%x", &x);
        printf("y : ");
        scanf("%x", &y);
        if (x < 0 || x > 15 || y < 0 || y > 15) {
          printf("\nEntrée invalide\n\n\n");
          screen(display, vertical, horizontal, n);
          display_choice();
          break;
        }
        printf("\n\n\n");
        check_current(display, plateau, y, x);
        screen(display, vertical, horizontal, n);
        display_choice();

        if (X_n == mine_n) {
          printf("\nFélicitations, vous avez gagné \\o/\n");
          printf("Maintenant il faudrait penser à flag ;)\n");
          exit(0);
        }

        break;

      case '2':
        printf("\nIndiquez les coordonnées x et y du drapeau :");
        printf("\nx : ");
        scanf("%x", &x);
        printf("y : ");
        scanf("%x", &y);
        if (x < 0 || x > 15 || y < 0 || y > 15) {
          printf("\nEntrée invalide\n\n\n");
          screen(display, vertical, horizontal, n);
          display_choice();
          break;
        }
        if (display[y][x] == 'X') {
          display[y][x] = '@';
        }
        printf("\nDrapeau placé\n\n\n");
        screen(display, vertical, horizontal, n);
        display_choice();
        break;

      case '3':
        quit();
        display_choice();
        break;
    }


  }


  }
