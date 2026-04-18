	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"enemies.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Enemy %d spawned at (%d,%d): path=%d, actual color="
	.ascii	"%d\000"
	.text
	.align	2
	.syntax unified
	.arm
	.type	spawnEnemyAtCollisionColor2.part.0, %function
spawnEnemyAtCollisionColor2.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r3, r0, #5
	cmp	r3, #7
	movhi	r3, #128
	ldrls	r2, .L11
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L11+4
	addls	r1, r2, r3, lsl #2
	movhi	r2, r3
	ldrls	r2, [r2, r3, lsl #2]
	mov	lr, r4
	ldrls	r3, [r1, #32]
	mov	r1, #0
	sub	sp, sp, #20
.L5:
	ldr	ip, [lr, #16]
	cmp	ip, #0
	bne	.L3
	ldr	ip, [lr, #24]
	cmp	ip, #0
	beq	.L10
.L3:
	add	r1, r1, #1
	cmp	r1, #4
	add	lr, lr, #80
	bne	.L5
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L10:
	mov	r5, #32
	mov	r6, #32
	add	lr, r1, r1, lsl #2
	mov	r8, r0
	lsl	r0, lr, #4
	add	lr, r4, lr, lsl #4
	str	r2, [r4, r0]
	str	r5, [lr, #8]
	str	r6, [lr, #12]
	mov	r5, #1
	mov	r6, #1
	mov	r7, #1
	str	r5, [lr, #16]
	str	r6, [lr, #20]
	mov	r5, #0
	mov	r6, #0
	cmp	r2, #127
	movgt	r9, #0
	movle	r9, #1
	add	r10, r4, r0
	add	r0, r3, #16
	add	r0, r2, r0, lsl #8
	str	r3, [lr, #4]
	str	r7, [lr, #28]
	str	r0, [sp, #12]
	str	r5, [r10, #40]
	str	r6, [r10, #44]
	ldr	r5, [sp, #12]
	ldr	r6, .L11+8
	ldrb	r5, [r6, r5]	@ zero_extendqisi2
	str	ip, [lr, #72]
	str	r9, [lr, #48]
	str	r7, [lr, #64]
	str	r8, [lr, #68]
	ldr	r0, .L11+12
	str	r5, [sp, #4]
	str	r8, [sp]
	ldr	ip, .L11+16
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #320]
	add	r3, r3, r7
	str	r3, [r4, #320]
	b	.L1
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	tempCol2Bitmap+16
	.word	.LC1
	.word	mgba_printf
	.size	spawnEnemyAtCollisionColor2.part.0, .-spawnEnemyAtCollisionColor2.part.0
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Checking SQUARE PATTERN kills (bullets vs frozen en"
	.ascii	"emies)...\000"
	.align	2
.LC3:
	.ascii	"Square pattern: Bullet killed BOSS!\000"
	.align	2
.LC4:
	.ascii	"Square pattern: Bullet killed FROZEN enemy %d!\000"
	.align	2
.LC5:
	.ascii	"KILLED ENEMY %d!\000"
	.text
	.align	2
	.syntax unified
	.arm
	.type	checkSquarePatternKills.part.0, %function
checkSquarePatternKills.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r0, .L39
	ldr	r5, .L39+4
	sub	sp, sp, #8
	mov	lr, pc
	bx	r5
	ldr	r2, .L39+8
	ldr	r4, .L39+12
	add	r6, r2, #260
.L20:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	.L14
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L15
	ldr	r3, [r4, #80]
	cmp	r3, #1
	bne	.L15
	ldr	r0, [r4]
	ldr	r3, [r4, #8]
	ldr	r1, [r2]
	add	r3, r0, r3
	cmp	r1, r3
	bge	.L15
	ldr	r3, [r2, #32]
	add	r1, r1, r3
	cmp	r0, r1
	blt	.L36
.L15:
	mov	r1, #0
	ldr	r3, .L39+16
.L17:
	ldr	r0, [r3, #16]
	cmp	r0, #0
	beq	.L18
	ldr	lr, [r3]
	ldr	r0, [r3, #8]
	ldr	ip, [r2]
	add	r0, lr, r0
	cmp	ip, r0
	bge	.L18
	ldr	r0, [r2, #32]
	add	ip, ip, r0
	cmp	lr, ip
	bge	.L18
	ldr	lr, [r3, #4]
	ldr	r0, [r3, #12]
	ldr	ip, [r2, #4]
	add	r0, lr, r0
	cmp	ip, r0
	bge	.L18
	ldr	r0, [r2, #36]
	add	ip, ip, r0
	cmp	lr, ip
	bge	.L18
	ldr	r0, .L39+20
	stm	sp, {r1, r2}
	mov	lr, pc
	bx	r5
	ldr	r1, [sp]
	ldr	r2, .L39+16
	add	r3, r1, r1, lsl #2
	add	r3, r2, r3, lsl #4
	ldr	r0, [r3, #16]
	cmp	r0, #0
	ldr	r2, [sp, #4]
	bne	.L37
.L19:
	mov	r3, #0
	str	r3, [r2, #8]
.L14:
	add	r2, r2, #52
	cmp	r2, r6
	bne	.L20
.L38:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	add	r1, r1, #1
	cmp	r1, #4
	add	r3, r3, #80
	bne	.L17
	add	r2, r2, #52
	cmp	r2, r6
	bne	.L20
	b	.L38
.L36:
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #12]
	ldr	r1, [r2, #4]
	add	r3, r0, r3
	cmp	r1, r3
	bge	.L15
	ldr	r3, [r2, #36]
	add	r1, r1, r3
	cmp	r0, r1
	bge	.L15
	ldr	r0, .L39+24
	str	r2, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r0, .L39+12
	ldr	r1, .L39+28
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r1
	mov	r3, #0
	ldr	r2, [sp]
	str	r3, [r2, #8]
	b	.L14
.L37:
	ldr	r0, .L39+32
	stm	sp, {r2, r3}
	mov	lr, pc
	bx	r5
	mov	r1, #0
	ldr	r3, [sp, #4]
	str	r1, [r3, #16]
	mov	r1, #1
	ldr	r2, .L39+16
	str	r1, [r3, #24]
	ldr	r3, [r2, #320]
	sub	r3, r3, #1
	str	r3, [r2, #320]
	ldr	r2, [sp]
	b	.L19
.L40:
	.align	2
.L39:
	.word	.LC2
	.word	mgba_printf
	.word	playerBullets
	.word	boss
	.word	.LANCHOR1
	.word	.LC4
	.word	.LC3
	.word	resetBossBullets
	.word	.LC5
	.size	checkSquarePatternKills.part.0, .-checkSquarePatternKills.part.0
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"=== EM PATTERN KILL CHECK (stationary sprite 632) ="
	.ascii	"==\000"
	.align	2
.LC7:
	.ascii	"Pattern %d, Pause Index %d, showEmPatternSprite2=%d"
	.ascii	"\000"
	.align	2
.LC10:
	.ascii	"Sprite 632 at WORLD position: (%d,%d) size: %dx%d\000"
	.align	2
.LC11:
	.ascii	"BOSS: world(%d,%d) size=%dx%d, dist from sprite: dx"
	.ascii	"=%d, dy=%d\000"
	.align	2
.LC12:
	.ascii	"YES\000"
	.align	2
.LC13:
	.ascii	"  Collision with sprite 632: %s\000"
	.align	2
.LC14:
	.ascii	"*** HIT! EM pattern sprite 632 killed BOSS!\000"
	.align	2
.LC15:
	.ascii	"NO\000"
	.align	2
.LC16:
	.ascii	"Enemy %d: world(%d,%d) size=%dx%d, dist from sprite"
	.ascii	": dx=%d, dy=%d\000"
	.align	2
.LC17:
	.ascii	"*** HIT! EM pattern sprite 632 killed enemy %d!\000"
	.align	2
.LC18:
	.ascii	"============================================\000"
	.text
	.align	2
	.syntax unified
	.arm
	.type	checkEMPatternKills.part.0, %function
checkEMPatternKills.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r0, .L77
	ldr	r6, .L77+4
	sub	sp, sp, #20
	mov	lr, pc
	bx	r6
	ldr	r4, .L77+8
	ldr	r3, .L77+12
	ldr	r5, .L77+16
	ldr	r3, [r3]
	ldr	r2, [r5]
	ldr	r1, [r4]
	ldr	r0, .L77+20
	mov	lr, pc
	bx	r6
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L72
	cmp	r3, #2
	beq	.L73
	cmp	r3, #3
	beq	.L74
.L65:
	mov	r8, #0
	mov	r7, r8
.L46:
	mov	r3, #64
	ldr	r4, .L77+24
	str	r3, [sp]
	mov	r2, r8
	mov	r1, r7
	ldr	r0, .L77+28
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L55
	ldr	r3, [r4, #80]
	cmp	r3, #2
	beq	.L75
.L55:
	ldr	r9, .L77+32
	mov	r5, #0
	mov	r4, r9
.L57:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	add	r0, r8, #32
	add	r1, r7, #32
	beq	.L59
	ldr	r3, [r4, #8]
	ldr	r2, [r4]
	str	r3, [sp]
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	sub	r1, r1, r3
	cmp	r1, #0
	rsblt	r1, r1, #0
	str	r1, [sp, #8]
	ldr	r3, [r4, #12]
	str	r3, [sp, #4]
	add	r1, r3, r3, lsr #31
	ldr	r3, [r4, #4]
	add	r1, r3, r1, asr #1
	sub	r0, r0, r1
	cmp	r0, #0
	rsblt	r0, r0, #0
	mov	r1, r5
	str	r0, [sp, #12]
	ldr	r0, .L77+36
	mov	lr, pc
	bx	r6
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	add	r3, r2, r3
	cmp	r7, r3
	add	r1, r7, #64
	bge	.L60
	cmp	r2, r1
	bge	.L60
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	add	r3, r2, r3
	cmp	r8, r3
	bge	.L60
	cmp	r8, #0
	moveq	r3, #64
	movne	r3, #256
	cmp	r2, r3
	ldr	r1, .L77+40
	ldr	r0, .L77+44
	blt	.L76
.L60:
	ldr	r1, .L77+48
	ldr	r0, .L77+44
	mov	lr, pc
	bx	r6
.L59:
	add	r5, r5, #1
	cmp	r5, #4
	add	r4, r4, #80
	bne	.L57
	ldr	r0, .L77+52
	mov	lr, pc
	bx	r6
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L73:
	ldr	r2, [r5]
	cmp	r2, #3
	bhi	.L65
	ldr	r3, .L77+56
	add	r3, r3, r2, lsl #2
	ldr	r7, [r3, #64]
	ldr	r8, [r3, #80]
	b	.L46
.L76:
	mov	lr, pc
	bx	r6
	mov	r1, r5
	ldr	r0, .L77+60
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L59
	mov	r1, r5
	ldr	r0, .L77+64
	mov	lr, pc
	bx	r6
	mov	r3, #0
	str	r3, [r4, #16]
	mov	r3, #1
	str	r3, [r4, #24]
	ldr	r3, [r9, #320]
	sub	r3, r3, #1
	str	r3, [r9, #320]
	b	.L59
.L72:
	ldr	r3, [r5]
	ldr	r2, .L77+68
	cmp	r3, #3
	bhi	.L65
	ldrb	r3, [r2, r3]
	add	pc, pc, r3, lsl #2
.Lrtx45:
	nop
	.section	.rodata
.L45:
	.byte	(.L53-.Lrtx45-4)/4
	.byte	(.L66-.Lrtx45-4)/4
	.byte	(.L63-.Lrtx45-4)/4
	.byte	(.L54-.Lrtx45-4)/4
	.text
	.p2align 2
.L63:
	mov	r8, #0
	mov	r7, #180
	b	.L46
.L53:
	mov	r8, #192
	mov	r7, #20
	b	.L46
.L66:
	mov	r8, #0
	mov	r7, #20
	b	.L46
.L54:
	mov	r8, #192
	mov	r7, #180
	b	.L46
.L74:
	ldr	r3, [r5]
	ldr	r2, .L77+72
	cmp	r3, #3
	bhi	.L65
	ldrsb	r3, [r2, r3]
	add	pc, pc, r3, lsl #2
.Lrtx52:
	nop
	.section	.rodata
.L52:
	.byte	(.L54-.Lrtx52-4)/4
	.byte	(.L53-.Lrtx52-4)/4
	.byte	(.L66-.Lrtx52-4)/4
	.byte	(.L63-.Lrtx52-4)/4
	.text
	.p2align 2
.L75:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	ldr	r1, [r4]
	str	r2, [sp]
	add	r0, r2, r2, lsr #31
	ldr	r2, [r4, #4]
	add	ip, r8, #32
	add	r0, r2, r0, asr #1
	sub	r0, ip, r0
	cmp	r0, #0
	add	lr, r3, r3, lsr #31
	rsblt	r0, r0, #0
	str	r0, [sp, #8]
	add	lr, r1, lr, asr #1
	add	r0, r7, #32
	sub	r0, r0, lr
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r0, [sp, #4]
	ldr	r0, .L77+76
	mov	lr, pc
	bx	r6
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	add	r3, r2, r3
	cmp	r7, r3
	bge	.L56
	add	r3, r7, #64
	cmp	r2, r3
	bge	.L56
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	add	r3, r2, r3
	cmp	r8, r3
	bge	.L56
	cmp	r8, #0
	moveq	r3, #64
	movne	r3, #256
	cmp	r2, r3
	bge	.L56
	ldr	r1, .L77+40
	ldr	r0, .L77+44
	mov	lr, pc
	bx	r6
	ldr	r0, .L77+80
	mov	lr, pc
	bx	r6
	mov	r2, #0
	mov	r0, r4
	ldr	r3, .L77+84
	str	r2, [r4, #16]
	mov	lr, pc
	bx	r3
	b	.L55
.L56:
	ldr	r1, .L77+48
	ldr	r0, .L77+44
	mov	lr, pc
	bx	r6
	b	.L55
.L78:
	.align	2
.L77:
	.word	.LC6
	.word	mgba_printf
	.word	patternCompleted2
	.word	showEmPatternSprite2
	.word	emPatternSpriteIndex
	.word	.LC7
	.word	boss
	.word	.LC10
	.word	.LANCHOR1
	.word	.LC16
	.word	.LC12
	.word	.LC13
	.word	.LC15
	.word	.LC18
	.word	.LANCHOR0
	.word	.LC17
	.word	.LC5
	.word	.L45
	.word	.L52
	.word	.LC11
	.word	.LC14
	.word	resetBossBullets
	.size	checkEMPatternKills.part.0, .-checkEMPatternKills.part.0
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"Collision check at (%d,%d): color=%d\000"
	.text
	.align	2
	.global	getCollisionType
	.syntax unified
	.arm
	.type	getCollisionType, %function
getCollisionType:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	lr, .L84
	ldr	r2, [lr, #324]
	bic	r0, r0, r0, asr #31
	add	r3, r2, r2, lsl #4
	add	r2, r2, #1
	cmp	r0, #255
	sub	sp, sp, #8
	str	r2, [lr, #324]
	bic	r2, r1, r1, asr #31
	movge	r0, #255
	cmp	r2, #255
	movge	r2, #255
	ldr	ip, .L84+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	ip, ip, r3
	ldr	r3, .L84+8
	ldr	r4, .L84+12
	cmp	r3, ip, ror #2
	add	r3, r0, r2, lsl #8
	ldrb	r3, [r4, r3]	@ zero_extendqisi2
	bcs	.L83
.L80:
	sub	r2, r3, #1
	and	r2, r2, #255
	cmp	r2, #12
	movcc	r0, r3
	movcs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L83:
	mov	r1, r0
	ldr	r4, .L84+16
	ldr	r0, .L84+20
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r4
	ldr	r3, [sp, #4]
	b	.L80
.L85:
	.align	2
.L84:
	.word	.LANCHOR1
	.word	143165576
	.word	71582788
	.word	tempCol2Bitmap
	.word	mgba_printf
	.word	.LC19
	.size	getCollisionType, .-getCollisionType
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"MAX VERTICAL TIME: Switching to horizontal at %d\000"
	.align	2
.LC21:
	.ascii	"VERTICAL TRANSITION TO COLLISION_1: Enemy will be c"
	.ascii	"arried by scrolling\000"
	.align	2
.LC22:
	.ascii	"VERTICAL: 60% chance failed, staying on current pat"
	.ascii	"h\000"
	.align	2
.LC23:
	.ascii	"COLLISION_11/12 -> %d: Respawned using spawn functi"
	.ascii	"on\000"
	.align	2
.LC24:
	.ascii	"SUCCESS: Vertical enemy reached target %d, switchin"
	.ascii	"g to horizontal\000"
	.align	2
.LC25:
	.ascii	"FORCE: COLLISION_11/12 -> %d: Respawned using spawn"
	.ascii	" function\000"
	.align	2
.LC26:
	.ascii	"MIN HORIZONTAL TIME: Switching to vertical %d -> %d"
	.ascii	"\000"
	.align	2
.LC27:
	.ascii	"COLLISION_10 DETECTED: Moving away from obstacle\000"
	.align	2
.LC28:
	.ascii	"COLLISION_10 AHEAD: Reversing direction immediately"
	.ascii	"\000"
	.align	2
.LC29:
	.ascii	"HORIZONTAL: enemy(%d,%d) checking(%d,%d) result=%d,"
	.ascii	" path=%d, timer=%d\000"
	.align	2
.LC30:
	.ascii	"HORIZONTAL TRANSITION TO COLLISION_1: Enemy will be"
	.ascii	" carried by scrolling\000"
	.align	2
.LC31:
	.ascii	"60% chance: Staying in normal 5<->6 cycle\000"
	.align	2
.LC32:
	.ascii	"Transition check: edgeColl=%d, current path=%d, tim"
	.ascii	"er=%d\000"
	.align	2
.LC33:
	.ascii	"Ignoring COLLISION_1 to allow 5<->6 transition\000"
	.align	2
.LC34:
	.ascii	"EDGE TRANSITION: Top %d -> %d\000"
	.align	2
.LC35:
	.ascii	"EDGE TRANSITION: Bottom %d -> %d\000"
	.align	2
.LC36:
	.ascii	"Staying horizontal, reversing direction\000"
	.align	2
.LC37:
	.ascii	"RANDOM TRANSITION: Top %d -> %d\000"
	.align	2
.LC38:
	.ascii	"RANDOM TRANSITION: Bottom %d -> %d\000"
	.align	2
.LC39:
	.ascii	"Screen edge hit, forcing transition\000"
	.align	2
.LC40:
	.ascii	"Random direction change instead of transition\000"
	.align	2
.LC41:
	.ascii	"SCREEN EDGE TRANSITION: Top %d -> %d\000"
	.align	2
.LC42:
	.ascii	"SCREEN EDGE TRANSITION: Bottom %d -> %d\000"
	.align	2
.LC43:
	.ascii	"Screen edge: Staying horizontal, reversing directio"
	.ascii	"n\000"
	.align	2
.LC44:
	.ascii	"Random direction change in same area\000"
	.align	2
.LC45:
	.ascii	"VERTICAL: enemy(%d,%d) dir=%d, edgeColl=%d, target="
	.ascii	"%d\000"
	.text
	.align	2
	.syntax unified
	.arm
	.type	updateEnemyCollisionMovement2.part.0, %function
updateEnemyCollisionMovement2.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L297
	ldr	r2, [r3]
	cmp	r2, #2
	ldr	r3, [r0, #64]
	beq	.L278
.L87:
	cmp	r3, #0
	bxne	lr
	ldr	r3, [r0, #60]
	cmp	r3, #0
	bxle	lr
	ldr	r2, [r0, #68]
	cmp	r2, #1
	bxeq	lr
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #60]
	bxne	lr
	mov	r3, #1
	str	r3, [r0, #64]
	bx	lr
.L278:
	cmp	r3, #1
	bne	.L87
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, .L297+4
	cmp	r0, ip
	sub	sp, sp, #48
	beq	.L196
	add	r1, ip, #80
	cmp	r0, r1
	beq	.L197
	add	r3, ip, #160
	cmp	r0, r3
	beq	.L198
	add	r3, ip, #240
	cmp	r0, r3
	mvnne	r6, #0
	moveq	r6, #3
.L88:
	ldr	r1, [r0, #68]
	cmp	r1, #1
	beq	.L279
	ldr	r2, .L297+4
	ldr	r3, [r2, #328]
	add	r3, r3, #1
	str	r3, [r2, #328]
	ldr	r2, [r2, #332]
	cmp	r2, #0
	beq	.L91
	cmp	r2, #1
	beq	.L92
.L93:
	ldr	r2, [r0, #20]
	cmp	r2, #0
	mov	r4, r0
	ldr	r3, .L297+4
	beq	.L280
	add	r2, r3, r6, lsl #2
	ldr	r3, [r2, #356]
	cmn	r6, #1
	addne	r3, r3, #1
	strne	r3, [r2, #356]
	cmp	r3, #89
	lsl	r7, r6, #2
	bgt	.L253
	ldr	r10, .L297+8
.L132:
	ldr	r3, [r4, #8]
	ldr	r2, [r4]
	add	r3, r3, r3, lsr #31
	ldr	r1, [r4, #4]
	add	r0, r2, r3, asr #1
	add	r5, r2, r3, asr #1
	bl	getCollisionType
	cmp	r0, #10
	beq	.L281
.L137:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	ldm	r4, {r0, r1}
	ldrne	r3, [r4, #8]
	addne	r0, r0, r3
	subeq	r0, r0, #8
	addne	r0, r0, #8
	bl	getCollisionType
	cmp	r0, #10
	beq	.L282
.L140:
	ldr	r3, [r4, #48]
	ldr	r2, [r4, #28]
	cmp	r3, #0
	ldr	r3, [r4]
	addne	r3, r3, r2
	ldrne	r2, [r4, #8]
	subeq	r3, r3, r2
	strne	r3, [r4]
	addne	r3, r3, r2
	addne	r3, r3, #1
	streq	r3, [r4]
	ldr	r1, [r4, #4]
	subeq	r3, r3, #1
	mov	r0, r3
	str	r3, [sp, #20]
	str	r1, [sp, #24]
	bl	getCollisionType
	ldr	r3, .L297+4
	ldr	ip, .L297+12
	ldr	r2, [r3, #372]
	mov	r8, r0
	smull	r0, ip, r2, ip
	asr	r0, r2, #31
	add	ip, ip, r2
	rsb	r0, r0, ip, asr #4
	rsb	r0, r0, r0, lsl #4
	subs	r0, r2, r0, lsl #1
	add	r2, r2, #1
	mov	r5, r3
	str	r2, [r3, #372]
	bne	.L143
	cmn	r6, #1
	addne	r0, r5, r7
	ldr	ip, [r4]
	ldrne	r0, [r0, #356]
	ldr	lr, [r4, #68]
	ldr	r1, [sp, #24]
	ldr	r2, [r4, #4]
	ldr	r3, [sp, #20]
	str	r0, [sp, #12]
	str	r1, [sp]
	str	lr, [sp, #8]
	mov	r1, ip
	str	r8, [sp, #4]
	ldr	r0, .L297+16
	ldr	ip, .L297+20
	mov	lr, pc
	bx	ip
.L143:
	cmp	r8, #1
	ldr	r2, [r4, #68]
	beq	.L283
	cmn	r6, #1
	beq	.L154
	ldr	r3, .L297+4
	add	r3, r3, r7
	ldr	r3, [r3, #356]
	cmp	r3, #89
	ble	.L154
	cmp	r8, #10
	bne	.L271
	cmp	r2, #10
	beq	.L155
.L255:
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L273
	ldr	r2, [r4, #8]
	rsb	r2, r2, #256
	cmp	r2, r3
	bgt	.L154
.L273:
	ldr	r9, .L297+20
.L179:
	ldr	r0, .L297+24
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r10
	ldr	r2, .L297+28
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	cmp	r0, #79
	bgt	.L284
	ldr	r1, [r4, #68]
	mov	r3, #0
	cmp	r1, #5
	cmpne	r1, #11
	str	r3, [r4, #20]
	moveq	r2, #1
	movne	r2, #0
	bne	.L181
	cmp	r1, #11
	movne	r2, #6
	moveq	r2, #12
	mov	r3, #1
	str	r2, [r4, #72]
	str	r3, [r4, #48]
	ldr	r0, .L297+32
	mov	lr, pc
	bx	r9
.L154:
	mov	lr, pc
	bx	r10
	add	r0, r0, r0, lsl #4
	ldr	r3, .L297+36
	add	r0, r0, r0, lsl #8
	ldr	r2, .L297+40
	add	r0, r0, r0, lsl #16
	sub	r3, r3, r0
	cmp	r2, r3, ror #3
	ldr	r2, [r4, #68]
	bcc	.L184
	cmp	r8, r2
	beq	.L285
.L184:
	ldr	r1, [r4]
	cmp	r1, #0
	movle	r3, #0
	movle	r0, #1
	movle	r1, r3
	strle	r3, [r4]
	ldr	r3, [r4, #8]
	rsb	r3, r3, #256
	strle	r0, [r4, #48]
	cmp	r3, r1
	movle	r1, #0
	strle	r3, [r4]
	strle	r1, [r4, #48]
.L130:
	cmp	r2, #1
	beq	.L86
	ldr	r2, [r4]
	cmp	r2, #0
	movlt	r3, #0
	movlt	r2, r3
	strlt	r3, [r4]
	ldr	r3, [r4, #8]
	rsb	r3, r3, #256
	cmp	r2, r3
	ldr	r2, [r4, #4]
	strgt	r3, [r4]
	cmp	r2, #0
	movlt	r3, #0
	movlt	r2, r3
	strlt	r3, [r4, #4]
	ldr	r3, [r4, #12]
	rsb	r3, r3, #256
	cmp	r3, r2
	strlt	r3, [r4, #4]
.L86:
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L280:
	add	r0, r3, r6, lsl #2
	ldr	r3, [r0, #340]
	add	r3, r3, #1
	cmp	r3, #239
	str	r3, [r0, #340]
	lsl	r7, r6, #2
	bgt	.L286
	ldr	r1, [r4, #48]
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #28]
	ldr	r2, [r4]
	cmp	r1, #0
	subeq	r0, r0, r3
	addne	r0, r0, r3
	ldr	r3, [r4, #8]
	add	ip, r2, #8
	str	ip, [sp, #36]
	add	ip, r3, r3, lsr #31
	add	r3, r2, r3
	add	r2, r2, ip, asr #1
	str	r2, [sp, #32]
	mov	r5, #0
	mov	r2, #0
	sub	r3, r3, #8
	str	r0, [r4, #4]
	ldr	r9, .L297+20
	str	r3, [sp, #40]
	add	r3, sp, #32
.L114:
	cmp	r1, #0
	ldrne	r1, [r4, #12]
	addne	r1, r0, r1
	subeq	r1, r0, #1
	addne	r1, r1, #1
	ldr	r0, [r3]
	str	r2, [sp, #24]
	str	r3, [sp, #20]
	bl	getCollisionType
	cmp	r0, #1
	mov	r1, r0
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #24]
	beq	.L287
.L107:
	ldr	r0, [r4, #72]
	cmp	r1, r0
	beq	.L110
	cmp	r2, #0
	beq	.L288
	cmp	r2, #2
	bne	.L289
	str	r0, [sp, #4]
	str	r5, [sp]
	ldr	r0, .L297+44
	ldr	r3, [r4, #48]
	ldm	r4, {r1, r2}
	mov	lr, pc
	bx	r9
.L194:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	ldr	r2, [r4, #4]
	bne	.L119
	cmp	r2, #16
	bgt	.L120
	mov	r2, #8
	str	r2, [r4, #4]
	ldr	r2, [r4, #68]
	ldr	r1, [r4, #72]
	sub	r2, r2, #11
	cmp	r2, #1
	sub	r2, r1, #11
	bls	.L290
.L121:
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	mov	r3, #1
	cmn	r6, #1
	str	r1, [r4, #68]
	str	r2, [r4, #48]
	str	r3, [r4, #20]
	beq	.L270
.L128:
	mov	r1, #0
	ldr	r3, .L297+4
	add	r3, r3, r7
	ldr	r2, [r4, #4]
	str	r1, [r3, #356]
	str	r1, [r3, #340]
.L125:
	cmp	r2, #0
	movle	r3, #0
	movle	r2, r3
	strle	r3, [r4, #4]
.L120:
	ldr	r3, [r4, #12]
	rsb	r3, r3, #256
	cmp	r3, r2
	strle	r3, [r4, #4]
	ldr	r2, [r4, #68]
	b	.L130
.L92:
	cmp	r3, #89
	movgt	r3, #0
	ldrgt	r2, .L297+4
	strgt	r3, [r2, #332]
	strgt	r3, [r2, #328]
	b	.L93
.L91:
	ldr	lr, .L297+4
	ldr	ip, [lr, #336]
	add	ip, ip, #2
	cmp	ip, #255
	movle	r2, ip
	cmp	r3, #119
	str	r2, [lr, #336]
	movgt	r3, #1
	movgt	r2, #0
	strgt	r3, [lr, #332]
	strgt	r2, [lr, #328]
	b	.L93
.L288:
	mov	r2, #1
	mov	r5, r1
	ldr	r0, [r4, #4]
	ldr	r1, [r4, #48]
.L112:
	add	r3, r3, #4
	b	.L114
.L287:
	ldr	r0, [r4, #68]
	sub	r0, r0, #5
	cmp	r0, #1
	bhi	.L107
	ldr	r0, .L297+8
	str	r1, [sp, #28]
	mov	lr, pc
	bx	r0
	ldr	lr, .L297+28
	smull	ip, lr, r0, lr
	asr	ip, r0, #31
	rsb	ip, ip, lr, asr #5
	add	ip, ip, ip, lsl #2
	add	ip, ip, ip, lsl #2
	sub	r0, r0, ip, lsl #2
	cmp	r0, #39
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #24]
	ldr	r1, [sp, #28]
	ble	.L291
	ldr	r0, .L297+48
	str	r1, [sp, #28]
	str	r2, [sp, #24]
	str	r3, [sp, #20]
	mov	lr, pc
	bx	r9
	ldr	r1, [sp, #28]
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #20]
	b	.L107
.L279:
	mov	r3, #0
	str	r3, [r0, #28]
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	b	.L86
.L253:
	ldr	r3, .L297+8
	mov	r10, r3
	mov	lr, pc
	bx	r3
	ldr	r2, .L297+28
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	cmp	r0, #79
	bgt	.L132
	ldr	r1, [r4, #68]
	mov	r3, #0
	cmp	r1, #5
	cmpne	r1, #11
	str	r3, [r4, #20]
	moveq	r2, #1
	movne	r2, #0
	bne	.L133
	mov	r3, #1
	cmp	r1, #11
	str	r3, [r4, #48]
	moveq	r3, #12
	movne	r3, #6
	str	r3, [r4, #72]
.L135:
	mov	r2, #0
	ldr	r3, .L297+4
	add	r3, r3, r7
	str	r2, [r3, #356]
	str	r2, [r3, #340]
	b	.L86
.L289:
	mov	r2, #2
	ldr	r0, [r4, #4]
	ldr	r1, [r4, #48]
	b	.L112
.L286:
	mov	r3, #1
	cmn	r6, #1
	strne	r2, [r0, #356]
	sub	r2, r1, #11
	str	r3, [r4, #20]
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	cmp	r1, #5
	movne	r2, r3
	orreq	r2, r3, #1
	cmp	r2, #0
	beq	.L100
	str	r3, [r4, #48]
	ldr	r0, .L297+52
	ldr	r3, .L297+20
	mov	lr, pc
	bx	r3
.L101:
	mov	r2, #0
	ldr	r3, .L297+4
	add	r3, r3, r7
	str	r2, [r3, #340]
	b	.L86
.L110:
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L297+44
	ldr	r3, [r4, #48]
	ldm	r4, {r1, r2}
	mov	lr, pc
	bx	r9
	ldr	r3, [r4, #68]
	ldr	r1, [r4, #72]
	sub	r3, r3, #11
	cmp	r3, #1
	sub	r3, r1, #11
	bls	.L292
.L115:
	cmp	r3, #1
	movhi	r3, #0
	movls	r3, #1
	str	r3, [r4, #48]
	mov	r3, #1
	cmn	r6, #1
	movne	r2, #0
	str	r3, [r4, #20]
	ldrne	r3, .L297+4
	str	r1, [r4, #68]
	addne	r3, r3, r7
	ldr	r0, .L297+56
	strne	r2, [r3, #356]
	mov	lr, pc
	bx	r9
	b	.L194
.L119:
	cmp	r3, #1
	bne	.L125
	cmp	r2, #239
	ble	.L125
	mov	r1, #232
	ldr	r3, [r4, #68]
	ldr	r2, [r4, #72]
	sub	r3, r3, #11
	cmp	r3, #1
	str	r1, [r4, #4]
	sub	r3, r2, #11
	bls	.L293
.L126:
	cmp	r3, #1
	movhi	r3, #0
	movls	r3, #1
	str	r3, [r4, #48]
	mov	r3, #1
	cmn	r6, #1
	str	r2, [r4, #68]
	str	r3, [r4, #20]
	bne	.L128
.L270:
	ldr	r2, [r4, #4]
	b	.L125
.L281:
	ldr	r3, [r4, #68]
	cmp	r3, #5
	cmpne	r3, #11
	bne	.L137
	cmp	r5, #127
	movle	r3, #0
	movgt	r3, #1
	ldr	r0, .L297+60
	str	r3, [r4, #48]
	ldr	r3, .L297+20
	mov	lr, pc
	bx	r3
	b	.L137
.L283:
	sub	r3, r2, #5
	cmp	r3, #1
	bls	.L294
	cmn	r6, #1
	beq	.L154
	ldr	r3, .L297+4
	add	r3, r3, r7
	ldr	r3, [r3, #356]
	cmp	r3, #89
	ble	.L154
.L271:
	ldr	r9, .L297+20
.L152:
	mov	r1, r8
	ldr	r0, .L297+64
	mov	lr, pc
	bx	r9
	ldr	r3, [r4, #68]
	sub	r2, r3, #5
	cmp	r2, #1
	bls	.L295
	cmp	r8, r3
	beq	.L155
	cmp	r8, #1
	bne	.L159
.L257:
	cmp	r3, #1
	bne	.L160
.L155:
	mov	lr, pc
	bx	r10
	add	r3, r0, r0, lsl #4
	ldr	r2, .L297+36
	add	r3, r3, r3, lsl #8
	ldr	r1, .L297+68
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #2
	bcc	.L255
	mov	lr, pc
	bx	r10
	ldr	r2, .L297+28
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	cmp	r0, #79
	bgt	.L171
	ldr	r1, [r4, #68]
	mov	r3, #0
	cmp	r1, #5
	cmpne	r1, #11
	str	r3, [r4, #20]
	moveq	r3, #1
	movne	r3, #0
	bne	.L172
	mov	r3, #1
	cmp	r1, #11
	movne	r2, #6
	moveq	r2, #12
	str	r3, [r4, #48]
	ldr	r3, .L297+20
	str	r2, [r4, #72]
	ldr	r0, .L297+72
	mov	r9, r3
	mov	lr, pc
	bx	r3
.L174:
	mov	r1, #0
	ldr	r3, .L297+4
	ldr	r2, [r4]
	add	r3, r3, r7
	cmp	r2, r1
	str	r1, [r3, #356]
	str	r1, [r3, #340]
	ble	.L179
.L272:
	ldr	r3, [r4, #8]
	rsb	r3, r3, #256
	cmp	r3, r2
	ble	.L179
	b	.L154
.L100:
	sub	r3, r1, #12
	rsbs	r2, r3, #0
	adc	r2, r2, r3
	ldr	r0, .L297+52
	ldr	r3, .L297+20
	str	r2, [r4, #48]
	mov	lr, pc
	bx	r3
	b	.L101
.L282:
	ldr	r3, [r4, #48]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r0, .L297+76
	str	r3, [r4, #48]
	ldr	r3, .L297+20
	mov	lr, pc
	bx	r3
	b	.L140
.L196:
	mov	r6, #0
	b	.L88
.L292:
	cmp	r3, #1
	bhi	.L115
	ldr	r2, .L297+8
	mov	lr, pc
	bx	r2
	ldr	r1, .L297+28
	smull	r3, r1, r0, r1
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	cmp	r0, #59
	ldr	r2, .L297+8
	ble	.L116
	ldr	r1, [r4, #72]
	sub	r3, r1, #11
	b	.L115
.L197:
	mov	r6, r3
	b	.L88
.L198:
	mov	r6, r2
	b	.L88
.L295:
	sub	r3, r8, #5
	cmp	r3, #1
	bls	.L158
	cmp	r8, #1
	bne	.L159
.L160:
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L179
	ldr	r2, [r4, #8]
	rsb	r2, r2, #256
	cmp	r2, r3
	ble	.L179
	b	.L154
.L158:
	ldr	r0, .L297+80
	mov	lr, pc
	bx	r9
	ldr	r3, [r4, #68]
	cmp	r8, r3
	beq	.L155
.L159:
	mov	lr, pc
	bx	r10
	ldr	r2, .L297+28
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	cmp	r0, #79
	bgt	.L296
	ldr	r1, [r4, #68]
	mov	r3, #0
	cmp	r1, #5
	cmpne	r1, #11
	str	r3, [r4, #20]
	moveq	r3, #1
	movne	r3, #0
	bne	.L165
	cmp	r1, #11
	movne	r2, #6
	moveq	r2, #12
	mov	r3, #1
	str	r2, [r4, #72]
	str	r3, [r4, #48]
	ldr	r0, .L297+84
	mov	lr, pc
	bx	r9
.L167:
	mov	r2, #0
	ldr	r3, [r4, #68]
	cmp	r8, r3
	ldr	r3, .L297+4
	add	r3, r3, r7
	str	r2, [r3, #356]
	str	r2, [r3, #340]
	beq	.L155
.L259:
	ldr	r2, [r4]
	cmp	r2, #0
	bgt	.L272
	b	.L179
.L133:
	cmp	r1, #12
	str	r2, [r4, #48]
	movne	r2, #5
	moveq	r2, #11
	ldr	r0, .L297+88
	ldr	r3, .L297+20
	str	r2, [r4, #72]
	mov	lr, pc
	bx	r3
	b	.L135
.L285:
	ldr	r3, [r4, #48]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r2, .L297+20
	ldr	r0, .L297+92
	str	r3, [r4, #48]
	mov	lr, pc
	bx	r2
	ldr	r2, [r4, #68]
	b	.L184
.L294:
	mov	lr, pc
	bx	r10
	ldr	r2, .L297+28
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	cmp	r0, #39
	bgt	.L147
	mov	r3, #0
	cmn	r6, #1
	str	r8, [r4, #68]
	str	r8, [r4, #20]
	str	r3, [r4, #28]
	beq	.L148
	ldr	r2, .L297+4
	add	r2, r2, r7
	str	r3, [r2, #356]
	str	r3, [r2, #340]
	ldr	r3, .L297+20
	ldr	r0, .L297+96
	mov	r9, r3
	str	r2, [sp, #20]
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #20]
	ldr	r3, [r2, #356]
	cmp	r3, #89
	ble	.L154
	ldr	r2, [r4, #68]
	mov	r1, r8
	ldr	r0, .L297+64
	mov	lr, pc
	bx	r9
	ldr	r3, [r4, #68]
	sub	r2, r3, #5
	cmp	r2, #1
	bhi	.L257
	b	.L160
.L181:
	cmp	r1, #12
	str	r2, [r4, #48]
	movne	r2, #5
	moveq	r2, #11
	ldr	r0, .L297+100
	str	r2, [r4, #72]
	mov	lr, pc
	bx	r9
	b	.L154
.L290:
	cmp	r2, #1
	bhi	.L121
	str	r3, [sp, #20]
	ldr	r3, .L297+8
	mov	lr, pc
	bx	r3
	mov	r1, #100
	ldr	r2, .L297+104
	mov	lr, pc
	bx	r2
	cmp	r1, #59
	ble	.L122
	ldr	r1, [r4, #72]
	sub	r2, r1, #11
	b	.L121
.L284:
	ldr	r3, [r4, #48]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r0, .L297+108
	str	r3, [r4, #48]
	mov	lr, pc
	bx	r9
	b	.L154
.L293:
	cmp	r3, #1
	bhi	.L126
	ldr	r3, .L297+8
	mov	lr, pc
	bx	r3
	mov	r1, #100
	ldr	r2, .L297+104
	mov	lr, pc
	bx	r2
	cmp	r1, #59
	ldr	r3, .L297+8
	ble	.L127
	ldr	r2, [r4, #72]
	sub	r3, r2, #11
	b	.L126
.L165:
	cmp	r1, #12
	movne	r2, #5
	moveq	r2, #11
	str	r3, [r4, #48]
	ldr	r0, .L297+112
	str	r2, [r4, #72]
	mov	lr, pc
	bx	r9
	b	.L167
.L296:
	ldr	r3, [r4, #48]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r0, .L297+116
	str	r3, [r4, #48]
	mov	lr, pc
	bx	r9
	ldr	r3, [r4, #68]
	cmp	r8, r3
	bne	.L259
	b	.L155
.L147:
	ldr	r3, .L297+20
	ldr	r0, .L297+120
	mov	r9, r3
	mov	lr, pc
	bx	r3
	cmn	r6, #1
	beq	.L154
	ldr	r3, .L297+4
	add	r3, r3, r7
	ldr	r3, [r3, #356]
	cmp	r3, #89
	ldrgt	r2, [r4, #68]
	bgt	.L152
	b	.L154
.L148:
	ldr	r0, .L297+96
	ldr	r3, .L297+20
	mov	lr, pc
	bx	r3
	b	.L154
.L172:
	cmp	r1, #12
	movne	r2, #5
	moveq	r2, #11
	str	r3, [r4, #48]
	ldr	r3, .L297+20
	ldr	r0, .L297+124
	str	r2, [r4, #72]
	mov	r9, r3
	mov	lr, pc
	bx	r3
	b	.L174
.L171:
	ldr	r3, [r4, #48]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r2, .L297+20
	ldr	r0, .L297+128
	str	r3, [r4, #48]
	mov	r9, r2
	mov	lr, pc
	bx	r2
	ldr	r2, [r4]
	cmp	r2, #0
	bgt	.L272
	b	.L179
.L116:
	mov	lr, pc
	bx	r2
	mov	r2, #0
	ldr	r1, .L297+4
	str	r2, [r4, #16]
	ldr	r2, [r1, #320]
	and	r3, r0, #1
	add	r4, r3, #5
	sub	r3, r2, #1
	cmp	r3, #3
	str	r3, [r1, #320]
	movle	r0, r4
	blle	spawnEnemyAtCollisionColor2.part.0
.L117:
	mov	r1, r4
	ldr	r0, .L297+132
	mov	lr, pc
	bx	r9
	b	.L86
.L291:
	mov	r3, #0
	cmn	r6, #1
	ldrne	r2, .L297+4
	str	r1, [r4, #68]
	addne	r2, r2, r7
	str	r3, [r4, #28]
	ldr	r0, .L297+136
	strne	r3, [r2, #340]
	strne	r3, [r2, #356]
	mov	lr, pc
	bx	r9
	b	.L86
.L122:
	ldr	r3, .L297+8
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #20]
	ldr	r2, .L297+4
	str	r3, [r4, #16]
	ldr	r3, [r2, #320]
	sub	r3, r3, #1
	and	r4, r0, #1
	cmp	r3, #3
	str	r3, [r2, #320]
	add	r4, r4, #5
	movle	r0, r4
	blle	spawnEnemyAtCollisionColor2.part.0
.L123:
	mov	r1, r4
	ldr	r0, .L297+140
	mov	lr, pc
	bx	r9
	b	.L86
.L127:
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r1, .L297+4
	ldr	r3, [r1, #320]
	sub	r3, r3, #1
	cmp	r3, #3
	str	r2, [r4, #16]
	str	r3, [r1, #320]
	bgt	.L86
	and	r0, r0, #1
	add	r0, r0, #5
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	spawnEnemyAtCollisionColor2.part.0
.L298:
	.align	2
.L297:
	.word	currentLevel
	.word	.LANCHOR1
	.word	rand
	.word	-2004318071
	.word	.LC29
	.word	mgba_printf
	.word	.LC39
	.word	1374389535
	.word	.LC41
	.word	143165576
	.word	35791394
	.word	.LC45
	.word	.LC22
	.word	.LC20
	.word	.LC24
	.word	.LC27
	.word	.LC32
	.word	71582788
	.word	.LC37
	.word	.LC28
	.word	.LC33
	.word	.LC34
	.word	.LC26
	.word	.LC44
	.word	.LC30
	.word	.LC42
	.word	__aeabi_idivmod
	.word	.LC43
	.word	.LC35
	.word	.LC36
	.word	.LC31
	.word	.LC38
	.word	.LC40
	.word	.LC23
	.word	.LC21
	.word	.LC25
	.size	updateEnemyCollisionMovement2.part.0, .-updateEnemyCollisionMovement2.part.0
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #11
	mov	ip, #12
	mov	r0, #13
	mov	r1, #14
	ldr	r3, .L301
	str	lr, [r3, #56]
	str	r2, [r3, #320]
	str	r2, [r3, #16]
	str	r2, [r3, #96]
	str	ip, [r3, #136]
	str	r2, [r3, #176]
	str	r0, [r3, #216]
	str	r2, [r3, #256]
	str	r1, [r3, #296]
	ldr	lr, [sp], #4
	bx	lr
.L302:
	.align	2
.L301:
	.word	.LANCHOR1
	.size	initEnemies, .-initEnemies
	.section	.rodata.str1.4
	.align	2
.LC46:
	.ascii	"Enemy %d spawned at (%d,%d) with collision path %d\000"
	.text
	.align	2
	.global	spawnEnemyAtCollisionColor
	.syntax unified
	.arm
	.type	spawnEnemyAtCollisionColor, %function
spawnEnemyAtCollisionColor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L312
	ldr	r3, [r5, #320]
	cmp	r3, #3
	sub	sp, sp, #8
	bgt	.L303
	sub	r2, r0, #2
	cmp	r2, #3
	movhi	r2, #128
	ldrls	ip, .L312+4
	addls	ip, ip, r2, lsl #2
	ldrls	r2, [ip, #96]
	movhi	r6, r2
	movls	r6, r2
	ldrls	r2, [ip, #112]
	mov	ip, #0
	ldr	lr, .L312
.L307:
	ldr	r4, [lr, #16]
	cmp	r4, #0
	add	lr, lr, #80
	beq	.L311
	add	ip, ip, #1
	cmp	ip, #4
	bne	.L307
.L303:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L311:
	mov	r10, r1
	add	r1, r3, #1
	add	r3, ip, ip, lsl #2
	add	lr, r5, r3, lsl #4
	mov	r9, r0
	lsl	r0, r3, #4
	str	r6, [r5, r0]
	str	r2, [lr, #4]
	mov	r3, r2
	mov	r7, #32
	mov	r2, r6
	mov	r6, #32
	mov	r8, #1
	str	r6, [lr, #8]
	str	r7, [lr, #12]
	mov	r6, #0
	mov	r7, #0
	str	r1, [r5, #320]
	mov	r1, ip
	add	ip, r0, #40
	add	ip, r5, ip
	str	r10, [lr, #20]
	str	r8, [lr, #28]
	str	r8, [lr, #16]
	ldr	r0, .L312+8
	stm	ip, {r6-r7}
	ldr	r5, .L312+12
	str	r4, [lr, #48]
	str	r8, [lr, #64]
	str	r9, [lr, #68]
	str	r9, [sp]
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L313:
	.align	2
.L312:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LC46
	.word	mgba_printf
	.size	spawnEnemyAtCollisionColor, .-spawnEnemyAtCollisionColor
	.align	2
	.global	spawnEnemyAtCollisionColor2
	.syntax unified
	.arm
	.type	spawnEnemyAtCollisionColor2, %function
spawnEnemyAtCollisionColor2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L316
	ldr	r3, [r3, #320]
	cmp	r3, #3
	bxgt	lr
	b	spawnEnemyAtCollisionColor2.part.0
.L317:
	.align	2
.L316:
	.word	.LANCHOR1
	.size	spawnEnemyAtCollisionColor2, .-spawnEnemyAtCollisionColor2
	.align	2
	.global	spawnEnemy
	.syntax unified
	.arm
	.type	spawnEnemy, %function
spawnEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L325
	ldr	r3, [r4, #320]
	cmp	r3, #3
	sub	sp, sp, #12
	bgt	.L318
	mov	ip, r4
	mov	r3, #0
.L321:
	ldr	lr, [ip, #16]
	cmp	lr, #0
	add	ip, ip, #80
	beq	.L324
	add	r3, r3, #1
	cmp	r3, #4
	bne	.L321
.L318:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L324:
	mov	r5, r1
	mov	r1, #32
	add	r3, r3, r3, lsl #2
	lsl	ip, r3, #4
	add	r3, r4, r3, lsl #4
	str	r0, [r4, ip]
	mov	lr, #1
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	mov	r0, #0
	mov	r1, #0
	add	ip, ip, #40
	add	ip, r4, ip
	str	r5, [r3, #4]
	str	r2, [r3, #20]
	str	lr, [r3, #28]
	str	lr, [r3, #16]
	ldr	r2, .L325+4
	stm	ip, {r0-r1}
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r2
	ldr	r1, [r4, #320]
	subs	r2, r0, #0
	and	r2, r2, #1
	ldr	r3, [sp, #4]
	rsblt	r2, r2, #0
	add	r1, r1, #1
	str	r2, [r3, #48]
	str	r1, [r4, #320]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L326:
	.align	2
.L325:
	.word	.LANCHOR1
	.word	rand
	.size	spawnEnemy, .-spawnEnemy
	.align	2
	.global	updateEnemySpawn
	.syntax unified
	.arm
	.type	updateEnemySpawn, %function
updateEnemySpawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L353
	ldr	r3, [r3]
	cmp	r3, #1
	sub	sp, sp, #12
	beq	.L350
	cmp	r3, #2
	beq	.L351
.L327:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L351:
	mvn	r2, #0
	ldr	r3, .L353+4
.L342:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bne	.L337
	ldr	r1, [r3, #16]
	cmp	r1, #0
	bne	.L337
	ldr	r1, [r3, #60]
	cmp	r1, #0
	ble	.L337
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r3, #60]
	bne	.L337
	cmp	r2, #2
	bls	.L339
	ldr	r2, .L353+4
	ldr	r2, [r2, #320]
	cmp	r2, #3
	movgt	r2, r1
	addgt	r3, r3, #80
	bgt	.L342
	mov	r0, #5
	stm	sp, {r1, r3}
	bl	spawnEnemyAtCollisionColor2.part.0
	ldm	sp, {r2, r3}
	add	r3, r3, #80
	b	.L342
.L339:
	ldr	r1, .L353+4
	ldr	r1, [r1, #320]
	cmp	r1, #3
	bgt	.L337
	ldr	r1, .L353+8
	ldr	r0, [r1, r2, lsl #2]
	str	r3, [sp, #4]
	str	r2, [sp]
	bl	spawnEnemyAtCollisionColor2.part.0
	ldm	sp, {r2, r3}
.L337:
	add	r2, r2, #1
	cmp	r2, #3
	beq	.L327
	add	r3, r3, #80
	b	.L342
.L350:
	mvn	r2, #0
	ldr	r3, .L353+4
.L335:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bne	.L330
.L352:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	bne	.L330
	ldr	r0, [r3, #60]
	cmp	r0, #0
	sub	r1, r0, #1
	ble	.L330
	cmp	r1, #0
	str	r1, [r3, #60]
	bne	.L330
	cmp	r2, #2
	str	r3, [sp, #4]
	bls	.L332
	mov	r0, #5
	str	r1, [sp]
	bl	spawnEnemyAtCollisionColor
	ldm	sp, {r2, r3}
	ldr	r1, [r3, #104]
	cmp	r1, #0
	add	r3, r3, #80
	beq	.L352
.L330:
	add	r2, r2, #1
	cmp	r2, #3
	beq	.L327
	add	r3, r3, #80
	b	.L335
.L332:
	ldr	r1, .L353+12
	add	r0, r1, #12
	ldr	r0, [r0, r2, lsl #2]
	ldr	r1, [r1, r2, lsl #2]
	str	r2, [sp]
	bl	spawnEnemyAtCollisionColor
	ldm	sp, {r2, r3}
	b	.L330
.L354:
	.align	2
.L353:
	.word	currentLevel
	.word	.LANCHOR1
	.word	.LANCHOR0+152
	.word	.LANCHOR0+128
	.size	updateEnemySpawn, .-updateEnemySpawn
	.align	2
	.global	updateEnemyCollisionMovement
	.syntax unified
	.arm
	.type	updateEnemyCollisionMovement, %function
updateEnemyCollisionMovement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L403
	ldr	r3, [r3]
	cmp	r3, #1
	ldr	r3, [r0, #64]
	beq	.L396
.L356:
	cmp	r3, #0
	bxne	lr
	ldr	r3, [r0, #60]
	cmp	r3, #0
	bxle	lr
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #60]
	moveq	r3, #1
	streq	r3, [r0, #64]
	bx	lr
.L396:
	cmp	r3, #1
	bne	.L356
	str	lr, [sp, #-4]!
	ldr	r2, [r0, #68]
	ldr	r1, .L403+4
	sub	r2, r2, #2
	mov	r3, r0
	sub	sp, sp, #12
	cmp	r2, #3
	bhi	.L355
	ldrb	r2, [r1, r2]
	add	pc, pc, r2, lsl #2
.Lrtx359:
	nop
	.section	.rodata
.L359:
	.byte	(.L362-.Lrtx359-4)/4
	.byte	(.L361-.Lrtx359-4)/4
	.byte	(.L360-.Lrtx359-4)/4
	.byte	(.L358-.Lrtx359-4)/4
	.text
	.p2align 2
.L361:
	ldr	r2, [r0, #20]
	cmp	r2, #1
	ldr	r1, [r0, #28]
	beq	.L397
	ldr	r2, [r0, #4]
	sub	r2, r2, r1
	cmp	r2, #0
	movle	r2, #0
	movle	ip, #5
	movle	r0, #60
	movle	r1, #1
	strgt	r2, [r0, #4]
	strle	r2, [r3, #4]
	strle	r2, [r3, #64]
	strle	ip, [r3, #68]
	strle	r0, [r3, #60]
	strle	r1, [r3, #20]
.L355:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L358:
	ldr	r1, [r0, #20]
	cmp	r1, #1
	ldr	r2, [r0, #28]
	beq	.L398
	ldr	r0, [r0, #4]
	ldr	r1, [r3, #12]
	add	r2, r2, r0
	rsb	r1, r1, #256
	cmp	r2, r1
	str	r2, [r3, #4]
	blt	.L355
	mov	lr, #0
	mov	ip, #3
	mov	r0, #60
	mov	r2, #1
	str	r1, [r3, #4]
	str	lr, [r3, #64]
	str	ip, [r3, #68]
	str	r0, [r3, #60]
	str	r2, [r3, #20]
	b	.L355
.L360:
	ldr	r2, [r0, #20]
	cmp	r2, #0
	ldr	r1, [r0, #28]
	bne	.L378
	ldr	r0, [r0, #48]
	ldr	r2, [r3, #4]
	cmp	r0, #0
	subeq	r2, r2, r1
	addne	r2, r2, r1
	ldr	r1, .L403+8
	str	r2, [r3, #4]
	str	r3, [sp, #4]
	str	r1, [sp]
	mov	lr, pc
	bx	r1
	add	r2, r0, r0, lsl #4
	ldr	ip, .L403+12
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	sub	r2, ip, r2
	cmp	ip, r2, ror #1
	ldm	sp, {r1, r3}
	bcc	.L381
	ldr	r2, [r3, #48]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r3, #48]
.L381:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	ble	.L399
	ldr	r0, [r3, #12]
	rsb	r0, r0, #256
	cmp	r2, r0
	movge	r2, #0
	strge	r0, [r3, #4]
	strge	r2, [r3, #48]
.L383:
	str	r3, [sp]
	mov	lr, pc
	bx	r1
	add	r2, r0, r0, lsl #4
	ldr	r1, .L403+12
	add	r2, r2, r2, lsl #8
	ldr	ip, .L403+16
	add	r2, r2, r2, lsl #16
	sub	r1, r1, r2
	cmp	ip, r1, ror #2
	bcc	.L355
	mov	r1, #1
	mov	r2, #0
	ldr	r3, [sp]
	str	r1, [r3, #20]
	str	r2, [r3, #48]
	b	.L355
.L362:
	ldr	r1, [r0, #20]
	cmp	r1, #0
	ldr	r2, [r0, #28]
	bne	.L385
	ldr	r0, [r0, #48]
	ldr	r1, [r3, #4]
	cmp	r0, #0
	subeq	r2, r1, r2
	addne	r2, r1, r2
	ldr	r1, .L403+8
	str	r2, [r3, #4]
	str	r3, [sp, #4]
	str	r1, [sp]
	mov	lr, pc
	bx	r1
	add	r2, r0, r0, lsl #4
	ldr	ip, .L403+12
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	sub	r2, ip, r2
	cmp	ip, r2, ror #1
	ldm	sp, {r1, r3}
	bcc	.L388
	ldr	r2, [r3, #48]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r3, #48]
.L388:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	ble	.L400
	ldr	r0, [r3, #12]
	rsb	r0, r0, #256
	cmp	r2, r0
	movge	r2, #0
	strge	r0, [r3, #4]
	strge	r2, [r3, #48]
.L390:
	str	r3, [sp]
	mov	lr, pc
	bx	r1
	add	r2, r0, r0, lsl #4
	ldr	r1, .L403+12
	add	r2, r2, r2, lsl #8
	ldr	ip, .L403+16
	add	r2, r2, r2, lsl #16
	sub	r1, r1, r2
	cmp	ip, r1, ror #2
	movcs	r2, #1
	ldrcs	r3, [sp]
	strcs	r2, [r3, #20]
	strcs	r2, [r3, #48]
	b	.L355
.L385:
	ldr	r0, [r0]
	ldr	r1, [r3, #8]
	add	r2, r2, r0
	rsb	r1, r1, #256
	cmp	r2, r1
	str	r2, [r3]
	blt	.L355
	mov	r2, #0
	mov	ip, #4
	mov	r0, #60
	str	r1, [r3]
	str	r2, [r3, #64]
	str	ip, [r3, #68]
	str	r0, [r3, #60]
	str	r2, [r3, #20]
	b	.L355
.L378:
	ldr	r2, [r0]
	sub	r2, r2, r1
	cmp	r2, #0
	movle	r2, #0
	movle	r0, #2
	movle	r1, #60
	strgt	r2, [r0]
	strle	r2, [r3]
	strle	r2, [r3, #64]
	strle	r0, [r3, #68]
	strle	r1, [r3, #60]
	strle	r2, [r3, #20]
	b	.L355
.L398:
	ldr	r0, [r0, #48]
	ldr	r1, [r3]
	cmp	r0, #0
	subeq	r2, r1, r2
	addne	r2, r1, r2
	ldr	r1, .L403+8
	str	r2, [r3]
	str	r3, [sp, #4]
	str	r1, [sp]
	mov	lr, pc
	bx	r1
	ldr	ip, .L403+20
	smull	r2, ip, r0, ip
	asr	r2, r0, #31
	rsb	r2, r2, ip, asr #4
	add	r2, r2, r2, lsl #2
	cmp	r0, r2, lsl #3
	ldm	sp, {r1, r3}
	bne	.L366
	ldr	r2, [r3, #48]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r3, #48]
.L366:
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L401
	ldr	r2, [r3, #8]
	rsb	r2, r2, #256
	cmp	r0, r2
	movge	r0, #0
	strge	r2, [r3]
	strge	r0, [r3, #48]
.L368:
	str	r3, [sp]
	mov	lr, pc
	bx	r1
	ldr	r2, .L403+24
	mul	r2, r0, r2
	ldr	r1, .L403+28
	add	r2, r2, #47710208
	add	r2, r2, #11648
	cmp	r1, r2, ror #2
	bcc	.L355
	mov	r1, #0
	mov	r2, #1
	ldr	r3, [sp]
	str	r1, [r3, #20]
	str	r2, [r3, #48]
	b	.L355
.L397:
	ldr	r0, [r0, #48]
	ldr	r2, [r3]
	cmp	r0, #0
	subeq	r2, r2, r1
	addne	r2, r2, r1
	ldr	r1, .L403+8
	str	r2, [r3]
	str	r3, [sp, #4]
	str	r1, [sp]
	mov	lr, pc
	bx	r1
	add	r2, r0, r0, lsl #4
	ldr	ip, .L403+12
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	sub	r2, ip, r2
	cmp	ip, r2, ror #1
	ldm	sp, {r1, r3}
	bcc	.L374
	ldr	r2, [r3, #48]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r3, #48]
.L374:
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L402
	ldr	r2, [r3, #8]
	rsb	r2, r2, #256
	cmp	r0, r2
	movge	r0, #0
	strge	r2, [r3]
	strge	r0, [r3, #48]
.L376:
	str	r3, [sp]
	mov	lr, pc
	bx	r1
	add	r2, r0, r0, lsl #4
	ldr	r1, .L403+12
	add	r2, r2, r2, lsl #8
	ldr	ip, .L403+16
	add	r2, r2, r2, lsl #16
	sub	r1, r1, r2
	cmp	ip, r1, ror #2
	movcs	r2, #0
	ldrcs	r3, [sp]
	strcs	r2, [r3, #20]
	strcs	r2, [r3, #48]
	b	.L355
.L400:
	mov	r0, #0
	mov	r2, #1
	str	r0, [r3, #4]
	str	r2, [r3, #48]
	b	.L390
.L399:
	mov	r0, #0
	mov	r2, #1
	str	r0, [r3, #4]
	str	r2, [r3, #48]
	b	.L383
.L402:
	mov	r0, #0
	mov	r2, #1
	str	r0, [r3]
	str	r2, [r3, #48]
	b	.L376
.L401:
	mov	r0, #0
	mov	r2, #1
	str	r0, [r3]
	str	r2, [r3, #48]
	b	.L368
.L404:
	.align	2
.L403:
	.word	currentLevel
	.word	.L359
	.word	rand
	.word	143165576
	.word	71582788
	.word	1717986919
	.word	-1527099483
	.word	23860928
	.size	updateEnemyCollisionMovement, .-updateEnemyCollisionMovement
	.align	2
	.global	updateEnemyCollisionMovement2
	.syntax unified
	.arm
	.type	updateEnemyCollisionMovement2, %function
updateEnemyCollisionMovement2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L407
	ldr	r2, .L407+4
	ldr	r3, [r3]
	ldr	r2, [r2]
	orrs	r3, r3, r2
	beq	updateEnemyCollisionMovement2.part.0
.L406:
	mov	r3, #0
	str	r3, [r0, #28]
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	str	r3, [r0, #40]
	bx	lr
.L408:
	.align	2
.L407:
	.word	automaticMovementActive
	.word	automaticMovementActive2
	.size	updateEnemyCollisionMovement2, .-updateEnemyCollisionMovement2
	.section	.rodata.str1.4
	.align	2
.LC48:
	.ascii	"Enemy %d (COLLISION_1) -> %d: Respawned (off-screen"
	.ascii	")\000"
	.text
	.align	2
	.global	checkAndRespawnOffscreenEnemy
	.syntax unified
	.arm
	.type	checkAndRespawnOffscreenEnemy, %function
checkAndRespawnOffscreenEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, .L419
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	ldr	r3, [r0, #68]
	cmp	r3, #1
	bxne	lr
	mvn	r3, #19
	ldr	ip, [r0, #8]
	ldr	r2, [r0]
	sub	r3, r3, ip
	cmp	r2, r3
	bxgt	lr
	push	{r4, lr}
	ldr	r2, .L419+4
	sub	sp, sp, #8
	mov	r4, r1
	str	r0, [sp, #4]
	mov	lr, pc
	bx	r2
	mov	ip, #0
	ldr	r1, .L419+8
	ldr	r2, [r1, #320]
	ldr	r3, [sp, #4]
	sub	r2, r2, #1
	str	r2, [r1, #320]
	cmp	r2, #3
	and	r2, r0, #1
	str	ip, [r3, #16]
	add	r2, r2, #11
	bgt	.L411
	mov	r0, r2
	str	r2, [sp, #4]
	bl	spawnEnemyAtCollisionColor2.part.0
	ldr	r2, [sp, #4]
.L411:
	mov	r1, r4
	ldr	r0, .L419+12
	ldr	r3, .L419+16
	mov	lr, pc
	bx	r3
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L420:
	.align	2
.L419:
	.word	currentLevel
	.word	rand
	.word	.LANCHOR1
	.word	.LC48
	.word	mgba_printf
	.size	checkAndRespawnOffscreenEnemy, .-checkAndRespawnOffscreenEnemy
	.section	.rodata.str1.4
	.align	2
.LC49:
	.ascii	"Enemies using EM camera: (%d,%d)\000"
	.align	2
.LC50:
	.ascii	"Enemy %d: world(%d,%d) -> screen(%d,%d) with camera"
	.ascii	"(%d,%d)\000"
	.text
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L451
	ldr	r2, .L451+4
	ldr	r3, .L451+8
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	r3, [r3]
	sub	sp, sp, #28
	orr	r3, r2, r3
	cmp	r1, #0
	str	r3, [sp, #16]
	beq	.L422
	ldr	r3, .L451+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L446
.L422:
	ldr	r3, .L451+16
	ldr	r9, [r3, #8]
	ldr	r8, [r3, #12]
	sub	r9, r9, #88
	bic	r9, r9, r9, asr #31
	sub	r8, r8, #48
	cmp	r9, #16
	bic	r8, r8, r8, asr #31
	movge	r9, #16
	cmp	r8, #96
	movge	r8, #96
.L423:
	mov	r10, #0
	ldr	r4, .L451+20
	ldr	fp, .L451+24
.L431:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L447
	ldr	r3, .L451+28
	umull	r2, r3, r10, r3
	ldr	r2, [sp, #16]
	bic	r5, r3, #1
	add	r5, r5, r3, lsr #1
	sub	r5, r10, r5
	cmp	r2, #0
	add	r5, r5, #3
	bne	.L432
	ldr	r3, [r4, #68]
	cmp	r3, #1
	beq	.L435
	ldr	r3, [r4, #64]
	cmp	r3, #0
	bne	.L448
.L435:
	mov	r3, #304
	str	r3, [sp, #20]
.L426:
	str	r8, [sp, #12]
	str	r9, [sp, #8]
	ldm	r4, {r2, r3}
	sub	r6, r2, r9
	sub	r7, r3, r8
	mov	r1, r10
	str	r6, [sp]
	str	r7, [sp, #4]
	ldr	r0, .L451+32
	ldr	ip, .L451+36
	mov	lr, pc
	bx	ip
	add	r3, r6, #32
	cmp	r3, #272
	ldr	r2, [r4, #56]
	bhi	.L428
	add	r3, r7, #32
	cmp	r3, #192
	bhi	.L428
	ldr	r3, [sp, #20]
	ldr	r1, [sp, #16]
	orr	r3, r3, r5, lsl #12
	orr	r3, r3, #1024
	lsl	r0, r2, #3
	and	r7, r7, #255
	lsl	r6, r6, #23
	lsl	r3, r3, #16
	cmp	r1, #0
	strh	r7, [fp, r0]	@ movhi
	lsr	r6, r6, #23
	lsr	r3, r3, #16
	add	r2, fp, r2, lsl #3
	bne	.L430
	ldr	ip, [r4, #20]
	cmp	ip, #1
	beq	.L449
.L430:
	mvn	r6, r6, lsl #17
	mvn	r6, r6, lsr #17
	add	r0, fp, r0
	strh	r3, [r0, #4]	@ movhi
	strh	r6, [r0, #2]	@ movhi
.L425:
	add	r10, r10, #1
	cmp	r10, #4
	add	r4, r4, #80
	bne	.L431
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L428:
	mov	r3, #512
	lsl	r2, r2, #3
	strh	r3, [fp, r2]	@ movhi
	b	.L425
.L432:
	mov	r3, #304
	mov	r5, #2
	str	r3, [sp, #20]
	b	.L426
.L447:
	mov	r2, #512
	ldr	r3, [r4, #56]
	lsl	r3, r3, #3
	strh	r2, [fp, r3]	@ movhi
	b	.L425
.L448:
	ldr	r3, [r4, #20]
	cmp	r3, #1
	ldr	r3, [r4, #40]
	beq	.L450
	cmp	r3, #0
	moveq	r3, #304
	movne	r3, #316
	str	r3, [sp, #20]
	b	.L426
.L449:
	ldr	ip, [r4, #48]
	cmp	ip, #0
	bne	.L430
	orr	r6, r6, #36864
	strh	r3, [r2, #4]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	b	.L425
.L446:
	ldr	r2, .L451+40
	ldr	r3, .L451+44
	ldr	r9, [r2]
	ldr	r8, [r3]
	mov	r1, r9
	mov	r2, r8
	ldr	r0, .L451+48
	ldr	r3, .L451+36
	mov	lr, pc
	bx	r3
	b	.L423
.L450:
	cmp	r3, #0
	beq	.L435
	cmp	r3, #1
	movne	r3, #312
	moveq	r3, #308
	str	r3, [sp, #20]
	b	.L426
.L452:
	.align	2
.L451:
	.word	emCameraActive
	.word	automaticMovementActive
	.word	automaticMovementActive2
	.word	emPatternActive2
	.word	player
	.word	.LANCHOR1
	.word	shadowOAM
	.word	-1431655765
	.word	.LC50
	.word	mgba_printf
	.word	worldCameraX
	.word	worldCameraY
	.word	.LC49
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	checkCollision
	.syntax unified
	.arm
	.type	checkCollision, %function
checkCollision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	cmp	ip, r0
	ble	.L457
	add	r0, r0, r2
	cmp	r0, lr
	bgt	.L459
.L457:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L459:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	cmp	r2, r1
	ble	.L457
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	checkCollision, .-checkCollision
	.align	2
	.global	killEnemy
	.syntax unified
	.arm
	.type	killEnemy, %function
killEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #3
	bxhi	lr
	ldr	r2, .L469
	add	r3, r0, r0, lsl #2
	add	r3, r2, r3, lsl #4
	ldr	r1, [r3, #16]
	cmp	r1, #0
	bxeq	lr
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	mov	r1, r0
	str	r3, [sp, #4]
	ldr	r0, .L469+4
	ldr	r3, .L469+8
	mov	lr, pc
	bx	r3
	mov	ip, #0
	mov	r0, #1
	ldr	r2, .L469
	ldr	r1, [r2, #320]
	ldr	r3, [sp, #4]
	sub	r1, r1, #1
	str	ip, [r3, #16]
	str	r0, [r3, #24]
	str	r1, [r2, #320]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L470:
	.align	2
.L469:
	.word	.LANCHOR1
	.word	.LC5
	.word	mgba_printf
	.size	killEnemy, .-killEnemy
	.section	.rodata.str1.4
	.align	2
.LC51:
	.ascii	"Checking RIGHT TRIANGLE kills for level %d...\000"
	.align	2
.LC52:
	.ascii	"Right triangle: Player killed BOSS in level %d!\000"
	.align	2
.LC53:
	.ascii	"Right triangle: Player killed enemy %d in level %d!"
	.ascii	"\000"
	.text
	.align	2
	.global	checkRightTriangleKills
	.syntax unified
	.arm
	.type	checkRightTriangleKills, %function
checkRightTriangleKills:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L506
	ldr	r1, [r4]
	cmp	r1, #1
	sub	sp, sp, #12
	beq	.L504
	cmp	r1, #2
	bne	.L471
	ldr	r3, .L506+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L471
	ldr	r3, .L506+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L471
	ldr	r3, .L506+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L471
.L476:
	ldr	r3, .L506+16
	mov	r5, r0
	ldr	r0, .L506+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L506+24
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L477
	ldr	r1, [r4]
	cmp	r1, #1
	beq	.L505
	cmp	r1, #2
	bne	.L477
	ldr	r2, [r3, #80]
	cmp	r2, #2
	bne	.L477
.L479:
	ldr	ip, [r3]
	ldr	r2, [r3, #8]
	ldr	r0, [r5, #8]
	add	r2, ip, r2
	cmp	r0, r2
	bge	.L477
	ldr	r2, [r5, #24]
	add	r0, r0, r2
	cmp	ip, r0
	bge	.L477
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	r0, [r5, #12]
	add	r2, ip, r2
	cmp	r0, r2
	bge	.L477
	ldr	r2, [r5, #28]
	add	r0, r0, r2
	cmp	ip, r0
	bge	.L477
	ldr	r0, .L506+28
	ldr	r2, .L506+16
	mov	lr, pc
	bx	r2
	mov	r1, #0
	ldr	r0, .L506+24
	ldr	r2, .L506+32
	str	r1, [r0, #16]
	mov	lr, pc
	bx	r2
.L477:
	mov	r1, #0
	ldr	r3, .L506+36
.L483:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L481
	ldr	ip, [r3]
	ldr	r2, [r3, #8]
	ldr	r0, [r5, #8]
	add	r2, ip, r2
	cmp	r0, r2
	bge	.L481
	ldr	r2, [r5, #24]
	add	r0, r0, r2
	cmp	ip, r0
	bge	.L481
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	r0, [r5, #12]
	add	r2, ip, r2
	cmp	r0, r2
	bge	.L481
	ldr	r2, [r5, #28]
	add	r0, r0, r2
	cmp	ip, r0
	bge	.L481
	str	r3, [sp, #4]
	ldr	r2, [r4]
	ldr	r3, .L506+16
	ldr	r0, .L506+40
	str	r1, [sp]
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldr	r1, [sp]
	beq	.L481
	ldr	r3, .L506+16
	ldr	r0, .L506+44
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, [sp, #4]
	str	r2, [r3, #16]
	mov	r2, #1
	ldr	r1, .L506+36
	str	r2, [r3, #24]
	ldr	r2, [r1, #320]
	sub	r2, r2, #1
	str	r2, [r1, #320]
	ldr	r1, [sp]
.L481:
	add	r1, r1, #1
	cmp	r1, #4
	add	r3, r3, #80
	bne	.L483
.L471:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L504:
	ldr	r3, .L506+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L471
	ldr	r3, .L506+52
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L471
	ldr	r3, .L506+56
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L476
	b	.L471
.L505:
	ldr	r2, [r3, #80]
	cmp	r2, #1
	bne	.L477
	b	.L479
.L507:
	.align	2
.L506:
	.word	currentLevel
	.word	automaticMovementActive2
	.word	rightTrianglePatternActive2
	.word	showAccessory2
	.word	mgba_printf
	.word	.LC51
	.word	boss
	.word	.LC52
	.word	resetBossBullets
	.word	.LANCHOR1
	.word	.LC53
	.word	.LC5
	.word	automaticMovementActive
	.word	rightTrianglePatternActive
	.word	showAccessory
	.size	checkRightTriangleKills, .-checkRightTriangleKills
	.align	2
	.global	checkSquarePatternKills
	.syntax unified
	.arm
	.type	checkSquarePatternKills, %function
checkSquarePatternKills:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L516
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, .L516+4
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	b	checkSquarePatternKills.part.0
.L517:
	.align	2
.L516:
	.word	automaticMovementActive
	.word	squarePatternActive
	.size	checkSquarePatternKills, .-checkSquarePatternKills
	.section	.rodata.str1.4
	.align	2
.LC54:
	.ascii	"=== ISOSCELES KILL CHECK Level %d ===\000"
	.align	2
.LC55:
	.ascii	"SKIP: Not in automatic movement\000"
	.align	2
.LC56:
	.ascii	"L1: active=%d, show=%d, pattern=%d\000"
	.align	2
.LC57:
	.ascii	"L2: active2=%d, show2=%d, pattern=%d\000"
	.align	2
.LC58:
	.ascii	"SKIP: Conditions not met\000"
	.align	2
.LC59:
	.ascii	"Sprite 632 at: (%d,%d)\000"
	.align	2
.LC60:
	.ascii	"Checking boss at (%d,%d) against sprite at (%d,%d)\000"
	.align	2
.LC61:
	.ascii	"*** HIT! BOSS killed by isosceles sprite!\000"
	.align	2
.LC62:
	.ascii	"Checking enemy %d at (%d,%d)\000"
	.align	2
.LC63:
	.ascii	"*** HIT! Enemy %d killed by isosceles sprite!\000"
	.align	2
.LC64:
	.ascii	"Total kills: %d\000"
	.text
	.align	2
	.global	checkIsoscelesPatternKills
	.syntax unified
	.arm
	.type	checkIsoscelesPatternKills, %function
checkIsoscelesPatternKills:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L553
	ldr	r0, .L553+4
	ldr	r1, [r6]
	ldr	r5, .L553+8
	sub	sp, sp, #20
	mov	lr, pc
	bx	r5
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L550
	cmp	r3, #2
	bne	.L521
	ldr	r3, .L553+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L521
	ldr	r2, .L553+16
	ldr	r3, .L553+20
	ldr	r4, [r2]
	ldr	r2, [r3]
	ldr	r3, .L553+24
	ldr	r7, .L553+28
	ldr	r3, [r3]
	mov	r1, r4
	ldr	r0, .L553+32
	str	r2, [sp, #12]
	ldr	r9, [r7]
	mov	lr, pc
	bx	r5
	ldr	r3, [r7]
	cmp	r3, #0
	ldr	r2, [sp, #12]
	ble	.L538
	ldr	r1, .L553+36
	sub	r3, r3, #1
	ldr	r1, [r1, r3, lsl #2]
	mov	r8, r1
	ldr	r1, .L553+40
	ldr	r3, [r1, r3, lsl #2]
	mov	r7, r3
.L524:
	cmp	r9, #0
	cmpne	r4, #0
	moveq	r4, #1
	movne	r4, #0
	cmp	r2, #0
	orreq	r4, r4, #1
	cmp	r4, #0
	beq	.L525
	ldr	r0, .L553+44
	mov	lr, pc
	bx	r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L550:
	ldr	r3, .L553+48
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L520
.L521:
	ldr	r0, .L553+52
	mov	lr, pc
	bx	r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L538:
	mov	r7, #0
	mov	r8, #0
	b	.L524
.L525:
	ldr	r4, .L553+56
	mov	r2, r7
	mov	r1, r8
	ldr	r0, .L553+60
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L526
.L530:
	mov	r9, #0
.L527:
	mov	r6, #0
	ldr	r4, .L553+64
.L536:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L533
	ldr	r3, [r4, #4]
	ldr	r2, [r4]
	mov	r1, r6
	ldr	r0, .L553+68
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	add	r3, r2, r3
	cmp	r8, r3
	bge	.L533
	add	r3, r8, #64
	cmp	r2, r3
	bge	.L533
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	add	r3, r2, r3
	cmp	r7, r3
	bge	.L533
	add	r3, r7, #64
	cmp	r2, r3
	ldr	r0, .L553+72
	bge	.L533
	mov	r1, r6
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L551
.L535:
	add	r9, r9, #1
.L533:
	add	r6, r6, #1
	cmp	r6, #4
	add	r4, r4, #80
	bne	.L536
	mov	r1, r9
	ldr	r0, .L553+76
	mov	lr, pc
	bx	r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L520:
	ldr	r2, .L553+80
	ldr	r3, .L553+84
	ldr	r7, .L553+24
	ldr	r4, [r2]
	ldr	r2, [r3]
	ldr	r3, [r7]
	mov	r1, r4
	ldr	r0, .L553+88
	mov	r9, r3
	str	r2, [sp, #12]
	mov	lr, pc
	bx	r5
	ldr	r3, [r7]
	cmp	r3, #0
	ldr	r2, [sp, #12]
	ble	.L538
	ldr	r1, .L553+92
	sub	r3, r3, #1
	ldr	r1, [r1, r3, lsl #2]
	mov	r8, r1
	ldr	r1, .L553+96
	ldr	r3, [r1, r3, lsl #2]
	mov	r7, r3
	b	.L524
.L526:
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L552
	cmp	r3, #2
	bne	.L530
	ldr	r3, [r4, #80]
	cmp	r3, #2
	bne	.L530
.L529:
	str	r7, [sp]
	mov	r3, r8
	ldm	r4, {r1, r2}
	ldr	r0, .L553+100
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	add	r3, r2, r3
	cmp	r8, r3
	bge	.L530
	add	r3, r8, #64
	cmp	r2, r3
	bge	.L530
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	add	r3, r2, r3
	cmp	r7, r3
	bge	.L530
	add	r3, r7, #64
	cmp	r2, r3
	bge	.L530
	ldr	r0, .L553+104
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r0, .L553+56
	ldr	r3, .L553+108
	str	r2, [r4, #16]
	mov	r9, #1
	mov	lr, pc
	bx	r3
	b	.L527
.L552:
	ldr	r3, [r4, #80]
	cmp	r3, #1
	bne	.L530
	b	.L529
.L551:
	mov	r1, r6
	ldr	r0, .L553+112
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #16]
	mov	r3, #1
	ldr	r2, .L553+64
	str	r3, [r4, #24]
	ldr	r3, [r2, #320]
	sub	r3, r3, #1
	str	r3, [r2, #320]
	b	.L535
.L554:
	.align	2
.L553:
	.word	currentLevel
	.word	.LC54
	.word	mgba_printf
	.word	automaticMovementActive2
	.word	isoscelesTrianglePatternActive2
	.word	showPatternSprite2
	.word	patternCompleted
	.word	patternCompleted2
	.word	.LC57
	.word	patternSpritePosX2
	.word	patternSpritePosY2
	.word	.LC58
	.word	automaticMovementActive
	.word	.LC55
	.word	boss
	.word	.LC59
	.word	.LANCHOR1
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	isoscelesTrianglePatternActive
	.word	showPatternSprite
	.word	.LC56
	.word	patternSpritePosX
	.word	patternSpritePosY
	.word	.LC60
	.word	.LC61
	.word	resetBossBullets
	.word	.LC5
	.size	checkIsoscelesPatternKills, .-checkIsoscelesPatternKills
	.section	.rodata.str1.4
	.align	2
.LC65:
	.ascii	"AUTOMATIC MOVEMENT ACTIVE: Enemy %d FROZEN at (%d,%"
	.ascii	"d)\000"
	.align	2
.LC66:
	.ascii	"NORMAL: COLLISION_1 enemy %d scrolling: x=%d\000"
	.align	2
.LC67:
	.ascii	"SCREEN EDGE RESPAWN: Enemy %d (COLLISION_1) -> %d\000"
	.text
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L635
	ldr	r7, .L635+4
	ldr	r6, [r8]
	ldr	r3, [r7]
	sub	sp, sp, #12
	orr	r6, r6, r3
	mov	fp, r0
	bl	checkRightTriangleKills
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L556
	ldr	r3, .L635+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L626
.L556:
	bl	checkIsoscelesPatternKills
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L557
	ldr	r3, .L635+12
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L627
.L557:
	ldr	r10, .L635+16
	mvn	r5, #0
	mov	r4, r10
	ldr	r9, .L635+12
.L577:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	mov	r2, r5
	add	r5, r5, #1
	bne	.L559
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L628
	cmp	r6, #0
	bne	.L565
	ldr	r3, [r9]
	cmp	r3, #2
	beq	.L629
	cmp	r3, #1
	beq	.L581
.L575:
	ldr	r3, [r4, #44]
	add	r3, r3, #1
	cmp	r3, #9
	str	r3, [r4, #44]
	ble	.L559
	mov	r3, #0
	ldr	r2, [r4, #40]
	str	r3, [r4, #44]
	ldr	r3, .L635+20
	add	r2, r2, #1
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r2, r2, r3
	str	r2, [r4, #40]
.L559:
	cmp	r5, #3
	add	r4, r4, #80
	bne	.L577
	mov	r0, fp
	bl	checkRightTriangleKills
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L579
	ldr	r3, .L635+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L630
.L579:
	bl	checkIsoscelesPatternKills
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L555
	ldr	r3, .L635+12
	ldr	r3, [r3]
	cmp	r3, #2
	bne	.L555
	ldr	r3, .L635+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L555
	ldr	r3, .L635+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L631
.L555:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L628:
	ldr	r1, [r4, #60]
	cmp	r1, #0
	ble	.L559
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r4, #60]
	bne	.L559
	ldr	r3, .L635+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L632
	cmp	r3, #2
	bne	.L559
	cmp	r2, #2
	ldrls	r3, .L635+32
	ldrls	r0, [r3, r2, lsl #2]
	ldr	r3, [r10, #320]
	movhi	r0, #5
	cmp	r3, #3
	bgt	.L559
	bl	spawnEnemyAtCollisionColor2.part.0
	b	.L559
.L627:
	ldr	r3, .L635+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L557
	ldr	r3, .L635+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L557
	bl	checkEMPatternKills.part.0
	b	.L557
.L630:
	bl	checkSquarePatternKills.part.0
	b	.L579
.L626:
	bl	checkSquarePatternKills.part.0
	b	.L556
.L629:
	ldr	r3, [r4, #68]
	cmp	r3, #1
	beq	.L569
.L576:
	ldr	r3, [r8]
	ldr	r2, [r7]
	orrs	r3, r3, r2
	bne	.L633
	mov	r0, r4
	bl	updateEnemyCollisionMovement2.part.0
	b	.L575
.L565:
	ldr	ip, .L635+36
	ldm	r4, {r2, r3}
	mov	r1, r5
	ldr	r0, .L635+40
	str	ip, [sp]
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #44]
	add	r3, r3, #1
	cmp	r3, #9
	str	r3, [r4, #44]
	ble	.L568
	mov	r2, #0
	mov	r3, #0
	str	r2, [r4, #40]
	str	r3, [r4, #44]
.L568:
	ldm	r4, {r2, r3}
	mov	r1, r5
	ldr	r0, .L635+40
	ldr	ip, [sp]
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #44]
	add	r3, r3, #1
	cmp	r3, #9
	str	r3, [r4, #44]
	ble	.L559
	mov	r2, #0
	mov	r3, #0
	str	r2, [r4, #40]
	str	r3, [r4, #44]
	b	.L559
.L581:
	mov	r0, r4
	bl	updateEnemyCollisionMovement
	b	.L575
.L631:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	checkEMPatternKills.part.0
.L632:
	cmp	r2, #2
	ldrls	r3, .L635+44
	ldrls	r0, [r3, r2, lsl #2]
	ldrls	r3, .L635+48
	movhi	r0, #5
	ldrls	r1, [r3, r2, lsl #2]
	bl	spawnEnemyAtCollisionColor
	b	.L559
.L633:
	mov	r3, #0
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	b	.L575
.L569:
	ldr	r3, .L635+36
	mov	r1, r5
	ldr	r2, [r4]
	ldr	r0, .L635+52
	str	r3, [sp]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L634
	ldr	r3, [r9]
	cmp	r3, #1
	beq	.L581
	cmp	r3, #2
	bne	.L575
	b	.L576
.L634:
	ldr	r3, .L635+56
	mov	lr, pc
	bx	r3
	ldr	r3, [r10, #320]
	sub	r3, r3, #1
	and	r2, r0, #1
	cmp	r3, #3
	str	r6, [r4, #16]
	str	r3, [r10, #320]
	add	r2, r2, #11
	bgt	.L573
	mov	r0, r2
	str	r2, [sp, #4]
	bl	spawnEnemyAtCollisionColor2.part.0
	ldr	r2, [sp, #4]
.L573:
	mov	r1, r5
	ldr	r0, .L635+60
	ldr	r3, [sp]
	mov	lr, pc
	bx	r3
	b	.L559
.L636:
	.align	2
.L635:
	.word	automaticMovementActive
	.word	automaticMovementActive2
	.word	squarePatternActive
	.word	currentLevel
	.word	.LANCHOR1
	.word	1431655766
	.word	emPatternActive2
	.word	showEmPatternSprite2
	.word	CSWTCH.140
	.word	mgba_printf
	.word	.LC65
	.word	CSWTCH.138
	.word	CSWTCH.139
	.word	.LC66
	.word	rand
	.word	.LC67
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	checkEMPatternKills
	.syntax unified
	.arm
	.type	checkEMPatternKills, %function
checkEMPatternKills:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L648
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, .L648+4
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	ldr	r3, .L648+8
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, .L648+12
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	b	checkEMPatternKills.part.0
.L649:
	.align	2
.L648:
	.word	automaticMovementActive2
	.word	currentLevel
	.word	emPatternActive2
	.word	showEmPatternSprite2
	.size	checkEMPatternKills, .-checkEMPatternKills
	.align	2
	.global	resetEnemies
	.syntax unified
	.arm
	.type	resetEnemies, %function
resetEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	ldr	r5, .L657
	mov	r1, #30
	mov	r3, r5
	mov	r2, #0
	mov	r4, #1
	mov	fp, #0
	mov	ip, #0
	ldr	r0, .L657+4
	ldr	lr, [r0]
.L653:
	cmp	lr, #1
	lsleq	r0, r1, #1
	beq	.L652
	cmp	lr, #2
	moveq	r0, r1
	movne	r0, #0
.L652:
	add	r1, r1, #30
	cmp	r1, #150
	stm	r3, {fp-ip}
	str	fp, [r3, #40]
	str	ip, [r3, #44]
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	str	r0, [r3, #60]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #20]
	str	r2, [r3, #48]
	str	r4, [r3, #28]
	str	r2, [r3, #72]
	add	r3, r3, #80
	bne	.L653
	str	r2, [r5, #320]
	str	r2, [r5, #376]
	pop	{r4, r5, fp, lr}
	bx	lr
.L658:
	.align	2
.L657:
	.word	.LANCHOR1
	.word	currentLevel
	.size	resetEnemies, .-resetEnemies
	.section	.rodata.str1.4
	.align	2
.LC68:
	.ascii	"Level 1: Enemy %d still alive (active=%d, spawnTime"
	.ascii	"r=%d)\000"
	.align	2
.LC69:
	.ascii	"Level 1: ALL enemies killed!\000"
	.align	2
.LC70:
	.ascii	"Level 2: Enemy %d ACTIVE at (%d,%d)\000"
	.align	2
.LC71:
	.ascii	"Level 2: Enemy %d waiting to spawn (timer=%d)\000"
	.align	2
.LC72:
	.ascii	"Level 2: Boss is ACTIVE\000"
	.align	2
.LC73:
	.ascii	"Level 2: Total enemies tracked: %d, Active enemies:"
	.ascii	" %d\000"
	.align	2
.LC74:
	.ascii	"Level 2: ALL enemies and boss killed!\000"
	.text
	.align	2
	.global	areAllEnemiesKilled
	.syntax unified
	.arm
	.type	areAllEnemiesKilled, %function
areAllEnemiesKilled:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L679
	ldr	r3, [r3]
	cmp	r3, #1
	sub	sp, sp, #8
	beq	.L676
	cmp	r3, #2
	beq	.L677
.L663:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L677:
	mov	r1, #0
	mov	r6, r1
	mov	r5, r1
	ldr	r4, .L679+4
.L669:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L667
	ldr	r0, .L679+8
	ldm	r4, {r2, r3}
	ldr	ip, .L679+12
	str	r1, [sp, #4]
	mov	lr, pc
	bx	ip
	ldr	r1, [sp, #4]
	add	r5, r5, #1
	add	r6, r6, #1
.L668:
	add	r1, r1, #1
	cmp	r1, #4
	add	r4, r4, #80
	bne	.L669
	ldr	r4, .L679+16
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L678
	ldr	r3, .L679+12
	mov	r2, r6
	mov	r1, r5
	ldr	r0, .L679+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
	orrs	r3, r6, r3
	bne	.L663
	ldr	r0, .L679+24
	ldr	r3, .L679+12
	mov	lr, pc
	bx	r3
	b	.L665
.L667:
	ldr	r2, [r4, #60]
	cmp	r2, #0
	ble	.L668
	ldr	r0, .L679+28
	ldr	r3, .L679+12
	str	r1, [sp, #4]
	add	r5, r5, #1
	mov	lr, pc
	bx	r3
	ldr	r1, [sp, #4]
	b	.L668
.L676:
	mov	r1, #0
	ldr	r0, .L679+4
.L664:
	ldr	r2, [r0, #16]
	cmp	r2, #0
	ldr	r3, [r0, #60]
	bne	.L661
	cmp	r3, #0
	bgt	.L661
	add	r1, r1, #1
	cmp	r1, #4
	add	r0, r0, #80
	bne	.L664
	ldr	r0, .L679+32
	ldr	r3, .L679+12
	mov	lr, pc
	bx	r3
.L665:
	mov	r0, #1
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L678:
	ldr	r0, .L679+36
	ldr	r3, .L679+12
	mov	lr, pc
	bx	r3
	b	.L663
.L661:
	ldr	r0, .L679+40
	ldr	r4, .L679+12
	mov	lr, pc
	bx	r4
	b	.L663
.L680:
	.align	2
.L679:
	.word	currentLevel
	.word	.LANCHOR1
	.word	.LC70
	.word	mgba_printf
	.word	boss
	.word	.LC73
	.word	.LC74
	.word	.LC71
	.word	.LC69
	.word	.LC72
	.word	.LC68
	.size	areAllEnemiesKilled, .-areAllEnemiesKilled
	.section	.rodata.str1.4
	.align	2
.LC75:
	.ascii	"BG0 CORRUPTION: %d -> %d\000"
	.align	2
.LC76:
	.ascii	"BG1 CORRUPTION: %d -> %d\000"
	.align	2
.LC77:
	.ascii	"BG2 CORRUPTION: %d -> %d\000"
	.text
	.align	2
	.global	debugCollisionMapTopArea
	.syntax unified
	.arm
	.type	debugCollisionMapTopArea, %function
debugCollisionMapTopArea:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L689
	ldrh	r0, [r2, #16]
	ldr	r1, [r3, #380]
	cmp	r0, r1
	push	{r4, lr}
	beq	.L682
	ldrh	r0, [r2, #16]
	cmp	r0, #255
	bhi	.L686
.L682:
	mov	r2, #67108864
	ldr	r1, [r3, #384]
	ldrh	r0, [r2, #20]
	cmp	r0, r1
	beq	.L683
	ldrh	r0, [r2, #20]
	cmp	r0, #255
	bhi	.L687
.L683:
	mov	r2, #67108864
	ldr	r1, [r3, #388]
	ldrh	r0, [r2, #24]
	cmp	r0, r1
	beq	.L684
	ldrh	r0, [r2, #24]
	cmp	r0, #255
	bhi	.L688
.L684:
	mov	r2, #67108864
	ldrh	r0, [r2, #16]
	ldrh	r1, [r2, #20]
	ldrh	r2, [r2, #24]
	pop	{r4, lr}
	str	r0, [r3, #380]
	str	r1, [r3, #384]
	str	r2, [r3, #388]
	bx	lr
.L688:
	ldr	r3, .L689+4
	ldrh	r2, [r2, #24]
	ldr	r0, .L689+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L689
	b	.L684
.L687:
	ldr	r3, .L689+4
	ldrh	r2, [r2, #20]
	ldr	r0, .L689+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L689
	b	.L683
.L686:
	ldr	r3, .L689+4
	ldrh	r2, [r2, #16]
	ldr	r0, .L689+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L689
	b	.L682
.L690:
	.align	2
.L689:
	.word	.LANCHOR1
	.word	mgba_printf
	.word	.LC77
	.word	.LC76
	.word	.LC75
	.size	debugCollisionMapTopArea, .-debugCollisionMapTopArea
	.section	.rodata.str1.4
	.align	2
.LC78:
	.ascii	"=== EDGE COLLISION CHECK ===\000"
	.align	2
.LC79:
	.ascii	"Edge (%d,%d): expected=%d, actual=%d\000"
	.align	2
.LC80:
	.ascii	"============================\000"
	.text
	.align	2
	.global	debugEnemyPathCollisions
	.syntax unified
	.arm
	.type	debugEnemyPathCollisions, %function
debugEnemyPathCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, .L695
	sub	sp, sp, #56
	ldr	r8, .L695+4
	mov	lr, pc
	bx	r8
	ldr	lr, .L695+8
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #8
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	add	r4, sp, #8
.L692:
	ldm	r4, {r5, r6}
	mov	r1, r6
	mov	r0, r5
	ldr	r7, [r4, #8]
	bl	getCollisionType
	mov	r3, r7
	str	r0, [sp]
	mov	r2, r6
	mov	r1, r5
	ldr	r0, .L695+12
	mov	lr, pc
	bx	r8
	add	r4, r4, #12
	add	r3, sp, #56
	cmp	r4, r3
	bne	.L692
	ldr	r0, .L695+16
	mov	lr, pc
	bx	r8
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L696:
	.align	2
.L695:
	.word	.LC78
	.word	mgba_printf
	.word	.LANCHOR0+164
	.word	.LC79
	.word	.LC80
	.size	debugEnemyPathCollisions, .-debugEnemyPathCollisions
	.set	CSWTCH.140,CSWTCH.124
	.set	CSWTCH.139,CSWTCH.123
	.set	CSWTCH.138,CSWTCH.122
	.global	enemySpawnTimer
	.global	enemyCount
	.global	enemies
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	enemies, %object
	.size	enemies, 320
enemies:
	.space	320
	.type	enemyCount, %object
	.size	enemyCount, 4
enemyCount:
	.space	4
	.type	debugCounter.10, %object
	.size	debugCounter.10, 4
debugCounter.10:
	.space	4
	.type	scrollTimer.9, %object
	.size	scrollTimer.9, 4
scrollTimer.9:
	.space	4
	.type	scrollState.8, %object
	.size	scrollState.8, 4
scrollState.8:
	.space	4
	.type	patternScroll.7, %object
	.size	patternScroll.7, 4
patternScroll.7:
	.space	4
	.type	verticalTimer.5, %object
	.size	verticalTimer.5, 16
verticalTimer.5:
	.space	16
	.type	horizontalTimer.4, %object
	.size	horizontalTimer.4, 16
horizontalTimer.4:
	.space	16
	.type	debugTimer.3, %object
	.size	debugTimer.3, 4
debugTimer.3:
	.space	4
	.type	enemySpawnTimer, %object
	.size	enemySpawnTimer, 4
enemySpawnTimer:
	.space	4
	.type	lastBG0.2, %object
	.size	lastBG0.2, 4
lastBG0.2:
	.space	4
	.type	lastBG1.1, %object
	.size	lastBG1.1, 4
lastBG1.1:
	.space	4
	.type	lastBG2.0, %object
	.size	lastBG2.0, 4
lastBG2.0:
	.space	4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.118, %object
	.size	CSWTCH.118, 32
CSWTCH.118:
	.word	192
	.word	208
	.word	128
	.word	128
	.word	128
	.word	128
	.word	32
	.word	48
	.type	CSWTCH.119, %object
	.size	CSWTCH.119, 32
CSWTCH.119:
	.word	8
	.word	232
	.word	128
	.word	128
	.word	128
	.word	128
	.word	8
	.word	232
	.type	CSWTCH.135, %object
	.size	CSWTCH.135, 16
CSWTCH.135:
	.word	20
	.word	180
	.word	180
	.word	20
	.type	CSWTCH.136, %object
	.size	CSWTCH.136, 16
CSWTCH.136:
	.word	0
	.word	0
	.word	192
	.word	192
	.type	CSWTCH.115, %object
	.size	CSWTCH.115, 16
CSWTCH.115:
	.word	224
	.word	128
	.word	0
	.word	128
	.type	CSWTCH.116, %object
	.size	CSWTCH.116, 16
CSWTCH.116:
	.word	128
	.word	0
	.word	128
	.word	224
	.type	CSWTCH.123, %object
	.size	CSWTCH.123, 12
CSWTCH.123:
	.word	0
	.word	1
	.word	1
	.type	CSWTCH.122, %object
	.size	CSWTCH.122, 12
CSWTCH.122:
	.word	3
	.word	4
	.word	2
	.type	CSWTCH.124, %object
	.size	CSWTCH.124, 12
CSWTCH.124:
	.word	6
	.word	11
	.word	12
.LC0:
	.word	0
	.word	8
	.word	11
	.word	0
	.word	232
	.word	12
	.word	255
	.word	8
	.word	5
	.word	255
	.word	232
	.word	6
	.global	__aeabi_idivmod
	.ident	"GCC: (devkitARM release 66) 15.1.0"
