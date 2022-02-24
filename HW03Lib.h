#ifndef HW03LIB_H
#define HW03LIB_H

#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)


typedef unsigned short u16;
#define OFFSET(col,row,rowlen) ((row)*(rowlen)+(col))

#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

#define SCREENHEIGHT 160
#define SCREENWIDTH 240

extern volatile unsigned short *videoBuffer;

#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK 0
#define WHITE COLOR(31,31,31)
#define GRAY COLOR(15,15,15)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)
#define PINK COLOR(31, 23, 23)
#define GOLD COLOR(31, 29, 17)

void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, unsigned short color, int height, int width);
void fillScreen(unsigned short color);
void drawHorizontalLine(int x, int y, int length, u16 color);
void drawVerticalLine(int x, int y, int length, u16 color);
void drawFish();
void drawStarfish();

void waitForVBlank();

#define BUTTONS (*(volatile unsigned short *)0x04000130)

#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

extern unsigned short oldButtons;
extern unsigned short buttons;

#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

typedef struct {
  int col;
  int row;
  int time;
} FISH;

typedef struct {
  int col;
  int row;
  int time;
} STARFISH;

typedef struct {
  int col;
  int row;
  int time;
} SHARK;

typedef struct {
  int col;
  int row;
  int stickLength;
  int move;
  int time;
} WORM;
#endif