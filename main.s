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
	.file	"main.c"
	.text
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	setupSoundInterrupts
	.size	setupInterrupts, .-setupInterrupts
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Playing: Madao Theme (loop: %d)\000"
	.align	2
.LC2:
	.ascii	"Playing: Intro Theme (loop: %d)\000"
	.align	2
.LC3:
	.ascii	"Playing: Hata Sound (loop: %d)\000"
	.text
	.align	2
	.global	playMusic
	.syntax unified
	.arm
	.type	playMusic, %function
playMusic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	ldr	ip, [r3]
	cmp	ip, r0
	bxeq	lr
	push	{r4, lr}
	ldr	r2, .L19+4
	sub	sp, sp, #8
	str	r0, [sp, #4]
	mov	r4, r1
	mov	lr, pc
	bx	r2
	ldr	r0, [sp, #4]
	ldr	r3, .L19
	ldr	r2, .L19+8
	str	r0, [r3]
	cmp	r0, #4
	bhi	.L6
	ldrb	r0, [r2, r0]
	add	pc, pc, r0, lsl #2
.Lrtx9:
	nop
	.section	.rodata
.L9:
	.byte	(.L13-.Lrtx9-4)/4
	.byte	(.L12-.Lrtx9-4)/4
	.byte	(.L11-.Lrtx9-4)/4
	.byte	(.L10-.Lrtx9-4)/4
	.byte	(.L8-.Lrtx9-4)/4
	.text
	.p2align 2
.L10:
	ldr	r3, .L19+12
	ldr	r0, .L19+16
	ldr	r1, [r3]
	mov	r2, r4
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	mov	r1, r4
	ldr	r0, .L19+24
	ldr	r3, .L19+28
	mov	lr, pc
	bx	r3
.L6:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L8:
	ldr	r3, .L19+32
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L19+36
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	mov	r1, r4
	ldr	r0, .L19+40
	ldr	r3, .L19+28
	mov	lr, pc
	bx	r3
	b	.L6
.L13:
	ldr	r3, .L19+44
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L19+48
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	b	.L6
.L12:
	ldr	r3, .L19+52
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L19+56
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	b	.L6
.L11:
	ldr	r3, .L19+60
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L19+64
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	mov	r1, r4
	ldr	r0, .L19+68
	ldr	r3, .L19+28
	mov	lr, pc
	bx	r3
	b	.L6
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	stopSounds
	.word	.L9
	.word	intro1_length
	.word	intro1_data
	.word	playSoundA
	.word	.LC2
	.word	mgba_printf
	.word	hata_length
	.word	hata_data
	.word	.LC3
	.word	KatsuraTheme_length
	.word	KatsuraTheme_data
	.word	boss_length
	.word	boss_data
	.word	Madao_length
	.word	Madao_data
	.word	.LC1
	.size	playMusic, .-playMusic
	.align	2
	.global	updateMusicForState
	.syntax unified
	.arm
	.type	updateMusicForState, %function
updateMusicForState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L46
	ldr	r2, .L46+4
	ldr	r3, [r3]
	push	{r4, lr}
	cmp	r3, #9
	bhi	.L21
	ldrb	r3, [r2, r3]
	add	pc, pc, r3, lsl #2
.Lrtx24:
	nop
	.section	.rodata
.L24:
	.byte	(.L28-.Lrtx24-4)/4
	.byte	(.L21-.Lrtx24-4)/4
	.byte	(.L26-.Lrtx24-4)/4
	.byte	(.L21-.Lrtx24-4)/4
	.byte	(.L27-.Lrtx24-4)/4
	.byte	(.L27-.Lrtx24-4)/4
	.byte	(.L26-.Lrtx24-4)/4
	.byte	(.L25-.Lrtx24-4)/4
	.byte	(.L25-.Lrtx24-4)/4
	.byte	(.L23-.Lrtx24-4)/4
	.text
	.p2align 2
.L23:
	ldr	r3, .L46+8
	ldr	r2, [r3]
	cmp	r2, #4
	beq	.L21
	ldr	r2, .L46+12
	mov	lr, pc
	bx	r2
	mov	ip, #4
	ldr	r3, .L46+8
	ldr	r1, .L46+16
	ldr	r0, .L46+20
	ldr	r1, [r1]
	str	ip, [r3]
	mov	r2, #1
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r0, .L46+28
	ldr	r3, .L46+32
	mov	lr, pc
	bx	r3
.L21:
	pop	{r4, lr}
	bx	lr
.L25:
	ldr	r3, .L46+8
	ldr	r2, [r3]
	cmp	r2, #3
	beq	.L21
	ldr	r2, .L46+12
	mov	lr, pc
	bx	r2
	mov	ip, #3
	ldr	r3, .L46+8
	ldr	r1, .L46+36
	str	ip, [r3]
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, .L46+40
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r0, .L46+44
	ldr	r3, .L46+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L26:
	ldr	r3, .L46+8
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L21
	ldr	r2, .L46+12
	mov	lr, pc
	bx	r2
	mov	ip, #0
	ldr	r3, .L46+8
	ldr	r1, .L46+48
	str	ip, [r3]
	mov	r2, #1
	ldr	r1, [r1]
	ldr	r0, .L46+52
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L27:
	ldr	r3, .L46+8
	ldr	r2, [r3]
	cmn	r2, #1
	beq	.L21
	ldr	r2, .L46+12
	mov	lr, pc
	bx	r2
	mvn	r2, #0
	ldr	r3, .L46+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	ldr	r3, .L46+8
	ldr	r2, [r3]
	cmp	r2, #2
	beq	.L21
	ldr	r2, .L46+12
	mov	lr, pc
	bx	r2
	mov	ip, #2
	ldr	r3, .L46+8
	ldr	r1, .L46+56
	str	ip, [r3]
	mov	r2, #1
	ldr	r1, [r1]
	ldr	r0, .L46+60
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r0, .L46+64
	ldr	r3, .L46+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	.LANCHOR1
	.word	.L24
	.word	.LANCHOR0
	.word	stopSounds
	.word	hata_length
	.word	hata_data
	.word	playSoundA
	.word	.LC3
	.word	mgba_printf
	.word	intro1_length
	.word	intro1_data
	.word	.LC2
	.word	KatsuraTheme_length
	.word	KatsuraTheme_data
	.word	Madao_length
	.word	Madao_data
	.word	.LC1
	.size	updateMusicForState, .-updateMusicForState
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"Stopped Madao for cutscene\000"
	.text
	.align	2
	.global	stopMadaoForCutscene
	.syntax unified
	.arm
	.type	stopMadaoForCutscene, %function
stopMadaoForCutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	ldr	r2, [r3]
	cmp	r2, #2
	bxne	lr
	push	{r4, lr}
	ldr	r2, .L54+4
	mov	lr, pc
	bx	r2
	mvn	r1, #0
	ldr	r3, .L54
	ldr	r0, .L54+8
	ldr	r2, .L54+12
	str	r1, [r3]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	stopSounds
	.word	.LC5
	.word	mgba_printf
	.size	stopMadaoForCutscene, .-stopMadaoForCutscene
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"LSHOULDER pressed: Life added! Lives now: %d\000"
	.align	2
.LC7:
	.ascii	"Restored original tile 10 for PLAYING\000"
	.align	2
.LC8:
	.ascii	"Restored original tile 10 for PLAYING2\000"
	.align	2
.LC9:
	.ascii	"LSHOULDER pressed: Already at max lives (%d)\000"
	.align	2
.LC10:
	.ascii	"LOW HEALTH: PLAYING - Made tile 10 red\000"
	.align	2
.LC11:
	.ascii	"LOW HEALTH: PLAYING2 - Made tile 10 red\000"
	.text
	.align	2
	.global	togglePaletteRows
	.syntax unified
	.arm
	.type	togglePaletteRows, %function
togglePaletteRows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L102
	ldrh	r3, [r4, #4]
	tst	r3, #512
	sub	sp, sp, #12
	bne	.L97
	ldr	r5, .L102+4
.L57:
	ldr	r3, [r5]
	cmp	r3, #1
	beq	.L100
.L56:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L97:
	ldrh	r3, [r4, #6]
	ands	r3, r3, #512
	ldr	r5, .L102+4
	bne	.L57
	ldr	r1, [r5]
	cmp	r1, #2
	bgt	.L58
	ldr	r2, .L102+8
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r2
	ldr	r1, [r5]
	ldr	r3, .L102+12
	add	r1, r1, #1
	ldr	r0, .L102+16
	str	r1, [r5]
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	cmp	r2, #2
	ldr	r3, [sp, #4]
	beq	.L101
	cmp	r2, #6
	bne	.L56
	ldr	ip, .L102+20
.L64:
	lsl	r2, r3, #1
	add	r2, r2, #100663296
	add	r0, r2, #57344
	ldrh	r1, [r0]
	and	r1, r1, ip
	strh	r1, [r0]	@ movhi
	add	r2, r2, #59392
	ldrh	r1, [r2]
	add	r3, r3, #1
	and	r1, r1, ip
	cmp	r3, #1024
	strh	r1, [r2]	@ movhi
	bne	.L64
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L65
	mov	r2, #0
	ldr	r3, .L102+24
	ldr	r1, .L102+28
.L66:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L66
	ldr	r0, .L102+32
	ldr	r3, .L102+12
	str	r2, [r4, #12]
	mov	lr, pc
	bx	r3
	b	.L57
.L100:
	ldr	r3, [r4]
	cmp	r3, #2
	beq	.L76
	cmp	r3, #6
	bne	.L56
.L77:
	mov	r1, #0
	ldr	ip, .L102+20
.L73:
	lsl	r3, r1, #1
	add	r3, r3, #100663296
	add	r0, r3, #57344
	ldrh	r2, [r0]
	and	r2, r2, ip
	orr	r2, r2, #8192
	strh	r2, [r0]	@ movhi
	add	r3, r3, #59392
	ldrh	r2, [r3]
	add	r1, r1, #1
	and	r2, r2, ip
	orr	r2, r2, #8192
	cmp	r1, #1024
	strh	r2, [r3]	@ movhi
	bne	.L73
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L56
	ldr	r3, .L102+24
	ldr	r2, .L102+28
.L74:
	ldrh	r1, [r3], #2
	cmp	r3, r2
	bne	.L74
	ldr	r3, .L102+24
	ldr	r1, .L102+36
	ldr	r2, .L102+28
.L75:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L75
	mov	r2, #1
	ldr	r0, .L102+40
	ldr	r3, .L102+12
	str	r2, [r4, #20]
	mov	lr, pc
	bx	r3
	b	.L56
.L58:
	ldr	r0, .L102+44
	ldr	r3, .L102+12
	mov	lr, pc
	bx	r3
	b	.L57
.L61:
	ldr	r3, [r5]
	cmp	r3, #1
	bne	.L56
.L76:
	mov	r2, #0
	ldr	r0, .L102+48
	ldr	ip, .L102+20
.L69:
	lsl	r1, r2, #1
	ldrh	r3, [r0, r1]
	add	r2, r2, #1
	and	r3, r3, ip
	orr	r3, r3, #4096
	cmp	r2, #1024
	strh	r3, [r0, r1]	@ movhi
	bne	.L69
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L56
	ldr	r3, .L102+24
	ldr	r2, .L102+28
.L71:
	ldrh	r1, [r3], #2
	cmp	r3, r2
	bne	.L71
	ldr	r3, .L102+24
	ldr	r1, .L102+36
	ldr	r2, .L102+28
.L72:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L72
	mov	r2, #1
	ldr	r0, .L102+52
	ldr	r3, .L102+12
	str	r2, [r4, #16]
	mov	lr, pc
	bx	r3
	b	.L56
.L101:
	ldr	r0, .L102+48
	ldr	ip, .L102+20
.L60:
	lsl	r1, r3, #1
	ldrh	r2, [r0, r1]
	add	r3, r3, #1
	and	r2, r2, ip
	cmp	r3, #1024
	strh	r2, [r0, r1]	@ movhi
	bne	.L60
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L61
	mov	r2, #0
	ldr	r3, .L102+24
	ldr	r1, .L102+28
.L62:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L62
	ldr	r0, .L102+56
	ldr	r3, .L102+12
	str	r2, [r4, #8]
	mov	lr, pc
	bx	r3
	b	.L57
.L65:
	ldr	r3, [r5]
	cmp	r3, #1
	bne	.L56
	b	.L77
.L103:
	.align	2
.L102:
	.word	.LANCHOR1
	.word	playerLives
	.word	addPlayerLife
	.word	mgba_printf
	.word	.LC6
	.word	4095
	.word	100696384
	.word	100696416
	.word	.LC8
	.word	4369
	.word	.LC11
	.word	.LC9
	.word	100716544
	.word	.LC10
	.word	.LC7
	.size	togglePaletteRows, .-togglePaletteRows
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	push	{r4, r5, r6, lr}
	ldr	lr, .L106
	mov	r2, #83886080
	strh	lr, [ip]	@ movhi
	ldr	r1, .L106+4
	ldr	r5, .L106+8
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r0, .L106+12
	ldr	r3, .L106+16
	mov	lr, pc
	bx	r3
	ldr	r0, .L106+20
	ldr	r3, .L106+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+36
	mov	lr, pc
	bx	r3
	mov	r3, #32
	mov	r4, #0
	ldr	r2, .L106+40
	ldr	r0, .L106+44
	ldr	r1, .L106+48
	str	r3, [r0]
	str	r3, [r2]
	ldr	r3, .L106+52
	str	r4, [r1]
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+60
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L106+64
	mov	lr, pc
	bx	r5
	ldr	r3, .L106+68
	ldr	r1, .L106+72
	str	r4, [r3]
	ldr	r2, .L106+76
	ldr	r3, .L106+80
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	ldr	r0, .L106+84
	ldr	r1, .L106+88
	ldr	r2, .L106+92
	ldr	r3, .L106+96
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	ldr	ip, .L106+100
	ldr	r0, .L106+104
	ldr	r1, .L106+108
	ldr	r2, .L106+112
	ldr	r3, .L106+116
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	1028
	.word	STARTPal
	.word	DMANow
	.word	STARTBitmap
	.word	drawFullscreenImage4
	.word	player
	.word	initPlayer
	.word	resetEnemies
	.word	resetCollisionSystem
	.word	resetCollisionSystem2
	.word	playerSpriteWidth
	.word	playerSpriteHeight
	.word	playerSpriteBaseIndex
	.word	initPlayerLives
	.word	resetPlayerLivesForNewLevel
	.word	hideSprites
	.word	shadowOAM
	.word	automaticMovementActive2
	.word	automaticMovementActive
	.word	currentMovementStep2
	.word	showAccessory
	.word	currentMovementStep
	.word	rightTrianglePatternActive
	.word	isoscelesTrianglePatternActive
	.word	squarePatternActive
	.word	sequenceComplete
	.word	emPatternActive2
	.word	rightTrianglePatternActive2
	.word	isoscelesTrianglePatternActive2
	.word	.LANCHOR1
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L110
	mov	lr, pc
	bx	r3
	ldr	r0, .L110+4
	ldr	r3, .L110+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+56
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L111:
	.align	2
.L110:
	.word	mgba_open
	.word	player
	.word	initPlayer
	.word	initPlayerBullets
	.word	initPlayerLives
	.word	initEnemies
	.word	initBoss
	.word	hideSprites
	.word	resetCollisionSystem
	.word	resetCollisionSystem2
	.word	initButtons
	.word	initButtons2
	.word	initButtonEffects
	.word	setupSounds
	.word	setupSoundInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L117
	ldrh	r2, [r3, #4]
	tst	r2, #2
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #2
	bxne	lr
	b	goToStart
.L118:
	.align	2
.L117:
	.word	.LANCHOR1
	.size	instructions, .-instructions
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	push	{r4, lr}
	ldr	lr, .L121
	mov	r2, #83886080
	strh	lr, [ip]	@ movhi
	ldr	r1, .L121+4
	ldr	r4, .L121+8
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L121+12
	ldr	r3, .L121+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L121+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L121+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L121+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L122:
	.align	2
.L121:
	.word	1028
	.word	INSTRUCTIONSPal
	.word	DMANow
	.word	INSTRUCTIONSBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	shadowOAM
	.word	.LANCHOR1
	.size	goToInstructions, .-goToInstructions
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"Starting Mode 0 cutscene: Player walking across scr"
	.ascii	"een\000"
	.align	2
.LC13:
	.ascii	"Mode 0 cutscene: Player starts at X=%d\000"
	.text
	.align	2
	.global	goToMode0Cutscene
	.syntax unified
	.arm
	.type	goToMode0Cutscene, %function
goToMode0Cutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L129
	ldr	r0, .L129+4
	ldr	r7, .L129+8
	mov	lr, pc
	bx	r7
	ldr	r3, [r5]
	cmp	r3, #3
	beq	.L124
	ldr	r3, .L129+12
	mov	lr, pc
	bx	r3
	mov	ip, #3
	ldr	r3, .L129+16
	ldr	r0, .L129+20
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L129+24
	str	ip, [r5]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r0, .L129+28
	mov	lr, pc
	bx	r7
.L124:
	mov	r2, #4096
	mov	r3, #67108864
	mov	r4, #0
	ldr	r8, .L129+32
	strh	r2, [r3]	@ movhi
	ldr	r3, .L129+36
	ldr	r6, .L129+40
	str	r4, [r8, #24]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L129+44
	ldr	r1, .L129+48
	mov	lr, pc
	bx	r6
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L129+52
	ldr	r1, .L129+56
	mov	lr, pc
	bx	r6
	mvn	r2, #63
	mov	lr, #1
	mov	ip, #2
	mov	r0, #3
	mov	r1, #10
	ldr	r3, .L129+60
	str	r2, [r5, #4]
	str	r2, [r3]
	str	r2, [r3, #8]
	ldr	r2, [r5, #8]
	str	lr, [r3, #40]
	str	ip, [r3, #16]
	str	r1, [r3, #32]
	str	r0, [r3, #36]
	str	r2, [r3, #12]
	str	r2, [r3, #4]
	str	r4, [r3, #44]
	str	r4, [r3, #20]
	ldr	r3, .L129+64
	str	r4, [r3]
	ldr	r3, .L129+68
	str	r4, [r3]
	ldr	r3, .L129+72
	str	r4, [r3]
	ldr	r3, .L129+76
	str	r4, [r3]
	ldr	r3, .L129+80
	str	r4, [r3]
	ldr	r3, .L129+84
	str	r4, [r3]
	ldr	r3, .L129+88
	mov	lr, pc
	bx	r3
	ldr	r3, .L129+92
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L129+96
	mov	lr, pc
	bx	r6
	mov	r3, #8
	ldr	r1, [r5, #4]
	ldr	r0, .L129+100
	str	r3, [r8]
	mov	lr, pc
	bx	r7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L130:
	.align	2
.L129:
	.word	.LANCHOR0
	.word	.LC12
	.word	mgba_printf
	.word	stopSounds
	.word	intro1_length
	.word	intro1_data
	.word	playSoundA
	.word	.LC2
	.word	.LANCHOR1
	.word	waitForVBlank
	.word	DMANow
	.word	83886592
	.word	spriteSheetPal
	.word	100728832
	.word	spriteSheetTiles
	.word	player
	.word	showAccessory
	.word	showAccessory2
	.word	squarePatternActive
	.word	rightTrianglePatternActive
	.word	isoscelesTrianglePatternActive
	.word	emPatternActive2
	.word	resetEnemies
	.word	hideSprites
	.word	shadowOAM
	.word	.LC13
	.size	goToMode0Cutscene, .-goToMode0Cutscene
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"Drawing player at (%d,%d), frame %d, tile %d, hFlip"
	.ascii	"=%d\000"
	.text
	.align	2
	.global	drawMode0Cutscene
	.syntax unified
	.arm
	.type	drawMode0Cutscene, %function
drawMode0Cutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L138
	mov	r1, #512
	mov	r3, r0
	push	{r4, lr}
	add	r2, r0, #1024
	sub	sp, sp, #8
.L132:
	strh	r1, [r3], #8	@ movhi
	cmp	r2, r3
	bne	.L132
	ldr	r2, .L138+4
	ldr	r1, [r2, #4]
	add	r3, r1, #64
	cmp	r3, #304
	bhi	.L133
	mov	lr, #1
	ldr	r3, .L138+8
	ldr	r3, [r3, #44]
	ldr	ip, .L138+12
	cmp	r3, #4
	ldrls	ip, [ip, r3, lsl #2]
	ldrhi	ip, [ip]
	ldr	r2, [r2, #8]
	str	ip, [sp]
	lsl	ip, ip, #22
	lsr	ip, ip, #22
	strh	ip, [r0, #4]	@ movhi
	lsl	ip, r1, #23
	lsr	ip, ip, #23
	orr	ip, ip, #53248
	strh	ip, [r0, #2]	@ movhi
	and	ip, r2, #255
	strh	ip, [r0]	@ movhi
	ldr	r4, .L138+16
	ldr	r0, .L138+20
	str	lr, [sp, #4]
	mov	lr, pc
	bx	r4
.L133:
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L138
	mov	r3, #512
	ldr	r4, .L138+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L138+28
	mov	lr, pc
	bx	r3
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L139:
	.align	2
.L138:
	.word	shadowOAM
	.word	.LANCHOR0
	.word	player
	.word	LEFT_FRAMES
	.word	mgba_printf
	.word	.LC14
	.word	DMANow
	.word	waitForVBlank
	.size	drawMode0Cutscene, .-drawMode0Cutscene
	.section	.rodata.str1.4
	.align	2
.LC15:
	.ascii	"Entering cutscene with %d images\000"
	.text
	.align	2
	.global	goToCutscene
	.syntax unified
	.arm
	.type	goToCutscene, %function
goToCutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L149
	ldr	r3, [r4]
	ldr	r5, .L149+4
	cmp	r3, #2
	str	r0, [r5, #28]
	beq	.L147
	ldr	r7, .L149+8
.L141:
	cmp	r3, #3
	beq	.L142
	ldr	r3, .L149+12
	mov	lr, pc
	bx	r3
	mov	ip, #3
	ldr	r3, .L149+16
	ldr	r0, .L149+20
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L149+24
	str	ip, [r4]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r0, .L149+28
	mov	lr, pc
	bx	r7
.L142:
	mov	r2, #0
	mov	r3, #67108864
	ldr	r1, .L149+32
	mov	r0, #3
	strh	r1, [r3]	@ movhi
	ldr	r6, .L149+36
	ldr	r1, [r4, #12]
	str	r2, [r5, #32]
	str	r2, [r5, #36]
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r6
	ldr	r3, .L149+40
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	ldr	r1, .L149+44
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r0, [r4, #16]
	ldr	r3, .L149+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L149+52
	mov	lr, pc
	bx	r3
	mov	r3, #7
	mov	r1, #10
	ldr	r0, .L149+56
	str	r3, [r5]
	mov	lr, pc
	bx	r7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L147:
	ldr	r3, .L149+12
	mov	lr, pc
	bx	r3
	mvn	r3, #0
	ldr	r0, .L149+60
	ldr	r7, .L149+8
	str	r3, [r4]
	mov	lr, pc
	bx	r7
	ldr	r3, [r4]
	b	.L141
.L150:
	.align	2
.L149:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	mgba_printf
	.word	stopSounds
	.word	intro1_length
	.word	intro1_data
	.word	playSoundA
	.word	.LC2
	.word	1028
	.word	DMANow
	.word	hideSprites
	.word	shadowOAM
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	.LC15
	.word	.LC5
	.size	goToCutscene, .-goToCutscene
	.align	2
	.global	start
	.syntax unified
	.arm
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L163
	ldrh	r3, [r4, #4]
	tst	r3, #8
	beq	.L152
	ldrh	r2, [r4, #6]
	tst	r2, #8
	beq	.L161
.L152:
	tst	r3, #2
	beq	.L151
	ldrh	r3, [r4, #6]
	tst	r3, #2
	beq	.L162
.L151:
	pop	{r4, r5, r6, lr}
	bx	lr
.L162:
	mov	ip, #67108864
	ldr	lr, .L163+4
	mov	r2, #83886080
	strh	lr, [ip]	@ movhi
	ldr	r1, .L163+8
	ldr	r5, .L163+12
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r0, .L163+16
	ldr	r3, .L163+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L163+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L163+28
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L161:
	mov	r0, #2
	bl	goToCutscene
	ldrh	r3, [r4, #4]
	b	.L152
.L164:
	.align	2
.L163:
	.word	.LANCHOR1
	.word	1028
	.word	INSTRUCTIONSPal
	.word	DMANow
	.word	INSTRUCTIONSBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	shadowOAM
	.size	start, .-start
	.align	2
	.global	drawCutscene
	.syntax unified
	.arm
	.type	drawCutscene, %function
drawCutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L171
	ldr	r2, [r3, #36]
	cmp	r2, #0
	bxne	lr
	ldr	r2, [r3, #32]
	cmp	r2, #9
	bxgt	lr
	push	{r4, lr}
	ldr	r4, .L171+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L171
	ldr	r2, .L171+8
	ldr	r3, [r3, #32]
	add	r3, r2, r3, lsl #2
	ldr	r1, .L171+12
	ldr	r0, [r3, #16]
	mov	lr, pc
	bx	r1
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L172:
	.align	2
.L171:
	.word	.LANCHOR1
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	drawFullscreenImage4
	.size	drawCutscene, .-drawCutscene
	.align	2
	.global	goToPlaying
	.syntax unified
	.arm
	.type	goToPlaying, %function
goToPlaying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L177
	ldr	r5, [r4, #40]
	cmp	r5, #0
	bne	.L174
	mov	r6, #67108864
	mov	r1, #1
	ldr	r2, .L177+4
	ldr	r3, .L177+8
	str	r1, [r2, #56]
	ldr	r8, .L177+12
	mov	lr, pc
	bx	r3
	strh	r5, [r6]	@ movhi
	mov	lr, pc
	bx	r8
	mov	r3, #7168
	ldr	r2, .L177+16
	strh	r2, [r6, #8]	@ movhi
	ldr	r2, .L177+20
	ldr	r7, .L177+24
	strh	r2, [r6, #10]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	strh	r3, [r6, #12]	@ movhi
	ldr	r1, .L177+28
	mov	r3, #256
	mov	lr, pc
	bx	r7
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L177+32
	ldr	r1, .L177+36
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L177+40
	ldr	r1, .L177+44
	mov	lr, pc
	bx	r7
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L177+48
	ldr	r1, .L177+52
	mov	lr, pc
	bx	r7
	ldr	r1, .L177+56
	ldr	r2, .L177+60
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r7
	ldr	r7, .L177+64
	mov	lr, pc
	bx	r8
	mov	r0, r7
	ldr	r3, .L177+68
	mov	lr, pc
	bx	r3
	ldr	r2, [r7, #12]
	str	r2, [r7, #4]
	ldr	r2, [r7, #8]
	ldr	r3, .L177+72
	str	r2, [r7]
	mov	lr, pc
	bx	r3
	ldr	r3, .L177+76
	mov	lr, pc
	bx	r3
	ldr	r3, .L177+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L177+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L177+88
	mov	lr, pc
	bx	r3
	ldr	r7, .L177+92
	mov	r1, r5
	mov	r0, #5
	mov	lr, pc
	bx	r7
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r1, #1
	mov	r0, #4
	mov	lr, pc
	bx	r7
	mov	r1, #1
	mov	r0, #2
	mov	lr, pc
	bx	r7
	mov	r3, #4864
	strh	r3, [r6]	@ movhi
.L175:
	mov	r2, #0
	mov	r3, #2
	str	r2, [r4, #40]
	str	r3, [r4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L174:
	mov	r5, #67108864
	mov	r3, #0
	ldr	r7, .L177+12
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r7
	mov	ip, #7168
	ldr	lr, .L177+20
	ldr	r8, .L177+16
	ldr	r6, .L177+24
	strh	r8, [r5, #8]	@ movhi
	mov	r3, #256
	strh	lr, [r5, #10]	@ movhi
	mov	r2, #83886080
	strh	ip, [r5, #12]	@ movhi
	mov	r0, #3
	ldr	r1, .L177+28
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L177+32
	ldr	r1, .L177+36
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L177+40
	ldr	r1, .L177+44
	mov	lr, pc
	bx	r6
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L177+48
	ldr	r1, .L177+52
	mov	lr, pc
	bx	r6
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L177+60
	ldr	r1, .L177+56
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r7
	mov	r3, #4864
	strh	r3, [r5]	@ movhi
	b	.L175
.L178:
	.align	2
.L177:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	resetPlayerLivesForNewLevel
	.word	waitForVBlank
	.word	6146
	.word	6657
	.word	DMANow
	.word	Background1Pal
	.word	8224
	.word	Background1Tiles
	.word	100716544
	.word	Background1Map
	.word	83886592
	.word	spriteSheetPal
	.word	spriteSheetTiles
	.word	100728832
	.word	player
	.word	initPlayer
	.word	resetCollisionSystem
	.word	initButtons
	.word	initPlayerBullets
	.word	initPatternPositions
	.word	resetEnemies
	.word	spawnEnemyAtCollisionColor
	.size	goToPlaying, .-goToPlaying
	.section	.rodata.str1.4
	.align	2
.LC16:
	.ascii	"Mode 0 cutscene complete: Player walked off-screen\000"
	.text
	.align	2
	.global	updateMode0Cutscene
	.syntax unified
	.arm
	.type	updateMode0Cutscene, %function
updateMode0Cutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L185
	ldr	r3, .L185+4
	ldr	r2, [ip, #24]
	ldr	r0, .L185+8
	ldr	r1, [r3, #32]
	add	r2, r2, #1
	push	{r4, lr}
	str	r2, [ip, #24]
	ldr	r2, [r0, #4]
	sub	r1, r1, #1
	add	r2, r2, #2
	cmp	r1, #0
	str	r1, [r3, #32]
	str	r2, [r0, #4]
	str	r2, [r3, #8]
	bgt	.L180
	ldr	ip, [r3, #44]
	ldr	lr, .L185+12
	add	ip, ip, #1
	smull	r1, lr, ip, lr
	asr	r1, ip, #31
	rsb	r1, r1, lr, asr #1
	add	r1, r1, r1, lsl #2
	subs	r1, ip, r1
	moveq	r1, #1
	mov	ip, #10
	str	r1, [r3, #44]
	str	ip, [r3, #32]
.L180:
	cmp	r2, #239
	bgt	.L184
	ldr	r1, [r0, #8]
	str	r2, [r3]
	str	r1, [r3, #4]
	pop	{r4, lr}
	bx	lr
.L184:
	ldr	r0, .L185+16
	ldr	r3, .L185+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPlaying
.L186:
	.align	2
.L185:
	.word	.LANCHOR1
	.word	player
	.word	.LANCHOR0
	.word	1717986919
	.word	.LC16
	.word	mgba_printf
	.size	updateMode0Cutscene, .-updateMode0Cutscene
	.section	.rodata.str1.4
	.align	2
.LC17:
	.ascii	"Mode 0 cutscene skipped\000"
	.text
	.align	2
	.global	mode0Cutscene
	.syntax unified
	.arm
	.type	mode0Cutscene, %function
mode0Cutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateMode0Cutscene
	bl	drawMode0Cutscene
	ldr	r3, .L201
	ldrh	r2, [r3, #4]
	tst	r2, #1
	beq	.L188
	ldrh	r1, [r3, #6]
	tst	r1, #1
	beq	.L189
.L188:
	tst	r2, #8
	beq	.L187
	ldrh	r3, [r3, #6]
	tst	r3, #8
	beq	.L189
.L187:
	pop	{r4, lr}
	bx	lr
.L189:
	ldr	r0, .L201+4
	ldr	r3, .L201+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPlaying
.L202:
	.align	2
.L201:
	.word	.LANCHOR1
	.word	.LC17
	.word	mgba_printf
	.size	mode0Cutscene, .-mode0Cutscene
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L205
	ldr	r2, [r4]
	ldr	r3, .L205+4
	str	r2, [r4, #44]
	mov	lr, pc
	bx	r3
	mov	lr, #67108864
	mov	ip, #1
	ldr	r6, .L205+8
	mov	r2, #83886080
	strh	r6, [lr]	@ movhi
	ldr	r1, .L205+12
	ldr	r5, .L205+16
	mov	r3, #256
	mov	r0, #3
	str	ip, [r4, #40]
	mov	lr, pc
	bx	r5
	ldr	r0, .L205+20
	ldr	r3, .L205+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L205+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L205+32
	mov	lr, pc
	bx	r5
	mov	r3, #3
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L206:
	.align	2
.L205:
	.word	.LANCHOR1
	.word	pauseSounds
	.word	1028
	.word	PAUSEDPal
	.word	DMANow
	.word	PAUSEDBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	shadowOAM
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"Returning to start screen from lose screen\000"
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L215
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r0, .L215+4
	ldr	r3, .L215+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L216:
	.align	2
.L215:
	.word	.LANCHOR1
	.word	.LC18
	.word	mgba_printf
	.size	lose, .-lose
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"GAME OVER - Player ran out of lives\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L223
	ldr	r3, [r4]
	cmn	r3, #1
	sub	sp, sp, #8
	ldr	r3, .L223+4
	beq	.L218
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r3
	mvn	r2, #0
	ldr	r3, [sp, #4]
	str	r2, [r4]
.L218:
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	lr, .L223+8
	mov	r2, #83886080
	strh	lr, [ip]	@ movhi
	ldr	r1, .L223+12
	ldr	r4, .L223+16
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L223+20
	ldr	r3, .L223+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L223+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L223+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L223+36
	mov	lr, pc
	bx	r4
	mov	r1, #4
	ldr	r2, .L223+40
	ldr	r0, .L223+44
	ldr	r3, .L223+48
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L224:
	.align	2
.L223:
	.word	.LANCHOR0
	.word	stopSounds
	.word	1028
	.word	LOSEPal
	.word	DMANow
	.word	LOSEBitmap
	.word	drawFullscreenImage4
	.word	resetEnemies
	.word	hideSprites
	.word	shadowOAM
	.word	.LANCHOR1
	.word	.LC19
	.word	mgba_printf
	.size	goToLose, .-goToLose
	.align	2
	.global	win
	.syntax unified
	.arm
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L233
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	ands	r3, r3, #8
	bxne	lr
	str	lr, [sp, #-4]!
	ldr	r2, .L233+4
	sub	sp, sp, #12
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r2
	ldr	r0, .L233+8
	ldr	r2, .L233+12
	mov	lr, pc
	bx	r2
	ldr	r2, .L233+16
	mov	lr, pc
	bx	r2
	ldr	r2, .L233+20
	mov	lr, pc
	bx	r2
	ldr	r2, .L233+24
	mov	lr, pc
	bx	r2
	mov	r2, #32
	ldr	ip, .L233+28
	ldr	r0, .L233+32
	ldr	r1, .L233+36
	ldr	r3, [sp, #4]
	str	r2, [r0]
	str	r3, [ip]
	str	r2, [r1]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	b	goToStart
.L234:
	.align	2
.L233:
	.word	.LANCHOR1
	.word	stopSounds
	.word	player
	.word	initPlayer
	.word	resetEnemies
	.word	resetCollisionSystem
	.word	resetCollisionSystem2
	.word	playerSpriteBaseIndex
	.word	playerSpriteWidth
	.word	playerSpriteHeight
	.size	win, .-win
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L241
	ldr	r3, [r4]
	cmn	r3, #1
	beq	.L236
	ldr	r3, .L241+4
	mov	lr, pc
	bx	r3
	mvn	r3, #0
	str	r3, [r4]
.L236:
	mov	ip, #67108864
	ldr	lr, .L241+8
	mov	r2, #83886080
	strh	lr, [ip]	@ movhi
	ldr	r1, .L241+12
	ldr	r4, .L241+16
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L241+20
	ldr	r3, .L241+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L241+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L241+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L241+36
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L241+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L242:
	.align	2
.L241:
	.word	.LANCHOR0
	.word	stopSounds
	.word	1028
	.word	WINPal
	.word	DMANow
	.word	WINBitmap
	.word	drawFullscreenImage4
	.word	resetEnemies
	.word	hideSprites
	.word	shadowOAM
	.word	.LANCHOR1
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"Starting Prince cutscene\000"
	.align	2
.LC21:
	.ascii	"Entering prince cutscene with %d images\000"
	.text
	.align	2
	.global	goToPrinceCutscene
	.syntax unified
	.arm
	.type	goToPrinceCutscene, %function
goToPrinceCutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L248
	ldr	r0, .L248+4
	ldr	r6, .L248+8
	mov	lr, pc
	bx	r6
	ldr	r3, [r4]
	cmn	r3, #1
	ldr	r5, .L248+12
	bne	.L244
.L246:
	mov	lr, pc
	bx	r5
	mov	ip, #3
	ldr	r3, .L248+16
	ldr	r0, .L248+20
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L248+24
	str	ip, [r4]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r0, .L248+28
	mov	lr, pc
	bx	r6
.L245:
	mov	r2, #0
	mov	r3, #67108864
	ldr	r5, .L248+32
	ldr	r1, .L248+36
	mov	r0, #3
	strh	r1, [r3]	@ movhi
	ldr	r7, .L248+40
	ldr	r1, [r4, #60]
	str	r2, [r5, #48]
	str	r2, [r5, #52]
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r7
	ldr	r3, .L248+44
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	ldr	r1, .L248+48
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r7
	ldr	r0, [r4, #64]
	ldr	r3, .L248+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L248+56
	mov	lr, pc
	bx	r3
	mov	r3, #9
	mov	r1, #4
	ldr	r0, .L248+60
	str	r3, [r5]
	mov	lr, pc
	bx	r6
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L244:
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #3
	beq	.L245
	b	.L246
.L249:
	.align	2
.L248:
	.word	.LANCHOR0
	.word	.LC20
	.word	mgba_printf
	.word	stopSounds
	.word	intro1_length
	.word	intro1_data
	.word	playSoundA
	.word	.LC2
	.word	.LANCHOR1
	.word	1028
	.word	DMANow
	.word	hideSprites
	.word	shadowOAM
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	.LC21
	.size	goToPrinceCutscene, .-goToPrinceCutscene
	.section	.rodata.str1.4
	.align	2
.LC22:
	.ascii	"Prince cutscene: Frame %d/%d\000"
	.align	2
.LC23:
	.ascii	"Prince cutscene completed\000"
	.text
	.align	2
	.global	updatePrinceCutscene
	.syntax unified
	.arm
	.type	updatePrinceCutscene, %function
updatePrinceCutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L256
	ldr	r3, [r4, #48]
	add	r3, r3, #1
	cmp	r3, #29
	strle	r3, [r4, #48]
	bgt	.L255
.L250:
	pop	{r4, lr}
	bx	lr
.L255:
	mov	ip, #0
	ldr	r1, [r4, #52]
	mov	r2, #4
	ldr	r3, .L256+4
	add	r1, r1, #1
	ldr	r0, .L256+8
	str	r1, [r4, #52]
	str	ip, [r4, #48]
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #52]
	cmp	r2, #3
	ldr	r3, .L256+4
	ble	.L250
	ldr	r0, .L256+12
	mov	lr, pc
	bx	r3
	b	.L250
.L257:
	.align	2
.L256:
	.word	.LANCHOR1
	.word	mgba_printf
	.word	.LC22
	.word	.LC23
	.size	updatePrinceCutscene, .-updatePrinceCutscene
	.section	.rodata.str1.4
	.align	2
.LC24:
	.ascii	"Drew prince frame %d\000"
	.text
	.align	2
	.global	drawPrinceCutscene
	.syntax unified
	.arm
	.type	drawPrinceCutscene, %function
drawPrinceCutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L264
	ldr	r2, [r3, #48]
	cmp	r2, #0
	bxne	lr
	ldr	r2, [r3, #52]
	cmp	r2, #3
	bxgt	lr
	push	{r4, lr}
	ldr	r4, .L264+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L264
	ldr	r2, .L264+8
	ldr	r0, [r3, #52]
	add	r2, r2, r0, lsl #2
	ldr	r0, [r2, #64]
	ldr	r1, .L264+12
	mov	lr, pc
	bx	r1
	mov	lr, pc
	bx	r4
	ldr	r3, .L264
	ldr	r0, .L264+16
	ldr	r2, .L264+20
	ldr	r1, [r3, #52]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L265:
	.align	2
.L264:
	.word	.LANCHOR1
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	drawFullscreenImage4
	.word	.LC24
	.word	mgba_printf
	.size	drawPrinceCutscene, .-drawPrinceCutscene
	.section	.rodata.str1.4
	.align	2
.LC25:
	.ascii	"FRAME 60 CHECK:\000"
	.align	2
.LC26:
	.ascii	"BG0HOFF: %d, BG1HOFF: %d\000"
	.align	2
.LC27:
	.ascii	"BG1CNT: 0x%04X\000"
	.align	2
.LC28:
	.ascii	"Center tile: 0x%04X (palette: %d, tile#: %d)\000"
	.align	2
.LC29:
	.ascii	"Loading parallax to CHARBLOCK[1]...\000"
	.align	2
.LC30:
	.ascii	"Loading Background2 to CHARBLOCK[0]...\000"
	.align	2
.LC31:
	.ascii	"Initial: Both BGs using PALROW0 (Background2Pal)\000"
	.align	2
.LC32:
	.ascii	"PALROW2 ready with Background2ScrollingPal\000"
	.align	2
.LC33:
	.ascii	"Loading sprites to CHARBLOCK[4]...\000"
	.align	2
.LC34:
	.ascii	"First time\000"
	.align	2
.LC35:
	.ascii	"Level 2 loaded. State: %s, Player at (%d,%d), Camer"
	.ascii	"a at (%d,%d)\000"
	.text
	.align	2
	.global	goToPlaying2
	.syntax unified
	.arm
	.type	goToPlaying2, %function
goToPlaying2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 2056
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L291
	ldr	r3, [r5, #56]
	add	r3, r3, #1
	sub	sp, sp, #2064
	cmp	r3, #20
	sub	sp, sp, #4
	str	r3, [r5, #56]
	beq	.L286
	ldr	r6, .L291+4
.L267:
	mov	r3, #2
	ldr	r2, [r5, #40]
	ldr	r7, .L291+8
	cmp	r2, #0
	str	r3, [r7, #56]
	beq	.L288
.L268:
	ldr	r3, [r5]
	cmp	r3, #3
	ldrne	r3, .L291+12
	movne	lr, pc
	bxne	r3
.L269:
	mov	r4, #67108864
	mov	r3, #0
	ldr	r8, .L291+16
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	ldr	r3, .L291+20
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L291+24
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L291+28
	ldr	r0, .L291+32
	strh	r3, [r4, #12]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r4, .L291+36
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L291+40
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L291+44
	ldr	r1, .L291+48
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L291+52
	ldr	r1, .L291+56
	ldr	r3, .L291+60
	mov	lr, pc
	bx	r4
	ldr	r2, .L291+64
	ldr	ip, .L291+68
	add	r0, r2, #2048
	add	r1, sp, #14
.L270:
	ldrh	r3, [r2, #2]!
	and	r3, r3, ip
	orr	r3, r3, #4096
	cmp	r0, r2
	strh	r3, [r1, #2]!	@ movhi
	bne	.L270
	mov	r3, #2048
	ldr	r2, .L291+72
	add	r1, sp, #16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L291+76
	mov	lr, pc
	bx	r6
	mov	r3, #3888
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L291+80
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L291+84
	ldr	r1, .L291+88
	mov	lr, pc
	bx	r4
	mov	r3, #4544
	mov	r0, #3
	ldr	r2, .L291+92
	ldr	r1, .L291+96
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L291+100
	ldr	r1, .L291+104
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L291+108
	mov	r3, #256
	ldr	r1, .L291+112
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r0, .L291+68
.L271:
	lsl	r3, r2, #1
	add	r3, r3, #100663296
	add	ip, r3, #57344
	ldrh	r1, [ip]
	and	r1, r1, r0
	strh	r1, [ip]	@ movhi
	add	r3, r3, #59392
	ldrh	r1, [r3]
	add	r2, r2, #1
	and	r1, r1, r0
	cmp	r2, #1024
	strh	r1, [r3]	@ movhi
	bne	.L271
	ldr	r0, .L291+116
	mov	lr, pc
	bx	r6
	ldr	r0, .L291+120
	mov	lr, pc
	bx	r6
	ldr	r0, .L291+124
	mov	lr, pc
	bx	r6
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L291+128
	ldr	r1, .L291+132
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L291+136
	ldr	r1, .L291+140
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r8
	ldr	r3, [r5]
	cmp	r3, #3
	beq	.L272
	ldr	r3, [r7, #80]
	cmp	r3, #0
	bne	.L289
.L272:
	ldr	r9, .L291+144
	ldr	r4, [r9, #8]
	ldr	r8, [r9, #12]
	sub	r4, r4, #88
	cmp	r4, #16
	sub	r8, r8, #48
	movge	r4, #16
	cmp	r8, #96
	movge	r8, #96
	mov	r3, #67108864
	mov	ip, #5888
	ldr	r0, [r5, #40]
	bic	r4, r4, r4, asr #31
	bic	r8, r8, r8, asr #31
	lsl	r1, r4, #16
	lsl	r2, r8, #16
	lsr	r1, r1, #16
	lsr	r2, r2, #16
	cmp	r0, #0
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	strh	r1, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	strh	ip, [r3]	@ movhi
	beq	.L290
.L273:
	ldr	r3, .L291+148
	mov	lr, pc
	bx	r3
	mov	ip, #6
	stm	sp, {r4, r8}
	add	r2, r9, #8
	ldm	r2, {r2, r3}
	ldr	r1, .L291+152
	ldr	r0, .L291+156
	str	ip, [r5]
	mov	lr, pc
	bx	r6
	add	sp, sp, #2064
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L289:
	ldr	r3, .L291+160
	mov	lr, pc
	bx	r3
	ldr	r3, .L291+164
	mov	lr, pc
	bx	r3
	ldr	r3, .L291+168
	mov	lr, pc
	bx	r3
	ldr	r3, .L291+172
	mov	lr, pc
	bx	r3
	ldr	r4, .L291+176
	mov	r1, #1
	mov	r0, #11
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #5
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #12
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #6
	mov	lr, pc
	bx	r4
	mov	r3, #0
	str	r3, [r7, #80]
	b	.L272
.L290:
	mvn	r3, #0
	str	r3, [r7]
	ldr	r3, .L291+180
	str	r0, [sp, #12]
	mov	lr, pc
	bx	r3
	ldr	r0, [sp, #12]
	ldr	r3, .L291+184
	str	r0, [r7]
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L291+188
	ldr	r3, .L291+192
	mov	lr, pc
	bx	r3
	b	.L273
.L288:
	ldr	r3, .L291+196
	mov	lr, pc
	bx	r3
	b	.L268
.L286:
	mov	r4, #67108864
	ldr	r6, .L291+4
	ldr	r0, .L291+200
	mov	lr, pc
	bx	r6
	ldrh	r1, [r4, #16]
	ldr	r0, .L291+204
	ldrh	r2, [r4, #20]
	mov	lr, pc
	bx	r6
	ldrh	r1, [r4, #10]
	ldr	r0, .L291+208
	mov	lr, pc
	bx	r6
	ldr	r3, .L291+212
	ldrh	r1, [r3, #2]
	lsr	r2, r1, #12
	lsl	r3, r1, #22
	ldr	r0, .L291+216
	lsr	r3, r3, #22
	and	r2, r2, #7
	mov	lr, pc
	bx	r6
	b	.L267
.L292:
	.align	2
.L291:
	.word	.LANCHOR1
	.word	mgba_printf
	.word	.LANCHOR0
	.word	resetEnemies
	.word	waitForVBlank
	.word	7943
	.word	7434
	.word	7169
	.word	.LC29
	.word	DMANow
	.word	Background2Pal
	.word	83886112
	.word	parallax1Pal
	.word	100679680
	.word	parallax1Tiles
	.word	7920
	.word	parallax1Map-2
	.word	4095
	.word	100726784
	.word	.LC30
	.word	Background2Tiles
	.word	100720640
	.word	Background2Map
	.word	100696064
	.word	Background2ScrollingTiles
	.word	100722688
	.word	Background2ScrollingMap
	.word	83886144
	.word	Background2ScrollingPal
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	83886592
	.word	spriteSheetPal
	.word	100728832
	.word	spriteSheetTiles
	.word	player
	.word	debugEnemyPathCollisions
	.word	.LC34
	.word	.LC35
	.word	resetCollisionSystem2
	.word	resetPlayerBullets
	.word	initButtons2
	.word	initPatternPositions2
	.word	spawnEnemyAtCollisionColor2
	.word	stopSounds
	.word	KatsuraTheme_length
	.word	KatsuraTheme_data
	.word	playSoundA
	.word	resetPlayerLivesForNewLevel
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	100723356
	.word	.LC28
	.size	goToPlaying2, .-goToPlaying2
	.section	.rodata.str1.4
	.align	2
.LC36:
	.ascii	"Cutscene completed\000"
	.text
	.align	2
	.global	updateCutscene
	.syntax unified
	.arm
	.type	updateCutscene, %function
updateCutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L304
	ldr	r3, [r2, #36]
	add	r3, r3, #1
	cmp	r3, #14
	bgt	.L294
	str	r3, [r2, #36]
	bx	lr
.L294:
	mov	r1, #0
	ldr	r3, [r2, #32]
	add	r3, r3, #1
	cmp	r3, #9
	str	r3, [r2, #32]
	str	r1, [r2, #36]
	bxle	lr
	ldr	r3, .L304+4
	push	{r4, lr}
	ldr	r0, .L304+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L304
	ldr	r3, [r2, #28]
	cmp	r3, #2
	beq	.L302
	cmp	r3, #6
	beq	.L303
	pop	{r4, lr}
	b	goToStart
.L302:
	pop	{r4, lr}
	b	goToPlaying
.L303:
	pop	{r4, lr}
	b	goToPlaying2
.L305:
	.align	2
.L304:
	.word	.LANCHOR1
	.word	mgba_printf
	.word	.LC36
	.size	updateCutscene, .-updateCutscene
	.section	.rodata.str1.4
	.align	2
.LC37:
	.ascii	"Image cutscene skipped (START button)\000"
	.align	2
.LC38:
	.ascii	"Image cutscene completed, starting Mode 0 cutscene\000"
	.text
	.align	2
	.global	cutscene
	.syntax unified
	.arm
	.type	cutscene, %function
cutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateCutscene
	ldr	r3, .L316
	ldrh	r2, [r3, #4]
	tst	r2, #8
	beq	.L307
	ldrh	r2, [r3, #6]
	tst	r2, #8
	beq	.L315
.L307:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	bne	.L308
	ldr	r2, [r3, #32]
	cmp	r2, #9
	ble	.L309
.L310:
	ldr	r0, .L316+4
	ldr	r3, .L316+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMode0Cutscene
.L309:
	ldr	r4, .L316+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L316
	ldr	r2, .L316+16
	ldr	r0, [r3, #32]
	add	r2, r2, r0, lsl #2
	ldr	r1, .L316+20
	ldr	r0, [r2, #16]
	mov	lr, pc
	bx	r1
	mov	lr, pc
	bx	r4
	ldr	r3, .L316
.L308:
	ldr	r3, [r3, #32]
	cmp	r3, #9
	bgt	.L310
	pop	{r4, lr}
	bx	lr
.L315:
	ldr	r0, .L316+24
	ldr	r3, .L316+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L316+28
	ldr	r3, .L316+32
	mov	lr, pc
	bx	r3
	ldr	r0, .L316+28
	ldr	r2, [r0, #12]
	ldr	r3, [r0, #8]
	pop	{r4, lr}
	str	r2, [r0, #4]
	str	r3, [r0]
	b	goToPlaying
.L317:
	.align	2
.L316:
	.word	.LANCHOR1
	.word	.LC38
	.word	mgba_printf
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	drawFullscreenImage4
	.word	.LC37
	.word	player
	.word	initPlayer
	.size	cutscene, .-cutscene
	.align	2
	.global	pause
	.syntax unified
	.arm
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L338
	ldrh	r2, [r3, #4]
	tst	r2, #4
	beq	.L329
	ldrh	r1, [r3, #6]
	tst	r1, #4
	beq	.L335
.L329:
	tst	r2, #2
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #2
	bxne	lr
	b	goToStart
.L335:
	ldr	r2, .L338+4
	push	{r4, lr}
	mov	lr, pc
	bx	r2
	ldr	r3, .L338
	ldr	r2, [r3, #44]
	cmp	r2, #6
	beq	.L336
	bl	goToPlaying
	ldr	r3, .L338
	ldrh	r2, [r3, #4]
.L319:
	tst	r2, #2
	beq	.L318
	ldrh	r3, [r3, #6]
	tst	r3, #2
	beq	.L337
.L318:
	pop	{r4, lr}
	bx	lr
.L336:
	bl	goToPlaying2
	ldr	r3, .L338
	ldrh	r2, [r3, #4]
	b	.L319
.L337:
	pop	{r4, lr}
	b	goToStart
.L339:
	.align	2
.L338:
	.word	.LANCHOR1
	.word	unpauseSounds
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC39:
	.ascii	"Prince cutscene: Frame %d/%d (START pressed)\000"
	.align	2
.LC40:
	.ascii	"Prince cutscene completed, going to Level 2\000"
	.align	2
.LC41:
	.ascii	"Prince cutscene skipped with A button\000"
	.align	2
.LC42:
	.ascii	"Prince cutscene: Went back to frame %d/%d\000"
	.text
	.align	2
	.global	princeCutscene
	.syntax unified
	.arm
	.type	princeCutscene, %function
princeCutscene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L360
	ldrh	r2, [r3, #4]
	tst	r2, #8
	push	{r4, lr}
	beq	.L341
	ldrh	r1, [r3, #6]
	tst	r1, #8
	beq	.L355
.L341:
	tst	r2, #1
	beq	.L343
.L359:
	ldrh	r1, [r3, #6]
	tst	r1, #1
	beq	.L356
.L343:
	tst	r2, #2
	beq	.L340
	ldrh	r2, [r3, #6]
	tst	r2, #2
	bne	.L340
	ldr	r1, [r3, #52]
	cmp	r1, #0
	bgt	.L357
.L340:
	pop	{r4, lr}
	bx	lr
.L355:
	ldr	r1, [r3, #52]
	add	r1, r1, #1
	mov	r2, #4
	str	r1, [r3, #52]
	ldr	r0, .L360+4
	ldr	r3, .L360+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L360
	ldr	r2, [r3, #52]
	cmp	r2, #3
	bgt	.L358
	ldr	r4, .L360+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L360
	ldr	r2, .L360+16
	ldr	r0, [r3, #52]
	add	r2, r2, r0, lsl #2
	ldr	r0, [r2, #64]
	ldr	r1, .L360+20
	mov	lr, pc
	bx	r1
	mov	lr, pc
	bx	r4
	ldr	r3, .L360
	ldrh	r2, [r3, #4]
	tst	r2, #1
	beq	.L343
	b	.L359
.L356:
	ldr	r0, .L360+24
	ldr	r3, .L360+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPlaying2
.L357:
	sub	r1, r1, #1
	str	r1, [r3, #52]
	mov	r2, #4
	ldr	r0, .L360+28
	ldr	r3, .L360+8
	ldr	r4, .L360+12
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L360
	ldr	r2, .L360+16
	ldr	r3, [r3, #52]
	add	r3, r2, r3, lsl #2
	ldr	r1, .L360+20
	ldr	r0, [r3, #64]
	mov	lr, pc
	bx	r1
	mov	lr, pc
	bx	r4
	b	.L340
.L358:
	ldr	r0, .L360+32
	ldr	r3, .L360+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPlaying2
.L361:
	.align	2
.L360:
	.word	.LANCHOR1
	.word	.LC39
	.word	mgba_printf
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	drawFullscreenImage4
	.word	.LC41
	.word	.LC42
	.word	.LC40
	.size	princeCutscene, .-princeCutscene
	.section	.rodata.str1.4
	.align	2
.LC44:
	.ascii	"SKIPPING TO PRINCE CUTSCENE\000"
	.align	2
.LC45:
	.ascii	"Cannot skip: Enemies still alive in Level 1\000"
	.align	2
.LC46:
	.ascii	"Returning to start from lose screen\000"
	.align	2
.LC47:
	.ascii	"SKIPPING PRINCE CUTSCENE TO LEVEL 2\000"
	.align	2
.LC48:
	.ascii	"SKIPPING TO WIN\000"
	.align	2
.LC49:
	.ascii	"Cannot skip: Enemies still alive in Level 2\000"
	.align	2
.LC50:
	.ascii	"Returning to start from win screen\000"
	.text
	.align	2
	.syntax unified
	.arm
	.type	checkLevelSkip.part.0, %function
checkLevelSkip.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #30
	ldr	r5, .L384
.L363:
	mov	lr, pc
	bx	r5
	subs	r4, r4, #1
	bne	.L363
	ldr	r3, .L384+4
	ldr	r3, [r3]
	ldr	r2, .L384+8
	sub	r3, r3, #2
	cmp	r3, #7
	bhi	.L362
	ldrb	r3, [r2, r3]
	add	pc, pc, r3, lsl #2
.Lrtx366:
	nop
	.section	.rodata
.L366:
	.byte	(.L370-.Lrtx366-4)/4
	.byte	(.L362-.Lrtx366-4)/4
	.byte	(.L369-.Lrtx366-4)/4
	.byte	(.L368-.Lrtx366-4)/4
	.byte	(.L367-.Lrtx366-4)/4
	.byte	(.L362-.Lrtx366-4)/4
	.byte	(.L362-.Lrtx366-4)/4
	.byte	(.L365-.Lrtx366-4)/4
	.text
	.p2align 2
.L370:
	ldr	r3, .L384+12
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L371
	ldr	r3, .L384+16
	ldr	r3, [r3, #56]
	cmp	r3, #1
	beq	.L382
.L371:
	ldr	r0, .L384+20
	ldr	r3, .L384+24
	mov	lr, pc
	bx	r3
.L362:
	pop	{r4, r5, r6, lr}
	bx	lr
.L365:
	ldr	r0, .L384+28
	ldr	r3, .L384+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToPlaying2
.L369:
	ldr	r0, .L384+32
	ldr	r3, .L384+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L368:
	ldr	r0, .L384+36
	ldr	r3, .L384+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L367:
	ldr	r3, .L384+12
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L372
	ldr	r3, .L384+16
	ldr	r3, [r3, #56]
	cmp	r3, #2
	beq	.L383
.L372:
	ldr	r0, .L384+40
	ldr	r3, .L384+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L382:
	ldr	r0, .L384+44
	ldr	r3, .L384+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L384+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L384+52
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToPrinceCutscene
.L383:
	ldr	r0, .L384+56
	ldr	r3, .L384+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L384+48
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToWin
.L385:
	.align	2
.L384:
	.word	waitForVBlank
	.word	.LANCHOR1
	.word	.L366
	.word	areAllEnemiesKilled
	.word	.LANCHOR0
	.word	.LC45
	.word	mgba_printf
	.word	.LC47
	.word	.LC46
	.word	.LC50
	.word	.LC49
	.word	.LC44
	.word	resetEnemies
	.word	resetCollisionSystem
	.word	.LC48
	.size	checkLevelSkip.part.0, .-checkLevelSkip.part.0
	.section	.rodata.str1.4
	.align	2
.LC51:
	.ascii	"Player has no lives left! Game Over!\000"
	.align	2
.LC52:
	.ascii	"AUTO MOVEMENT ACTIVE - Step: %d\000"
	.align	2
.LC53:
	.ascii	"Player Vel: (%d,%d), Pos: (%d,%d)\000"
	.align	2
.LC54:
	.ascii	"AUTO MOVEMENT FINISHED - Returning to normal gamepl"
	.ascii	"ay\000"
	.align	2
.LC56:
	.ascii	"Automatic movement reset. Ready for next sequence.\000"
	.align	2
.LC57:
	.ascii	"All enemies killed! Transitioning to prince cutscen"
	.ascii	"e...\000"
	.align	2
.LC58:
	.ascii	"DEBUG: Manual trigger for prince cutscene\000"
	.text
	.align	2
	.global	playing
	.syntax unified
	.arm
	.type	playing, %function
playing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L431
	sub	sp, sp, #12
	ldr	r3, .L431+4
	ldr	r4, .L431+8
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r0, .L431
	ldr	r3, .L431+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L431+16
	ldr	r3, .L431+20
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L431+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5, #4]
	tst	r3, #1
	beq	.L387
	ldrh	r3, [r5, #6]
	tst	r3, #1
	beq	.L424
.L387:
	bl	togglePaletteRows
	ldr	r3, .L431+28
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L425
	ldr	r6, .L431+32
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L426
.L389:
	ldr	r4, .L431
	ldr	r3, .L431+36
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r3, .L431+40
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L427
.L390:
	ldr	r3, .L431+44
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L428
.L391:
	ldr	r3, .L431+48
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L397
	ldr	r3, [r6]
	cmp	r3, #0
	ldreq	r0, .L431+52
	beq	.L423
.L397:
	ldrh	r3, [r5, #4]
	tst	r3, #8
	beq	.L398
	ldrh	r2, [r5, #6]
	tst	r2, #8
	beq	.L429
.L398:
	tst	r3, #4
	beq	.L399
	ldrh	r3, [r5, #6]
	tst	r3, #4
	beq	.L430
.L399:
	ldr	r0, .L431
	ldr	r3, .L431+56
	mov	lr, pc
	bx	r3
	ldr	r0, .L431
	ldr	r3, .L431+60
	mov	lr, pc
	bx	r3
	ldr	r0, .L431
	ldr	r3, .L431+64
	mov	lr, pc
	bx	r3
	ldr	r4, .L431+68
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L431+72
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L431+76
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L424:
	bl	checkLevelSkip.part.0
	b	.L387
.L428:
	ldr	r0, .L431+80
	ldr	r3, .L431+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L431+88
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, .L431+92
	str	r3, [r2]
	ldr	r2, .L431+96
	str	r3, [r2]
	ldr	r2, .L431+100
	str	r3, [r2]
	ldr	r2, .L431+104
	mov	ip, #512
	str	r3, [r2]
	mov	r2, #10
	str	r3, [r6]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	ldr	r1, .L431+72
	ldr	r0, .L431+108
.L392:
	sub	r3, r2, #10
	cmp	r3, #22
	bhi	.L394
	ldrb	r3, [r0, r3]
	add	pc, pc, r3, lsl #2
.Lrtx396:
	nop
	.section	.rodata
.L396:
	.byte	(.L393-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L393-.Lrtx396-4)/4
	.byte	(.L393-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L394-.Lrtx396-4)/4
	.byte	(.L393-.Lrtx396-4)/4
	.byte	(.L393-.Lrtx396-4)/4
	.byte	(.L395-.Lrtx396-4)/4
	.text
	.p2align 2
.L393:
	strh	ip, [r1, #80]	@ movhi
.L394:
	add	r2, r2, #1
	add	r1, r1, #8
	b	.L392
.L395:
	ldr	r0, .L431+112
	ldr	r3, .L431+84
	mov	lr, pc
	bx	r3
	b	.L391
.L427:
	ldr	r3, .L431+104
	ldr	r0, .L431+116
	ldr	r1, [r3]
	ldr	r7, .L431+84
	mov	lr, pc
	bx	r7
	mov	r0, r4
	ldr	r3, .L431+120
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #8]
	ldr	ip, [r4, #12]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #20]
	add	r3, r1, r3
	add	ip, r2, ip
	str	r3, [r4, #8]
	ldr	r0, .L431+124
	str	ip, [sp]
	str	ip, [r4, #12]
	mov	lr, pc
	bx	r7
	b	.L390
.L426:
	ldr	r3, .L431+88
	mov	lr, pc
	bx	r3
	b	.L389
.L430:
	bl	goToPause
	b	.L399
.L429:
	ldr	r0, .L431+128
.L423:
	ldr	r3, .L431+84
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	goToPrinceCutscene
.L425:
	ldr	r0, .L431+132
	ldr	r3, .L431+84
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	goToLose
.L432:
	.align	2
.L431:
	.word	player
	.word	updatePlayer
	.word	updatePatternSpriteTimer
	.word	updateEnemies
	.word	.LANCHOR1
	.word	updateButtons
	.word	updateButtonEffects
	.word	playerLives
	.word	automaticMovementActive
	.word	checkTileCollision
	.word	testAccessoryVisibility
	.word	isAutomaticMovementFinished
	.word	areAllEnemiesKilled
	.word	.LC57
	.word	drawPlayer
	.word	drawPatternSprite
	.word	drawButtons
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.word	.LC54
	.word	mgba_printf
	.word	debugAutomaticMovementState
	.word	sequenceComplete
	.word	showAccessory
	.word	rightTrianglePatternActive
	.word	currentMovementStep
	.word	.L396
	.word	.LC56
	.word	.LC52
	.word	updateAutomaticMovement
	.word	.LC53
	.word	.LC58
	.word	.LC51
	.size	playing, .-playing
	.section	.rodata.str1.4
	.align	2
.LC59:
	.ascii	"Player has no lives left in Level 2! Game Over!\000"
	.align	2
.LC60:
	.ascii	"=== playing2: USING EM CAMERA (%d,%d) ===\000"
	.align	2
.LC61:
	.ascii	"Parallax ACTIVE: scroll=%d\000"
	.align	2
.LC62:
	.ascii	"Parallax PAUSED for automatic movement 2\000"
	.align	2
.LC63:
	.ascii	"Pattern scrolling ACTIVE: patternScroll=%d\000"
	.align	2
.LC64:
	.ascii	"Pattern scrolling PAUSED (autoMove2=%d, boss=%d)\000"
	.align	2
.LC65:
	.ascii	"AUTO MOVEMENT2 ACTIVE - Step: %d\000"
	.align	2
.LC66:
	.ascii	"Player2 Vel: (%d,%d), Pos: (%d,%d)\000"
	.align	2
.LC67:
	.ascii	"Pre-boss check - Palettes: %x, %x\000"
	.align	2
.LC68:
	.ascii	"AUTO MOVEMENT2 FINISHED AND TIMER EXPIRED - Full re"
	.ascii	"set\000"
	.align	2
.LC70:
	.ascii	"Automatic movement2 reset. Ready for next sequence."
	.ascii	"\000"
	.align	2
.LC71:
	.ascii	"All enemies killed in Level 2! You win!\000"
	.align	2
.LC72:
	.ascii	"LEVEL2 SECOND SPRITE ACTIVATED! BaseIndex=%d\012\000"
	.align	2
.LC73:
	.ascii	"BOSS SPAWNED - Checking palettes...\000"
	.align	2
.LC74:
	.ascii	"BG_PALETTE[0]: %x, BG_PALETTE[16]: %x\000"
	.text
	.align	2
	.global	playing2
	.syntax unified
	.arm
	.type	playing2, %function
playing2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L524
	ldr	r3, [r3]
	cmp	r3, #0
	sub	sp, sp, #12
	ble	.L511
	ldr	r3, .L524+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L512
.L435:
	ldr	r6, .L524+8
	ldr	r10, [r6, #8]
	ldr	r4, [r6, #12]
	sub	r10, r10, #88
	cmp	r10, #16
	sub	r4, r4, #48
	movge	r10, #16
	cmp	r4, #96
	movge	r4, #96
	ldr	r9, .L524+12
	bic	r10, r10, r10, asr #31
	bic	r4, r4, r4, asr #31
.L436:
	ldr	r8, .L524+16
	ldr	r1, [r8]
	lsl	r4, r4, #16
	lsl	r7, r10, #16
	cmp	r1, #0
	lsr	r4, r4, #16
	lsr	r7, r7, #16
	bne	.L437
	ldr	r5, .L524+20
	ldr	r3, [r5, #60]
	sub	r3, r3, #1
	cmn	r3, #254
	movlt	r3, r1
	mov	r2, #67108864
	addge	r10, r10, r3
	add	r10, r10, #256
	str	r3, [r5, #60]
	movge	r1, r3
	rsbs	r3, r10, #0
	and	r3, r3, #255
	and	r10, r10, #255
	rsbpl	r10, r3, #0
	lsl	r10, r10, #16
	lsr	r10, r10, #16
	strh	r10, [r2, #16]	@ movhi
	ldr	r0, .L524+24
	strh	r4, [r2, #18]	@ movhi
	mov	lr, pc
	bx	r9
.L439:
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L440
	ldr	r0, [r5, #64]
	ldr	ip, [r5, #68]
	add	r0, r0, #1
	cmp	ip, #0
	str	r0, [r5, #64]
	ldr	r1, [r5, #72]
	beq	.L441
	cmp	ip, #1
	bne	.L513
	cmp	r0, #89
	add	r2, r7, r1
	lsl	r2, r2, #16
	strgt	r3, [r5, #68]
	strgt	r3, [r5, #64]
	ldr	r10, .L524+28
	lsr	r2, r2, #16
.L443:
	mov	r3, #67108864
	ldr	r0, .L524+32
	strh	r2, [r3, #20]	@ movhi
	strh	r4, [r3, #22]	@ movhi
	mov	lr, pc
	bx	r9
	b	.L455
.L512:
	ldr	r3, .L524+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L435
	ldr	r2, .L524+40
	ldr	r3, .L524+44
	ldr	r10, [r2]
	ldr	r4, [r3]
	mov	r1, r10
	mov	r2, r4
	ldr	r0, .L524+48
	ldr	r9, .L524+12
	mov	lr, pc
	bx	r9
	ldr	r6, .L524+8
	b	.L436
.L440:
	mov	r1, r3
	mov	r3, #67108864
	ldr	r10, .L524+28
	ldr	r0, .L524+52
	ldr	r2, [r10, #16]
	strh	r7, [r3, #20]	@ movhi
	strh	r4, [r3, #22]	@ movhi
	mov	lr, pc
	bx	r9
.L455:
	mov	r3, #67108864
	strh	r7, [r3, #24]	@ movhi
	strh	r4, [r3, #26]	@ movhi
	ldr	r3, [r6, #8]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r6, #8]
	blt	.L457
	cmp	r3, #240
	movgt	r3, #240
	strgt	r3, [r6, #8]
.L457:
	ldr	r0, .L524+8
	ldr	r3, .L524+56
	mov	lr, pc
	bx	r3
	ldr	r0, .L524+8
	ldr	r3, .L524+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L524+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L524+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L524+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L524+76
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5, #4]
	tst	r3, #1
	beq	.L458
	ldrh	r3, [r5, #6]
	tst	r3, #1
	bleq	checkLevelSkip.part.0
.L458:
	bl	togglePaletteRows
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L514
.L459:
	ldr	r3, .L524+80
	ldr	r0, .L524+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L515
	ldr	r3, [r10, #16]
	ldr	r2, [r5, #76]
	orrs	r3, r3, r2
	beq	.L516
.L461:
	ldr	r3, .L524+84
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L462
	ldr	r4, [r10, #16]
	cmp	r4, #0
	bne	.L462
	ldr	r3, .L524+88
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L517
.L462:
	ldr	r3, .L524+92
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L468
	ldr	r3, .L524+96
	ldr	r3, [r3, #56]
	cmp	r3, #2
	beq	.L518
.L468:
	ldrh	r3, [r5, #4]
	tst	r3, #4
	beq	.L469
	ldrh	r3, [r5, #6]
	tst	r3, #4
	beq	.L519
.L469:
	ldr	r4, .L524+100
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L520
.L470:
	ldr	r3, .L524+104
	mov	lr, pc
	bx	r3
	ldr	r3, [r10, #16]
	ldr	r2, [r5, #80]
	cmp	r3, r2
	beq	.L471
	cmp	r3, #0
	bne	.L521
.L472:
	str	r3, [r5, #80]
.L471:
	ldr	r0, .L524+8
	ldr	r3, .L524+108
	mov	lr, pc
	bx	r3
	ldr	r0, .L524+8
	ldr	r3, .L524+112
	mov	lr, pc
	bx	r3
	ldr	r3, .L524+116
	mov	lr, pc
	bx	r3
	ldr	r0, .L524+8
	ldr	r3, .L524+120
	mov	lr, pc
	bx	r3
	ldr	r0, .L524+8
	ldr	r3, .L524+124
	mov	lr, pc
	bx	r3
	ldr	r4, .L524+128
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L524+132
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L524+136
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L515:
	ldr	r3, .L524+140
	ldr	r0, .L524+144
	ldr	r1, [r3]
	mov	lr, pc
	bx	r9
	ldr	r0, .L524+8
	ldr	r3, .L524+148
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #8]
	ldr	r2, [r6, #20]
	ldr	ip, [r6, #12]
	ldr	r1, [r6, #16]
	add	ip, r2, ip
	add	r3, r1, r3
	str	r3, [r6, #8]
	ldr	r0, .L524+152
	str	ip, [sp]
	str	ip, [r6, #12]
	mov	lr, pc
	bx	r9
	ldr	r3, [r10, #16]
	ldr	r2, [r5, #76]
	orrs	r3, r3, r2
	bne	.L461
.L516:
	mov	r3, #83886080
	ldr	r0, .L524+156
	ldrh	r2, [r3, #32]
	ldrh	r1, [r3]
	mov	lr, pc
	bx	r9
	mov	r3, #1
	str	r3, [r5, #76]
	b	.L461
.L514:
	ldr	r3, .L524+160
	mov	lr, pc
	bx	r3
	b	.L459
.L437:
	mov	r3, #67108864
	ldr	r0, .L524+164
	strh	r7, [r3, #16]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	r5, .L524+20
	b	.L439
.L520:
	mov	r3, #64
	mov	r1, #8
	ldr	r2, .L524+168
	str	r3, [r2]
	ldr	r2, .L524+172
	str	r3, [r2]
	ldr	r3, .L524+176
	ldr	r0, .L524+180
	str	r1, [r3]
	mov	lr, pc
	bx	r9
	mov	r3, #0
	str	r3, [r4]
	b	.L470
.L513:
	add	r2, r7, r1
	lsl	r2, r2, #16
	ldr	r10, .L524+28
	lsr	r2, r2, #16
	b	.L443
.L441:
	add	r1, r1, #2
	cmp	r1, #255
	movgt	r1, ip
	ldr	r3, [r6, #12]
	addle	r2, r7, r1
	lslle	r2, r2, #16
	sub	r3, r3, #15
	movle	ip, r1
	movgt	r2, r7
	lsrle	r2, r2, #16
	cmp	r3, #130
	str	r1, [r5, #72]
	ldr	r10, .L524+28
	bhi	.L446
	ldr	r3, [r10, #16]
	cmp	r3, #0
	beq	.L522
.L446:
	ldr	r3, .L524+184
	add	r1, r3, #320
.L452:
	ldr	lr, [r3, #16]
	cmp	lr, #0
	beq	.L450
	ldr	lr, [r3, #68]
	cmp	lr, #1
	beq	.L523
.L450:
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L452
	cmp	r0, #119
	movgt	r3, #1
	strgt	r3, [r5, #68]
	movgt	r3, #0
	mov	r1, ip
	strgt	r3, [r5, #64]
	b	.L443
.L517:
	ldr	r0, .L524+188
	mov	lr, pc
	bx	r9
	ldr	r3, .L524+160
	mov	lr, pc
	bx	r3
	mov	r2, #10
	mov	ip, #512
	ldr	r3, .L524+192
	str	r4, [r3]
	ldr	r3, .L524+140
	str	r4, [r3]
	ldr	r3, .L524+196
	str	r4, [r3]
	ldr	r3, .L524+200
	str	r4, [r3]
	ldr	r3, .L524+204
	str	r4, [r3]
	ldr	r3, .L524+36
	str	r4, [r8]
	str	r4, [r6, #16]
	str	r4, [r6, #20]
	str	r4, [r3]
	ldr	r1, .L524+132
	ldr	r0, .L524+208
.L463:
	sub	r3, r2, #10
	cmp	r3, #22
	bhi	.L465
	ldrb	r3, [r0, r3]
	add	pc, pc, r3, lsl #2
.Lrtx467:
	nop
	.section	.rodata
.L467:
	.byte	(.L464-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L464-.Lrtx467-4)/4
	.byte	(.L464-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L465-.Lrtx467-4)/4
	.byte	(.L464-.Lrtx467-4)/4
	.byte	(.L464-.Lrtx467-4)/4
	.byte	(.L466-.Lrtx467-4)/4
	.text
	.p2align 2
.L464:
	strh	ip, [r1, #80]	@ movhi
.L465:
	add	r2, r2, #1
	add	r1, r1, #8
	b	.L463
.L466:
	ldr	r0, .L524+212
	mov	lr, pc
	bx	r9
	b	.L462
.L521:
	ldr	r0, .L524+216
	mov	lr, pc
	bx	r9
	mov	r3, #83886080
	ldr	r0, .L524+220
	ldrh	r2, [r3, #32]
	ldrh	r1, [r3]
	mov	lr, pc
	bx	r9
	ldr	r3, [r10, #16]
	b	.L472
.L511:
	ldr	r0, .L524+224
	ldr	r3, .L524+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	goToLose
.L518:
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L468
	ldr	r0, .L524+228
	mov	lr, pc
	bx	r9
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	goToWin
.L519:
	bl	goToPause
	b	.L469
.L523:
	ldr	fp, [r3, #8]
	rsb	fp, fp, #-16777216
	ldr	lr, [r3]
	add	fp, fp, #16711680
	add	fp, fp, #65280
	sub	lr, lr, #2
	add	fp, fp, #246
	cmp	lr, fp
	str	lr, [r3]
	bgt	.L450
	mov	lr, #0
	str	lr, [r3, #16]
	ldr	lr, .L524+232
	ldr	fp, [lr]
	sub	fp, fp, #1
	str	fp, [lr]
	b	.L450
.L522:
	ldr	r1, [r6, #8]
	subs	r1, r1, #2
	movpl	r3, r1
	str	r3, [r6, #8]
	b	.L446
.L525:
	.align	2
.L524:
	.word	playerLives
	.word	emCameraActive
	.word	player
	.word	mgba_printf
	.word	automaticMovementActive2
	.word	.LANCHOR1
	.word	.LC61
	.word	boss
	.word	.LC63
	.word	emPatternActive2
	.word	worldCameraX
	.word	worldCameraY
	.word	.LC60
	.word	.LC64
	.word	updateEnemies
	.word	updatePlayer
	.word	updateButtons2
	.word	updatePatternSpriteTimer2
	.word	updateEmPatternSpriteTimer2
	.word	updateButtonEffects
	.word	checkTileCollision2
	.word	isAutomaticMovementFinished2
	.word	patternSpriteTimer2
	.word	areAllEnemiesKilled
	.word	.LANCHOR0
	.word	spriteChanged2
	.word	debugCollisionPaletteColors
	.word	drawPlayer
	.word	drawPatternSprite2
	.word	debugIsoscelesSpriteState2
	.word	drawEmPatternSprite2
	.word	drawButtons2
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.word	currentMovementStep2
	.word	.LC65
	.word	updateAutomaticMovement2
	.word	.LC66
	.word	.LC67
	.word	debugAutomaticMovementState2
	.word	.LC62
	.word	playerSpriteWidth
	.word	playerSpriteHeight
	.word	playerSpriteBaseIndex
	.word	.LC72
	.word	enemies
	.word	.LC68
	.word	sequenceComplete2
	.word	automaticMovementFinished2
	.word	showAccessory2
	.word	rightTrianglePatternActive2
	.word	.L467
	.word	.LC70
	.word	.LC73
	.word	.LC74
	.word	.LC59
	.word	.LC71
	.word	enemyCount
	.size	playing2, .-playing2
	.section	.rodata.str1.4
	.align	2
.LC75:
	.ascii	"SCROLL CORRUPTION: BG0HOFF changed from %d to %d\000"
	.align	2
.LC76:
	.ascii	"SCROLL CORRUPTION: BG1HOFF changed from %d to %d\000"
	.text
	.align	2
	.global	checkScrollCorruption
	.syntax unified
	.arm
	.type	checkScrollCorruption, %function
checkScrollCorruption:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L531
	push	{r4, r5, r6, lr}
	ldr	r1, [r3, #84]
	ldrh	r4, [r2, #16]
	cmp	r1, r4
	ldrh	r5, [r2, #20]
	beq	.L527
	ldr	r2, [r3]
	cmp	r2, #6
	beq	.L530
.L528:
	str	r4, [r3, #84]
	str	r5, [r3, #88]
	pop	{r4, r5, r6, lr}
	bx	lr
.L530:
	ldr	r3, .L531+4
	mov	r2, r4
	ldr	r0, .L531+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L531
.L527:
	ldr	r1, [r3, #88]
	cmp	r1, r5
	beq	.L528
	ldr	r2, [r3]
	cmp	r2, #6
	bne	.L528
	mov	r2, r5
	ldr	r3, .L531+4
	ldr	r0, .L531+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L531
	str	r4, [r3, #84]
	str	r5, [r3, #88]
	pop	{r4, r5, r6, lr}
	bx	lr
.L532:
	.align	2
.L531:
	.word	.LANCHOR1
	.word	mgba_printf
	.word	.LC75
	.word	.LC76
	.size	checkScrollCorruption, .-checkScrollCorruption
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L546
	ldr	r0, .L546+4
	ldr	r3, .L546+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #16]
	cmp	r2, #0
	beq	.L542
	ldr	r2, .L546+12
	ldr	r2, [r2]
	cmp	r2, #2
	beq	.L543
.L535:
	cmp	r2, #6
	beq	.L544
.L536:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L545
.L537:
	ldr	r4, .L546+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L546+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L542:
	ldr	r2, .L546+24
	mov	lr, pc
	bx	r2
	ldr	r2, .L546+12
	ldr	r2, [r2]
	cmp	r2, #2
	bne	.L535
.L543:
	ldr	r0, .L546+4
	ldr	r2, .L546+28
	mov	lr, pc
	bx	r2
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L537
.L545:
	ldr	r3, .L546+32
	mov	lr, pc
	bx	r3
	b	.L537
.L544:
	ldr	r0, .L546+4
	ldr	r2, .L546+36
	mov	lr, pc
	bx	r2
	b	.L536
.L547:
	.align	2
.L546:
	.word	boss
	.word	player
	.word	drawPlayer
	.word	.LANCHOR1
	.word	DMANow
	.word	shadowOAM
	.word	drawEnemies
	.word	drawButtons
	.word	drawBoss
	.word	drawButtons2
	.size	drawGame, .-drawGame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L572
	mov	lr, pc
	bx	r3
	ldr	r4, .L572+4
	ldr	r10, .L572+8
	ldr	r9, .L572+12
	ldr	r8, .L572+16
	ldr	r7, .L572+20
	ldr	fp, .L572+24
	ldr	r6, .L572+28
	ldr	r5, .L572+32
.L562:
	ldrh	r3, [r4, #6]
	strh	r3, [r4, #4]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #6]	@ movhi
	mov	lr, pc
	bx	r10
	ldr	r3, [r4]
	cmp	r3, #9
	bhi	.L549
	ldrb	r3, [r9, r3]
	add	pc, pc, r3, lsl #2
.Lrtx551:
	nop
	.section	.rodata
.L551:
	.byte	(.L560-.Lrtx551-4)/4
	.byte	(.L559-.Lrtx551-4)/4
	.byte	(.L558-.Lrtx551-4)/4
	.byte	(.L557-.Lrtx551-4)/4
	.byte	(.L556-.Lrtx551-4)/4
	.byte	(.L555-.Lrtx551-4)/4
	.byte	(.L554-.Lrtx551-4)/4
	.byte	(.L553-.Lrtx551-4)/4
	.byte	(.L552-.Lrtx551-4)/4
	.byte	(.L550-.Lrtx551-4)/4
	.section	.text.startup
	.p2align 2
.L550:
	ldr	r3, .L572+36
	mov	lr, pc
	bx	r3
.L549:
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	ldr	r3, [r4]
	bic	r3, r3, #4
	cmp	r3, #2
	moveq	lr, pc
	bxeq	fp
.L561:
	mov	lr, pc
	bx	r6
	b	.L562
.L552:
	ldr	r3, .L572+40
	mov	lr, pc
	bx	r3
	b	.L549
.L553:
	ldr	r3, .L572+44
	mov	lr, pc
	bx	r3
	b	.L549
.L554:
	ldr	r3, .L572+48
	mov	lr, pc
	bx	r3
	b	.L549
.L555:
	ldr	r3, .L572+52
	mov	lr, pc
	bx	r3
	b	.L549
.L556:
	ldrh	r3, [r4, #4]
	tst	r3, #8
	beq	.L549
	ldrh	r3, [r4, #6]
	tst	r3, #8
	bne	.L549
	ldr	r0, .L572+56
	ldr	r3, .L572+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L572+64
	mov	lr, pc
	bx	r3
	b	.L549
.L557:
	ldr	r3, .L572+68
	mov	lr, pc
	bx	r3
	b	.L549
.L558:
	ldr	r3, .L572+72
	mov	lr, pc
	bx	r3
	b	.L549
.L560:
	ldr	r3, .L572+76
	mov	lr, pc
	bx	r3
	b	.L549
.L559:
	ldrh	r3, [r4, #4]
	tst	r3, #2
	beq	.L549
	ldrh	r3, [r4, #6]
	tst	r3, #2
	bne	.L549
	ldr	r3, .L572+64
	mov	lr, pc
	bx	r3
	b	.L549
.L573:
	.align	2
.L572:
	.word	initialize
	.word	.LANCHOR1
	.word	updateMusicForState
	.word	.L551
	.word	checkScrollCorruption
	.word	debugCollisionMapTopArea
	.word	drawGame
	.word	waitForVBlank
	.word	67109120
	.word	princeCutscene
	.word	mode0Cutscene
	.word	cutscene
	.word	playing2
	.word	win
	.word	.LC18
	.word	mgba_printf
	.word	goToStart
	.word	pause
	.word	playing
	.word	start
	.size	main, .-main
	.text
	.align	2
	.global	checkLevelSkip
	.syntax unified
	.arm
	.type	checkLevelSkip, %function
checkLevelSkip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L579
	ldrh	r2, [r3, #4]
	tst	r2, #1
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #1
	bxne	lr
	b	checkLevelSkip.part.0
.L580:
	.align	2
.L579:
	.word	.LANCHOR1
	.size	checkLevelSkip, .-checkLevelSkip
	.section	.rodata.str1.4
	.align	2
.LC78:
	.ascii	"BG1 CORRUPTION DETECTED: %d -> %d\000"
	.align	2
.LC79:
	.ascii	"Player: (%d,%d), Boss Active: %d, AutoMove: %d\000"
	.text
	.align	2
	.global	debugBG1Corruption
	.syntax unified
	.arm
	.type	debugBG1Corruption, %function
debugBG1Corruption:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, r5, r6, lr}
	ldrh	r4, [r3, #20]
	cmp	r4, #255
	ldr	r5, .L587
	sub	sp, sp, #8
	ble	.L582
	ldr	r1, [r5, #92]
	cmp	r1, #255
	ble	.L586
.L582:
	str	r4, [r5, #92]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L586:
	mov	r2, r4
	ldr	r6, .L587+4
	ldr	r0, .L587+8
	mov	lr, pc
	bx	r6
	ldr	r2, .L587+12
	ldr	r3, .L587+16
	ldr	r2, [r2]
	ldr	r1, .L587+20
	ldr	r3, [r3, #16]
	str	r2, [sp]
	add	r1, r1, #8
	ldm	r1, {r1, r2}
	ldr	r0, .L587+24
	mov	lr, pc
	bx	r6
	str	r4, [r5, #92]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L588:
	.align	2
.L587:
	.word	.LANCHOR1
	.word	mgba_printf
	.word	.LC78
	.word	automaticMovementActive2
	.word	boss
	.word	player
	.word	.LC79
	.size	debugBG1Corruption, .-debugBG1Corruption
	.global	returnAfterCutscene
	.global	princePalette
	.global	princeImages
	.global	TOTAL_PRINCE_FRAMES
	.global	PRINCE_CUTSCENE_FRAME_DURATION
	.global	princeCutsceneFrame
	.global	princeCutsceneTimer
	.global	cutsceneImages
	.global	cutscenePalette
	.global	TOTAL_CUTSCENE_FRAMES
	.global	CUTSCENE_FRAME_DURATION
	.global	cutsceneTimer
	.global	cutsceneFrame
	.global	playerWalkY
	.global	PLAYER_WALK_SPEED
	.global	PLAYER_WALK_TARGET_X
	.global	playerWalkX
	.global	mode0CutsceneTimer
	.global	state
	.global	currentLevel
	.global	returningFromPause
	.global	currentMusic
	.global	previousState
	.global	oldButtons
	.global	buttons
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	currentMusic, %object
	.size	currentMusic, 4
currentMusic:
	.word	-1
	.type	playerWalkX, %object
	.size	playerWalkX, 4
playerWalkX:
	.word	-64
	.type	playerWalkY, %object
	.size	playerWalkY, 4
playerWalkY:
	.word	80
	.type	cutscenePalette, %object
	.size	cutscenePalette, 4
cutscenePalette:
	.word	alarm5Pal
	.type	cutsceneImages, %object
	.size	cutsceneImages, 40
cutsceneImages:
	.word	space1Bitmap
	.word	space2Bitmap
	.word	space3Bitmap
	.word	space4Bitmap
	.word	space5Bitmap
	.word	alarm1Bitmap
	.word	alarm2Bitmap
	.word	alarm3Bitmap
	.word	alarm4Bitmap
	.word	alarm5Bitmap
	.type	currentLevel, %object
	.size	currentLevel, 4
currentLevel:
	.word	1
	.type	princePalette, %object
	.size	princePalette, 4
princePalette:
	.word	prince1Pal
	.type	princeImages, %object
	.size	princeImages, 16
princeImages:
	.word	prince1Bitmap
	.word	prince2Bitmap
	.word	prince3Bitmap
	.word	prince4Bitmap
	.type	firstTimeEnteringLevel2.3, %object
	.size	firstTimeEnteringLevel2.3, 4
firstTimeEnteringLevel2.3:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.type	oldButtons, %object
	.size	oldButtons, 2
oldButtons:
	.space	2
	.type	buttons, %object
	.size	buttons, 2
buttons:
	.space	2
	.type	redTileMode_PLAYING.19, %object
	.size	redTileMode_PLAYING.19, 4
redTileMode_PLAYING.19:
	.space	4
	.type	redTileMode_PLAYING2.17, %object
	.size	redTileMode_PLAYING2.17, 4
redTileMode_PLAYING2.17:
	.space	4
	.type	redTileMode_PLAYING.15, %object
	.size	redTileMode_PLAYING.15, 4
redTileMode_PLAYING.15:
	.space	4
	.type	redTileMode_PLAYING2.13, %object
	.size	redTileMode_PLAYING2.13, 4
redTileMode_PLAYING2.13:
	.space	4
	.type	mode0CutsceneTimer, %object
	.size	mode0CutsceneTimer, 4
mode0CutsceneTimer:
	.space	4
	.type	returnAfterCutscene, %object
	.size	returnAfterCutscene, 4
returnAfterCutscene:
	.space	4
	.type	cutsceneFrame, %object
	.size	cutsceneFrame, 4
cutsceneFrame:
	.space	4
	.type	cutsceneTimer, %object
	.size	cutsceneTimer, 4
cutsceneTimer:
	.space	4
	.type	returningFromPause, %object
	.size	returningFromPause, 4
returningFromPause:
	.space	4
	.type	previousState, %object
	.size	previousState, 4
previousState:
	.space	4
	.type	princeCutsceneTimer, %object
	.size	princeCutsceneTimer, 4
princeCutsceneTimer:
	.space	4
	.type	princeCutsceneFrame, %object
	.size	princeCutsceneFrame, 4
princeCutsceneFrame:
	.space	4
	.type	debugFrame.4, %object
	.size	debugFrame.4, 4
debugFrame.4:
	.space	4
	.type	parallaxScroll.11, %object
	.size	parallaxScroll.11, 4
parallaxScroll.11:
	.space	4
	.type	scrollTimer.10, %object
	.size	scrollTimer.10, 4
scrollTimer.10:
	.space	4
	.type	scrollState.9, %object
	.size	scrollState.9, 4
scrollState.9:
	.space	4
	.type	patternScroll.8, %object
	.size	patternScroll.8, 4
patternScroll.8:
	.space	4
	.type	preBossCheck.6, %object
	.size	preBossCheck.6, 4
preBossCheck.6:
	.space	4
	.type	lastBossState.5, %object
	.size	lastBossState.5, 4
lastBossState.5:
	.space	4
	.type	lastBG0HOFF.2, %object
	.size	lastBG0HOFF.2, 4
lastBG0HOFF.2:
	.space	4
	.type	lastBG1HOFF.1, %object
	.size	lastBG1HOFF.1, 4
lastBG1HOFF.1:
	.space	4
	.type	lastValidBG1.0, %object
	.size	lastValidBG1.0, 4
lastValidBG1.0:
	.space	4
	.section	.rodata
	.align	2
	.type	TOTAL_PRINCE_FRAMES, %object
	.size	TOTAL_PRINCE_FRAMES, 4
TOTAL_PRINCE_FRAMES:
	.word	4
	.type	PRINCE_CUTSCENE_FRAME_DURATION, %object
	.size	PRINCE_CUTSCENE_FRAME_DURATION, 4
PRINCE_CUTSCENE_FRAME_DURATION:
	.word	30
	.type	TOTAL_CUTSCENE_FRAMES, %object
	.size	TOTAL_CUTSCENE_FRAMES, 4
TOTAL_CUTSCENE_FRAMES:
	.word	10
	.type	CUTSCENE_FRAME_DURATION, %object
	.size	CUTSCENE_FRAME_DURATION, 4
CUTSCENE_FRAME_DURATION:
	.word	15
	.type	PLAYER_WALK_SPEED, %object
	.size	PLAYER_WALK_SPEED, 4
PLAYER_WALK_SPEED:
	.word	2
	.type	PLAYER_WALK_TARGET_X, %object
	.size	PLAYER_WALK_TARGET_X, 4
PLAYER_WALK_TARGET_X:
	.word	240
	.ident	"GCC: (devkitARM release 66) 15.1.0"
