#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "START.h"
#include "INSTRUCTIONS.h"
#include "PAUSED.h"
#include "Background1.h"
#include "tempCol.h"
#include "tempCol2.h"
#include "player.h"
#include "enemies.h"
#include "bosses.h"
#include "spriteSheet.h"
#include "collision.h"
#include "LOSE.h"
#include "WIN.h"
#include "Background2.h"
#include "Background2Scrolling.h"
#include "parallax1.h"
#include "mode4.h"
#include <stdlib.h>
#include "digitalSound.h"
#include "KatsuraTheme.h"
#include "Madao.h"
#include "intro1.h"
#include "hata.h"
#include "boss.h"
#include "buttonEffects.h"
#include "space1.h"
#include "space2.h"
#include "space3.h"
#include "space4.h"
#include "space5.h"
#include "alarm1.h"
#include "alarm2.h"
#include "alarm3.h"
#include "alarm4.h"
#include "alarm5.h"
#include "prince1.h"
#include "prince2.h"
#include "prince3.h"
#include "prince4.h"

unsigned short buttons;
unsigned short oldButtons;

int previousState;

extern SOUND soundA;

extern int automaticMovementActive;
extern int currentMovementStep;
extern int currentMovementStep2;
extern int sequenceComplete;

int currentMusic = -1; 
#define MUSIC_NONE -1
#define MUSIC_KATSURA 0
#define MUSIC_BOSS 1
#define MUSIC_MADAO 2
#define MUSIC_INTRO 3
#define MUSIC_HATA 4

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
        buttons = REG_BUTTONS;
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
        case MUSIC_KATSURA:
            playSoundA(KatsuraTheme_data, KatsuraTheme_length, loop);
            break;
        case MUSIC_BOSS:
            playSoundA(boss_data, boss_length, loop);
            break;
         case MUSIC_MADAO:
            playSoundA(Madao_data, Madao_length, loop);
            mgba_printf("Playing: Madao Theme (loop: %d)", loop);
            break;
        case MUSIC_INTRO:
            playSoundA(intro1_data, intro1_length, loop);
            mgba_printf("Playing: Intro Theme (loop: %d)", loop);
            break;
        case MUSIC_HATA:  
            playSoundA(hata_data, hata_length, loop);
            mgba_printf("Playing: Hata Sound (loop: %d)", loop);
            break;
        case MUSIC_NONE:
            currentMusic = MUSIC_NONE;
            break;
    }
}

void updateMusicForState() {
    switch(state) {
        case PLAYING:
        case PLAYING2:
            playMusic(MUSIC_KATSURA, 1);
            break;
        case START:
            playMusic(MUSIC_MADAO, 1);
            break;
        case CUTSCENE:
        case MODE0_CUTSCENE:
            playMusic(MUSIC_INTRO, 0);
            break;
        case PRINCE_CUTSCENE:  
            playMusic(MUSIC_HATA, 1);       
            break;
        case INSTRUCTIONS:
        case PAUSE:
            break;
        case LOSE:
        case WIN:
            playMusic(MUSIC_NONE, 0);
            break;
    }
}

void stopMadaoForCutscene() {
    if (currentMusic == MUSIC_MADAO) {
        stopSounds();
        currentMusic = MUSIC_NONE;
        mgba_printf("Stopped Madao for cutscene");
    }
}

void togglePaletteRows() {
    static int redTileMode_PLAYING = 0;
    static int redTileMode_PLAYING2 = 0;
    static unsigned short originalTile10_PLAYING[16];
    static unsigned short originalTile10_PLAYING2[16];
    
    if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        if (playerLives < 3) {
            addPlayerLife();
            playerLives++;
            mgba_printf("LSHOULDER pressed: Life added! Lives now: %d", playerLives);
            
            if (state == PLAYING) {
                for (int i = 0; i < 1024; i++) {
                    SCREENBLOCK[26].tilemap[i] = (SCREENBLOCK[26].tilemap[i] & 0x0FFF) | (0 << 12);
                }
                
                volatile unsigned short* cb = (unsigned short*)&CHARBLOCK[2];
                if (redTileMode_PLAYING) {
                    for (int i = 0; i < 16; i++) {
                        cb[16 * 10 + i] = originalTile10_PLAYING[i];
                    }
                    redTileMode_PLAYING = 0;
                    mgba_printf("Restored original tile 10 for PLAYING");
                }
                
            } else if (state == PLAYING2) {
                for (int i = 0; i < 1024; i++) {
                    SCREENBLOCK[28].tilemap[i] = (SCREENBLOCK[28].tilemap[i] & 0x0FFF) | (0 << 12);
                    SCREENBLOCK[29].tilemap[i] = (SCREENBLOCK[29].tilemap[i] & 0x0FFF) | (0 << 12);
                }
                
                volatile unsigned short* cb = (unsigned short*)&CHARBLOCK[2];
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
            sampleTile = SCREENBLOCK[26].tilemap[0];
        } else if (state == PLAYING2) {
            sampleTile = SCREENBLOCK[28].tilemap[0];
        }
        
        int currentPalette = (sampleTile >> 12) & 0x7;
        
        int newPalette;
        if (state == PLAYING) {
            newPalette = 1; 
            
            for (int i = 0; i < 1024; i++) {
                SCREENBLOCK[26].tilemap[i] = (SCREENBLOCK[26].tilemap[i] & 0x0FFF) | (newPalette << 12);
            }
            
            volatile unsigned short* cb = (unsigned short*)&CHARBLOCK[2];
            
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
                SCREENBLOCK[28].tilemap[i] = (SCREENBLOCK[28].tilemap[i] & 0x0FFF) | (newPalette << 12);
                SCREENBLOCK[29].tilemap[i] = (SCREENBLOCK[29].tilemap[i] & 0x0FFF) | (newPalette << 12);
            }
            
            volatile unsigned short* cb = (unsigned short*)&CHARBLOCK[2];
            
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
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToCutscene(PLAYING);  
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToInstructions(); 
    }
}

void goToStart() {

    REG_DISPCTL = MODE(4)| BG_ENABLE(2) ;
    
    DMANow(3, STARTPal, BG_PALETTE, 256);
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
    DMANow(3, shadowOAM, OAM, 128 * 4);

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
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart(); 
    }
}

void goToInstructions() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);  
    
    DMANow(3, INSTRUCTIONSPal, BG_PALETTE, 256);  
    drawFullscreenImage4(INSTRUCTIONSBitmap); 
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = INSTRUCTIONS;
}

void goToMode0Cutscene() {
    mgba_printf("Starting Mode 0 cutscene: Player walking across screen");
    
    playMusic(MUSIC_INTRO, 1);

    mode0CutsceneTimer = 0;
    
    REG_DISPCTL = MODE(0) | SPRITE_ENABLE; 
    waitForVBlank();
    
    DMANow(3, spriteSheetPal, SPRITE_PAL, spriteSheetPalLen/2); 
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);

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
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    state = MODE0_CUTSCENE;
    mgba_printf("Mode 0 cutscene: Player starts at X=%d", playerWalkX);
}

void mode0Cutscene() {
    updateMode0Cutscene();
    drawMode0Cutscene();
    
    if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_START)) {
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
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    
    if (playerWalkX >= -64 && playerWalkX <= 240) {
        int frameIndex;
        if (player.currentFrame >= 0 && player.currentFrame < 5) {
            frameIndex = LEFT_FRAMES[player.currentFrame];
        } else {
            frameIndex = LEFT_FRAMES[0]; 
        }
        
        int hFlip = 1;
        
        shadowOAM[0].attr0 = ATTR0_Y(playerWalkY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = ATTR1_X(playerWalkX) | ATTR1_LARGE | (hFlip ? ATTR1_HFLIP : 0);  
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(frameIndex, 0);
        
        mgba_printf("Drawing player at (%d,%d), frame %d, tile %d, hFlip=%d", 
                   playerWalkX, playerWalkY, player.currentFrame, frameIndex, hFlip);
    }
    
    DMANow(3, shadowOAM, OAM, 128 * 4);
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
                shadowOAM[i].attr0 = ATTR0_HIDE;
            }
        }

        mgba_printf("Automatic movement reset. Ready for next sequence.");
    }

    if (areAllEnemiesKilled() && !automaticMovementActive) {
        mgba_printf("All enemies killed! Transitioning to prince cutscene...");
        goToPrinceCutscene();
        return;
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        mgba_printf("DEBUG: Manual trigger for prince cutscene");
        goToPrinceCutscene();
        return;
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    
    drawPlayer(&player);
    drawPatternSprite(&player);

    drawButtons(&player);
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    waitForVBlank();
}

void goToCutscene(int returnState) {

    returnAfterCutscene = returnState;
    
    stopMadaoForCutscene();
    playMusic(MUSIC_INTRO, 1);

    cutsceneFrame = 0;
    cutsceneTimer = 0;
    
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    
    DMANow(3, cutscenePalette, BG_PALETTE, 256);
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    drawFullscreenImage4(cutsceneImages[0]);
    waitForVBlank();
    
    state = CUTSCENE;
    mgba_printf("Entering cutscene with %d images", TOTAL_CUTSCENE_FRAMES);
}

void cutscene() {
    updateCutscene();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
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

        REG_DISPCTL = MODE(0);
        waitForVBlank();

        REG_BG0CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(24) | BG_CHARBLOCK(0) | BG_4BPP | 2;
        REG_BG1CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(26) | BG_CHARBLOCK(0) | BG_4BPP | 1;
        REG_BG2CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(28) | BG_CHARBLOCK(0) | BG_4BPP;
        
        DMANow(3, Background1Pal, BG_PALETTE, Background1PalLen/2);
        DMANow(3, Background1Tiles, &CHARBLOCK[0], Background1TilesLen/2);
        DMANow(3, Background1Map, &SCREENBLOCK[26], Background1MapLen/2);

        DMANow(3, spriteSheetPal, SPRITE_PAL, spriteSheetPalLen/2); 
        DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
        
        waitForVBlank();
        
        initPlayer(&player);  
        player.screenX = player.x;
        player.screenY = player.y;

        resetCollisionSystem();        
        initButtons();                 
        initPlayerBullets();           
        initPatternPositions();        
        
        resetEnemies();              
        
        spawnEnemyAtCollisionColor(COLLISION_5, 0);
        spawnEnemyAtCollisionColor(COLLISION_3, 0);
        spawnEnemyAtCollisionColor(COLLISION_4, 1);
        spawnEnemyAtCollisionColor(COLLISION_2, 1);
        
        REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;
    } else {
        REG_DISPCTL = MODE(0);
        waitForVBlank();

        REG_BG0CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(24) | BG_CHARBLOCK(0) | BG_4BPP | 2;
        REG_BG1CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(26) | BG_CHARBLOCK(0) | BG_4BPP | 1;
        REG_BG2CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(28) | BG_CHARBLOCK(0) | BG_4BPP;
        
        DMANow(3, Background1Pal, BG_PALETTE, Background1PalLen/2);
        DMANow(3, Background1Tiles, &CHARBLOCK[0], Background1TilesLen/2);
        DMANow(3, Background1Map, &SCREENBLOCK[26], Background1MapLen/2);

        DMANow(3, spriteSheetPal, SPRITE_PAL, spriteSheetPalLen/2); 
        DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
        
        waitForVBlank();
        
        REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    }
    
    returningFromPause = 0;  
    state = PLAYING;

}

void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        unpauseSounds();
        if (previousState == PLAYING2) {
            goToPlaying2();
        } else {
            goToPlaying();
        }
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    }
}

void goToPause() {

    previousState = state; 

    pauseSounds();
    
    returningFromPause = 1;
    
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    
    DMANow(3, PAUSEDPal, BG_PALETTE, 256);
    drawFullscreenImage4(PAUSEDBitmap);
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = PAUSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        mgba_printf("Returning to start screen from lose screen");
        goToStart();
    }
}

void goToLose() {
    playMusic(MUSIC_NONE, 0);
    stopSounds();
    
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    
    DMANow(3, LOSEPal, BG_PALETTE, 256);
    drawFullscreenImage4(LOSEBitmap);
    
    resetEnemies();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = LOSE;
    
    mgba_printf("GAME OVER - Player ran out of lives");
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
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

    playMusic(MUSIC_NONE, 0);

    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    
    DMANow(3, WINPal, BG_PALETTE, 256);
    drawFullscreenImage4(WINBitmap);
    
    resetEnemies();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = WIN;
}

void goToPrinceCutscene() {
    mgba_printf("Starting Prince cutscene");
    
    if (currentMusic != MUSIC_NONE) {
        stopSounds();
    }
    
    playMusic(MUSIC_INTRO, 1);

    princeCutsceneTimer = 0;
    princeCutsceneFrame = 0;
    
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);

    DMANow(3, princePalette, BG_PALETTE, 256);
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    drawFullscreenImage4(princeImages[0]);
    waitForVBlank();
    
    state = PRINCE_CUTSCENE;
    mgba_printf("Entering prince cutscene with %d images", TOTAL_PRINCE_FRAMES);
}

void princeCutscene() {
    if (BUTTON_PRESSED(BUTTON_START)) {
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
    
    if (BUTTON_PRESSED(BUTTON_A)) {
        mgba_printf("Prince cutscene skipped with A button");
        goToPlaying2();
        return;
    }
    
    if (BUTTON_PRESSED(BUTTON_B) && princeCutsceneFrame > 0) {
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
    static int scrollState = 0; // 0=scroll right, 1=pause
    static int scrollSpeed = 2; 

    int cameraX, cameraY;
    #define SCREEN_WIDTH 240
    #define SCREEN_HEIGHT 160
    #define WORLD_WIDTH 256
    #define WORLD_HEIGHT 256

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
        cameraX = player.x - (SCREEN_WIDTH / 2) + 32;
        cameraY = player.y - (SCREEN_HEIGHT / 2) + 32;
        
        if (cameraX < 0) cameraX = 0;
        if (cameraX > WORLD_WIDTH - SCREEN_WIDTH) cameraX = WORLD_WIDTH - SCREEN_WIDTH;
        if (cameraY < 0) cameraY = 0;
        if (cameraY > WORLD_HEIGHT - SCREEN_HEIGHT) cameraY = WORLD_HEIGHT - SCREEN_HEIGHT;
    }

    if (!automaticMovementActive2) {
        parallaxScroll--;
        if (parallaxScroll <= -255) {
            parallaxScroll = 0;
        }
        
        REG_BG0HOFF = (cameraX + parallaxScroll + 256) % 256;  
        REG_BG0VOFF = cameraY;
        
        mgba_printf("Parallax ACTIVE: scroll=%d", parallaxScroll);
    } else {
        REG_BG0HOFF = cameraX;  
        REG_BG0VOFF = cameraY;
        
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
                
                for (int i = 0; i < MAX_ENEMIES; i++) {
                    if (enemies[i].active && enemies[i].collisionPath == COLLISION_1) {
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
    
        REG_BG1HOFF = cameraX + patternScroll;
        REG_BG1VOFF = cameraY;
        
        mgba_printf("Pattern scrolling ACTIVE: patternScroll=%d", patternScroll);
        
    } else {
        REG_BG1HOFF = cameraX;
        REG_BG1VOFF = cameraY;
        
        mgba_printf("Pattern scrolling PAUSED (autoMove2=%d, boss=%d)", 
                   automaticMovementActive2, boss.active);
    }
    
    REG_BG2HOFF = cameraX;
    REG_BG2VOFF = cameraY;

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
        mgba_printf("Pre-boss check - Palettes: %x, %x", BG_PALETTE[0], BG_PALETTE[16]);
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
                shadowOAM[i].attr0 = ATTR0_HIDE;
            }
        }

        mgba_printf("Automatic movement2 reset. Ready for next sequence.");
    }

    if (areAllEnemiesKilled() && currentLevel == 2 && !automaticMovementActive2) {
        mgba_printf("All enemies killed in Level 2! You win!");
        goToWin(); 
        return;
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
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
            mgba_printf("BG_PALETTE[0]: %x, BG_PALETTE[16]: %x", BG_PALETTE[0], BG_PALETTE[16]);
        }
        lastBossState = boss.active;
    }
    
    drawPlayer(&player);
    drawPatternSprite2(&player);

    debugIsoscelesSpriteState2();
    

    drawEmPatternSprite2(&player);
    
    drawButtons2(&player);
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    waitForVBlank();
}

void goToPlaying2() {
   static int debugFrame = 0;
   static int firstTimeEnteringLevel2 = 1;  
    
    debugFrame++;
    
    if (debugFrame == 20) { 
        mgba_printf("FRAME 60 CHECK:");
        mgba_printf("BG0HOFF: %d, BG1HOFF: %d", REG_BG0HOFF, REG_BG1HOFF);
        mgba_printf("BG1CNT: 0x%04X", REG_BG1CNT);
        
        int centerTile = 10 * 32 + 15; 
        unsigned short tile = SCREENBLOCK[29].tilemap[centerTile];
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

    REG_DISPCTL = MODE(0);
    waitForVBlank();

    REG_BG0CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(31) | BG_CHARBLOCK(1) | BG_4BPP | 3;  // Parallax - lowest priority
    REG_BG1CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(29) | BG_CHARBLOCK(2) | BG_4BPP | 2;  // Scrolling - middle priority
    REG_BG2CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(28) | BG_CHARBLOCK(0) | BG_4BPP | 1;  // Static - highest priority
    
    mgba_printf("Loading parallax to CHARBLOCK[1]...");
    DMANow(3, Background2Pal, BG_PALETTE, Background2PalLen/2);
    DMANow(3, parallax1Pal, &BG_PALETTE[16], parallax1PalLen/2);
    
    DMANow(3, parallax1Tiles, &CHARBLOCK[1], parallax1TilesLen/2);
    
    unsigned short parallaxMapCopy[1024];
    for (int i = 0; i < 1024; i++) {
        parallaxMapCopy[i] = (parallax1Map[i] & 0x0FFF) | (1 << 12); 
    }
    DMANow(3, parallaxMapCopy, &SCREENBLOCK[31], 2048);
    
    mgba_printf("Loading Background2 to CHARBLOCK[0]...");
    DMANow(3, Background2Tiles, &CHARBLOCK[0], Background2TilesLen/2);
    DMANow(3, Background2Map, &SCREENBLOCK[28], Background2MapLen/2);

    DMANow(3, Background2ScrollingTiles, &CHARBLOCK[2], Background2ScrollingTilesLen/2);
    DMANow(3, Background2ScrollingMap, &SCREENBLOCK[29], Background2ScrollingMapLen/2);
    DMANow(3, Background2ScrollingPal, &BG_PALETTE[32], Background2ScrollingPalLen/2);
    
    for (int i = 0; i < 1024; i++) {
        SCREENBLOCK[28].tilemap[i] = (SCREENBLOCK[28].tilemap[i] & 0x0FFF) | (0 << 12); // PALROW0
        SCREENBLOCK[29].tilemap[i] = (SCREENBLOCK[29].tilemap[i] & 0x0FFF) | (0 << 12); // PALROW0
    }
    
    mgba_printf("Initial: Both BGs using PALROW0 (Background2Pal)");
    mgba_printf("PALROW2 ready with Background2ScrollingPal");
    
    mgba_printf("Loading sprites to CHARBLOCK[4]...");
    DMANow(3, spriteSheetPal, SPRITE_PAL, spriteSheetPalLen/2); 
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    
    waitForVBlank();

    if (state != PAUSE && firstTimeEnteringLevel2) {
        resetCollisionSystem2();
        resetPlayerBullets();
        initButtons2();
        initPatternPositions2(); 

        spawnEnemyAtCollisionColor2(11, 1); // Top-left
        spawnEnemyAtCollisionColor2(5, 1);  // Top-right  
        spawnEnemyAtCollisionColor2(12, 1); // Bottom-left 
        spawnEnemyAtCollisionColor2(6, 1);  // Bottom-right 
        
        firstTimeEnteringLevel2 = 0; 
    }

    int cameraX = player.x - 120 + 32;
    int cameraY = player.y - 80 + 32;
    
    if (cameraX < 0) cameraX = 0;
    if (cameraX > 256 - 240) cameraX = 256 - 240;
    if (cameraY < 0) cameraY = 0;
    if (cameraY > 256 - 160) cameraY = 256 - 160;
    
    REG_BG0HOFF = cameraX; // Parallax (infinite scroll background)
    REG_BG0VOFF = cameraY;
    REG_BG1HOFF = cameraX; // Scrolling background (pattern scroll)
    REG_BG1VOFF = cameraY;
    REG_BG2HOFF = cameraX; // Static foreground (follows player)
    REG_BG2VOFF = cameraY;
    
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | BG_ENABLE(2) | SPRITE_ENABLE;

    if (!returningFromPause) {
        currentMusic = MUSIC_NONE; 
        playMusic(MUSIC_KATSURA, 1);
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
    
    int currentBG0 = REG_BG0HOFF;
    int currentBG1 = REG_BG1HOFF;
    
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
    
    DMANow(3, shadowOAM, OAM, 128 * 4);
}


void checkLevelSkip() {
    if (BUTTON_PRESSED(BUTTON_A)) {
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
    
    int currentBG1 = REG_BG1HOFF;
    
    if (currentBG1 > 255 && lastValidBG1 <= 255) {
        mgba_printf("BG1 CORRUPTION DETECTED: %d -> %d", lastValidBG1, currentBG1);
        
        mgba_printf("Player: (%d,%d), Boss Active: %d, AutoMove: %d", 
                   player.x, player.y, boss.active, automaticMovementActive2);
    }
    
    lastValidBG1 = currentBG1;
}