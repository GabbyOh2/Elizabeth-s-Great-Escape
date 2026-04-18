#include "player.h"
#include "collision.h"
#include "sprites.h"
#include "mode0.h"
#include "print.h"
#include "enemies.h" 

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

BULLET playerBullets[MAX_BULLETS];
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
#define INVINCIBILITY_DURATION 20 

void drawPlayerLives(void) {
    
    #define LIFE_SPRITE_SIZE 8
    #define LIFE_MARGIN 2
    #define TOP_RIGHT_X 230  
    #define TOP_Y 4
    
    for (int i = 0; i < 3; i++) {
        int lifeOAMIndex = lifeSpriteOAMIndex - i; 
        
        if (i < playerLivesDisplayed) {
            int x = TOP_RIGHT_X - (i * (LIFE_SPRITE_SIZE + LIFE_MARGIN));
        
            shadowOAM[lifeOAMIndex].attr0 = ATTR0_Y(TOP_Y) | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[lifeOAMIndex].attr1 = ATTR1_X(x) | ATTR1_TINY; 
            shadowOAM[lifeOAMIndex].attr2 = ATTR2_PALROW(1) | ATTR2_PRIORITY(0) | 
                                          ATTR2_TILEID(888, 0);
        } else {
            shadowOAM[lifeOAMIndex].attr0 = ATTR0_HIDE;
        }
    }
}

void initPlayerBullets(void) {
    mgba_printf("INIT PLAYER BULLETS: cooldown=%d, isShooting=%d", 
               playerShootCooldown, playerIsShooting);
    for (int i = 0; i < MAX_BULLETS; i++) {
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

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    REG_BG2HOFF = 0;  
    REG_BG2VOFF = 0;
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
        
        if (BUTTON_HELD(BUTTON_UP)) {
            player->yVel = -2;
            player->direction = 1;
            player->isAnimating = 1;
        } 
        if (BUTTON_HELD(BUTTON_DOWN)) {
            player->yVel = 2;
            player->direction = 0;
            player->isAnimating = 1;
        } 
        if (BUTTON_HELD(BUTTON_LEFT)) {
            player->xVel = -2;
            player->direction = 2;
            player->isAnimating = 1;
        } 
        if (BUTTON_HELD(BUTTON_RIGHT)) {
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
        if (movementSequence[currentMovementStep] >= MOVEMENT_PAUSE_LEFT && 
            movementSequence[currentMovementStep] <= MOVEMENT_PAUSE_DOWN) {
            isPauseState = 1;
        }
        
        
        if (movementSequence[currentMovementStep] >= MOVEMENT_PAUSE_LEFT && 
            movementSequence[currentMovementStep] <= MOVEMENT_PAUSE_DOWN) {
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
      
        if (movementType == MOVEMENT_PAUSE_UP || movementType == MOVEMENT_PAUSE_DOWN) {
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
        isEMPause = (movementType == MOVEMENT_PAUSE_UP || movementType == MOVEMENT_PAUSE_DOWN);
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

    
    // Left boundary 
    if (player->x < -15) {
        player->x = -15;
    }
    // Right boundary
    if (player->x > 207) {
        player->x = 207;
    }
    // Top boundary
    if (player->y < 0) {
        player->y = 0;
    }
    // Bottom boundary
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
        REG_BG2HOFF = cameraX;  
        REG_BG2VOFF = cameraY;
        REG_BG1VOFF = cameraY;
    } else {
        REG_BG0HOFF = cameraX;
        REG_BG0VOFF = cameraY;
        REG_BG1HOFF = cameraX;
        REG_BG1VOFF = cameraY;
        REG_BG2HOFF = cameraX;  
        REG_BG2VOFF = cameraY;
    }
    
    player->screenX = player->x - cameraX;
    player->screenY = player->y - cameraY;
}


void drawPlayer(SPRITE* player) {
    if (playerInvincible && (invincibilityTimer / 2) % 2 == 0) {
        shadowOAM[0].attr0 = ATTR0_HIDE;  
        
        shadowOAM[30].attr0 = ATTR0_HIDE;   // Right triangle accessory
        shadowOAM[31].attr0 = ATTR0_HIDE;   // Isosceles triangle accessory
        shadowOAM[80].attr0 = ATTR0_HIDE;   // EM pattern accessory
        shadowOAM[16].attr0 = ATTR0_HIDE;   // Square accessory  
        shadowOAM[15].attr0 = ATTR0_HIDE;   // Square accessory
        shadowOAM[10].attr0 = ATTR0_HIDE;   // Square accessory
        shadowOAM[120].attr0 = ATTR0_HIDE;  // Square player
        shadowOAM[121].attr0 = ATTR0_HIDE;  // Triangle player
        
        mgba_printf("Player invisible (invincibility flash)");
        return; 
    }

    if (emCameraActive && isEMPauseActive) {
        if (worldCameraY == 0 || worldCameraY == (256 - 160)) {
            mgba_printf("EM PAUSE ACTIVE - Player OFF-SCREEN, hiding everything");
            shadowOAM[0].attr0 = ATTR0_HIDE;     // Player
            shadowOAM[30].attr0 = ATTR0_HIDE;    // Right triangle accessory
            shadowOAM[31].attr0 = ATTR0_HIDE;    // Isosceles triangle accessory  
            shadowOAM[80].attr0 = ATTR0_HIDE;    // EM pattern accessory
            shadowOAM[16].attr0 = ATTR0_HIDE;    // Square accessory  
            shadowOAM[15].attr0 = ATTR0_HIDE;    // Square accessory
            shadowOAM[10].attr0 = ATTR0_HIDE;    // Square accessory
            shadowOAM[120].attr0 = ATTR0_HIDE;   // Square player
            shadowOAM[121].attr0 = ATTR0_HIDE;   // Triangle player
            
            if (playerBullets[0].active && playerBullets[0].bulletSpriteIndex == 624) {
                int bulletScreenX = playerBullets[0].x - worldCameraX;
                int bulletScreenY = playerBullets[0].y - worldCameraY;
                
                if (bulletScreenX >= -16 && bulletScreenX < 240 && 
                    bulletScreenY >= -16 && bulletScreenY < 160) {
                    
                    shadowOAM[85].attr0 = ATTR0_Y(bulletScreenY) | ATTR0_SQUARE | ATTR0_4BPP;
                    shadowOAM[85].attr1 = ATTR1_X(bulletScreenX) | ATTR1_SMALL;
                    shadowOAM[85].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(1) | 
                                          ATTR2_TILEID(624, 0);
                    
                    mgba_printf("Drawing EM bullet 624 at screen (%d,%d)", 
                               bulletScreenX, bulletScreenY);
                } else {
                    shadowOAM[85].attr0 = ATTR0_HIDE;
                }
            } else {
                shadowOAM[85].attr0 = ATTR0_HIDE;
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
            case MOVEMENT_PAUSE_LEFT:
                isPauseState = 1;
                pauseDirection = 2; // LEFT
                break;
            case MOVEMENT_PAUSE_RIGHT:
                isPauseState = 1;
                pauseDirection = 3; // RIGHT
                break;
            case MOVEMENT_PAUSE_UP:
                isPauseState = 1;
                pauseDirection = 1; // UP
                break;
            case MOVEMENT_PAUSE_DOWN:
                isPauseState = 1;
                pauseDirection = 0; // DOWN
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
        case 0: // Down
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
        case 1: // Up
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
        case 2: // Left
            frameIndex = LEFT_FRAMES[currentFrame];
            break;
        case 3: // Right
            frameIndex = LEFT_FRAMES[currentFrame];
            hFlip = 1;
            break;
        case MOVEMENT_DIAG_DOWN_RIGHT: // 4
        case MOVEMENT_DIAG_UP_RIGHT: // 6
            frameIndex = LEFT_FRAMES[currentFrame]; // Use right-facing animation
            hFlip = 1;
            break;
        case MOVEMENT_DIAG_DOWN_LEFT: // 5
        case MOVEMENT_DIAG_UP_LEFT: // 7
            frameIndex = LEFT_FRAMES[currentFrame]; // Use left-facing animation
            break;
    }
    

    if (isIsosceles) {
    mgba_printf("=== ISOSCELES TRIANGLE PATTERN ===");
    mgba_printf("Direction: %d, screenX: %d, screenY: %d", currentDirection, player->screenX, player->screenY);

    shadowOAM[0].attr0 = ATTR0_Y(player->screenY) | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = ATTR1_X(player->screenX) | ATTR1_LARGE | (hFlip ? ATTR1_HFLIP : 0);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(1) | ATTR2_TILEID(frameIndex, 0);

    int accessoryX, accessoryY;

    if (currentDirection == 0) { // DOWN
        accessoryX = player->screenX + 7;
        accessoryY = player->screenY + 2;
        shadowOAM[31].attr0 = ATTR0_Y(accessoryY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[31].attr1 = ATTR1_X(accessoryX) | ATTR1_SMALL;
        shadowOAM[31].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(624, 0);
        
    } else if (currentDirection == 1) { // UP
        // NO accessory for UP - explicitly hide
        shadowOAM[31].attr0 = ATTR0_HIDE;
        
    } else if (currentDirection == 2) { // LEFT
        accessoryX = player->screenX + 8;
        accessoryY = player->screenY + 7;
        shadowOAM[31].attr0 = ATTR0_Y(accessoryY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[31].attr1 = ATTR1_X(accessoryX) | ATTR1_SMALL;
        shadowOAM[31].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(624, 0);
        
    } else if (currentDirection == 3) { // RIGHT
        accessoryX = player->screenX + 39;
        accessoryY = player->screenY + 5;
        shadowOAM[31].attr0 = ATTR0_Y(accessoryY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[31].attr1 = ATTR1_X(accessoryX) | ATTR1_SMALL;
        shadowOAM[31].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(624, 0);
        
    } else if (currentDirection == MOVEMENT_DIAG_DOWN_RIGHT || 
             currentDirection == MOVEMENT_DIAG_UP_RIGHT ||
             movementSequence[currentMovementStep] == MOVEMENT_DIAG_DOWN_RIGHT ||
             movementSequence[currentMovementStep] == MOVEMENT_DIAG_UP_RIGHT) { 
        // DIAGONAL RIGHT movements
        accessoryX = player->screenX + 39;    
        accessoryY = player->screenY + 6;
        shadowOAM[31].attr0 = ATTR0_Y(accessoryY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[31].attr1 = ATTR1_X(accessoryX) | ATTR1_SMALL;
        shadowOAM[31].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(624, 0);
        
    } else if (currentDirection == MOVEMENT_DIAG_DOWN_LEFT || 
             currentDirection == MOVEMENT_DIAG_UP_LEFT ||
             movementSequence[currentMovementStep] == MOVEMENT_DIAG_DOWN_LEFT ||
             movementSequence[currentMovementStep] == MOVEMENT_DIAG_UP_LEFT) { 
        // DIAGONAL LEFT movements
        accessoryX = player->screenX + 7;
        accessoryY = player->screenY + 6;
        shadowOAM[31].attr0 = ATTR0_Y(accessoryY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[31].attr1 = ATTR1_X(accessoryX) | ATTR1_SMALL;
        shadowOAM[31].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(624, 0);
    }
            
        shadowOAM[30].attr0 = ATTR0_HIDE;   // Right triangle accessory
        shadowOAM[16].attr0 = ATTR0_HIDE;    // Square accessory  
        shadowOAM[15].attr0 = ATTR0_HIDE;    // Square accessory
        shadowOAM[10].attr0 = ATTR0_HIDE;   // Square accessory
        shadowOAM[120].attr0 = ATTR0_HIDE;  // Square player
        shadowOAM[121].attr0 = ATTR0_HIDE;  // Triangle player

    } 

    else if (isRightTriangle) {
        mgba_printf("=== RIGHT TRIANGLE PATTERN ===");
        mgba_printf("Direction: %d", currentDirection);
    
        shadowOAM[0].attr0 = ATTR0_Y(player->screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = ATTR1_X(player->screenX) | ATTR1_LARGE | (hFlip ? ATTR1_HFLIP : 0);
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(1) | ATTR2_TILEID(frameIndex, 0);

        if (currentDirection == 0) { // DOWN 
            int accessoryX = player->screenX - 5;
            int accessoryY = player->screenY + 2;
            
            shadowOAM[30].attr0 = ATTR0_Y(accessoryY) | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[30].attr1 = ATTR1_X(accessoryX) | ATTR1_MEDIUM;
            shadowOAM[30].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(496, 0);
            
        } else if (currentDirection == 2 || currentDirection == 3 || 
                   movementSequence[currentMovementStep] == MOVEMENT_DIAG_DOWN_RIGHT ||
                   movementSequence[currentMovementStep] == MOVEMENT_DIAG_UP_RIGHT ||
                   movementSequence[currentMovementStep] == MOVEMENT_DIAG_DOWN_LEFT ||
                   movementSequence[currentMovementStep] == MOVEMENT_DIAG_UP_LEFT) { 
            int accessoryX, accessoryY;
            int accessoryHFlip = 0;
            
            if (currentDirection == 3 || 
                movementSequence[currentMovementStep] == MOVEMENT_DIAG_DOWN_RIGHT ||
                movementSequence[currentMovementStep] == MOVEMENT_DIAG_UP_RIGHT) {
                accessoryHFlip = 1;
            } else {
                accessoryHFlip = 0;
            }
            
            if (movementSequence[currentMovementStep] == MOVEMENT_DIAG_DOWN_RIGHT ||
                movementSequence[currentMovementStep] == MOVEMENT_DIAG_UP_RIGHT) {
                accessoryX = player->screenX + 38;
                accessoryY = player->screenY + 13;
            } else if (movementSequence[currentMovementStep] == MOVEMENT_DIAG_DOWN_LEFT ||
                       movementSequence[currentMovementStep] == MOVEMENT_DIAG_UP_LEFT) {
                accessoryX = player->screenX - 5;
                accessoryY = player->screenY + 13;
            } else if (currentDirection == 2) { // LEFT
                accessoryX = player->screenX - 5;
                accessoryY = player->screenY + 13;
            } else { // RIGHT
                accessoryX = player->screenX + 37;
                accessoryY = player->screenY + 13;
            }
            
            shadowOAM[30].attr0 = ATTR0_Y(accessoryY) | ATTR0_WIDE | ATTR0_4BPP; // 32x8
            shadowOAM[30].attr1 = ATTR1_X(accessoryX) | ATTR1_MEDIUM | (accessoryHFlip ? ATTR1_HFLIP : 0);
            shadowOAM[30].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(564, 0);
        } else {
            shadowOAM[30].attr0 = ATTR0_HIDE;
        }
        
        shadowOAM[16].attr0 = ATTR0_HIDE;
        shadowOAM[15].attr0 = ATTR0_HIDE;
        shadowOAM[10].attr0 = ATTR0_HIDE;
        shadowOAM[120].attr0 = ATTR0_HIDE;
        shadowOAM[121].attr0 = ATTR0_HIDE;

    } 

    else if (showAccessory && (currentDirection == 2 || currentDirection == 3)) {
        mgba_printf("=== DIRECTION DEBUG ===");
        mgba_printf("currentDirection: %d", currentDirection);
        mgba_printf("player->screenX: %d, player->screenY: %d", player->screenX, player->screenY);
        
        int accessoryX, accessoryY;
        int accessoryHFlip = 0;
    
    if (currentDirection == 2) { // LEFT
        
        accessoryX = player->screenX + 28;  // Left side of player
        accessoryY = player->screenY + 1;
        accessoryHFlip = 0;
    } else { // RIGHT (direction 3)
        
        accessoryX = player->screenX + 20;  // Right side of player  
        accessoryY = player->screenY + 1;
        accessoryHFlip = 1;
    }
        shadowOAM[0].attr0 = ATTR0_Y(accessoryY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = ATTR1_X(accessoryX) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(434, 0);
        
        int accessoryX2, accessoryY2;
        int adjustedX2 = accessoryX2;
        if (currentDirection == 2) { // LEFT
            accessoryX2 = player->screenX - 29;  
            accessoryY2 = player->screenY;  // Higher position
        } else { // RIGHT
            accessoryX2 = player->screenX + 29;  
            accessoryY2 = player->screenY;  // Higher position
        }

        shadowOAM[10].attr0 = ATTR0_Y(accessoryY2) | ATTR0_WIDE | ATTR0_4BPP;
        shadowOAM[10].attr1 = ATTR1_X(accessoryX2) | ATTR1_LARGE | (accessoryHFlip ? ATTR1_HFLIP : 0);
        shadowOAM[10].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(504, 0);

        shadowOAM[120].attr0 = ATTR0_Y(player->screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[120].attr1 = ATTR1_X(player->screenX) | ATTR1_LARGE | (hFlip ? ATTR1_HFLIP : 0);
        shadowOAM[120].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(frameIndex, 0);
        
        shadowOAM[16].attr0 = ATTR0_HIDE;
        shadowOAM[15].attr0 = ATTR0_HIDE;
    
} else if (showAccessory && (currentDirection == 0 || currentDirection == 1)) {

        int accessoryX1 = player->screenX + 11;  // Right side accessory
        int accessoryY1 = player->screenY + 2;
        int accessoryX2 = player->screenX + 37;  // Left side accessory  
        int accessoryY2 = player->screenY + 2;

        shadowOAM[0].attr0 = ATTR0_Y(accessoryY1) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = ATTR1_X(accessoryX1) | ATTR1_SMALL;  // No HFLIP
        shadowOAM[0].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(432, 0);
        
        shadowOAM[16].attr0 = ATTR0_Y(accessoryY2) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[16].attr1 = ATTR1_X(accessoryX2) | ATTR1_SMALL | ATTR1_HFLIP;  // HFLIP enabled
        shadowOAM[16].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(432, 0);
        
        if (currentDirection == 0) { 

            int accessoryX3 = player->screenX;    // Center position
            int accessoryY3 = player->screenY + 15; // Below player
            
            shadowOAM[15].attr0 = ATTR0_Y(accessoryY3) | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[15].attr1 = ATTR1_X(accessoryX3) | ATTR1_MEDIUM; // 32x32 size
            shadowOAM[15].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(436, 0);
    } else {
        shadowOAM[15].attr0 = ATTR0_HIDE;
    }
        shadowOAM[10].attr0 = ATTR0_HIDE;
        shadowOAM[120].attr0 = ATTR0_Y(player->screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[120].attr1 = ATTR1_X(player->screenX) | ATTR1_LARGE;
        shadowOAM[120].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(frameIndex, 0);
    
} else if (isEmPattern) {
    mgba_printf("=== EM PATTERN ===");
    mgba_printf("Direction: %d, screenX: %d, screenY: %d", currentDirection, player->screenX, player->screenY);

    shadowOAM[0].attr0 = ATTR0_Y(player->screenY) | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = ATTR1_X(player->screenX) | ATTR1_LARGE | (hFlip ? ATTR1_HFLIP : 0);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(1) | ATTR2_TILEID(frameIndex, 0);

    int accessoryX, accessoryY;
    int accessoryTile = 0;
    int accessoryWidth = 0;
    int accessoryHeight = 0;
    int accessoryHFlip = 0;

    if (currentDirection == 0 || currentDirection == 1 || 
    (automaticMovementActive2 && currentMovementStep2 < 24 && 
     (movementSequence2[currentMovementStep2] == MOVEMENT_PAUSE_DOWN ||
      movementSequence2[currentMovementStep2] == MOVEMENT_PAUSE_UP))) {
        if (currentDirection == 0 || movementSequence2[currentMovementStep2] == MOVEMENT_PAUSE_DOWN) {
            accessoryTile = 688;
            accessoryX = player->screenX + 4;
            accessoryY = player->screenY - 1; 
            accessoryWidth = ATTR1_MEDIUM; 
            accessoryHeight = ATTR0_SQUARE;
        } else {
            accessoryTile = 692; 
            accessoryX = player->screenX + 30;
            accessoryY = player->screenY; 
            accessoryWidth = ATTR1_MEDIUM; 
            accessoryHeight = ATTR0_SQUARE;
        }
        
    } else if (currentDirection == 2 || currentDirection == 3 ||
               movementSequence2[currentMovementStep2] == MOVEMENT_DIAG_UP_RIGHT ||
               movementSequence2[currentMovementStep2] == MOVEMENT_DIAG_DOWN_RIGHT ||
               movementSequence2[currentMovementStep2] == MOVEMENT_DIAG_UP_LEFT ||
               movementSequence2[currentMovementStep2] == MOVEMENT_DIAG_DOWN_LEFT) {
        accessoryTile = 816; 
        
        if (currentDirection == 3 || 
            movementSequence2[currentMovementStep2] == MOVEMENT_DIAG_UP_RIGHT ||
            movementSequence2[currentMovementStep2] == MOVEMENT_DIAG_DOWN_RIGHT) {
            accessoryHFlip = 1;
            accessoryX = player->screenX - 2; 
        } else {
            accessoryHFlip = 0;
            accessoryX = player->screenX + 2; 
        }
        
        accessoryY = player->screenY - 1;
        accessoryWidth = ATTR1_LARGE; 
        accessoryHeight = ATTR0_WIDE;
    }

    if (accessoryTile > 0) {
        shadowOAM[80].attr0 = accessoryHeight | ATTR0_Y(accessoryY) | ATTR0_4BPP;
        shadowOAM[80].attr1 = accessoryWidth | ATTR1_X(accessoryX) | (accessoryHFlip ? ATTR1_HFLIP : 0);
        shadowOAM[80].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(0) | ATTR2_TILEID(accessoryTile, 0);
    } else {
        shadowOAM[80].attr0 = ATTR0_HIDE;
    }

    shadowOAM[30].attr0 = ATTR0_HIDE;   // Right triangle accessory
    shadowOAM[31].attr0 = ATTR0_HIDE;   // Isosceles triangle accessory
    shadowOAM[16].attr0 = ATTR0_HIDE;   // Square accessory  
    shadowOAM[15].attr0 = ATTR0_HIDE;   // Square accessory
    shadowOAM[10].attr0 = ATTR0_HIDE;   // Square accessory
    shadowOAM[120].attr0 = ATTR0_HIDE;  // Square player
    shadowOAM[121].attr0 = ATTR0_HIDE;  // Triangle player
} else {
    shadowOAM[0].attr0 = ATTR0_Y(player->screenY) | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = ATTR1_X(player->screenX) | ATTR1_LARGE | (hFlip ? ATTR1_HFLIP : 0);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(frameIndex, 0);
    
    shadowOAM[30].attr0 = ATTR0_HIDE;   // Triangle accessory
    shadowOAM[31].attr0 = ATTR0_HIDE;   // Isosceles triangle accessory
    shadowOAM[80].attr0 = ATTR0_HIDE;   // EM pattern accessory - ADD THIS
    shadowOAM[16].attr0 = ATTR0_HIDE;   // Square accessory  
    shadowOAM[15].attr0 = ATTR0_HIDE;   // Square accessory
    shadowOAM[10].attr0 = ATTR0_HIDE;   // Square accessory
    shadowOAM[120].attr0 = ATTR0_HIDE;  // Square player
    shadowOAM[121].attr0 = ATTR0_HIDE;  // Triangle player
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
        
        if (movementType == MOVEMENT_PAUSE_LEFT) {
            pauseDirection = 2; // LEFT
        } else if (movementType == MOVEMENT_PAUSE_RIGHT) {
            pauseDirection = 3; // RIGHT
        } else if (movementType == MOVEMENT_PAUSE_UP) {
            pauseDirection = 1; // UP
        } else if (movementType == MOVEMENT_PAUSE_DOWN) {
            pauseDirection = 0; // DOWN
        }
    }
    
    mgba_printf("PLAYER SHOOTING: direction=%d, player at (%d,%d) size=%dx%d", 
               pauseDirection, player->x, player->y, player->width, player->height);
    
    playerBullets[0].active = 1;
    playerBullets[0].lifeTimer = pauseDuration;
    playerBullets[0].oamIndex = 20; 

    for (int i = 1; i < MAX_BULLETS; i++) {
        playerBullets[i].active = 0;
    }

    if (pauseDirection == 0) { 
        playerBullets[0].x = player->x + player->width / 2 - 29; // Center horizontally
        playerBullets[0].y = player->y + player->height - 5; // Just below player
        playerBullets[0].speed = 5; // Positive = down
        playerBullets[0].direction = 1; // Vertical movement
        playerBullets[0].hflip = 0; // No flip
        playerBullets[0].vflip = 0;
        playerBullets[0].bulletSpriteIndex = 156; 
        
    } else if (pauseDirection == 1) { // UP
        playerBullets[0].x = player->x + player->width / 2 - 16; // Center horizontally
        playerBullets[0].y = player->y - 20; // Above player
        playerBullets[0].speed = -5; // Negative = up
        playerBullets[0].direction = 1; // Vertical movement
        playerBullets[0].hflip = 0; 
        playerBullets[0].vflip = 1;
        playerBullets[0].bulletSpriteIndex = 156; 
        
    } else if (pauseDirection == 2) { // LEFT
        playerBullets[0].x = player->x - 20; // Left of player
        playerBullets[0].y = player->y + player->height / 2 - 29; // Center vertically
        playerBullets[0].speed = -5; // Negative = left
        playerBullets[0].direction = 0; // Horizontal movement
        playerBullets[0].hflip = 1; // HFLIP for LEFT
        playerBullets[0].vflip = 0;
        playerBullets[0].bulletSpriteIndex = 28; 
        
    } else if (pauseDirection == 3) { // RIGHT
        playerBullets[0].x = player->x + player->width + 5; // Right of player
        playerBullets[0].y = player->y + player->height / 2 - 29; // Center vertically
        playerBullets[0].speed = 5; // Positive = right
        playerBullets[0].direction = 0; // Horizontal movement
        playerBullets[0].hflip = 0; // NO flip for RIGHT
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
        
        if (movementType == MOVEMENT_PAUSE_UP) {
            pauseDirection = 1; // UP
        } else if (movementType == MOVEMENT_PAUSE_DOWN) {
            pauseDirection = 0; // DOWN
        }
    }
    
    playerBullets[0].active = 1;
    playerBullets[0].lifeTimer = pauseDuration;
    playerBullets[0].oamIndex = 85; 
    playerBullets[0].bulletSpriteIndex = 624; 
    playerBullets[0].width = 16;
    playerBullets[0].height = 16;

    for (int i = 1; i < MAX_BULLETS; i++) {
        playerBullets[i].active = 0;
    }

    if (pauseDirection == 0) { // DOWN
        playerBullets[0].x = player->x + 6; // Center horizontally
        playerBullets[0].y = player->y + 10; // Below player
        playerBullets[0].speed = 4; // Move down
        playerBullets[0].direction = 1; // Vertical
        playerBullets[0].hflip = 0;
        playerBullets[0].vflip = 0;
        
    } else if (pauseDirection == 1) { // UP
        playerBullets[0].x = player->x + 24; // Center horizontally
        playerBullets[0].y = player->y - 20; // Above player
        playerBullets[0].speed = -4; // Move up
        playerBullets[0].direction = 1; // Vertical
        playerBullets[0].hflip = 0;
        playerBullets[0].vflip = 1; // Flip vertically for UP
        
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
    
    for (int i = 1; i < MAX_BULLETS; i++) {
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
        shadowOAM[playerBullets[0].oamIndex].attr0 = ATTR0_HIDE;
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
        shadowOAM[playerBullets[0].oamIndex].attr0 = ATTR0_HIDE;
        return;
    }
    
    if (playerBullets[0].bulletSpriteIndex == 624) {

        shadowOAM[playerBullets[0].oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[playerBullets[0].oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_SMALL; // 16x16 = SMALL
    } else {
    
        shadowOAM[playerBullets[0].oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[playerBullets[0].oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM; // 32x32 = MEDIUM
    }
    
   u16 attr0, attr1, attr2;
    
    if (playerBullets[0].bulletSpriteIndex == 624) {
        attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        attr1 = ATTR1_X(screenX) | ATTR1_SMALL; 
        attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(1) | 
               ATTR2_TILEID(playerBullets[0].bulletSpriteIndex, 0);
    } else {
        attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM; 
        attr2 = ATTR2_PALROW(2) | ATTR2_PRIORITY(1) | 
               ATTR2_TILEID(playerBullets[0].bulletSpriteIndex, 0);
    }
    
    if (playerBullets[0].hflip) {
        attr1 |= ATTR1_HFLIP;
    }
    if (playerBullets[0].vflip) {
        attr1 |= ATTR1_VFLIP;
    }
    
    shadowOAM[playerBullets[0].oamIndex].attr0 = attr0;
    shadowOAM[playerBullets[0].oamIndex].attr1 = attr1;
    shadowOAM[playerBullets[0].oamIndex].attr2 = attr2;
}

void resetPlayerBullets(void) {
    for (int i = 0; i < MAX_BULLETS; i++) {
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
    
    #define PLAYER_COLLISION_WIDTH 16
    #define PLAYER_COLLISION_HEIGHT 40
    #define PLAYER_COLLISION_OFFSET_X 24
    #define PLAYER_COLLISION_OFFSET_Y 12
    
    int playerCollisionX = player->x + PLAYER_COLLISION_OFFSET_X;
    int playerCollisionY = player->y + PLAYER_COLLISION_OFFSET_Y;
    
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!enemies[i].active) continue;
        
        if (checkCollision(
            playerCollisionX, playerCollisionY, PLAYER_COLLISION_WIDTH, PLAYER_COLLISION_HEIGHT,
            enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height
        )) {
            mgba_printf("Player collided with enemy %d! Lives: %d -> %d", 
                       i, playerLives, playerLives - 1);
            
            loseLife();
            
            setPlayerInvincible(INVINCIBILITY_DURATION);
            
            
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
        
        setPlayerInvincible(INVINCIBILITY_DURATION);
        
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