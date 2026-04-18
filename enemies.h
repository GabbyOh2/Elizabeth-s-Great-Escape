#ifndef ENEMIES_H
#define ENEMIES_H

#include "gba.h"
#include "sprites.h"
#include "tempCol.h"
#include "tempCol2.h"

#define MAX_ENEMIES 4

typedef struct {
    int x, y;
    int width, height;
    int active;
    int type; // 0: horizontal, 1: vertical
    int killed;
    int speed;
    int xVel;
    int yVel;
    int frame;
    int animationTimer;
    int direction; // 0: down/left, 1: up/right
    int directionChangeCount;
    int oamIndex;
    int spawnTimer;
    int movementState; // 0: normal, 1: following collision path
    int collisionPath; 
    int targetCollision;
    int isMovingVertically;
} ENEMY;

extern ENEMY enemies[MAX_ENEMIES];
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

#endif