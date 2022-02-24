# 1 "HW03Lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HW03Lib.c"
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
# 2 "HW03Lib.c" 2

int fishCol = 50;
int fishRow = 10;
int starCol = 20;
int starRow = 10;

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, unsigned short color, int height, int width) {
    int i, j;
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            setPixel(col + i, row + j, color);
        }
    }
}

void drawHorizontalLine(int x, int y, int length, u16 color) {
  for(int i=0; i<length; i++) {
    setPixel(x + i, y, color);
  }
}

void drawVerticalLine(int x, int y, int length, u16 color) {
  for(int i=0; i<length; i++) {
    setPixel(x, y + i, color);
  }
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}

void fillScreen(unsigned short color) {
    for(int i = 0; i < 240; i++) {
      for(int j = 0; j < 160; j++) {
          videoBuffer[i + j*240] = color;
      }
    }
}
void drawFish() {
    drawHorizontalLine(fishCol, fishRow, 9, ((31) | (29)<<5 | (17)<<10));
    drawHorizontalLine(fishCol-1, fishRow+1, 11, ((31) | (29)<<5 | (17)<<10));
    drawHorizontalLine(fishCol-2, fishRow+2, 15, ((31) | (29)<<5 | (17)<<10));
    drawHorizontalLine(fishCol-2, fishRow+3, 16, ((31) | (29)<<5 | (17)<<10));
    drawHorizontalLine(fishCol-2, fishRow+4, 16, ((31) | (29)<<5 | (17)<<10));
    drawHorizontalLine(fishCol-2, fishRow+5, 15, ((31) | (29)<<5 | (17)<<10));
    drawHorizontalLine(fishCol-1, fishRow+6, 12, ((31) | (29)<<5 | (17)<<10));
    drawHorizontalLine(fishCol, fishRow+7, 9, ((31) | (29)<<5 | (17)<<10));
    drawVerticalLine(fishCol+17, fishRow+3, 2, ((31) | (29)<<5 | (17)<<10));
    drawVerticalLine(fishCol+18, fishRow+2, 3, ((31) | (29)<<5 | (17)<<10));
    drawVerticalLine(fishCol+19, fishRow+1, 5, ((31) | (29)<<5 | (17)<<10));
    drawVerticalLine(fishCol+20, fishRow, 7, ((31) | (29)<<5 | (17)<<10));
    setPixel(fishCol, fishRow+2, 0);
}
void drawStarfish() {
    drawHorizontalLine(starCol, starRow, 24, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+1, starRow+1, 22, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+3, starRow+2, 18, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+5, starRow+3, 14, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+6, starRow+4, 12, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+5, starRow+5, 14, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+5, starRow+6, 15, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+4, starRow+7, 6, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+3, starRow+8, 4, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+3, starRow+9, 2, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+2, starRow+10, 2, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+14, starRow+7, 6, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+16, starRow+8, 4, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+18, starRow+9, 2, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+19, starRow+10, 2, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+8, starRow-1, 8, ((31) | (23)<<5 | (23)<<10));
    drawHorizontalLine(starCol+9, starRow-2, 6, ((31) | (23)<<5 | (23)<<10));
    drawVerticalLine(starCol+10, starRow-5, 3, ((31) | (23)<<5 | (23)<<10));
    drawVerticalLine(starCol+11, starRow-7, 5, ((31) | (23)<<5 | (23)<<10));
    drawVerticalLine(starCol+12, starRow-8, 6, ((31) | (23)<<5 | (23)<<10));
    drawVerticalLine(starCol+13, starRow-5, 3, ((31) | (23)<<5 | (23)<<10));
    setPixel(starCol+10, starRow-1, 0);
    setPixel(starCol+14, starRow-1, 0);
}
