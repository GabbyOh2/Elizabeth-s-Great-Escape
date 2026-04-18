#include "enemies.h"
#include "collision.h"
#include "bosses.h"
#include "mode0.h"
#include "player.h"
#include "tempCol.h"
#include "tempCol2.h"
#include <stdlib.h>
#include "print.h"

ENEMY enemies[MAX_ENEMIES];
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

#define MAPWIDTH 256
#define MAPHEIGHT 256

inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*)tempColBitmap)[OFFSET(x, y, MAPWIDTH)];
}

inline unsigned char colorAt2(int x, int y) {
    return ((unsigned char*)tempCol2Bitmap)[OFFSET(x, y, MAPWIDTH)];
}

int getCollisionType(int x, int y) {
    if (x < 0) x = 0;
    if (y < 0) y = 0;
    if (x >= MAPWIDTH) x = MAPWIDTH - 1;
    if (y >= MAPHEIGHT) y = MAPHEIGHT - 1;
    
    unsigned char color = colorAt2(x, y);
    
    static int debugCounter = 0;
    if (debugCounter++ % 60 == 0) {
        mgba_printf("Collision check at (%d,%d): color=%d", x, y, color);
    }
    
    switch(color) {
        case 1: return COLLISION_1;
        case 2: return COLLISION_2;  
        case 3: return COLLISION_3;
        case 4: return COLLISION_4;
        case 5: return COLLISION_5;
        case 6: return COLLISION_6;
        case 7: return COLLISION_7;
        case 8: return COLLISION_8;
        case 9: return COLLISION_9;
        case 10: return COLLISION_10;
        case 11: return COLLISION_11;
        case 12: return COLLISION_12;
        default: return 0; 
    }
}

void initEnemies(void) {
    enemyCount = 0;
    for (int i = 0; i < MAX_ENEMIES; i++) {
        enemies[i].active = 0;
        enemies[i].oamIndex = 11 + i; 
    }
}

void spawnEnemyAtCollisionColor(int collisionColor, int type) {
    if (enemyCount >= MAX_ENEMIES) return;
    
    int spawnX, spawnY;
    
    switch (collisionColor) {
        case COLLISION_5: // Bottom - spawn falling enemies
            spawnX = 128; spawnY = 256 - 32; // Bottom of map
            break;
        case COLLISION_3: // Top - spawn rising enemies  
            spawnX = 128; spawnY = 0; // Top of map
            break;
        case COLLISION_4: // Right - spawn left-moving enemies
            spawnX = 0; spawnY = 128; // Right of map
            break;
        case COLLISION_2: // Left - spawn right-moving enemies
            spawnX = 256 - 32; spawnY = 128; // Left of map
            break;
        default:
            spawnX = 128; spawnY = 128; // Center as fallback
            break;
    }
    
    for (int i = 0; i < MAX_ENEMIES; i++) {
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
    if (enemyCount >= MAX_ENEMIES) return;
    
    int spawnX, spawnY;
    
    switch (collisionColor) {
        case 11: // Top-left - spawn on color 11
            spawnX = 32;  
            spawnY = 8;   
            break;
        case 5:   // Top-right - spawn on color 5
            spawnX = 192; 
            spawnY = 8;   
            break;
        case 12:  // Bottom-left 
            spawnX = 48;
            spawnY = 232;
            break;
        case 6:   // Bottom-right
            spawnX = 208;
            spawnY = 232;
            break;
        default:
            spawnX = 128; spawnY = 128;
            break;
    }
    
    for (int i = 0; i < MAX_ENEMIES; i++) {
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
    if (enemyCount >= MAX_ENEMIES) return;
    
    for (int i = 0; i < MAX_ENEMIES; i++) {
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
        for (int i = 0; i < MAX_ENEMIES; i++) {
            if (!enemies[i].killed) {
                if (!enemies[i].active && enemies[i].spawnTimer > 0) {
                    enemies[i].spawnTimer--;
                    if (enemies[i].spawnTimer <= 0) {
                        int collisionColor, enemyType;
                        
                        switch (i) {
                            case 0: collisionColor = COLLISION_5; enemyType = 0; break;
                            case 1: collisionColor = COLLISION_3; enemyType = 0; break;
                            case 2: collisionColor = COLLISION_4; enemyType = 1; break;
                            case 3: collisionColor = COLLISION_2; enemyType = 1; break;
                        }
                        
                        spawnEnemyAtCollisionColor(collisionColor, enemyType);
                    }
                }
            }
        }
    } else if (currentLevel == 2) {
        for (int i = 0; i < MAX_ENEMIES; i++) {
            if (!enemies[i].killed) {
                if (!enemies[i].active && enemies[i].spawnTimer > 0) {
                    enemies[i].spawnTimer--;
                    
                    if (enemies[i].spawnTimer <= 0) {
                        int collisionColor, enemyType;
                        
                        if (i < 4) {
                            switch (i) {
                                case 0: collisionColor = COLLISION_5; enemyType = 1; break;
                                case 1: collisionColor = COLLISION_6; enemyType = 1; break;
                                case 2: collisionColor = COLLISION_11; enemyType = 1; break;
                                case 3: collisionColor = COLLISION_12; enemyType = 1; break;
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
            case COLLISION_5: 
                if (enemy->type == 1) { 
                    if (enemy->direction == 0) {
                        enemy->x -= enemy->speed; // Left
                    } else {
                        enemy->x += enemy->speed; // Right
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
                        enemy->collisionPath = COLLISION_3; 
                        enemy->spawnTimer = 60;
                        enemy->type = 1; 
                    }
                }
                break;
                
            case COLLISION_3:
                if (enemy->type == 1) { 
                    if (enemy->direction == 0) {
                        enemy->x -= enemy->speed; // Left
                    } else {
                        enemy->x += enemy->speed; // Right
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
                        enemy->collisionPath = COLLISION_5; 
                        enemy->spawnTimer = 60;
                        enemy->type = 1; 
                    }
                }
                break;
                
            case COLLISION_4: 
                if (enemy->type == 0) { 
                    if (enemy->direction == 0) {
                        enemy->y -= enemy->speed; // Up
                    } else {
                        enemy->y += enemy->speed; // Down
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
                        enemy->collisionPath = COLLISION_2; 
                        enemy->spawnTimer = 60;
                        enemy->type = 0; 
                    }
                }
                break;
                
            case COLLISION_2: 
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
                        enemy->collisionPath = COLLISION_4; 
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
        
        for (int i = 0; i < MAX_ENEMIES; i++) {
            if (&enemies[i] == enemy) {
                enemyIndex = i;
                break;
            }
        }
        
        if (enemy->collisionPath == COLLISION_1) {
            enemy->speed = 0;
            enemy->xVel = 0;
            enemy->yVel = 0;
            return;
        }
        
        scrollTimer++;
        switch (scrollState) {
            case 0: // SCROLL RIGHT
                patternScroll += scrollSpeed;
                if (patternScroll > 255) patternScroll = 0;
                if (scrollTimer >= 120) {
                    scrollState = 1;
                    scrollTimer = 0;
                }
                break;
            case 1: // PAUSE
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
                enemy->x + enemy->width / 2, // Center
                enemy->x + 8,                // Left side
                enemy->x + enemy->width - 8  // Right side
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
                
                if (collision == COLLISION_1 && (enemy->collisionPath == COLLISION_5 || enemy->collisionPath == COLLISION_6)) {
             
                    if ((rand() % 100) < 40) {
                        enemy->collisionPath = COLLISION_1;
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
                if ((enemy->collisionPath == COLLISION_11 || enemy->collisionPath == COLLISION_12) && 
                    (enemy->targetCollision == COLLISION_12 || enemy->targetCollision == COLLISION_11)) {
                    
                    if ((rand() % 100) < 60) {
                        int newCollisionPath;
                        if (rand() % 2 == 0) {
                            newCollisionPath = COLLISION_5; // Top-right
                        } else {
                            newCollisionPath = COLLISION_6; // Bottom-right
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
                
                if ((enemy->collisionPath == COLLISION_11 || enemy->collisionPath == COLLISION_12) && 
                    (enemy->targetCollision == COLLISION_12 || enemy->targetCollision == COLLISION_11)) {
                    
                    if ((rand() % 100) < 60) {
                        int newCollisionPath;
                        if (rand() % 2 == 0) {
                            newCollisionPath = COLLISION_5; // Top-right
                        } else {
                            newCollisionPath = COLLISION_6; // Bottom-right
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
                
                if ((enemy->collisionPath == COLLISION_11 || enemy->collisionPath == COLLISION_12) && 
                    (enemy->targetCollision == COLLISION_12 || enemy->targetCollision == COLLISION_11)) {
                    
                    if ((rand() % 100) < 60) {
                        int newCollisionPath;
                        if (rand() % 2 == 0) {
                            newCollisionPath = COLLISION_5; // Top-right
                        } else {
                            newCollisionPath = COLLISION_6; // Bottom-right
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
                            enemy->direction = 0; // Up
                            if (enemy->collisionPath == 12) {
                                enemy->targetCollision = 11; // Bottom-left → Top-left
                            } else {
                                enemy->targetCollision = 5;  // Bottom-right → Top-right
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
            
            if (currentCollision == COLLISION_10) {
                if (enemy->collisionPath == 11 || enemy->collisionPath == 5) {
                    if (currentX < 128) {
                        enemy->direction = 0; // Move left (away from center)
                    } else {
                        enemy->direction = 1; // Move right (away from center)
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
            
            if (getCollisionType(checkAheadX, checkAheadY) == COLLISION_10) {
                enemy->direction = !enemy->direction;
                mgba_printf("COLLISION_10 AHEAD: Reversing direction immediately");
            }
            
            if (enemy->direction == 0) {
                enemy->x -= enemy->speed; // Move left
            } else {
                enemy->x += enemy->speed; // Move right  
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
            
            if ((edgeCollision == COLLISION_1) && 
                (enemy->collisionPath == COLLISION_5 || enemy->collisionPath == COLLISION_6)) {
                
                if ((rand() % 100) < 40) { 
                    enemy->collisionPath = COLLISION_1;
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
            
            if (edgeCollision != COLLISION_10 && canTransition) {
                mgba_printf("Transition check: edgeColl=%d, current path=%d, timer=%d", edgeCollision, enemy->collisionPath, horizontalTimer[enemyIndex]);
                
                int shouldIgnoreCollision1 = 0;
                if ((enemy->collisionPath == COLLISION_5 || enemy->collisionPath == COLLISION_6) && 
                    (edgeCollision == COLLISION_6 || edgeCollision == COLLISION_5)) {
                    shouldIgnoreCollision1 = 1;
                    mgba_printf("Ignoring COLLISION_1 to allow 5<->6 transition");
                }
      
                if (edgeCollision != enemy->collisionPath && 
                    (edgeCollision != COLLISION_1 || shouldIgnoreCollision1)) {
                    
                    if (edgeCollision == COLLISION_1 && !shouldIgnoreCollision1 && 
                        (enemy->collisionPath == COLLISION_5 || enemy->collisionPath == COLLISION_6)) {
                        
                        if ((rand() % 100) < 40) {
                            enemy->collisionPath = COLLISION_1;
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
                                enemy->direction = 1; // Down
                                if (enemy->collisionPath == 11) {
                                    enemy->targetCollision = 12; // Top-left → Bottom-left
                                } else {
                                    enemy->targetCollision = 6;  // Top-right → Bottom-right
                                }
                                mgba_printf("EDGE TRANSITION: Top %d -> %d", enemy->collisionPath, enemy->targetCollision);
                            } else {
                                enemy->direction = 0; // Up
                                if (enemy->collisionPath == 12) {
                                    enemy->targetCollision = 11; // Bottom-left → Top-left
                                } else {
                                    enemy->targetCollision = 5;  // Bottom-right → Top-right
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
                            enemy->direction = 1; // Down
                            if (enemy->collisionPath == 11) {
                                enemy->targetCollision = 12; // Top-left → Bottom-left
                            } else {
                                enemy->targetCollision = 6;  // Top-right → Bottom-right
                            }
                            mgba_printf("RANDOM TRANSITION: Top %d -> %d", enemy->collisionPath, enemy->targetCollision);
                        } else {
                            enemy->direction = 0; // Up
                            if (enemy->collisionPath == 12) {
                                enemy->targetCollision = 11; // Bottom-left → Top-left
                            } else {
                                enemy->targetCollision = 5;  // Bottom-right → Top-right
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
                    enemy->type = 0; // Switch to vertical
                    
                    if (enemy->collisionPath == 11 || enemy->collisionPath == 5) {
                        enemy->direction = 1; // Down
                        if (enemy->collisionPath == 11) {
                            enemy->targetCollision = 12; // Top-left → Bottom-left
                        } else {
                            enemy->targetCollision = 6;  // Top-right → Bottom-right
                        }
                        mgba_printf("SCREEN EDGE TRANSITION: Top %d -> %d", enemy->collisionPath, enemy->targetCollision);
                    } else {
                        enemy->direction = 0; // Up
                        if (enemy->collisionPath == 12) {
                            enemy->targetCollision = 11; // Bottom-left → Top-left
                        } else {
                            enemy->targetCollision = 5;  // Bottom-right → Top-right
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
                enemy->direction = 1; // Turn right
            }
            if (enemy->x >= 256 - enemy->width) {
                enemy->x = 256 - enemy->width;
                enemy->direction = 0; // Turn left
            }
        }
        
        if (enemy->collisionPath != COLLISION_1) {
            if (enemy->x < 0) enemy->x = 0;
            if (enemy->x > 256 - enemy->width) enemy->x = 256 - enemy->width;
            if (enemy->y < 0) enemy->y = 0;
            if (enemy->y > 256 - enemy->height) enemy->y = 256 - enemy->height;
        }
        
    } else if (enemy->movementState == 0 && enemy->spawnTimer > 0) {
        if (enemy->collisionPath != COLLISION_1) {
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
    
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (enemies[i].killed) continue;
  
        if (!enemies[i].active) {
            if (enemies[i].spawnTimer > 0) {
                enemies[i].spawnTimer--;
                
                if (enemies[i].spawnTimer <= 0) {
                    // Time to spawn
                    if (currentLevel == 1) {
                        int collisionColor, enemyType;
                        switch (i) {
                            case 0: collisionColor = COLLISION_5; enemyType = 0; break;
                            case 1: collisionColor = COLLISION_3; enemyType = 0; break;
                            case 2: collisionColor = COLLISION_4; enemyType = 1; break;
                            case 3: collisionColor = COLLISION_2; enemyType = 1; break;
                        }
                        spawnEnemyAtCollisionColor(collisionColor, enemyType);
                    } else if (currentLevel == 2 && i < 4) {
                        int collisionColor, enemyType;
                        switch (i) {
                            case 0: collisionColor = COLLISION_5; enemyType = 1; break;
                            case 1: collisionColor = COLLISION_6; enemyType = 1; break;
                            case 2: collisionColor = COLLISION_11; enemyType = 1; break;
                            case 3: collisionColor = COLLISION_12; enemyType = 1; break;
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

        if (currentLevel == 2 && enemies[i].collisionPath == COLLISION_1) {
            
            mgba_printf("NORMAL: COLLISION_1 enemy %d scrolling: x=%d", i, enemies[i].x);
            
            if (enemies[i].x <= 0) {
                int newCollisionPath;
                if (rand() % 2 == 0) {
                    newCollisionPath = COLLISION_11;
                } else {
                    newCollisionPath = COLLISION_12;
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
    
    if (currentLevel == 2 && enemy->collisionPath == COLLISION_1) {
        if (enemy->x <= -enemy->width - 20) {
            int newCollisionPath;
            if (rand() % 2 == 0) {
                newCollisionPath = COLLISION_11;
            } else {
                newCollisionPath = COLLISION_12;
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
    #define WORLD_WIDTH 256
    #define WORLD_HEIGHT 256
    #define SCREEN_WIDTH 240
    #define SCREEN_HEIGHT 160
    
    int isAutoMovementActive = (automaticMovementActive || automaticMovementActive2);

    int cameraX, cameraY;
    
    if (emCameraActive && emPatternActive2) {

        extern int worldCameraX, worldCameraY;
        cameraX = worldCameraX;
        cameraY = worldCameraY;
        mgba_printf("Enemies using EM camera: (%d,%d)", cameraX, cameraY);
    } else {
        cameraX = player.x - (SCREEN_WIDTH / 2) + 32;
        cameraY = player.y - (SCREEN_HEIGHT / 2) + 32;
        
        if (cameraX < 0) cameraX = 0;
        if (cameraY < 0) cameraY = 0;
        if (cameraX > WORLD_WIDTH - SCREEN_WIDTH) cameraX = WORLD_WIDTH - SCREEN_WIDTH;
        if (cameraY > WORLD_HEIGHT - SCREEN_HEIGHT) cameraY = WORLD_HEIGHT - SCREEN_HEIGHT;
    }
    
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!enemies[i].active) {
            shadowOAM[enemies[i].oamIndex].attr0 = ATTR0_HIDE;
            continue;
        }
        
        int baseTile;
        int paletteRow = 3 + (i % 3);
        
        if (isAutoMovementActive) {
            baseTile = 304; 
            paletteRow = 2; 
        } 

        else if (enemies[i].collisionPath == COLLISION_1 || enemies[i].movementState == 0) {
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
        
        if (screenX < -32 || screenX > SCREEN_WIDTH || screenY < -32 || screenY > SCREEN_HEIGHT) {
            shadowOAM[enemies[i].oamIndex].attr0 = ATTR0_HIDE;
            continue;
        }
        
        shadowOAM[enemies[i].oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE | ATTR0_4BPP;
        
        if (isAutoMovementActive) {
            shadowOAM[enemies[i].oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
            shadowOAM[enemies[i].oamIndex].attr2 = ATTR2_PALROW(paletteRow) | ATTR2_PRIORITY(1) | ATTR2_TILEID(baseTile, 0);
        }

        else if (enemies[i].type == 1 && enemies[i].direction == 0) {
            shadowOAM[enemies[i].oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM | ATTR1_HFLIP;
            shadowOAM[enemies[i].oamIndex].attr2 = ATTR2_PALROW(paletteRow) | ATTR2_PRIORITY(1) | ATTR2_TILEID(baseTile, 0);
        } else {
            shadowOAM[enemies[i].oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
            shadowOAM[enemies[i].oamIndex].attr2 = ATTR2_PALROW(paletteRow) | ATTR2_PRIORITY(1) | ATTR2_TILEID(baseTile, 0);
        }
    }
}

int checkCollision(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2) {
    return (x1 < x2 + w2 && x1 + w1 > x2 && 
            y1 < y2 + h2 && y1 + h1 > y2);
}

void killEnemy(int enemyIndex) {
    if (enemyIndex >= 0 && enemyIndex < MAX_ENEMIES && enemies[enemyIndex].active) {
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

    for (int i = 0; i < MAX_ENEMIES; i++) {
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
    
    for (int b = 0; b < MAX_BULLETS; b++) {
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

        for (int i = 0; i < MAX_ENEMIES; i++) {
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
    for (int i = 0; i < MAX_ENEMIES; i++) {
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
            case 0: // DOWN - bottom left corner of world
                spriteWorldX = 20;
                spriteWorldY = 256 - 64;  
                break;
            case 1: // UP - top left corner of world
                spriteWorldX = 20;
                spriteWorldY = 0;
                break;
            case 2: // UP - top right corner of world
                spriteWorldX = 180;
                spriteWorldY = 0;
                break;
            case 3: // DOWN - bottom right corner of world
                spriteWorldX = 180;
                spriteWorldY = 256 - 64;
                break;
        }
    }
    else if (patternCompleted2 == 2) {
        switch (emPatternSpriteIndex) {
            case 0: // UP - top left
                spriteWorldX = 20;
                spriteWorldY = 0;
                break;
            case 1: // UP - top right
                spriteWorldX = 180;
                spriteWorldY = 0;
                break;
            case 2: // DOWN - bottom left
                spriteWorldX = 180;
                spriteWorldY = 256 - 64;
                break;
            case 3: // DOWN - bottom right
                spriteWorldX = 20;
                spriteWorldY = 256 - 64;
                break;
        }
    }
    else if (patternCompleted2 == 3) {
        switch (emPatternSpriteIndex) {
            case 0: // DOWN - bottom left
                spriteWorldX = 180;
                spriteWorldY = 256 - 64;
                break;
            case 1: // DOWN - bottom right
                spriteWorldX = 20;
                spriteWorldY = 256 - 64;
                break;
            case 2: // UP - top left
                spriteWorldX = 20;
                spriteWorldY = 0;
                break;
            case 3: // UP - top right
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
    
    for (int i = 0; i < MAX_ENEMIES; i++) {
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
    for (int i = 0; i < MAX_ENEMIES; i++) {
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
        for (int i = 0; i < MAX_ENEMIES; i++) {
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
        
        for (int i = 0; i < MAX_ENEMIES; i++) {
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
    
    if (REG_BG0HOFF != lastBG0 && REG_BG0HOFF > 255) {
        mgba_printf("BG0 CORRUPTION: %d -> %d", lastBG0, REG_BG0HOFF);
    }
    if (REG_BG1HOFF != lastBG1 && REG_BG1HOFF > 255) {
        mgba_printf("BG1 CORRUPTION: %d -> %d", lastBG1, REG_BG1HOFF);
    }
    if (REG_BG2HOFF != lastBG2 && REG_BG2HOFF > 255) {
        mgba_printf("BG2 CORRUPTION: %d -> %d", lastBG2, REG_BG2HOFF);
    }
    
    lastBG0 = REG_BG0HOFF;
    lastBG1 = REG_BG1HOFF;
    lastBG2 = REG_BG2HOFF;
}

void debugEnemyPathCollisions() {
    mgba_printf("=== EDGE COLLISION CHECK ===");
    
    int edgeTestPoints[][3] = {
        {0, 8, 11},    // Top-left 
        {0, 232, 12},  // Bottom-left 
        
        {255, 8, 5},   // Top-right 
        {255, 232, 6}, // Bottom-right 
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