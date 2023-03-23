#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void revolte() {
  puts("REVOLTE !!!");
  exit(0);
}

int main(int argc, char* argv[]) {
  if (argc != 2) {
    revolte();
  }
  else if (strlen(argv[1]) != 39) {
    revolte();
  }

  char buf[39];
  strcpy(buf, argv[1]);

  if (buf[0] != 'B') {
    revolte();
  }
  if (buf[1] != 'Z') {
    revolte();
  }
  if (buf[2] != 'H') {
    revolte();
  }
  if (buf[3] != 'C') {
    revolte();
  }
  if (buf[4] != 'T') {
    revolte();
  }
  if (buf[5] != 'F') {
    revolte();
  }
  if (buf[6] != '{') {
    revolte();
  }
  if (buf[38] != '}') {
    revolte();
  }
  if ((buf[7] ^ buf[8]) != 97) {
    revolte();
  }
  if ((buf[8] ^ buf[9]) != 101) {
    revolte();
  }
  if ((buf[9] ^ buf[10]) != 101) {
    revolte();
  }
  if ((buf[10] ^ buf[11]) != 65) {
    revolte();
  }
  if ((buf[11] ^ buf[12]) != 71) {
    revolte();
  }
  if ((buf[12] ^ buf[13]) != 80) {
    revolte();
  }
  if ((buf[13] ^ buf[14]) != 55) {
    revolte();
  }
  if ((buf[14] ^ buf[15]) != 13) {
    revolte();
  }
  if ((buf[15] ^ buf[16]) != 51) {
    revolte();
  }
  if ((buf[16] ^ buf[17]) != 93) {
    revolte();
  }
  if ((buf[17] + buf[18]) != 104) {
    revolte();
  }
  if ((buf[18] + buf[19]) != 110) {
    revolte();
  }
  if ((buf[19] + buf[20]) != 163) {
    revolte();
  }
  if ((buf[20] + buf[21]) != 209) {
    revolte();
  }
  if ((buf[21] + buf[22]) != 196) {
    revolte();
  }
  if ((buf[22] + buf[23]) != 194) {
    revolte();
  }
  if ((buf[23] * buf[24]) != 10296) {
    revolte();
  }
  if ((buf[24] * buf[25]) != 5304) {
    revolte();
  }
  if ((buf[25] * buf[26]) != 3519) {
    revolte();
  }
  if ((buf[26] * buf[27]) != 3657) {
    revolte();
  }
  if ((buf[27] * buf[28]) != 5353) {
    revolte();
  }
  if ((buf[28] * buf[29]) != 11514) {
    revolte();
  }
  if ((buf[29] * buf[30]) != 10830) {
    revolte();
  }
  if ((buf[30] * buf[31]) != 11115) {
    revolte();
  }
  if ((buf[31] - buf[32]) != 13) {
    revolte();
  }
  if ((buf[33] - buf[32]) != 13) {
    revolte();
  }
  if ((buf[33] - buf[34]) != 72) {
    revolte();
  }
  if ((buf[35] - buf[34]) != 72) {
    revolte();
  }
  if ((buf[35] - buf[36]) != 13) {
    revolte();
  }
  if ((buf[37] - buf[36]) != 13) {
    revolte();
  }

  puts("Félicitations, vous pouvez valider avec ce flag !");

}
