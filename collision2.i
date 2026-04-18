# 0 "collision2.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "collision2.c"
# 1 "collision.h" 1



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
# 5 "collision.h" 2
# 1 "tempCol.h" 1
# 21 "tempCol.h"
extern const unsigned short tempColBitmap[32768];


extern const unsigned short tempColPal[256];
# 6 "collision.h" 2
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
# 7 "collision.h" 2

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
# 2 "collision2.c" 2
# 1 "tempCol2.h" 1
# 21 "tempCol2.h"
extern const unsigned short tempCol2Bitmap[32768];


extern const unsigned short tempCol2Pal[256];
# 3 "collision2.c" 2
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
# 4 "collision2.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 5 "collision2.c" 2
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
# 6 "collision2.c" 2

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 229 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4

# 229 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 36 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 160 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 344 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 37 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3



# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdarg.h" 1 3 4
# 40 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 60 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3

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
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





typedef __FILE FILE;



typedef _fpos_t fpos_t;





typedef __off_t off_t;




typedef _ssize_t ssize_t;



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 86 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 192 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 272 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 402 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 583 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 691 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 745 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 801 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3

# 8 "collision2.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3





# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.1.0/include/stddef.h" 1 3 4
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3



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

# 9 "collision2.c" 2
# 1 "whoosh.h" 1



# 3 "whoosh.h"
extern const unsigned int whoosh_sampleRate;
extern const unsigned int whoosh_length;
extern const signed char whoosh_data[];
# 10 "collision2.c" 2
# 1 "digitalSound.h" 1



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
# 11 "collision2.c" 2
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
# 12 "collision2.c" 2
# 22 "collision2.c"
int rightTrianglePatternActive2 = 0;
int isoscelesTrianglePatternActive2 = 0;
int emPatternActive2 = 0;
int showAccessory2 = 0;

int currentCollisionStep2 = 0;
int spriteChanged2 = 0;
int buttonsCollected2[5] = {0, 0, 0, 0, 0};
int sequenceComplete2 = 0;

int patternCompleted2 = 0;
int patternSpritePosX2[3];
int patternSpritePosY2[3];
int showPatternSprite2 = 0;
int patternSpriteTimer2 = 0;

int patternSpriteOAMIndex[3] = {90, 91, 92};


int automaticMovementActive2 = 0;
int currentMovementStep2 = 0;
int movementSequence2[24] = {0};
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




SPRITE gameButtons2[5];
int buttonAnimated2[5] = {0, 0, 0, 0, 0};
int buttonAnimationTimer2[5] = {0, 0, 0, 0, 0};

int bgHOff2 = 0;
int bgVOff2 = 0;

const int BUTTON_POSITIONS_X2[5] = {193, 39, 192, 39, 117};
const int BUTTON_POSITIONS_Y2[5] = {47, 223, 219, 49, 128};

inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*)tempCol2Bitmap)[((y) * (256) + (x))];
}

void initPatternPositions2(void) {

    patternSpritePosX2[0] = 40;
    patternSpritePosY2[0] = 110;

    patternSpritePosX2[1] = 170;
    patternSpritePosY2[1] = 128;

    patternSpritePosX2[2] = 170;
    patternSpritePosY2[2] = 128;

    shadowOAM[90].attr0 = (2<<8);

    patternCompleted2 = 0;
    showPatternSprite2 = 0;
    patternSpriteTimer2 = 0;

    for (int i = 0; i < 3; i++) {
        shadowOAM[patternSpriteOAMIndex[i]].attr0 = (2<<8);
    }
}

void drawPatternSprite2(SPRITE* player) {

    if (emPatternActive2) {
        mgba_printf("drawPatternSprite2: EM pattern active - hiding");
        shadowOAM[90].attr0 = (2<<8);
        return;
    }

    if (!showPatternSprite2 || patternSpriteTimer2 <= 0 || patternCompleted2 == 0) {
        mgba_printf("drawPatternSprite2: Not drawing - show=%d, timer=%d, pattern=%d",
                   showPatternSprite2, patternSpriteTimer2, patternCompleted2);
        shadowOAM[90].attr0 = (2<<8);
        return;
    }

    int cameraX = player->x - (240 / 2) + 32;
    int cameraY = player->y - (160 / 2) + 32;

    if (cameraX < 0) cameraX = 0;
    if (cameraY < 0) cameraY = 0;
    if (cameraX > 256 - 240) cameraX = 256 - 240;
    if (cameraY > 256 - 160) cameraY = 256 - 160;

    int patternIndex = patternCompleted2 - 1;
    int worldX = patternSpritePosX2[patternIndex];
    int worldY = patternSpritePosY2[patternIndex];

    int screenX = worldX - cameraX;
    int screenY = worldY - cameraY;

    if (screenX < -64 || screenX > 240 ||
        screenY < -64 || screenY > 160) {
        shadowOAM[90].attr0 = (2<<8);
        return;
    }

    shadowOAM[90].attr0 = ((screenY) & 0xFF) | (0<<14) | (0<<13);
    shadowOAM[90].attr1 = ((screenX) & 0x1FF) | (3<<14);
    shadowOAM[90].attr2 = (((7) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (632))) & 0x3FF);

}

void drawEmPatternSprite2(SPRITE* player) {

    if (!showEmPatternSprite2) {
        shadowOAM[95].attr0 = (2<<8);
        return;
    }


    int worldX, worldY;

    if (patternCompleted2 == 1) {
        switch (emPatternSpriteIndex) {
            case 0:
                worldX = 20;
                worldY = 256 - 64;
                break;
            case 1:
                worldX = 20;
                worldY = 0;
                break;
            case 2:
                worldX = 180;
                worldY = 0;
                break;
            case 3:
                worldX = 180;
                worldY = 256 - 64;
                break;
            default:
                worldX = 0;
                worldY = 0;
        }
    }
    else if (patternCompleted2 == 2) {
        switch (emPatternSpriteIndex) {
            case 0:
                worldX = 20;
                worldY = 0;
                break;
            case 1:
                worldX = 180;
                worldY = 0;
                break;
            case 2:
                worldX = 180;
                worldY = 256 - 64;
                break;
            case 3:
                worldX = 20;
                worldY = 256 - 64;
                break;
            default:
                worldX = 0;
                worldY = 0;
        }
    }
    else if (patternCompleted2 == 3) {
        switch (emPatternSpriteIndex) {
            case 0:
                worldX = 180;
                worldY = 256 - 64;
                break;
            case 1:
                worldX = 20;
                worldY = 256 - 64;
                break;
            case 2:
                worldX = 20;
                worldY = 0;
                break;
            case 3:
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
        cameraX = player->x - (240 / 2) + 32;
        cameraY = player->y - (160 / 2) + 32;

        if (cameraX < 0) cameraX = 0;
        if (cameraY < 0) cameraY = 0;
        if (cameraX > 256 - 240) cameraX = 256 - 240;
        if (cameraY > 256 - 160) cameraY = 256 - 160;
    }

    int screenX = worldX - cameraX;
    int screenY = worldY - cameraY;

    if (screenX < -64 || screenX > 240 ||
        screenY < -64 || screenY > 160) {
        shadowOAM[95].attr0 = (2<<8);
        mgba_printf("EM Sprite: OFF SCREEN at screen(%d,%d) - hiding", screenX, screenY);
        return;
    }

    mgba_printf("EM Sprite: Pattern%d, Pause%d - World(%d,%d) -> Screen(%d,%d) Camera(%d,%d)",
                patternCompleted2, emPatternSpriteIndex + 1,
                worldX, worldY, screenX, screenY, cameraX, cameraY);

    shadowOAM[95].attr0 = ((screenY) & 0xFF) | (0<<14) | (0<<13);
    shadowOAM[95].attr1 = ((screenX) & 0x1FF) | (3<<14);
    shadowOAM[95].attr2 = (((7) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (632))) & 0x3FF);
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
            shadowOAM[90].attr0 = (2<<8);
        }
    }
}

void updateEmPatternSpriteTimer2(void) {
    if (automaticMovementFinished2) {
        shadowOAM[95].attr0 = (2<<8);
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
            shadowOAM[95].attr0 = (2<<8);
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





    int cameraX, cameraY;

    if (emCameraActive && emPatternActive2) {
        cameraX = worldCameraX;
        cameraY = worldCameraY;
    } else {
        cameraX = player->x - (240 / 2) + 32;
        cameraY = player->y - (160 / 2) + 32;

        if (cameraX < 0) cameraX = 0;
        if (cameraY < 0) cameraY = 0;
        if (cameraX > 256 - 240) cameraX = 256 - 240;
        if (cameraY > 256 - 160) cameraY = 256 - 160;
    }


    for (int i = 0; i < 5; i++) {
        int screenX = BUTTON_POSITIONS_X2[i] - cameraX;
        int screenY = BUTTON_POSITIONS_Y2[i] - cameraY;

        if (screenX < -32 || screenX > 240 || screenY < -32 || screenY > 160) {
            shadowOAM[gameButtons2[i].oamIndex].attr0 = (2<<8);
            shadowOAM[gameButtons2[i].oamIndex + 5].attr0 = (2<<8);
            continue;
        }

        int paletteRow = getButtonPaletteRow(i);

        int tileID = buttonAnimated2[i] ? 780 : 776;
        shadowOAM[gameButtons2[i].oamIndex].attr0 = ((screenY) & 0xFF) | (0<<14) | (0<<13);
        shadowOAM[gameButtons2[i].oamIndex].attr1 = ((screenX) & 0x1FF) | (2<<14);
        shadowOAM[gameButtons2[i].oamIndex].attr2 = (((paletteRow) & 0xF) <<12) | (((1) & 3) << 10) | ((((0) * (32) + (tileID))) & 0x3FF);

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
        movementSeq[*step] = 5; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 5; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 1; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 3; movementDur[*step] = 14; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 0 && buttons[1] == 3 && buttons[2] == 1 && buttons[3] == 4 && buttons[4] == 0) {
        mgba_printf("Pattern 0,3,1,4,0");
        movementSeq[*step] = 2; movementDur[*step] = 14; (*step)++;
        movementSeq[*step] = 0; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 10; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 4 && buttons[1] == 1 && buttons[2] == 3 && buttons[3] == 0 && buttons[4] == 4) {
        mgba_printf("Pattern 4,1,3,0,4");
        movementSeq[*step] = 5; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 1; movementDur[*step] =17; (*step)++;
        movementSeq[*step] = 3; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 5; movementDur[*step] = 10; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 3 && buttons[1] == 0 && buttons[2] == 4 && buttons[3] == 1 && buttons[4] == 3) {
        mgba_printf("Pattern 3,0,4,1,3");
        movementSeq[*step] = 3; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 5; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 5; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 1; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 3 && buttons[1] == 1 && buttons[2] == 4 && buttons[3] == 0 && buttons[4] == 3) {
        mgba_printf("Pattern 3,1,4,0,3");
        movementSeq[*step] = 0; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 2; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 1 && buttons[1] == 4 && buttons[2] == 0 && buttons[3] == 3 && buttons[4] == 1) {
        mgba_printf("Pattern 1,4,0,3,1");
        movementSeq[*step] = 6; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 2; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 0; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
    }
    else if (buttons[0] == 1 && buttons[1] == 3 && buttons[2] == 0 && buttons[3] == 4 && buttons[4] == 1) {
        mgba_printf("Pattern 1,3,0,4,1");
        movementSeq[*step] = 1; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 3; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 5; movementDur[*step] = 12; (*step)++;
        movementSeq[*step] = 5; movementDur[*step] = 10; (*step)++;

        foundPattern = 1;
    }
}

void setupIsoscelesTriangleMovement2(int* buttons, int length, int* movementSeq, int* movementDur, int* step) {
    int foundPattern = 0;
    patternCompleted2 = 0;

    if (buttons[0] == 4 && buttons[1] == 1 && buttons[2] == 3 && buttons[3] == 4) {
        mgba_printf("Pattern 3,4,2,1,3 - DIAG_DOWN_RIGHT x2, RIGHT, UP");
        movementSeq[*step] = 5; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = 1; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = 4; movementDur[*step] = 7; (*step)++;

        foundPattern = 1;
        patternCompleted2 = 1;
    }
    else if (buttons[0] == 2 && buttons[1] == 4 && buttons[2] == 0 && buttons[3] == 2) {
        mgba_printf("Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = 7; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = 0; movementDur[*step] = 12; (*step)++;

        foundPattern = 1;
        patternCompleted2 = 2;
    }
    else if (buttons[0] == 0 && buttons[1] == 4 && buttons[2] == 2 && buttons[3] == 0) {
        mgba_printf("Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2");
        movementSeq[*step] = 5; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = 4; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = 1; movementDur[*step] = 12; (*step)++;

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

        movementSeq[*step] = 11; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 0; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 10; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = 4; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = 10; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 1; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 11; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 2; movementDur[*step] = 17; (*step)++;

        foundPattern = 1;
        patternCompleted2 = 1;
        emPatternActive2 = 1;
        showEmPatternSprite2 = 1;
        emPatternSpriteTimer2 = 5;
        showAccessory2 = 1;
        mgba_printf("Pattern 1 setup complete, step = %d", *step);

        for (int i = *step - 9; i < *step; i++) {
            int accessoryType = -1;
            if (movementSeq[i] == 11 || movementSeq[i] == 0) {
                accessoryType = 688;
            } else if (movementSeq[i] == 10 || movementSeq[i] == 1) {
                accessoryType = 692;
            } else if (movementSeq[i] == 2 || movementSeq[i] == 6 ||
                       movementSeq[i] == 4) {
                accessoryType = 816;
            }
            mgba_printf("Step %d: movement=%d, accessory=%d", i, movementSeq[i], accessoryType);
            int shouldShootBullet = 0;
            if (movementSeq[i] >= 8 && movementSeq[i] <= 11) {
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

        movementSeq[*step] = 10; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = 4; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = 10; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 1; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 11; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 2; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 11; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 0; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
        patternCompleted2 = 2;
        emPatternActive2 = 1;
        showEmPatternSprite2 = 1;
        emPatternSpriteTimer2 = 5;
        showAccessory2 = 1;

        for (int i = *step - 9; i < *step; i++) {
            int accessoryType = -1;
            if (movementSeq[i] == 11 || movementSeq[i] == 0) {
                accessoryType = 688;
            } else if (movementSeq[i] == 10 || movementSeq[i] == 1) {
                accessoryType = 692;
            } else if (movementSeq[i] == 2 || movementSeq[i] == 6 ||
                       movementSeq[i] == 4) {
                accessoryType = 816;
            }
            mgba_printf("Step %d: movement=%d, accessory=%d", i, movementSeq[i], accessoryType);
            int shouldShootBullet = 0;
            if (movementSeq[i] >= 8 && movementSeq[i] <= 11) {
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

        movementSeq[*step] = 11; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 2; movementDur[*step] = 17; (*step)++;
        movementSeq[*step] = 11; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 0; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 10; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 6; movementDur[*step] = 10; (*step)++;
        movementSeq[*step] = 4; movementDur[*step] = 15; (*step)++;
        movementSeq[*step] = 10; movementDur[*step] = 20; (*step)++;
        movementSeq[*step] = 1; movementDur[*step] = 15; (*step)++;

        foundPattern = 1;
        patternCompleted2 = 3;
        emPatternActive2 = 1;
        showEmPatternSprite2 = 1;
        emPatternSpriteTimer2 = 5;
        showAccessory2 = 1;

        for (int i = *step - 9; i < *step; i++) {
            int accessoryType = -1;
            if (movementSeq[i] == 11 || movementSeq[i] == 0) {
                accessoryType = 688;
            } else if (movementSeq[i] == 10 || movementSeq[i] == 1) {
                accessoryType = 692;
            } else if (movementSeq[i] == 2 || movementSeq[i] == 6 ||
                       movementSeq[i] == 4) {
                accessoryType = 816;
            }
            mgba_printf("Step %d: movement=%d, accessory=%d", i, movementSeq[i], accessoryType);
            int shouldShootBullet = 0;
            if (movementSeq[i] >= 8 && movementSeq[i] <= 11) {
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
        case 1:
            setupRightTriangleFromSequence2(buttonSequence, sequenceLength, movementSeq, movementDur, &step);
            break;

        case 2:
            setupIsoscelesTriangleMovement2(buttonSequence, sequenceLength, movementSeq, movementDur, &step);
            break;

        case 3:
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
            case 2: dirName = "LEFT"; break;
            case 3: dirName = "RIGHT"; break;
            case 1: dirName = "UP"; break;
            case 0: dirName = "DOWN"; break;
            case 4: dirName = "DIAG_DOWN_RIGHT"; break;
            case 5: dirName = "DIAG_DOWN_LEFT"; break;
            case 6: dirName = "DIAG_UP_RIGHT"; break;
            case 7: dirName = "DIAG_UP_LEFT"; break;
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

                    setupPatternMovement2(2, buttonSequence2, buttonSequenceLength2,
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
                    setupPatternMovement2(1, buttonSequence2, buttonSequenceLength2,
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
                    mgba_printf("PATTERN_EM constant value is: %d", 3);

                    mgba_printf("Full 7-button sequence:");
                    for (int j = 0; j < 6; j++) {
                        mgba_printf("  [%d] = %d", j, buttonSequence2[j]);
                    }

                    int movementLen = 0;

                    rightTrianglePatternActive2 = 0;
                    isoscelesTrianglePatternActive2 = 0;
                    showAccessory2 = 0;
                    emPatternActive2 = 0;

                    mgba_printf("Calling setupPatternMovement2 with PATTERN_EM=%d", 3);
                    setupPatternMovement2(3, buttonSequence2, buttonSequenceLength2,
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

    shadowOAM[90].attr0 = (2<<8);
    shadowOAM[95].attr0 = (2<<8);

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
        int isPauseStep = (movementType == 10 || movementType == 11);

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

        if (movementType == 10 || movementType == 11) {

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
                if (movementType == 10) {
                    worldCameraY = 0;
                } else {
                    worldCameraY = 256 - 160;
                }
            }

            else if (remainingTime <= totalTime * 3/4 && remainingTime > totalTime / 4) {

                if (worldCameraY == savedCameraY) {
                    int targetCameraY;
                    if (movementType == 10) {
                        targetCameraY = 0;
                        mgba_printf("=== MOVING TO PAUSE_UP POSITION #%d ===", currentStep);
                    } else {
                        targetCameraY = 256 - 160;
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
                    if (movementType == 10) {
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
        shadowOAM[90].attr0 = (2<<8);
        shadowOAM[95].attr0 = (2<<8);
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
        case 2: dirName = "LEFT"; break;
        case 3: dirName = "RIGHT"; break;
        case 1: dirName = "UP"; break;
        case 0: dirName = "DOWN"; break;
        case 4: dirName = "DIAG_DOWN_RIGHT"; break;
        case 5: dirName = "DIAG_DOWN_LEFT"; break;
        case 6: dirName = "DIAG_UP_RIGHT"; break;
        case 7: dirName = "DIAG_UP_LEFT"; break;
        case 8: dirName = "PAUSE_LEFT"; break;
        case 9: dirName = "PAUSE_RIGHT"; break;
        case 10: dirName = "PAUSE_UP"; break;
        case 11: dirName = "PAUSE_DOWN"; break;
        default: dirName = "UNKNOWN"; break;
    }
    mgba_printf("Movement2 step %d: %s (timer: %d)", currentMovementStep2, dirName, movementTimers2[currentMovementStep2]);

    int currentMovement = movementSequence2[currentStep];

    switch (currentMovement) {
        case 2:
            player->xVel = -4; player->yVel = 0;
            player->direction = 2; player->currentFrame = 2;
            break;
        case 3:
            player->xVel = 4; player->yVel = 0;
            player->direction = 3; player->currentFrame = 2;
            break;
        case 1:
            player->xVel = 0; player->yVel = -4;
            player->direction = 1; player->currentFrame = 1;
            break;
        case 0:
            player->xVel = 0; player->yVel = 4;
            player->direction = 0; player->currentFrame = 1;
            break;
        case 4:
            player->xVel = 3; player->yVel = 3;
            player->direction = 3; player->currentFrame = 2;
            break;
        case 5:
            player->xVel = -3; player->yVel = 3;
            player->direction = 2; player->currentFrame = 2;
            break;
        case 6:
            player->xVel = 3; player->yVel = -3;
            player->direction = 3; player->currentFrame = 2;
            break;
        case 7:
            player->xVel = -3; player->yVel = -3;
            player->direction = 2; player->currentFrame = 2;
            break;
        case 10:
            player->xVel = 0;
            player->yVel = 0;
            player->direction = 1;
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
        case 11:
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

    shadowOAM[90].attr0 = (2<<8);
    shadowOAM[91].attr0 = (2<<8);
    shadowOAM[92].attr0 = (2<<8);
    shadowOAM[95].attr0 = (2<<8);

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
            shadowOAM[gameButtons2[i].oamIndex + 5].attr0 = (2<<8);
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
