#include "collision.h"
#include "tempCol.h"
#include "tempCol2.h"
#include "print.h"
#include "mode0.h"
#include "player.h"
#include "gba.h"
#include <stdio.h>
#include <stdlib.h>
#include "whoosh.h"
#include "digitalSound.h"
#include "buttonEffects.h"

#define MAPWIDTH 256
#define MAPHEIGHT 256


int currentCollisionStep = 0;
int spriteChanged = 0;
int buttonsCollected[5] = {0, 0, 0, 0, 0};
int sequenceComplete = 0;

int patternCompleted = 0;  // 0=none, 1=isosceles pattern 1, 2=isosceles pattern 2, 3=isosceles pattern 3
int patternSpritePosX[3]; 
int patternSpritePosY[3];  
int showPatternSprite = 0; 
int patternSpriteTimer = 0;
int isoscelesPatternsCompleted[3] = {0};

int automaticMovementActive = 0;
int currentMovementStep = 0;

int movementSequence[24]={0}; // 0=down, 1=up, 2=left, 3=right
int movementDurations[24]={0}; 
int movementTimers[24]={0}; 
int automaticMovementFinished = 0;


int buttonSequence[5] = {-1, -1, -1, -1, -1};
static int buttonSequenceLength = 0;
static int patternMovementSequence[24] = {0};
static int patternMovementDurations[24] = {0};
static int patternMovementLength = 0;

SPRITE gameButtons[5];
int buttonAnimated[5] = {0, 0, 0, 0, 0};
int buttonAnimationTimer[5] = {0, 0, 0, 0, 0};

int bgHOff = 0;  
int bgVOff = 0;  
 
const int BUTTON_POSITIONS_X[5] = {196, 37, 198, 39, 118};
const int BUTTON_POSITIONS_Y[5] = {48, 178, 178, 47, 110};

inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*)tempColBitmap)[OFFSET(x, y, MAPWIDTH)];
}

void initPatternPositions(void) {
    
    patternSpritePosX[0] = 100;   
    patternSpritePosY[0] = 145;
    
    patternSpritePosX[1] = 100; 
    patternSpritePosY[1] = 145;
    
    patternSpritePosX[2] = 100;  
    patternSpritePosY[2] = 50;
    
    patternCompleted = 0;
    showPatternSprite = 0;
    patternSpriteTimer = 0;
    
    shadowOAM[60].attr0 = ATTR0_HIDE;
}

void drawPatternSprite(SPRITE* player) {
 
    if (patternSpriteTimer <= 0) {
        mgba_printf("  Timer expired - hiding THIS sprite only");
        shadowOAM[60].attr0 = ATTR0_HIDE;  
        showPatternSprite = 0;  
        return;
    }
    
    if (!showPatternSprite || patternCompleted == 0 || !isoscelesTrianglePatternActive) {
        mgba_printf("  HIDING sprite - conditions not met");
        shadowOAM[60].attr0 = ATTR0_HIDE;
        return;
    }

    if (!showPatternSprite || patternCompleted == 0 || !isoscelesTrianglePatternActive) {
        mgba_printf("  HIDING sprite - conditions not met");
        shadowOAM[60].attr0 = ATTR0_HIDE;  
        return;
    }
    
    #define SCREEN_WIDTH 240
    #define SCREEN_HEIGHT 160
    
    int cameraX = player->x - (SCREEN_WIDTH / 2) + 32;
    int cameraY = player->y - (SCREEN_HEIGHT / 2) + 32;
    
    if (cameraX < 0) cameraX = 0;
    if (cameraY < 0) cameraY = 0;
    if (cameraX > 256 - SCREEN_WIDTH) cameraX = 256 - SCREEN_WIDTH;
    if (cameraY > 256 - SCREEN_HEIGHT) cameraY = 256 - SCREEN_HEIGHT;
    
    int patternIndex = patternCompleted - 1; 
    int worldX = patternSpritePosX[patternIndex];
    int worldY = patternSpritePosY[patternIndex];

    mgba_printf("  Pattern %d at world coords: (%d, %d)", patternCompleted, worldX, worldY);
    
    int screenX = worldX - cameraX;
    int screenY = worldY - cameraY;
    mgba_printf("  Screen coords: (%d, %d)", screenX, screenY);

    if (screenX < -64 || screenX > SCREEN_WIDTH || 
        screenY < -64 || screenY > SCREEN_HEIGHT) {
        mgba_printf("  HIDING sprite - off screen");
        shadowOAM[60].attr0 = ATTR0_HIDE;
        return;
    }
    
    shadowOAM[60].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[60].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; 
    shadowOAM[60].attr2 = ATTR2_PALROW(7) | ATTR2_PRIORITY(0) | ATTR2_TILEID(632, 0);
}

void updatePatternSpriteTimer(void) {
    if (patternSpriteTimer > 0) {
        patternSpriteTimer--;
        mgba_printf("Pattern timer: %d", patternSpriteTimer);
        
        if (patternSpriteTimer <= 0) {
            mgba_printf("TIMER EXPIRED - Hiding sprite");
            shadowOAM[60].attr0 = ATTR0_HIDE;
            showPatternSprite = 0;
            isoscelesTrianglePatternActive = 0;
        }
    }
}

void initButtons(void) {
    for (int i = 0; i < 5; i++) {
        gameButtons[i].oamIndex = 40 + i;
        buttonAnimated[i] = 0;
        buttonAnimationTimer[i] = 0;
        
        shadowOAM[gameButtons[i].oamIndex + 5].attr0 = ATTR0_HIDE;
        shadowOAM[gameButtons[i].oamIndex + 5].attr1 = 0;
        shadowOAM[gameButtons[i].oamIndex + 5].attr2 = 0;
    }
}

void updateButtons(void) {
    for (int i = 0; i < 5; i++) {
        if (buttonAnimated[i]) {
            buttonAnimationTimer[i]--;
            if (buttonAnimationTimer[i] <= 0) {
                buttonAnimated[i] = 0;
            }
        }
    }
}

void drawButtons(SPRITE* player) {
    #define WORLD_WIDTH 256
    #define WORLD_HEIGHT 256
    #define SCREEN_WIDTH 240
    #define SCREEN_HEIGHT 160
    
    int cameraX = player->x - (SCREEN_WIDTH / 2) + 32;
    int cameraY = player->y - (SCREEN_HEIGHT / 2) + 32;
    
    if (cameraX < 0) cameraX = 0;
    if (cameraY < 0) cameraY = 0;
    if (cameraX > WORLD_WIDTH - SCREEN_WIDTH) cameraX = WORLD_WIDTH - SCREEN_WIDTH;
    if (cameraY > WORLD_HEIGHT - SCREEN_HEIGHT) cameraY = WORLD_HEIGHT - SCREEN_HEIGHT;
    
    
    for (int i = 0; i < 5; i++) {
        int screenX = BUTTON_POSITIONS_X[i] - cameraX;
        int screenY = BUTTON_POSITIONS_Y[i] - cameraY;
    
        if (screenX < -32 || screenX > SCREEN_WIDTH || screenY < -32 || screenY > SCREEN_HEIGHT) {
            shadowOAM[gameButtons[i].oamIndex].attr0 = ATTR0_HIDE;
            shadowOAM[gameButtons[i].oamIndex + 5].attr0 = ATTR0_HIDE;
            continue;
        }
        
        int paletteRow = getButtonPaletteRow(i);
        
        int tileID = buttonAnimated[i] ? 780 : 776;
        shadowOAM[gameButtons[i].oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[gameButtons[i].oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
        shadowOAM[gameButtons[i].oamIndex].attr2 = ATTR2_PALROW(paletteRow) | ATTR2_PRIORITY(1) | ATTR2_TILEID(tileID, 0);

    }
    
}


void setupSquareFromSequence(int* buttons, int length, int* movementSeq, int* movementDur, int* step) {
    mgba_printf("Button indices: [%d,%d,%d,%d,%d]", buttons[0], buttons[1], buttons[2], buttons[3], buttons[4]);
    
    squarePatternActive = 0;
    rightTrianglePatternActive = 0;
    isoscelesTrianglePatternActive = 0;

    squarePatternActive = 1;
    
    if (buttons[0] == 0 && buttons[1] == 3 && buttons[2] == 1 && buttons[3] == 2 && buttons[4] == 0) {
        mgba_printf("Pattern 0,3,1,2,0 - Left, Down, Right, Up");
        
        movementSeq[*step] = MOVEMENT_PAUSE_LEFT; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_RIGHT; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 12; (*step)++;
    
    }
    else if (buttons[0] == 0 && buttons[1] == 2 && buttons[2] == 1 && buttons[3] == 3 && buttons[4] == 0) {
        mgba_printf("Pattern 0,2,1,3,0 - Down, Left, Up, Right");
        
        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_LEFT; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_RIGHT; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 12; (*step)++;
        
    }
    else if (buttons[0] == 3 && buttons[1] == 1 && buttons[2] == 2 && buttons[3] == 0 && buttons[4] == 3) {
        mgba_printf("Pattern 3,1,2,0,3 - Down, Right, Up, Left");
        
        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        mgba_printf("Step %d: MOVEMENT_PAUSE_DOWN = %d", *step, MOVEMENT_PAUSE_DOWN);
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 17; (*step)++;
        mgba_printf("Step %d: MOVEMENT_DOWN = %d", *step, MOVEMENT_DOWN);
        movementSeq[*step] = MOVEMENT_PAUSE_RIGHT; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_LEFT; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 12; (*step)++;
        
    }
    else if (buttons[0] == 3 && buttons[1] == 0 && buttons[2] == 2 && buttons[3] == 1 && buttons[4] == 3) {
        mgba_printf("Pattern 3,0,2,1,3 - Right, Down, Left, Up");

        movementSeq[*step] = MOVEMENT_PAUSE_RIGHT; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_LEFT; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 12; (*step)++;
        
    }
}


void setupRightTriangleFromSequence(int* buttons, int length, int* movementSeq, int* movementDur, int* step) {
    mgba_printf("Right Triangle - Button indices: [%d,%d,%d,%d,%d]", buttons[0], buttons[1], buttons[2], buttons[3], buttons[4]);
    rightTrianglePatternActive = 0;
    squarePatternActive = 0;
    isoscelesTrianglePatternActive = 0;


    
    if (buttons[0] == 3 && buttons[1] == 4 && buttons[2] == 2 && buttons[3] == 1 && buttons[4] == 3) {
        mgba_printf("Pattern 3,4,2,1,3 - DIAG_DOWN_RIGHT x2, RIGHT, UP");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 3 && buttons[1] == 1 && buttons[2] == 2 && buttons[3] == 4 && buttons[4] == 3) {//UP DIAG
        mgba_printf("Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 7; (*step)++;
    }
    else if (buttons[0] == 4 && buttons[1] == 2 && buttons[2] == 1 && buttons[3] == 3 && buttons[4] == 4) {
        mgba_printf("Pattern 4,2,1,3,4 - DIAG_DOWN_RIGHT, LEFT, UP, DIAG_DOWN_RIGHT");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] =15; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 3; (*step)++;
    }
    else if (buttons[0] == 4 && buttons[1] == 3 && buttons[2] == 1 && buttons[3] == 2 && buttons[4] == 4) { //UP DIAG
        mgba_printf("Pattern 4,3,1,2,4 - DIAG_DOWN_RIGHT, DOWN, RIGHT, DIAG_DOWN_RIGHT");
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 3; (*step)++;
    }
    else if (buttons[0] == 2 && buttons[1] == 1 && buttons[2] == 3 && buttons[3] == 4 && buttons[4] == 2) {
        mgba_printf("Pattern 2,1,3,4,2 - LEFT, UP, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 7; (*step)++;
    }
    else if (buttons[0] == 2 && buttons[1] == 4 && buttons[2] == 3 && buttons[3] == 1 && buttons[4] == 2) { //UP DIAG
        mgba_printf("Pattern 2,4,3,1,2 - DIAG_DOWN_RIGHT x2, DOWN, RIGHT");
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 1 && buttons[1] == 3 && buttons[2] == 4 && buttons[3] == 2 && buttons[4] == 1) {
        mgba_printf("Pattern 1,3,4,2,1 - RIGHT, DIAG_DOWN_RIGHT x2, DOWN");
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 1 && buttons[1] == 2 && buttons[2] == 4 && buttons[3] == 3 && buttons[4] == 1) { //UP DIAG
        mgba_printf("Pattern 1,2,4,3,1 - UP, DIAG_DOWN_RIGHT x2, LEFT");
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 0 && buttons[1] == 2 && buttons[2] == 4 && buttons[3] == 3 && buttons[4] == 0) {//UP DIAG
        mgba_printf("Pattern 0,2,4,3,0 - LEFT, DIAG_DOWN_RIGHT x2, UP");
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 0 && buttons[1] == 3 && buttons[2] == 4 && buttons[3] == 2 && buttons[4] == 0) {
        mgba_printf("Pattern 0,3,4,2,0 - DOWN, DIAG_DOWN_RIGHT x2, RIGHT");
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 2 && buttons[1] == 4 && buttons[2] == 3 && buttons[3] == 0 && buttons[4] == 2) {//UP DIAG
        mgba_printf("Pattern 2,4,3,0,2 - DIAG_DOWN_RIGHT x2, UP, LEFT");
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 2 && buttons[1] == 0 && buttons[2] == 3 && buttons[3] == 4 && buttons[4] == 2) {
        mgba_printf("Pattern 2,0,3,4,2 - RIGHT, DOWN, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 7; (*step)++;
    }
    else if (buttons[0] == 4 && buttons[1] == 2 && buttons[2] == 0 && buttons[3] == 3 && buttons[4] == 4) {
        mgba_printf("Pattern 4,2,0,3,4 - DIAG_DOWN_RIGHT, UP, LEFT, DIAG_DOWN_RIGHT");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 3; (*step)++;
    }
    else if (buttons[0] == 4 && buttons[1] == 3 && buttons[2] == 0 && buttons[3] == 2 && buttons[4] == 4) { //UP DIAG
        mgba_printf("Pattern 4,3,0,2,4 - DIAG_DOWN_RIGHT, RIGHT, DOWN, DIAG_DOWN_RIGHT");
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 3; (*step)++;
    }
    else if (buttons[0] == 3 && buttons[1] == 0 && buttons[2] == 2 && buttons[3] == 4 && buttons[4] == 3) { //UP DIAG
        mgba_printf("Pattern 3,0,2,4,3 - UP, LEFT, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 7; (*step)++;
    }
    else if (buttons[0] == 3 && buttons[1] == 4 && buttons[2] == 2 && buttons[3] == 0 && buttons[4] == 3) {
        mgba_printf("Pattern 3,4,2,0,3 - DIAG_DOWN_RIGHT x2, RIGHT, DOWN");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 3 && buttons[1] == 0 && buttons[2] == 4 && buttons[3] == 1 && buttons[4] == 3) {
        mgba_printf("Pattern 3,0,4,1,3 - RIGHT, DIAG_DOWN_LEFT x2, UP");
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 3 && buttons[1] == 1 && buttons[2] == 4 && buttons[3] == 0 && buttons[4] == 3) { //UP DIAG
        mgba_printf("Pattern 3,1,4,0,3 - DOWN, DIAG_DOWN_LEFT x2, LEFT");
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 0 && buttons[1] == 4 && buttons[2] == 1 && buttons[3] == 3 && buttons[4] == 0) {
        mgba_printf("Pattern 0,4,1,3,0 - DIAG_DOWN_LEFT x2, UP, RIGHT");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 0 && buttons[1] == 3 && buttons[2] == 1 && buttons[3] == 4 && buttons[4] == 0) { //UP DIAG
        mgba_printf("Pattern 0,3,1,4,0 - LEFT, DOWN, DIAG_DOWN_LEFT x2");
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 7; (*step)++;
    }
    else if (buttons[0] == 4 && buttons[1] == 1 && buttons[2] == 3 && buttons[3] == 0 && buttons[4] == 4) {
        mgba_printf("Pattern 4,1,3,0,4 - DIAG_DOWN_LEFT, UP, RIGHT, DIAG_DOWN_LEFT");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 3; (*step)++;
    }
    else if (buttons[0] == 4 && buttons[1] == 0 && buttons[2] == 3 && buttons[3] == 1 && buttons[4] == 4) {//UP DIAG
        mgba_printf("Pattern 4,0,3,1,4 - DIAG_DOWN_LEFT, LEFT, DOWN, DIAG_DOWN_LEFT");
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 4; (*step)++;
    }
    else if (buttons[0] == 1 && buttons[1] == 4 && buttons[2] == 0 && buttons[3] == 3 && buttons[4] == 1) {//UP DIAG
        mgba_printf("Pattern 1,4,0,3,1 - DIAG_DOWN_LEFT x2, LEFT, DOWN");
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 12; (*step)++;
    }
    else if (buttons[0] == 1 && buttons[1] == 3 && buttons[2] == 0 && buttons[3] == 4 && buttons[4] == 1) {
        mgba_printf("Pattern 1,3,0,4,1 - UP, RIGHT, DIAG_DOWN_LEFT x2");
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 7; (*step)++;
    }
}

void setupIsoscelesTriangleMovement(int* buttons, int length, int* movementSeq, int* movementDur, int* step) {
    isoscelesTrianglePatternActive = 0;
    squarePatternActive = 0;
    rightTrianglePatternActive = 0;

    patternCompleted = 0;

    if (buttons[0] == 1 && buttons[1] == 4 && buttons[2] == 2 && buttons[3] == 1) {
        mgba_printf("Pattern 3,4,2,1,3 - DIAG_DOWN_RIGHT x2, RIGHT, UP");
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 12; (*step)++;
        
        patternCompleted = 1; 
    }
    else if (buttons[0] == 4 && buttons[1] == 2 && buttons[2] == 1 && buttons[3] == 4) {//UP DIAG
        mgba_printf("Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 7; (*step)++;
        
        patternCompleted = 2; 
    }
    else if (buttons[0] == 0 && buttons[1] == 4 && buttons[2] == 3 && buttons[3] == 0) {//UP DIAG
        mgba_printf("Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 12; (*step)++;
        
        patternCompleted = 3; 
    }

    if (patternCompleted > 0) {
        
        isoscelesPatternsCompleted[patternCompleted-1] = 1;
        mgba_printf("Level 1: Isosceles pattern %d completed", patternCompleted);
    }
}

void setupPatternMovement(int patternType, int* buttonSequence, int sequenceLength, 
                         int* movementSeq, int* movementDur, int* movementLen) {
    mgba_printf("Setting up pattern movement for type: %d", patternType);
    
    mgba_printf("Complete button sequence:");
    for (int i = 0; i < sequenceLength; i++) {
        mgba_printf("  Button %d: %d", i, buttonSequence[i]);
    }
    
    int step = 0;
    
    switch (patternType) {
        case PATTERN_SQUARE:
            setupSquareFromSequence(buttonSequence, sequenceLength, movementSeq, movementDur, &step);
            break;
            
        case PATTERN_RIGHT_TRIANGLE:
            setupRightTriangleFromSequence(buttonSequence, sequenceLength, movementSeq, movementDur, &step);
            break;
            
        case PATTERN_ISOSCELES_TRIANGLE:
            setupIsoscelesTriangleMovement(buttonSequence, sequenceLength, movementSeq, movementDur, &step);
            break;
    }
    
    *movementLen = step;
    mgba_printf("Final movement sequence length: %d", *movementLen);
    
    for (int i = 0; i < step; i++) {
        char* dirName = "UNKNOWN";
        switch (movementSeq[i]) {
            case MOVEMENT_LEFT: dirName = "LEFT"; break;
            case MOVEMENT_RIGHT: dirName = "RIGHT"; break;
            case MOVEMENT_UP: dirName = "UP"; break;
            case MOVEMENT_DOWN: dirName = "DOWN"; break;
            case MOVEMENT_DIAG_DOWN_RIGHT: dirName = "DIAG_DOWN_RIGHT"; break;
            case MOVEMENT_DIAG_DOWN_LEFT: dirName = "DIAG_DOWN_LEFT"; break;
            case MOVEMENT_DIAG_UP_RIGHT: dirName = "DIAG_UP_RIGHT"; break;
            case MOVEMENT_DIAG_UP_LEFT: dirName = "DIAG_UP_LEFT"; break;
        }
        mgba_printf("Movement %d: %s for %d frames", i, dirName, movementDur[i]);
    }

    mgba_printf("=== MOVEMENT SETUP COMPLETE ===");
    mgba_printf("Movement sequence length: %d", *movementLen);
    for (int i = 0; i < *movementLen; i++) {
        mgba_printf("Step %d: dir=%d, dur=%d", i, movementSeq[i], movementDur[i]);
}
}

int checkButtonPatterns(SPRITE* player) {
    if (automaticMovementActive) return 0;

    int playerCenterX = player->x + 32;
    int playerCenterY = player->y + 32;
    
    for (int i = 0; i < 5; i++) {
        int buttonCenterX = BUTTON_POSITIONS_X[i] + 16;
        int buttonCenterY = BUTTON_POSITIONS_Y[i] + 16;
        
        if (abs(playerCenterX - buttonCenterX) < 24 && 
            abs(playerCenterY - buttonCenterY) < 24) {
            
            if (buttonSequenceLength == 0 || buttonSequence[buttonSequenceLength-1] != i) {
                mgba_printf("Collision with button %d", i);
                addButtonToSequence(i);
                
                squarePatternActive = 0;
                rightTrianglePatternActive = 0;
                isoscelesTrianglePatternActive = 0;
                
                if (buttonSequenceLength == 4) {
                    int isLoopSequence = (buttonSequence[0] == buttonSequence[3]);
                    int movementLen = 0;
                    
                    setupPatternMovement(PATTERN_ISOSCELES_TRIANGLE, buttonSequence, buttonSequenceLength, 
                                       movementSequence, movementDurations, &movementLen);
                    
                    if (movementLen > 0) {
                        isoscelesTrianglePatternActive = 1;
                        showAccessory = 1; 
                        resetButtonEffects();
                        startButtonSuccessEffect(buttonSequence, buttonSequenceLength);
                        startAutomaticMovement(player, movementLen);
                        resetButtonSequence();
                        return 1;
                    }
                    
                    if (isLoopSequence && movementLen == 0) {
                        mgba_printf("4-button loop sequence but no isosceles pattern matched - ERROR!");
                        startButtonErrorEffect(buttonSequence, buttonSequenceLength);
                        
                    }
                }
                
                if (buttonSequenceLength == 5) {
                    int movementLen = 0;
                    int isLoopSequence = (buttonSequence[0] == buttonSequence[4]);
                    
                    setupPatternMovement(PATTERN_SQUARE, buttonSequence, buttonSequenceLength, 
                                       movementSequence, movementDurations, &movementLen);
                    
                    if (movementLen > 0) {
                        mgba_printf("Square pattern detected with %d steps", movementLen);
                        squarePatternActive = 1;
                        showAccessory = 1;
                        resetButtonEffects();
                        startButtonSuccessEffect(buttonSequence, buttonSequenceLength);
                        startAutomaticMovement(player, movementLen);
                        resetButtonSequence();
                        return 1;
                    }
                    
                    movementLen = 0;
                    setupPatternMovement(PATTERN_RIGHT_TRIANGLE, buttonSequence, buttonSequenceLength, 
                                       movementSequence, movementDurations, &movementLen);
                    
                    if (movementLen > 0) {
                        mgba_printf("Right Triangle pattern detected with %d steps", movementLen);
                        rightTrianglePatternActive = 1;
                        showAccessory = 1;
                        resetButtonEffects();
                        startButtonSuccessEffect(buttonSequence, buttonSequenceLength);
                        startAutomaticMovement(player, movementLen);
                        resetButtonSequence();
                        return 1;
                    }

                    if (isLoopSequence && !squarePatternActive && !rightTrianglePatternActive) {
                        mgba_printf("5-button loop sequence but no pattern matched - ERROR!");
                        startButtonErrorEffect(buttonSequence, buttonSequenceLength);
                        resetButtonSequence();
                        return 1;
                    }
                    
                    mgba_printf("No pattern detected for 5-button sequence. Resetting.");
                    resetButtonSequence();
                }
            }
            return 0;
        }
    }
    
    return 0;
}



void startAutomaticMovement(SPRITE* player, int sequenceLength) {
    mgba_printf("startAutomaticMovement: Starting with length=%d", sequenceLength);

    for (int i = 0; i < 24; i++) {
        if (i >= sequenceLength) {
            movementSequence[i] = 0;
            movementDurations[i] = 0;
            movementTimers[i] = 0;
        }
    }
    
    automaticMovementActive = 1;
    currentMovementStep = 0;
    automaticMovementFinished = 0;
    
    showPatternSprite = 0;
    patternSpriteTimer = 0;
    shadowOAM[60].attr0 = ATTR0_HIDE;

    mgba_printf("startAutomaticMovement: Flags - active=%d, finished=%d, step=%d",
                automaticMovementActive, automaticMovementFinished, currentMovementStep);
    
    playWhooshSound();

    for (int i = 0; i < sequenceLength; i++) {
        movementTimers[i] = movementDurations[i]; 
        mgba_printf("Step %d: Timer set to %d (from movementDurations)", i, movementTimers[i]);
    }
    
    mgba_printf("Automatic movement started with %d steps", sequenceLength);
}

void updateAutomaticMovement(SPRITE* player) {
    if (!automaticMovementActive) {
        mgba_printf("updateAutoMove: NOT ACTIVE, returning");
        return;
    }

    mgba_printf("updateAutoMove: ENTER - step=%d", currentMovementStep);

    int actualSequenceLength = 0;
    for (int i = 0; i < 24; i++) {
        if (movementDurations[i] > 0) { 
            actualSequenceLength = i + 1;
        } else {
            break;
        }
    }


    mgba_printf("updateAutoMove: totalSteps=%d", actualSequenceLength);

    if (movementTimers[currentMovementStep] <= 0) {
        mgba_printf("updateAutoMove: Timer expired for step %d", currentMovementStep);
        currentMovementStep++;  
        
        mgba_printf("updateAutoMove: Incremented to step %d", currentMovementStep);
        
        if (currentMovementStep >= actualSequenceLength) {
            
            player->xVel = 0;
            player->yVel = 0;
            player->currentFrame = 0; 
            player->isAnimating = 0;
            automaticMovementActive = 0;
            automaticMovementFinished = 1;
            if (patternCompleted > 0) {
            patternSpriteTimer = 10;  
            showPatternSprite = 1;
            } else {
                showPatternSprite = 0;
                patternSpriteTimer = 0;
                shadowOAM[60].attr0 = ATTR0_HIDE;
            }
            
            if (isoscelesTrianglePatternActive && patternCompleted > 0) {
                mgba_printf("updateAutoMove: SETTING SPRITE TIMER = 300 frames");
                patternSpriteTimer = 10; 
                showPatternSprite = 1;
                
                mgba_printf("updateAutoMove: patternSpriteTimer=%d, showPatternSprite=%d", 
                           patternSpriteTimer, showPatternSprite);
            } else {
                mgba_printf("updateAutoMove: Not isosceles pattern - hiding sprite");
                showPatternSprite = 0;
                patternSpriteTimer = 0;
                shadowOAM[60].attr0 = ATTR0_HIDE;
            }

            squarePatternActive = 0;
            rightTrianglePatternActive = 0;
            return;
        } else {
            mgba_printf("updateAutoMove: Starting timer for step %d", currentMovementStep);
            movementTimers[currentMovementStep] = movementDurations[currentMovementStep];
        }
    }

    if (movementTimers[currentMovementStep] <= 0) {
        currentMovementStep++;
        if (currentMovementStep < actualSequenceLength) {
            movementTimers[currentMovementStep] = movementDurations[currentMovementStep]; 
        } else {
            player->xVel = 0;
            player->yVel = 0;
            automaticMovementActive = 0;
            automaticMovementFinished = 1;
            return;
        }
    }

    char* dirName;
    switch (movementSequence[currentMovementStep]) { 
        case MOVEMENT_LEFT: dirName = "LEFT"; break;
        case MOVEMENT_RIGHT: dirName = "RIGHT"; break;
        case MOVEMENT_UP: dirName = "UP"; break;
        case MOVEMENT_DOWN: dirName = "DOWN"; break;
        case MOVEMENT_DIAG_DOWN_RIGHT: dirName = "DIAG_DOWN_RIGHT"; break;
        case MOVEMENT_DIAG_DOWN_LEFT: dirName = "DIAG_DOWN_LEFT"; break;
        case MOVEMENT_DIAG_UP_RIGHT: dirName = "DIAG_UP_RIGHT"; break;
        case MOVEMENT_DIAG_UP_LEFT: dirName = "DIAG_UP_LEFT"; break;
        case MOVEMENT_PAUSE_LEFT: dirName = "PAUSE_LEFT"; break;
        case MOVEMENT_PAUSE_RIGHT: dirName = "PAUSE_RIGHT"; break;
        case MOVEMENT_PAUSE_UP: dirName = "PAUSE_UP"; break;
        case MOVEMENT_PAUSE_DOWN: dirName = "PAUSE_DOWN"; break;
        default: dirName = "UNKNOWN"; break;
    }
    mgba_printf("Movement step %d: %s (timer: %d)", currentMovementStep, dirName, movementTimers[currentMovementStep]);
    
    switch (movementSequence[currentMovementStep]) {  
        case MOVEMENT_LEFT:
            player->xVel = -4; player->yVel = 0;
            player->direction = MOVEMENT_LEFT; player->currentFrame = 1; 
            break;
        case MOVEMENT_RIGHT:
            player->xVel = 4; player->yVel = 0;  
            player->direction = MOVEMENT_RIGHT; player->currentFrame = 1; 
            break;
        case MOVEMENT_UP:
            player->xVel = 0; player->yVel = -4;
            player->direction = MOVEMENT_UP; player->currentFrame = 1; 
            break;
        case MOVEMENT_DOWN:
            player->xVel = 0; player->yVel = 4;
            player->direction = MOVEMENT_DOWN; player->currentFrame = 2;  
            break;
        case MOVEMENT_DIAG_DOWN_RIGHT:
            player->xVel = 3; player->yVel = 3;
            player->direction = MOVEMENT_DIAG_DOWN_RIGHT; player->currentFrame = 1;  
            break;
        case MOVEMENT_DIAG_DOWN_LEFT:
            player->xVel = -3; player->yVel = 3;
            player->direction = MOVEMENT_DIAG_DOWN_LEFT; player->currentFrame = 1;  
            break;
        case MOVEMENT_DIAG_UP_RIGHT:
            player->xVel = 3; player->yVel = -3;
            player->direction = MOVEMENT_DIAG_UP_RIGHT; player->currentFrame = 1; 
            break;
        case MOVEMENT_DIAG_UP_LEFT:
            player->xVel = -3; player->yVel = -3;
            player->direction = MOVEMENT_DIAG_UP_LEFT; player->currentFrame = 1; 
            break;
        case MOVEMENT_PAUSE_LEFT:
            player->xVel = 0;
            player->yVel = 0;
            player->direction = 2; // LEFT direction
            player->currentFrame = 1; 
            player->isAnimating = 0;
            break;
        case MOVEMENT_PAUSE_RIGHT:
            player->xVel = 0;
            player->yVel = 0;
            player->direction = 3; // RIGHT direction
            player->currentFrame = 1; 
            player->isAnimating = 0;
            break;
        case MOVEMENT_PAUSE_UP:
            player->xVel = 0;
            player->yVel = 0;
            player->direction = 1; // UP direction
            player->currentFrame = 1; 
            player->isAnimating = 0;
            break;
        case MOVEMENT_PAUSE_DOWN:
            player->xVel = 0;
            player->yVel = 0;
            player->direction = 0; // DOWN direction
            player->currentFrame = 1; 
            player->isAnimating = 0;
            break;
    }
    
    movementTimers[currentMovementStep]--;
}

int checkTileCollision(SPRITE* player) {
    return checkButtonPatterns(player);
}

void resetButtonSequence(void) {
    for (int i = 0; i < 5; i++) {
        buttonSequence[i] = -1;
    }
    buttonSequenceLength = 0;
    mgba_printf("Button sequence reset");
}

void resetCollisionSystem(void) {
    currentCollisionStep = 0;
    spriteChanged = 0;
    sequenceComplete = 0;
    squarePatternActive = 0;
    rightTrianglePatternActive = 0;
    isoscelesTrianglePatternActive = 0;

    patternCompleted = 0;
    showPatternSprite = 0;
    patternSpriteTimer = 0;

    shadowOAM[60].attr0 = ATTR0_HIDE;

    for (int i = 0; i < 5; i++) {
        buttonsCollected[i] = 0;
    }
    
    automaticMovementActive = 0;
    currentMovementStep = 0;
    automaticMovementFinished = 0;
    for (int i = 0; i < 24; i++) {
        movementSequence[i] = 0;
        movementDurations[i] = 0;
        movementTimers[i] = 0;
    }
    
    for (int i = 0; i < 5; i++) {
        buttonSequence[i] = -1;
        buttonAnimated[i] = 0;
        buttonAnimationTimer[i] = 0;
        shadowOAM[gameButtons[i].oamIndex + 5].attr0 = ATTR0_HIDE;
    }
    buttonSequenceLength = 0;
    
    for (int i = 0; i < 24; i++) {
        patternMovementSequence[i] = 0;
        patternMovementDurations[i] = 0;
    }
    patternMovementLength = 0;

    resetButtonEffects();
    
    initButtons();
}

void addButtonToSequence(int buttonIndex) {
    if (buttonSequenceLength >= 5) {
        resetButtonSequence();
    }
    
    buttonSequence[buttonSequenceLength] = buttonIndex;
    buttonSequenceLength++;
    
    mgba_printf("Added button %d to sequence. Length: %d", buttonIndex, buttonSequenceLength);
    
    buttonAnimated[buttonIndex] = 1;
    buttonAnimationTimer[buttonIndex] = 30;
}

int isAutomaticMovementFinished(void) {
    return automaticMovementFinished;
}

int isAutomaticMovementActive(void) {
    return automaticMovementActive;
}

void debugCollisionPaletteColors(void) {
    static int debugTimer = 0;
    debugTimer++;
    
    if (debugTimer >= 60) {
        
        int centerX = player.x + player.width / 2;
        int centerY = player.y + player.height / 2;
        
        for (int dy = -2; dy <= 2; dy++) {
            for (int dx = -2; dx <= 2; dx++) {
                int checkX = centerX + (dx * 8);
                int checkY = centerY + (dy * 8);
                
                if (checkX >= 0 && checkX < 256 && checkY >= 0 && checkY < 256) {
                    unsigned char color = ((unsigned char*)tempCol2Bitmap)[OFFSET(checkX, checkY, 256)];
                    
                    if (color >= 1 && color <= 12) {
                        const char* colorName;
                        switch (color) {
                            case 1: colorName = "COLLISION_1 (Horizontal Path)"; break;
                            case 2: colorName = "COLLISION_2 (Horizontal Path)"; break;
                            case 3: colorName = "COLLISION_3 (Vertical Path)"; break;
                            case 4: colorName = "COLLISION_4 (Vertical Path)"; break;
                            case 5: colorName = "COLLISION_5 (Horizontal Path)"; break;
                            case 6: colorName = "COLLISION_6 (Horizontal Path)"; break;
                            case 7: colorName = "COLLISION_7 (Vertical Path)"; break;
                            case 8: colorName = "COLLISION_8 (Vertical Path)"; break;
                            case 9: colorName = "COLLISION_9 (Vertical Path)"; break;
                            case 10: colorName = "COLLISION_10 (Vertical Path)"; break;
                            case 11: colorName = "COLLISION_11 (Vertical Path)"; break;
                            case 12: colorName = "COLLISION_12 (Vertical Path)"; break;
                            default: colorName = "UNKNOWN"; break;
                        }
                        
                        mgba_printf("Color Index %d (%s) at location (%d, %d)", 
                                   color, colorName, checkX, checkY);
                    }
                }
            }
        }
        
        debugTimer = 0;
    }
}

void debugAutomaticMovementState(void) {
    mgba_printf("=== AUTO MOVEMENT DEBUG ===");
    mgba_printf("Active: %d, Finished: %d, CurrentStep: %d", 
                automaticMovementActive, automaticMovementFinished, currentMovementStep);
    
    int hasMovement = 0;
    for (int i = 0; i < 24; i++) {
        if (movementDurations[i] > 0) {
            mgba_printf("Step %d: Movement=%d, Duration=%d, Timer=%d", 
                       i, movementSequence[i], movementDurations[i], movementTimers[i]);
            hasMovement = 1;
        }
    }
    
    if (!hasMovement) {
        mgba_printf("NO MOVEMENT SEQUENCE FOUND!");
    }
    mgba_printf("===========================");
}




