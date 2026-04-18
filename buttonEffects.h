#ifndef BUTTONEFFECTS_H
#define BUTTONEFFECTS_H

#include "gba.h"

#define BUTTON_PALETTE_DEFAULT 0
#define BUTTON_PALETTE_SUCCESS 7  
#define BUTTON_PALETTE_ERROR 1    

#define ERROR_EFFECT_DURATION 30  
#define SUCCESS_EFFECT_DURATION 300 

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

#endif