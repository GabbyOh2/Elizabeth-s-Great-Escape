#include "collision.h"
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

#define SCREEN_WIDTH 240
    #define SCREEN_HEIGHT 160
    #define WORLD_WIDTH 256
    #define WORLD_HEIGHT 256


int rightTrianglePatternActive2 = 0;
int isoscelesTrianglePatternActive2 = 0;
int emPatternActive2 = 0;
int showAccessory2 = 0;

int currentCollisionStep2 = 0;
int spriteChanged2 = 0;
int buttonsCollected2[5] = {0, 0, 0, 0, 0};
int sequenceComplete2 = 0;

int patternCompleted2 = 0;  // 0=none, 1=isosceles pattern 1, 2=isosceles pattern 2, 3=isosceles pattern 3
int patternSpritePosX2[3]; 
int patternSpritePosY2[3]; 
int showPatternSprite2 = 0;
int patternSpriteTimer2 = 0;

int patternSpriteOAMIndex[3] = {90, 91, 92};
#define PATTERN_SPRITE_OAM_INDEX 90

int automaticMovementActive2 = 0;
int currentMovementStep2 = 0;
int movementSequence2[24] = {0}; // 0=down, 1=up, 2=left, 3=right
int movementDurations2[24] = {0}; 
int movementTimers2[24] = {0};
int automaticMovementFinished2 = 0;


extern int savedPlayerX, savedPlayerY;
int savedPlayerX = 0, savedPlayerY = 0;

int emPauseCameraY = 0;
int emPauseOriginalCameraY = 0;

int savedCameraX = 0, savedCameraY = 0;
int isEMPauseActive = 0;

int emPatternSpriteTimer2 = 0;
int showEmPatternSprite2 = 0;
int emPatternSpriteIndex = 0; 

int emPauseTypes[10] = {0}; 
int lastPauseType = 0;
int lastPauseWasUp = 0;

int buttonSequence2[6] = {-1, -1, -1, -1, -1, -1};
static int buttonSequenceLength2 = 0;
static int patternMovementSequence2[24] = {0};
static int patternMovementDurations2[24] = {0};
static int patternMovementLength2 = 0;

#define AUTO_START_X2 100 
#define AUTO_START_Y2 15

SPRITE gameButtons2[5];
int buttonAnimated2[5] = {0, 0, 0, 0, 0};
int buttonAnimationTimer2[5] = {0, 0, 0, 0, 0};

int bgHOff2 = 0;  
int bgVOff2 = 0;

const int BUTTON_POSITIONS_X2[5] = {193, 39, 192, 39, 117};
const int BUTTON_POSITIONS_Y2[5] = {47, 223, 219, 49, 128};

inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*)tempCol2Bitmap)[OFFSET(x, y, MAPWIDTH)];
}

void initPatternPositions2(void) {

    patternSpritePosX2[0] = 40;  
    patternSpritePosY2[0] = 110;
    
    patternSpritePosX2[1] = 170;  
    patternSpritePosY2[1] = 128;
    
    patternSpritePosX2[2] = 170;  
    patternSpritePosY2[2] = 128;
    
    shadowOAM[90].attr0 = ATTR0_HIDE;
    
    patternCompleted2 = 0;
    showPatternSprite2 = 0;
    patternSpriteTimer2 = 0;
    
    for (int i = 0; i < 3; i++) {
        shadowOAM[patternSpriteOAMIndex[i]].attr0 = ATTR0_HIDE;
    }
}

void drawPatternSprite2(SPRITE* player) {
    
    if (emPatternActive2) {
        mgba_printf("drawPatternSprite2: EM pattern active - hiding");
        shadowOAM[90].attr0 = ATTR0_HIDE;
        return;
    }

    if (!showPatternSprite2 || patternSpriteTimer2 <= 0 || patternCompleted2 == 0) {
        mgba_printf("drawPatternSprite2: Not drawing - show=%d, timer=%d, pattern=%d", 
                   showPatternSprite2, patternSpriteTimer2, patternCompleted2);
        shadowOAM[90].attr0 = ATTR0_HIDE;
        return;
    }
    
    int cameraX = player->x - (SCREEN_WIDTH / 2) + 32;
    int cameraY = player->y - (SCREEN_HEIGHT / 2) + 32;
    
    if (cameraX < 0) cameraX = 0;
    if (cameraY < 0) cameraY = 0;
    if (cameraX > 256 - SCREEN_WIDTH) cameraX = 256 - SCREEN_WIDTH;
    if (cameraY > 256 - SCREEN_HEIGHT) cameraY = 256 - SCREEN_HEIGHT;
    
    int patternIndex = patternCompleted2 - 1;
    int worldX = patternSpritePosX2[patternIndex];
    int worldY = patternSpritePosY2[patternIndex];
    
    int screenX = worldX - cameraX;
    int screenY = worldY - cameraY;
    
    if (screenX < -64 || screenX > SCREEN_WIDTH || 
        screenY < -64 || screenY > SCREEN_HEIGHT) {
        shadowOAM[90].attr0 = ATTR0_HIDE;
        return;
    }
    
    shadowOAM[90].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[90].attr1 = ATTR1_X(screenX) | ATTR1_LARGE;
    shadowOAM[90].attr2 = ATTR2_PALROW(7) | ATTR2_PRIORITY(0) | ATTR2_TILEID(632, 0);
    
}

void drawEmPatternSprite2(SPRITE* player) {

    if (!showEmPatternSprite2) {
        shadowOAM[95].attr0 = ATTR0_HIDE;
        return;
    }
    
    
    int worldX, worldY;

    if (patternCompleted2 == 1) {
        switch (emPatternSpriteIndex) {
            case 0: //bottom left corner of world
                worldX = 20;
                worldY = WORLD_HEIGHT - 64;
                break;
            case 1: //top left corner of world
                worldX = 20;
                worldY = 0;
                break;
            case 2: //top right corner of world
                worldX = 180;
                worldY = 0;
                break;
            case 3: //bottom right corner of world
                worldX = 180;
                worldY = WORLD_HEIGHT - 64;
                break;
            default:
                worldX = 0;
                worldY = 0;
        }
    }
    else if (patternCompleted2 == 2) {
        switch (emPatternSpriteIndex) {
            case 0: // UP - top left
                worldX = 20;
                worldY = 0;
                break;
            case 1: // UP - top right
                worldX = 180;
                worldY = 0;
                break;
            case 2: // DOWN - bottom left
                worldX = 180;
                worldY = WORLD_HEIGHT - 64;
                break;
            case 3: // DOWN - bottom right
                worldX = 20;
                worldY = WORLD_HEIGHT - 64;
                break;
            default:
                worldX = 0;
                worldY = 0;
        }
    }
    else if (patternCompleted2 == 3) {
        switch (emPatternSpriteIndex) {
            case 0: // DOWN - bottom left
                worldX = 180;
                worldY = WORLD_HEIGHT - 64;
                break;
            case 1: // DOWN - bottom right
                worldX = 20;
                worldY = WORLD_HEIGHT - 64;
                break;
            case 2: // UP - top left
                worldX = 20;
                worldY = 0;
                break;
            case 3: // UP - top right
                worldX = 180;
                worldY = 0;
                break;
            default:
                worldX = 0;
                worldY = 0;
        }
    }
    else {
        worldX = 0;
        worldY = 0;
    }
    
    int cameraX, cameraY;
    
    if (emCameraActive) {
        cameraX = worldCameraX;
        cameraY = worldCameraY;
    } else {
        cameraX = player->x - (SCREEN_WIDTH / 2) + 32;
        cameraY = player->y - (SCREEN_HEIGHT / 2) + 32;
        
        if (cameraX < 0) cameraX = 0;
        if (cameraY < 0) cameraY = 0;
        if (cameraX > WORLD_WIDTH - SCREEN_WIDTH) cameraX = WORLD_WIDTH - SCREEN_WIDTH;
        if (cameraY > WORLD_HEIGHT - SCREEN_HEIGHT) cameraY = WORLD_HEIGHT - SCREEN_HEIGHT;
    }
    
    int screenX = worldX - cameraX;
    int screenY = worldY - cameraY;
    
    if (screenX < -64 || screenX > SCREEN_WIDTH || 
        screenY < -64 || screenY > SCREEN_HEIGHT) {
        shadowOAM[95].attr0 = ATTR0_HIDE;
        mgba_printf("EM Sprite: OFF SCREEN at screen(%d,%d) - hiding", screenX, screenY);
        return;
    }
    
    mgba_printf("EM Sprite: Pattern%d, Pause%d - World(%d,%d) -> Screen(%d,%d) Camera(%d,%d)", 
                patternCompleted2, emPatternSpriteIndex + 1, 
                worldX, worldY, screenX, screenY, cameraX, cameraY);
    
    shadowOAM[95].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[95].attr1 = ATTR1_X(screenX) | ATTR1_LARGE;
    shadowOAM[95].attr2 = ATTR2_PALROW(7) | ATTR2_PRIORITY(0) | ATTR2_TILEID(632, 0);
}

void updatePatternSpriteTimer2(void) {
     if (patternSpriteTimer2 > 0) {
        patternSpriteTimer2--;
        mgba_printf("updatePatternSpriteTimer2: Timer = %d", patternSpriteTimer2);
        
        if (patternSpriteTimer2 <= 0) {
            mgba_printf("updatePatternSpriteTimer2: Timer expired - clearing isosceles pattern");
            showPatternSprite2 = 0;
            isoscelesTrianglePatternActive2 = 0; 
            patternCompleted2 = 0;
            shadowOAM[90].attr0 = ATTR0_HIDE;
        }
    }
}

void updateEmPatternSpriteTimer2(void) {
    if (automaticMovementFinished2) {
        shadowOAM[95].attr0 = ATTR0_HIDE;
        showEmPatternSprite2 = 0;
        emPatternSpriteTimer2 = 0;
        return;
    }
    
    if (emPatternActive2 && automaticMovementActive2) {
        mgba_printf("EM Pattern active - timer managed by movement system");
        return; 
    }
    
    if (emPatternSpriteTimer2 > 0) {
        emPatternSpriteTimer2--;
        mgba_printf("EM Pattern timer2: %d", emPatternSpriteTimer2);
        
        if (emPatternSpriteTimer2 <= 0) {
            mgba_printf("EM TIMER EXPIRED - Hiding EM sprite2");
            shadowOAM[95].attr0 = ATTR0_HIDE;
            showEmPatternSprite2 = 0;
        }
    }
}

void initButtons2(void) {
    for (int i = 0; i < 5; i++) {
        gameButtons2[i].oamIndex = 40 + i;
        buttonAnimated2[i] = 0;
        buttonAnimationTimer2[i] = 0;
        
    }
}

void updateButtons2(void) {
    for (int i = 0; i < 5; i++) {
        if (buttonAnimated2[i]) {
            buttonAnimationTimer2[i]--;
            if (buttonAnimationTimer2[i] <= 0) {
                buttonAnimated2[i] = 0;
            }
        }
    }
}

void drawButtons2(SPRITE* player) {
    #define WORLD_WIDTH 256
    #define WORLD_HEIGHT 256
    #define SCREEN_WIDTH 240
    #define SCREEN_HEIGHT 160
    
    int cameraX, cameraY;
    
    if (emCameraActive && emPatternActive2) {
        cameraX = worldCameraX;
        cameraY = worldCameraY;
    } else {
        cameraX = player->x - (SCREEN_WIDTH / 2) + 32;
        cameraY = player->y - (SCREEN_HEIGHT / 2) + 32;
        
        if (cameraX < 0) cameraX = 0;
        if (cameraY < 0) cameraY = 0;
        if (cameraX > WORLD_WIDTH - SCREEN_WIDTH) cameraX = WORLD_WIDTH - SCREEN_WIDTH;
        if (cameraY > WORLD_HEIGHT - SCREEN_HEIGHT) cameraY = WORLD_HEIGHT - SCREEN_HEIGHT;
    }
    
    
    for (int i = 0; i < 5; i++) {
        int screenX = BUTTON_POSITIONS_X2[i] - cameraX;
        int screenY = BUTTON_POSITIONS_Y2[i] - cameraY;
    
        if (screenX < -32 || screenX > SCREEN_WIDTH || screenY < -32 || screenY > SCREEN_HEIGHT) {
            shadowOAM[gameButtons2[i].oamIndex].attr0 = ATTR0_HIDE;
            shadowOAM[gameButtons2[i].oamIndex + 5].attr0 = ATTR0_HIDE;
            continue;
        }
        
        int paletteRow = getButtonPaletteRow(i);  
        
        int tileID = buttonAnimated2[i] ? 780 : 776;
        shadowOAM[gameButtons2[i].oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[gameButtons2[i].oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
        shadowOAM[gameButtons2[i].oamIndex].attr2 = ATTR2_PALROW(paletteRow) | ATTR2_PRIORITY(1) | ATTR2_TILEID(tileID, 0); 
         
    }
}

void debugCollisionMapArea2(int startX, int startY, int width, int height) {
    mgba_printf("Collision2 Map Area at (%d,%d):", startX, startY);
    for (int y = startY; y < startY + height; y++) {
        char line[100] = "";
        char temp[10];
        for (int x = startX; x < startX + width; x++) {
            unsigned char color = colorAt(x, y);
        }
        mgba_printf("%s", line);
    }
}

void playWhooshSound(void) {
    playSoundB(whoosh_data, whoosh_length, 0);
    mgba_printf("Playing whoosh sound!");
}

void setupRightTriangleFromSequence2(int* buttons, int length, int* movementSeq, int* movementDur, int* step) {
    mgba_printf("Right Triangle2 - Button indices: [%d,%d,%d,%d,%d]", buttons[0], buttons[1], buttons[2], buttons[3], buttons[4]);

    int foundPattern = 0;

    if (buttons[0] == 0 && buttons[1] == 4 && buttons[2] == 1 && buttons[3] == 3 && buttons[4] == 0) {
        mgba_printf("Pattern 0,4,1,3,0");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 14; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 0 && buttons[1] == 3 && buttons[2] == 1 && buttons[3] == 4 && buttons[4] == 0) {//UP DIAG
        mgba_printf("Pattern 0,3,1,4,0");
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 14; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 4 && buttons[1] == 1 && buttons[2] == 3 && buttons[3] == 0 && buttons[4] == 4) {
        mgba_printf("Pattern 4,1,3,0,4");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] =17; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 3 && buttons[1] == 0 && buttons[2] == 4 && buttons[3] == 1 && buttons[4] == 3) { //UP DIAG
        mgba_printf("Pattern 3,0,4,1,3");
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 3 && buttons[1] == 1 && buttons[2] == 4 && buttons[3] == 0 && buttons[4] == 3) {
        mgba_printf("Pattern 3,1,4,0,3");
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 1 && buttons[1] == 4 && buttons[2] == 0 && buttons[3] == 3 && buttons[4] == 1) { //UP DIAG
        mgba_printf("Pattern 1,4,0,3,1");
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 1 && buttons[1] == 3 && buttons[2] == 0 && buttons[3] == 4 && buttons[4] == 1) {
        mgba_printf("Pattern 1,3,0,4,1");
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_RIGHT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;

        foundPattern = 1;
    }
}

void setupIsoscelesTriangleMovement2(int* buttons, int length, int* movementSeq, int* movementDur, int* step) {
    int foundPattern = 0;
    patternCompleted2 = 0;

    if (buttons[0] == 4 && buttons[1] == 1 && buttons[2] == 3 && buttons[3] == 4) {
        mgba_printf("Pattern 3,4,2,1,3 - DIAG_DOWN_RIGHT x2, RIGHT, UP");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 7; (*step)++;
        
        foundPattern = 1;
        patternCompleted2 = 1;
    }
    else if (buttons[0] == 2 && buttons[1] == 4 && buttons[2] == 0 && buttons[3] == 2) {//UP DIAG
        mgba_printf("Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = MOVEMENT_DIAG_UP_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 12; (*step)++;
        
        foundPattern = 1;
        patternCompleted2 = 2;
    }
    else if (buttons[0] == 0 && buttons[1] == 4 && buttons[2] == 2 && buttons[3] == 0) {//UP DIAG
        mgba_printf("Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_LEFT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 12; (*step)++;
        
        foundPattern = 1;
        patternCompleted2 = 3;
    }
    if (foundPattern) {
        showPatternSprite2 = foundPattern;
    }
}

void setupEmMovement2(int* buttons, int length, int* movementSeq, int* movementDur, int* step) {
    int foundPattern = 0;
    patternCompleted2 = 0;

    showAccessory2 = 0; 
    showPatternSprite2 = 0; 
    showEmPatternSprite2 = 0;
    emPatternSpriteTimer2 = 0;

    for (int i = 0; i < 10; i++) {
        emPauseTypes[i] = -1;
    }
    emPatternSpriteIndex = 0;

    worldCameraX = 0;
    worldCameraY = 0;
    worldCameraTargetX = 0;
    worldCameraTargetY = 0;
    isCameraMoving = 0;
    emCameraActive = 0;

    mgba_printf("Checking pattern 1: 3,1,4,2,0,4,3");
    if (buttons[0] == 3 && buttons[1] == 1 && buttons[2] == 4 && 
        buttons[3] == 2 && buttons[4] == 0 && buttons[5] == 3) {
        mgba_printf("Pattern 3,1,4,2,0,4,3 MATCHED!");

        emPauseTypes[0] = 0;  
        emPauseTypes[1] = 1; 
        emPauseTypes[2] = 1;  
        emPauseTypes[3] = 0; 

        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 17; (*step)++;
        
        foundPattern = 1;
        patternCompleted2 = 1;
        emPatternActive2 = 1;
        showEmPatternSprite2 = 1; 
        emPatternSpriteTimer2 = 5; 
        showAccessory2 = 1;
        mgba_printf("Pattern 1 setup complete, step = %d", *step);

        for (int i = *step - 9; i < *step; i++) {
            int accessoryType = -1;
            if (movementSeq[i] == MOVEMENT_PAUSE_DOWN || movementSeq[i] == MOVEMENT_DOWN) {
                accessoryType = 688; // 32x32 for DOWN
            } else if (movementSeq[i] == MOVEMENT_PAUSE_UP || movementSeq[i] == MOVEMENT_UP) {
                accessoryType = 692; // 32x32 for UP
            } else if (movementSeq[i] == MOVEMENT_LEFT || movementSeq[i] == MOVEMENT_DIAG_UP_RIGHT || 
                       movementSeq[i] == MOVEMENT_DIAG_DOWN_RIGHT) {
                accessoryType = 816; // 64x32 for LEFT/RIGHT (with HFLIP for RIGHT)
            }
            mgba_printf("Step %d: movement=%d, accessory=%d", i, movementSeq[i], accessoryType);
            int shouldShootBullet = 0;
            if (movementSeq[i] >= MOVEMENT_PAUSE_LEFT && movementSeq[i] <= MOVEMENT_PAUSE_DOWN) {
                shouldShootBullet = 1;
                mgba_printf("Step %d: Will shoot bullet with sprite 624", i);
            }
        }
        
    }
    
    mgba_printf("Checking pattern 2: 1,4,2,0,4,3,1");
    if (buttons[0] == 1 && buttons[1] == 4 && buttons[2] == 2 && 
        buttons[3] == 0 && buttons[4] == 3 && buttons[5] == 1) {
        mgba_printf("Pattern 1,4,2,0,4,3,1 MATCHED!");
        emPauseTypes[0] = 1;  
        emPauseTypes[1] = 1;  
        emPauseTypes[2] = 0; 
        emPauseTypes[3] = 0; 

        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
        patternCompleted2 = 2;
        emPatternActive2 = 1;
        showEmPatternSprite2 = 1; 
        emPatternSpriteTimer2 = 5; 
        showAccessory2 = 1;
        
        for (int i = *step - 9; i < *step; i++) {
            int accessoryType = -1;
            if (movementSeq[i] == MOVEMENT_PAUSE_DOWN || movementSeq[i] == MOVEMENT_DOWN) {
                accessoryType = 688; // 32x32 for DOWN
            } else if (movementSeq[i] == MOVEMENT_PAUSE_UP || movementSeq[i] == MOVEMENT_UP) {
                accessoryType = 692; // 32x32 for UP
            } else if (movementSeq[i] == MOVEMENT_LEFT || movementSeq[i] == MOVEMENT_DIAG_UP_RIGHT || 
                       movementSeq[i] == MOVEMENT_DIAG_DOWN_RIGHT) {
                accessoryType = 816; // 64x32 for LEFT/RIGHT
            }
            mgba_printf("Step %d: movement=%d, accessory=%d", i, movementSeq[i], accessoryType);
            int shouldShootBullet = 0;
            if (movementSeq[i] >= MOVEMENT_PAUSE_LEFT && movementSeq[i] <= MOVEMENT_PAUSE_DOWN) {
                shouldShootBullet = 1;
                mgba_printf("Step %d: Will shoot bullet with sprite 624", i);
            }
        }
    }
    
    mgba_printf("Checking pattern 3: 0,4,3,1,4,2,0");
    if (buttons[0] == 0 && buttons[1] == 3 && buttons[2] == 1 && 
        buttons[3] == 4 && buttons[4] == 2 && buttons[5] == 0) {
        mgba_printf("Pattern 0,4,3,1,4,2,0 MATCHED!");

        emPauseTypes[0] = 0;  
        emPauseTypes[1] = 0; 
        emPauseTypes[2] = 1;  
        emPauseTypes[3] = 1; 

        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_LEFT; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DOWN; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_UP_RIGHT; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = MOVEMENT_DIAG_DOWN_RIGHT; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = MOVEMENT_PAUSE_UP; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = MOVEMENT_UP; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
        patternCompleted2 = 3;
        emPatternActive2 = 1;
        showEmPatternSprite2 = 1; 
        emPatternSpriteTimer2 = 5; 
        showAccessory2 = 1;
        
        for (int i = *step - 9; i < *step; i++) {
            int accessoryType = -1;
            if (movementSeq[i] == MOVEMENT_PAUSE_DOWN || movementSeq[i] == MOVEMENT_DOWN) {
                accessoryType = 688; // 32x32 for DOWN
            } else if (movementSeq[i] == MOVEMENT_PAUSE_UP || movementSeq[i] == MOVEMENT_UP) {
                accessoryType = 692; // 32x32 for UP
            } else if (movementSeq[i] == MOVEMENT_LEFT || movementSeq[i] == MOVEMENT_DIAG_UP_RIGHT || 
                       movementSeq[i] == MOVEMENT_DIAG_DOWN_RIGHT) {
                accessoryType = 816; // 64x32 for LEFT/RIGHT
            }
            mgba_printf("Step %d: movement=%d, accessory=%d", i, movementSeq[i], accessoryType);
            int shouldShootBullet = 0;
            if (movementSeq[i] >= MOVEMENT_PAUSE_LEFT && movementSeq[i] <= MOVEMENT_PAUSE_DOWN) {
                shouldShootBullet = 1;
                mgba_printf("Step %d: Will shoot bullet with sprite 624", i);
            }
        }
    }

    mgba_printf("setupEmMovement2 finished: foundPattern=%d, patternCompleted2=%d, showPatternSprite2=%d",
                foundPattern, patternCompleted2, showPatternSprite2);
}

void setupPatternMovement2(int patternType, int* buttonSequence, int sequenceLength, 
                         int* movementSeq, int* movementDur, int* movementLen) {
    mgba_printf("Setting up pattern movement2 for type: %d", patternType);
    
    mgba_printf("Complete button sequence2:");
    for (int i = 0; i < sequenceLength; i++) {
        mgba_printf("  Button %d: %d", i, buttonSequence[i]);
    }
    
    int step = 0;
    
    switch (patternType) {
        case PATTERN_RIGHT_TRIANGLE:  // 1
            setupRightTriangleFromSequence2(buttonSequence, sequenceLength, movementSeq, movementDur, &step);
            break;
            
        case PATTERN_ISOSCELES_TRIANGLE:  // 2
            setupIsoscelesTriangleMovement2(buttonSequence, sequenceLength, movementSeq, movementDur, &step);
            break;
            
        case PATTERN_EM:  // 3 
            setupEmMovement2(buttonSequence, sequenceLength, movementSeq, movementDur, &step);
            break;
            
        default:
            mgba_printf("Unknown pattern type: %d", patternType);
            break;
    }
    
    *movementLen = step;
    mgba_printf("Final movement2 sequence length: %d", *movementLen);
    
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
        mgba_printf("Movement2 %d: %s for %d frames", i, dirName, movementDur[i]);
    }

    mgba_printf("=== MOVEMENT2 SETUP COMPLETE ===");
    mgba_printf("Movement2 sequence length: %d", *movementLen);
    for (int i = 0; i < *movementLen; i++) {
        mgba_printf("Step %d: dir=%d, dur=%d", i, movementSeq[i], movementDur[i]);
    }
}

int checkButtonPatterns2(SPRITE* player) {
    if (automaticMovementActive2) return 0;

    int playerCenterX = player->x + 32;
    int playerCenterY = player->y + 32;
    
    for (int i = 0; i < 5; i++) {
        int buttonCenterX = BUTTON_POSITIONS_X2[i] + 16;
        int buttonCenterY = BUTTON_POSITIONS_Y2[i] + 16;
        
        if (abs(playerCenterX - buttonCenterX) < 24 && 
            abs(playerCenterY - buttonCenterY) < 24) {
            
            if (buttonSequenceLength2 == 0 || buttonSequence2[buttonSequenceLength2-1] != i) {
                mgba_printf("Collision2 with button %d", i);
                addButtonToSequence2(i);
            
                if (buttonSequenceLength2 == 4) {
                    int isLoopSequence = (buttonSequence2[0] == buttonSequence2[3]);
                    int movementLen = 0;
                    
                    rightTrianglePatternActive2 = 0;
                    isoscelesTrianglePatternActive2 = 0;
                    showAccessory2 = 0;
                    
                    setupPatternMovement2(PATTERN_ISOSCELES_TRIANGLE, buttonSequence2, buttonSequenceLength2, 
                                         movementSequence2, movementDurations2, &movementLen);
                    
                    if (movementLen > 0) {
                        mgba_printf("Isosceles Triangle pattern2 detected with %d steps", movementLen);
                        isoscelesTrianglePatternActive2 = 1;
                        showAccessory2 = 1;
                        resetButtonEffects();
                        startButtonSuccessEffect(buttonSequence2, buttonSequenceLength2);
                        startAutomaticMovement2(player, movementLen);
                        resetButtonSequence2();
                        return 1;
                    }
                    if (isLoopSequence && movementLen == 0) {
                        mgba_printf("4-button loop sequence but no isosceles pattern matched - ERROR!");
                        startButtonErrorEffect(buttonSequence2, buttonSequenceLength2);
                        resetButtonSequence2();
                        return 1;
                    }
                }
                
                if (buttonSequenceLength2 == 5) {
                    int movementLen = 0;
                    
                    rightTrianglePatternActive2 = 0;
                    isoscelesTrianglePatternActive2 = 0;
                    showAccessory2 = 0;
                    setupPatternMovement2(PATTERN_RIGHT_TRIANGLE, buttonSequence2, buttonSequenceLength2, 
                                         movementSequence2, movementDurations2, &movementLen);
                    
                    if (movementLen > 0) {
                        mgba_printf("Right Triangle pattern2 detected with %d steps", movementLen);
                        rightTrianglePatternActive2 = 1;
                        showAccessory2 = 1;
                        resetButtonEffects();
                        startButtonSuccessEffect(buttonSequence2, buttonSequenceLength2);
                        startAutomaticMovement2(player, movementLen);
                        resetButtonSequence2();
                        return 1;
                    }

                    int isLoopSequence = (buttonSequence2[0] == buttonSequence2[4]);
                    
                    if (isLoopSequence && !rightTrianglePatternActive2 && !isoscelesTrianglePatternActive2) {
                        mgba_printf("Level 2: Loop sequence but no pattern matched - showing error effect");
                        startButtonErrorEffect(buttonSequence2, buttonSequenceLength2);
                        resetButtonSequence2();
                        return 1;
                    }
                }
                
                if (buttonSequenceLength2 == 6) {
                    mgba_printf("=== CHECKING 7-BUTTON EM PATTERN ===");
                    mgba_printf("PATTERN_EM constant value is: %d", PATTERN_EM);  
                    
                    mgba_printf("Full 7-button sequence:");
                    for (int j = 0; j < 6; j++) {
                        mgba_printf("  [%d] = %d", j, buttonSequence2[j]);
                    }
                    
                    int movementLen = 0;
                    
                    rightTrianglePatternActive2 = 0;
                    isoscelesTrianglePatternActive2 = 0;
                    showAccessory2 = 0;
                    emPatternActive2 = 0;
                    
                    mgba_printf("Calling setupPatternMovement2 with PATTERN_EM=%d", PATTERN_EM);
                    setupPatternMovement2(PATTERN_EM, buttonSequence2, buttonSequenceLength2, 
                                        movementSequence2, movementDurations2, &movementLen);
                    
                    mgba_printf("After setupPatternMovement2, movementLen = %d", movementLen);
                    
                    if (movementLen > 0) {
                        mgba_printf("7-Button EM pattern2 detected with %d steps", movementLen);
                        emPatternActive2 = 1;
                        showAccessory2 = 1;
                        resetButtonEffects();
                        startButtonSuccessEffect(buttonSequence2, buttonSequenceLength2);
                        startAutomaticMovement2(player, movementLen);
                        resetButtonSequence2();
                        return 1;
                    }

                    int isLoopSequence = (buttonSequence2[0] == buttonSequence2[5]);
                    if (isLoopSequence) {
                    mgba_printf("6-button loop sequence but no EM pattern matched - ERROR!");
                    startButtonErrorEffect(buttonSequence2, buttonSequenceLength2);
                    resetButtonSequence2();
                    return 1;
                    }
                    
                    mgba_printf("No EM pattern2 detected. Resetting.");
                    resetButtonSequence2();
                }
            }
                return 0;
        }
    }
                    
        return 0;
}

void startAutomaticMovement2(SPRITE* player, int sequenceLength) {
    automaticMovementActive2 = 1;
    currentMovementStep2 = 0;
    automaticMovementFinished2 = 0;

    savedPlayerX = player->x;
    savedPlayerY = player->y;
    
    if (emPatternActive2) {
        emPatternSpriteIndex = 0;  
        mgba_printf("startAutoMove2: EM pattern active, resetting index to 0");
    }
    
    if (emPatternActive2) {
        playerBullets[0].active = 0;  
        playerShootCooldown = 0;
        playerIsShooting = 0;
    }
    
    showPatternSprite2 = 0;
    showEmPatternSprite2 = 0;
    patternSpriteTimer2 = 0;
    emPatternSpriteTimer2 = 0;

    shadowOAM[90].attr0 = ATTR0_HIDE;
    shadowOAM[95].attr0 = ATTR0_HIDE;

    mgba_printf("startAutoMove2: sequenceLength=%d", sequenceLength);
    
    playWhooshSound();

    for (int i = 0; i < sequenceLength; i++) {
        movementTimers2[i] = movementDurations2[i]; 
        mgba_printf("Step2 %d: Timer set to %d (from movementDurations2)", i, movementTimers2[i]);
    }
    
    mgba_printf("Automatic movement2 started with %d steps", sequenceLength);
}

void updateAutomaticMovement2(SPRITE* player) {
    if (!automaticMovementActive2) return;

    mgba_printf("updateAutoMove2: Step %d, emPatternSpriteIndex=%d, showEmPatternSprite2=%d, timer=%d", 
                currentMovementStep2, emPatternSpriteIndex, showEmPatternSprite2, emPatternSpriteTimer2);

    int actualSequenceLength = 0;
    for (int i = 0; i < 24; i++) {
        if (movementDurations2[i] > 0) { 
            actualSequenceLength = i + 1;
        } else {
            break;
        }
    }

    int currentStep = currentMovementStep2;
    int movementType = movementSequence2[currentStep];
    int remainingTime = movementTimers2[currentStep];
    int totalTime = movementDurations2[currentStep];

    mgba_printf("updateAutoMove2: Step=%d/%d, movement=%d, timer=%d/%d, emPatternActive2=%d", 
               currentStep, actualSequenceLength, movementType, remainingTime, totalTime, emPatternActive2);

    
    if (emPatternActive2) {
        int isPauseStep = (movementType == MOVEMENT_PAUSE_UP || movementType == MOVEMENT_PAUSE_DOWN);
        
        if (isPauseStep && remainingTime > 0) {
      
            if (remainingTime < totalTime / 2) {
                showEmPatternSprite2 = 1;
                mgba_printf("EM Pattern: Showing sprite 632 during pause #%d (timer=%d/%d)", 
                           emPatternSpriteIndex, remainingTime, totalTime);
            } else {
                showEmPatternSprite2 = 0;
            }
  
            if (remainingTime == totalTime) {
                mgba_printf("=== PAUSE START #%d - BULLET WOULD APPEAR HERE ===", emPatternSpriteIndex);
            }
            if (remainingTime == totalTime / 2) {
                mgba_printf("=== BULLET FINISHED - SPRITE 632 APPEARS NOW ===", emPatternSpriteIndex);
            }
        } else {
            showEmPatternSprite2 = 0;
        }
    }

    if (emPatternActive2 && currentStep < actualSequenceLength) {
        emCameraActive = 1; 
    
        if (movementType == MOVEMENT_PAUSE_UP || movementType == MOVEMENT_PAUSE_DOWN) {
            
            if (remainingTime == totalTime) {
                savedCameraX = player->x - 120 + 32;
                savedCameraY = player->y - 80 + 32;
                
                if (savedCameraX < 0) savedCameraX = 0;
                if (savedCameraX > 256 - 240) savedCameraX = 256 - 240;
                if (savedCameraY < 0) savedCameraY = 0;
                if (savedCameraY > 256 - 160) savedCameraY = 256 - 160;
                
                
            }
            
            else if (remainingTime < totalTime * 3/4 && remainingTime > totalTime / 4) {
                worldCameraX = savedCameraX;
                if (movementType == MOVEMENT_PAUSE_UP) {
                    worldCameraY = 0;
                } else {
                    worldCameraY = 256 - 160;
                }
            }
            
            else if (remainingTime <= totalTime * 3/4 && remainingTime > totalTime / 4) {
                
                if (worldCameraY == savedCameraY) {
                    int targetCameraY;
                    if (movementType == MOVEMENT_PAUSE_UP) {
                        targetCameraY = 0;  // TOP of map
                        mgba_printf("=== MOVING TO PAUSE_UP POSITION #%d ===", currentStep);
                    } else { // MOVEMENT_PAUSE_DOWN
                        targetCameraY = 256 - 160;  // BOTTOM of map (96)
                        mgba_printf("=== MOVING TO PAUSE_DOWN POSITION #%d ===", currentStep);
                    }
                    
                    int dy = targetCameraY - worldCameraY;
                    if (abs(dy) > 8) {
                        worldCameraY += (dy > 0) ? 8 : -8;
                    } else {
                        worldCameraY = targetCameraY;
                    }
                    
                    int newCameraX = player->x - 120 + 32;
                    if (newCameraX < 0) newCameraX = 0;
                    if (newCameraX > 256 - 240) newCameraX = 256 - 240;
                    
                    worldCameraX = newCameraX;
                    
                    isEMPauseActive = 1;
                    mgba_printf("EM Pause: Camera at (%d,%d), moving to pause Y=%d", 
                               worldCameraX, worldCameraY, targetCameraY);
                } else {
                    if (movementType == MOVEMENT_PAUSE_UP) {
                        worldCameraY = 0;
                    } else {
                        worldCameraY = 256 - 160;
                    }
                    
                    int newCameraX = player->x - 120 + 32;
                    if (newCameraX < 0) newCameraX = 0;
                    if (newCameraX > 256 - 240) newCameraX = 256 - 240;
                    worldCameraX = newCameraX;
                }
            }
            
            else if (remainingTime <= totalTime / 4 && remainingTime > 0) {
                int dx = savedCameraX - worldCameraX;
                int dy = savedCameraY - worldCameraY;
                
                if (abs(dx) > 8) worldCameraX += (dx > 0) ? 8 : -8;
                else worldCameraX = savedCameraX;
                
                if (abs(dy) > 8) worldCameraY += (dy > 0) ? 8 : -8;
                else worldCameraY = savedCameraY;
                
                mgba_printf("Pause ending: Camera at (%d,%d), moving to saved (%d,%d)", 
                           worldCameraX, worldCameraY, savedCameraX, savedCameraY);
            }
            
            else if (remainingTime == 0) {
                worldCameraX = savedCameraX;
                worldCameraY = savedCameraY;
                isEMPauseActive = 0;
                mgba_printf("Pause finished: Camera at saved position (%d,%d)", worldCameraX, worldCameraY);
            }
            else if (remainingTime > totalTime * 3/4) {
                savedCameraX = player->x - 120 + 32;
                savedCameraY = player->y - 80 + 32;
                
                if (savedCameraX < 0) savedCameraX = 0;
                if (savedCameraX > 256 - 240) savedCameraX = 256 - 240;
                if (savedCameraY < 0) savedCameraY = 0;
                if (savedCameraY > 256 - 160) savedCameraY = 256 - 160;
                
                worldCameraX = savedCameraX;
                worldCameraY = savedCameraY;
                isEMPauseActive = 0;
            }
        }
        else if (!isEMPauseActive) {
            savedCameraX = player->x - 120 + 32;
            savedCameraY = player->y - 80 + 32;
            
            if (savedCameraX < 0) savedCameraX = 0;
            if (savedCameraX > 256 - 240) savedCameraX = 256 - 240;
            if (savedCameraY < 0) savedCameraY = 0;
            if (savedCameraY > 256 - 160) savedCameraY = 256 - 160;
            
            worldCameraX = savedCameraX;
            worldCameraY = savedCameraY;
        }
    }

    if (remainingTime <= 0) {
        mgba_printf("updateAutoMove2: Timer expired for step %d", currentStep);
        currentMovementStep2++;  
        
        mgba_printf("updateAutoMove2: Incremented to step %d", currentMovementStep2);
        
        if (currentMovementStep2 >= actualSequenceLength) {
            mgba_printf("updateAutoMove2: ******** ALL STEPS COMPLETE! ********");
            
            player->xVel = 0;
            player->yVel = 0;
            automaticMovementActive2 = 0;
            automaticMovementFinished2 = 1;

            resetButtonEffects();
            
            emCameraActive = 0;
            isCameraMoving = 0;
            
            if (emPatternActive2) {
                mgba_printf("EM pattern completed - showing EM sprite");
                showPatternSprite2 = 0;  
                showEmPatternSprite2 = 0;
                
                emPatternActive2 = 0;
                showAccessory2 = 0;
                emPatternSpriteIndex = 0;
                patternCompleted2 = 0;
            } 
    else if (isoscelesTrianglePatternActive2 && patternCompleted2 > 0) {
        mgba_printf("Isosceles pattern completed - showing sprite");
        patternSpriteTimer2 = 10;
        showPatternSprite2 = 1;
        showEmPatternSprite2 = 0;  
    }
    else {
        mgba_printf("No sprite to show - clearing all");
        showPatternSprite2 = 0;
        showEmPatternSprite2 = 0;
        patternSpriteTimer2 = 0;
        emPatternSpriteTimer2 = 0;
        shadowOAM[90].attr0 = ATTR0_HIDE;
        shadowOAM[95].attr0 = ATTR0_HIDE;
        rightTrianglePatternActive2 = 0;
        isoscelesTrianglePatternActive2 = 0;
        patternCompleted2 = 0;
    }
    
    return;
}
}

    mgba_printf("updateAutoMove2: Step=%d, TotalSteps=%d", currentMovementStep2, actualSequenceLength);


    char* dirName;
    switch (movementSequence2[currentMovementStep2]) { 
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
    mgba_printf("Movement2 step %d: %s (timer: %d)", currentMovementStep2, dirName, movementTimers2[currentMovementStep2]);
    
    int currentMovement = movementSequence2[currentStep];

    switch (currentMovement) {  
        case MOVEMENT_LEFT:
            player->xVel = -4; player->yVel = 0;
            player->direction = 2; player->currentFrame = 2;
            break;
        case MOVEMENT_RIGHT:
            player->xVel = 4; player->yVel = 0;  
            player->direction = 3; player->currentFrame = 2;
            break;
        case MOVEMENT_UP:
            player->xVel = 0; player->yVel = -4;
            player->direction = 1; player->currentFrame = 1;
            break;
        case MOVEMENT_DOWN:
            player->xVel = 0; player->yVel = 4;
            player->direction = 0; player->currentFrame = 1;
            break;
        case MOVEMENT_DIAG_DOWN_RIGHT:
            player->xVel = 3; player->yVel = 3;
            player->direction = 3; player->currentFrame = 2;
            break;
        case MOVEMENT_DIAG_DOWN_LEFT:
            player->xVel = -3; player->yVel = 3;
            player->direction = 2; player->currentFrame = 2;
            break;
        case MOVEMENT_DIAG_UP_RIGHT:
            player->xVel = 3; player->yVel = -3;
            player->direction = 3; player->currentFrame = 2;
            break;
        case MOVEMENT_DIAG_UP_LEFT:
            player->xVel = -3; player->yVel = -3;
            player->direction = 2; player->currentFrame = 2;
            break;
        case MOVEMENT_PAUSE_UP:
            player->xVel = 0;
            player->yVel = 0;
            player->direction = 1; // UP direction
            player->currentFrame = 1; 
            player->isAnimating = 0;
            if (remainingTime == totalTime) {
                mgba_printf("=== STARTING PAUSE_UP #%d ===", emPatternSpriteIndex);
            }
            
            if (remainingTime == totalTime / 2) {
                mgba_printf("=== MIDDLE OF PAUSE_UP #%d - BULLET DONE, SPRITE APPEARS ===", emPatternSpriteIndex);
            }
            
            if (remainingTime == 0) {
                mgba_printf("=== ENDING PAUSE_UP #%d ===", emPatternSpriteIndex);
                if (emPatternSpriteIndex < 3) {
                    emPatternSpriteIndex++;
                    mgba_printf("Moving to next pause index: %d", emPatternSpriteIndex);
                }
            }
            break;
        case MOVEMENT_PAUSE_DOWN:
            mgba_printf("=== MOVEMENT_PAUSE_DOWN ENTERED ===");
    mgba_printf("  remainingTime=%d, totalTime=%d, index=%d", 
                remainingTime, totalTime, emPatternSpriteIndex);
            player->xVel = 0;
            player->yVel = 0;
            player->direction = 0;
            player->currentFrame = 1; 
            player->isAnimating = 0;
            if (remainingTime == totalTime) {
                mgba_printf("=== STARTING PAUSE_DOWN #%d ===", emPatternSpriteIndex);
            }
            
            if (remainingTime == totalTime / 2) {
                mgba_printf("=== MIDDLE OF PAUSE_DOWN #%d - BULLET DONE, SPRITE APPEARS ===", emPatternSpriteIndex);
            }
            
            if (remainingTime == 0) {
                mgba_printf("=== ENDING PAUSE_DOWN #%d ===", emPatternSpriteIndex);
                if (emPatternSpriteIndex < 3) {
                    emPatternSpriteIndex++;
                    mgba_printf("Moving to next pause index: %d", emPatternSpriteIndex);
                }
            }
            break;
    }
    
    movementTimers2[currentMovementStep2]--;
}

int checkTileCollision2(SPRITE* player) {
    return checkButtonPatterns2(player);
}

void resetButtonSequence2(void) {
    for (int i = 0; i < 6; i++) {
        buttonSequence2[i] = -1;
    }
    buttonSequenceLength2 = 0;
    mgba_printf("Button sequence2 reset");
}

void resetCollisionSystem2(void) {
    
    currentCollisionStep2 = 0;
    spriteChanged2 = 0;
    sequenceComplete2 = 0;
    for (int i = 0; i < 5; i++) {
        buttonsCollected2[i] = 0;
    }
    
    rightTrianglePatternActive2 = 0;
    isoscelesTrianglePatternActive2 = 0;
    emPatternActive2 = 0;
    showAccessory2 = 0;

    patternCompleted2 = 0;
    showPatternSprite2 = 0;
    patternSpriteTimer2 = 0;

    emPauseCameraY = 0;
    emPauseOriginalCameraY = 0;
    savedPlayerX = 0;
    savedPlayerY = 0;

    savedCameraX = 0;
    savedCameraY = 0;
    isEMPauseActive = 0;
    emCameraActive = 0;
    isCameraMoving = 0;

    showEmPatternSprite2 = 0;
    emPatternSpriteTimer2 = 0;
    emPatternSpriteIndex = 0;

    for (int i = 0; i < 10; i++) {
        emPauseTypes[i] = 0;
    }
    lastPauseType = 0;
    lastPauseWasUp = 0;
    
    shadowOAM[90].attr0 = ATTR0_HIDE;  
    shadowOAM[91].attr0 = ATTR0_HIDE;  
    shadowOAM[92].attr0 = ATTR0_HIDE;  
    shadowOAM[95].attr0 = ATTR0_HIDE;  

    automaticMovementActive2 = 0;
    currentMovementStep2 = 0;
    automaticMovementFinished2 = 0;
    for (int i = 0; i < 24; i++) {
        movementSequence2[i] = 0;
        movementDurations2[i] = 0;
        movementTimers2[i] = 0;
    }
    
    for (int i = 0; i < 6; i++) { 
        buttonSequence2[i] = -1;
        if (i < 5) { 
            buttonAnimated2[i] = 0;
            buttonAnimationTimer2[i] = 0;
            shadowOAM[gameButtons2[i].oamIndex + 5].attr0 = ATTR0_HIDE;
        }
    }
    buttonSequenceLength2 = 0;
    
    for (int i = 0; i < 24; i++) {
        patternMovementSequence2[i] = 0;
        patternMovementDurations2[i] = 0;
    }
    patternMovementLength2 = 0;
    resetButtonEffects();
    initButtons2();
}

void addButtonToSequence2(int buttonIndex) {
    if (buttonSequenceLength2 >= 6) {
        resetButtonSequence2();
    }
    
    buttonSequence2[buttonSequenceLength2] = buttonIndex;
    buttonSequenceLength2++;
    
    mgba_printf("Added button2 %d to sequence. Length: %d", buttonIndex, buttonSequenceLength2);
    
    buttonAnimated2[buttonIndex] = 1;
    buttonAnimationTimer2[buttonIndex] = 30;
}

int isAutomaticMovementFinished2(void) {
    return automaticMovementFinished2;
}

int isAutomaticMovementActive2(void) {
    return automaticMovementActive2;
}

void debugIsoscelesSpriteState2(void) {
    static int lastPatternCompleted = -1;
    static int lastIsoscelesActive = -1;
    
    if (patternCompleted2 != lastPatternCompleted) {
        mgba_printf("PATTERN COMPLETED2 CHANGED: %d -> %d", lastPatternCompleted, patternCompleted2);
        lastPatternCompleted = patternCompleted2;
    }
    
    if (isoscelesTrianglePatternActive2 != lastIsoscelesActive) {
        mgba_printf("ISOSCELES ACTIVE2 CHANGED: %d -> %d", lastIsoscelesActive, isoscelesTrianglePatternActive2);
        lastIsoscelesActive = isoscelesTrianglePatternActive2;
    }
}

void debugAutomaticMovementState2(void) {
    mgba_printf("=== AUTO MOVEMENT2 DEBUG ===");
    mgba_printf("Active: %d, Finished: %d, CurrentStep: %d", 
                automaticMovementActive2, automaticMovementFinished2, currentMovementStep2);
    
    int hasMovement = 0;
    for (int i = 0; i < 24; i++) {
        if (movementDurations2[i] > 0) {
            mgba_printf("Step2 %d: Movement=%d, Duration=%d, Timer=%d", 
                       i, movementSequence2[i], movementDurations2[i], movementTimers2[i]);
            hasMovement = 1;
        }
    }
    
    if (!hasMovement) {
        mgba_printf("NO MOVEMENT2 SEQUENCE FOUND!");
    }
    mgba_printf("===========================");
}

void debugPlayerCollisionBox2(SPRITE* player) {
    int collisionWidth = 16;
    int collisionHeight = 32;
    int collisionLeft = player->x + 24;
    int collisionTop = player->y + 16;
    
    mgba_printf("=== PLAYER2 COLLISION BOX ===");
    mgba_printf("Player2 pos: (%d,%d)", player->x, player->y);
    mgba_printf("Collision2 box: (%d,%d) to (%d,%d) size %dx%d", 
                collisionLeft, collisionTop, 
                collisionLeft + collisionWidth, collisionTop + collisionHeight,
                collisionWidth, collisionHeight);
    
    unsigned char colorTL = colorAt(collisionLeft, collisionTop);
    unsigned char colorTR = colorAt(collisionLeft + collisionWidth, collisionTop);
    unsigned char colorBL = colorAt(collisionLeft, collisionTop + collisionHeight);
    unsigned char colorBR = colorAt(collisionLeft + collisionWidth, collisionTop + collisionHeight);
    
    mgba_printf("Collision2 box colors: [TL:%d, TR:%d, BL:%d, BR:%d]", 
                colorTL, colorTR, colorBL, colorBR);
    mgba_printf("============================");
}