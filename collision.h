#ifndef COLLISION_H
#define COLLISION_H

#include "gba.h"
#include "tempCol.h"
#include "sprites.h"

void playWhooshSound(void);

void initButtons(void);
void updateButtons(void);
void drawButtons(SPRITE* player);
extern SPRITE gameButtons[5];
extern int buttonAnimated[5];

extern int currentCollisionStep2;
extern int spriteChanged2;           
extern int sequenceComplete2;        
extern int automaticMovementActive2;
extern int automaticMovementFinished2;

extern int emPatternActive2;

extern const int BUTTON_POSITIONS_X2[5];
extern const int BUTTON_POSITIONS_Y2[5];

#define PATTERN_SQUARE 0
#define PATTERN_RIGHT_TRIANGLE 1  
#define PATTERN_ISOSCELES_TRIANGLE 2
#define PATTERN_EM 3

#define COLLISION_1 1
#define COLLISION_2 2  
#define COLLISION_3 3
#define COLLISION_4 4
#define COLLISION_5 5
#define COLLISION_6 6
#define COLLISION_7 7
#define COLLISION_8 8
#define COLLISION_9 9
#define COLLISION_10 10
#define COLLISION_11 11
#define COLLISION_12 12

#define MOVEMENT_DOWN 0
#define MOVEMENT_UP 1  
#define MOVEMENT_LEFT 2
#define MOVEMENT_RIGHT 3
#define MOVEMENT_DIAG_DOWN_RIGHT 4
#define MOVEMENT_DIAG_DOWN_LEFT 5
#define MOVEMENT_DIAG_UP_RIGHT 6
#define MOVEMENT_DIAG_UP_LEFT 7

#define MOVEMENT_PAUSE_LEFT 8
#define MOVEMENT_PAUSE_RIGHT 9
#define MOVEMENT_PAUSE_UP 10
#define MOVEMENT_PAUSE_DOWN 11

#define MAX_BULLETS 5

extern int sequenceLength;

extern int currentCollisionStep;
extern int spriteChanged;
extern int buttonsCollected[5];
extern int sequenceComplete;
extern int squarePatternActive;
extern int rightTrianglePatternActive;
extern int isoscelesTrianglePatternActive;

extern int rightTrianglePatternActive2;
extern int isoscelesTrianglePatternActive2;
extern int showAccessory2;

extern int currentCollisionStep2;
extern int spriteChanged2;           
extern int buttonsCollected2[5];
extern int sequenceComplete2;        
extern int automaticMovementActive2;
extern int automaticMovementFinished2;

extern int movementSequence2[24];
extern int movementDurations2[24];
extern int currentMovementStep2;
extern int automaticMovementActive2;
extern int emPatternActive2;

extern int emPatternSpriteTimer2;
extern int showEmPatternSprite2;
extern int emPatternSpriteIndex;
extern int patternSpriteTimer2;

extern int showPatternSprite2;

void initPatternPositions(void);
void debugAutomaticMovementState(void);
void resetButtonSequence(void);
void addButtonToSequence(int buttonIndex);
int checkTileCollision(SPRITE* player);
void resetCollisionSystem(void);
void drawButtonChar(int tilecol, int tilerow, char c);
void updateAutomaticMovement(SPRITE* player);
void startAutomaticMovement(SPRITE* player, int sequenceLength);
int isAutomaticMovementFinished(void);
extern int automaticMovementFinished;
extern int automaticMovementActive;
void debugCollisionPaletteColors();
void drawPatternSprite();
void updatePatternSpriteTimer(void);

void debugCollisionMapArea(int startX, int startY, int width, int height);
void findMovementColors(void);

void initPatternPositions2(void);
void initButtons2(void);
void updateButtons2(void);
void drawButtons2(SPRITE* player);
void startAutomaticMovement2(SPRITE* player, int sequenceLength); 
void updateAutomaticMovement2(SPRITE* player);
int checkTileCollision2(SPRITE* player);
void resetCollisionSystem2(void);
int isAutomaticMovementFinished2(void);
int isAutomaticMovementActive2(void);
void drawPatternSprite2();
void updatePatternSpriteTimer2(void);
void drawEmPatternSprite2(SPRITE* player);
void updateEmPatternSpriteTimer2(void);

void addButtonToSequence2(int buttonIndex);
void resetButtonSequence2(void);
void debugAutomaticMovementState2(void);
void debugIsoscelesSpriteState2(void);
#define NUM_BUTTONS 5
#endif