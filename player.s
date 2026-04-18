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
	.file	"player.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"=== STARTING SHOOT SEQUENCE ===\000"
	.align	2
.LC1:
	.ascii	"PLAYER SHOOTING: direction=%d, player at (%d,%d) si"
	.ascii	"ze=%dx%d\000"
	.align	2
.LC3:
	.ascii	"Bullet: world(%d,%d), speed=%d, dir=%d, flip=%d, sp"
	.ascii	"rite=%d\000"
	.text
	.align	2
	.syntax unified
	.arm
	.type	playerShootDuringPattern.part.0, %function
playerShootDuringPattern.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r7, .L15
	ldr	r0, .L15+4
	sub	sp, sp, #16
	mov	lr, pc
	bx	r7
	mov	r8, #1
	mov	r3, #30
	ldr	r2, .L15+8
	ldr	r1, [r2]
	ldr	r4, .L15+12
	add	r2, r5, #8
	add	r0, r5, #24
	cmp	r1, #23
	str	r3, [r4, #4]
	str	r8, [r4]
	ldm	r2, {r2, r3}
	ldm	r0, {r0, ip}
	ble	.L14
.L2:
	mvn	r1, #0
	stm	sp, {r0, ip}
	ldr	r0, .L15+16
	mov	lr, pc
	bx	r7
	mov	r3, #0
	mov	r2, #20
	mov	r1, #1
	str	r3, [r4, #68]
	str	r2, [r4, #52]
	str	r1, [r4, #16]
	str	r2, [r4, #36]
	str	r3, [r4, #120]
	str	r3, [r4, #172]
	str	r3, [r4, #224]
.L12:
	add	r1, r4, #8
	add	r3, r4, #20
	ldm	r1, {r1, r2}
	ldm	r3, {r3, r6, ip}
	ldr	r0, [r4, #48]
	b	.L9
.L14:
	ldr	lr, .L15+20
	ldr	r1, [lr, r1, lsl #2]
	sub	r1, r1, #8
	cmp	r1, #3
	bhi	.L2
	stm	sp, {r0, ip}
	ldr	r0, .L15+24
	ldr	r6, [r0, r1, lsl #2]
	ldr	r0, .L15+16
	mov	r1, r6
	mov	lr, pc
	bx	r7
	mov	r3, #0
	mov	r1, #20
	ldr	r2, .L15+28
	str	r8, [r4, #16]
	str	r3, [r4, #68]
	str	r1, [r4, #52]
	str	r1, [r4, #36]
	str	r3, [r4, #120]
	str	r3, [r4, #172]
	str	r3, [r4, #224]
	cmp	r6, #3
	bhi	.L12
	ldrb	r2, [r2, r6]
	add	pc, pc, r2, lsl #2
.Lrtx5:
	nop
	.section	.rodata
.L5:
	.byte	(.L8-.Lrtx5-4)/4
	.byte	(.L7-.Lrtx5-4)/4
	.byte	(.L6-.Lrtx5-4)/4
	.byte	(.L4-.Lrtx5-4)/4
	.text
	.p2align 2
.L4:
	mov	ip, #0
	ldr	r1, [r5, #8]
	ldr	r3, [r5, #24]
	add	r1, r1, r3
	ldr	r3, [r5, #28]
	ldr	r2, [r5, #12]
	add	r3, r3, r3, lsr #31
	add	r2, r2, r3, asr #1
	mov	r3, #5
	mov	r0, #28
	mov	r6, ip
	add	r1, r1, r3
	sub	r2, r2, #29
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	str	r3, [r4, #20]
	str	ip, [r4, #24]
	str	ip, [r4, #28]
	str	ip, [r4, #32]
	str	r0, [r4, #48]
.L9:
	str	r0, [sp, #8]
	stm	sp, {r6, ip}
	ldr	r0, .L15+32
	mov	lr, pc
	bx	r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L6:
	ldr	r3, [r5, #28]
	add	r1, r5, #8
	ldm	r1, {r1, r2}
	add	r3, r3, r3, lsr #31
	mov	r6, #0
	add	r2, r2, r3, asr #1
	mov	ip, #1
	mvn	r3, #4
	mov	r0, #28
	sub	r1, r1, #20
	sub	r2, r2, #29
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	str	r3, [r4, #20]
	str	r6, [r4, #24]
	str	ip, [r4, #28]
	str	r6, [r4, #32]
	str	r0, [r4, #48]
	b	.L9
.L7:
	mov	lr, #1
	ldr	r3, [r5, #24]
	mov	ip, #0
	add	r2, r3, r3, lsr #31
	mov	r0, #156
	mvn	r3, #4
	ldr	r1, [r5, #8]
	add	r1, r1, r2, asr lr
	ldr	r2, [r5, #12]
	sub	r1, r1, #16
	sub	r2, r2, #20
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	str	r3, [r4, #20]
	str	lr, [r4, #24]
	str	lr, [r4, #32]
	str	ip, [r4, #28]
	str	r0, [r4, #48]
	b	.L9
.L8:
	mov	ip, r6
	mov	r6, #1
	ldr	r3, [r5, #24]
	mov	lr, #0
	add	r2, r3, r3, lsr #31
	mov	r0, #156
	mov	r3, #5
	ldr	r1, [r5, #8]
	add	r1, r1, r2, asr r6
	ldr	r2, [r5, #12]
	ldr	r5, [r5, #28]
	add	r2, r2, r5
	sub	r1, r1, #29
	sub	r2, r2, #5
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	str	r3, [r4, #20]
	str	r6, [r4, #24]
	str	lr, [r4, #28]
	str	lr, [r4, #32]
	str	r0, [r4, #48]
	b	.L9
.L16:
	.align	2
.L15:
	.word	mgba_printf
	.word	.LC0
	.word	currentMovementStep
	.word	.LANCHOR0
	.word	.LC1
	.word	movementSequence
	.word	.LANCHOR1
	.word	.L5
	.word	.LC3
	.size	playerShootDuringPattern.part.0, .-playerShootDuringPattern.part.0
	.align	2
	.global	getPlayerLives
	.syntax unified
	.arm
	.type	getPlayerLives, %function
getPlayerLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L18
	ldr	r0, [r3]
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR2
	.size	getPlayerLives, .-getPlayerLives
	.align	2
	.global	initPlayerLives
	.syntax unified
	.arm
	.type	initPlayerLives, %function
initPlayerLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L21
	str	r2, [r3]
	str	r2, [r3, #4]
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR2
	.size	initPlayerLives, .-initPlayerLives
	.align	2
	.global	drawPlayerLives
	.syntax unified
	.arm
	.type	drawPlayerLives, %function
drawPlayerLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L30
	ldmib	r3, {r0, r3}
	cmp	r0, #0
	push	{r4, lr}
	bgt	.L24
	mov	r2, #512
	ldr	r1, .L30+4
	lsl	lr, r3, #3
	add	ip, r1, r3, lsl #3
	strh	r2, [r1, lr]	@ movhi
	sub	r3, r3, #2
	strh	r2, [ip, #-8]	@ movhi
	lsl	r0, r3, #3
.L25:
	strh	r2, [r1, r0]	@ movhi
	pop	{r4, lr}
	bx	lr
.L24:
	mov	r2, #230
	ldr	r1, .L30+4
	add	r4, r1, r3, lsl #3
	strh	r2, [r4, #2]	@ movhi
	mov	r2, #4
	ldr	lr, .L30+8
	lsl	ip, r3, #3
	cmp	r0, #1
	strh	r2, [r1, ip]	@ movhi
	strh	lr, [r4, #4]	@ movhi
	sub	ip, r3, #1
	beq	.L29
	cmp	r0, #2
	add	r0, r1, ip, lsl #3
	lsl	ip, ip, #3
	strh	r2, [r1, ip]	@ movhi
	mov	ip, #220	@ movhi
	moveq	r2, #512
	strh	ip, [r0, #2]	@ movhi
	movne	ip, #210
	sub	r3, r3, #2
	strh	lr, [r0, #4]	@ movhi
	lslne	r0, r3, #3
	lsleq	r0, r3, #3
	addne	r3, r1, r3, lsl #3
	strhne	lr, [r3, #4]	@ movhi
	strhne	ip, [r3, #2]	@ movhi
	strh	r2, [r1, r0]	@ movhi
	pop	{r4, lr}
	bx	lr
.L29:
	mov	lr, #512
	lsl	ip, ip, #3
	sub	r3, r3, #2
	mov	r2, lr
	strh	lr, [r1, ip]	@ movhi
	lsl	r0, r3, #3
	b	.L25
.L31:
	.align	2
.L30:
	.word	.LANCHOR2
	.word	shadowOAM
	.word	4984
	.size	drawPlayerLives, .-drawPlayerLives
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"INIT PLAYER BULLETS: cooldown=%d, isShooting=%d\000"
	.align	2
.LC5:
	.ascii	"INIT COMPLETE: cooldown=%d, isShooting=%d\000"
	.text
	.align	2
	.global	initPlayerBullets
	.syntax unified
	.arm
	.type	initPlayerBullets, %function
initPlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L36
	ldr	r0, .L36+4
	ldr	r2, [r4]
	ldr	r1, [r4, #268]
	ldr	r5, .L36+8
	mov	lr, pc
	bx	r5
	mov	r2, #20
	mov	r1, #0
	mov	r0, #32
	mov	ip, #28
	add	r3, r4, #8
.L33:
	str	r2, [r3, #28]
	add	r2, r2, #1
	cmp	r2, #25
	str	r1, [r3, #8]
	str	r0, [r3, #32]
	str	r0, [r3, #36]
	str	ip, [r3, #40]
	str	r1, [r3, #44]
	add	r3, r3, #52
	bne	.L33
	mov	r2, #0
	str	r1, [r4, #268]
	str	r1, [r4]
	ldr	r0, .L36+12
	mov	r1, r2
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.word	.LC4
	.word	mgba_printf
	.word	.LC5
	.size	initPlayerBullets, .-initPlayerBullets
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #64
	str	lr, [sp, #-4]!
	mov	r3, #0
	str	r1, [r0, #24]
	str	r1, [r0, #28]
	mov	r2, #67108864
	mov	lr, #30
	mov	ip, #150
	mov	r1, #5
	str	lr, [r0, #12]
	str	ip, [r0, #8]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	str	r3, [r0, #40]
	str	r3, [r0, #44]
	strb	r3, [r0, #52]
	str	r1, [r0, #48]
	ldr	lr, [sp], #4
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	strh	r3, [r2, #26]	@ movhi
	bx	lr
	.size	initPlayer, .-initPlayer
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"CANNOT SHOOT: cooldown=%d, isShooting=%d\000"
	.text
	.align	2
	.global	playerShootDuringPattern
	.syntax unified
	.arm
	.type	playerShootDuringPattern, %function
playerShootDuringPattern:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	ldr	r1, [r3, #268]
	cmp	r1, #0
	ldr	r2, [r3]
	bgt	.L41
	cmp	r2, #0
	beq	.L42
.L41:
	push	{r4, lr}
	ldr	r0, .L47+4
	ldr	r3, .L47+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L42:
	b	playerShootDuringPattern.part.0
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.word	.LC6
	.word	mgba_printf
	.size	playerShootDuringPattern, .-playerShootDuringPattern
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"=== EM PATTERN: SHOOTING BULLET (sprite 624) ===\000"
	.align	2
.LC8:
	.ascii	"EM Bullet 624: dir=%d, pos=(%d,%d), speed=%d\000"
	.text
	.align	2
	.global	playerShootDuringEMPattern
	.syntax unified
	.arm
	.type	playerShootDuringEMPattern, %function
playerShootDuringEMPattern:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L61
	ldr	r3, [r1, #268]
	cmp	r3, #0
	bxgt	lr
	push	{r4, r5, r6, lr}
	ldr	r4, [r1]
	cmp	r4, #0
	sub	sp, sp, #16
	beq	.L59
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	str	r0, [sp, #12]
	ldr	r3, .L61+4
	ldr	r0, .L61+8
	mov	lr, pc
	bx	r3
	mov	r2, #30
	ldr	r1, .L61
	str	r2, [r1, #4]
	mov	r2, #5
	mov	ip, #1
	str	r2, [r1, #268]
	ldr	r2, .L61+12
	ldr	r2, [r2]
	cmp	r2, #23
	str	ip, [r1]
	bgt	.L51
	ldr	r0, .L61+16
	ldr	r2, [r0, r2, lsl #2]
	cmp	r2, #10
	ldr	r3, [sp, #12]
	beq	.L52
	cmp	r2, #11
	mov	r2, #16
	str	r2, [r1, #40]
	str	r2, [r1, #44]
	mov	r2, #85
	mov	r0, #20
	str	r2, [r1, #36]
	mov	r2, #624
	str	ip, [r1, #16]
	str	r4, [r1, #68]
	str	r4, [r1, #120]
	str	r4, [r1, #172]
	str	r4, [r1, #224]
	str	r0, [r1, #52]
	str	r2, [r1, #48]
	bne	.L60
	mov	r0, #4
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #6
	add	r3, r3, #10
	str	ip, [r1, #24]
	str	r2, [r1, #8]
	str	r3, [r1, #12]
	str	r4, [r1, #28]
	str	r4, [r1, #32]
	str	r0, [r1, #20]
.L54:
	str	r0, [sp]
	mov	r1, r4
	ldr	r0, .L61+20
	ldr	ip, .L61+4
	mov	lr, pc
	bx	ip
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	mov	r3, #16
	mov	r2, #20
	mov	lr, #85
	str	ip, [r1, #16]
	mov	ip, #624
	str	r4, [r1, #68]
	str	r4, [r1, #120]
	str	r4, [r1, #172]
	str	r4, [r1, #224]
	str	r2, [r1, #52]
	str	r3, [r1, #40]
	str	r3, [r1, #44]
	mvn	r4, #0
	ldr	r2, [r1, #8]
	ldr	r3, [r1, #12]
	ldr	r0, [r1, #20]
	str	lr, [r1, #36]
	str	ip, [r1, #48]
	b	.L54
.L52:
	mov	r5, #624
	mov	r6, #20
	mov	r2, #16
	mvn	lr, #3
	mov	r0, #85
	str	r5, [r1, #48]
	str	r6, [r1, #52]
	str	r2, [r1, #40]
	str	r2, [r1, #44]
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	add	r2, r2, #24
	sub	r3, r3, #20
	str	r4, [r1, #68]
	str	r4, [r1, #120]
	str	r4, [r1, #172]
	str	r4, [r1, #224]
	str	r0, [r1, #36]
	str	r4, [r1, #28]
	mov	r0, lr
	mov	r4, ip
	str	ip, [r1, #16]
	str	lr, [r1, #20]
	str	r2, [r1, #8]
	str	r3, [r1, #12]
	str	ip, [r1, #24]
	str	ip, [r1, #32]
	b	.L54
.L60:
	add	r2, r1, #8
	mvn	r4, #0
	ldm	r2, {r2, r3}
	ldr	r0, [r1, #20]
	b	.L54
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC7
	.word	currentMovementStep2
	.word	movementSequence2
	.word	.LC8
	.size	playerShootDuringEMPattern, .-playerShootDuringEMPattern
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"=== updatePlayerBullets() Frame %d ===\000"
	.align	2
.LC10:
	.ascii	"Bullet[0] ACTIVE: dir=%d, speed=%d, pos=(%d,%d), li"
	.ascii	"feTimer=%d\000"
	.align	2
.LC11:
	.ascii	"  Moving HORIZONTAL: x now=%d\000"
	.align	2
.LC12:
	.ascii	"  Moving VERTICAL: y now=%d\000"
	.align	2
.LC13:
	.ascii	"  lifeTimer now=%d\000"
	.align	2
.LC14:
	.ascii	"  BULLET DESTROYED - timer expired\000"
	.align	2
.LC15:
	.ascii	"Bullet[0] INACTIVE\000"
	.text
	.align	2
	.global	updatePlayerBullets
	.syntax unified
	.arm
	.type	updatePlayerBullets, %function
updatePlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L76
	ldr	r1, [r4, #272]
	sub	sp, sp, #12
	add	r1, r1, #1
	ldr	r0, .L76+4
	ldr	r5, .L76+8
	str	r1, [r4, #272]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L64
	ldr	r2, [r4, #52]
	ldr	r3, [r4, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r0, .L76+12
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #24]
	mov	lr, pc
	bx	r5
	add	r1, r4, #20
	ldm	r1, {r1, r3}
	cmp	r3, #0
	ldreq	r3, [r4, #8]
	ldrne	r3, [r4, #12]
	addeq	r1, r1, r3
	addne	r1, r1, r3
	ldreq	r0, .L76+16
	ldrne	r0, .L76+20
	streq	r1, [r4, #8]
	strne	r1, [r4, #12]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #52]
	ldr	r0, .L76+24
	sub	r1, r1, #1
	str	r1, [r4, #52]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #52]
	cmp	r3, #0
	ble	.L75
.L67:
	mov	r0, #0
	ldr	r3, .L76+28
	add	r1, r3, #208
.L69:
	ldr	r2, [r3, #60]
	cmp	r2, #0
	strne	r0, [r3, #60]
	add	r3, r3, #52
	cmp	r3, r1
	bne	.L69
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L64:
	ldr	r0, .L76+32
	mov	lr, pc
	bx	r5
	b	.L67
.L75:
	ldr	r0, .L76+36
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #16]
	b	.L67
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.word	.LC9
	.word	mgba_printf
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LANCHOR0+8
	.word	.LC15
	.word	.LC14
	.size	updatePlayerBullets, .-updatePlayerBullets
	.section	.rodata.str1.4
	.align	2
.LC16:
	.ascii	"=== DRAWING BULLETS (camera: %d,%d) ===\000"
	.align	2
.LC17:
	.ascii	"Bullet[0]: INACTIVE, OAM %d\000"
	.align	2
.LC18:
	.ascii	"Bullet[0]: dir=%d, tile=%d, hflip=%d, vflip=%d, pos"
	.ascii	"(%d,%d)\000"
	.text
	.align	2
	.global	drawPlayerBullets
	.syntax unified
	.arm
	.type	drawPlayerBullets, %function
drawPlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L96
	ldr	r3, [r4, #276]
	cmp	r3, #0
	sub	sp, sp, #16
	beq	.L79
	add	r5, r4, #280
	ldm	r5, {r5, r6}
.L80:
	mov	r2, r6
	mov	r1, r5
	ldr	r0, .L96+4
	ldr	r8, .L96+8
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L95
	ldr	r3, [r4, #8]
	sub	r5, r3, r5
	ldr	r3, [r4, #12]
	str	r5, [sp, #4]
	sub	r6, r3, r6
	ldr	r2, [r4, #48]
	str	r6, [sp, #8]
	ldr	r3, [r4, #32]
	str	r3, [sp]
	add	r1, r4, #24
	cmp	r2, #624
	ldm	r1, {r1, r3}
	ldr	r0, .L96+12
	mvnne	r7, #31
	mvneq	r7, #15
	mov	lr, pc
	bx	r8
	cmp	r6, #160
	cmple	r5, #240
	movgt	r3, #1
	movle	r3, #0
	cmp	r7, r5
	orrgt	r3, r3, #1
	cmp	r7, r6
	orrgt	r3, r3, #1
	cmp	r3, #0
	ldr	r2, [r4, #36]
	beq	.L84
	mov	r1, #512
	ldr	r3, .L96+16
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L79:
	ldr	r5, [r0, #8]
	ldr	r2, [r0, #12]
	sub	r5, r5, #88
	cmp	r5, #16
	sub	r6, r2, #48
	movge	r5, #16
	cmp	r6, #96
	movge	r6, #96
	bic	r5, r5, r5, asr #31
	bic	r6, r6, r6, asr #31
	b	.L80
.L95:
	mov	ip, #512
	ldr	r1, [r4, #36]
	ldr	r2, .L96+16
	lsl	r3, r1, #3
	ldr	r0, .L96+20
	strh	ip, [r2, r3]	@ movhi
	mov	lr, pc
	bx	r8
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L84:
	ldr	r1, [r4, #48]
	lsl	r3, r5, #23
	cmp	r1, #624
	lsr	r3, r3, #23
	mvnne	r3, r3, lsl #17
	mvnne	r3, r3, lsr #17
	lslne	r1, r1, #22
	lsrne	r1, r1, #22
	orrne	r0, r1, #9216
	ldr	r1, [r4, #28]
	orreq	r3, r3, #16384
	ldreq	r0, .L96+24
	cmp	r1, #0
	orr	r1, r3, #4096
	lsl	r1, r1, #16
	lsl	r3, r3, #16
	moveq	r3, r3, lsr #16
	movne	r3, r1, lsr #16
	ldr	ip, [r4, #32]
	ldr	r1, .L96+16
	cmp	ip, #0
	lsl	lr, r2, #3
	and	r6, r6, #255
	add	r2, r1, r2, lsl #3
	orrne	r3, r3, #8192
	strh	r6, [r1, lr]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	.LANCHOR0
	.word	.LC16
	.word	mgba_printf
	.word	.LC18
	.word	shadowOAM
	.word	.LC17
	.word	26224
	.size	drawPlayerBullets, .-drawPlayerBullets
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"Player invisible (invincibility flash)\000"
	.align	2
.LC20:
	.ascii	"EM PAUSE ACTIVE - Player OFF-SCREEN, hiding everyth"
	.ascii	"ing\000"
	.align	2
.LC21:
	.ascii	"Drawing EM bullet 624 at screen (%d,%d)\000"
	.align	2
.LC22:
	.ascii	"DRAW: dir=%d, frame=%d, isAnim=%d\000"
	.align	2
.LC23:
	.ascii	"EM Pattern Check: active2=%d, show2=%d, result=%d\000"
	.align	2
.LC25:
	.ascii	"=== ISOSCELES TRIANGLE PATTERN ===\000"
	.align	2
.LC26:
	.ascii	"Direction: %d, screenX: %d, screenY: %d\000"
	.align	2
.LC28:
	.ascii	"=== RIGHT TRIANGLE PATTERN ===\000"
	.align	2
.LC29:
	.ascii	"Direction: %d\000"
	.align	2
.LC30:
	.ascii	"=== DIRECTION DEBUG ===\000"
	.align	2
.LC31:
	.ascii	"currentDirection: %d\000"
	.align	2
.LC32:
	.ascii	"player->screenX: %d, player->screenY: %d\000"
	.align	2
.LC33:
	.ascii	"=== EM PATTERN ===\000"
	.text
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L238
	ldr	r3, [r5, #288]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	beq	.L99
	ldr	r3, [r5, #292]
	add	r3, r3, r3, lsr #31
	tst	r3, #2
	beq	.L223
.L99:
	ldr	r3, [r5, #276]
	cmp	r3, #0
	beq	.L101
	ldr	r3, .L238+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L224
.L101:
	ldr	r3, [r4, #40]
	ldr	r2, [r4, #44]
	ldr	r1, [r4, #36]
	ldr	r0, .L238+8
	ldr	r7, .L238+12
	mov	lr, pc
	bx	r7
	ldr	r3, .L238+16
	ldr	r3, [r3]
	cmp	r3, #6
	ldr	r3, [r4, #44]
	mov	fp, r3
	ldr	r3, [r4, #40]
	ldr	r6, [r4, #36]
	mov	r10, r3
	beq	.L225
	ldr	r8, [r5, #296]
	cmp	r8, #0
	beq	.L105
	ldr	r8, [r5, #300]
	subs	r8, r8, #0
	movne	r8, #1
.L105:
	ldr	r3, [r5, #304]
	cmp	r3, #0
	streq	r3, [sp]
	beq	.L104
	ldr	r3, [r5, #300]
	subs	r3, r3, #0
	movne	r3, #1
	str	r3, [sp]
	mov	r3, #0
.L104:
	ldr	r2, .L238+20
	cmp	r6, #7
	bhi	.L166
	ldrb	r2, [r2, r6]
	add	pc, pc, r2, lsl #2
.Lrtx108:
	nop
	.section	.rodata
.L108:
	.byte	(.L113-.Lrtx108-4)/4
	.byte	(.L112-.Lrtx108-4)/4
	.byte	(.L107-.Lrtx108-4)/4
	.byte	(.L109-.Lrtx108-4)/4
	.byte	(.L109-.Lrtx108-4)/4
	.byte	(.L107-.Lrtx108-4)/4
	.byte	(.L109-.Lrtx108-4)/4
	.byte	(.L107-.Lrtx108-4)/4
	.text
	.p2align 2
.L109:
	ldr	r2, .L238+24
	add	r2, r2, fp, lsl #2
	ldr	r2, [r2, #16]
	mov	r10, #1
	mov	r9, r2
.L106:
	cmp	r8, #0
	bne	.L226
.L118:
	ldr	r2, [sp]
	cmp	r2, #0
	bne	.L227
	ldr	r2, [r5, #300]
	cmp	r2, #0
	beq	.L142
	sub	r2, r6, #2
	cmp	r2, #1
	bls	.L228
	cmp	r6, #1
	bhi	.L142
	ldm	r4, {r2, ip}
	ldr	r3, .L238+28
	add	r0, r2, #11
	add	r1, r2, #37
	and	r0, r0, r3
	and	r2, r2, r3
	and	r1, r1, r3
	ldr	r3, .L238+32
	orr	r1, r1, #20480
	strh	r1, [r3, #130]	@ movhi
	ldr	r1, .L238+36
	cmp	r6, #0
	orr	r0, r0, #16384
	strh	r1, [r3, #4]	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	movne	r1, #512
	mvneq	r0, r2, lsl #17
	mvn	r2, r2, lsl #18
	addeq	r1, r1, #4
	strheq	r1, [r3, #124]	@ movhi
	addeq	r1, ip, #15
	andeq	r1, r1, #255
	mvneq	r0, r0, lsr #17
	strh	r1, [r3, #120]	@ movhi
	add	lr, ip, #2
	and	r1, ip, #255
	mov	ip, #512
	mvn	r2, r2, lsr #18
	and	lr, lr, #255
	strh	lr, [r3]	@ movhi
	strheq	r0, [r3, #122]	@ movhi
	strh	lr, [r3, #128]	@ movhi
	strh	ip, [r3, #80]	@ movhi
	lsl	r0, r9, #22
	ldr	r3, .L238+40
	lsr	r0, r0, #22
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L128:
	mov	r0, r4
	bl	drawPlayerBullets
	mov	r0, r4
	ldr	r3, .L238+44
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawPlayerLives
.L107:
	ldr	r2, .L238+24
	add	r2, r2, fp, lsl #2
	ldr	r2, [r2, #16]
	mov	r9, r2
.L221:
	cmp	r8, #0
	mov	r10, #0
	beq	.L118
.L226:
	ldr	r0, .L238+48
	mov	lr, pc
	bx	r7
	ldm	r4, {r2, r3}
	mov	r1, r6
	ldr	r0, .L238+52
	mov	lr, pc
	bx	r7
	lsl	r2, r9, #22
	ldr	r1, [r4]
	ldr	r3, .L238+32
	lsr	r2, r2, #22
	orr	r2, r2, #1024
	ldr	r0, [r4, #4]
	strh	r2, [r3, #4]	@ movhi
	lsl	r2, r1, #23
	lsr	r2, r2, #23
	orr	r2, r2, r10, lsl #12
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	ldr	ip, .L238+56
	and	lr, r0, #255
	strh	lr, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	cmp	r6, #6
	bhi	.L119
	add	ip, ip, r6
	ldrh	ip, [ip, r6]
	add	pc, pc, ip, lsl #2
.Lrtx121:
	nop
	.section	.rodata
	.align	1
.L121:
	.2byte	(.L125-.Lrtx121-4)/4
	.2byte	(.L124-.Lrtx121-4)/4
	.2byte	(.L123-.Lrtx121-4)/4
	.2byte	(.L122-.Lrtx121-4)/4
	.2byte	(.L120-.Lrtx121-4)/4
	.2byte	(.L119-.Lrtx121-4)/4
	.2byte	(.L120-.Lrtx121-4)/4
	.text
	.p2align 2
.L224:
	ldr	r3, [r5, #284]
	cmp	r3, #96
	cmpne	r3, #0
	bne	.L101
	ldr	r0, .L238+60
	ldr	r4, .L238+12
	mov	lr, pc
	bx	r4
	mov	r2, #512
	ldr	r3, .L238+32
	add	r1, r3, #640
	strh	r2, [r1]	@ movhi
	ldr	r1, [r5, #16]
	add	r0, r3, #960
	cmp	r1, #0
	add	r1, r3, #968
	strh	r2, [r0]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #240]	@ movhi
	strh	r2, [r3, #248]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r1]	@ movhi
	beq	.L102
	ldr	r2, [r5, #48]
	cmp	r2, #624
	bne	.L102
	ldr	r2, [r5, #280]
	ldr	r1, [r5, #8]
	sub	r1, r1, r2
	add	r2, r1, #16
	cmp	r2, #255
	bhi	.L102
	ldr	r0, [r5, #284]
	ldr	r2, [r5, #12]
	sub	r2, r2, r0
	add	r0, r2, #16
	cmp	r0, #175
	bhi	.L102
	lsl	r0, r1, #23
	lsr	r0, r0, #23
	add	ip, r3, #680
	orr	r0, r0, #16384
	strh	r0, [ip, #2]	@ movhi
	ldr	r0, .L238+64
	add	r3, r3, #684
	strh	r0, [r3]	@ movhi
	and	r3, r2, #255
	ldr	r0, .L238+68
	strh	r3, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	b	.L98
.L142:
	cmp	r3, #0
	lsl	r5, r10, #28
	bne	.L229
	ldr	r2, .L238+32
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	lsl	r3, r9, #22
	strh	r1, [r2]	@ movhi
	ldr	r1, [r4]
	lsr	r3, r3, #22
	strh	r3, [r2, #4]	@ movhi
	lsl	r3, r1, #23
	lsr	r3, r3, #23
	orr	r3, r3, r5, asr #16
	mvn	r3, r3, lsl #18
	mov	r1, #512
	mvn	r3, r3, lsr #18
	add	r0, r2, #640
	strh	r1, [r0]	@ movhi
	add	ip, r2, #960
	add	r0, r2, #968
	strh	r1, [ip]	@ movhi
	strh	r1, [r2, #240]	@ movhi
	strh	r1, [r2, #248]	@ movhi
	strh	r1, [r2, #128]	@ movhi
	strh	r1, [r2, #120]	@ movhi
	strh	r1, [r2, #80]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	b	.L128
.L225:
	ldr	r3, .L238+72
	ldr	r2, [r3]
	subs	ip, r2, #0
	movne	ip, #1
	ldr	r3, .L238+76
	ldr	r8, [r3]
	ldr	r3, .L238+80
	ldr	r9, [r3]
	ldr	r3, .L238+84
	ldr	lr, [r3]
	mov	r1, r8
	cmp	r8, #0
	moveq	r3, #0
	andne	r3, ip, #1
	cmp	r9, #0
	moveq	r8, #0
	andne	r8, ip, #1
	cmp	lr, #0
	moveq	ip, #0
	andne	ip, ip, #1
	ldr	r0, .L238+88
	str	r3, [sp, #4]
	str	ip, [sp]
	mov	lr, pc
	bx	r7
	ldr	r3, [sp, #4]
	b	.L104
.L112:
	cmp	r10, #0
	bne	.L116
	ldr	r2, .L238+92
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L230
.L117:
	ldr	r2, .L238+96
	ldr	r2, [r2]
	subs	r10, r2, #0
	beq	.L220
	ldr	r2, .L238+100
	ldr	r2, [r2]
	cmp	r2, #23
	ble	.L116
	mov	r10, #0
.L220:
	mov	r9, #512
	b	.L106
.L113:
	cmp	r10, #0
	bne	.L114
	ldr	r2, .L238+92
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L231
.L115:
	ldr	r2, .L238+96
	ldr	r2, [r2]
	subs	r9, r2, #0
	beq	.L221
	ldr	r2, .L238+100
	ldr	r2, [r2]
	cmp	r2, #23
	ble	.L114
.L166:
	mov	r10, #0
	mov	r9, #0
	b	.L106
.L223:
	mov	r3, #512
	ldr	r2, .L238+32
	ldr	r0, .L238+104
	add	ip, r2, #640
	add	r1, r2, #960
	add	lr, r2, #968
	strh	r3, [r2]	@ movhi
	strh	r3, [r2, #240]	@ movhi
	strh	r3, [r2, #248]	@ movhi
	strh	r3, [r2, #128]	@ movhi
	strh	r3, [r2, #120]	@ movhi
	strh	r3, [r2, #80]	@ movhi
	ldr	r2, .L238+12
	strh	r3, [lr]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	mov	lr, pc
	bx	r2
.L98:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L229:
	ldr	r0, .L238+108
	mov	lr, pc
	bx	r7
	ldm	r4, {r2, r3}
	mov	r1, r6
	ldr	r0, .L238+52
	mov	lr, pc
	bx	r7
	lsl	r2, r9, #22
	ldr	r1, [r4]
	ldr	r3, .L238+32
	lsr	r2, r2, #22
	orr	r2, r2, #1024
	ldr	ip, [r4, #4]
	strh	r2, [r3, #4]	@ movhi
	lsl	r2, r1, #23
	lsr	r2, r2, #23
	orr	r2, r2, r5, asr #16
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	and	r0, ip, #255
	cmp	r6, #1
	strh	r0, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bls	.L148
	ldr	r2, .L238+96
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L232
.L149:
	sub	r2, r6, #2
	cmp	r2, #1
	bls	.L154
	ldr	r0, .L238+100
	ldr	r2, .L238+112
	ldr	r0, [r0]
	ldr	r2, [r2, r0, lsl #2]
	sub	r0, r2, #4
	cmp	r0, #3
	bhi	.L233
.L155:
	bic	r2, r2, #2
	cmp	r2, #4
	bne	.L158
.L157:
	sub	r1, r1, #2
	ldr	lr, .L238+116
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	sub	r0, ip, #1
	and	r0, r0, #255
	orr	lr, r1, lr
	ldr	r1, .L238+120
	orr	r0, r0, #16384
.L153:
	ldr	r2, .L238+124
	strh	r0, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L159:
	mov	r2, #512
	ldr	r1, .L238+40
	strh	r2, [r1], #8	@ movhi
	strh	r2, [r3, #240]	@ movhi
	strh	r2, [r3, #248]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r1]	@ movhi
	b	.L128
.L120:
	add	r1, r1, #39
	ldr	r2, .L238+128
	lsl	r1, r1, #23
	add	r0, r0, #6
.L222:
	lsr	r1, r1, #23
	and	r0, r0, #255
	orr	r1, r1, #16384
	strh	r0, [r3, #248]	@ movhi
	strh	r1, [r3, #250]	@ movhi
	strh	r2, [r3, #252]	@ movhi
.L126:
	mov	r2, #512
	ldr	r1, .L238+40
	strh	r2, [r1], #8	@ movhi
	strh	r2, [r3, #240]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r1]	@ movhi
	b	.L128
.L102:
	mov	r2, #512
	ldr	r3, .L238+132
	strh	r2, [r3]	@ movhi
	b	.L98
.L227:
	ldr	r0, .L238+136
	mov	lr, pc
	bx	r7
	mov	r1, r6
	ldr	r0, .L238+140
	mov	lr, pc
	bx	r7
	lsl	r2, r9, #22
	lsr	r2, r2, #22
	ldr	r3, .L238+32
	orr	r1, r2, #1024
	ldr	r2, [r4]
	ldr	r0, [r4, #4]
	strh	r1, [r3, #4]	@ movhi
	lsl	r1, r2, #23
	lsr	r1, r1, #23
	orr	r1, r1, r10, lsl #12
	mvn	r1, r1, lsl #18
	mvn	r1, r1, lsr #18
	and	ip, r0, #255
	cmp	r6, #0
	strh	ip, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	bne	.L130
	sub	r2, r2, #5
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L238+144
	add	r0, r0, #2
	and	r0, r0, #255
	strh	r0, [r3, #240]	@ movhi
	strh	r1, [r3, #244]	@ movhi
	strh	r2, [r3, #242]	@ movhi
.L131:
	mov	r2, #512
	ldr	r1, .L238+40
	strh	r2, [r1], #8	@ movhi
	strh	r2, [r3, #128]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r1]	@ movhi
	b	.L128
.L130:
	ldr	r1, .L238+148
	ldr	ip, [r1]
	ldr	r1, .L238+152
	ldr	r1, [r1, ip, lsl #2]
	sub	ip, r6, #2
	cmp	ip, #1
	bls	.L132
	sub	ip, r1, #4
	cmp	ip, #3
	bhi	.L234
	ldr	ip, .L238+156
	sub	r1, r1, #5
	cmp	r1, #2
	bhi	.L137
	ldrb	r1, [ip, r1]
	add	pc, pc, r1, lsl #2
.Lrtx162:
	nop
	.section	.rodata
.L162:
	.byte	(.L172-.Lrtx162-4)/4
	.byte	(.L137-.Lrtx162-4)/4
	.byte	(.L172-.Lrtx162-4)/4
	.text
	.p2align 2
.L230:
	ldr	r2, .L238+148
	ldr	r2, [r2]
	cmp	r2, #23
	bgt	.L117
.L116:
	sub	lr, fp, #1
	rsbs	r10, lr, #0
	mov	r9, #768
	adc	r10, r10, lr
	b	.L106
.L231:
	ldr	r2, .L238+148
	ldr	r2, [r2]
	cmp	r2, #23
	bgt	.L115
.L114:
	sub	r9, fp, #1
	rsbs	r10, r9, #0
	adc	r10, r10, r9
	mov	r9, #256
	b	.L106
.L125:
	add	r1, r1, #7
	ldr	r2, .L238+128
	lsl	r1, r1, #23
	add	r0, r0, #2
	b	.L222
.L122:
	add	r1, r1, #39
	ldr	r2, .L238+128
	lsl	r1, r1, #23
	add	r0, r0, #5
	b	.L222
.L124:
	mov	r2, #512
	strh	r2, [r3, #248]	@ movhi
	b	.L126
.L123:
	add	r1, r1, #8
	ldr	r2, .L238+128
	lsl	r1, r1, #23
	add	r0, r0, #7
	b	.L222
.L172:
	mov	r1, #0
.L139:
	sub	r2, r2, #5
	add	r0, r0, #13
.L138:
	lsl	r2, r2, #23
	orr	r2, r1, r2, lsr #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L238+160
	and	r0, r0, #255
	orr	r0, r0, #16384
	strh	r0, [r3, #240]	@ movhi
	strh	r1, [r3, #244]	@ movhi
	strh	r2, [r3, #242]	@ movhi
	b	.L131
.L232:
	ldr	r2, .L238+100
	ldr	r2, [r2]
	cmp	r2, #23
	bgt	.L149
	ldr	lr, .L238+112
	ldr	r2, [lr, r2, lsl #2]
	sub	lr, r2, #10
	cmp	lr, #1
	bhi	.L149
.L150:
	cmp	r2, #11
	beq	.L151
	add	r2, r1, #30
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	lr, r2, lsl #17
	ldr	r1, .L238+164
	mvn	lr, lr, lsr #17
	b	.L153
.L119:
	ldr	r2, .L238+148
	ldr	ip, [r2]
	ldr	r2, .L238+152
	ldr	r2, [r2, ip, lsl #2]
	bic	r2, r2, #2
	cmp	r2, #4
	beq	.L120
	bic	r6, r6, #2
	cmp	r2, #5
	cmpne	r6, #5
	bne	.L126
	add	r2, r1, #7
	lsl	r2, r2, #23
	ldr	ip, .L238+128
	add	r1, r0, #6
	lsr	r2, r2, #23
	and	r1, r1, #255
	orr	r2, r2, #16384
	strh	r1, [r3, #248]	@ movhi
	strh	r2, [r3, #250]	@ movhi
	strh	ip, [r3, #252]	@ movhi
	b	.L126
.L137:
	mov	r1, #4096
	add	r2, r2, #38
	add	r0, r0, #13
	b	.L138
.L234:
	mov	r2, #512
	strh	r2, [r3, #240]	@ movhi
	b	.L131
.L228:
	ldr	r0, .L238+168
	mov	lr, pc
	bx	r7
	mov	r1, r6
	ldr	r0, .L238+172
	mov	lr, pc
	bx	r7
	ldm	r4, {r1, r2}
	ldr	r0, .L238+176
	mov	lr, pc
	bx	r7
	ldr	r1, [r4, #4]
	cmp	r6, #2
	add	ip, r1, #1
	ldr	r3, [r4]
	and	ip, ip, #255
	beq	.L235
	mov	r0, #4096
	add	lr, r3, #20
	lsl	lr, lr, #23
	lsr	lr, lr, #23
	orr	lr, lr, #16384
	add	r2, r3, #29
.L145:
	lsl	r2, r2, #23
	orr	r0, r0, r2, lsr #23
	mvn	r0, r0, lsl #18
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r3, r3, r10, lsl #12
	mvn	r3, r3, lsl #18
	mvn	r0, r0, lsr #18
	mov	r6, #512
	mvn	r3, r3, lsr #18
	ldr	r2, .L238+32
	strh	r0, [r2, #82]	@ movhi
	ldr	r0, .L238+180
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #84]	@ movhi
	and	r1, r1, #255
	add	r0, r2, #960
	ldr	ip, .L238+184
	strh	r1, [r0]	@ movhi
	lsl	r5, r9, #22
	orr	r1, r1, #16384
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r6, [r2, #128]	@ movhi
	strh	r6, [r2, #120]	@ movhi
	strh	r1, [r2, #80]	@ movhi
	lsr	r5, r5, #22
	add	r2, r2, #964
	strh	r3, [r0, #2]	@ movhi
	strh	r5, [r2]	@ movhi
	b	.L128
.L132:
	cmp	r6, #3
	bne	.L236
	ldr	ip, .L238+188
	sub	r1, r1, #4
	cmp	r1, #3
	bhi	.L141
	ldrsb	r1, [ip, r1]
	add	pc, pc, r1, lsl #2
.Lrtx160:
	nop
	.section	.rodata
.L160:
	.byte	(.L137-.Lrtx160-4)/4
	.byte	(.L170-.Lrtx160-4)/4
	.byte	(.L137-.Lrtx160-4)/4
	.byte	(.L170-.Lrtx160-4)/4
	.text
	.p2align 2
.L170:
	mov	r1, #4096
	b	.L139
.L148:
	cmp	r6, #0
	bne	.L237
.L151:
	add	r1, r1, #4
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	lr, r1, lsl #17
	sub	r0, ip, #1
	mvn	lr, lr, lsr #17
	ldr	r1, .L238+192
	and	r0, r0, #255
	b	.L153
.L154:
	cmp	r6, #3
	beq	.L157
	ldr	r0, .L238+100
	ldr	r2, .L238+112
	ldr	r0, [r0]
	ldr	r2, [r2, r0, lsl #2]
	b	.L155
.L235:
	add	lr, r3, #28
	lsl	lr, lr, #23
	lsr	lr, lr, #23
	ldr	r0, [sp]
	orr	lr, lr, #16384
	sub	r2, r3, #29
	b	.L145
.L237:
	ldr	r2, .L238+100
	ldr	lr, [r2]
	ldr	r2, .L238+112
	ldr	r2, [r2, lr, lsl #2]
	b	.L150
.L158:
	add	r2, r1, #2
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	lr, r2, lsl #18
	sub	r2, ip, #1
	and	r2, r2, #255
	mvn	lr, lr, lsr #18
	ldr	r1, .L238+120
	orr	r0, r2, #16384
	b	.L153
.L236:
	ldr	lr, .L238+196
	sub	ip, r1, #4
	cmp	ip, #3
	bhi	.L140
	add	ip, ip, ip
	ldrsh	ip, [lr, ip]
	add	pc, pc, ip, lsl #2
.Lrtx161:
	nop
	.section	.rodata
	.align	1
.L161:
	.2byte	(.L137-.Lrtx161-4)/4
	.2byte	(.L172-.Lrtx161-4)/4
	.2byte	(.L137-.Lrtx161-4)/4
	.2byte	(.L172-.Lrtx161-4)/4
	.text
	.p2align 2
.L233:
	mov	r1, #512
	ldr	r2, .L238+124
	strh	r1, [r2]	@ movhi
	b	.L159
.L141:
	mov	r1, #4096
	add	r2, r2, #37
	add	r0, r0, #13
	b	.L138
.L140:
	bic	r1, r1, #2
	sub	ip, r1, #4
	rsbs	r1, ip, #0
	adc	r1, r1, ip
	add	r0, r0, #13
	sub	r2, r2, #5
	lsl	r1, r1, #12
	b	.L138
.L239:
	.align	2
.L238:
	.word	.LANCHOR0
	.word	isEMPauseActive
	.word	.LC22
	.word	mgba_printf
	.word	state
	.word	.L108
	.word	.LANCHOR1
	.word	511
	.word	shadowOAM
	.word	25008
	.word	shadowOAM+960
	.word	drawPatternSprite
	.word	.LC25
	.word	.LC26
	.word	.L121
	.word	.LC20
	.word	26224
	.word	.LC21
	.word	showAccessory2
	.word	emPatternActive2
	.word	isoscelesTrianglePatternActive2
	.word	rightTrianglePatternActive2
	.word	.LC23
	.word	automaticMovementActive
	.word	automaticMovementActive2
	.word	currentMovementStep2
	.word	.LC19
	.word	.LC33
	.word	movementSequence2
	.word	-12288
	.word	25392
	.word	shadowOAM+640
	.word	25200
	.word	shadowOAM+680
	.word	.LC28
	.word	.LC29
	.word	25072
	.word	currentMovementStep
	.word	movementSequence
	.word	.L162
	.word	25140
	.word	25268
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	25080
	.word	25010
	.word	.L160
	.word	25264
	.word	.L161
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	resetPlayerBullets
	.syntax unified
	.arm
	.type	resetPlayerBullets, %function
resetPlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L241
	str	r2, [r3, #16]
	str	r2, [r3, #68]
	str	r2, [r3, #120]
	str	r2, [r3, #172]
	str	r2, [r3, #224]
	str	r2, [r3, #268]
	str	r2, [r3]
	bx	lr
.L242:
	.align	2
.L241:
	.word	.LANCHOR0
	.size	resetPlayerBullets, .-resetPlayerBullets
	.section	.rodata.str1.4
	.align	2
.LC37:
	.ascii	"Player lost a life! Remaining: %d\000"
	.align	2
.LC38:
	.ascii	"Player invincibility set for %d frames\000"
	.align	2
.LC39:
	.ascii	"PLAYER HAS NO LIVES LEFT! Game Over.\000"
	.text
	.align	2
	.global	loseLife
	.syntax unified
	.arm
	.type	loseLife, %function
loseLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L252
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	push	{r4, lr}
	sub	r1, r1, #1
	ldr	r0, .L252+4
	ldr	r4, .L252+8
	str	r1, [r3]
	mov	lr, pc
	bx	r4
	mov	r1, #20
	mov	ip, #1
	ldr	r2, .L252+12
	ldr	r0, .L252+16
	str	r1, [r2, #292]
	str	ip, [r2, #288]
	mov	lr, pc
	bx	r4
	ldr	r3, .L252
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L251
	pop	{r4, lr}
	bx	lr
.L251:
	ldr	r0, .L252+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L253:
	.align	2
.L252:
	.word	.LANCHOR2
	.word	.LC37
	.word	mgba_printf
	.word	.LANCHOR0
	.word	.LC38
	.word	.LC39
	.size	loseLife, .-loseLife
	.section	.rodata.str1.4
	.align	2
.LC40:
	.ascii	"Player collided with enemy %d! Lives: %d -> %d\000"
	.text
	.align	2
	.global	checkPlayerEnemyCollision
	.syntax unified
	.arm
	.type	checkPlayerEnemyCollision, %function
checkPlayerEnemyCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, .L268
	ldr	r6, .L268+4
	ldr	r3, .L268+8
	ldr	r4, [r6, #288]
	ldr	r2, [r2]
	ldr	r3, [r3]
	orr	r4, r4, r2
	orrs	r4, r4, r3
	sub	sp, sp, #16
	bne	.L254
	ldr	r3, .L268+12
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L254
	add	r2, r0, #8
	ldm	r2, {r2, r3}
	ldr	r5, .L268+16
	add	r7, r2, #24
	add	r8, r3, #12
.L258:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L256
	ldr	r3, [r5, #12]
	str	r3, [sp, #12]
	ldr	r3, [r5, #8]
	str	r3, [sp, #8]
	ldr	r3, [r5, #4]
	str	r3, [sp, #4]
	ldr	r3, [r5]
	mov	r2, #16
	str	r3, [sp]
	mov	r1, r8
	mov	r3, #40
	mov	r0, r7
	ldr	ip, .L268+20
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L267
.L256:
	add	r4, r4, #1
	cmp	r4, #4
	add	r5, r5, #80
	bne	.L258
.L254:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L267:
	ldr	r3, .L268+12
	ldr	r2, [r3]
	mov	r1, r4
	sub	r3, r2, #1
	ldr	r0, .L268+24
	ldr	r5, .L268+28
	mov	lr, pc
	bx	r5
	bl	loseLife
	mov	r3, #1
	mov	r1, #20
	ldr	r0, .L268+32
	str	r3, [r6, #288]
	str	r1, [r6, #292]
	mov	lr, pc
	bx	r5
	mov	r0, #0
	mov	r1, #60
	ldr	r2, .L268+36
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	ldr	r3, .L268+16
	add	r4, r4, r4, lsl #2
	add	r3, r3, r4, lsl #4
	str	r0, [r3, #16]
	str	r1, [r3, #60]
	b	.L254
.L269:
	.align	2
.L268:
	.word	automaticMovementActive
	.word	.LANCHOR0
	.word	automaticMovementActive2
	.word	.LANCHOR2
	.word	enemies
	.word	checkCollision
	.word	.LC40
	.word	mgba_printf
	.word	.LC38
	.word	enemyCount
	.size	checkPlayerEnemyCollision, .-checkPlayerEnemyCollision
	.section	.rodata.str1.4
	.align	2
.LC41:
	.ascii	"=== FRAME %d ===\000"
	.align	2
.LC42:
	.ascii	"Before update: dir=%d, frame=%d, isAnim=%d, xVel=%d"
	.ascii	", yVel=%d\000"
	.align	2
.LC43:
	.ascii	"Auto1: active=%d, step=%d\000"
	.align	2
.LC44:
	.ascii	"Auto2: active=%d, step=%d\000"
	.align	2
.LC45:
	.ascii	"Invincibility ended\000"
	.align	2
.LC46:
	.ascii	"Movement2[%d] = %d\000"
	.align	2
.LC47:
	.ascii	"squarePatternActive CHANGED: %d -> %d\000"
	.align	2
.LC48:
	.ascii	"SQUARE PATTERN ACTIVE - setting showAccessory=1\000"
	.align	2
.LC49:
	.ascii	"RIGHT TRIANGLE PATTERN ACTIVE - setting showAccesso"
	.ascii	"ry=1\000"
	.align	2
.LC50:
	.ascii	"ISOSCELES TRIANGLE PATTERN ACTIVE - setting showAcc"
	.ascii	"essory=1\000"
	.align	2
.LC51:
	.ascii	"NO PATTERN ACTIVE - setting showAccessory=0\000"
	.align	2
.LC52:
	.ascii	"EM PATTERN ACTIVE - setting showAccessory2=1\000"
	.align	2
.LC53:
	.ascii	"PAUSE CHECK: step=%d, movementType=%d\000"
	.align	2
.LC54:
	.ascii	"PAUSE STATE DETECTED: type=%d, dir=%d\000"
	.align	2
.LC55:
	.ascii	"PAUSE STATE - SHOOTING NOW! cooldown=%d, isShooting"
	.ascii	"=%d\000"
	.align	2
.LC56:
	.ascii	"EM PATTERN PAUSE: type=%d, cooldown=%d, isShooting="
	.ascii	"%d\000"
	.align	2
.LC57:
	.ascii	"EM PATTERN - FIRING BULLET!\000"
	.align	2
.LC58:
	.ascii	"PAUSE STATE - SHOOTING NOW!\000"
	.align	2
.LC59:
	.ascii	"=== EM CAMERA ACTIVE: Camera at (%d,%d) (player at "
	.ascii	"%d,%d) ===\000"
	.align	2
.LC60:
	.ascii	"Normal camera: following player at (%d,%d)\000"
	.align	2
.LC61:
	.ascii	"updatePlayer: state=%d, setting BG1=%d\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r5, .L404
	ldr	r1, [r5, #308]
	sub	sp, sp, #20
	ldr	r6, .L404+4
	add	r1, r1, #1
	ldr	r0, .L404+8
	str	r1, [r5, #308]
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #20]
	str	r3, [sp, #4]
	ldr	r3, [r4, #16]
	str	r3, [sp]
	ldr	r10, .L404+12
	ldr	r8, .L404+16
	ldr	r3, [r4, #40]
	ldr	r0, .L404+20
	ldr	r2, [r4, #44]
	ldr	r1, [r4, #36]
	ldr	r9, .L404+24
	ldr	r7, .L404+28
	mov	lr, pc
	bx	r6
	ldr	r2, [r10]
	ldr	r1, [r8]
	ldr	r0, .L404+32
	mov	lr, pc
	bx	r6
	ldr	r2, [r9]
	ldr	r1, [r7]
	ldr	r0, .L404+36
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #288]
	cmp	r3, #0
	beq	.L272
	ldr	r3, [r5, #292]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r5, #292]
	ble	.L389
.L272:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L274
	ldr	r1, [r9]
	cmp	r1, #23
	ble	.L390
.L274:
	bl	updatePlayerBullets
	ldr	r3, [r5, #288]
	cmp	r3, #0
	beq	.L391
.L275:
	ldr	fp, .L404+40
	ldr	r2, [r8]
	ldr	r3, [fp]
	add	r0, r4, #8
	cmp	r2, #0
	str	r3, [fp, #4]
	ldm	r0, {r0, ip}
	bne	.L276
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L392
	ldr	r1, [r4, #40]
	add	r3, r4, #16
	cmp	r1, #0
	ldm	r3, {r3, lr}
	bne	.L284
	add	r3, r3, r0
	add	lr, lr, ip
	str	r3, [r4, #8]
	str	lr, [r4, #12]
	str	r1, [r5, #300]
.L334:
	ldr	r3, [r9]
	cmp	r3, #23
	bgt	.L296
	mov	r2, #0
	ldr	r3, .L404+44
	ldr	fp, .L404+48
	str	r2, [fp]
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L393
.L297:
	ldr	r2, .L404+52
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L394
	ldr	r2, [r3]
	ldr	r3, .L404+56
	ldr	r3, [r3]
	orrs	r3, r3, r2
	movne	r3, #1
	strne	r3, [fp]
.L299:
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L302
.L300:
	ldr	r1, [r10]
	cmp	r1, #23
	ble	.L395
.L302:
	mov	r8, #0
.L301:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L307
	ldr	r3, [r9]
	cmp	r3, #23
	bgt	.L307
	ldr	r2, .L404+60
	ldr	r1, [r2, r3, lsl #2]
	sub	r3, r1, #10
	cmp	r3, #1
	bls	.L396
.L307:
	bl	updatePlayerBullets
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L329
	ldr	r3, [r5, #268]
	cmp	r3, #0
	bgt	.L311
	cmp	r8, #0
	beq	.L314
.L312:
	ldr	r0, .L404+64
	mov	lr, pc
	bx	r6
	ldr	r1, [r5, #268]
	cmp	r1, #0
	ldr	r2, [r5]
	bgt	.L315
	cmp	r2, #0
	bne	.L315
	mov	r0, r4
	bl	playerShootDuringPattern.part.0
.L314:
	ldr	r2, [r5, #276]
	add	r3, r4, #8
	cmp	r2, #0
	ldm	r3, {r3, r8}
	beq	.L317
	ldr	r2, .L404+44
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L397
.L317:
	sub	r7, r3, #88
	sub	r8, r8, #48
	cmp	r7, #16
	movge	r7, #16
	cmp	r8, #96
	movge	r8, #96
	bic	r7, r7, r7, asr #31
	bic	r8, r8, r8, asr #31
	mov	r2, r8
	mov	r1, r7
	ldr	r0, .L404+68
	str	r7, [r5, #280]
	str	r8, [r5, #284]
	str	r7, [r5, #316]
	str	r8, [r5, #320]
	mov	lr, pc
	bx	r6
.L388:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	cmn	r2, #15
	sub	r1, r2, r7
	mvnlt	r2, #14
	str	r1, [r4]
	sub	r1, r3, r8
	str	r1, [r4, #4]
	strlt	r2, [r4, #8]
	blt	.L320
	cmp	r2, #207
	movgt	r2, #207
	strgt	r2, [r4, #8]
.L320:
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4, #12]
	blt	.L322
	cmp	r3, #208
	movgt	r3, #208
	strgt	r3, [r4, #12]
.L322:
	ldr	r3, [r5, #324]
	add	r3, r3, #1
	cmp	r3, #59
	ldr	r9, .L404+72
	str	r3, [r5, #324]
	ble	.L323
	ldr	r1, [r9]
	cmp	r1, #6
	movne	r2, r7
	mvneq	r2, #0
	ldr	r0, .L404+76
	mov	lr, pc
	bx	r6
	mov	r3, #0
	str	r3, [r5, #324]
.L323:
	mov	r1, #67108864
	ldr	r3, [r9]
	lsl	r2, r7, #16
	cmp	r3, #6
	lsl	r3, r8, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strhne	r2, [r1, #16]	@ movhi
	strheq	r2, [r1, #24]	@ movhi
	strhne	r3, [r1, #18]	@ movhi
	strhne	r2, [r1, #20]	@ movhi
	strhne	r3, [r1, #22]	@ movhi
	strhne	r2, [r1, #24]	@ movhi
	add	r2, r4, #8
	strheq	r3, [r1, #26]	@ movhi
	strhne	r3, [r1, #26]	@ movhi
	strheq	r3, [r1, #22]	@ movhi
	ldm	r2, {r2, r3}
	sub	r2, r2, r7
	sub	r3, r3, r8
	stm	r4, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L392:
	ldr	r1, .L404+80
	ldrh	r1, [r1]
	tst	r1, #64
	mvneq	lr, #1
	str	r3, [r4, #20]
	streq	lr, [r4, #20]
	moveq	lr, #1
	streq	lr, [r4, #36]
	streq	lr, [r4, #40]
	ands	lr, r1, #128
	str	r3, [r4, #16]
	bne	.L398
	str	lr, [r4, #36]
	mov	lr, #1
	str	lr, [r4, #40]
	mov	lr, #2
	tst	r1, #32
	str	lr, [r4, #20]
	and	r1, r1, #16
	beq	.L339
	cmp	r1, #0
	beq	.L340
.L283:
	ldr	r1, [r4, #40]
	cmp	r1, #0
	bne	.L284
	add	lr, lr, ip
	str	r0, [r4, #8]
	str	lr, [r4, #12]
	str	r1, [r5, #300]
	b	.L286
.L276:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	add	r3, r4, #16
	ldm	r3, {r3, lr}
	beq	.L384
	ldr	r1, [r4, #32]
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r4, #32]
	ble	.L336
.L384:
	add	r3, r3, r0
	add	lr, lr, ip
	str	r3, [r4, #8]
	str	lr, [r4, #12]
.L331:
	ldr	r3, [r10]
	cmp	r3, #23
	bgt	.L287
	ldr	r2, [r5, #312]
	ldr	r1, [fp, #12]
	cmp	r2, r1
	bne	.L399
	cmp	r1, #0
	bne	.L400
.L292:
	ldr	r3, [r5, #304]
	cmp	r3, #0
	bne	.L401
	ldr	r3, [r5, #296]
	cmp	r3, #0
	beq	.L295
	ldr	r0, .L404+84
	mov	lr, pc
	bx	r6
	mov	r3, #1
	str	r3, [r5, #300]
	ldr	r3, [r7]
	b	.L293
.L339:
	mov	lr, #2
.L280:
	cmp	r1, #0
	mov	r1, #2
	mvn	r3, #1
	str	r1, [r4, #36]
	mov	r1, #1
	str	r3, [r4, #16]
	str	r1, [r4, #40]
	bne	.L284
.L282:
	mov	r1, #3
	mov	r3, #2
	str	r1, [r4, #36]
	mov	r1, #1
	str	r3, [r4, #16]
	str	r1, [r4, #40]
.L284:
	ldr	r1, [r4, #32]
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r4, #32]
	bgt	.L385
.L336:
	ldr	r1, [r4, #44]
	add	r3, r3, r0
	cmp	r1, #3
	movgt	r1, #1
	str	r3, [r4, #8]
	mov	r3, #10
	addle	r1, r1, #1
	add	lr, lr, ip
	cmp	r2, #0
	str	r1, [r4, #44]
	str	lr, [r4, #12]
	str	r3, [r4, #32]
	bne	.L331
.L287:
	mov	r2, #0
	ldr	r3, [r7]
	str	r2, [r5, #300]
.L293:
	cmp	r3, #0
	bne	.L334
.L286:
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L300
	bl	updatePlayerBullets
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L327
	ldr	r3, [r5, #268]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r5, #268]
	b	.L314
.L296:
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L300
	bl	updatePlayerBullets
	ldr	r8, [r5]
	cmp	r8, #0
	beq	.L309
.L327:
	mov	r8, #0
.L329:
	ldr	r3, [r5, #4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r5, #4]
	ble	.L402
.L309:
	ldr	r3, [r5, #268]
	cmp	r3, #0
	ble	.L314
.L311:
	sub	r3, r3, #1
	cmp	r8, #0
	str	r3, [r5, #268]
	beq	.L314
	cmp	r3, #0
	bne	.L314
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L312
	b	.L314
.L391:
	mov	r0, r4
	bl	checkPlayerEnemyCollision
	b	.L275
.L397:
	str	r8, [sp]
	add	r7, r5, #280
	ldm	r7, {r7, r8}
	ldr	r0, .L404+88
	mov	r1, r7
	mov	r2, r8
	mov	lr, pc
	bx	r6
	b	.L388
.L402:
	mov	r2, #0
	mov	r3, #4
	str	r2, [r5]
	str	r3, [r5, #268]
	b	.L314
.L390:
	ldr	r3, .L404+60
	ldr	r0, .L404+92
	ldr	r2, [r3, r1, lsl #2]
	mov	lr, pc
	bx	r6
	b	.L274
.L385:
	add	r3, r3, r0
	add	lr, lr, ip
	str	r3, [r4, #8]
	str	lr, [r4, #12]
	b	.L287
.L389:
	mov	r3, #0
	ldr	r0, .L404+96
	str	r3, [r5, #288]
	mov	lr, pc
	bx	r6
	b	.L272
.L398:
	tst	r1, #32
	ldr	lr, [r4, #20]
	and	r1, r1, #16
	beq	.L280
	cmp	r1, #0
	beq	.L282
	cmp	lr, #0
	bne	.L283
	str	r0, [r4, #8]
	str	ip, [r4, #12]
	str	lr, [r4, #40]
	str	lr, [r4, #44]
	b	.L287
.L394:
	ldr	r3, .L404+60
	ldr	r2, [r9]
	ldr	r2, [r3, r2, lsl #2]
	cmp	r2, #1
	movle	r3, #0
	movgt	r3, #1
	cmp	r2, #0
	orreq	r3, r3, #1
	str	r3, [fp]
	b	.L299
.L399:
	ldr	r0, .L404+100
	mov	lr, pc
	bx	r6
	ldr	r1, [r5, #312]
	cmp	r1, #0
	str	r1, [fp, #12]
	beq	.L292
	b	.L400
.L393:
	mov	r2, #1
	ldr	r0, .L404+104
	str	r2, [fp]
	mov	lr, pc
	bx	r6
	ldr	r3, .L404+44
	b	.L297
.L400:
	ldr	r0, .L404+108
	mov	lr, pc
	bx	r6
	mov	r3, #1
	str	r3, [r5, #300]
	ldr	r3, [r7]
	b	.L293
.L396:
	ldr	r3, [r5]
	ldr	r2, [r5, #268]
	ldr	r0, .L404+112
	mov	lr, pc
	bx	r6
	ldr	r3, .L404+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L307
	ldr	r3, [r5, #268]
	cmp	r3, #0
	bgt	.L307
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L307
	ldr	r0, .L404+116
	mov	lr, pc
	bx	r6
	mov	r0, r4
	bl	playerShootDuringEMPattern
	b	.L307
.L395:
	ldr	r3, .L404+120
	ldr	r8, [r3, r1, lsl #2]
	ldr	r0, .L404+124
	mov	r2, r8
	mov	lr, pc
	bx	r6
	sub	r3, r8, #8
	cmp	r3, #3
	bhi	.L302
	ldrne	r2, .L404+128
	addne	r3, r2, r3, lsl #2
	moveq	r2, #0
	mov	r1, r8
	ldrne	r2, [r3, #36]
	ldr	r0, .L404+132
	mov	lr, pc
	bx	r6
	ldr	r1, [r5, #268]
	cmp	r1, #0
	ble	.L403
.L304:
	bl	updatePlayerBullets
	mov	r8, #1
	b	.L301
.L295:
	ldr	r0, .L404+136
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [sp, #12]
	ldr	r3, [r7]
	str	r1, [r5, #300]
	b	.L293
.L401:
	ldr	r0, .L404+140
	mov	lr, pc
	bx	r6
	mov	r3, #1
	str	r3, [r5, #300]
	ldr	r3, [r7]
	b	.L293
.L403:
	ldr	r2, [r5]
	cmp	r2, #0
	bne	.L304
	ldr	r0, .L404+144
	mov	lr, pc
	bx	r6
	ldr	r1, [r5, #268]
	cmp	r1, #0
	ldr	r2, [r5]
	bgt	.L305
	cmp	r2, #0
	bne	.L305
	mov	r0, r4
	bl	playerShootDuringPattern.part.0
	b	.L304
.L340:
	mov	lr, #2
	b	.L282
.L315:
	ldr	r0, .L404+148
	mov	lr, pc
	bx	r6
	b	.L314
.L305:
	ldr	r0, .L404+148
	mov	lr, pc
	bx	r6
	b	.L304
.L405:
	.align	2
.L404:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC41
	.word	currentMovementStep
	.word	automaticMovementActive
	.word	.LC42
	.word	currentMovementStep2
	.word	automaticMovementActive2
	.word	.LC43
	.word	.LC44
	.word	.LANCHOR2
	.word	emPatternActive2
	.word	showAccessory2
	.word	rightTrianglePatternActive2
	.word	isoscelesTrianglePatternActive2
	.word	movementSequence2
	.word	.LC58
	.word	.LC60
	.word	state
	.word	.LC61
	.word	buttons
	.word	.LC50
	.word	.LC59
	.word	.LC46
	.word	.LC45
	.word	.LC47
	.word	.LC52
	.word	.LC48
	.word	.LC56
	.word	.LC57
	.word	movementSequence
	.word	.LC53
	.word	.LANCHOR1
	.word	.LC54
	.word	.LC51
	.word	.LC49
	.word	.LC55
	.word	.LC6
	.size	updatePlayer, .-updatePlayer
	.section	.rodata.str1.4
	.align	2
.LC62:
	.ascii	"Life added! Total lives: %d\000"
	.text
	.align	2
	.global	addPlayerLife
	.syntax unified
	.arm
	.type	addPlayerLife, %function
addPlayerLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L412
	ldr	r1, [r3]
	cmp	r1, #2
	bxgt	lr
	push	{r4, lr}
	add	r1, r1, #1
	ldr	r0, .L412+4
	ldr	r2, .L412+8
	str	r1, [r3]
	str	r1, [r3, #4]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L413:
	.align	2
.L412:
	.word	.LANCHOR2
	.word	.LC62
	.word	mgba_printf
	.size	addPlayerLife, .-addPlayerLife
	.align	2
	.global	updatePlayerLives
	.syntax unified
	.arm
	.type	updatePlayerLives, %function
updatePlayerLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L415
	ldr	r2, [r3]
	str	r2, [r3, #4]
	bx	lr
.L416:
	.align	2
.L415:
	.word	.LANCHOR2
	.size	updatePlayerLives, .-updatePlayerLives
	.section	.rodata.str1.4
	.align	2
.LC63:
	.ascii	"Player lives reset to 3 for new level\000"
	.text
	.align	2
	.global	resetPlayerLivesForNewLevel
	.syntax unified
	.arm
	.type	resetPlayerLivesForNewLevel, %function
resetPlayerLivesForNewLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #3
	mov	r2, #0
	push	{r4, lr}
	ldr	r1, .L419
	ldr	r3, .L419+4
	ldr	r4, .L419+8
	ldr	r0, .L419+12
	str	ip, [r1]
	str	ip, [r1, #4]
	str	r2, [r3, #288]
	str	r2, [r3, #292]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L420:
	.align	2
.L419:
	.word	.LANCHOR2
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC63
	.size	resetPlayerLivesForNewLevel, .-resetPlayerLivesForNewLevel
	.align	2
	.global	resetPlayerInvincibility
	.syntax unified
	.arm
	.type	resetPlayerInvincibility, %function
resetPlayerInvincibility:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L422
	str	r2, [r3, #288]
	str	r2, [r3, #292]
	bx	lr
.L423:
	.align	2
.L422:
	.word	.LANCHOR0
	.size	resetPlayerInvincibility, .-resetPlayerInvincibility
	.align	2
	.global	setPlayerInvincible
	.syntax unified
	.arm
	.type	setPlayerInvincible, %function
setPlayerInvincible:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, r0
	mov	ip, #1
	push	{r4, lr}
	ldr	r3, .L426
	ldr	r0, .L426+4
	ldr	r2, .L426+8
	str	ip, [r3, #288]
	str	r1, [r3, #292]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L427:
	.align	2
.L426:
	.word	.LANCHOR0
	.word	.LC38
	.word	mgba_printf
	.size	setPlayerInvincible, .-setPlayerInvincible
	.section	.rodata.str1.4
	.align	2
.LC64:
	.ascii	"TILE504 CHANGED: %d -> %d\000"
	.text
	.align	2
	.global	testAccessoryVisibility
	.syntax unified
	.arm
	.type	testAccessoryVisibility, %function
testAccessoryVisibility:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L434
	ldr	r3, .L434+4
	ldrh	r2, [r2, #76]
	ldr	r1, [r3, #16]
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	cmp	r1, r2
	bxeq	lr
	str	lr, [sp, #-4]!
	ldr	r0, .L434+8
	sub	sp, sp, #12
	ldr	ip, .L434+12
	str	r2, [sp, #4]
	mov	lr, pc
	bx	ip
	ldr	r2, [sp, #4]
	ldr	r3, .L434+4
	str	r2, [r3, #16]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L435:
	.align	2
.L434:
	.word	shadowOAM
	.word	.LANCHOR2
	.word	.LC64
	.word	mgba_printf
	.size	testAccessoryVisibility, .-testAccessoryVisibility
	.global	invincibilityTimer
	.global	playerInvincible
	.global	UP_FRAMES
	.global	LEFT_FRAMES
	.global	DOWN_FRAMES
	.global	emCameraActive
	.global	cameraMoveSpeed
	.global	isCameraMoving
	.global	worldCameraTargetY
	.global	worldCameraTargetX
	.global	worldCameraY
	.global	worldCameraX
	.global	playerShootTimer
	.global	playerIsShooting
	.global	playerShootCooldown
	.global	playerBullets
	.global	squarePatternActive
	.global	isoscelesTrianglePatternActive
	.global	rightTrianglePatternActive
	.global	showAccessory
	.global	ACCESSORY_PALETTE
	.global	ACCESSORY_TILE
	.global	lifeSpriteOAMIndex
	.global	playerLivesDisplayed
	.global	playerLives
	.global	playerSpriteHeight
	.global	playerSpriteWidth
	.global	playerSpriteBaseIndex
	.global	player
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	playerLives, %object
	.size	playerLives, 4
playerLives:
	.word	3
	.type	playerLivesDisplayed, %object
	.size	playerLivesDisplayed, 4
playerLivesDisplayed:
	.word	3
	.type	lifeSpriteOAMIndex, %object
	.size	lifeSpriteOAMIndex, 4
lifeSpriteOAMIndex:
	.word	127
	.type	lastSquarePattern.3, %object
	.size	lastSquarePattern.3, 4
lastSquarePattern.3:
	.word	-1
	.type	lastTile504.0, %object
	.size	lastTile504.0, 4
lastTile504.0:
	.word	-1
	.type	cameraMoveSpeed, %object
	.size	cameraMoveSpeed, 4
cameraMoveSpeed:
	.word	2
	.type	playerSpriteHeight, %object
	.size	playerSpriteHeight, 4
playerSpriteHeight:
	.word	64
	.type	playerSpriteWidth, %object
	.size	playerSpriteWidth, 4
playerSpriteWidth:
	.word	64
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	playerIsShooting, %object
	.size	playerIsShooting, 4
playerIsShooting:
	.space	4
	.type	playerShootTimer, %object
	.size	playerShootTimer, 4
playerShootTimer:
	.space	4
	.type	playerBullets, %object
	.size	playerBullets, 260
playerBullets:
	.space	260
	.type	playerShootCooldown, %object
	.size	playerShootCooldown, 4
playerShootCooldown:
	.space	4
	.type	bulletFrameCount.1, %object
	.size	bulletFrameCount.1, 4
bulletFrameCount.1:
	.space	4
	.type	emCameraActive, %object
	.size	emCameraActive, 4
emCameraActive:
	.space	4
	.type	worldCameraX, %object
	.size	worldCameraX, 4
worldCameraX:
	.space	4
	.type	worldCameraY, %object
	.size	worldCameraY, 4
worldCameraY:
	.space	4
	.type	playerInvincible, %object
	.size	playerInvincible, 4
playerInvincible:
	.space	4
	.type	invincibilityTimer, %object
	.size	invincibilityTimer, 4
invincibilityTimer:
	.space	4
	.type	isoscelesTrianglePatternActive, %object
	.size	isoscelesTrianglePatternActive, 4
isoscelesTrianglePatternActive:
	.space	4
	.type	showAccessory, %object
	.size	showAccessory, 4
showAccessory:
	.space	4
	.type	rightTrianglePatternActive, %object
	.size	rightTrianglePatternActive, 4
rightTrianglePatternActive:
	.space	4
	.type	frameCount.4, %object
	.size	frameCount.4, 4
frameCount.4:
	.space	4
	.type	squarePatternActive, %object
	.size	squarePatternActive, 4
squarePatternActive:
	.space	4
	.type	worldCameraTargetX, %object
	.size	worldCameraTargetX, 4
worldCameraTargetX:
	.space	4
	.type	worldCameraTargetY, %object
	.size	worldCameraTargetY, 4
worldCameraTargetY:
	.space	4
	.type	debugTimer.2, %object
	.size	debugTimer.2, 4
debugTimer.2:
	.space	4
	.type	isCameraMoving, %object
	.size	isCameraMoving, 4
isCameraMoving:
	.space	4
	.type	playerSpriteBaseIndex, %object
	.size	playerSpriteBaseIndex, 4
playerSpriteBaseIndex:
	.space	4
	.type	player, %object
	.size	player, 56
player:
	.space	56
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	CSWTCH.199, %object
	.size	CSWTCH.199, 16
CSWTCH.199:
	.word	2
	.word	3
	.word	1
	.word	0
	.type	LEFT_FRAMES, %object
	.size	LEFT_FRAMES, 20
LEFT_FRAMES:
	.word	8
	.word	264
	.word	16
	.word	520
	.word	16
	.type	CSWTCH.213, %object
	.size	CSWTCH.213, 12
CSWTCH.213:
	.word	2
	.word	3
	.word	1
	.type	UP_FRAMES, %object
	.size	UP_FRAMES, 8
UP_FRAMES:
	.word	512
	.word	768
	.type	DOWN_FRAMES, %object
	.size	DOWN_FRAMES, 8
DOWN_FRAMES:
	.word	0
	.word	256
	.type	ACCESSORY_PALETTE, %object
	.size	ACCESSORY_PALETTE, 4
ACCESSORY_PALETTE:
	.word	6
	.type	ACCESSORY_TILE, %object
	.size	ACCESSORY_TILE, 4
ACCESSORY_TILE:
	.word	432
	.ident	"GCC: (devkitARM release 66) 15.1.0"
