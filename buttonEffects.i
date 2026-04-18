# 0 "buttonEffects.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "buttonEffects.c"
# 1 "buttonEffects.h" 1



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
# 5 "buttonEffects.h" 2
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
# 2 "buttonEffects.c" 2
# 1 "collision.h" 1




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
# 3 "buttonEffects.c" 2
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
# 4 "buttonEffects.c" 2

BUTTON_EFFECT buttonEffects[5];

const unsigned short BUTTON_DEFAULT_COLORS[] = {
    0x0000,
    0x7FFF,
    0x001F,
    0x03E0,
    0x7C00,
    0x03FF,
    0x7C1F,
    0x7FE0
};

void initButtonEffects(void) {
    for (int i = 0; i < 5; i++) {
        buttonEffects[i].paletteRow = 0;
        buttonEffects[i].effectTimer = 0;
        buttonEffects[i].isShowingEffect = 0;
        buttonEffects[i].effectType = 0;
    }
}

void updateButtonEffects(void) {
    int shouldResetSequence = 1;

    for (int i = 0; i < 5; i++) {
        if (buttonEffects[i].isShowingEffect) {
            buttonEffects[i].effectTimer--;

            if (buttonEffects[i].effectTimer <= 0) {
                int expiredEffectType = buttonEffects[i].effectType;

                buttonEffects[i].paletteRow = 0;
                buttonEffects[i].isShowingEffect = 0;
                buttonEffects[i].effectType = 0;

                if (expiredEffectType == 2) {
                    mgba_printf("Button %d: ERROR effect expired", i);
                } else if (expiredEffectType == 1) {
                    mgba_printf("Button %d: SUCCESS effect expired", i);
                }
            }

            if (buttonEffects[i].effectType == 2 && buttonEffects[i].effectTimer > 0) {
                shouldResetSequence = 0;
            }
        }
    }

    if (shouldResetSequence) {
        static int lastHadErrors = 0;
        int hadErrorsRecently = 0;

        for (int i = 0; i < 5; i++) {
            if (buttonEffects[i].effectType == 2) {
                hadErrorsRecently = 1;
                break;
            }
        }

        if (lastHadErrors && !hadErrorsRecently) {
            resetButtonSequence();
        }

        lastHadErrors = hadErrorsRecently;
    }

    if (automaticMovementFinished) {
        for (int i = 0; i < 5; i++) {
            if (buttonEffects[i].effectType == 1) {
                buttonEffects[i].paletteRow = 0;
                buttonEffects[i].isShowingEffect = 0;
                buttonEffects[i].effectType = 0;
            }
        }
    }
}

void startButtonSuccessEffect(int* buttonSequence, int sequenceLength) {

    for (int i = 0; i < sequenceLength; i++) {
        int buttonIndex = buttonSequence[i];
        if (buttonIndex >= 0 && buttonIndex < 5) {
            buttonEffects[buttonIndex].paletteRow = 7;
            buttonEffects[buttonIndex].effectTimer = 300;
            buttonEffects[buttonIndex].isShowingEffect = 1;
            buttonEffects[buttonIndex].effectType = 1;
        }
    }
}

void startButtonErrorEffect(int* buttonSequence, int sequenceLength) {

    for (int i = 0; i < sequenceLength; i++) {
        int buttonIndex = buttonSequence[i];
        if (buttonIndex >= 0 && buttonIndex < 5) {
            buttonEffects[buttonIndex].paletteRow = 1;
            buttonEffects[buttonIndex].effectTimer = 30;
            buttonEffects[buttonIndex].isShowingEffect = 1;
            buttonEffects[buttonIndex].effectType = 2;
        }
    }
}

void resetButtonEffects(void) {
    for (int i = 0; i < 5; i++) {
        buttonEffects[i].paletteRow = 0;
        buttonEffects[i].effectTimer = 0;
        buttonEffects[i].isShowingEffect = 0;
        buttonEffects[i].effectType = 0;
    }
}

int shouldUseEffectPalette(int buttonIndex) {
    if (buttonIndex < 0 || buttonIndex >= 5) return 0;
    return buttonEffects[buttonIndex].isShowingEffect;
}

int getButtonPaletteRow(int buttonIndex) {
    if (buttonIndex < 0 || buttonIndex >= 5) return 0;
    return buttonEffects[buttonIndex].paletteRow;
}
