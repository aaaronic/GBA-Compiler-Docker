#include "HW03Lib.h"
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
// extern int score;
// extern int lose;

enum {START, GAME, PAUSE, WIN, LOSE};
int state;

void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	oldButtons = 0;
	buttons = 0;
}
void updateGame() {
 	if (BUTTON_HELD(BUTTON_UP)) {
         worm.stickLength -=2;
     }
     if (BUTTON_HELD(BUTTON_DOWN)) {
         worm.stickLength +=2;
     }
     if (BUTTON_HELD(BUTTON_LEFT)) {
         worm.move -=2;
     }
     if (BUTTON_HELD(BUTTON_RIGHT)) {
         worm.move +=2;
     }
 }
int main() {
    initialize();
    while (1) {
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}
void goToStart() {
    fillScreen(WHITE);
    state = START;
    seed = 0;
    drawString(60, 50, "press SELECT to play", BLACK);
}
void start() {
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        srand(seed);
        initGame();
    }
}
void goToGame() {
    fillScreen(CYAN);
    state = GAME;
}
void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToWin();
    }
    if(BUTTON_PRESSED(BUTTON_A)) {
        goToLose();
    }
    if (score == 5) {
        state = WIN;
    }
    if (score == 1) {
        state = LOSE;
    }
}
void goToPause() {
    fillScreen(BLACK);
    state = PAUSE;
    drawString(102, 50, "paused", WHITE);
}
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
void goToWin() {
    fillScreen(GREEN);
    state = WIN;
    drawString(96, 50, "you win!", WHITE);
}
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}
void goToLose() {
    fillScreen(RED);
    state = LOSE;
    drawString(92, 50, "you lose!", WHITE);
}
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}