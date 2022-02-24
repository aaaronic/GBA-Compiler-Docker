#include "HW03Lib.h"
int score = 0;
int lose = 0;
// extern int fishCol;
// extern int fishRow;
// extern int starCol;
// extern int starRow;
// extern int sharkCol;
// extern int sharkRow;
// extern int wormCol;
// extern int wormRow;
// extern int stickLength;
// extern int move;

void drawGame() {
    drawFish();
    drawShark();
    drawStarfish();
    drawWorm();
}
void eatFish() {
    if (collision(wormCol-3, wormRow, 4, 18+stickLength, fishCol-2, fishRow, 23, 17)) {
        score += 1;
    }
}
void eatStarfish() {
    if (collision(wormCol-3, wormRow, 4, 18+stickLength, starCol, starRow-9, 19, 25)) {
        score += 1;
    }
}
void eatShark() {
    if (collision(wormCol-3, wormRow, 4, 18+stickLength, sharkCol-6, sharkRow-5, 14, 30)) {
        lose = 1;
    }
}