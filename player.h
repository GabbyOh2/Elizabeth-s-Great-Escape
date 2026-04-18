#ifndef PLAYER_H
#define PLAYER_H

#include "gba.h"
#include "spriteSheet.h"
#include "sprites.h"

#define PLAYER_OAM_INDEX 0
#define PLAYER_ACCESSORY_OAM_INDEX 120  

#define MAX_BULLETS 5

typedef struct {
    int x, y;
    int active;
    int speed;
    int direction; // 0=horizontal, 1=vertical
    int hflip;
    int vflip;
    int oamIndex;
    int width, height;
    int bulletSpriteIndex;
    int lifeTimer;
    int delayTimer;
} BULLET;

extern const int LEFT_FRAMES[];

void initPlayerBullets(void);
void playerShootDuringPattern(SPRITE* player);
void playerShootDuringEMPattern(SPRITE* player);
void updatePlayerBullets(void);
void drawPlayerBullets(SPRITE* player);
void resetPlayerBullets(void);

extern BULLET playerBullets[MAX_BULLETS];
extern int playerShootCooldown;
extern int playerIsShooting;
extern int playerShootTimer;

extern SPRITE player;
extern int playerSpriteBaseIndex;
extern int playerSpriteWidth;
extern int playerSpriteHeight;

extern int showAccessory;

extern int automaticMovementActive;
extern int currentMovementStep;
extern int movementSequence[];
extern int currentPatternType;

extern int cameraPanOffsetY;
extern int cameraPanActive;

extern int cameraOffsetX, cameraOffsetY;
extern int cameraTargetX, cameraTargetY;

extern int worldCameraX, worldCameraY;
extern int worldCameraTargetX, worldCameraTargetY;
extern int isCameraMoving;
extern int cameraMoveSpeed;
extern int emCameraActive;

extern int isEMPauseActive;

void initPlayer(SPRITE* player);
void updatePlayer(SPRITE* player);
void drawPlayer(SPRITE* player);

extern int playerLives;
extern int playerLivesDisplayed;
void initPlayerLives(void);
void updatePlayerLives(void);
void drawPlayerLives(void);
void loseLife(void);
void addPlayerLife(void);
void checkPlayerEnemyCollision(SPRITE* player);
void resetPlayerLivesForNewLevel(void);
extern int playerInvincible;
extern int invincibilityTimer;

void resetPlayerInvincibility(void);
void setPlayerInvincible(int duration);

void shiftCameraForEMPattern(int pauseDirection);
void resetCameraAfterEMPattern(void);
void resetCameraAfterEMPattern(void);
void returnCameraToPlayer(void);
void completeEMCameraTransition(void);

void testAccessoryVisibility(void);

#endif