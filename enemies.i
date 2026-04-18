# 0 "enemies.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "enemies.c"
# 1 "enemies.h" 1



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
# 5 "enemies.h" 2
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
# 6 "enemies.h" 2
# 1 "tempCol.h" 1
# 21 "tempCol.h"
extern const unsigned short tempColBitmap[32768];


extern const unsigned short tempColPal[256];
# 7 "enemies.h" 2
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
# 2 "enemies.c" 2
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
# 3 "enemies.c" 2
# 1 "bosses.h" 1





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
# 7 "bosses.h" 2







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
# 4 "enemies.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 5 "enemies.c" 2



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
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
# 45 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 46 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3

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




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdint.h" 3 4
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
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
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

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

# 9 "enemies.c" 2
# 1 "print.h" 1
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 10 "enemies.c" 2

ENEMY enemies[4];
int enemyCount = 0;
extern int currentLevel;
int enemySpawnTimer = 0;

extern BOSS boss;
extern int emCameraActive;
extern int emPatternActive2;
extern int worldCameraX;
extern int worldCameraY;

extern int automaticMovementActive;
extern int automaticMovementActive2;




inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*)tempColBitmap)[((y) * (256) + (x))];
}

inline unsigned char colorAt2(int x, int y) {
    return ((unsigned char*)tempCol2Bitmap)[((y) * (256) + (x))];
}

int getCollisionType(int x, int y) {
    if (x < 0) x = 0;
    if (y < 0) y = 0;
    if (x >= 256) x = 256 - 1;
    if (y >= 256) y = 256 - 1;

    unsigned char color = colorAt2(x, y);

    static int debugCounter = 0;
    if (debugCounter++ % 60 == 0) {
        mgba_printf("Collision check at (%d,%d): color=%d", x, y, color);
    }

    switch(color) {
        case 1: return 1;
        case 2: return 2;
        case 3: return 3;
        case 4: return 4;
        case 5: return 5;
        case 6: return 6;
        case 7: return 7;
        case 8: return 8;
        case 9: return 9;
        case 10: return 10;
        case 11: return 11;
        case 12: return 12;
        default: return 0;
    }
}

void initEnemies(void) {
    enemyCount = 0;
    for (int i = 0; i < 4; i++) {
        enemies[i].active = 0;
        enemies[i].oamIndex = 11 + i;
    }
}

void spawnEnemyAtCollisionColor(int collisionColor, int type) {
    if (enemyCount >= 4) return;

    int spawnX, spawnY;

    switch (collisionColor) {
        case 5:
            spawnX = 128; spawnY = 256 - 32;
            break;
        case 3:
            spawnX = 128; spawnY = 0;
            break;
        case 4:
            spawnX = 0; spawnY = 128;
            break;
        case 2:
            spawnX = 256 - 32; spawnY = 128;
            break;
        default:
            spawnX = 128; spawnY = 128;
            break;
    }

    for (int i = 0; i < 4; i++) {
        if (!enemies[i].active) {
            enemies[i].x = spawnX;
            enemies[i].y = spawnY;
            enemies[i].width = 32;
            enemies[i].height = 32;
            enemies[i].type = type;
            enemies[i].speed = 1;
            enemies[i].active = 1;
            enemies[i].frame = 0;
            enemies[i].animationTimer = 0;
            enemies[i].direction = 0;
            enemies[i].movementState = 1;
            enemies[i].collisionPath = collisionColor;
            enemyCount++;
            mgba_printf("Enemy %d spawned at (%d,%d) with collision path %d",
                       i, spawnX, spawnY, collisionColor);
            break;
        }
    }
}

void spawnEnemyAtCollisionColor2(int collisionColor, int type) {
    if (enemyCount >= 4) return;

    int spawnX, spawnY;

    switch (collisionColor) {
        case 11:
            spawnX = 32;
            spawnY = 8;
            break;
        case 5:
            spawnX = 192;
            spawnY = 8;
            break;
        case 12:
            spawnX = 48;
            spawnY = 232;
            break;
        case 6:
            spawnX = 208;
            spawnY = 232;
            break;
        default:
            spawnX = 128; spawnY = 128;
            break;
    }

    for (int i = 0; i < 4; i++) {
        if (!enemies[i].active && !enemies[i].killed) {
            enemies[i].x = spawnX;
            enemies[i].y = spawnY;
            enemies[i].width = 32;
            enemies[i].height = 32;
            enemies[i].type = 1;
            enemies[i].speed = 1;
            enemies[i].active = 1;
            enemies[i].frame = 0;
            enemies[i].animationTimer = 0;
            enemies[i].direction = (spawnX < 128) ? 1 : 0;
            enemies[i].movementState = 1;
            enemies[i].collisionPath = collisionColor;
            enemies[i].targetCollision = 0;

            int centerX = spawnX + 16;
            int centerY = spawnY + 16;
            unsigned char spawnColor = colorAt2(centerX, centerY);
            mgba_printf("Enemy %d spawned at (%d,%d): path=%d, actual color=%d",
                       i, spawnX, spawnY, collisionColor, spawnColor);

            enemyCount++;
            break;
        }
    }
}

void spawnEnemy(int x, int y, int type) {
    if (enemyCount >= 4) return;

    for (int i = 0; i < 4; i++) {
        if (!enemies[i].active) {
            enemies[i].x = x;
            enemies[i].y = y;
            enemies[i].width = 32;
            enemies[i].height = 32;
            enemies[i].type = type;
            enemies[i].speed = 1;
            enemies[i].active = 1;
            enemies[i].frame = 0;
            enemies[i].animationTimer = 0;
            enemies[i].direction = rand() % 2;
            enemyCount++;
            break;
        }
    }
}

void updateEnemySpawn(void) {
    if (currentLevel == 1) {
        for (int i = 0; i < 4; i++) {
            if (!enemies[i].killed) {
                if (!enemies[i].active && enemies[i].spawnTimer > 0) {
                    enemies[i].spawnTimer--;
                    if (enemies[i].spawnTimer <= 0) {
                        int collisionColor, enemyType;

                        switch (i) {
                            case 0: collisionColor = 5; enemyType = 0; break;
                            case 1: collisionColor = 3; enemyType = 0; break;
                            case 2: collisionColor = 4; enemyType = 1; break;
                            case 3: collisionColor = 2; enemyType = 1; break;
                        }

                        spawnEnemyAtCollisionColor(collisionColor, enemyType);
                    }
                }
            }
        }
    } else if (currentLevel == 2) {
        for (int i = 0; i < 4; i++) {
            if (!enemies[i].killed) {
                if (!enemies[i].active && enemies[i].spawnTimer > 0) {
                    enemies[i].spawnTimer--;

                    if (enemies[i].spawnTimer <= 0) {
                        int collisionColor, enemyType;

                        if (i < 4) {
                            switch (i) {
                                case 0: collisionColor = 5; enemyType = 1; break;
                                case 1: collisionColor = 6; enemyType = 1; break;
                                case 2: collisionColor = 11; enemyType = 1; break;
                                case 3: collisionColor = 12; enemyType = 1; break;
                                default: continue;
                            }
                            spawnEnemyAtCollisionColor2(collisionColor, enemyType);
                        }
                    }
                }
            }
        }
    }
}

void updateEnemyCollisionMovement(ENEMY* enemy) {
    if (currentLevel == 1 && enemy->movementState == 1) {
        switch (enemy->collisionPath) {
            case 5:
                if (enemy->type == 1) {
                    if (enemy->direction == 0) {
                        enemy->x -= enemy->speed;
                    } else {
                        enemy->x += enemy->speed;
                    }

                    if ((rand() % 40) == 0) {
                        enemy->direction = !enemy->direction;
                    }

                    if (enemy->x <= 0) {
                        enemy->x = 0;
                        enemy->direction = 1;
                    } else if (enemy->x >= 256 - enemy->width) {
                        enemy->x = 256 - enemy->width;
                        enemy->direction = 0;
                    }

                    if ((rand() % 180) == 0) {
                        enemy->type = 0;
                        enemy->direction = 1;
                    }
                } else {
                    enemy->y += enemy->speed;

                    if (enemy->y >= 256 - enemy->height) {
                        enemy->y = 256 - enemy->height;
                        enemy->movementState = 0;
                        enemy->collisionPath = 3;
                        enemy->spawnTimer = 60;
                        enemy->type = 1;
                    }
                }
                break;

            case 3:
                if (enemy->type == 1) {
                    if (enemy->direction == 0) {
                        enemy->x -= enemy->speed;
                    } else {
                        enemy->x += enemy->speed;
                    }

                    if ((rand() % 30) == 0) {
                        enemy->direction = !enemy->direction;
                    }

                    if (enemy->x <= 0) {
                        enemy->x = 0;
                        enemy->direction = 1;
                    } else if (enemy->x >= 256 - enemy->width) {
                        enemy->x = 256 - enemy->width;
                        enemy->direction = 0;
                    }

                    if ((rand() % 60) == 0) {
                        enemy->type = 0;
                        enemy->direction = 0;
                    }
                } else {
                    enemy->y -= enemy->speed;

                    if (enemy->y <= 0) {
                        enemy->y = 0;
                        enemy->movementState = 0;
                        enemy->collisionPath = 5;
                        enemy->spawnTimer = 60;
                        enemy->type = 1;
                    }
                }
                break;

            case 4:
                if (enemy->type == 0) {
                    if (enemy->direction == 0) {
                        enemy->y -= enemy->speed;
                    } else {
                        enemy->y += enemy->speed;
                    }

                    if ((rand() % 30) == 0) {
                        enemy->direction = !enemy->direction;
                    }

                    if (enemy->y <= 0) {
                        enemy->y = 0;
                        enemy->direction = 1;
                    } else if (enemy->y >= 256 - enemy->height) {
                        enemy->y = 256 - enemy->height;
                        enemy->direction = 0;
                    }

                    if ((rand() % 60) == 0) {
                        enemy->type = 1;
                        enemy->direction = 0;
                    }
                } else {
                    enemy->x -= enemy->speed;

                    if (enemy->x <= 0) {
                        enemy->x = 0;
                        enemy->movementState = 0;
                        enemy->collisionPath = 2;
                        enemy->spawnTimer = 60;
                        enemy->type = 0;
                    }
                }
                break;

            case 2:
                if (enemy->type == 0) {
                    if (enemy->direction == 0) {
                        enemy->y -= enemy->speed;
                    } else {
                        enemy->y += enemy->speed;
                    }

                    if ((rand() % 30) == 0) {
                        enemy->direction = !enemy->direction;
                    }

                    if (enemy->y <= 0) {
                        enemy->y = 0;
                        enemy->direction = 1;
                    } else if (enemy->y >= 256 - enemy->height) {
                        enemy->y = 256 - enemy->height;
                        enemy->direction = 0;
                    }

                    if ((rand() % 60) == 0) {
                        enemy->type = 1;
                        enemy->direction = 1;
                    }
                } else {
                    enemy->x += enemy->speed;

                    if (enemy->x >= 256 - enemy->width) {
                        enemy->x = 256 - enemy->width;
                        enemy->movementState = 0;
                        enemy->collisionPath = 4;
                        enemy->spawnTimer = 60;
                        enemy->type = 0;
                    }
                }
                break;
        }
    } else if (enemy->movementState == 0 && enemy->spawnTimer > 0) {
        enemy->spawnTimer--;
        if (enemy->spawnTimer <= 0) {
            enemy->movementState = 1;
        }
    }
}

void updateEnemyCollisionMovement2(ENEMY* enemy) {
    extern int automaticMovementActive;
    extern int automaticMovementActive2;
    int isAutoMovementActive = (automaticMovementActive || automaticMovementActive2);

    if (isAutoMovementActive) {
        enemy->speed = 0;
        enemy->xVel = 0;
        enemy->yVel = 0;
        enemy->frame = 0;
        return;
    }

    if (currentLevel == 2 && enemy->movementState == 1) {
        static int patternScroll = 0;
        static int scrollTimer = 0;
        static int scrollState = 0;
        static int scrollSpeed = 2;

        static int horizontalTimer[4] = {0, 0, 0, 0};
        int enemyIndex = -1;

        for (int i = 0; i < 4; i++) {
            if (&enemies[i] == enemy) {
                enemyIndex = i;
                break;
            }
        }

        if (enemy->collisionPath == 1) {
            enemy->speed = 0;
            enemy->xVel = 0;
            enemy->yVel = 0;
            return;
        }

        scrollTimer++;
        switch (scrollState) {
            case 0:
                patternScroll += scrollSpeed;
                if (patternScroll > 255) patternScroll = 0;
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

        int minHorizontalTime = 90;
        int maxVerticalTime = 240;
        static int verticalTimer[4] = {0, 0, 0, 0};

        if (enemy->type == 0) {
            verticalTimer[enemyIndex]++;

                if (verticalTimer[enemyIndex] >= maxVerticalTime) {
                    enemy->type = 1;

                    if (enemyIndex >= 0) {
                        horizontalTimer[enemyIndex] = 0;
                    }

                    if (enemy->collisionPath == 11 || enemy->collisionPath == 5) {
                        enemy->direction = (enemy->collisionPath == 11) ? 1 : 0;
                        mgba_printf("MAX VERTICAL TIME: Switching to horizontal at %d", enemy->collisionPath);
                    } else {
                        enemy->direction = (enemy->collisionPath == 12) ? 1 : 0;
                        mgba_printf("MAX VERTICAL TIME: Switching to horizontal at %d", enemy->collisionPath);
                    }

                    verticalTimer[enemyIndex] = 0;
                    return;

            }

            if (enemy->direction == 0) {
                enemy->y -= enemy->speed;
            } else {
                enemy->y += enemy->speed;
            }

            int checkPoints[3] = {
                enemy->x + enemy->width / 2,
                enemy->x + 8,
                enemy->x + enemy->width - 8
            };

            int targetDetected = 0;
            int edgeCollision = 0;

            for (int i = 0; i < 3; i++) {
                int checkY;
                if (enemy->direction == 0) {
                    checkY = enemy->y - 1;
                } else {
                    checkY = enemy->y + enemy->height + 1;
                }
                int collision = getCollisionType(checkPoints[i], checkY);

                if (collision == 1 && (enemy->collisionPath == 5 || enemy->collisionPath == 6)) {

                    if ((rand() % 100) < 40) {
                        enemy->collisionPath = 1;
                        enemy->speed = 0;

                        if (enemyIndex >= 0) {
                            verticalTimer[enemyIndex] = 0;
                            horizontalTimer[enemyIndex] = 0;
                        }

                        mgba_printf("VERTICAL TRANSITION TO COLLISION_1: Enemy will be carried by scrolling");
                        return;
                    } else {
                        mgba_printf("VERTICAL: 60% chance failed, staying on current path");
                    }
                }

                if (collision == enemy->targetCollision) {
                    targetDetected = 1;
                    edgeCollision = collision;
                    break;
                }
                if (i == 0) edgeCollision = collision;
            }

            mgba_printf("VERTICAL: enemy(%d,%d) dir=%d, edgeColl=%d, target=%d",
                       enemy->x, enemy->y, enemy->direction, edgeCollision, enemy->targetCollision);

            if (targetDetected) {
                if ((enemy->collisionPath == 11 || enemy->collisionPath == 12) &&
                    (enemy->targetCollision == 12 || enemy->targetCollision == 11)) {

                    if ((rand() % 100) < 60) {
                        int newCollisionPath;
                        if (rand() % 2 == 0) {
                            newCollisionPath = 5;
                        } else {
                            newCollisionPath = 6;
                        }

                        enemy->active = 0;
                        enemyCount--;

                        spawnEnemyAtCollisionColor2(newCollisionPath, 1);
                        mgba_printf("COLLISION_11/12 -> %d: Respawned using spawn function", newCollisionPath);
                        return;
                    }
                }

                enemy->collisionPath = enemy->targetCollision;
                enemy->type = 1;

                if (enemy->collisionPath == 11 || enemy->collisionPath == 12) {
                    enemy->direction = 1;
                } else {
                    enemy->direction = 0;
                }

                if (enemyIndex >= 0) {
                    horizontalTimer[enemyIndex] = 0;
                }

                mgba_printf("SUCCESS: Vertical enemy reached target %d, switching to horizontal", enemy->targetCollision);
            }

            if (enemy->direction == 0 && enemy->y <= 16) {
                enemy->y = 8;

                if ((enemy->collisionPath == 11 || enemy->collisionPath == 12) &&
                    (enemy->targetCollision == 12 || enemy->targetCollision == 11)) {

                    if ((rand() % 100) < 60) {
                        int newCollisionPath;
                        if (rand() % 2 == 0) {
                            newCollisionPath = 5;
                        } else {
                            newCollisionPath = 6;
                        }

                        enemy->active = 0;
                        enemyCount--;
                        spawnEnemyAtCollisionColor2(newCollisionPath, 1);
                        mgba_printf("FORCE: COLLISION_11/12 -> %d: Respawned using spawn function", newCollisionPath);
                        return;
                    }
                }

                enemy->collisionPath = enemy->targetCollision;
                enemy->type = 1;
                if (enemy->collisionPath == 11 || enemy->collisionPath == 12) {
                    enemy->direction = 1;
                } else {
                    enemy->direction = 0;
                }

                if (enemyIndex >= 0) {
                    horizontalTimer[enemyIndex] = 0;
                    verticalTimer[enemyIndex] = 0;
                }

            }
            else if (enemy->direction == 1 && enemy->y >= 240) {
                enemy->y = 232;

                if ((enemy->collisionPath == 11 || enemy->collisionPath == 12) &&
                    (enemy->targetCollision == 12 || enemy->targetCollision == 11)) {

                    if ((rand() % 100) < 60) {
                        int newCollisionPath;
                        if (rand() % 2 == 0) {
                            newCollisionPath = 5;
                        } else {
                            newCollisionPath = 6;
                        }

                        enemy->active = 0;
                        enemyCount--;
                        spawnEnemyAtCollisionColor2(newCollisionPath, 1);
                        return;
                    }
                }

                enemy->collisionPath = enemy->targetCollision;
                enemy->type = 1;
                if (enemy->collisionPath == 11 || enemy->collisionPath == 12) {
                    enemy->direction = 1;
                } else {
                    enemy->direction = 0;
                }

                if (enemyIndex >= 0) {
                    horizontalTimer[enemyIndex] = 0;
                    verticalTimer[enemyIndex] = 0;
                }

            }

            if (enemy->y <= 0) enemy->y = 0;
            if (enemy->y >= 256 - enemy->height) enemy->y = 256 - enemy->height;
        }
        else {

            if (enemyIndex >= 0) {
                horizontalTimer[enemyIndex]++;
            }

            if (horizontalTimer[enemyIndex] >= minHorizontalTime) {
                    if ((rand() % 100) < 80) {
                        enemy->type = 0;

                        if (enemy->collisionPath == 11 || enemy->collisionPath == 5) {

                            enemy->direction = 1;
                            if (enemy->collisionPath == 11) {
                                enemy->targetCollision = 12;
                            } else {
                                enemy->targetCollision = 6;
                            }
                        } else {
                            enemy->direction = 0;
                            if (enemy->collisionPath == 12) {
                                enemy->targetCollision = 11;
                            } else {
                                enemy->targetCollision = 5;
                            }
                            mgba_printf("MIN HORIZONTAL TIME: Switching to vertical %d -> %d",
                                       enemy->collisionPath, enemy->targetCollision);
                        }

                        horizontalTimer[enemyIndex] = 0;
                        verticalTimer[enemyIndex] = 0;
                        return;
                    }
                }

            int currentX = enemy->x + enemy->width / 2;
            int currentY = enemy->y;
            int currentCollision = getCollisionType(currentX, currentY);

            if (currentCollision == 10) {
                if (enemy->collisionPath == 11 || enemy->collisionPath == 5) {
                    if (currentX < 128) {
                        enemy->direction = 0;
                    } else {
                        enemy->direction = 1;
                    }
                    mgba_printf("COLLISION_10 DETECTED: Moving away from obstacle");
                }
            }

            int checkAheadX, checkAheadY = enemy->y;
            if (enemy->direction == 0) {
                checkAheadX = enemy->x - 8;
            } else {
                checkAheadX = enemy->x + enemy->width + 8;
            }

            if (getCollisionType(checkAheadX, checkAheadY) == 10) {
                enemy->direction = !enemy->direction;
                mgba_printf("COLLISION_10 AHEAD: Reversing direction immediately");
            }

            if (enemy->direction == 0) {
                enemy->x -= enemy->speed;
            } else {
                enemy->x += enemy->speed;
            }

            int checkX, checkY = enemy->y;

            if (enemy->direction == 0) {
                checkX = enemy->x - 1;
            } else {
                checkX = enemy->x + enemy->width + 1;
            }

            int edgeCollision = getCollisionType(checkX, checkY);

            static int debugTimer = 0;
            if (debugTimer++ % 30 == 0) {
                mgba_printf("HORIZONTAL: enemy(%d,%d) checking(%d,%d) result=%d, path=%d, timer=%d",
                           enemy->x, enemy->y, checkX, checkY, edgeCollision, enemy->collisionPath,
                           (enemyIndex >= 0) ? horizontalTimer[enemyIndex] : 0);
            }

            if ((edgeCollision == 1) &&
                (enemy->collisionPath == 5 || enemy->collisionPath == 6)) {

                if ((rand() % 100) < 40) {
                    enemy->collisionPath = 1;
                    enemy->type = 1;
                    enemy->speed = 0;
                    if (enemyIndex >= 0) {
                        horizontalTimer[enemyIndex] = 0;
                        verticalTimer[enemyIndex] = 0;
                    }
                    mgba_printf("HORIZONTAL TRANSITION TO COLLISION_1: Enemy will be carried by scrolling");
                } else {
                    mgba_printf("60% chance: Staying in normal 5<->6 cycle");
                }
            }


            int canTransition = (enemyIndex >= 0 && horizontalTimer[enemyIndex] >= minHorizontalTime);

            if (edgeCollision != 10 && canTransition) {
                mgba_printf("Transition check: edgeColl=%d, current path=%d, timer=%d", edgeCollision, enemy->collisionPath, horizontalTimer[enemyIndex]);

                int shouldIgnoreCollision1 = 0;
                if ((enemy->collisionPath == 5 || enemy->collisionPath == 6) &&
                    (edgeCollision == 6 || edgeCollision == 5)) {
                    shouldIgnoreCollision1 = 1;
                    mgba_printf("Ignoring COLLISION_1 to allow 5<->6 transition");
                }

                if (edgeCollision != enemy->collisionPath &&
                    (edgeCollision != 1 || shouldIgnoreCollision1)) {

                    if (edgeCollision == 1 && !shouldIgnoreCollision1 &&
                        (enemy->collisionPath == 5 || enemy->collisionPath == 6)) {

                        if ((rand() % 100) < 40) {
                            enemy->collisionPath = 1;
                            enemy->type = 1;
                            enemy->speed = 0;

                            if (enemyIndex >= 0) {
                                horizontalTimer[enemyIndex] = 0;
                                verticalTimer[enemyIndex] = 0;
                            }

                            mgba_printf("HORIZONTAL TRANSITION TO COLLISION_1: Enemy will be carried by scrolling");
                        } else {
                            enemy->direction = !enemy->direction;
                            mgba_printf("60% chance: Avoiding COLLISION_1, reversing direction");
                        }
                    } else {
                        if ((rand() % 100) < 80) {
                            enemy->type = 0;

                            if (enemy->collisionPath == 11 || enemy->collisionPath == 5) {
                                enemy->direction = 1;
                                if (enemy->collisionPath == 11) {
                                    enemy->targetCollision = 12;
                                } else {
                                    enemy->targetCollision = 6;
                                }
                                mgba_printf("EDGE TRANSITION: Top %d -> %d", enemy->collisionPath, enemy->targetCollision);
                            } else {
                                enemy->direction = 0;
                                if (enemy->collisionPath == 12) {
                                    enemy->targetCollision = 11;
                                } else {
                                    enemy->targetCollision = 5;
                                }
                                mgba_printf("EDGE TRANSITION: Bottom %d -> %d", enemy->collisionPath, enemy->targetCollision);
                            }

                            if (enemyIndex >= 0) {
                                horizontalTimer[enemyIndex] = 0;
                                verticalTimer[enemyIndex] = 0;
                            }
                        } else {
                            enemy->direction = !enemy->direction;
                            mgba_printf("Staying horizontal, reversing direction");
                        }
                    }
                }
            }

            if (edgeCollision == enemy->collisionPath && canTransition) {
                if ((rand() % 60) == 0) {
                    if ((rand() % 100) < 80) {
                        enemy->type = 0;

                        if (enemy->collisionPath == 11 || enemy->collisionPath == 5) {
                            enemy->direction = 1;
                            if (enemy->collisionPath == 11) {
                                enemy->targetCollision = 12;
                            } else {
                                enemy->targetCollision = 6;
                            }
                            mgba_printf("RANDOM TRANSITION: Top %d -> %d", enemy->collisionPath, enemy->targetCollision);
                        } else {
                            enemy->direction = 0;
                            if (enemy->collisionPath == 12) {
                                enemy->targetCollision = 11;
                            } else {
                                enemy->targetCollision = 5;
                            }
                            mgba_printf("RANDOM TRANSITION: Bottom %d -> %d", enemy->collisionPath, enemy->targetCollision);
                        }
                        if (enemyIndex >= 0) {
                            horizontalTimer[enemyIndex] = 0;
                            verticalTimer[enemyIndex] = 0;
                        }
                    } else {
                        enemy->direction = !enemy->direction;
                        mgba_printf("Random direction change instead of transition");
                    }
                }
            }

            if ((enemy->x <= 0 || enemy->x >= 256 - enemy->width) && canTransition) {
                mgba_printf("Screen edge hit, forcing transition");

                if ((rand() % 100) < 80) {
                    enemy->type = 0;

                    if (enemy->collisionPath == 11 || enemy->collisionPath == 5) {
                        enemy->direction = 1;
                        if (enemy->collisionPath == 11) {
                            enemy->targetCollision = 12;
                        } else {
                            enemy->targetCollision = 6;
                        }
                        mgba_printf("SCREEN EDGE TRANSITION: Top %d -> %d", enemy->collisionPath, enemy->targetCollision);
                    } else {
                        enemy->direction = 0;
                        if (enemy->collisionPath == 12) {
                            enemy->targetCollision = 11;
                        } else {
                            enemy->targetCollision = 5;
                        }
                        mgba_printf("SCREEN EDGE TRANSITION: Bottom %d -> %d", enemy->collisionPath, enemy->targetCollision);
                    }
                } else {
                    enemy->direction = !enemy->direction;
                    mgba_printf("Screen edge: Staying horizontal, reversing direction");
                }
            }

            if ((rand() % 120) == 0 && edgeCollision == enemy->collisionPath) {
                enemy->direction = !enemy->direction;
                mgba_printf("Random direction change in same area");
            }

            if (enemy->x <= 0) {
                enemy->x = 0;
                enemy->direction = 1;
            }
            if (enemy->x >= 256 - enemy->width) {
                enemy->x = 256 - enemy->width;
                enemy->direction = 0;
            }
        }

        if (enemy->collisionPath != 1) {
            if (enemy->x < 0) enemy->x = 0;
            if (enemy->x > 256 - enemy->width) enemy->x = 256 - enemy->width;
            if (enemy->y < 0) enemy->y = 0;
            if (enemy->y > 256 - enemy->height) enemy->y = 256 - enemy->height;
        }

    } else if (enemy->movementState == 0 && enemy->spawnTimer > 0) {
        if (enemy->collisionPath != 1) {
            enemy->spawnTimer--;
            if (enemy->spawnTimer <= 0) {
                enemy->movementState = 1;
            }
        }
    }
}

void updateEnemies(SPRITE* player) {
    extern int automaticMovementActive;
    extern int automaticMovementActive2;

    int isAutoMovementActive = (automaticMovementActive || automaticMovementActive2);

    checkRightTriangleKills(player);
    checkSquarePatternKills();
    checkIsoscelesPatternKills();
    checkEMPatternKills();

    for (int i = 0; i < 4; i++) {
        if (enemies[i].killed) continue;

        if (!enemies[i].active) {
            if (enemies[i].spawnTimer > 0) {
                enemies[i].spawnTimer--;

                if (enemies[i].spawnTimer <= 0) {

                    if (currentLevel == 1) {
                        int collisionColor, enemyType;
                        switch (i) {
                            case 0: collisionColor = 5; enemyType = 0; break;
                            case 1: collisionColor = 3; enemyType = 0; break;
                            case 2: collisionColor = 4; enemyType = 1; break;
                            case 3: collisionColor = 2; enemyType = 1; break;
                        }
                        spawnEnemyAtCollisionColor(collisionColor, enemyType);
                    } else if (currentLevel == 2 && i < 4) {
                        int collisionColor, enemyType;
                        switch (i) {
                            case 0: collisionColor = 5; enemyType = 1; break;
                            case 1: collisionColor = 6; enemyType = 1; break;
                            case 2: collisionColor = 11; enemyType = 1; break;
                            case 3: collisionColor = 12; enemyType = 1; break;
                        }
                        spawnEnemyAtCollisionColor2(collisionColor, enemyType);
                    }
                }
            }
            continue;
        }

        if (isAutoMovementActive) {
            mgba_printf("AUTOMATIC MOVEMENT ACTIVE: Enemy %d FROZEN at (%d,%d)",
                       i, enemies[i].x, enemies[i].y);

            enemies[i].animationTimer++;
            if (enemies[i].animationTimer >= 10) {
                enemies[i].frame = 0;
                enemies[i].animationTimer = 0;
            }

        }

        if (isAutoMovementActive) {
            mgba_printf("AUTOMATIC MOVEMENT ACTIVE: Enemy %d FROZEN at (%d,%d)",
                       i, enemies[i].x, enemies[i].y);

            enemies[i].animationTimer++;
            if (enemies[i].animationTimer >= 10) {
                enemies[i].frame = 0;
                enemies[i].animationTimer = 0;
            }

            continue;
        }

        if (currentLevel == 2 && enemies[i].collisionPath == 1) {

            mgba_printf("NORMAL: COLLISION_1 enemy %d scrolling: x=%d", i, enemies[i].x);

            if (enemies[i].x <= 0) {
                int newCollisionPath;
                if (rand() % 2 == 0) {
                    newCollisionPath = 11;
                } else {
                    newCollisionPath = 12;
                }

                enemies[i].active = 0;
                enemyCount--;

                spawnEnemyAtCollisionColor2(newCollisionPath, 1);
                mgba_printf("SCREEN EDGE RESPAWN: Enemy %d (COLLISION_1) -> %d",
                           i, newCollisionPath);
                continue;
            }
        }

        if (currentLevel == 1) {
            updateEnemyCollisionMovement(&enemies[i]);
        } else if (currentLevel == 2) {
            updateEnemyCollisionMovement2(&enemies[i]);
        }

        enemies[i].animationTimer++;
        if (enemies[i].animationTimer >= 10) {
            enemies[i].frame = (enemies[i].frame + 1) % 3;
            enemies[i].animationTimer = 0;
        }

    }

    checkRightTriangleKills(player);
    checkSquarePatternKills();
    checkIsoscelesPatternKills();
    checkEMPatternKills();
}

void checkAndRespawnOffscreenEnemy(ENEMY* enemy, int enemyIndex) {
    if (!enemy->active) return;

    if (currentLevel == 2 && enemy->collisionPath == 1) {
        if (enemy->x <= -enemy->width - 20) {
            int newCollisionPath;
            if (rand() % 2 == 0) {
                newCollisionPath = 11;
            } else {
                newCollisionPath = 12;
            }

            enemy->active = 0;
            enemyCount--;

            spawnEnemyAtCollisionColor2(newCollisionPath, 1);
            mgba_printf("Enemy %d (COLLISION_1) -> %d: Respawned (off-screen)",
                       enemyIndex, newCollisionPath);
        }
    }
}

void drawEnemies(void) {





    int isAutoMovementActive = (automaticMovementActive || automaticMovementActive2);

    int cameraX, cameraY;

    if (emCameraActive && emPatternActive2) {

        extern int worldCameraX, worldCameraY;
        cameraX = worldCameraX;
        cameraY = worldCameraY;
        mgba_printf("Enemies using EM camera: (%d,%d)", cameraX, cameraY);
    } else {
        cameraX = player.x - (240 / 2) + 32;
        cameraY = player.y - (160 / 2) + 32;

        if (cameraX < 0) cameraX = 0;
        if (cameraY < 0) cameraY = 0;
        if (cameraX > 256 - 240) cameraX = 256 - 240;
        if (cameraY > 256 - 160) cameraY = 256 - 160;
    }

    for (int i = 0; i < 4; i++) {
        if (!enemies[i].active) {
            shadowOAM[enemies[i].oamIndex].attr0 = (2<<8);
            continue;
        }

        int baseTile;
        int paletteRow = 3 + (i % 3);

        if (isAutoMovementActive) {
            baseTile = 304;
            paletteRow = 2;
        }

        else if (enemies[i].collisionPath == 1 || enemies[i].movementState == 0) {
            baseTile = 304;
        } else if (enemies[i].type == 1) {
            if (enemies[i].frame == 0) {
                baseTile = 304;
            } else if (enemies[i].frame == 1) {
                baseTile = 308;
            } else {
                baseTile = 312;
            }
        } else {
            if (enemies[i].frame == 0) {
                baseTile = 304;
            } else {
                baseTile = 316;
            }
        }

        int screenX = enemies[i].x - cameraX;
        int screenY = enemies[i].y - cameraY;

        mgba_printf("Enemy %d: world(%d,%d) -> screen(%d,%d) with camera(%d,%d)",
                   i, enemies[i].x, enemies[i].y, screenX, screenY, cameraX, cameraY);

        if (screenX < -32 || screenX > 240 || screenY < -32 || screenY > 160) {
            shadowOAM[enemies[i].oamIndex].attr0 = (2<<8);
            continue;
        }

        shadowOAM[enemies[i].oamIndex].attr0 = ((screenY) & 0xFF) | (0<<14) | (0<<13);

        if (isAutoMovementActive) {
            shadowOAM[enemies[i].oamIndex].attr1 = ((screenX) & 0x1FF) | (2<<14);
            shadowOAM[enemies[i].oamIndex].attr2 = (((paletteRow) & 0xF) <<12) | (((1) & 3) << 10) | ((((0) * (32) + (baseTile))) & 0x3FF);
        }

        else if (enemies[i].type == 1 && enemies[i].direction == 0) {
            shadowOAM[enemies[i].oamIndex].attr1 = ((screenX) & 0x1FF) | (2<<14) | (1<<12);
            shadowOAM[enemies[i].oamIndex].attr2 = (((paletteRow) & 0xF) <<12) | (((1) & 3) << 10) | ((((0) * (32) + (baseTile))) & 0x3FF);
        } else {
            shadowOAM[enemies[i].oamIndex].attr1 = ((screenX) & 0x1FF) | (2<<14);
            shadowOAM[enemies[i].oamIndex].attr2 = (((paletteRow) & 0xF) <<12) | (((1) & 3) << 10) | ((((0) * (32) + (baseTile))) & 0x3FF);
        }
    }
}

int checkCollision(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2) {
    return (x1 < x2 + w2 && x1 + w1 > x2 &&
            y1 < y2 + h2 && y1 + h1 > y2);
}

void killEnemy(int enemyIndex) {
    if (enemyIndex >= 0 && enemyIndex < 4 && enemies[enemyIndex].active) {
        mgba_printf("KILLED ENEMY %d!", enemyIndex);
        enemies[enemyIndex].active = 0;
        enemies[enemyIndex].killed = 1;
        enemyCount--;
    }
}

void checkRightTriangleKills(SPRITE* player) {
    extern int rightTrianglePatternActive;
    extern int rightTrianglePatternActive2;
    extern int showAccessory;
    extern int showAccessory2;
    extern int currentLevel;
    extern int automaticMovementActive;
    extern int automaticMovementActive2;

    int isAutoMovementActive = (currentLevel == 1 && automaticMovementActive) ||
                               (currentLevel == 2 && automaticMovementActive2);

    if (!isAutoMovementActive) {
        return;
    }

    int isRightTriangleActive = (currentLevel == 1 && rightTrianglePatternActive && showAccessory) ||
                               (currentLevel == 2 && rightTrianglePatternActive2 && showAccessory2);

    if (!isRightTriangleActive) {
        return;
    }

    mgba_printf("Checking RIGHT TRIANGLE kills for level %d...", currentLevel);

    if (boss.active && ((currentLevel == 1 && boss.level == 1) ||
                        (currentLevel == 2 && boss.level == 2))) {
        if (checkCollision(
            player->x, player->y, player->width, player->height,
            boss.x, boss.y, boss.width, boss.height
        )) {
            mgba_printf("Right triangle: Player killed BOSS in level %d!", currentLevel);
            boss.active = 0;
            resetBossBullets(&boss);
        }
    }

    for (int i = 0; i < 4; i++) {
        if (!enemies[i].active) continue;


        if (checkCollision(
            player->x, player->y, player->width, player->height,
            enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height
        )) {
            mgba_printf("Right triangle: Player killed enemy %d in level %d!", i, currentLevel);
            killEnemy(i);
        }
    }
}

void checkSquarePatternKills(void) {
    extern int squarePatternActive;
    extern BULLET playerBullets[];
    extern int automaticMovementActive;

    if (!automaticMovementActive) {
        return;
    }

    if (!squarePatternActive) {
        return;
    }

    mgba_printf("Checking SQUARE PATTERN kills (bullets vs frozen enemies)...");

    for (int b = 0; b < 5; b++) {
        if (!playerBullets[b].active) continue;

        if (boss.active && boss.level == 1) {
            if (checkCollision(
                playerBullets[b].x, playerBullets[b].y,
                playerBullets[b].width, playerBullets[b].height,
                boss.x, boss.y, boss.width, boss.height
            )) {
                mgba_printf("Square pattern: Bullet killed BOSS!");
                boss.active = 0;
                resetBossBullets(&boss);
                playerBullets[b].active = 0;
                continue;
            }
        }

        for (int i = 0; i < 4; i++) {
            if (!enemies[i].active) continue;

            if (checkCollision(
                playerBullets[b].x, playerBullets[b].y,
                playerBullets[b].width, playerBullets[b].height,
                enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height
            )) {
                mgba_printf("Square pattern: Bullet killed FROZEN enemy %d!", i);
                killEnemy(i);
                playerBullets[b].active = 0;
                break;
            }
        }
    }
}

void checkIsoscelesPatternKills(void) {
    extern int isoscelesTrianglePatternActive;
    extern int isoscelesTrianglePatternActive2;
    extern int patternSpritePosX[3];
    extern int patternSpritePosY[3];
    extern int patternSpritePosX2[3];
    extern int patternSpritePosY2[3];
    extern int patternCompleted;
    extern int patternCompleted2;
    extern int currentLevel;
    extern int showPatternSprite;
    extern int showPatternSprite2;

    extern int currentLevel;
    extern int automaticMovementActive;
    extern int automaticMovementActive2;

    mgba_printf("=== ISOSCELES KILL CHECK Level %d ===", currentLevel);

    int isAutoMovementActive = (currentLevel == 1 && automaticMovementActive) ||
                               (currentLevel == 2 && automaticMovementActive2);

    if (!isAutoMovementActive) {
        mgba_printf("SKIP: Not in automatic movement");
        return;
    }

    int isActive = 0;
    int isSpriteShowing = 0;
    int activePatternNum = 0;
    int spriteWorldX = 0, spriteWorldY = 0;

    if (currentLevel == 1) {
        isActive = isoscelesTrianglePatternActive;
        isSpriteShowing = showPatternSprite;
        activePatternNum = patternCompleted;
        mgba_printf("L1: active=%d, show=%d, pattern=%d",
                   isActive, isSpriteShowing, patternCompleted);

        if (patternCompleted > 0) {
            int idx = patternCompleted - 1;
            spriteWorldX = patternSpritePosX[idx];
            spriteWorldY = patternSpritePosY[idx];
        }
    }
    else if (currentLevel == 2) {
        isActive = isoscelesTrianglePatternActive2;
        isSpriteShowing = showPatternSprite2;
        activePatternNum = patternCompleted2;
        mgba_printf("L2: active2=%d, show2=%d, pattern=%d",
                   isActive, isSpriteShowing, patternCompleted);

        if (patternCompleted2 > 0) {
            int idx = patternCompleted2 - 1;
            spriteWorldX = patternSpritePosX2[idx];
            spriteWorldY = patternSpritePosY2[idx];
        }
    }

    if (!isActive || activePatternNum == 0 || !isSpriteShowing) {
        mgba_printf("SKIP: Conditions not met");
        return;
    }

    mgba_printf("Sprite 632 at: (%d,%d)", spriteWorldX, spriteWorldY);

    int spriteWidth = 64, spriteHeight = 64;
    int killCount = 0;



    if (boss.active&& ((currentLevel == 1 && boss.level == 1) ||
                        (currentLevel == 2 && boss.level == 2))) {
        mgba_printf("Checking boss at (%d,%d) against sprite at (%d,%d)",
                   boss.x, boss.y, spriteWorldX, spriteWorldY);

        int collision = checkCollision(
            spriteWorldX, spriteWorldY, spriteWidth, spriteHeight,
            boss.x, boss.y, boss.width, boss.height
        );

        if (collision) {
            mgba_printf("*** HIT! BOSS killed by isosceles sprite!");
            boss.active = 0;
            resetBossBullets(&boss);
            killCount++;
        }
    }
    for (int i = 0; i < 4; i++) {
        if (!enemies[i].active) continue;

        mgba_printf("Checking enemy %d at (%d,%d)",
                   i, enemies[i].x, enemies[i].y);

        int collision = checkCollision(
            spriteWorldX, spriteWorldY, spriteWidth, spriteHeight,
            enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height
        );

        if (collision) {
            mgba_printf("*** HIT! Enemy %d killed by isosceles sprite!", i);
            killEnemy(i);
            killCount++;
        }
    }

    mgba_printf("Total kills: %d", killCount);
}

void checkEMPatternKills(void) {
    extern int emPatternActive2;
    extern int showEmPatternSprite2;
    extern int currentLevel;
    extern int patternCompleted2;
    extern int emPatternSpriteIndex;

    extern int automaticMovementActive2;

    if (!automaticMovementActive2) {
        return;
    }

    if (currentLevel != 2 || !emPatternActive2 || !showEmPatternSprite2) {
        return;
    }

    mgba_printf("=== EM PATTERN KILL CHECK (stationary sprite 632) ===");
    mgba_printf("Pattern %d, Pause Index %d, showEmPatternSprite2=%d",
                patternCompleted2, emPatternSpriteIndex, showEmPatternSprite2);

    int spriteWorldX = 0, spriteWorldY = 0;
    int spriteWidth = 64, spriteHeight = 64;

    if (patternCompleted2 == 1) {
        switch (emPatternSpriteIndex) {
            case 0:
                spriteWorldX = 20;
                spriteWorldY = 256 - 64;
                break;
            case 1:
                spriteWorldX = 20;
                spriteWorldY = 0;
                break;
            case 2:
                spriteWorldX = 180;
                spriteWorldY = 0;
                break;
            case 3:
                spriteWorldX = 180;
                spriteWorldY = 256 - 64;
                break;
        }
    }
    else if (patternCompleted2 == 2) {
        switch (emPatternSpriteIndex) {
            case 0:
                spriteWorldX = 20;
                spriteWorldY = 0;
                break;
            case 1:
                spriteWorldX = 180;
                spriteWorldY = 0;
                break;
            case 2:
                spriteWorldX = 180;
                spriteWorldY = 256 - 64;
                break;
            case 3:
                spriteWorldX = 20;
                spriteWorldY = 256 - 64;
                break;
        }
    }
    else if (patternCompleted2 == 3) {
        switch (emPatternSpriteIndex) {
            case 0:
                spriteWorldX = 180;
                spriteWorldY = 256 - 64;
                break;
            case 1:
                spriteWorldX = 20;
                spriteWorldY = 256 - 64;
                break;
            case 2:
                spriteWorldX = 20;
                spriteWorldY = 0;
                break;
            case 3:
                spriteWorldX = 180;
                spriteWorldY = 0;
                break;
        }
    }

    mgba_printf("Sprite 632 at WORLD position: (%d,%d) size: %dx%d",
               spriteWorldX, spriteWorldY, spriteWidth, spriteHeight);

    if (boss.active && boss.level == 2) {
        int spriteCenterX = spriteWorldX + spriteWidth/2;
        int spriteCenterY = spriteWorldY + spriteHeight/2;
        int bossCenterX = boss.x + boss.width/2;
        int bossCenterY = boss.y + boss.height/2;

        int dx = abs(spriteCenterX - bossCenterX);
        int dy = abs(spriteCenterY - bossCenterY);

        mgba_printf("BOSS: world(%d,%d) size=%dx%d, dist from sprite: dx=%d, dy=%d",
                   boss.x, boss.y, boss.width, boss.height, dx, dy);

        int collision = checkCollision(
            spriteWorldX, spriteWorldY, spriteWidth, spriteHeight,
            boss.x, boss.y, boss.width, boss.height
        );

        mgba_printf("  Collision with sprite 632: %s", collision ? "YES" : "NO");

        if (collision) {
            mgba_printf("*** HIT! EM pattern sprite 632 killed BOSS!");
            boss.active = 0;
            resetBossBullets(&boss);
        }
    }

    for (int i = 0; i < 4; i++) {
        if (!enemies[i].active) continue;

        int spriteCenterX = spriteWorldX + spriteWidth/2;
        int spriteCenterY = spriteWorldY + spriteHeight/2;
        int enemyCenterX = enemies[i].x + enemies[i].width/2;
        int enemyCenterY = enemies[i].y + enemies[i].height/2;

        int dx = abs(spriteCenterX - enemyCenterX);
        int dy = abs(spriteCenterY - enemyCenterY);

        mgba_printf("Enemy %d: world(%d,%d) size=%dx%d, dist from sprite: dx=%d, dy=%d",
                   i, enemies[i].x, enemies[i].y,
                   enemies[i].width, enemies[i].height, dx, dy);

        int collision = checkCollision(
            spriteWorldX, spriteWorldY, spriteWidth, spriteHeight,
            enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height
        );

        mgba_printf("  Collision with sprite 632: %s", collision ? "YES" : "NO");

        if (collision) {
            mgba_printf("*** HIT! EM pattern sprite 632 killed enemy %d!", i);
            killEnemy(i);
        }
    }
    mgba_printf("============================================");
}

void resetEnemies(void) {
    for (int i = 0; i < 4; i++) {
        enemies[i].active = 0;
        enemies[i].killed = 0;

        if (currentLevel == 1) {
            enemies[i].spawnTimer = 60 * (i + 1);
        } else if (currentLevel == 2) {
            enemies[i].spawnTimer = 30 * (i + 1);
        } else {
            enemies[i].spawnTimer = 0;
        }

        enemies[i].movementState = 0;
        enemies[i].collisionPath = 0;
        enemies[i].type = 0;
        enemies[i].direction = 0;
        enemies[i].x = 0;
        enemies[i].y = 0;
        enemies[i].frame = 0;
        enemies[i].animationTimer = 0;
        enemies[i].speed = 1;
        enemies[i].targetCollision = 0;
    }
    enemyCount = 0;
    enemySpawnTimer = 0;
}

int areAllEnemiesKilled(void) {
    if (currentLevel == 1) {
        for (int i = 0; i < 4; i++) {
            if (enemies[i].active || enemies[i].spawnTimer > 0) {
                mgba_printf("Level 1: Enemy %d still alive (active=%d, spawnTimer=%d)",
                           i, enemies[i].active, enemies[i].spawnTimer);
                return 0;
            }
        }
        mgba_printf("Level 1: ALL enemies killed!");
        return 1;
    }
    else if (currentLevel == 2) {
        int totalEnemiesFound = 0;
        int activeEnemiesFound = 0;

        for (int i = 0; i < 4; i++) {
            if (enemies[i].active || enemies[i].spawnTimer > 0) {
                totalEnemiesFound++;
                if (enemies[i].active) {
                    activeEnemiesFound++;
                    mgba_printf("Level 2: Enemy %d ACTIVE at (%d,%d)",
                               i, enemies[i].x, enemies[i].y);
                } else if (enemies[i].spawnTimer > 0) {
                    mgba_printf("Level 2: Enemy %d waiting to spawn (timer=%d)",
                               i, enemies[i].spawnTimer);
                }
            }
        }

        extern BOSS boss;
        if (boss.active) {
            mgba_printf("Level 2: Boss is ACTIVE");
            return 0;
        }

        mgba_printf("Level 2: Total enemies tracked: %d, Active enemies: %d",
                   totalEnemiesFound, activeEnemiesFound);

        if (activeEnemiesFound == 0 && !boss.active) {
            mgba_printf("Level 2: ALL enemies and boss killed!");
            return 1;
        }

        return 0;
    }

    return 0;
}

void debugCollisionMapTopArea() {
    static int lastBG0 = 0, lastBG1 = 0, lastBG2 = 0;

    if ((*(volatile unsigned short*) 0x04000010) != lastBG0 && (*(volatile unsigned short*) 0x04000010) > 255) {
        mgba_printf("BG0 CORRUPTION: %d -> %d", lastBG0, (*(volatile unsigned short*) 0x04000010));
    }
    if ((*(volatile unsigned short*) 0x04000014) != lastBG1 && (*(volatile unsigned short*) 0x04000014) > 255) {
        mgba_printf("BG1 CORRUPTION: %d -> %d", lastBG1, (*(volatile unsigned short*) 0x04000014));
    }
    if ((*(volatile unsigned short*) 0x04000018) != lastBG2 && (*(volatile unsigned short*) 0x04000018) > 255) {
        mgba_printf("BG2 CORRUPTION: %d -> %d", lastBG2, (*(volatile unsigned short*) 0x04000018));
    }

    lastBG0 = (*(volatile unsigned short*) 0x04000010);
    lastBG1 = (*(volatile unsigned short*) 0x04000014);
    lastBG2 = (*(volatile unsigned short*) 0x04000018);
}

void debugEnemyPathCollisions() {
    mgba_printf("=== EDGE COLLISION CHECK ===");

    int edgeTestPoints[][3] = {
        {0, 8, 11},
        {0, 232, 12},

        {255, 8, 5},
        {255, 232, 6},
    };

    for (int i = 0; i < 4; i++) {
        int x = edgeTestPoints[i][0];
        int y = edgeTestPoints[i][1];
        int expected = edgeTestPoints[i][2];
        int actual = getCollisionType(x, y);
        mgba_printf("Edge (%d,%d): expected=%d, actual=%d", x, y, expected, actual);
    }
    mgba_printf("============================");
}
