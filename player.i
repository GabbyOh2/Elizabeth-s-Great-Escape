# 0 "player.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "player.c"
# 1 "player.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
# 5 "player.h" 2
# 1 "spriteSheet.h" 1
# 22 "spriteSheet.h"
extern const unsigned short spriteSheetTiles[16384];


extern const unsigned short spriteSheetMap[1024];


extern const unsigned short spriteSheetPal[256];
# 6 "player.h" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
  int screenX, screenY;
  int x;
  int y;
  int xVel;
  int yVel;
  int width;
  int height;
  int timeUntilNextFrame;
  int direction;
  int isAnimating;
  int currentFrame;
  int numFrames;
  u8 oamIndex;
} SPRITE;
# 7 "player.h" 2






typedef struct {
    int x, y;
    int active;
    int speed;
    int direction;
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

extern BULLET playerBullets[5];
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
# 2 "player.c" 2
# 1 "collision.h" 1




# 1 "tempCol.h" 1
# 21 "tempCol.h"
extern const unsigned short tempColBitmap[32768];


extern const unsigned short tempColPal[256];
# 6 "collision.h" 2


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
# 61 "collision.h"
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
# 3 "player.c" 2

# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 5 "player.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 3 4
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 12 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 2 3 4
#pragma GCC diagnostic pop
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 6 "player.c" 2
# 1 "enemies.h" 1






# 1 "tempCol2.h" 1
# 21 "tempCol2.h"
extern const unsigned short tempCol2Bitmap[32768];


extern const unsigned short tempCol2Pal[256];
# 8 "enemies.h" 2



typedef struct {
    int x, y;
    int width, height;
    int active;
    int type;
    int killed;
    int speed;
    int xVel;
    int yVel;
    int frame;
    int animationTimer;
    int direction;
    int directionChangeCount;
    int oamIndex;
    int spawnTimer;
    int movementState;
    int collisionPath;
    int targetCollision;
    int isMovingVertically;
} ENEMY;

extern ENEMY enemies[4];
extern int enemyCount;
extern int currentLevel;

int checkCollision(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2);
void killEnemy(int enemyIndex);
void checkRightTriangleKills(SPRITE* player);
void checkSquarePatternKills(void);
void checkIsoscelesPatternKills(void);
void checkEMPatternKills(void);

void initEnemies(void);
void spawnEnemy(int x, int y, int type);
void spawnEnemyAtCollisionColor(int collisionColor, int enemyType);
void spawnEnemyAtCollisionColor2(int collisionColor, int type);
void updateEnemyMovement(SPRITE* player);
void updateEnemyMovement2(ENEMY* enemy, SPRITE* player);
void updateEnemyCollisionMovement2(ENEMY* enemy);
void updateEnemies(SPRITE* player);
void checkAndRespawnOffscreenEnemy(ENEMY* enemy, int enemyIndex);
void drawEnemies(void);
void resetEnemies();
int areAllEnemiesKilled(void);

void debugEnemyPathCollisions();
void debugCollisionMapTopArea();
# 7 "player.c" 2

SPRITE player;
int playerSpriteBaseIndex = 0;
int playerSpriteWidth = 64;
int playerSpriteHeight = 64;

int playerLives = 3;
int playerLivesDisplayed = 3;
int lifeSpriteOAMIndex = 127;

int getPlayerLives(void) {
    return playerLives;
}

int checkCollision(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2);

extern int state;

enum {
    START,
    INSTRUCTIONS,
    PLAYING,
    PAUSE,
    LOSE,
    WIN,
    PLAYING2
};

extern int automaticMovementActive;
extern int automaticMovementActive2;

extern int squarePatternActive;
extern int rightTrianglePatternActive;

extern int squarePatternActive2;
extern int rightTrianglePatternActive2;

extern int movementSequence[];
extern int movementSequence2[];
extern int currentMovementStep;
extern int currentMovementStep2;

extern int worldCameraX, worldCameraY;
extern int worldCameraTargetX, worldCameraTargetY;
extern int isCameraMoving;
extern int emCameraActive;

const int ACCESSORY_TILE = 432;
const int ACCESSORY_PALETTE = 6;

int showAccessory = 0;
int rightTrianglePatternActive = 0;
int isoscelesTrianglePatternActive = 0;
int squarePatternActive = 0;

BULLET playerBullets[5];
int playerShootCooldown = 0;
int playerIsShooting = 0;
int playerShootTimer = 0;

int worldCameraX = 0, worldCameraY = 0;
int worldCameraTargetX = 0, worldCameraTargetY = 0;
int isCameraMoving = 0;
int cameraMoveSpeed = 2;
int emCameraActive = 0;

extern int movementTimers[24];
extern int movementDurations[24];
extern int currentMovementStep;


const int DOWN_FRAMES[] = {0, 256};
const int LEFT_FRAMES[] = {8, 264, 16, 520,16};
const int UP_FRAMES[] = {512, 768};

void initPlayerLives(void) {
    playerLives = 3;
    playerLivesDisplayed = 3;
}

int playerInvincible = 0;
int invincibilityTimer = 0;


void drawPlayerLives(void) {






    for (int i = 0; i < 3; i++) {
        int lifeOAMIndex = lifeSpriteOAMIndex - i;

        if (i < playerLivesDisplayed) {
            int x = 230 - (i * (8 + 2));

            shadowOAM[lifeOAMIndex].attr0 = ((4) & 0xFF) | (0<<14) | (0<<13);
            shadowOAM[lifeOAMIndex].attr1 = ((x) & 0x1FF) | (0<<14);
            shadowOAM[lifeOAMIndex].attr2 = (((1) & 0xF) <<12) | (((0) & 3) << 10) |
                                          ((((0) * (32) + (888))) & 0x3FF);
        } else {
            shadowOAM[lifeOAMIndex].attr0 = (2<<8);
        }
    }
}

void initPlayerBullets(void) {
    mgba_printf("INIT PLAYER BULLETS: cooldown=%d, isShooting=%d",
               playerShootCooldown, playerIsShooting);
    for (int i = 0; i < 5; i++) {
        playerBullets[i].active = 0;
        playerBullets[i].oamIndex = 20 + i;
        playerBullets[i].width = 32;
        playerBullets[i].height = 32;
        playerBullets[i].bulletSpriteIndex = 28;
        playerBullets[i].lifeTimer = 0;
    }
    playerShootCooldown = 0;
    playerIsShooting = 0;
    mgba_printf("INIT COMPLETE: cooldown=%d, isShooting=%d",
               playerShootCooldown, playerIsShooting);
}

void initPlayer(SPRITE* player) {
    player->x = 150;
    player->y = 30;
    player->xVel = 0;
    player->yVel = 0;
    player->width = 64;
    player->height = 64;
    player->timeUntilNextFrame = 0;
    player->direction = 0;
    player->isAnimating = 0;
    player->currentFrame = 0;
    player->numFrames = 5;
    player->oamIndex = 0;

    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
    (*(volatile unsigned short*) 0x04000018) = 0;
    (*(volatile unsigned short*) 0x0400001A) = 0;
}

void updatePlayer(SPRITE* player) {
    static int frameCount = 0;
    frameCount++;

    mgba_printf("=== FRAME %d ===", frameCount);
    mgba_printf("Before update: dir=%d, frame=%d, isAnim=%d, xVel=%d, yVel=%d",
               player->direction, player->currentFrame, player->isAnimating,
               player->xVel, player->yVel);
    mgba_printf("Auto1: active=%d, step=%d", automaticMovementActive, currentMovementStep);
    mgba_printf("Auto2: active=%d, step=%d", automaticMovementActive2, currentMovementStep2);

    if (playerInvincible) {
        invincibilityTimer--;
        if (invincibilityTimer <= 0) {
            playerInvincible = 0;
            mgba_printf("Invincibility ended");
        }
    }

    if (automaticMovementActive2 && currentMovementStep2 < 24) {
        mgba_printf("Movement2[%d] = %d", currentMovementStep2, movementSequence2[currentMovementStep2]);
    }

    updatePlayerBullets();

    if (!playerInvincible) {
        checkPlayerEnemyCollision(player);
    }

    updatePlayerLives();

    if (!automaticMovementActive && !automaticMovementActive2) {
        player->xVel = 0;
        player->yVel = 0;

        if ((~(buttons) & ((1<<6)))) {
            player->yVel = -2;
            player->direction = 1;
            player->isAnimating = 1;
        }
        if ((~(buttons) & ((1<<7)))) {
            player->yVel = 2;
            player->direction = 0;
            player->isAnimating = 1;
        }
        if ((~(buttons) & ((1<<5)))) {
            player->xVel = -2;
            player->direction = 2;
            player->isAnimating = 1;
        }
        if ((~(buttons) & ((1<<4)))) {
            player->xVel = 2;
            player->direction = 3;
            player->isAnimating = 1;
        }

        if (player->xVel == 0 && player->yVel == 0) {
            player->isAnimating = 0;
            player->currentFrame = 0;
        }
    }

    if (player->isAnimating) {
        player->timeUntilNextFrame--;
        if (player->timeUntilNextFrame <= 0) {
            if (player->currentFrame < 4) {
            player->currentFrame++;
            } else {
                player->currentFrame = 1;
            }
            player->timeUntilNextFrame = 10;
        }
    }

    player->x += player->xVel;
    player->y += player->yVel;

    if (automaticMovementActive && currentMovementStep < 24) {

        int isPauseState = 0;
        if (movementSequence[currentMovementStep] >= 8 &&
            movementSequence[currentMovementStep] <= 11) {
            isPauseState = 1;
        }


        if (movementSequence[currentMovementStep] >= 8 &&
            movementSequence[currentMovementStep] <= 11) {
            isPauseState = 1;
        }

        static int lastSquarePattern = -1;
    if (squarePatternActive != lastSquarePattern) {
        mgba_printf("squarePatternActive CHANGED: %d -> %d", lastSquarePattern, squarePatternActive);
        lastSquarePattern = squarePatternActive;
    }

        if (squarePatternActive) {
            mgba_printf("SQUARE PATTERN ACTIVE - setting showAccessory=1");
        showAccessory = 1;
        } else if (rightTrianglePatternActive) {
            mgba_printf("RIGHT TRIANGLE PATTERN ACTIVE - setting showAccessory=1");
            showAccessory = 1;
        } else if (isoscelesTrianglePatternActive) {
            mgba_printf("ISOSCELES TRIANGLE PATTERN ACTIVE - setting showAccessory=1");
            showAccessory = 1;
        } else {
            mgba_printf("NO PATTERN ACTIVE - setting showAccessory=0");
            showAccessory = 0;
        }
        } else {
            showAccessory = 0;
        }

        if (automaticMovementActive2 && currentMovementStep2 < 24) {
        showAccessory2 = 0;

            if (emPatternActive2) {
                showAccessory2 = 1;
                mgba_printf("EM PATTERN ACTIVE - setting showAccessory2=1");
            }
            if (rightTrianglePatternActive2) {
                showAccessory2 = (movementSequence2[currentMovementStep2] == 0 ||
                                movementSequence2[currentMovementStep2] == 2 ||
                                movementSequence2[currentMovementStep2] == 3 ||
                                movementSequence2[currentMovementStep2] >= 4);
            }
            else if (isoscelesTrianglePatternActive2) {
                showAccessory2 = 1;
            }
            else if (emPatternActive2) {
                showAccessory2 = 1;
            }
    }

    int isInPauseState = 0;
    int pauseDirection = -1;

    if (automaticMovementActive && currentMovementStep < 24) {
        int movementType = movementSequence[currentMovementStep];

        mgba_printf("PAUSE CHECK: step=%d, movementType=%d", currentMovementStep, movementType);

        if (movementType >= 8 && movementType <= 11) {
            isInPauseState = 1;

            if (movementType == 8) {
                pauseDirection = 2;
            } else if (movementType == 9) {
                pauseDirection = 3;
            } else if (movementType == 10) {
                pauseDirection = 1;
            } else if (movementType == 11) {
                pauseDirection = 0;
            }

            mgba_printf("PAUSE STATE DETECTED: type=%d, dir=%d", movementType, pauseDirection);

            if (playerShootCooldown <= 0 && !playerIsShooting) {
                mgba_printf("PAUSE STATE - SHOOTING NOW! cooldown=%d, isShooting=%d",
                        playerShootCooldown, playerIsShooting);
                playerShootDuringPattern(player);
            }
            updatePlayerBullets();
        }
    }

    if (automaticMovementActive2 && currentMovementStep2 < 24) {
        int movementType = movementSequence2[currentMovementStep2];

        if (movementType == 10 || movementType == 11) {
            mgba_printf("EM PATTERN PAUSE: type=%d, cooldown=%d, isShooting=%d",
                    movementType, playerShootCooldown, playerIsShooting);

            if (emPatternActive2 && playerShootCooldown <= 0 && !playerIsShooting) {
                mgba_printf("EM PATTERN - FIRING BULLET!");
                playerShootDuringEMPattern(player);
            }
        }
    }

    updatePlayerBullets();

    if (playerIsShooting) {
        playerShootTimer--;
        if (playerShootTimer <= 0) {
            playerIsShooting = 0;
            playerShootCooldown = 5;
        }
    }

    if (playerShootCooldown > 0) {
        playerShootCooldown--;
    }

    if (isInPauseState) {

    if (playerShootCooldown <= 0 && !playerIsShooting) {
        mgba_printf("PAUSE STATE - SHOOTING NOW!");
        playerShootDuringPattern(player);
    }
}

    int isEMPause = 0;
    if (automaticMovementActive2 && currentMovementStep2 < 24) {
        int movementType = movementSequence2[currentMovementStep2];
        isEMPause = (movementType == 10 || movementType == 11);
    }

    int cameraX, cameraY;

    if (emCameraActive && emPatternActive2) {
        cameraX = worldCameraX;
        cameraY = worldCameraY;
        mgba_printf("=== EM CAMERA ACTIVE: Camera at (%d,%d) (player at %d,%d) ===",
                   cameraX, cameraY, player->x, player->y);

        player->screenX = player->x - cameraX;
        player->screenY = player->y - cameraY;
    } else {
        cameraX = player->x - 120 + 32;
        cameraY = player->y - 80 + 32;

        if (cameraX < 0) cameraX = 0;
        if (cameraX > 256 - 240) cameraX = 256 - 240;
        if (cameraY < 0) cameraY = 0;
        if (cameraY > 256 - 160) cameraY = 256 - 160;

        worldCameraX = cameraX;
        worldCameraY = cameraY;
        worldCameraTargetX = cameraX;
        worldCameraTargetY = cameraY;

        mgba_printf("Normal camera: following player at (%d,%d)", cameraX, cameraY);
        player->screenX = player->x - cameraX;
        player->screenY = player->y - cameraY;
    }



    if (player->x < -15) {
        player->x = -15;
    }

    if (player->x > 207) {
        player->x = 207;
    }

    if (player->y < 0) {
        player->y = 0;
    }

    if (player->y > 208) {
        player->y = 208;
    }

    static int debugTimer = 0;
    debugTimer++;
    if (debugTimer >= 60) {
        mgba_printf("updatePlayer: state=%d, setting BG1=%d", state, (state == PLAYING2) ? -1 : cameraX);
        debugTimer = 0;
    }

    extern int state;

     if (state == PLAYING2) {
        (*(volatile unsigned short*) 0x04000018) = cameraX;
        (*(volatile unsigned short*) 0x0400001A) = cameraY;
        (*(volatile unsigned short*) 0x04000016) = cameraY;
    } else {
        (*(volatile unsigned short*) 0x04000010) = cameraX;
        (*(volatile unsigned short*) 0x04000012) = cameraY;
        (*(volatile unsigned short*) 0x04000014) = cameraX;
        (*(volatile unsigned short*) 0x04000016) = cameraY;
        (*(volatile unsigned short*) 0x04000018) = cameraX;
        (*(volatile unsigned short*) 0x0400001A) = cameraY;
    }

    player->screenX = player->x - cameraX;
    player->screenY = player->y - cameraY;
}


void drawPlayer(SPRITE* player) {
    if (playerInvincible && (invincibilityTimer / 2) % 2 == 0) {
        shadowOAM[0].attr0 = (2<<8);

        shadowOAM[30].attr0 = (2<<8);
        shadowOAM[31].attr0 = (2<<8);
        shadowOAM[80].attr0 = (2<<8);
        shadowOAM[16].attr0 = (2<<8);
        shadowOAM[15].attr0 = (2<<8);
        shadowOAM[10].attr0 = (2<<8);
        shadowOAM[120].attr0 = (2<<8);
        shadowOAM[121].attr0 = (2<<8);

        mgba_printf("Player invisible (invincibility flash)");
        return;
    }

    if (emCameraActive && isEMPauseActive) {
        if (worldCameraY == 0 || worldCameraY == (256 - 160)) {
            mgba_printf("EM PAUSE ACTIVE - Player OFF-SCREEN, hiding everything");
            shadowOAM[0].attr0 = (2<<8);
            shadowOAM[30].attr0 = (2<<8);
            shadowOAM[31].attr0 = (2<<8);
            shadowOAM[80].attr0 = (2<<8);
            shadowOAM[16].attr0 = (2<<8);
            shadowOAM[15].attr0 = (2<<8);
            shadowOAM[10].attr0 = (2<<8);
            shadowOAM[120].attr0 = (2<<8);
            shadowOAM[121].attr0 = (2<<8);

            if (playerBullets[0].active && playerBullets[0].bulletSpriteIndex == 624) {
                int bulletScreenX = playerBullets[0].x - worldCameraX;
                int bulletScreenY = playerBullets[0].y - worldCameraY;

                if (bulletScreenX >= -16 && bulletScreenX < 240 &&
                    bulletScreenY >= -16 && bulletScreenY < 160) {

                    shadowOAM[85].attr0 = ((bulletScreenY) & 0xFF) | (0<<14) | (0<<13);
                    shadowOAM[85].attr1 = ((bulletScreenX) & 0x1FF) | (1<<14);
                    shadowOAM[85].attr2 = (((6) & 0xF) <<12) | (((1) & 3) << 10) |
                                          ((((0) * (32) + (624))) & 0x3FF);

                    mgba_printf("Drawing EM bullet 624 at screen (%d,%d)",
                               bulletScreenX, bulletScreenY);
                } else {
                    shadowOAM[85].attr0 = (2<<8);
                }
            } else {
                shadowOAM[85].attr0 = (2<<8);
            }

            return;
        }
    }

    mgba_printf("DRAW: dir=%d, frame=%d, isAnim=%d",
                player->direction, player->currentFrame, player->isAnimating);
    int frameIndex = 0;
    int hFlip = 0;

    int currentDirection = player->direction;
    int currentFrame = player->currentFrame;
    int isAnimating = player->isAnimating;

    int isPauseState = 0;
    int pauseDirection = -1;

    if (automaticMovementActive && currentMovementStep < 24) {
        switch (movementSequence[currentMovementStep]) {
            case 8:
                isPauseState = 1;
                pauseDirection = 2;
                break;
            case 9:
                isPauseState = 1;
                pauseDirection = 3;
                break;
            case 10:
                isPauseState = 1;
                pauseDirection = 1;
                break;
            case 11:
                isPauseState = 1;
                pauseDirection = 0;
                break;
        }
    }


    int isIsosceles = 0;
    if (state == PLAYING2) {
        isIsosceles = isoscelesTrianglePatternActive2 && showAccessory2;
    } else {
        isIsosceles = isoscelesTrianglePatternActive && showAccessory;
    }

    int isRightTriangle = 0;
    if (state == PLAYING2) {
        isRightTriangle = rightTrianglePatternActive2 && showAccessory2;
    } else {
        isRightTriangle = rightTrianglePatternActive && showAccessory;
    }

    int isEmPattern = 0;
    if (state == PLAYING2) {
        isEmPattern = emPatternActive2 && showAccessory2;
        mgba_printf("EM Pattern Check: active2=%d, show2=%d, result=%d",
                    emPatternActive2, showAccessory2, isEmPattern);
    }

    switch (currentDirection) {
        case 0:
            if (isAnimating || (automaticMovementActive && currentMovementStep < 24) ||
        (automaticMovementActive2 && currentMovementStep2 < 24)) {
                frameIndex = 256;
                if (currentFrame == 1) {
                    hFlip = 1;
                }
            } else {
                frameIndex = 0;
            }
            break;
        case 1:
            if (isAnimating || (automaticMovementActive && currentMovementStep < 24) ||
        (automaticMovementActive2 && currentMovementStep2 < 24)) {
                frameIndex = 768;
                if (currentFrame == 1) {
                    hFlip = 1;
                }
            } else {
                frameIndex = 512;
            }
            break;
        case 2:
            frameIndex = LEFT_FRAMES[currentFrame];
            break;
        case 3:
            frameIndex = LEFT_FRAMES[currentFrame];
            hFlip = 1;
            break;
        case 4:
        case 6:
            frameIndex = LEFT_FRAMES[currentFrame];
            hFlip = 1;
            break;
        case 5:
        case 7:
            frameIndex = LEFT_FRAMES[currentFrame];
            break;
    }


    if (isIsosceles) {
    mgba_printf("=== ISOSCELES TRIANGLE PATTERN ===");
    mgba_printf("Direction: %d, screenX: %d, screenY: %d", currentDirection, player->screenX, player->screenY);

    shadowOAM[0].attr0 = ((player->screenY) & 0xFF) | (0<<14) | (0<<13);
    shadowOAM[0].attr1 = ((player->screenX) & 0x1FF) | (3<<14) | (hFlip ? (1<<12) : 0);
    shadowOAM[0].attr2 = (((0) & 0xF) <<12) | (((1) & 3) << 10) | ((((0) * (32) + (frameIndex))) & 0x3FF);

    int accessoryX, accessoryY;

    if (currentDirection == 0) {
        accessoryX = player->screenX + 7;
        accessoryY = player->screenY + 2;
        shadowOAM[31].attr0 = ((accessoryY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[31].attr1 = ((accessoryX) & 0x1FF) | (1<<14);
        shadowOAM[31].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (624))) & 0x3FF);

    } else if (currentDirection == 1) {

        shadowOAM[31].attr0 = (2<<8);

    } else if (currentDirection == 2) {
        accessoryX = player->screenX + 8;
        accessoryY = player->screenY + 7;
        shadowOAM[31].attr0 = ((accessoryY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[31].attr1 = ((accessoryX) & 0x1FF) | (1<<14);
        shadowOAM[31].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (624))) & 0x3FF);

    } else if (currentDirection == 3) {
        accessoryX = player->screenX + 39;
        accessoryY = player->screenY + 5;
        shadowOAM[31].attr0 = ((accessoryY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[31].attr1 = ((accessoryX) & 0x1FF) | (1<<14);
        shadowOAM[31].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (624))) & 0x3FF);

    } else if (currentDirection == 4 ||
             currentDirection == 6 ||
             movementSequence[currentMovementStep] == 4 ||
             movementSequence[currentMovementStep] == 6) {

        accessoryX = player->screenX + 39;
        accessoryY = player->screenY + 6;
        shadowOAM[31].attr0 = ((accessoryY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[31].attr1 = ((accessoryX) & 0x1FF) | (1<<14);
        shadowOAM[31].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (624))) & 0x3FF);

    } else if (currentDirection == 5 ||
             currentDirection == 7 ||
             movementSequence[currentMovementStep] == 5 ||
             movementSequence[currentMovementStep] == 7) {

        accessoryX = player->screenX + 7;
        accessoryY = player->screenY + 6;
        shadowOAM[31].attr0 = ((accessoryY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[31].attr1 = ((accessoryX) & 0x1FF) | (1<<14);
        shadowOAM[31].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (624))) & 0x3FF);
    }

        shadowOAM[30].attr0 = (2<<8);
        shadowOAM[16].attr0 = (2<<8);
        shadowOAM[15].attr0 = (2<<8);
        shadowOAM[10].attr0 = (2<<8);
        shadowOAM[120].attr0 = (2<<8);
        shadowOAM[121].attr0 = (2<<8);

    }

    else if (isRightTriangle) {
        mgba_printf("=== RIGHT TRIANGLE PATTERN ===");
        mgba_printf("Direction: %d", currentDirection);

        shadowOAM[0].attr0 = ((player->screenY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[0].attr1 = ((player->screenX) & 0x1FF) | (3<<14) | (hFlip ? (1<<12) : 0);
        shadowOAM[0].attr2 = (((0) & 0xF) <<12) | (((1) & 3) << 10) | ((((0) * (32) + (frameIndex))) & 0x3FF);

        if (currentDirection == 0) {
            int accessoryX = player->screenX - 5;
            int accessoryY = player->screenY + 2;

            shadowOAM[30].attr0 = ((accessoryY) & 0xFF) | (0<<14) | (0<<13);
            shadowOAM[30].attr1 = ((accessoryX) & 0x1FF) | (2<<14);
            shadowOAM[30].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (496))) & 0x3FF);

        } else if (currentDirection == 2 || currentDirection == 3 ||
                   movementSequence[currentMovementStep] == 4 ||
                   movementSequence[currentMovementStep] == 6 ||
                   movementSequence[currentMovementStep] == 5 ||
                   movementSequence[currentMovementStep] == 7) {
            int accessoryX, accessoryY;
            int accessoryHFlip = 0;

            if (currentDirection == 3 ||
                movementSequence[currentMovementStep] == 4 ||
                movementSequence[currentMovementStep] == 6) {
                accessoryHFlip = 1;
            } else {
                accessoryHFlip = 0;
            }

            if (movementSequence[currentMovementStep] == 4 ||
                movementSequence[currentMovementStep] == 6) {
                accessoryX = player->screenX + 38;
                accessoryY = player->screenY + 13;
            } else if (movementSequence[currentMovementStep] == 5 ||
                       movementSequence[currentMovementStep] == 7) {
                accessoryX = player->screenX - 5;
                accessoryY = player->screenY + 13;
            } else if (currentDirection == 2) {
                accessoryX = player->screenX - 5;
                accessoryY = player->screenY + 13;
            } else {
                accessoryX = player->screenX + 37;
                accessoryY = player->screenY + 13;
            }

            shadowOAM[30].attr0 = ((accessoryY) & 0xFF) | (1<<14) | (0<<13);
            shadowOAM[30].attr1 = ((accessoryX) & 0x1FF) | (2<<14) | (accessoryHFlip ? (1<<12) : 0);
            shadowOAM[30].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (564))) & 0x3FF);
        } else {
            shadowOAM[30].attr0 = (2<<8);
        }

        shadowOAM[16].attr0 = (2<<8);
        shadowOAM[15].attr0 = (2<<8);
        shadowOAM[10].attr0 = (2<<8);
        shadowOAM[120].attr0 = (2<<8);
        shadowOAM[121].attr0 = (2<<8);

    }

    else if (showAccessory && (currentDirection == 2 || currentDirection == 3)) {
        mgba_printf("=== DIRECTION DEBUG ===");
        mgba_printf("currentDirection: %d", currentDirection);
        mgba_printf("player->screenX: %d, player->screenY: %d", player->screenX, player->screenY);

        int accessoryX, accessoryY;
        int accessoryHFlip = 0;

    if (currentDirection == 2) {

        accessoryX = player->screenX + 28;
        accessoryY = player->screenY + 1;
        accessoryHFlip = 0;
    } else {

        accessoryX = player->screenX + 20;
        accessoryY = player->screenY + 1;
        accessoryHFlip = 1;
    }
        shadowOAM[0].attr0 = ((accessoryY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[0].attr1 = ((accessoryX) & 0x1FF) | (1<<14);
        shadowOAM[0].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (434))) & 0x3FF);

        int accessoryX2, accessoryY2;
        int adjustedX2 = accessoryX2;
        if (currentDirection == 2) {
            accessoryX2 = player->screenX - 29;
            accessoryY2 = player->screenY;
        } else {
            accessoryX2 = player->screenX + 29;
            accessoryY2 = player->screenY;
        }

        shadowOAM[10].attr0 = ((accessoryY2) & 0xFF) | (1<<14) | (0<<13);
        shadowOAM[10].attr1 = ((accessoryX2) & 0x1FF) | (3<<14) | (accessoryHFlip ? (1<<12) : 0);
        shadowOAM[10].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (504))) & 0x3FF);

        shadowOAM[120].attr0 = ((player->screenY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[120].attr1 = ((player->screenX) & 0x1FF) | (3<<14) | (hFlip ? (1<<12) : 0);
        shadowOAM[120].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (frameIndex))) & 0x3FF);

        shadowOAM[16].attr0 = (2<<8);
        shadowOAM[15].attr0 = (2<<8);

} else if (showAccessory && (currentDirection == 0 || currentDirection == 1)) {

        int accessoryX1 = player->screenX + 11;
        int accessoryY1 = player->screenY + 2;
        int accessoryX2 = player->screenX + 37;
        int accessoryY2 = player->screenY + 2;

        shadowOAM[0].attr0 = ((accessoryY1) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[0].attr1 = ((accessoryX1) & 0x1FF) | (1<<14);
        shadowOAM[0].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (432))) & 0x3FF);

        shadowOAM[16].attr0 = ((accessoryY2) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[16].attr1 = ((accessoryX2) & 0x1FF) | (1<<14) | (1<<12);
        shadowOAM[16].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (432))) & 0x3FF);

        if (currentDirection == 0) {

            int accessoryX3 = player->screenX;
            int accessoryY3 = player->screenY + 15;

            shadowOAM[15].attr0 = ((accessoryY3) & 0xFF) | (0<<14) | (0<<13);
            shadowOAM[15].attr1 = ((accessoryX3) & 0x1FF) | (2<<14);
            shadowOAM[15].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (436))) & 0x3FF);
    } else {
        shadowOAM[15].attr0 = (2<<8);
    }
        shadowOAM[10].attr0 = (2<<8);
        shadowOAM[120].attr0 = ((player->screenY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[120].attr1 = ((player->screenX) & 0x1FF) | (3<<14);
        shadowOAM[120].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (frameIndex))) & 0x3FF);

} else if (isEmPattern) {
    mgba_printf("=== EM PATTERN ===");
    mgba_printf("Direction: %d, screenX: %d, screenY: %d", currentDirection, player->screenX, player->screenY);

    shadowOAM[0].attr0 = ((player->screenY) & 0xFF) | (0<<14) | (0<<13);
    shadowOAM[0].attr1 = ((player->screenX) & 0x1FF) | (3<<14) | (hFlip ? (1<<12) : 0);
    shadowOAM[0].attr2 = (((0) & 0xF) <<12) | (((1) & 3) << 10) | ((((0) * (32) + (frameIndex))) & 0x3FF);

    int accessoryX, accessoryY;
    int accessoryTile = 0;
    int accessoryWidth = 0;
    int accessoryHeight = 0;
    int accessoryHFlip = 0;

    if (currentDirection == 0 || currentDirection == 1 ||
    (automaticMovementActive2 && currentMovementStep2 < 24 &&
     (movementSequence2[currentMovementStep2] == 11 ||
      movementSequence2[currentMovementStep2] == 10))) {
        if (currentDirection == 0 || movementSequence2[currentMovementStep2] == 11) {
            accessoryTile = 688;
            accessoryX = player->screenX + 4;
            accessoryY = player->screenY - 1;
            accessoryWidth = (2<<14);
            accessoryHeight = (0<<14);
        } else {
            accessoryTile = 692;
            accessoryX = player->screenX + 30;
            accessoryY = player->screenY;
            accessoryWidth = (2<<14);
            accessoryHeight = (0<<14);
        }

    } else if (currentDirection == 2 || currentDirection == 3 ||
               movementSequence2[currentMovementStep2] == 6 ||
               movementSequence2[currentMovementStep2] == 4 ||
               movementSequence2[currentMovementStep2] == 7 ||
               movementSequence2[currentMovementStep2] == 5) {
        accessoryTile = 816;

        if (currentDirection == 3 ||
            movementSequence2[currentMovementStep2] == 6 ||
            movementSequence2[currentMovementStep2] == 4) {
            accessoryHFlip = 1;
            accessoryX = player->screenX - 2;
        } else {
            accessoryHFlip = 0;
            accessoryX = player->screenX + 2;
        }

        accessoryY = player->screenY - 1;
        accessoryWidth = (3<<14);
        accessoryHeight = (1<<14);
    }

    if (accessoryTile > 0) {
        shadowOAM[80].attr0 = accessoryHeight | ((accessoryY) & 0xFF) | (0<<13);
        shadowOAM[80].attr1 = accessoryWidth | ((accessoryX) & 0x1FF) | (accessoryHFlip ? (1<<12) : 0);
        shadowOAM[80].attr2 = (((6) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (accessoryTile))) & 0x3FF);
    } else {
        shadowOAM[80].attr0 = (2<<8);
    }

    shadowOAM[30].attr0 = (2<<8);
    shadowOAM[31].attr0 = (2<<8);
    shadowOAM[16].attr0 = (2<<8);
    shadowOAM[15].attr0 = (2<<8);
    shadowOAM[10].attr0 = (2<<8);
    shadowOAM[120].attr0 = (2<<8);
    shadowOAM[121].attr0 = (2<<8);
} else {
    shadowOAM[0].attr0 = ((player->screenY) & 0xFF) | (0<<14) | (0<<13);
    shadowOAM[0].attr1 = ((player->screenX) & 0x1FF) | (3<<14) | (hFlip ? (1<<12) : 0);
    shadowOAM[0].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (frameIndex))) & 0x3FF);

    shadowOAM[30].attr0 = (2<<8);
    shadowOAM[31].attr0 = (2<<8);
    shadowOAM[80].attr0 = (2<<8);
    shadowOAM[16].attr0 = (2<<8);
    shadowOAM[15].attr0 = (2<<8);
    shadowOAM[10].attr0 = (2<<8);
    shadowOAM[120].attr0 = (2<<8);
    shadowOAM[121].attr0 = (2<<8);
        }

        drawPlayerBullets(player);
        drawPatternSprite(player);
        drawPlayerLives();

}

void playerShootDuringPattern(SPRITE* player) {

    if (playerShootCooldown > 0 || playerIsShooting) {
        mgba_printf("CANNOT SHOOT: cooldown=%d, isShooting=%d",
                   playerShootCooldown, playerIsShooting);
        return;
    }

    mgba_printf("=== STARTING SHOOT SEQUENCE ===");


    playerIsShooting = 1;
    playerShootTimer = 30;

    int pauseDirection = -1;
    int pauseDuration = 20;

    if (currentMovementStep < 24) {
        int movementType = movementSequence[currentMovementStep];

        if (movementType == 8) {
            pauseDirection = 2;
        } else if (movementType == 9) {
            pauseDirection = 3;
        } else if (movementType == 10) {
            pauseDirection = 1;
        } else if (movementType == 11) {
            pauseDirection = 0;
        }
    }

    mgba_printf("PLAYER SHOOTING: direction=%d, player at (%d,%d) size=%dx%d",
               pauseDirection, player->x, player->y, player->width, player->height);

    playerBullets[0].active = 1;
    playerBullets[0].lifeTimer = pauseDuration;
    playerBullets[0].oamIndex = 20;

    for (int i = 1; i < 5; i++) {
        playerBullets[i].active = 0;
    }

    if (pauseDirection == 0) {
        playerBullets[0].x = player->x + player->width / 2 - 29;
        playerBullets[0].y = player->y + player->height - 5;
        playerBullets[0].speed = 5;
        playerBullets[0].direction = 1;
        playerBullets[0].hflip = 0;
        playerBullets[0].vflip = 0;
        playerBullets[0].bulletSpriteIndex = 156;

    } else if (pauseDirection == 1) {
        playerBullets[0].x = player->x + player->width / 2 - 16;
        playerBullets[0].y = player->y - 20;
        playerBullets[0].speed = -5;
        playerBullets[0].direction = 1;
        playerBullets[0].hflip = 0;
        playerBullets[0].vflip = 1;
        playerBullets[0].bulletSpriteIndex = 156;

    } else if (pauseDirection == 2) {
        playerBullets[0].x = player->x - 20;
        playerBullets[0].y = player->y + player->height / 2 - 29;
        playerBullets[0].speed = -5;
        playerBullets[0].direction = 0;
        playerBullets[0].hflip = 1;
        playerBullets[0].vflip = 0;
        playerBullets[0].bulletSpriteIndex = 28;

    } else if (pauseDirection == 3) {
        playerBullets[0].x = player->x + player->width + 5;
        playerBullets[0].y = player->y + player->height / 2 - 29;
        playerBullets[0].speed = 5;
        playerBullets[0].direction = 0;
        playerBullets[0].hflip = 0;
        playerBullets[0].vflip = 0;
        playerBullets[0].bulletSpriteIndex = 28;
    }

    mgba_printf("Bullet: world(%d,%d), speed=%d, dir=%d, flip=%d, sprite=%d",
               playerBullets[0].x, playerBullets[0].y,
               playerBullets[0].speed, playerBullets[0].direction,
               playerBullets[0].hflip, playerBullets[0].bulletSpriteIndex);
}

void playerShootDuringEMPattern(SPRITE* player) {
    if (playerShootCooldown > 0 || playerIsShooting) {
        return;
    }

    mgba_printf("=== EM PATTERN: SHOOTING BULLET (sprite 624) ===");

    playerIsShooting = 1;
    playerShootTimer = 30;
    playerShootCooldown = 5;

    int pauseDirection = -1;
    int pauseDuration = 20;

    if (currentMovementStep2 < 24) {
        int movementType = movementSequence2[currentMovementStep2];

        if (movementType == 10) {
            pauseDirection = 1;
        } else if (movementType == 11) {
            pauseDirection = 0;
        }
    }

    playerBullets[0].active = 1;
    playerBullets[0].lifeTimer = pauseDuration;
    playerBullets[0].oamIndex = 85;
    playerBullets[0].bulletSpriteIndex = 624;
    playerBullets[0].width = 16;
    playerBullets[0].height = 16;

    for (int i = 1; i < 5; i++) {
        playerBullets[i].active = 0;
    }

    if (pauseDirection == 0) {
        playerBullets[0].x = player->x + 6;
        playerBullets[0].y = player->y + 10;
        playerBullets[0].speed = 4;
        playerBullets[0].direction = 1;
        playerBullets[0].hflip = 0;
        playerBullets[0].vflip = 0;

    } else if (pauseDirection == 1) {
        playerBullets[0].x = player->x + 24;
        playerBullets[0].y = player->y - 20;
        playerBullets[0].speed = -4;
        playerBullets[0].direction = 1;
        playerBullets[0].hflip = 0;
        playerBullets[0].vflip = 1;

    }

    mgba_printf("EM Bullet 624: dir=%d, pos=(%d,%d), speed=%d",
               pauseDirection, playerBullets[0].x, playerBullets[0].y,
               playerBullets[0].speed);
}

void updatePlayerBullets(void) {
    static int bulletFrameCount = 0;
    bulletFrameCount++;

    mgba_printf("=== updatePlayerBullets() Frame %d ===", bulletFrameCount);

    if (playerBullets[0].active) {
        mgba_printf("Bullet[0] ACTIVE: dir=%d, speed=%d, pos=(%d,%d), lifeTimer=%d",
                   playerBullets[0].direction, playerBullets[0].speed,
                   playerBullets[0].x, playerBullets[0].y,
                   playerBullets[0].lifeTimer);

        if (playerBullets[0].direction == 0) {
            playerBullets[0].x += playerBullets[0].speed;
            mgba_printf("  Moving HORIZONTAL: x now=%d", playerBullets[0].x);
        } else {
            playerBullets[0].y += playerBullets[0].speed;
            mgba_printf("  Moving VERTICAL: y now=%d", playerBullets[0].y);
        }

        playerBullets[0].lifeTimer--;

        mgba_printf("  lifeTimer now=%d", playerBullets[0].lifeTimer);

        if (playerBullets[0].lifeTimer <= 0) {
             mgba_printf("  BULLET DESTROYED - timer expired");
            playerBullets[0].active = 0;
        }
    } else {
        mgba_printf("Bullet[0] INACTIVE");
    }

    for (int i = 1; i < 5; i++) {
        if (playerBullets[i].active) {
            playerBullets[i].active = 0;
        }
    }
}

void drawPlayerBullets(SPRITE* player) {
    int cameraX, cameraY;

    if (emCameraActive) {
        cameraX = worldCameraX;
        cameraY = worldCameraY;
    } else {
        cameraX = player->x - 120 + 32;
        cameraY = player->y - 80 + 32;

        if (cameraX < 0) cameraX = 0;
        if (cameraX > 256 - 240) cameraX = 256 - 240;
        if (cameraY < 0) cameraY = 0;
        if (cameraY > 256 - 160) cameraY = 256 - 160;
    }

    mgba_printf("=== DRAWING BULLETS (camera: %d,%d) ===", cameraX, cameraY);

    if (!playerBullets[0].active) {
        shadowOAM[playerBullets[0].oamIndex].attr0 = (2<<8);
        mgba_printf("Bullet[0]: INACTIVE, OAM %d", playerBullets[0].oamIndex);
        return;
    }

    int screenX = playerBullets[0].x - cameraX;
    int screenY = playerBullets[0].y - cameraY;

    int bulletWidth = (playerBullets[0].bulletSpriteIndex == 624) ? 16 : 32;
    int bulletHeight = (playerBullets[0].bulletSpriteIndex == 624) ? 16 : 32;

    mgba_printf("Bullet[0]: dir=%d, tile=%d, hflip=%d, vflip=%d, pos(%d,%d)",
               playerBullets[0].direction,
               playerBullets[0].bulletSpriteIndex,
               playerBullets[0].hflip,
               playerBullets[0].vflip,
               screenX, screenY);

    if (screenX < -bulletWidth || screenX > 240 ||
        screenY < -bulletHeight || screenY > 160) {
        shadowOAM[playerBullets[0].oamIndex].attr0 = (2<<8);
        return;
    }

    if (playerBullets[0].bulletSpriteIndex == 624) {

        shadowOAM[playerBullets[0].oamIndex].attr0 = ((screenY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[playerBullets[0].oamIndex].attr1 = ((screenX) & 0x1FF) | (1<<14);
    } else {

        shadowOAM[playerBullets[0].oamIndex].attr0 = ((screenY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[playerBullets[0].oamIndex].attr1 = ((screenX) & 0x1FF) | (2<<14);
    }

   u16 attr0, attr1, attr2;

    if (playerBullets[0].bulletSpriteIndex == 624) {
        attr0 = ((screenY) & 0xFF) | (0<<14) | (0<<13);
        attr1 = ((screenX) & 0x1FF) | (1<<14);
        attr2 = (((6) & 0xF) <<12) | (((1) & 3) << 10) |
               ((((0) * (32) + (playerBullets[0].bulletSpriteIndex))) & 0x3FF);
    } else {
        attr0 = ((screenY) & 0xFF) | (0<<14) | (0<<13);
        attr1 = ((screenX) & 0x1FF) | (2<<14);
        attr2 = (((2) & 0xF) <<12) | (((1) & 3) << 10) |
               ((((0) * (32) + (playerBullets[0].bulletSpriteIndex))) & 0x3FF);
    }

    if (playerBullets[0].hflip) {
        attr1 |= (1<<12);
    }
    if (playerBullets[0].vflip) {
        attr1 |= (1<<13);
    }

    shadowOAM[playerBullets[0].oamIndex].attr0 = attr0;
    shadowOAM[playerBullets[0].oamIndex].attr1 = attr1;
    shadowOAM[playerBullets[0].oamIndex].attr2 = attr2;
}

void resetPlayerBullets(void) {
    for (int i = 0; i < 5; i++) {
        playerBullets[i].active = 0;
    }
    playerShootCooldown = 0;
    playerIsShooting = 0;
}

void checkPlayerEnemyCollision(SPRITE* player) {
    if (playerInvincible) {
        return;
    }

    if (automaticMovementActive || automaticMovementActive2) {
        return;
    }

    if (playerLives <= 0) {
        return;
    }






    int playerCollisionX = player->x + 24;
    int playerCollisionY = player->y + 12;

    for (int i = 0; i < 4; i++) {
        if (!enemies[i].active) continue;

        if (checkCollision(
            playerCollisionX, playerCollisionY, 16, 40,
            enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height
        )) {
            mgba_printf("Player collided with enemy %d! Lives: %d -> %d",
                       i, playerLives, playerLives - 1);

            loseLife();

            setPlayerInvincible(20);


            enemies[i].active = 0;
            enemies[i].spawnTimer = 60;
            enemyCount--;

            break;
        }
    }
}

void loseLife(void) {
    if (playerLives > 0) {
        playerLives--;
        mgba_printf("Player lost a life! Remaining: %d", playerLives);

        setPlayerInvincible(20);

        if (playerLives <= 0) {
            mgba_printf("PLAYER HAS NO LIVES LEFT! Game Over.");
        }
    }
}

void addPlayerLife(void) {
    if (playerLives < 3) {
        playerLives++;
        playerLivesDisplayed = playerLives;
        mgba_printf("Life added! Total lives: %d", playerLives);
    }
}


void updatePlayerLives(void) {
    playerLivesDisplayed = playerLives;
}

void resetPlayerLivesForNewLevel(void) {
    playerLives = 3;
    playerLivesDisplayed = 3;
    resetPlayerInvincibility();
    mgba_printf("Player lives reset to 3 for new level");
}

void resetPlayerInvincibility(void) {
    playerInvincible = 0;
    invincibilityTimer = 0;
}

void setPlayerInvincible(int duration) {
    playerInvincible = 1;
    invincibilityTimer = duration;
    mgba_printf("Player invincibility set for %d frames", duration);
}

void testAccessoryVisibility(void) {
    static int lastTile504 = -1;
    int currentTile504 = shadowOAM[9].attr2 & 0x3FF;

    if (currentTile504 != lastTile504) {
        mgba_printf("TILE504 CHANGED: %d -> %d", lastTile504, currentTile504);
        lastTile504 = currentTile504;
    }
}
