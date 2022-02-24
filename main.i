# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "HW03Lib.h" 1
# 9 "HW03Lib.h"
typedef unsigned short u16;







extern volatile unsigned short *videoBuffer;
# 32 "HW03Lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, unsigned short color, int height, int width);
void fillScreen(unsigned short color);
void drawHorizontalLine(int x, int y, int length, u16 color);
void drawVerticalLine(int x, int y, int length, u16 color);

void waitForVBlank();
# 53 "HW03Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
extern int fishCol;
extern int fishRow;
extern int starCol;
extern int starRow;

void initialize() {
 (*(unsigned short *)0x4000000) = 3 | (1<<10);
 oldButtons = 0;
 buttons = 0;
}
# 20 "main.c"
void fillScreen1() {
    fillScreen(0);
}
int main() {
    initialize();
    while (1) {

        drawFish();
        drawStarfish();
    }
}
