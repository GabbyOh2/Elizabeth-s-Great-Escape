# 0 "main.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
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
# 4 "main.c" 2
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
# 5 "main.c" 2
# 1 "START.h" 1
# 21 "START.h"
extern const unsigned short STARTBitmap[19200];


extern const unsigned short STARTPal[256];
# 6 "main.c" 2
# 1 "INSTRUCTIONS.h" 1
# 21 "INSTRUCTIONS.h"
extern const unsigned short INSTRUCTIONSBitmap[19200];


extern const unsigned short INSTRUCTIONSPal[256];
# 7 "main.c" 2
# 1 "PAUSED.h" 1
# 21 "PAUSED.h"
extern const unsigned short PAUSEDBitmap[19200];


extern const unsigned short PAUSEDPal[256];
# 8 "main.c" 2
# 1 "Background1.h" 1
# 22 "Background1.h"
extern const unsigned short Background1Tiles[8224];


extern const unsigned short Background1Map[1024];


extern const unsigned short Background1Pal[256];
# 9 "main.c" 2
# 1 "tempCol.h" 1
# 21 "tempCol.h"
extern const unsigned short tempColBitmap[32768];


extern const unsigned short tempColPal[256];
# 10 "main.c" 2
# 1 "tempCol2.h" 1
# 21 "tempCol2.h"
extern const unsigned short tempCol2Bitmap[32768];


extern const unsigned short tempCol2Pal[256];
# 11 "main.c" 2
# 1 "player.h" 1




# 1 "spriteSheet.h" 1
# 22 "spriteSheet.h"
extern const unsigned short spriteSheetTiles[16384];


extern const unsigned short spriteSheetMap[1024];


extern const unsigned short spriteSheetPal[256];
# 6 "player.h" 2







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
# 12 "main.c" 2
# 1 "enemies.h" 1
# 11 "enemies.h"
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
# 13 "main.c" 2
# 1 "bosses.h" 1
# 14 "bosses.h"
typedef struct {
    int x, y;
    int width, height;
    int active;
    int speed;
    int direction;
    int oamIndex;
    int hflip;
} BOSS_BULLET;

typedef struct {
    int x, y;
    int width, height;
    int active;
    int type;
    int speed;
    int xVel;
    int yVel;
    int frame;
    int animationTimer;
    int direction;
    int oamIndex;
    int movementState;
    int collisionPath;
    int targetCollision;
    int spawnTimer;
    int isShooting;
    int shootTimer;
    int shootCooldown;
    int level;
    int hflip;
    BOSS_BULLET bullets[5];
} BOSS;

extern BOSS boss;
extern int currentLevel;

extern void bossShootAtPlayer(BOSS* boss, SPRITE* player);
extern void updateBossBullets(BOSS* boss);
extern void drawBossBullets(BOSS* boss);


void initBoss(void);
void spawnBossLevel1(void);
void spawnBossLevel2(void);
void updateBoss(SPRITE* player);
void updateBossCollisionMovementLevel1(BOSS* boss, SPRITE* player);
void updateBossCollisionMovementLevel2(BOSS* boss, SPRITE* player);
void drawBoss(void);
void resetBoss(void);
void bossShootAtPlayer(BOSS* boss, SPRITE* player);
void updateBossBullets(BOSS* boss);
void drawBossBullets(BOSS* boss);
void resetBossBullets(BOSS* boss);
# 14 "main.c" 2

# 1 "collision.h" 1







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
# 16 "main.c" 2
# 1 "LOSE.h" 1
# 21 "LOSE.h"
extern const unsigned short LOSEBitmap[19200];


extern const unsigned short LOSEPal[256];
# 17 "main.c" 2
# 1 "WIN.h" 1
# 21 "WIN.h"
extern const unsigned short WINBitmap[19200];


extern const unsigned short WINPal[256];
# 18 "main.c" 2
# 1 "Background2.h" 1
# 22 "Background2.h"
extern const unsigned short Background2Tiles[3888];


extern const unsigned short Background2Map[1024];


extern const unsigned short Background2Pal[256];
# 19 "main.c" 2
# 1 "Background2Scrolling.h" 1
# 22 "Background2Scrolling.h"
extern const unsigned short Background2ScrollingTiles[4544];


extern const unsigned short Background2ScrollingMap[1024];


extern const unsigned short Background2ScrollingPal[256];
# 20 "main.c" 2
# 1 "parallax1.h" 1
# 22 "parallax1.h"
extern const unsigned short parallax1Tiles[7920];


extern const unsigned short parallax1Map[1024];


extern const unsigned short parallax1Pal[256];
# 21 "main.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 22 "main.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 229 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4

# 229 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 344 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 160 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 374 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 52 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 90 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 131 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 147 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 158 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef long __daddr_t;



typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;







typedef __builtin_va_list __va_list;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

typedef uint32_t _COND_T;
# 27 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 3
static inline void __libc_lock_init(_LOCK_T *lock) {
        *lock = ((_LOCK_T)0);
}

static inline void __libc_lock_close(_LOCK_T *lock ) {}

static inline void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock) {
        *lock = ((_LOCK_RECURSIVE_T){((_LOCK_T)0),0,0});
}

static inline void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock ) {}

extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);


static inline int __libc_cond_init(_COND_T *cond) {
        *cond = ((_COND_T)0);
}

extern int __libc_cond_signal(_COND_T *cond);
extern int __libc_cond_broadcast(_COND_T *cond);
extern int __libc_cond_wait(_COND_T *cond, _LOCK_T *lock, uint64_t timeout_ns);
extern int __libc_cond_wait_recursive(_COND_T *cond, _LOCK_RECURSIVE_T *lock, uint64_t timeout_ns);
# 36 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
typedef _LOCK_RECURSIVE_T _flock_t;







struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 99 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 116 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 153 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  _ssize_t (*_read) (struct _reent *, void *,
        char *, size_t);
  _ssize_t (*_write) (struct _reent *, void *,
         const char *,
         size_t);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 270 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



extern __FILE __sf[3];

struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};

extern struct _glue __sglue;
# 306 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 580 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];




  struct __locale_t *_locale;





  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {



          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
# 649 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
   char _getlocalename_l_buf[32 ];
        } _reent;







    } _new;







  void (**_sig_func)(int);

  void *deviceData;
};
# 801 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;





extern struct _reent _impure_data ;





  struct _reent * __getreent (void);
# 921 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _atexit *__atexit;
extern struct _atexit __atexit0;

extern void (*__stdio_exit_handler) (void);

void _reclaim_reent (struct _reent *);

extern int _fwalk_sglue (struct _reent *, int (*)(struct _reent *, __FILE *),
    struct _glue *);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);



char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 137 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 159 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 191 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 202 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 225 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 265 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 286 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 324 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 341 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 23 "main.c" 2
# 1 "digitalSound.h" 1




# 4 "digitalSound.h"
void setupSounds();
void setupSoundInterrupts();
void interruptHandler();

void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 52 "digitalSound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

extern SOUND soundA;
extern SOUND soundB;
# 24 "main.c" 2
# 1 "KatsuraTheme.h" 1


extern const unsigned int KatsuraTheme_sampleRate;
extern const unsigned int KatsuraTheme_length;
extern const signed char KatsuraTheme_data[];
# 25 "main.c" 2
# 1 "Madao.h" 1


extern const unsigned int Madao_sampleRate;
extern const unsigned int Madao_length;
extern const signed char Madao_data[];
# 26 "main.c" 2
# 1 "intro1.h" 1


extern const unsigned int intro1_sampleRate;
extern const unsigned int intro1_length;
extern const signed char intro1_data[];
# 27 "main.c" 2
# 1 "hata.h" 1


extern const unsigned int hata_sampleRate;
extern const unsigned int hata_length;
extern const signed char hata_data[];
# 28 "main.c" 2
# 1 "boss.h" 1


extern const unsigned int boss_sampleRate;
extern const unsigned int boss_length;
extern const signed char boss_data[];
# 29 "main.c" 2
# 1 "buttonEffects.h" 1
# 13 "buttonEffects.h"
typedef struct {
    int paletteRow;
    int effectTimer;
    int isShowingEffect;
    int effectType;
} BUTTON_EFFECT;

void initButtonEffects(void);
void updateButtonEffects(void);
void startButtonSuccessEffect(int* buttonSequence, int sequenceLength);
void startButtonErrorEffect(int* buttonSequence, int sequenceLength);
void resetButtonEffects(void);
int shouldUseEffectPalette(int buttonIndex);
int getButtonPaletteRow(int buttonIndex);
# 30 "main.c" 2
# 1 "space1.h" 1
# 21 "space1.h"
extern const unsigned short space1Bitmap[19200];


extern const unsigned short space1Pal[256];
# 31 "main.c" 2
# 1 "space2.h" 1
# 21 "space2.h"
extern const unsigned short space2Bitmap[19200];


extern const unsigned short space2Pal[256];
# 32 "main.c" 2
# 1 "space3.h" 1
# 21 "space3.h"
extern const unsigned short space3Bitmap[19200];


extern const unsigned short space3Pal[256];
# 33 "main.c" 2
# 1 "space4.h" 1
# 21 "space4.h"
extern const unsigned short space4Bitmap[19200];


extern const unsigned short space4Pal[256];
# 34 "main.c" 2
# 1 "space5.h" 1
# 21 "space5.h"
extern const unsigned short space5Bitmap[19200];


extern const unsigned short space5Pal[256];
# 35 "main.c" 2
# 1 "alarm1.h" 1
# 21 "alarm1.h"
extern const unsigned short alarm1Bitmap[19200];


extern const unsigned short alarm1Pal[256];
# 36 "main.c" 2
# 1 "alarm2.h" 1
# 21 "alarm2.h"
extern const unsigned short alarm2Bitmap[19200];


extern const unsigned short alarm2Pal[256];
# 37 "main.c" 2
# 1 "alarm3.h" 1
# 21 "alarm3.h"
extern const unsigned short alarm3Bitmap[19200];


extern const unsigned short alarm3Pal[256];
# 38 "main.c" 2
# 1 "alarm4.h" 1
# 21 "alarm4.h"
extern const unsigned short alarm4Bitmap[19200];


extern const unsigned short alarm4Pal[256];
# 39 "main.c" 2
# 1 "alarm5.h" 1
# 21 "alarm5.h"
extern const unsigned short alarm5Bitmap[19200];


extern const unsigned short alarm5Pal[256];
# 40 "main.c" 2
# 1 "prince1.h" 1
# 21 "prince1.h"
extern const unsigned short prince1Bitmap[19200];


extern const unsigned short prince1Pal[256];
# 41 "main.c" 2
# 1 "prince2.h" 1
# 21 "prince2.h"
extern const unsigned short prince2Bitmap[19200];


extern const unsigned short prince2Pal[256];
# 42 "main.c" 2
# 1 "prince3.h" 1
# 21 "prince3.h"
extern const unsigned short prince3Bitmap[19200];


extern const unsigned short prince3Pal[256];
# 43 "main.c" 2
# 1 "prince4.h" 1
# 21 "prince4.h"
extern const unsigned short prince4Bitmap[19200];


extern const unsigned short prince4Pal[256];
# 44 "main.c" 2

unsigned short buttons;
unsigned short oldButtons;

int previousState;

extern SOUND soundA;

extern int automaticMovementActive;
extern int currentMovementStep;
extern int currentMovementStep2;
extern int sequenceComplete;

int currentMusic = -1;







int returningFromPause = 0;

int currentLevel = 1;

void updateMusicForState();
void start();
void goToStart();

void instructions();
void goToInstructions();

void goToCutscene(int returnState);
void cutscene();
void updateCutscene();
void drawCutscene();

void goToMode0Cutscene();
void mode0Cutscene();
void updateMode0Cutscene();
void drawMode0Cutscene();

void playing();
void goToPlaying();

void princeCutscene();
void goToPrinceCutscene();
void updatePrinceCutscene();
void drawPrinceCutscene();

void pause();
void goToPause();

void lose();
void goToLose();

void win();
void goToWin();

void playing2();
void goToPlaying2();

void boss2();
void goToBoss2();

void initialize();

void drawGame();

void checkScrollCorruption();

void checkLevelSkip();
void updateCamera(void);



enum {
    START,
    INSTRUCTIONS,
    PLAYING,
    PAUSE,
    LOSE,
    WIN,
    PLAYING2,
    CUTSCENE,
    MODE0_CUTSCENE,
    PRINCE_CUTSCENE
};

int state;

int mode0CutsceneTimer = 0;
int playerWalkX = -64;
const int PLAYER_WALK_TARGET_X = 240;
const int PLAYER_WALK_SPEED = 2;
int playerWalkY = 80;

int cutsceneFrame = 0;
int cutsceneTimer = 0;
const int CUTSCENE_FRAME_DURATION = 15;
const int TOTAL_CUTSCENE_FRAMES = 10;

const unsigned short* cutscenePalette = alarm5Pal;

const unsigned short* cutsceneImages[10] = {
    space1Bitmap,
    space2Bitmap,
    space3Bitmap,
    space4Bitmap,
    space5Bitmap,
    alarm1Bitmap,
    alarm2Bitmap,
    alarm3Bitmap,
    alarm4Bitmap,
    alarm5Bitmap
};

int princeCutsceneTimer = 0;
int princeCutsceneFrame = 0;
const int PRINCE_CUTSCENE_FRAME_DURATION = 30;
const int TOTAL_PRINCE_FRAMES = 4;

const unsigned short* princeImages[4] = {
    prince1Bitmap,
    prince2Bitmap,
    prince3Bitmap,
    prince4Bitmap
};

const unsigned short* princePalette = prince1Pal;

int returnAfterCutscene = START;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        updateMusicForState();

        switch (state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case PLAYING:
                playing();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
            case WIN:
                win();
                break;
            case PLAYING2:
                playing2();
                break;
            case CUTSCENE:
                cutscene();
                break;
            case MODE0_CUTSCENE:
                mode0Cutscene();
                break;
            case PRINCE_CUTSCENE:
                princeCutscene();
                break;
        }

        checkScrollCorruption();
        debugCollisionMapTopArea();

        if (state == PLAYING || state == PLAYING2) {
            drawGame();
        }

        waitForVBlank();
    }
}

void setupInterrupts() {
    setupSoundInterrupts();
}

void initialize() {
    mgba_open();
    initPlayer(&player);
    initPlayerBullets();
    initPlayerLives();
    initEnemies();
    initBoss();
    hideSprites();

    resetCollisionSystem();
    resetCollisionSystem2();
    initButtons();
    initButtons2();

    initButtonEffects();

    setupSounds();
    setupSoundInterrupts();

    goToStart();
}

void playMusic(int musicType, int loop) {
    if (musicType == currentMusic) {
        return;
    }

    stopSounds();
    currentMusic = musicType;

    switch(musicType) {
        case 0:
            playSoundA(KatsuraTheme_data, KatsuraTheme_length, loop);
            break;
        case 1:
            playSoundA(boss_data, boss_length, loop);
            break;
         case 2:
            playSoundA(Madao_data, Madao_length, loop);
            mgba_printf("Playing: Madao Theme (loop: %d)", loop);
            break;
        case 3:
            playSoundA(intro1_data, intro1_length, loop);
            mgba_printf("Playing: Intro Theme (loop: %d)", loop);
            break;
        case 4:
            playSoundA(hata_data, hata_length, loop);
            mgba_printf("Playing: Hata Sound (loop: %d)", loop);
            break;
        case -1:
            currentMusic = -1;
            break;
    }
}

void updateMusicForState() {
    switch(state) {
        case PLAYING:
        case PLAYING2:
            playMusic(0, 1);
            break;
        case START:
            playMusic(2, 1);
            break;
        case CUTSCENE:
        case MODE0_CUTSCENE:
            playMusic(3, 0);
            break;
        case PRINCE_CUTSCENE:
            playMusic(4, 1);
            break;
        case INSTRUCTIONS:
        case PAUSE:
            break;
        case LOSE:
        case WIN:
            playMusic(-1, 0);
            break;
    }
}

void stopMadaoForCutscene() {
    if (currentMusic == 2) {
        stopSounds();
        currentMusic = -1;
        mgba_printf("Stopped Madao for cutscene");
    }
}

void togglePaletteRows() {
    static int redTileMode_PLAYING = 0;
    static int redTileMode_PLAYING2 = 0;
    static unsigned short originalTile10_PLAYING[16];
    static unsigned short originalTile10_PLAYING2[16];

    if ((!(~(oldButtons) & ((1<<9))) && (~(buttons) & ((1<<9))))) {
        if (playerLives < 3) {
            addPlayerLife();
            playerLives++;
            mgba_printf("LSHOULDER pressed: Life added! Lives now: %d", playerLives);

            if (state == PLAYING) {
                for (int i = 0; i < 1024; i++) {
                    ((SB*) 0x6000000)[26].tilemap[i] = (((SB*) 0x6000000)[26].tilemap[i] & 0x0FFF) | (0 << 12);
                }

                volatile unsigned short* cb = (unsigned short*)&((CB*) 0x6000000)[2];
                if (redTileMode_PLAYING) {
                    for (int i = 0; i < 16; i++) {
                        cb[16 * 10 + i] = originalTile10_PLAYING[i];
                    }
                    redTileMode_PLAYING = 0;
                    mgba_printf("Restored original tile 10 for PLAYING");
                }

            } else if (state == PLAYING2) {
                for (int i = 0; i < 1024; i++) {
                    ((SB*) 0x6000000)[28].tilemap[i] = (((SB*) 0x6000000)[28].tilemap[i] & 0x0FFF) | (0 << 12);
                    ((SB*) 0x6000000)[29].tilemap[i] = (((SB*) 0x6000000)[29].tilemap[i] & 0x0FFF) | (0 << 12);
                }

                volatile unsigned short* cb = (unsigned short*)&((CB*) 0x6000000)[2];
                if (redTileMode_PLAYING2) {
                    for (int i = 0; i < 16; i++) {
                        cb[16 * 10 + i] = originalTile10_PLAYING2[i];
                    }
                    redTileMode_PLAYING2 = 0;
                    mgba_printf("Restored original tile 10 for PLAYING2");
                }
            }
        } else {
            mgba_printf("LSHOULDER pressed: Already at max lives (%d)", playerLives);
        }
    }

    if (playerLives == 1) {
        static int redTileMode_PLAYING = 0;
        static int redTileMode_PLAYING2 = 0;
        static unsigned short originalTile10_PLAYING[16];
        static unsigned short originalTile10_PLAYING2[16];

        unsigned short sampleTile;
        if (state == PLAYING) {
            sampleTile = ((SB*) 0x6000000)[26].tilemap[0];
        } else if (state == PLAYING2) {
            sampleTile = ((SB*) 0x6000000)[28].tilemap[0];
        }

        int currentPalette = (sampleTile >> 12) & 0x7;

        int newPalette;
        if (state == PLAYING) {
            newPalette = 1;

            for (int i = 0; i < 1024; i++) {
                ((SB*) 0x6000000)[26].tilemap[i] = (((SB*) 0x6000000)[26].tilemap[i] & 0x0FFF) | (newPalette << 12);
            }

            volatile unsigned short* cb = (unsigned short*)&((CB*) 0x6000000)[2];

            if (!redTileMode_PLAYING) {
                for (int i = 0; i < 16; i++) {
                    originalTile10_PLAYING[i] = cb[16 * 10 + i];
                }
                for (int i = 0; i < 16; i++) {
                    cb[16 * 10 + i] = 0x1111;
                }
                redTileMode_PLAYING = 1;
                mgba_printf("LOW HEALTH: PLAYING - Made tile 10 red");
            }

        } else if (state == PLAYING2) {
            newPalette = 2;

            for (int i = 0; i < 1024; i++) {
                ((SB*) 0x6000000)[28].tilemap[i] = (((SB*) 0x6000000)[28].tilemap[i] & 0x0FFF) | (newPalette << 12);
                ((SB*) 0x6000000)[29].tilemap[i] = (((SB*) 0x6000000)[29].tilemap[i] & 0x0FFF) | (newPalette << 12);
            }

            volatile unsigned short* cb = (unsigned short*)&((CB*) 0x6000000)[2];

            if (!redTileMode_PLAYING2) {
                for (int i = 0; i < 16; i++) {
                    originalTile10_PLAYING2[i] = cb[16 * 10 + i];
                }
                for (int i = 0; i < 16; i++) {
                    cb[16 * 10 + i] = 0x1111;
                }
                redTileMode_PLAYING2 = 1;
                mgba_printf("LOW HEALTH: PLAYING2 - Made tile 10 red");
            }
        }
    }
}


void start() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToCutscene(PLAYING);
    }
    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        goToInstructions();
    }
}

void goToStart() {

    (*(volatile unsigned short *)0x4000000) = ((4) & 7)| (1 << (8 + (2 % 4))) ;

    DMANow(3, STARTPal, ((unsigned short *)0x5000000), 256);
    drawFullscreenImage4(STARTBitmap);

    initPlayer(&player);
    resetEnemies();
    resetCollisionSystem();
    resetCollisionSystem2();
    playerSpriteBaseIndex = 0;
    playerSpriteWidth = 32;
    playerSpriteHeight = 32;

    initPlayerLives();
    resetPlayerLivesForNewLevel();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    automaticMovementActive = 0;
    automaticMovementActive2 = 0;
    currentMovementStep = 0;
    currentMovementStep2 = 0;
    sequenceComplete = 0;

    showAccessory = 0;
    rightTrianglePatternActive = 0;
    isoscelesTrianglePatternActive = 0;
    emPatternActive2 = 0;

    squarePatternActive = 0;
    rightTrianglePatternActive2 = 0;
    isoscelesTrianglePatternActive2 = 0;

    state = START;
}

void instructions() {
    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        goToStart();
    }
}

void goToInstructions() {
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));

    DMANow(3, INSTRUCTIONSPal, ((unsigned short *)0x5000000), 256);
    drawFullscreenImage4(INSTRUCTIONSBitmap);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = INSTRUCTIONS;
}

void goToMode0Cutscene() {
    mgba_printf("Starting Mode 0 cutscene: Player walking across screen");

    playMusic(3, 1);

    mode0CutsceneTimer = 0;

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << 12);
    waitForVBlank();

    DMANow(3, spriteSheetPal, ((u16 *)0x5000200), 512/2);
    DMANow(3, spriteSheetTiles, &((CB*) 0x6000000)[4], 32768/2);

    playerWalkX = -64;
    player.x = playerWalkX;
    player.y = playerWalkY;
    player.direction = 3;
    player.isAnimating = 1;
    player.currentFrame = 0;
    player.xVel = PLAYER_WALK_SPEED;
    player.yVel = 0;
    player.timeUntilNextFrame = 10;

    player.screenX = playerWalkX;
    player.screenY = playerWalkY;

    showAccessory = 0;
    showAccessory2 = 0;
    squarePatternActive = 0;
    rightTrianglePatternActive = 0;
    isoscelesTrianglePatternActive = 0;
    emPatternActive2 = 0;

    resetEnemies();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = MODE0_CUTSCENE;
    mgba_printf("Mode 0 cutscene: Player starts at X=%d", playerWalkX);
}

void mode0Cutscene() {
    updateMode0Cutscene();
    drawMode0Cutscene();

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) || (!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        mgba_printf("Mode 0 cutscene skipped");
        goToPlaying();
        return;
    }
}

void updateMode0Cutscene() {
    mode0CutsceneTimer++;

    playerWalkX += PLAYER_WALK_SPEED;
    player.x = playerWalkX;

    player.timeUntilNextFrame--;
    if (player.timeUntilNextFrame <= 0) {
        player.currentFrame = (player.currentFrame + 1) % 5;
        if (player.currentFrame == 0) player.currentFrame = 1;
        player.timeUntilNextFrame = 10;
    }

    if (playerWalkX >= PLAYER_WALK_TARGET_X) {
        mgba_printf("Mode 0 cutscene complete: Player walked off-screen");
        goToPlaying();
        return;
    }

    player.screenX = playerWalkX;
    player.screenY = playerWalkY;
}

void drawMode0Cutscene() {

    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }

    if (playerWalkX >= -64 && playerWalkX <= 240) {
        int frameIndex;
        if (player.currentFrame >= 0 && player.currentFrame < 5) {
            frameIndex = LEFT_FRAMES[player.currentFrame];
        } else {
            frameIndex = LEFT_FRAMES[0];
        }

        int hFlip = 1;

        shadowOAM[0].attr0 = ((playerWalkY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[0].attr1 = ((playerWalkX) & 0x1FF) | (3<<14) | (hFlip ? (1<<12) : 0);
        shadowOAM[0].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (frameIndex))) & 0x3FF);

        mgba_printf("Drawing player at (%d,%d), frame %d, tile %d, hFlip=%d",
                   playerWalkX, playerWalkY, player.currentFrame, frameIndex, hFlip);
    }

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    waitForVBlank();
}

void playing() {
    updatePlayer(&player);
    updatePatternSpriteTimer();

    updateEnemies(&player);


    updateButtons();
    updatePatternSpriteTimer();

    updateButtonEffects();

    checkLevelSkip();

    togglePaletteRows();

    if (playerLives <= 0) {
        mgba_printf("Player has no lives left! Game Over!");
        goToLose();
        return;
    }

    if (automaticMovementActive) {
        debugAutomaticMovementState();
    }

    checkTileCollision(&player);
    testAccessoryVisibility();

    if (automaticMovementActive) {
        mgba_printf("AUTO MOVEMENT ACTIVE - Step: %d", currentMovementStep);
        updateAutomaticMovement(&player);
        player.x += player.xVel;
        player.y += player.yVel;

        mgba_printf("Player Vel: (%d,%d), Pos: (%d,%d)",
                   player.xVel, player.yVel, player.x, player.y);
    }

    if (isAutomaticMovementFinished()) {
        mgba_printf("AUTO MOVEMENT FINISHED - Returning to normal gameplay");
        debugAutomaticMovementState();

        automaticMovementActive = 0;
        sequenceComplete = 0;
        currentMovementStep = 0;

        player.xVel = 0;
        player.yVel = 0;

        showAccessory = 0;
        rightTrianglePatternActive = 0;

        for (int i = 10; i <= 31; i++) {
            if (i == 30 || i == 31 || i == 16 || i == 15 || i == 10 || i == 120 || i == 121) {
                shadowOAM[i].attr0 = (2<<8);
            }
        }

        mgba_printf("Automatic movement reset. Ready for next sequence.");
    }

    if (areAllEnemiesKilled() && !automaticMovementActive) {
        mgba_printf("All enemies killed! Transitioning to prince cutscene...");
        goToPrinceCutscene();
        return;
    }

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        mgba_printf("DEBUG: Manual trigger for prince cutscene");
        goToPrinceCutscene();
        return;
    }

    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToPause();
    }

    drawPlayer(&player);
    drawPatternSprite(&player);

    drawButtons(&player);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    waitForVBlank();
}

void goToCutscene(int returnState) {

    returnAfterCutscene = returnState;

    stopMadaoForCutscene();
    playMusic(3, 1);

    cutsceneFrame = 0;
    cutsceneTimer = 0;

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));

    DMANow(3, cutscenePalette, ((unsigned short *)0x5000000), 256);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    drawFullscreenImage4(cutsceneImages[0]);
    waitForVBlank();

    state = CUTSCENE;
    mgba_printf("Entering cutscene with %d images", TOTAL_CUTSCENE_FRAMES);
}

void cutscene() {
    updateCutscene();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        mgba_printf("Image cutscene skipped (START button)");

        initPlayer(&player);
        player.screenX = player.x;
        player.screenY = player.y;

        goToPlaying();
        return;
    }

    drawCutscene();

    if (cutsceneFrame >= TOTAL_CUTSCENE_FRAMES) {
        mgba_printf("Image cutscene completed, starting Mode 0 cutscene");
        goToMode0Cutscene();
        return;
    }
}

void updateCutscene() {
    cutsceneTimer++;

    if (cutsceneTimer >= CUTSCENE_FRAME_DURATION) {
        cutsceneTimer = 0;
        cutsceneFrame++;

        if (cutsceneFrame >= TOTAL_CUTSCENE_FRAMES) {
            mgba_printf("Cutscene completed");

            if (returnAfterCutscene == PLAYING) {
                goToPlaying();
            } else if (returnAfterCutscene == PLAYING2) {
                goToPlaying2();
            } else if (returnAfterCutscene == START) {
                goToStart();
            } else {
                goToStart();
            }
        }
    }
}

void drawCutscene() {
    if (cutsceneTimer == 0 && cutsceneFrame < TOTAL_CUTSCENE_FRAMES) {
        waitForVBlank();

        drawFullscreenImage4(cutsceneImages[cutsceneFrame]);


        waitForVBlank();
    }
}

void goToPlaying() {

    if (!returningFromPause) {
        currentLevel = 1;

        resetPlayerLivesForNewLevel();

        (*(volatile unsigned short *)0x4000000) = ((0) & 7);
        waitForVBlank();

        (*(volatile unsigned short*) 0x4000008) = (0 << 14) | ((24) << 8) | ((0) << 2) | (0 << 7) | 2;
        (*(volatile unsigned short*) 0x400000A) = (0 << 14) | ((26) << 8) | ((0) << 2) | (0 << 7) | 1;
        (*(volatile unsigned short*) 0x400000C) = (0 << 14) | ((28) << 8) | ((0) << 2) | (0 << 7);

        DMANow(3, Background1Pal, ((unsigned short *)0x5000000), 512/2);
        DMANow(3, Background1Tiles, &((CB*) 0x6000000)[0], 16448/2);
        DMANow(3, Background1Map, &((SB*) 0x6000000)[26], 2048/2);

        DMANow(3, spriteSheetPal, ((u16 *)0x5000200), 512/2);
        DMANow(3, spriteSheetTiles, &((CB*) 0x6000000)[4], 32768/2);

        waitForVBlank();

        initPlayer(&player);
        player.screenX = player.x;
        player.screenY = player.y;

        resetCollisionSystem();
        initButtons();
        initPlayerBullets();
        initPatternPositions();

        resetEnemies();

        spawnEnemyAtCollisionColor(5, 0);
        spawnEnemyAtCollisionColor(3, 0);
        spawnEnemyAtCollisionColor(4, 1);
        spawnEnemyAtCollisionColor(2, 1);

        (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);
    } else {
        (*(volatile unsigned short *)0x4000000) = ((0) & 7);
        waitForVBlank();

        (*(volatile unsigned short*) 0x4000008) = (0 << 14) | ((24) << 8) | ((0) << 2) | (0 << 7) | 2;
        (*(volatile unsigned short*) 0x400000A) = (0 << 14) | ((26) << 8) | ((0) << 2) | (0 << 7) | 1;
        (*(volatile unsigned short*) 0x400000C) = (0 << 14) | ((28) << 8) | ((0) << 2) | (0 << 7);

        DMANow(3, Background1Pal, ((unsigned short *)0x5000000), 512/2);
        DMANow(3, Background1Tiles, &((CB*) 0x6000000)[0], 16448/2);
        DMANow(3, Background1Map, &((SB*) 0x6000000)[26], 2048/2);

        DMANow(3, spriteSheetPal, ((u16 *)0x5000200), 512/2);
        DMANow(3, spriteSheetTiles, &((CB*) 0x6000000)[4], 32768/2);

        waitForVBlank();

        (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);

    }

    returningFromPause = 0;
    state = PLAYING;

}

void pause() {
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        unpauseSounds();
        if (previousState == PLAYING2) {
            goToPlaying2();
        } else {
            goToPlaying();
        }
    }
    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        goToStart();
    }
}

void goToPause() {

    previousState = state;

    pauseSounds();

    returningFromPause = 1;

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));

    DMANow(3, PAUSEDPal, ((unsigned short *)0x5000000), 256);
    drawFullscreenImage4(PAUSEDBitmap);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = PAUSE;
}

void lose() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        mgba_printf("Returning to start screen from lose screen");
        goToStart();
    }
}

void goToLose() {
    playMusic(-1, 0);
    stopSounds();

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));

    DMANow(3, LOSEPal, ((unsigned short *)0x5000000), 256);
    drawFullscreenImage4(LOSEBitmap);

    resetEnemies();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = LOSE;

    mgba_printf("GAME OVER - Player ran out of lives");
}

void win() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        stopSounds();
        initPlayer(&player);
        resetEnemies();
        resetCollisionSystem();
        resetCollisionSystem2();
        playerSpriteBaseIndex = 0;
        playerSpriteWidth = 32;
        playerSpriteHeight = 32;
        goToStart();
    }
}

void goToWin() {

    playMusic(-1, 0);

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));

    DMANow(3, WINPal, ((unsigned short *)0x5000000), 256);
    drawFullscreenImage4(WINBitmap);

    resetEnemies();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = WIN;
}

void goToPrinceCutscene() {
    mgba_printf("Starting Prince cutscene");

    if (currentMusic != -1) {
        stopSounds();
    }

    playMusic(3, 1);

    princeCutsceneTimer = 0;
    princeCutsceneFrame = 0;

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));

    DMANow(3, princePalette, ((unsigned short *)0x5000000), 256);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    drawFullscreenImage4(princeImages[0]);
    waitForVBlank();

    state = PRINCE_CUTSCENE;
    mgba_printf("Entering prince cutscene with %d images", TOTAL_PRINCE_FRAMES);
}

void princeCutscene() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        princeCutsceneFrame++;

        mgba_printf("Prince cutscene: Frame %d/%d (START pressed)",
                   princeCutsceneFrame, TOTAL_PRINCE_FRAMES);

        if (princeCutsceneFrame >= TOTAL_PRINCE_FRAMES) {
            mgba_printf("Prince cutscene completed, going to Level 2");
            goToPlaying2();
            return;
        } else {
            waitForVBlank();
            drawFullscreenImage4(princeImages[princeCutsceneFrame]);
            waitForVBlank();
        }
    }

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        mgba_printf("Prince cutscene skipped with A button");
        goToPlaying2();
        return;
    }

    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1)))) && princeCutsceneFrame > 0) {
        princeCutsceneFrame--;
        mgba_printf("Prince cutscene: Went back to frame %d/%d",
                   princeCutsceneFrame, TOTAL_PRINCE_FRAMES);

        waitForVBlank();
        drawFullscreenImage4(princeImages[princeCutsceneFrame]);
        waitForVBlank();
    }
}

void updatePrinceCutscene() {
    princeCutsceneTimer++;

    if (princeCutsceneTimer >= PRINCE_CUTSCENE_FRAME_DURATION) {
        princeCutsceneTimer = 0;
        princeCutsceneFrame++;

        mgba_printf("Prince cutscene: Frame %d/%d",
                   princeCutsceneFrame, TOTAL_PRINCE_FRAMES);

        if (princeCutsceneFrame >= TOTAL_PRINCE_FRAMES) {
            mgba_printf("Prince cutscene completed");
            return;
        }
    }
}

void drawPrinceCutscene() {
    if (princeCutsceneTimer == 0 && princeCutsceneFrame < TOTAL_PRINCE_FRAMES) {
        waitForVBlank();

        drawFullscreenImage4(princeImages[princeCutsceneFrame]);

        waitForVBlank();

        mgba_printf("Drew prince frame %d", princeCutsceneFrame);
    }
}

void playing2() {

    static int parallaxScroll = 0;
    static int patternScroll = 0;
    static int scrollTimer = 0;
    static int scrollState = 0;
    static int scrollSpeed = 2;

    int cameraX, cameraY;





    if (playerLives <= 0) {
        mgba_printf("Player has no lives left in Level 2! Game Over!");
        goToLose();
        return;
    }

    if (emCameraActive && emPatternActive2) {
        cameraX = worldCameraX;
        cameraY = worldCameraY;
        mgba_printf("=== playing2: USING EM CAMERA (%d,%d) ===", cameraX, cameraY);
    } else {
        cameraX = player.x - (240 / 2) + 32;
        cameraY = player.y - (160 / 2) + 32;

        if (cameraX < 0) cameraX = 0;
        if (cameraX > 256 - 240) cameraX = 256 - 240;
        if (cameraY < 0) cameraY = 0;
        if (cameraY > 256 - 160) cameraY = 256 - 160;
    }

    if (!automaticMovementActive2) {
        parallaxScroll--;
        if (parallaxScroll <= -255) {
            parallaxScroll = 0;
        }

        (*(volatile unsigned short*) 0x04000010) = (cameraX + parallaxScroll + 256) % 256;
        (*(volatile unsigned short*) 0x04000012) = cameraY;

        mgba_printf("Parallax ACTIVE: scroll=%d", parallaxScroll);
    } else {
        (*(volatile unsigned short*) 0x04000010) = cameraX;
        (*(volatile unsigned short*) 0x04000012) = cameraY;

        mgba_printf("Parallax PAUSED for automatic movement 2");
    }

    if (!automaticMovementActive2) {
        scrollTimer++;

        switch (scrollState) {
            case 0:
                patternScroll += scrollSpeed;

                if (patternScroll > 255) {
                    patternScroll = 0;
                }

                if (player.y >= 15 && player.y <= 145 && !automaticMovementActive2 && !boss.active) {
                    player.x -= scrollSpeed;
                    if (player.x < 0) player.x = 0;
                }

                for (int i = 0; i < 4; i++) {
                    if (enemies[i].active && enemies[i].collisionPath == 1) {
                        enemies[i].x -= scrollSpeed;
                        if (enemies[i].x <= -enemies[i].width - 10) {
                            enemies[i].active = 0;
                            enemyCount--;
                        }
                    }
                }

                if (scrollTimer >= 120) {
                    scrollState = 1;
                    scrollTimer = 0;
                }
                break;

            case 1:
                if (scrollTimer >= 90) {
                    scrollState = 0;
                    scrollTimer = 0;
                }
                break;
        }

        (*(volatile unsigned short*) 0x04000014) = cameraX + patternScroll;
        (*(volatile unsigned short*) 0x04000016) = cameraY;

        mgba_printf("Pattern scrolling ACTIVE: patternScroll=%d", patternScroll);

    } else {
        (*(volatile unsigned short*) 0x04000014) = cameraX;
        (*(volatile unsigned short*) 0x04000016) = cameraY;

        mgba_printf("Pattern scrolling PAUSED (autoMove2=%d, boss=%d)",
                   automaticMovementActive2, boss.active);
    }

    (*(volatile unsigned short*) 0x04000018) = cameraX;
    (*(volatile unsigned short*) 0x0400001A) = cameraY;

    if (player.x < 0) player.x = 0;
    if (player.x > 240) player.x = 240;

    updateEnemies(&player);

    updatePlayer(&player);
    updateButtons2();
    updatePatternSpriteTimer2();
    updateEmPatternSpriteTimer2();
    updateButtonEffects();
    checkLevelSkip();

    togglePaletteRows();

    if (automaticMovementActive2) {
        debugAutomaticMovementState2();
    }

    checkTileCollision2(&player);

    if (automaticMovementActive2) {
        mgba_printf("AUTO MOVEMENT2 ACTIVE - Step: %d", currentMovementStep2);
        updateAutomaticMovement2(&player);
        player.x += player.xVel;
        player.y += player.yVel;

        mgba_printf("Player2 Vel: (%d,%d), Pos: (%d,%d)",
                   player.xVel, player.yVel, player.x, player.y);
    }

    static int preBossCheck = 0;
    if (!boss.active && !preBossCheck) {
        mgba_printf("Pre-boss check - Palettes: %x, %x", ((unsigned short *)0x5000000)[0], ((unsigned short *)0x5000000)[16]);
        preBossCheck = 1;
    }

    if (isAutomaticMovementFinished2() && !boss.active && patternSpriteTimer2 <= 0) {
        mgba_printf("AUTO MOVEMENT2 FINISHED AND TIMER EXPIRED - Full reset");
        debugAutomaticMovementState2();

        automaticMovementActive2 = 0;
        sequenceComplete2 = 0;
        currentMovementStep2 = 0;
        automaticMovementFinished2 = 0;

        player.xVel = 0;
        player.yVel = 0;

        showAccessory2 = 0;
        rightTrianglePatternActive2 = 0;
        emPatternActive2 = 0;

        for (int i = 10; i <= 31; i++) {
            if (i == 30 || i == 31 || i == 16 || i == 15 || i == 10 || i == 120) {
                shadowOAM[i].attr0 = (2<<8);
            }
        }

        mgba_printf("Automatic movement2 reset. Ready for next sequence.");
    }

    if (areAllEnemiesKilled() && currentLevel == 2 && !automaticMovementActive2) {
        mgba_printf("All enemies killed in Level 2! You win!");
        goToWin();
        return;
    }

    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToPause();
    }

    if (spriteChanged2) {
        playerSpriteWidth = 64;
        playerSpriteHeight = 64;
        playerSpriteBaseIndex = 8;

        mgba_printf("LEVEL2 SECOND SPRITE ACTIVATED! BaseIndex=%d\n", playerSpriteBaseIndex);
        spriteChanged2 = 0;
    }

    debugCollisionPaletteColors();

    static int lastBossState = 0;
    if (boss.active != lastBossState) {
        if (boss.active) {
            mgba_printf("BOSS SPAWNED - Checking palettes...");
            mgba_printf("BG_PALETTE[0]: %x, BG_PALETTE[16]: %x", ((unsigned short *)0x5000000)[0], ((unsigned short *)0x5000000)[16]);
        }
        lastBossState = boss.active;
    }

    drawPlayer(&player);
    drawPatternSprite2(&player);

    debugIsoscelesSpriteState2();


    drawEmPatternSprite2(&player);

    drawButtons2(&player);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    waitForVBlank();
}

void goToPlaying2() {
   static int debugFrame = 0;
   static int firstTimeEnteringLevel2 = 1;

    debugFrame++;

    if (debugFrame == 20) {
        mgba_printf("FRAME 60 CHECK:");
        mgba_printf("BG0HOFF: %d, BG1HOFF: %d", (*(volatile unsigned short*) 0x04000010), (*(volatile unsigned short*) 0x04000014));
        mgba_printf("BG1CNT: 0x%04X", (*(volatile unsigned short*) 0x400000A));

        int centerTile = 10 * 32 + 15;
        unsigned short tile = ((SB*) 0x6000000)[29].tilemap[centerTile];
        mgba_printf("Center tile: 0x%04X (palette: %d, tile#: %d)",
                   tile, (tile >> 12) & 0x7, tile & 0x3FF);
    }

    currentLevel = 2;

    if (!returningFromPause) {
        resetPlayerLivesForNewLevel();
    }

    if (state != PAUSE) {
        resetEnemies();
    }

    (*(volatile unsigned short *)0x4000000) = ((0) & 7);
    waitForVBlank();

    (*(volatile unsigned short*) 0x4000008) = (0 << 14) | ((31) << 8) | ((1) << 2) | (0 << 7) | 3;
    (*(volatile unsigned short*) 0x400000A) = (0 << 14) | ((29) << 8) | ((2) << 2) | (0 << 7) | 2;
    (*(volatile unsigned short*) 0x400000C) = (0 << 14) | ((28) << 8) | ((0) << 2) | (0 << 7) | 1;

    mgba_printf("Loading parallax to CHARBLOCK[1]...");
    DMANow(3, Background2Pal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, parallax1Pal, &((unsigned short *)0x5000000)[16], 512/2);

    DMANow(3, parallax1Tiles, &((CB*) 0x6000000)[1], 15840/2);

    unsigned short parallaxMapCopy[1024];
    for (int i = 0; i < 1024; i++) {
        parallaxMapCopy[i] = (parallax1Map[i] & 0x0FFF) | (1 << 12);
    }
    DMANow(3, parallaxMapCopy, &((SB*) 0x6000000)[31], 2048);

    mgba_printf("Loading Background2 to CHARBLOCK[0]...");
    DMANow(3, Background2Tiles, &((CB*) 0x6000000)[0], 7776/2);
    DMANow(3, Background2Map, &((SB*) 0x6000000)[28], 2048/2);

    DMANow(3, Background2ScrollingTiles, &((CB*) 0x6000000)[2], 9088/2);
    DMANow(3, Background2ScrollingMap, &((SB*) 0x6000000)[29], 2048/2);
    DMANow(3, Background2ScrollingPal, &((unsigned short *)0x5000000)[32], 512/2);

    for (int i = 0; i < 1024; i++) {
        ((SB*) 0x6000000)[28].tilemap[i] = (((SB*) 0x6000000)[28].tilemap[i] & 0x0FFF) | (0 << 12);
        ((SB*) 0x6000000)[29].tilemap[i] = (((SB*) 0x6000000)[29].tilemap[i] & 0x0FFF) | (0 << 12);
    }

    mgba_printf("Initial: Both BGs using PALROW0 (Background2Pal)");
    mgba_printf("PALROW2 ready with Background2ScrollingPal");

    mgba_printf("Loading sprites to CHARBLOCK[4]...");
    DMANow(3, spriteSheetPal, ((u16 *)0x5000200), 512/2);
    DMANow(3, spriteSheetTiles, &((CB*) 0x6000000)[4], 32768/2);

    waitForVBlank();

    if (state != PAUSE && firstTimeEnteringLevel2) {
        resetCollisionSystem2();
        resetPlayerBullets();
        initButtons2();
        initPatternPositions2();

        spawnEnemyAtCollisionColor2(11, 1);
        spawnEnemyAtCollisionColor2(5, 1);
        spawnEnemyAtCollisionColor2(12, 1);
        spawnEnemyAtCollisionColor2(6, 1);

        firstTimeEnteringLevel2 = 0;
    }

    int cameraX = player.x - 120 + 32;
    int cameraY = player.y - 80 + 32;

    if (cameraX < 0) cameraX = 0;
    if (cameraX > 256 - 240) cameraX = 256 - 240;
    if (cameraY < 0) cameraY = 0;
    if (cameraY > 256 - 160) cameraY = 256 - 160;

    (*(volatile unsigned short*) 0x04000010) = cameraX;
    (*(volatile unsigned short*) 0x04000012) = cameraY;
    (*(volatile unsigned short*) 0x04000014) = cameraX;
    (*(volatile unsigned short*) 0x04000016) = cameraY;
    (*(volatile unsigned short*) 0x04000018) = cameraX;
    (*(volatile unsigned short*) 0x0400001A) = cameraY;

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4))) | (1 << 12);

    if (!returningFromPause) {
        currentMusic = -1;
        playMusic(0, 1);
    }

    debugEnemyPathCollisions();
    state = PLAYING2;

    mgba_printf("Level 2 loaded. State: %s, Player at (%d,%d), Camera at (%d,%d)",
                (state == PAUSE) ? "Returning from pause" : "First time",
                player.x, player.y, cameraX, cameraY);
}

void checkScrollCorruption() {
    static int lastBG0HOFF = 0;
    static int lastBG1HOFF = 0;

    int currentBG0 = (*(volatile unsigned short*) 0x04000010);
    int currentBG1 = (*(volatile unsigned short*) 0x04000014);

    if (currentBG0 != lastBG0HOFF && state == PLAYING2) {
        mgba_printf("SCROLL CORRUPTION: BG0HOFF changed from %d to %d", lastBG0HOFF, currentBG0);
    }
    if (currentBG1 != lastBG1HOFF && state == PLAYING2) {
        mgba_printf("SCROLL CORRUPTION: BG1HOFF changed from %d to %d", lastBG1HOFF, currentBG1);
    }

    lastBG0HOFF = currentBG0;
    lastBG1HOFF = currentBG1;
}

void drawGame() {
    drawPlayer(&player);

    if (!boss.active) {
        drawEnemies();
    }

    if (state == PLAYING) {
        drawButtons(&player);
    } else if (state == PLAYING2) {
        drawButtons2(&player);
    }

    if (boss.active) {
        drawBoss();
    }

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}


void checkLevelSkip() {
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        for (int i = 0; i < 30; i++) {
            waitForVBlank();
        }

        if (state == PLAYING) {
            if (areAllEnemiesKilled() && currentLevel == 1) {
                mgba_printf("SKIPPING TO PRINCE CUTSCENE");
                resetEnemies();
                resetCollisionSystem();
                goToPrinceCutscene();
            } else {
                mgba_printf("Cannot skip: Enemies still alive in Level 1");
            }
        } else if (state == LOSE) {
            mgba_printf("Returning to start from lose screen");
            goToStart();
        } else if (state == PRINCE_CUTSCENE) {
            mgba_printf("SKIPPING PRINCE CUTSCENE TO LEVEL 2");
            goToPlaying2();
        } else if (state == PLAYING2) {
            if (areAllEnemiesKilled() && currentLevel == 2) {
                mgba_printf("SKIPPING TO WIN");
                resetEnemies();
                goToWin();
            } else {
                mgba_printf("Cannot skip: Enemies still alive in Level 2");
            }
        } else if (state == WIN) {
            mgba_printf("Returning to start from win screen");
            goToStart();
        }
    }
}

void debugBG1Corruption() {
    static int lastValidBG1 = 0;

    int currentBG1 = (*(volatile unsigned short*) 0x04000014);

    if (currentBG1 > 255 && lastValidBG1 <= 255) {
        mgba_printf("BG1 CORRUPTION DETECTED: %d -> %d", lastValidBG1, currentBG1);

        mgba_printf("Player: (%d,%d), Boss Active: %d, AutoMove: %d",
                   player.x, player.y, boss.active, automaticMovementActive2);
    }

    lastValidBG1 = currentBG1;
}
