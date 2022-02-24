#include "HW03Lib.h"

FISH fish;
STARFISH starfish;
SHARK shark;
WORM worm;

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, 240)] = color;
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
    drawHorizontalLine(fish.col, fish.row, 9, GOLD);
    drawHorizontalLine(fish.col-1, fish.row+1, 11, GOLD);
    drawHorizontalLine(fish.col-2, fish.row+2, 15, GOLD);
    drawHorizontalLine(fish.col-2, fish.row+3, 16, GOLD);
    drawHorizontalLine(fish.col-2, fish.row+4, 16, GOLD);
    drawHorizontalLine(fish.col-2, fish.row+5, 15, GOLD);
    drawHorizontalLine(fish.col-1, fish.row+6, 12, GOLD);
    drawHorizontalLine(fish.col, fish.row+7, 9, GOLD);
    drawVerticalLine(fish.col+17, fish.row+3, 2, GOLD);
    drawVerticalLine(fish.col+18, fish.row+2, 3, GOLD);
    drawVerticalLine(fish.col+19, fish.row+1, 5, GOLD);
    drawVerticalLine(fish.col+20, fish.row, 7, GOLD);
    setPixel(fish.col, fish.row+2, BLACK);
    fish.time++;
    if (fish.col == 235) {
      fish.row = rand() % 155;
      fish.col = 5;
    }
    else {
      if (fish.time % 5 == 0) {
        fish.col++;
      }
    }
}
void drawStarfish() {
    drawHorizontalLine(star.col, star.row, 24, PINK);
    drawHorizontalLine(star.col+1, star.row+1, 22, PINK);
    drawHorizontalLine(star.col+3, star.row+2, 18, PINK);
    drawHorizontalLine(star.col+5, star.row+3, 14, PINK);
    drawHorizontalLine(star.col+6, star.row+4, 12, PINK);
    drawHorizontalLine(star.col+5, star.row+5, 14, PINK);
    drawHorizontalLine(star.col+5, star.row+6, 15, PINK);
    drawHorizontalLine(star.col+4, star.row+7, 6, PINK);
    drawHorizontalLine(star.col+3, star.row+8, 4, PINK);
    drawHorizontalLine(star.col+3, star.row+9, 2, PINK);
    drawHorizontalLine(star.col+2, star.row+10, 2, PINK);
    drawHorizontalLine(star.col+14, star.row+7, 6, PINK);
    drawHorizontalLine(star.col+16, star.row+8, 4, PINK);
    drawHorizontalLine(star.col+18, star.row+9, 2, PINK);
    drawHorizontalLine(star.col+19, star.row+10, 2, PINK);
    drawHorizontalLine(star.col+8, star.row-1, 8, PINK);
    drawHorizontalLine(star.col+9, star.row-2, 6, PINK);
    drawVerticalLine(star.col+10, star.row-5, 3, PINK);
    drawVerticalLine(star.col+11, star.row-7, 5, PINK);
    drawVerticalLine(star.col+12, star.row-8, 6, PINK);
    drawVerticalLine(star.col+13, star.row-5, 3, PINK);
    setPixel(star.col+10, star.row-1, BLACK);
    setPixel(star.col+14, star.row-1, BLACK);
    star.time++;
    if (star.col == 235) {
      star.row = rand() % 155;
      star.col = 5;
    }
    else {
      if (star.time % 5 == 0) {
        star.col++;
      }
    }
}
void drawShark() {
  drawHorizontalLine(shark.col, shark.row, 13, BLUE);
  drawHorizontalLine(shark.col-2, shark.row+1, 17, BLUE);
  drawHorizontalLine(shark.col-3, shark.row+2, 20, BLUE);
  drawHorizontalLine(shark.col-5, shark.row+3, 24, BLUE);
  drawHorizontalLine(shark.col-4, shark.row+4, 21, BLUE);
  drawHorizontalLine(shark.col-2, shark.row+5, 17, BLUE);
  drawHorizontalLine(shark.col, shark.row+6, 13, BLUE);
  // fin
  drawVerticalLine(shark.col+1, shark.row+7, 1, BLUE);
  drawVerticalLine(shark.col+2, shark.row+7, 3, BLUE);
  drawVerticalLine(shark.col+3, shark.row+7, 4, BLUE);
  drawVerticalLine(shark.col+4, shark.row+7, 3, BLUE);
  drawVerticalLine(shark.col+5, shark.row+7, 1, BLUE);
  // fin
  drawVerticalLine(shark.col+9, shark.row+7, 2, BLUE);
  drawVerticalLine(shark.col+10, shark.row+7, 3, BLUE);
  drawVerticalLine(shark.col+11, shark.row+7, 4, BLUE);
  drawVerticalLine(shark.col+12, shark.row+7, 4, BLUE);
  drawVerticalLine(shark.col+13, shark.row+9, 2, BLUE);
  drawVerticalLine(shark.col+14, shark.row+11, 1, BLUE);
  // upper fin
  drawHorizontalLine(shark.col+6, shark.row-1, 2, BLUE);
  drawVerticalLine(shark.col+8, shark.row-2, 2, BLUE);
  drawVerticalLine(shark.col+9, shark.row-3, 3, BLUE);
  drawVerticalLine(shark.col+10, shark.row-3, 3, BLUE);
  drawVerticalLine(shark.col+11, shark.row-4, 4, BLUE);
  drawVerticalLine(shark.col+12, shark.row-3, 2, BLUE);
  // back fin
  drawVerticalLine(shark.col+20, shark.row+2, 3, BLUE);
  drawVerticalLine(shark.col+21, shark.row, 6, BLUE);
  drawVerticalLine(shark.col+22, shark.row-1, 8, BLUE);
  drawVerticalLine(shark.col+23, shark.row-2, 3, BLUE);
  setPixel(shark.col+23, shark.row+8, BLUE);
  setPixel(shark.col+24, shark.row-3, BLUE);
  shark.time++;
    if (shark.col == 235) {
      shark.row = rand() % 155;
      shark.col = 5;
    }
    else {
      if (shark.time % 5 == 0) {
        shark.col++;
      }
    }
}
void drawWorm() {
  drawVerticalLine(worm.col+worm.move, worm.row+worm.stickLength, 8, BLACK);
  drawHorizontalLine(worm.col+worm.move, worm.row+9+worm.stickLength, 3, YELLOW);
  drawHorizontalLine(worm.col-1+worm.move, worm.row+10+worm.stickLength, 3, YELLOW);
  drawHorizontalLine(worm.col-2+worm.move, worm.row+11+worm.stickLength, 3, YELLOW);
  drawHorizontalLine(worm.col-1+worm.move, worm.row+12+worm.stickLength, 3, YELLOW);
  drawHorizontalLine(worm.col-1+worm.move, worm.row+13+worm.stickLength, 4, YELLOW);
  drawHorizontalLine(worm.col+worm.move, worm.row+14+worm.stickLength, 3, YELLOW);
  drawHorizontalLine(worm.col-1+worm.move, worm.row+15+worm.stickLength, 3, YELLOW);
  drawHorizontalLine(worm.col-3+worm.move, worm.row+16+worm.stickLength, 4, YELLOW);
  drawHorizontalLine(worm.col-2+worm.move, worm.row+17+worm.stickLength, 2, YELLOW);
  setPixel(worm.col-2, worm.row+16+worm.stickLength, BLACK);
}