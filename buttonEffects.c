#include "buttonEffects.h"
#include "collision.h"
#include "print.h"

BUTTON_EFFECT buttonEffects[5];

const unsigned short BUTTON_DEFAULT_COLORS[] = {
    0x0000,  // Transparent
    0x7FFF,  // White
    0x001F,  // Blue
    0x03E0,  // Green
    0x7C00,  // Red
    0x03FF,  // Cyan
    0x7C1F,  // Magenta
    0x7FE0   // Yellow
};

void initButtonEffects(void) {
    for (int i = 0; i < 5; i++) {
        buttonEffects[i].paletteRow = BUTTON_PALETTE_DEFAULT;
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
                
                buttonEffects[i].paletteRow = BUTTON_PALETTE_DEFAULT;
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
                buttonEffects[i].paletteRow = BUTTON_PALETTE_DEFAULT;
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
            buttonEffects[buttonIndex].paletteRow = BUTTON_PALETTE_SUCCESS;
            buttonEffects[buttonIndex].effectTimer = SUCCESS_EFFECT_DURATION;
            buttonEffects[buttonIndex].isShowingEffect = 1;
            buttonEffects[buttonIndex].effectType = 1; 
        }
    }
}

void startButtonErrorEffect(int* buttonSequence, int sequenceLength) {
    
    for (int i = 0; i < sequenceLength; i++) {
        int buttonIndex = buttonSequence[i];
        if (buttonIndex >= 0 && buttonIndex < 5) {
            buttonEffects[buttonIndex].paletteRow = BUTTON_PALETTE_ERROR;
            buttonEffects[buttonIndex].effectTimer = ERROR_EFFECT_DURATION;
            buttonEffects[buttonIndex].isShowingEffect = 1;
            buttonEffects[buttonIndex].effectType = 2; 
        }
    }
}

void resetButtonEffects(void) {
    for (int i = 0; i < 5; i++) {
        buttonEffects[i].paletteRow = BUTTON_PALETTE_DEFAULT;
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
    if (buttonIndex < 0 || buttonIndex >= 5) return BUTTON_PALETTE_DEFAULT;
    return buttonEffects[buttonIndex].paletteRow;
}