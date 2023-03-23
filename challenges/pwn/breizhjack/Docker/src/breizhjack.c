#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define BUFLEN 11

struct Deck {
  char cards[416][11];
  char dealed[52];
};

void banner() {
  puts("\n♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥");
  puts("♠♠♣♣      Breizhjack online     ♥♥♦♦");
  puts("♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦\n");
}

void menu() {
  puts("\n1. Hit");
  puts("2. Stand\n");
}

void display_board(char player_hand[][2], char dealer_hand[][2], struct Deck deck) {
  printf("                       ");
  char max = 4;
  for (char i = 4; i < 52; i++) {
    if (player_hand[i][0] == -1 && dealer_hand[i][0] == -1) {
      break;
    }
    else {
      max = i;
      if (i % 2 == 0) {
        printf("      ");
      }
      else {
        printf("     ");
      }

    }
  }

  printf("o\n");

  printf("                      ");
  for (char i = 4; i < 52; i++) {
    if (player_hand[i][0] == -1 && dealer_hand[i][0] == -1) {
      break;
    }
    else {
      if (i % 2 == 0) {
        printf("      ");
      }
      else {
        printf("     ");
      }

    }
  }

  printf("/|\\\n");

  printf("/---------------------------------------------");
  for (char i = 4; i <= max; i++) {
      printf("-----------");
  }
  printf("\\\n");

  printf("|");
  char j;
  for (char i = 0; i < 52; i++) {
    if (dealer_hand[i][0] != -1) {
      printf(" ##########");
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (dealer_hand[i][0] != -1) {
      printf(" #     / /#");
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (dealer_hand[i][0] != -1) {
      printf(" #    / / #");
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (dealer_hand[i][0] != -1) {
      printf(" #   / /  #");
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (dealer_hand[i][0] != -1) {
      printf(" #  / /   #");
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (dealer_hand[i][0] != -1) {
      printf(" # / /    #");
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (dealer_hand[i][0] != -1) {
      printf(" #/ /     #");
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (dealer_hand[i][0] != -1) {
      printf(" ##########");
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  for (char k = 0; k < 4; k++) {
    printf("|");
    j = 0;
    for (char i = 0; i < 52; i++) {
      if (dealer_hand[i][0] != -1) {
        printf("           ");
      }
      else {
        j = i;
        break;
      }
    }
    if (j <= max) {
      for (char i = j; i <= max; i++) {
        printf("           ");
      }
    }
    printf(" |\n");
  }

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (player_hand[i][0] != -1) {
      printf(" %s", deck.cards[(player_hand[i][0]*13 + player_hand[i][1])*8]);
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (player_hand[i][0] != -1) {
      printf(" %s", deck.cards[(player_hand[i][0]*13 + player_hand[i][1])*8+1]);
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (player_hand[i][0] != -1) {
      printf(" %s", deck.cards[(player_hand[i][0]*13 + player_hand[i][1])*8+2]);
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (player_hand[i][0] != -1) {
      printf(" %s", deck.cards[(player_hand[i][0]*13 + player_hand[i][1])*8+3]);
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (player_hand[i][0] != -1) {
      printf(" %s", deck.cards[(player_hand[i][0]*13 + player_hand[i][1])*8+4]);
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (player_hand[i][0] != -1) {
      printf(" %s", deck.cards[(player_hand[i][0]*13 + player_hand[i][1])*8+5]);
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (player_hand[i][0] != -1) {
      printf(" %s", deck.cards[(player_hand[i][0]*13 + player_hand[i][1])*8+6]);
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("|");
  j = 0;
  for (char i = 0; i < 52; i++) {
    if (player_hand[i][0] != -1) {
      printf(" %s", deck.cards[(player_hand[i][0]*13 + player_hand[i][1])*8+7]);
    }
    else {
      j = i;
      break;
    }
  }
  if (j <= max) {
    for (char i = j; i <= max; i++) {
      printf("           ");
    }
  }
  printf(" |\n");

  printf("\\---------------------------------------------");
  for (char i = 4; i <= max; i++) {
      printf("-----------");
  }
  printf("/\n");


}

struct Deck Deck(char *filename, int offset) {
  struct Deck deck;


  for (int i = 0; i < 52; i++) {
    deck.dealed[i] = 0;
  }

  FILE *file;
  char buf[BUFLEN];

  file = fopen(filename, "r");

  if (file == NULL) {
    puts("Fichier non reconnu");
    exit(1);
  }

  int i = 0;
  while (fgets(buf, offset, file) != NULL) {
    if (strncmp(buf, "\n", 1) != 0) {
      for (int j = 0; j < BUFLEN; j++) {
        deck.cards[i][j] = buf[j];
      }
      i++;
    }

  }

  return deck;


}

void deal(struct Deck deck, char hand[52][2]) {
  char color;
  char value;
  for (int i = 0; i < 2; i++) {
    color = rand() % 4;
    value = rand() % 13;
    while (deck.dealed[color*13 + value] == 1) {
      color = rand() % 4;
      value = rand() % 13;
    }
    deck.dealed[color*13 + value] = 1;
    hand[i][0] = color;
    hand[i][1] = value;
  }
  for (int i = 2; i < 11; i++) {
    hand[i][0] = -1;
    hand[i][1] = -1;
  }
}

char test_deck_out(struct Deck deck) {
  for (char i; i < 52; i++) {
    if (deck.dealed[i] == 0) {
      return 1;
    }
  }
  return 0;
}

void hit(struct Deck deck, char hand[52][2]) {
  char i = 0;
  for (char offset = 0; offset < 11; offset++) {
    if (hand[offset][0] == -1) {
      i = offset;
      break;
    }
  }
  char color;
  char value;
  color = rand() % 4;
  value = rand() % 13;
  while (deck.dealed[color*13 + value] == 1) {
    color = rand() % 4;
    value = rand() % 13;
  }
  deck.dealed[color*13 + value] = 1;
  hand[i][0] = color;
  hand[i][1] = value;
}

char score(char hand[52][2]) {
  char ret = 0;
  for (char i = 0; i < 11; i++) {
    if (hand[i][1] == 11 || hand[i][1] == 12 || hand[i][1] == 13) {
      ret += 10;
    }
    else if (hand[i][1] == 1) {
      if (ret >= 11) {
        ret += 1;
      }
      else {
        ret += 11;
      }
    }
    else if (hand[i][1] == -1) {
      break;
    }
    else {
      ret += hand[i][1];
    }
  }
  return ret;
}

void stand(char player_hand[52][2], char dealer_hand[52][2]) {
  int player_score = score(player_hand);
  int dealer_score = score(dealer_hand);
  puts("\n");

  if (player_score == 21) {
    puts("Vous avez un blackjack ! C'est gagné mais ce n'est ni un flag ni un /bin/sh");
    exit(0);
  }
  else if (dealer_score == 21) {
    puts("Le donneur a un blackjack ! C'est perdu");
    exit(0);
  }
  else if (player_score > 21) {
    puts("Votre score est supérieur à 21 ! C'est perdu");
    exit(0);
  }
  else if (dealer_score > 21) {
    puts("Le score du donneur est supérieur à 21 ! C'est gagné");
    exit(0);
  }
  else if (player_score > dealer_score) {
    puts("Votre score est supérieur à celui du donneur ! C'est gagné");
    exit(0);
  }
  else if (player_score < dealer_score) {
    puts("Le score du donneur est supéreur au votre ! C'est perdu");
    exit(0);
  }
  else if (player_score == dealer_score) {
    puts("Scores identiques ! C'est une égalité");
    exit(0);
  }
}


int main(int argc, char* argv[]) {
  setvbuf(stdin,NULL,_IONBF,0);
  setvbuf(stdout,NULL,_IONBF,0);
  srand((unsigned)time(NULL));
  banner();
  struct Deck deck;
  if (argc == 3) {
    if (strcmp(argv[1], "--width") == 0) {
      deck = Deck("cards.txt", atoi(argv[2]));
    }
  }
  else {
    deck = Deck("cards.txt", BUFLEN);
  }
  char player_hand[52][2];
  char dealer_hand[52][2];
  deal(deck, dealer_hand);
  deal(deck, player_hand);
  display_board(player_hand, dealer_hand, deck);
  menu();

  while (score(dealer_hand) < 17) {
    hit(deck, dealer_hand);
  }

  char c;
  while (1) {
    c = getchar();

    switch (c) {
      case '1':
        hit(deck, player_hand);
        display_board(player_hand, dealer_hand, deck);
        menu();
        break;

      case '2':
        display_board(player_hand, dealer_hand, deck);
        stand(player_hand, dealer_hand);
        break;
    }
  }

  }
