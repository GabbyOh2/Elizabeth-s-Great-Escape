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
	.file	"collision2.c"
	.text
	.align	2
	.global	initPatternPositions2
	.syntax unified
	.arm
	.type	initPatternPositions2, %function
initPatternPositions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	mov	r4, #110
	mov	r5, #128
	mov	r2, #170
	mov	fp, #40
	mov	ip, #170
	mov	r1, #512
	ldr	r3, .L4
	mov	r0, #0
	str	r4, [r3, #16]
	str	r5, [r3, #20]
	mov	r4, #128
	str	r2, [r3, #8]
	ldr	r2, .L4+4
	stm	r3, {fp-ip}
	ldr	ip, .L4+8
	add	lr, r2, #720
	strh	r1, [lr]	@ movhi
	ldr	lr, [ip]
	lsl	lr, lr, #3
	strh	r1, [r2, lr]	@ movhi
	ldr	lr, [ip, #4]
	ldr	ip, [ip, #8]
	lsl	lr, lr, #3
	lsl	ip, ip, #3
	strh	r1, [r2, lr]	@ movhi
	str	r4, [r3, #24]
	strh	r1, [r2, ip]	@ movhi
	str	r0, [r3, #28]
	str	r0, [r3, #32]
	str	r0, [r3, #36]
	pop	{r4, r5, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.size	initPatternPositions2, .-initPatternPositions2
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"drawPatternSprite2: EM pattern active - hiding\000"
	.align	2
.LC1:
	.ascii	"drawPatternSprite2: Not drawing - show=%d, timer=%d"
	.ascii	", pattern=%d\000"
	.text
	.align	2
	.global	drawPatternSprite2
	.syntax unified
	.arm
	.type	drawPatternSprite2, %function
drawPatternSprite2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L18
	ldr	r3, [ip, #40]
	cmp	r3, #0
	push	{r4, lr}
	bne	.L17
	add	r1, ip, #32
	ldm	r1, {r1, r2}
	cmp	r1, #0
	ldr	r3, [ip, #28]
	beq	.L9
	cmp	r2, #0
	ble	.L9
	cmp	r3, #0
	beq	.L9
	ldr	r1, [r0, #8]
	sub	r3, r3, #1
	sub	r1, r1, #88
	ldr	r2, [ip, r3, lsl #2]
	bic	r1, r1, r1, asr #31
	cmp	r1, #16
	suble	r2, r2, r1
	subgt	r2, r2, #16
	add	r1, r2, #64
	cmp	r1, #304
	bhi	.L11
	ldr	r1, [r0, #12]
	add	ip, ip, r3, lsl #2
	sub	r3, r1, #48
	bic	r3, r3, r3, asr #31
	ldr	r0, [ip, #16]
	cmp	r3, #96
	suble	r1, r0, r3
	subgt	r1, r0, #96
	add	r3, r1, #64
	cmp	r3, #224
	bhi	.L11
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	ldr	r3, .L18+4
	ldr	r0, .L18+8
	and	r1, r1, #255
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L9:
	ldr	r0, .L18+12
	ldr	ip, .L18+16
	mov	lr, pc
	bx	ip
	mov	r2, #512
	ldr	r3, .L18+4
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L17:
	ldr	r3, .L18+16
	ldr	r0, .L18+20
	mov	lr, pc
	bx	r3
	mov	r2, #512
	ldr	r3, .L18+4
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L11:
	mov	r2, #512
	ldr	r3, .L18+4
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.word	shadowOAM+720
	.word	29304
	.word	.LC1
	.word	mgba_printf
	.word	.LC0
	.size	drawPatternSprite2, .-drawPatternSprite2
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"EM Sprite: OFF SCREEN at screen(%d,%d) - hiding\000"
	.align	2
.LC6:
	.ascii	"EM Sprite: Pattern%d, Pause%d - World(%d,%d) -> Scr"
	.ascii	"een(%d,%d) Camera(%d,%d)\000"
	.text
	.align	2
	.global	drawEmPatternSprite2
	.syntax unified
	.arm
	.type	drawEmPatternSprite2, %function
drawEmPatternSprite2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	lr, .L55
	ldr	r3, [lr, #44]
	cmp	r3, #0
	sub	sp, sp, #24
	beq	.L50
	ldr	r1, [lr, #28]
	cmp	r1, #1
	beq	.L51
	cmp	r1, #2
	beq	.L52
	cmp	r1, #3
	beq	.L53
.L48:
	mov	r3, #0
	mov	r5, r3
.L24:
	ldr	r2, .L55+4
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L41
.L54:
	ldr	r2, .L55+8
	ldr	r0, [r2]
	ldr	r2, .L55+12
	ldr	ip, [r2]
	sub	r2, r5, r0
	mov	r6, r2
	add	r2, r2, #64
	cmp	r2, #304
	sub	r4, r3, ip
	bhi	.L42
	add	r2, r4, #64
	cmp	r2, #224
	bhi	.L42
.L44:
	str	ip, [sp, #16]
	str	r0, [sp, #12]
	str	r3, [sp]
	ldr	r2, [lr, #48]
	mov	r3, r5
	str	r4, [sp, #8]
	str	r6, [sp, #4]
	ldr	r0, .L55+16
	ldr	ip, .L55+20
	add	r2, r2, #1
	mov	lr, pc
	bx	ip
	ldr	r2, .L55+24
	ldr	r3, .L55+28
	strh	r3, [r2, #4]	@ movhi
	lsl	r3, r6, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	and	r4, r4, #255
	strh	r4, [r2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	ldr	r3, [lr, #48]
	ldr	r2, .L55+32
	cmp	r3, #3
	bhi	.L48
	ldrb	r3, [r2, r3]
	add	pc, pc, r3, lsl #2
.Lrtx26:
	nop
	.section	.rodata
.L26:
	.byte	(.L39-.Lrtx26-4)/4
	.byte	(.L38-.Lrtx26-4)/4
	.byte	(.L36-.Lrtx26-4)/4
	.byte	(.L40-.Lrtx26-4)/4
	.text
	.p2align 2
.L50:
	mov	r2, #512
	ldr	r3, .L55+24
	strh	r2, [r3]	@ movhi
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	ldr	r3, [lr, #48]
	ldr	r2, .L55+36
	cmp	r3, #3
	bhi	.L48
	ldrb	r3, [r2, r3]
	add	pc, pc, r3, lsl #2
.Lrtx37:
	nop
	.section	.rodata
.L37:
	.byte	(.L40-.Lrtx37-4)/4
	.byte	(.L39-.Lrtx37-4)/4
	.byte	(.L38-.Lrtx37-4)/4
	.byte	(.L36-.Lrtx37-4)/4
	.text
	.p2align 2
.L40:
	ldr	r2, .L55+4
	ldr	r2, [r2]
	cmp	r2, #0
	mov	r3, #192
	mov	r5, #180
	bne	.L54
.L41:
	add	r2, r0, #8
	ldm	r2, {r2, ip}
	sub	r0, r2, #88
	bic	r0, r0, r0, asr #31
	sub	ip, ip, #48
	bic	ip, ip, ip, asr #31
	cmp	r0, #16
	movge	r0, #16
	cmp	ip, #96
	movge	ip, #96
	sub	r4, r3, ip
	add	r2, r4, #64
	cmp	r2, #224
	sub	r6, r5, r0
	bls	.L44
.L42:
	mov	lr, #512
	ldr	ip, .L55+24
	mov	r2, r4
	mov	r1, r6
	ldr	r0, .L55+40
	ldr	r3, .L55+20
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r3
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	mov	r3, #0
	mov	r5, #180
	b	.L24
.L39:
	mov	r3, #192
	mov	r5, #20
	b	.L24
.L38:
	mov	r3, #0
	mov	r5, #20
	b	.L24
.L52:
	ldr	r3, [lr, #48]
	ldr	r2, .L55+44
	cmp	r3, #3
	bhi	.L48
	ldrsb	r2, [r2, r3]
	add	pc, pc, r2, lsl #2
.Lrtx33:
	nop
	.section	.rodata
.L33:
	.byte	(.L46-.Lrtx33-4)/4
	.byte	(.L36-.Lrtx33-4)/4
	.byte	(.L40-.Lrtx33-4)/4
	.byte	(.L39-.Lrtx33-4)/4
	.text
	.p2align 2
.L46:
	mov	r5, #20
	b	.L24
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.word	emCameraActive
	.word	worldCameraX
	.word	worldCameraY
	.word	.LC6
	.word	mgba_printf
	.word	shadowOAM+760
	.word	29304
	.word	.L26
	.word	.L37
	.word	.LC5
	.word	.L33
	.size	drawEmPatternSprite2, .-drawEmPatternSprite2
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"updatePatternSpriteTimer2: Timer = %d\000"
	.align	2
.LC8:
	.ascii	"updatePatternSpriteTimer2: Timer expired - clearing"
	.ascii	" isosceles pattern\000"
	.text
	.align	2
	.global	updatePatternSpriteTimer2
	.syntax unified
	.arm
	.type	updatePatternSpriteTimer2, %function
updatePatternSpriteTimer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L66
	ldr	r1, [r3, #36]
	cmp	r1, #0
	bxle	lr
	sub	r1, r1, #1
	push	{r4, lr}
	ldr	r2, .L66+4
	ldr	r0, .L66+8
	str	r1, [r3, #36]
	mov	lr, pc
	bx	r2
	ldr	r3, .L66
	ldr	r1, [r3, #36]
	cmp	r1, #0
	ldr	r2, .L66+4
	ble	.L65
	pop	{r4, lr}
	bx	lr
.L65:
	ldr	r0, .L66+12
	mov	lr, pc
	bx	r2
	mov	r2, #0
	mov	r0, #512
	ldr	r3, .L66
	ldr	r1, .L66+16
	str	r2, [r3, #32]
	str	r2, [r3, #52]
	str	r2, [r3, #28]
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC7
	.word	.LC8
	.word	shadowOAM+720
	.size	updatePatternSpriteTimer2, .-updatePatternSpriteTimer2
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"EM Pattern active - timer managed by movement syste"
	.ascii	"m\000"
	.align	2
.LC10:
	.ascii	"EM Pattern timer2: %d\000"
	.align	2
.LC11:
	.ascii	"EM TIMER EXPIRED - Hiding EM sprite2\000"
	.text
	.align	2
	.global	updateEmPatternSpriteTimer2
	.syntax unified
	.arm
	.type	updateEmPatternSpriteTimer2, %function
updateEmPatternSpriteTimer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L86
	ldr	r2, [r3, #56]
	cmp	r2, #0
	bne	.L83
	ldr	r2, [r3, #40]
	cmp	r2, #0
	push	{r4, lr}
	beq	.L71
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L84
.L71:
	ldr	r1, [r3, #60]
	cmp	r1, #0
	bgt	.L85
.L68:
	pop	{r4, lr}
	bx	lr
.L85:
	sub	r1, r1, #1
	ldr	r2, .L86+4
	ldr	r0, .L86+8
	str	r1, [r3, #60]
	mov	lr, pc
	bx	r2
	ldr	r3, .L86
	ldr	r1, [r3, #60]
	cmp	r1, #0
	ldr	r2, .L86+4
	bgt	.L68
	ldr	r0, .L86+12
	mov	lr, pc
	bx	r2
	mov	r0, #512
	mov	r2, #0
	ldr	r1, .L86+16
	ldr	r3, .L86
	strh	r0, [r1]	@ movhi
	str	r2, [r3, #44]
	b	.L68
.L83:
	mov	r2, #0
	mov	r0, #512
	ldr	r1, .L86+16
	str	r2, [r3, #44]
	strh	r0, [r1]	@ movhi
	str	r2, [r3, #60]
	bx	lr
.L84:
	ldr	r0, .L86+20
	ldr	r3, .L86+4
	mov	lr, pc
	bx	r3
	b	.L68
.L87:
	.align	2
.L86:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC10
	.word	.LC11
	.word	shadowOAM+760
	.word	.LC9
	.size	updateEmPatternSpriteTimer2, .-updateEmPatternSpriteTimer2
	.align	2
	.global	initButtons2
	.syntax unified
	.arm
	.type	initButtons2, %function
initButtons2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #41
	ldr	r3, .L90
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #40
	strb	r1, [r3, #176]
	mov	ip, #42
	mov	r0, #43
	mov	r1, #44
	strb	lr, [r3, #120]
	strb	ip, [r3, #232]
	strb	r0, [r3, #288]
	str	r2, [r3, #348]
	str	r2, [r3, #352]
	str	r2, [r3, #356]
	str	r2, [r3, #360]
	str	r2, [r3, #364]
	str	r2, [r3, #368]
	str	r2, [r3, #372]
	str	r2, [r3, #376]
	str	r2, [r3, #380]
	str	r2, [r3, #384]
	strb	r1, [r3, #344]
	ldr	lr, [sp], #4
	bx	lr
.L91:
	.align	2
.L90:
	.word	.LANCHOR0
	.size	initButtons2, .-initButtons2
	.align	2
	.global	updateButtons2
	.syntax unified
	.arm
	.type	updateButtons2, %function
updateButtons2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L99
	add	r2, r3, #20
	mov	ip, #0
	mov	r0, r2
.L96:
	ldr	r1, [r3], #4
	cmp	r1, #0
	beq	.L94
	ldr	r1, [r2]
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r2]
	strle	ip, [r3, #-4]
.L94:
	cmp	r3, r0
	add	r2, r2, #4
	bne	.L96
	bx	lr
.L100:
	.align	2
.L99:
	.word	.LANCHOR0+348
	.size	updateButtons2, .-updateButtons2
	.align	2
	.global	drawButtons2
	.syntax unified
	.arm
	.type	drawButtons2, %function
drawButtons2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L119
	ldr	r3, [r3]
	cmp	r3, #0
	sub	sp, sp, #12
	beq	.L102
	ldr	r3, .L119+4
	ldr	r3, [r3, #40]
	cmp	r3, #0
	bne	.L118
.L102:
	ldr	r10, [r0, #8]
	ldr	r2, [r0, #12]
	sub	r10, r10, #88
	bic	r10, r10, r10, asr #31
	sub	r2, r2, #48
	cmp	r10, #16
	bic	r2, r2, r2, asr #31
	movge	r10, #16
	cmp	r2, #96
	movge	r2, #96
.L103:
	mov	r5, #0
	ldr	r9, .L119+8
	ldr	r7, .L119+12
	ldr	r3, .L119+16
	add	r8, r9, #20
	add	fp, r7, #280
.L108:
	ldr	r4, [r9], #4
	sub	r4, r4, r10
	add	r0, r4, #32
	cmp	r0, #272
	mov	ip, r8
	add	r8, r8, #4
	bhi	.L104
	ldr	r6, [ip]
	sub	r6, r6, r2
	add	r0, r6, #32
	cmp	r0, #192
	bhi	.L104
	lsl	r4, r4, #23
	lsr	r4, r4, #23
	mvn	r4, r4, lsl #17
	ldr	r3, .L119+20
	mov	r0, r5
	str	r2, [sp, #4]
	mov	lr, pc
	bx	r3
	ldr	ip, [fp, r5, lsl #2]
	cmp	ip, #0
	moveq	ip, #776
	movne	ip, #780
	mvn	r4, r4, lsr #17
	ldr	r3, .L119+16
	orr	ip, ip, r0, lsl #12
	ldrb	r0, [r7, #52]	@ zero_extendqisi2
	and	r6, r6, #255
	add	lr, r3, r0, lsl #3
	orr	ip, ip, #1024
	lsl	r0, r0, #3
	strh	ip, [lr, #4]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	r6, [r3, r0]	@ movhi
	ldr	r2, [sp, #4]
.L106:
	add	r5, r5, #1
	cmp	r5, #5
	add	r7, r7, #56
	bne	.L108
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L104:
	mov	ip, #512
	ldrb	r0, [r7, #52]	@ zero_extendqisi2
	lsl	lr, r0, #3
	add	r0, r3, r0, lsl #3
	strh	ip, [r3, lr]	@ movhi
	strh	ip, [r0, #40]	@ movhi
	b	.L106
.L118:
	ldr	r2, .L119+24
	ldr	r3, .L119+28
	ldr	r10, [r2]
	ldr	r2, [r3]
	b	.L103
.L120:
	.align	2
.L119:
	.word	emCameraActive
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	.LANCHOR0+68
	.word	shadowOAM
	.word	getButtonPaletteRow
	.word	worldCameraX
	.word	worldCameraY
	.size	drawButtons2, .-drawButtons2
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"Collision2 Map Area at (%d,%d):\000"
	.align	2
.LC13:
	.ascii	"%s\000"
	.text
	.align	2
	.global	debugCollisionMapArea2
	.syntax unified
	.arm
	.type	debugCollisionMapArea2, %function
debugCollisionMapArea2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r1
	mov	r5, r3
	mov	r1, r0
	mov	r2, r4
	ldr	r0, .L126
	ldr	r6, .L126+4
	sub	sp, sp, #108
	mov	lr, pc
	bx	r6
	cmp	r5, #0
	ble	.L121
	ldr	r7, .L126+8
	add	r5, r4, r5
.L123:
	mov	r2, #100
	mov	r1, #0
	add	r0, sp, #4
	mov	lr, pc
	bx	r7
	add	r4, r4, #1
	ldr	r0, .L126+12
	add	r1, sp, #4
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	blt	.L123
.L121:
	add	sp, sp, #108
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L127:
	.align	2
.L126:
	.word	.LC12
	.word	mgba_printf
	.word	memset
	.word	.LC13
	.size	debugCollisionMapArea2, .-debugCollisionMapArea2
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"Playing whoosh sound!\000"
	.text
	.align	2
	.global	playWhooshSound
	.syntax unified
	.arm
	.type	playWhooshSound, %function
playWhooshSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L130
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L130+4
	ldr	r3, .L130+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L130+12
	ldr	r3, .L130+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	whoosh_length
	.word	whoosh_data
	.word	playSoundB
	.word	.LC14
	.word	mgba_printf
	.size	playWhooshSound, .-playWhooshSound
	.section	.rodata.str1.4
	.align	2
.LC15:
	.ascii	"Right Triangle2 - Button indices: [%d,%d,%d,%d,%d]\000"
	.align	2
.LC16:
	.ascii	"Pattern 0,4,1,3,0\000"
	.align	2
.LC17:
	.ascii	"Pattern 0,3,1,4,0\000"
	.align	2
.LC18:
	.ascii	"Pattern 4,1,3,0,4\000"
	.align	2
.LC19:
	.ascii	"Pattern 3,0,4,1,3\000"
	.align	2
.LC20:
	.ascii	"Pattern 3,1,4,0,3\000"
	.align	2
.LC21:
	.ascii	"Pattern 1,4,0,3,1\000"
	.align	2
.LC22:
	.ascii	"Pattern 1,3,0,4,1\000"
	.text
	.align	2
	.global	setupRightTriangleFromSequence2
	.syntax unified
	.arm
	.type	setupRightTriangleFromSequence2, %function
setupRightTriangleFromSequence2:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r7, r3
	ldr	r3, [r4, #16]
	sub	sp, sp, #20
	str	r3, [sp, #4]
	ldr	r3, [r4, #12]
	str	r3, [sp]
	mov	r6, r2
	ldr	r0, .L147
	ldm	r4, {r1, r2, r3}
	ldr	r5, .L147+4
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L133
	ldr	r3, [r4, #4]
	cmp	r3, #4
	beq	.L143
	cmp	r3, #3
	beq	.L144
.L132:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L133:
	cmp	r3, #4
	beq	.L145
	cmp	r3, #3
	bne	.L139
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bne	.L140
	ldr	r3, [r4, #8]
	cmp	r3, #4
	bne	.L132
	ldr	r3, [r4, #12]
	cmp	r3, #1
	bne	.L132
	ldr	r4, [r4, #16]
	cmp	r4, #3
	bne	.L132
	ldr	r0, .L147+8
	str	r3, [sp, #8]
	mov	lr, pc
	bx	r5
	mov	lr, #17
	mov	r0, #5
	mov	r1, #12
	ldr	r3, [sp, #40]
	ldr	r2, [r3]
	mov	ip, #15
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [sp, #40]
	ldr	r2, [r2]
	str	lr, [r7, r2, lsl #2]
	ldr	r2, [sp, #40]
	ldr	r2, [r2]
	ldr	lr, [sp, #40]
	add	r2, r2, #1
	str	r2, [lr]
	str	r0, [r6, r2, lsl #2]
	ldr	r2, [lr]
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [sp, #40]
	ldr	r2, [r2]
	ldr	r4, [sp, #40]
	add	r2, r2, #1
	str	r2, [r4]
	str	r0, [r6, r2, lsl #2]
	ldr	r2, [r4]
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [r4]
	ldr	r3, [sp, #8]
	add	r2, r2, #1
	str	r2, [r4]
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [r4]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	b	.L132
.L143:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	bne	.L132
	ldr	r2, [r4, #12]
	cmp	r2, #3
	bne	.L132
	ldr	r1, [r4, #16]
	cmp	r1, #0
	bne	.L132
	ldr	r0, .L147+12
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	mov	lr, pc
	bx	r5
	mov	ip, #5
	mov	r0, #12
	mov	r4, #17
	ldr	r3, [sp, #40]
	ldr	r1, [r3]
	mov	lr, #14
	str	ip, [r6, r1, lsl #2]
	ldr	r1, [r3]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [sp, #40]
	ldr	r1, [r1]
	ldr	r5, [sp, #40]
	add	r1, r1, #1
	str	r1, [r5]
	str	ip, [r6, r1, lsl #2]
	ldr	r1, [r5]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r5]
	ldr	r3, [sp, #8]
	add	r1, r1, #1
	str	r1, [r5]
	str	r3, [r6, r1, lsl #2]
	ldr	r3, [r5]
	str	r4, [r7, r3, lsl #2]
	ldr	r3, [r5]
	ldr	r2, [sp, #12]
	add	r3, r3, #1
	str	r3, [r5]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [r5]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	b	.L132
.L140:
	cmp	r3, #1
	bne	.L132
	ldr	r3, [r4, #8]
	cmp	r3, #4
	bne	.L132
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L132
	ldr	r2, [r4, #16]
	cmp	r2, #3
	bne	.L132
	ldr	r0, .L147+16
	str	r3, [sp, #8]
	mov	lr, pc
	bx	r5
	mov	lr, #17
	mov	r1, #6
	mov	r2, #12
	mov	ip, #2
	ldr	r3, [sp, #40]
	ldr	r4, [r3]
	ldr	r3, [sp, #8]
	mov	r0, #15
	str	r3, [r6, r4, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	ldr	lr, [sp, #40]
	add	r3, r3, #1
	str	r3, [lr]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [lr]
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	ldr	r4, [sp, #40]
	add	r3, r3, #1
	str	r3, [r4]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r4]
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	str	ip, [r6, r3, lsl #2]
	ldr	r3, [r4]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	b	.L132
.L144:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	bne	.L132
	ldr	r3, [r4, #12]
	cmp	r3, #4
	bne	.L132
	ldr	r4, [r4, #16]
	cmp	r4, #0
	bne	.L132
	ldr	r0, .L147+20
	mov	lr, pc
	bx	r5
	mov	r5, #2
	mov	lr, #14
	mov	ip, #17
	mov	r2, #6
	mov	r0, #12
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	mov	r1, #10
	str	r5, [r6, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	ldr	lr, [sp, #40]
	add	r3, r3, #1
	str	r3, [lr]
	str	r4, [r6, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	ldr	ip, [sp, #40]
	add	r3, r3, #1
	str	r3, [ip]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	ldr	r0, [sp, #40]
	add	r3, r3, #1
	str	r3, [r0]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [r0]
	str	r1, [r7, r3, lsl #2]
	ldr	r3, [r0]
	add	r3, r3, #1
	str	r3, [r0]
	b	.L132
.L145:
	ldr	r3, [r4, #4]
	cmp	r3, #1
	bne	.L132
	ldr	r2, [r4, #8]
	cmp	r2, #3
	bne	.L132
	ldr	r1, [r4, #12]
	cmp	r1, #0
	bne	.L132
	ldr	r1, [r4, #16]
	cmp	r1, #4
	bne	.L132
	ldr	r0, .L147+24
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	mov	lr, pc
	bx	r5
	mov	r0, #5
	mov	r4, #12
	mov	ip, #17
	ldr	r3, [sp, #40]
	ldr	r1, [r3]
	str	r0, [r6, r1, lsl #2]
	mov	lr, #10
	ldr	r1, [r3]
	str	r4, [r7, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	ldr	r3, [sp, #8]
	str	r3, [r6, r1, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #40]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	ldr	r2, [sp, #40]
	add	r3, r3, #1
	str	r3, [r2]
	str	r0, [r6, r3, lsl #2]
	ldr	r3, [r2]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L132
.L139:
	cmp	r3, #1
	bne	.L132
	ldr	r3, [r4, #4]
	cmp	r3, #4
	beq	.L146
	cmp	r3, #3
	bne	.L132
	ldr	r2, [r4, #8]
	cmp	r2, #0
	bne	.L132
	ldr	r2, [r4, #12]
	cmp	r2, #4
	bne	.L132
	ldr	r4, [r4, #16]
	cmp	r4, #1
	bne	.L132
	ldr	r0, .L147+28
	str	r3, [sp, #8]
	mov	lr, pc
	bx	r5
	mov	r0, #17
	mov	r1, #5
	mov	lr, #12
	ldr	r3, [sp, #40]
	ldr	r2, [r3]
	mov	ip, #10
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [sp, #40]
	ldr	r2, [r2]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #40]
	ldr	r2, [r2]
	ldr	r3, [sp, #8]
	ldr	r4, [sp, #40]
	add	r2, r2, #1
	str	r2, [r4]
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #40]
	ldr	r3, [r3]
	ldr	r2, [sp, #40]
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r2]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r2]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L132
.L146:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	bne	.L132
	ldr	r2, [r4, #12]
	cmp	r2, #3
	bne	.L132
	ldr	r2, [r4, #16]
	cmp	r2, #1
	bne	.L132
	ldr	r0, .L147+32
	str	r3, [sp, #8]
	mov	lr, pc
	bx	r5
	mov	r0, #6
	mov	r1, #12
	ldr	r3, [sp, #40]
	ldr	r2, [r3]
	mov	r3, r6
	str	r0, [r6, r2, lsl #2]
	ldr	r2, [sp, #40]
	ldr	r2, [r2]
	mov	r4, #2
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [sp, #40]
	ldr	r2, [r2]
	ldr	r6, [sp, #40]
	add	r2, r2, #1
	mov	lr, #17
	str	r2, [r6]
	str	r0, [r3, r2, lsl #2]
	ldr	r2, [r6]
	str	r1, [r7, r2, lsl #2]
	mov	r1, r3
	mov	ip, #15
	ldr	r2, [r6]
	add	r2, r2, #1
	str	r2, [r6]
	str	r4, [r3, r2, lsl #2]
	ldr	r2, [r6]
	str	lr, [r7, r2, lsl #2]
	ldr	r2, [r6]
	ldr	r3, [sp, #8]
	add	r2, r2, #1
	str	r2, [r6]
	str	r3, [r1, r2, lsl #2]
	ldr	r3, [r6]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
	b	.L132
.L148:
	.align	2
.L147:
	.word	.LC15
	.word	mgba_printf
	.word	.LC19
	.word	.LC16
	.word	.LC20
	.word	.LC17
	.word	.LC18
	.word	.LC22
	.word	.LC21
	.size	setupRightTriangleFromSequence2, .-setupRightTriangleFromSequence2
	.section	.rodata.str1.4
	.align	2
.LC23:
	.ascii	"Pattern 3,4,2,1,3 - DIAG_DOWN_RIGHT x2, RIGHT, UP\000"
	.align	2
.LC24:
	.ascii	"Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2"
	.ascii	"\000"
	.text
	.align	2
	.global	setupIsoscelesTriangleMovement2
	.syntax unified
	.arm
	.type	setupIsoscelesTriangleMovement2, %function
setupIsoscelesTriangleMovement2:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, lr}
	ldr	r4, .L158
	sub	sp, sp, #20
	str	r1, [r4, #28]
	ldr	r1, [r0]
	cmp	r1, #4
	beq	.L155
	cmp	r1, #2
	beq	.L156
	cmp	r1, #0
	bne	.L149
	ldr	r1, [r0, #4]
	cmp	r1, #4
	beq	.L157
.L149:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L156:
	ldr	r1, [r0, #4]
	cmp	r1, #4
	bne	.L149
	ldr	r1, [r0, #8]
	cmp	r1, #0
	bne	.L149
	ldr	r0, [r0, #12]
	cmp	r0, #2
	mov	r5, r0
	bne	.L149
	stmib	sp, {r1, r2, r3}
	ldr	r0, .L158+4
	ldr	r3, .L158+8
	mov	lr, pc
	bx	r3
	mov	r0, #7
	mov	ip, #10
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #8]
	ldr	r3, [r3]
	str	r0, [r2, r3, lsl #2]
	ldr	r3, [sp, #32]
	ldr	r0, [r3]
	ldr	r3, [sp, #12]
	ldr	r1, [sp, #32]
	str	ip, [r3, r0, lsl #2]
	ldr	r0, [r1]
	add	r0, r0, #1
	str	r0, [r1]
	mov	r1, #6
	mov	lr, #12
	str	r1, [r2, r0, lsl #2]
	ldr	r1, [sp, #32]
	ldr	r0, [r1]
	str	ip, [r3, r0, lsl #2]
	ldr	r0, [r1]
	add	r0, r0, #1
	str	r0, [r1]
	ldr	r1, [sp, #4]
	str	r1, [r2, r0, lsl #2]
	ldr	r2, [sp, #32]
	ldr	r2, [r2]
	str	lr, [r3, r2, lsl #2]
	ldr	r3, [sp, #32]
	ldr	r3, [r3]
	add	r3, r3, #1
	b	.L152
.L155:
	ldr	r1, [r0, #4]
	cmp	r1, #1
	mov	r5, r1
	bne	.L149
	ldr	r1, [r0, #8]
	cmp	r1, #3
	bne	.L149
	ldr	r1, [r0, #12]
	cmp	r1, #4
	bne	.L149
	stmib	sp, {r1, r2, r3}
	ldr	r0, .L158+12
	ldr	r3, .L158+8
	mov	lr, pc
	bx	r3
	mov	r1, #5
	mov	r0, #10
	mov	lr, #15
	mov	ip, #7
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #8]
	ldr	r3, [r3]
	str	r1, [r2, r3, lsl #2]
	ldr	r3, [sp, #32]
	ldr	r1, [r3]
	ldr	r3, [sp, #12]
	str	r0, [r3, r1, lsl #2]
	ldr	r1, [sp, #32]
	ldr	r0, [r1]
	add	r0, r0, #1
	str	r0, [r1]
	str	r5, [r2, r0, lsl #2]
	ldr	r1, [sp, #32]
	ldr	r0, [r1]
	str	lr, [r3, r0, lsl #2]
	ldr	r0, [r1]
	add	r0, r0, #1
	str	r0, [r1]
	ldr	r1, [sp, #4]
	str	r1, [r2, r0, lsl #2]
	ldr	r2, [sp, #32]
	ldr	r2, [r2]
	str	ip, [r3, r2, lsl #2]
	ldr	r3, [sp, #32]
	ldr	r3, [r3]
	add	r3, r3, #1
.L152:
	mov	r2, #1
	ldr	r1, [sp, #32]
	str	r3, [r1]
	str	r5, [r4, #28]
	str	r2, [r4, #32]
	b	.L149
.L157:
	ldr	ip, [r0, #8]
	cmp	ip, #2
	bne	.L149
	ldr	r0, [r0, #12]
	cmp	r0, #0
	bne	.L149
	stmib	sp, {r1, r2, r3}
	ldr	r0, .L158+4
	ldr	r3, .L158+8
	mov	lr, pc
	bx	r3
	mov	r0, #5
	mov	ip, #10
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #8]
	ldr	r3, [r3]
	str	r0, [r2, r3, lsl #2]
	ldr	r3, [sp, #32]
	ldr	r0, [r3]
	ldr	r3, [sp, #12]
	ldr	r1, [sp, #32]
	str	ip, [r3, r0, lsl #2]
	ldr	r0, [r1]
	add	r0, r0, #1
	str	r0, [r1]
	ldr	r1, [sp, #4]
	str	r1, [r2, r0, lsl #2]
	ldr	r1, [sp, #32]
	ldr	r1, [r1]
	str	ip, [r3, r1, lsl #2]
	ldr	r1, [sp, #32]
	ldr	r1, [r1]
	ldr	r0, [sp, #32]
	add	r1, r1, #1
	str	r1, [r0]
	mov	r0, #1
	mov	lr, #12
	str	r0, [r2, r1, lsl #2]
	ldr	r2, [sp, #32]
	ldr	r2, [r2]
	str	lr, [r3, r2, lsl #2]
	ldr	r3, [sp, #32]
	ldr	r3, [r3]
	mov	r5, #3
	add	r3, r3, r0
	b	.L152
.L159:
	.align	2
.L158:
	.word	.LANCHOR0
	.word	.LC24
	.word	mgba_printf
	.word	.LC23
	.size	setupIsoscelesTriangleMovement2, .-setupIsoscelesTriangleMovement2
	.section	.rodata.str1.4
	.align	2
.LC25:
	.ascii	"Checking pattern 1: 3,1,4,2,0,4,3\000"
	.align	2
.LC26:
	.ascii	"Pattern 3,1,4,2,0,4,3 MATCHED!\000"
	.align	2
.LC27:
	.ascii	"Pattern 1 setup complete, step = %d\000"
	.align	2
.LC28:
	.ascii	"Step %d: movement=%d, accessory=%d\000"
	.align	2
.LC29:
	.ascii	"Step %d: Will shoot bullet with sprite 624\000"
	.align	2
.LC30:
	.ascii	"Checking pattern 2: 1,4,2,0,4,3,1\000"
	.align	2
.LC31:
	.ascii	"Pattern 1,4,2,0,4,3,1 MATCHED!\000"
	.align	2
.LC32:
	.ascii	"Checking pattern 3: 0,4,3,1,4,2,0\000"
	.align	2
.LC33:
	.ascii	"Pattern 0,4,3,1,4,2,0 MATCHED!\000"
	.align	2
.LC34:
	.ascii	"setupEmMovement2 finished: foundPattern=%d, pattern"
	.ascii	"Completed2=%d, showPatternSprite2=%d\000"
	.text
	.align	2
	.global	setupEmMovement2
	.syntax unified
	.arm
	.type	setupEmMovement2, %function
setupEmMovement2:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	r6, r0
	ldr	r5, .L200
	sub	sp, sp, #20
	mov	r1, #255
	mov	r10, r2
	mov	fp, r3
	mov	r2, #40
	ldr	r3, .L200+4
	add	r0, r5, #392
	str	r4, [r5, #28]
	str	r4, [r5, #388]
	str	r4, [r5, #32]
	str	r4, [r5, #44]
	str	r4, [r5, #60]
	mov	lr, pc
	bx	r3
	ldr	r3, .L200+8
	str	r4, [r3]
	ldr	r3, .L200+12
	str	r4, [r3]
	ldr	r3, .L200+16
	str	r4, [r3]
	ldr	r3, .L200+20
	str	r4, [r3]
	ldr	r3, .L200+24
	str	r4, [r3]
	ldr	r3, .L200+28
	ldr	r0, .L200+32
	ldr	r7, .L200+36
	str	r4, [r3]
	str	r4, [r5, #48]
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	cmp	r3, #3
	beq	.L194
.L177:
	mov	r9, r4
.L161:
	ldr	r0, .L200+40
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L195
.L165:
	ldr	r0, .L200+44
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L169
	ldr	r4, [r6, #4]
	cmp	r4, #3
	beq	.L196
.L169:
	add	r2, r5, #28
	mov	r1, r9
	ldm	r2, {r2, r3}
	ldr	r0, .L200+48
	mov	lr, pc
	bx	r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L195:
	ldr	r4, [r6, #4]
	cmp	r4, #4
	bne	.L165
	ldr	r3, [r6, #8]
	cmp	r3, #2
	bne	.L165
	ldr	r2, [r6, #12]
	cmp	r2, #0
	bne	.L165
	ldr	r1, [r6, #16]
	cmp	r1, #3
	bne	.L165
	ldr	r1, [r6, #20]
	cmp	r1, #1
	str	r1, [sp]
	bne	.L165
	ldr	r0, .L200+52
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r7
	mov	r0, #1
	mov	r1, #1
	str	r0, [r5, #392]
	str	r1, [r5, #396]
	mov	r1, #0
	mov	r0, #0
	mov	lr, #10
	mov	ip, #20
	str	r0, [r5, #400]
	str	r1, [r5, #404]
	ldr	r3, [sp, #56]
	ldr	r1, [r3]
	str	lr, [r10, r1, lsl #2]
	ldr	r1, [r3]
	ldr	r2, [sp, #56]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	mov	r2, #6
	mov	r8, #15
	str	r2, [r10, r1, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r1, [r2]
	str	lr, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	str	r4, [r10, r1, lsl #2]
	ldr	r1, [r2]
	str	r8, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	str	lr, [r10, r1, lsl #2]
	ldr	r1, [r2]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r2]
	ldr	r4, [sp]
	add	r1, r1, #1
	str	r1, [r2]
	str	r4, [r10, r1, lsl #2]
	ldr	r1, [r2]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	mov	r3, r2
	str	r1, [r2]
	mov	r2, #11
	mov	r9, #17
	str	r2, [r10, r1, lsl #2]
	ldr	r1, [r3]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	ldr	r3, [sp, #4]
	str	r3, [r10, r1, lsl #2]
	ldr	r1, [sp, #56]
	ldr	r1, [r1]
	str	r9, [fp, r1, lsl #2]
	ldr	r1, [sp, #56]
	ldr	r1, [r1]
	ldr	r9, [sp, #56]
	add	r1, r1, #1
	str	r1, [r9]
	str	r2, [r10, r1, lsl #2]
	ldr	r1, [r9]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r9]
	ldr	r2, [sp, #8]
	add	r1, r1, #1
	str	r1, [r9]
	str	r2, [r10, r1, lsl #2]
	ldr	r2, [r9]
	str	r8, [fp, r2, lsl #2]
	ldr	r2, [r9]
	add	r2, r2, #1
	str	r2, [r9]
	str	r3, [r5, #28]
	mov	r3, #5
	str	r4, [r5, #40]
	str	r4, [r5, #44]
	str	r4, [r5, #388]
	str	r3, [r5, #60]
	ldr	r1, [r9]
	sub	r4, r10, #40
	add	r4, r4, r1, lsl #2
	mov	r8, r6
	mov	r6, r4
	sub	r4, r1, #9
	b	.L168
.L167:
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	add	r4, r4, #1
	cmp	r3, r4
	ble	.L197
.L168:
	ldr	r2, [r6, #4]!
	cmp	r2, #11
	bhi	.L182
	mov	r3, #1
	lsl	r3, r3, r2
	tst	r3, #84
	movne	r3, #816
	ldr	r1, .L200+56
	bne	.L166
	ldr	r0, .L200+60
	tst	r3, r0
	movne	r3, #688
	bne	.L166
	tst	r3, r1
	mvneq	r3, #0
	movne	r3, #692
.L166:
	mov	r1, r4
	ldr	r0, .L200+64
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	sub	r3, r3, #8
	cmp	r3, #3
	bhi	.L167
	mov	r1, r4
	ldr	r0, .L200+68
	mov	lr, pc
	bx	r7
	b	.L167
.L194:
	ldr	r3, [r6, #4]
	cmp	r3, #1
	bne	.L177
	ldr	r2, [r6, #8]
	cmp	r2, #4
	bne	.L177
	ldr	r1, [r6, #12]
	cmp	r1, #2
	str	r1, [sp]
	bne	.L177
	ldr	r1, [r6, #16]
	cmp	r1, r4
	mov	r9, r1
	bne	.L177
	ldr	r1, [r6, #20]
	cmp	r1, #3
	bne	.L161
	ldr	r0, .L200+72
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r7
	mov	r2, #0
	mov	r3, #1
	str	r2, [r5, #392]
	str	r3, [r5, #396]
	mov	r2, #1
	mov	r3, #0
	mov	r4, #11
	mov	r1, #20
	mov	ip, #10
	str	r2, [r5, #400]
	str	r3, [r5, #404]
	ldr	r3, [sp, #56]
	ldr	lr, [r3]
	ldr	r2, [sp, #56]
	str	r4, [r10, lr, lsl #2]
	ldr	lr, [r2]
	str	r1, [fp, lr, lsl #2]
	ldr	lr, [r2]
	add	lr, lr, #1
	str	lr, [r2]
	str	r9, [r10, lr, lsl #2]
	ldr	r2, [sp, #56]
	ldr	lr, [r2]
	str	r1, [fp, lr, lsl #2]
	ldr	lr, [r2]
	add	lr, lr, #1
	str	lr, [r2]
	str	ip, [r10, lr, lsl #2]
	ldr	lr, [r2]
	str	r1, [fp, lr, lsl #2]
	ldr	lr, [r2]
	add	lr, lr, #1
	str	lr, [r2]
	mov	r2, #6
	mov	r8, #15
	str	r2, [r10, lr, lsl #2]
	ldr	r2, [sp, #56]
	ldr	lr, [r2]
	str	ip, [fp, lr, lsl #2]
	ldr	lr, [r2]
	add	lr, lr, #1
	str	lr, [r2]
	ldr	r2, [sp, #8]
	str	r2, [r10, lr, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r2, [r2]
	str	r8, [fp, r2, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r2, [r2]
	ldr	r8, [sp, #56]
	add	r2, r2, #1
	str	r2, [r8]
	str	ip, [r10, r2, lsl #2]
	ldr	r2, [r8]
	str	r1, [fp, r2, lsl #2]
	ldr	r2, [r8]
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	str	r2, [r8]
	str	r3, [r10, r2, lsl #2]
	ldr	r2, [r8]
	str	r1, [fp, r2, lsl #2]
	ldr	r2, [r8]
	add	r2, r2, #1
	str	r2, [r8]
	str	r4, [r10, r2, lsl #2]
	ldr	r2, [r8]
	str	r1, [fp, r2, lsl #2]
	ldr	r2, [r8]
	ldr	r1, [sp]
	add	r2, r2, #1
	str	r2, [r8]
	str	r1, [r10, r2, lsl #2]
	mov	r1, #17
	ldr	r2, [r8]
	str	r1, [fp, r2, lsl #2]
	ldr	r2, [r8]
	add	r2, r2, #1
	str	r2, [r8]
	mov	r2, #5
	str	r3, [r5, #28]
	str	r3, [r5, #40]
	str	r3, [r5, #44]
	str	r3, [r5, #388]
	str	r2, [r5, #60]
	ldr	r0, .L200+76
	ldr	r1, [r8]
	mov	lr, pc
	bx	r7
	ldr	r3, [sp, #56]
	ldr	r1, [r3]
	sub	r4, r10, #40
	add	r4, r4, r1, lsl #2
	mov	r8, r6
	mov	r6, r4
	sub	r4, r1, #9
	b	.L164
.L163:
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	add	r4, r4, #1
	cmp	r3, r4
	ble	.L198
.L164:
	ldr	r2, [r6, #4]!
	cmp	r2, #11
	bhi	.L178
	mov	r3, #1
	lsl	r3, r3, r2
	tst	r3, #84
	movne	r3, #816
	ldr	r1, .L200+56
	bne	.L162
	ldr	r0, .L200+60
	tst	r3, r0
	movne	r3, #688
	bne	.L162
	tst	r3, r1
	mvneq	r3, #0
	movne	r3, #692
.L162:
	mov	r1, r4
	ldr	r0, .L200+64
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	sub	r3, r3, #8
	cmp	r3, #3
	bhi	.L163
	mov	r1, r4
	ldr	r0, .L200+68
	mov	lr, pc
	bx	r7
	b	.L163
.L196:
	ldr	r3, [r6, #8]
	cmp	r3, #1
	bne	.L169
	ldr	r2, [r6, #12]
	cmp	r2, #4
	bne	.L169
	ldr	r1, [r6, #16]
	cmp	r1, #2
	str	r1, [sp]
	bne	.L169
	ldr	r1, [r6, #20]
	cmp	r1, #0
	str	r1, [sp, #4]
	bne	.L169
	ldr	r0, .L200+80
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	mov	lr, pc
	bx	r7
	mov	r0, #0
	mov	r1, #0
	str	r0, [r5, #392]
	str	r1, [r5, #396]
	mov	r1, #1
	mov	r0, #1
	mov	r6, #11
	mov	ip, #20
	str	r0, [r5, #400]
	str	r1, [r5, #404]
	ldr	r2, [sp, #56]
	ldr	r1, [r2]
	str	r6, [r10, r1, lsl #2]
	ldr	r1, [r2]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	ldr	r2, [sp]
	str	r2, [r10, r1, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r1, [r2]
	mov	r2, #17
	mov	lr, #10
	str	r2, [fp, r1, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	str	r6, [r10, r1, lsl #2]
	ldr	r1, [r2]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	ldr	r2, [sp, #4]
	str	r2, [r10, r1, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r1, [r2]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	str	lr, [r10, r1, lsl #2]
	ldr	r1, [r2]
	str	ip, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	mov	r2, #6
	mov	r6, #15
	str	r2, [r10, r1, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r1, [r2]
	str	lr, [fp, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	ldr	r2, [sp, #12]
	str	r2, [r10, r1, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r2, [r2]
	str	r6, [fp, r2, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r2, [r2]
	ldr	r1, [sp, #56]
	add	r2, r2, #1
	str	r2, [r1]
	str	lr, [r10, r2, lsl #2]
	ldr	r2, [r1]
	str	ip, [fp, r2, lsl #2]
	ldr	r2, [r1]
	ldr	r3, [sp, #8]
	add	r2, r2, #1
	str	r2, [r1]
	str	r3, [r10, r2, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r2, [r2]
	str	r6, [fp, r2, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r2, [r2]
	ldr	r1, [sp, #56]
	add	r2, r2, #1
	str	r2, [r1]
	mov	r2, #5
	str	r4, [r5, #28]
	str	r2, [r5, #60]
	str	r3, [r5, #40]
	str	r3, [r5, #44]
	str	r3, [r5, #388]
	ldr	r4, [r1]
	sub	r8, r10, #40
	add	r6, r8, r4, lsl #2
	sub	r4, r4, #9
	b	.L172
.L171:
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	add	r4, r4, #1
	cmp	r3, r4
	ble	.L199
.L172:
	ldr	r2, [r6, #4]!
	cmp	r2, #11
	bhi	.L186
	mov	r3, #1
	lsl	r3, r3, r2
	tst	r3, #84
	movne	r3, #816
	ldr	r1, .L200+56
	bne	.L170
	ldr	r0, .L200+60
	tst	r3, r0
	movne	r3, #688
	bne	.L170
	tst	r3, r1
	mvneq	r3, #0
	movne	r3, #692
.L170:
	mov	r1, r4
	ldr	r0, .L200+64
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	sub	r3, r3, #8
	cmp	r3, #3
	bhi	.L171
	mov	r1, r4
	ldr	r0, .L200+68
	mov	lr, pc
	bx	r7
	b	.L171
.L186:
	mvn	r3, #0
	b	.L170
.L199:
	mov	r9, #1
	b	.L169
.L197:
	mov	r6, r8
	mov	r9, #1
	b	.L165
.L198:
	mov	r6, r8
	mov	r9, #1
	b	.L161
.L178:
	mvn	r3, #0
	b	.L162
.L182:
	mvn	r3, #0
	b	.L166
.L201:
	.align	2
.L200:
	.word	.LANCHOR0
	.word	memset
	.word	worldCameraX
	.word	worldCameraY
	.word	worldCameraTargetX
	.word	worldCameraTargetY
	.word	isCameraMoving
	.word	emCameraActive
	.word	.LC25
	.word	mgba_printf
	.word	.LC30
	.word	.LC32
	.word	.LC34
	.word	.LC31
	.word	1026
	.word	2049
	.word	.LC28
	.word	.LC29
	.word	.LC26
	.word	.LC27
	.word	.LC33
	.size	setupEmMovement2, .-setupEmMovement2
	.section	.rodata.str1.4
	.align	2
.LC35:
	.ascii	"UNKNOWN\000"
	.align	2
.LC36:
	.ascii	"Setting up pattern movement2 for type: %d\000"
	.align	2
.LC37:
	.ascii	"Complete button sequence2:\000"
	.align	2
.LC38:
	.ascii	"  Button %d: %d\000"
	.align	2
.LC39:
	.ascii	"Unknown pattern type: %d\000"
	.align	2
.LC40:
	.ascii	"Final movement2 sequence length: %d\000"
	.align	2
.LC41:
	.ascii	"Movement2 %d: %s for %d frames\000"
	.align	2
.LC42:
	.ascii	"=== MOVEMENT2 SETUP COMPLETE ===\000"
	.align	2
.LC43:
	.ascii	"Movement2 sequence length: %d\000"
	.align	2
.LC44:
	.ascii	"Step %d: dir=%d, dur=%d\000"
	.text
	.align	2
	.global	setupPatternMovement2
	.syntax unified
	.arm
	.type	setupPatternMovement2, %function
setupPatternMovement2:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r0
	mov	r7, r2
	mov	r10, r1
	sub	sp, sp, #28
	mov	r1, r9
	ldr	r0, .L226
	ldr	r4, .L226+4
	str	r3, [sp, #12]
	ldr	r8, [sp, #68]
	mov	lr, pc
	bx	r4
	ldr	r0, .L226+8
	mov	lr, pc
	bx	r4
	cmp	r7, #0
	movgt	r6, #0
	subgt	fp, r10, #4
	ble	.L209
.L208:
	mov	r1, r6
	ldr	r0, .L226+12
	ldr	r2, [fp, #4]!
	add	r6, r6, #1
	mov	lr, pc
	bx	r4
	cmp	r7, r6
	bne	.L208
.L209:
	mov	r6, #0
	cmp	r9, #2
	str	r6, [sp, #20]
	beq	.L204
	cmp	r9, #3
	beq	.L205
	cmp	r9, #1
	bne	.L225
	add	r3, sp, #20
	str	r3, [sp]
	mov	r1, r7
	mov	r0, r10
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #12]
	bl	setupRightTriangleFromSequence2
.L210:
	ldr	r5, [sp, #20]
	ldr	r0, .L226+16
	mov	r1, r5
	str	r5, [r8]
	mov	lr, pc
	bx	r4
	cmp	r5, #0
	ble	.L211
	mov	fp, #0
	ldr	r3, [sp, #12]
	sub	r7, r3, #4
	ldr	r3, [sp, #64]
	ldr	r10, .L226+20
	ldr	r9, .L226+24
	sub	r6, r3, #4
.L214:
	ldr	r3, [r7, #4]!
	cmp	r3, #7
	add	r3, r9, r3, lsl #2
	ldrls	r2, [r3, #40]
	movhi	r2, r10
	mov	r1, fp
	ldr	r0, .L226+28
	ldr	r3, [r6, #4]!
	add	fp, fp, #1
	mov	lr, pc
	bx	r4
	cmp	r5, fp
	bne	.L214
.L211:
	ldr	r0, .L226+32
	mov	lr, pc
	bx	r4
	ldr	r0, .L226+36
	ldr	r1, [r8]
	mov	lr, pc
	bx	r4
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L202
	mov	r6, #0
	ldr	r3, [sp, #12]
	sub	r5, r3, #4
	ldr	r3, [sp, #64]
	sub	r7, r3, #4
.L217:
	mov	r1, r6
	ldr	r3, [r7, #4]!
	ldr	r0, .L226+40
	ldr	r2, [r5, #4]!
	mov	lr, pc
	bx	r4
	ldr	r3, [r8]
	add	r6, r6, #1
	cmp	r3, r6
	bgt	.L217
.L202:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L225:
	mov	r1, r9
	ldr	r0, .L226+44
	mov	lr, pc
	bx	r4
	mov	r1, r6
	ldr	r0, .L226+16
	str	r6, [r8]
	mov	lr, pc
	bx	r4
	b	.L211
.L205:
	add	r3, sp, #20
	str	r3, [sp]
	mov	r1, r7
	mov	r0, r10
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #12]
	bl	setupEmMovement2
	b	.L210
.L204:
	add	r3, sp, #20
	str	r3, [sp]
	mov	r1, r7
	mov	r0, r10
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #12]
	bl	setupIsoscelesTriangleMovement2
	b	.L210
.L227:
	.align	2
.L226:
	.word	.LC36
	.word	mgba_printf
	.word	.LC37
	.word	.LC38
	.word	.LC40
	.word	.LC35
	.word	.LANCHOR2
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC39
	.size	setupPatternMovement2, .-setupPatternMovement2
	.section	.rodata.str1.4
	.align	2
.LC45:
	.ascii	"startAutoMove2: EM pattern active, resetting index "
	.ascii	"to 0\000"
	.align	2
.LC46:
	.ascii	"startAutoMove2: sequenceLength=%d\000"
	.align	2
.LC47:
	.ascii	"Step2 %d: Timer set to %d (from movementDurations2)"
	.ascii	"\000"
	.align	2
.LC48:
	.ascii	"Automatic movement2 started with %d steps\000"
	.text
	.align	2
	.global	startAutomaticMovement2
	.syntax unified
	.arm
	.type	startAutomaticMovement2, %function
startAutomaticMovement2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	r3, #1
	ldr	r5, .L239
	ldr	r2, [r5, #40]
	cmp	r2, r4
	add	r2, r0, #8
	str	r3, [r5, #64]
	ldm	r2, {r2, r3}
	mov	r8, r1
	str	r4, [r5, #432]
	str	r4, [r5, #56]
	str	r2, [r5, #436]
	str	r3, [r5, #440]
	bne	.L229
	ldr	r7, .L239+4
.L230:
	mov	r2, #512
	mov	r4, #0
	ldr	r3, .L239+8
	strh	r2, [r3], #40	@ movhi
	mov	r1, r8
	ldr	r0, .L239+12
	strh	r2, [r3]	@ movhi
	str	r4, [r5, #32]
	str	r4, [r5, #44]
	str	r4, [r5, #36]
	str	r4, [r5, #60]
	mov	lr, pc
	bx	r7
	ldr	r3, .L239+16
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L239+20
	ldr	r3, .L239+24
	mov	lr, pc
	bx	r3
	ldr	r0, .L239+28
	mov	lr, pc
	bx	r7
	cmp	r8, r4
	ble	.L232
	ldr	r5, .L239+32
	add	r6, r5, #96
.L233:
	ldr	r2, [r5, #4]!
	mov	r1, r4
	ldr	r0, .L239+36
	str	r2, [r6, #4]!
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r8, r4
	bne	.L233
.L232:
	mov	r1, r8
	ldr	r0, .L239+40
	mov	lr, pc
	bx	r7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L229:
	ldr	r0, .L239+44
	ldr	r7, .L239+4
	str	r4, [r5, #48]
	mov	lr, pc
	bx	r7
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L230
	ldr	r3, .L239+48
	str	r4, [r3, #8]
	ldr	r3, .L239+52
	str	r4, [r3]
	ldr	r3, .L239+56
	str	r4, [r3]
	b	.L230
.L240:
	.align	2
.L239:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	shadowOAM+720
	.word	.LC46
	.word	whoosh_length
	.word	whoosh_data
	.word	playSoundB
	.word	.LC14
	.word	.LANCHOR0+440
	.word	.LC47
	.word	.LC48
	.word	.LC45
	.word	playerBullets
	.word	playerShootCooldown
	.word	playerIsShooting
	.size	startAutomaticMovement2, .-startAutomaticMovement2
	.section	.rodata.str1.4
	.align	2
.LC49:
	.ascii	"updateAutoMove2: Step %d, emPatternSpriteIndex=%d, "
	.ascii	"showEmPatternSprite2=%d, timer=%d\000"
	.align	2
.LC50:
	.ascii	"updateAutoMove2: Step=%d/%d, movement=%d, timer=%d/"
	.ascii	"%d, emPatternActive2=%d\000"
	.align	2
.LC51:
	.ascii	"EM Pattern: Showing sprite 632 during pause #%d (ti"
	.ascii	"mer=%d/%d)\000"
	.align	2
.LC52:
	.ascii	"=== PAUSE START #%d - BULLET WOULD APPEAR HERE ===\000"
	.align	2
.LC53:
	.ascii	"=== BULLET FINISHED - SPRITE 632 APPEARS NOW ===\000"
	.align	2
.LC54:
	.ascii	"=== MOVING TO PAUSE_UP POSITION #%d ===\000"
	.align	2
.LC55:
	.ascii	"=== MOVING TO PAUSE_DOWN POSITION #%d ===\000"
	.align	2
.LC56:
	.ascii	"EM Pause: Camera at (%d,%d), moving to pause Y=%d\000"
	.align	2
.LC57:
	.ascii	"Pause ending: Camera at (%d,%d), moving to saved (%"
	.ascii	"d,%d)\000"
	.align	2
.LC58:
	.ascii	"Pause finished: Camera at saved position (%d,%d)\000"
	.align	2
.LC59:
	.ascii	"updateAutoMove2: Timer expired for step %d\000"
	.align	2
.LC60:
	.ascii	"updateAutoMove2: Incremented to step %d\000"
	.align	2
.LC61:
	.ascii	"updateAutoMove2: ******** ALL STEPS COMPLETE! *****"
	.ascii	"***\000"
	.align	2
.LC62:
	.ascii	"EM pattern completed - showing EM sprite\000"
	.align	2
.LC63:
	.ascii	"Isosceles pattern completed - showing sprite\000"
	.align	2
.LC64:
	.ascii	"No sprite to show - clearing all\000"
	.align	2
.LC65:
	.ascii	"updateAutoMove2: Step=%d, TotalSteps=%d\000"
	.align	2
.LC66:
	.ascii	"Movement2 step %d: %s (timer: %d)\000"
	.align	2
.LC68:
	.ascii	"=== STARTING PAUSE_UP #%d ===\000"
	.align	2
.LC69:
	.ascii	"=== MIDDLE OF PAUSE_UP #%d - BULLET DONE, SPRITE AP"
	.ascii	"PEARS ===\000"
	.align	2
.LC70:
	.ascii	"=== ENDING PAUSE_UP #%d ===\000"
	.align	2
.LC71:
	.ascii	"Moving to next pause index: %d\000"
	.align	2
.LC72:
	.ascii	"=== MOVEMENT_PAUSE_DOWN ENTERED ===\000"
	.align	2
.LC73:
	.ascii	"  remainingTime=%d, totalTime=%d, index=%d\000"
	.align	2
.LC74:
	.ascii	"=== STARTING PAUSE_DOWN #%d ===\000"
	.align	2
.LC75:
	.ascii	"=== MIDDLE OF PAUSE_DOWN #%d - BULLET DONE, SPRITE "
	.ascii	"APPEARS ===\000"
	.align	2
.LC76:
	.ascii	"=== ENDING PAUSE_DOWN #%d ===\000"
	.text
	.align	2
	.global	updateAutomaticMovement2
	.syntax unified
	.arm
	.type	updateAutomaticMovement2, %function
updateAutomaticMovement2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L361
	ldr	r3, [r5, #64]
	cmp	r3, #0
	sub	sp, sp, #36
	bne	.L346
.L241:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L346:
	ldr	r2, [r5, #60]
	ldr	r3, [r5, #44]
	str	r2, [sp]
	mov	r6, r0
	ldr	r2, [r5, #48]
	ldr	r1, [r5, #432]
	ldr	r0, .L361+4
	ldr	r8, .L361+8
	mov	lr, pc
	bx	r8
	mov	r4, #0
	add	r3, r5, #440
	b	.L244
.L347:
	add	r4, r4, #1
	cmp	r4, #24
	beq	.L243
.L244:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	bgt	.L347
.L243:
	ldr	r7, [r5, #432]
	add	r3, r5, r7, lsl #2
	ldr	r1, [r3, #636]
	ldr	r2, [r5, #40]
	ldr	r9, [r3, #540]
	ldr	fp, [r3, #444]
	str	r1, [sp, #20]
	mov	r3, r1
	str	r2, [sp, #8]
	mov	r10, r1
	mov	r2, r4
	mov	r1, r7
	stm	sp, {r9, fp}
	ldr	r0, .L361+12
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L246
	sub	r2, r10, #10
	cmp	r2, #1
	movhi	r3, #0
	movls	r3, #1
	cmp	r9, #0
	movle	r3, #0
	cmp	r3, #0
	beq	.L247
	cmp	r4, r7
	movle	r2, #0
	movgt	r2, #1
	add	r3, fp, fp, lsr #31
	cmp	r9, r3, asr #1
	asr	r3, r3, #1
	str	r2, [sp, #24]
	str	r3, [sp, #28]
	blt	.L348
	mov	r3, #0
	cmp	r9, fp
	str	r3, [r5, #44]
	beq	.L249
.L253:
	ldr	r3, [sp, #28]
	cmp	r3, r9
	beq	.L349
.L345:
	ldr	r2, [r5, #40]
	ldr	r3, [sp, #24]
	cmp	r2, #0
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	bne	.L252
.L250:
	ldr	r1, [r5, #432]
.L257:
	mov	r2, r4
	ldr	r0, .L361+16
	mov	lr, pc
	bx	r8
	ldr	r1, [r5, #432]
	add	r3, r5, r1, lsl #2
	ldr	r3, [r3, #636]
	cmp	r3, #11
	ldrls	r2, .L361+20
	addls	r3, r2, r3, lsl #2
	ldrls	r2, [r3, #72]
	add	r3, r5, r1, lsl #2
	ldrhi	r2, .L361+24
	ldr	r3, [r3, #540]
	ldr	r0, .L361+28
	add	r7, r5, r7, lsl #2
	mov	lr, pc
	bx	r8
	ldr	r2, .L361+32
	ldr	r3, [r7, #636]
	cmp	r3, #11
	bhi	.L296
	ldrb	r3, [r2, r3]
	add	pc, pc, r3, lsl #2
.Lrtx298:
	nop
	.section	.rodata
.L298:
	.byte	(.L307-.Lrtx298-4)/4
	.byte	(.L306-.Lrtx298-4)/4
	.byte	(.L305-.Lrtx298-4)/4
	.byte	(.L304-.Lrtx298-4)/4
	.byte	(.L303-.Lrtx298-4)/4
	.byte	(.L302-.Lrtx298-4)/4
	.byte	(.L301-.Lrtx298-4)/4
	.byte	(.L300-.Lrtx298-4)/4
	.byte	(.L296-.Lrtx298-4)/4
	.byte	(.L296-.Lrtx298-4)/4
	.byte	(.L299-.Lrtx298-4)/4
	.byte	(.L297-.Lrtx298-4)/4
	.text
	.p2align 2
.L247:
	cmp	r4, r7
	str	r3, [r5, #44]
	ble	.L246
	cmp	r2, #1
	mov	r2, #1
	ldr	r3, .L361+36
	str	r2, [r3]
	bls	.L256
	ldr	r2, [r5, #740]
	cmp	r2, #0
	bne	.L246
	ldr	r3, [r6, #8]
	ldr	r1, [r6, #12]
	sub	r3, r3, #88
	cmp	r3, #0
	sub	r1, r1, #48
	str	r3, [r5, #732]
	str	r1, [r5, #736]
	movlt	r3, r2
	strlt	r2, [r5, #732]
	blt	.L290
	cmp	r3, #16
	movgt	r3, #16
	strgt	r3, [r5, #732]
.L290:
	cmp	r1, #0
	movlt	r1, #0
	strlt	r1, [r5, #736]
	blt	.L292
	cmp	r1, #96
	movgt	r2, #96
	movle	r2, r1
	strgt	r2, [r5, #736]
.L292:
	ldr	r1, .L361+40
	str	r3, [r1]
	ldr	r3, .L361+44
	str	r2, [r3]
.L246:
	cmp	r9, #0
	bgt	.L250
.L284:
	mov	r1, r7
	ldr	r0, .L361+48
	mov	lr, pc
	bx	r8
	ldr	r1, [r5, #432]
	ldr	r0, .L361+52
	add	r1, r1, #1
	str	r1, [r5, #432]
	mov	lr, pc
	bx	r8
	ldr	r1, [r5, #432]
	cmp	r1, r4
	blt	.L257
	mov	r4, #0
	mov	r7, #1
	ldr	r0, .L361+56
	mov	lr, pc
	bx	r8
	ldr	r3, .L361+60
	str	r4, [r6, #16]
	str	r4, [r6, #20]
	str	r4, [r5, #64]
	str	r7, [r5, #56]
	mov	lr, pc
	bx	r3
	ldr	r6, [r5, #40]
	ldr	r3, .L361+36
	ldr	r2, .L361+64
	cmp	r6, r4
	str	r4, [r2]
	str	r4, [r3]
	bne	.L350
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L294
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bgt	.L351
.L294:
	ldr	r0, .L361+68
	mov	lr, pc
	bx	r8
	mov	r1, #512
	mov	r3, #0
	ldr	r2, .L361+72
	strh	r1, [r2], #40	@ movhi
	str	r3, [r5, #32]
	str	r3, [r5, #44]
	str	r3, [r5, #36]
	str	r3, [r5, #60]
	strh	r1, [r2]	@ movhi
	str	r3, [r5, #744]
	str	r3, [r5, #52]
	str	r3, [r5, #28]
	b	.L241
.L305:
	mov	r3, #2
	mvn	r1, #3
	mov	r2, #0
	str	r3, [r6, #36]
	str	r1, [r6, #16]
	str	r2, [r6, #20]
	str	r3, [r6, #44]
.L296:
	ldr	r3, [r5, #432]
	add	r5, r5, r3, lsl #2
	ldr	r3, [r5, #540]
	sub	r3, r3, #1
	str	r3, [r5, #540]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L297:
	ldr	r0, .L361+76
	mov	lr, pc
	bx	r8
	mov	r2, fp
	ldr	r3, [r5, #48]
	mov	r1, r9
	ldr	r0, .L361+80
	mov	lr, pc
	bx	r8
	mov	r3, #0
	mov	r2, #1
	cmp	r9, fp
	str	r2, [r6, #44]
	str	r3, [r6, #16]
	str	r3, [r6, #20]
	str	r3, [r6, #36]
	str	r3, [r6, #40]
	beq	.L352
.L312:
	add	r3, fp, fp, lsr #31
	cmp	r9, r3, asr #1
	beq	.L353
.L313:
	cmp	r9, #0
	bne	.L296
	ldr	r1, [r5, #48]
	ldr	r0, .L361+84
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #48]
	cmp	r3, #2
	bgt	.L296
.L341:
	add	r3, r3, #1
	mov	r1, r3
	ldr	r0, .L361+88
	str	r3, [r5, #48]
	mov	lr, pc
	bx	r8
	b	.L296
.L307:
	mov	r3, #0
	mov	r1, #4
	mov	r2, #1
	str	r3, [r6, #16]
	str	r1, [r6, #20]
	str	r3, [r6, #36]
	str	r2, [r6, #44]
	b	.L296
.L306:
	mov	r3, #1
	mov	r1, #0
	mvn	r2, #3
	str	r3, [r6, #36]
	str	r1, [r6, #16]
	str	r2, [r6, #20]
	str	r3, [r6, #44]
	b	.L296
.L304:
	mov	r1, #4
	mov	r2, #0
	mov	r3, #3
	mov	r0, #2
	str	r1, [r6, #16]
	str	r0, [r6, #44]
	str	r2, [r6, #20]
	str	r3, [r6, #36]
	b	.L296
.L303:
	mov	r3, #3
	mov	r2, #2
	str	r3, [r6, #16]
	str	r3, [r6, #20]
	str	r3, [r6, #36]
	str	r2, [r6, #44]
	b	.L296
.L302:
	mov	r3, #2
	mvn	r1, #2
	mov	r2, #3
	str	r3, [r6, #36]
	str	r1, [r6, #16]
	str	r2, [r6, #20]
	str	r3, [r6, #44]
	b	.L296
.L301:
	mov	r3, #3
	mvn	r1, #2
	mov	r2, #2
	str	r3, [r6, #16]
	str	r1, [r6, #20]
	str	r3, [r6, #36]
	str	r2, [r6, #44]
	b	.L296
.L300:
	mvn	r2, #2
	mov	r3, #2
	str	r2, [r6, #16]
	str	r2, [r6, #20]
	str	r3, [r6, #36]
	str	r3, [r6, #44]
	b	.L296
.L299:
	mov	r3, #0
	mov	r2, #1
	cmp	r9, fp
	str	r3, [r6, #16]
	str	r3, [r6, #20]
	str	r3, [r6, #40]
	str	r2, [r6, #36]
	str	r2, [r6, #44]
	beq	.L354
.L308:
	add	r3, fp, fp, lsr #31
	cmp	r9, r3, asr #1
	beq	.L355
.L309:
	cmp	r9, #0
	bne	.L296
	ldr	r1, [r5, #48]
	ldr	r0, .L361+92
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #48]
	cmp	r3, #2
	bgt	.L296
	b	.L341
.L252:
	mov	r2, #1
	ldr	r3, .L361+36
	str	r2, [r3]
.L256:
	cmp	r9, fp
	beq	.L356
.L251:
	add	r3, fp, fp, lsl #1
	cmp	r3, #0
	addlt	r3, r3, #3
	cmp	fp, #0
	movge	r2, fp
	asr	r3, r3, #2
	addlt	r2, fp, #3
	cmp	r3, r9
	asr	r3, r2, #2
	ble	.L263
	cmp	r9, r3
	ble	.L343
	ldr	r3, [sp, #20]
	ldr	r2, [r5, #732]
	cmp	r3, #10
	ldr	r3, .L361+40
	str	r2, [r3]
	moveq	r2, #0
	movne	r2, #96
	ldr	r3, .L361+44
	str	r2, [r3]
	b	.L246
.L348:
	mov	ip, #1
	mov	r3, fp
	mov	r2, r9
	ldr	r1, [r5, #48]
	ldr	r0, .L361+96
	str	ip, [r5, #44]
	mov	lr, pc
	bx	r8
	cmp	r9, fp
	beq	.L249
	ldr	r2, [r5, #40]
	ldr	r3, [sp, #24]
	cmp	r2, #0
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	beq	.L250
	mov	r2, #1
	ldr	r3, .L361+36
	str	r2, [r3]
	b	.L251
.L349:
	ldr	r1, [r5, #48]
	ldr	r0, .L361+100
	mov	lr, pc
	bx	r8
	b	.L345
.L249:
	ldr	r1, [r5, #48]
	ldr	r0, .L361+104
	mov	lr, pc
	bx	r8
	b	.L253
.L356:
	ldr	r2, [r6, #8]
	sub	r2, r2, #88
	cmp	r2, #0
	str	r2, [r5, #732]
	movlt	r2, #0
	ldr	r3, [r6, #12]
	sub	r3, r3, #48
	str	r3, [r5, #736]
	strlt	r2, [r5, #732]
	blt	.L261
	cmp	r2, #16
	movgt	r2, #16
	strgt	r2, [r5, #732]
.L261:
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r5, #736]
	blt	.L246
	cmp	r3, #96
	movgt	r3, #96
	strgt	r3, [r5, #736]
	b	.L246
.L263:
	beq	.L357
	cmp	r9, r3
	bgt	.L358
	cmp	r9, #0
	ble	.L279
.L265:
	ldr	lr, .L361+40
	ldr	r0, [r5, #732]
	ldr	r1, [lr]
	sub	r10, r0, r1
	ldr	r3, .L361+44
	eor	r2, r10, r10, asr #31
	sub	r2, r2, r10, asr #31
	cmp	r2, #8
	ldr	ip, [r5, #736]
	ldr	r2, [r3]
	movle	r1, r0
	str	r2, [sp, #20]
	sub	r2, ip, r2
	ble	.L280
	cmp	r10, #0
	mvnle	r10, #7
	movgt	r10, #8
	add	r1, r1, r10
.L280:
	str	r1, [lr]
	eor	lr, r2, r2, asr #31
	sub	lr, lr, r2, asr #31
	cmp	lr, #8
	movle	r2, ip
	ble	.L282
	cmp	r2, #0
	mvnle	r2, #7
	movgt	r2, #8
	ldr	lr, [sp, #20]
	add	r2, lr, r2
.L282:
	str	ip, [sp]
	str	r2, [r3]
	mov	r3, r0
	ldr	r0, .L361+108
	mov	lr, pc
	bx	r8
	ldr	r1, [r5, #432]
	b	.L257
.L350:
	ldr	r0, .L361+112
	mov	lr, pc
	bx	r8
	str	r4, [r5, #32]
	str	r4, [r5, #44]
	str	r4, [r5, #40]
	str	r4, [r5, #388]
	str	r4, [r5, #48]
	str	r4, [r5, #28]
	b	.L241
.L343:
	cmp	r9, #0
	bgt	.L265
	bne	.L284
.L266:
	mov	r3, #0
	add	r1, r5, #732
	ldm	r1, {r1, r2}
	str	r3, [r5, #740]
	ldr	r3, .L361+40
	str	r1, [r3]
	ldr	r3, .L361+44
	ldr	r0, .L361+116
	str	r2, [r3]
	mov	lr, pc
	bx	r8
	b	.L284
.L353:
	ldr	r1, [r5, #48]
	ldr	r0, .L361+120
	mov	lr, pc
	bx	r8
	b	.L313
.L352:
	ldr	r1, [r5, #48]
	ldr	r0, .L361+124
	mov	lr, pc
	bx	r8
	b	.L312
.L355:
	ldr	r1, [r5, #48]
	ldr	r0, .L361+128
	mov	lr, pc
	bx	r8
	b	.L309
.L354:
	ldr	r1, [r5, #48]
	ldr	r0, .L361+132
	mov	lr, pc
	bx	r8
	b	.L308
.L351:
	ldr	r0, .L361+136
	mov	lr, pc
	bx	r8
	mov	r3, #10
	str	r7, [r5, #32]
	str	r3, [r5, #36]
	str	r6, [r5, #44]
	b	.L241
.L358:
	cmp	r9, #0
	beq	.L266
.L278:
	ldr	r2, [r6, #8]
	sub	r2, r2, #88
	cmp	r2, #0
	str	r2, [r5, #732]
	movlt	r2, #0
	ldr	r3, [r6, #12]
	sub	r3, r3, #48
	str	r3, [r5, #736]
	strlt	r2, [r5, #732]
	blt	.L286
	cmp	r2, #16
	movgt	r2, #16
	strgt	r2, [r5, #732]
.L286:
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r5, #736]
	blt	.L288
	cmp	r3, #96
	movgt	r3, #96
	strgt	r3, [r5, #736]
.L288:
	mov	r1, #0
	str	r1, [r5, #740]
	ldr	r1, .L361+40
	str	r2, [r1]
	ldr	r2, .L361+44
	str	r3, [r2]
	b	.L246
.L357:
	cmp	r9, r3
	ble	.L343
	ldr	r3, .L361+44
	ldr	r2, [r5, #736]
	ldr	r1, [r3]
	cmp	r1, r2
	ldr	r2, [sp, #20]
	beq	.L359
	cmp	r2, #10
	movne	r1, #96
	moveq	r1, #0
	ldr	r2, [r6, #8]
	sub	r2, r2, #88
	cmp	r2, #16
	str	r1, [r3]
	movlt	r3, r2
	movge	r3, #16
	ldr	r2, .L361+40
	bic	r3, r3, r3, asr #31
	str	r3, [r2]
	b	.L246
.L359:
	cmp	r2, #10
	mov	r1, r7
	str	r3, [sp, #20]
	beq	.L360
	ldr	r0, .L361+140
	mov	lr, pc
	bx	r8
	mov	r1, #96
	ldr	r3, [sp, #20]
.L273:
	ldr	r2, [r3]
	sub	r0, r1, r2
	eor	ip, r0, r0, asr #31
	sub	ip, ip, r0, asr #31
	cmp	ip, #8
	movle	r2, r1
	ble	.L274
	cmp	r0, #0
	mvnle	r0, #7
	movgt	r0, #8
	add	r2, r2, r0
.L274:
	str	r2, [r3]
	mov	r3, r1
	ldr	r1, [r6, #8]
	sub	r1, r1, #88
	cmp	r1, #16
	mov	r0, #1
	movge	r1, #16
	str	r0, [r5, #740]
	ldr	r0, .L361+40
	bic	r1, r1, r1, asr #31
	str	r1, [r0]
	ldr	r0, .L361+144
	mov	lr, pc
	bx	r8
	b	.L246
.L360:
	ldr	r0, .L361+148
	mov	lr, pc
	bx	r8
	mov	r1, #0
	ldr	r3, [sp, #20]
	b	.L273
.L279:
	bne	.L278
	b	.L266
.L362:
	.align	2
.L361:
	.word	.LANCHOR0
	.word	.LC49
	.word	mgba_printf
	.word	.LC50
	.word	.LC65
	.word	.LANCHOR2
	.word	.LC35
	.word	.LC66
	.word	.L298
	.word	emCameraActive
	.word	worldCameraX
	.word	worldCameraY
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	resetButtonEffects
	.word	isCameraMoving
	.word	.LC64
	.word	shadowOAM+720
	.word	.LC72
	.word	.LC73
	.word	.LC76
	.word	.LC71
	.word	.LC70
	.word	.LC51
	.word	.LC53
	.word	.LC52
	.word	.LC57
	.word	.LC62
	.word	.LC58
	.word	.LC75
	.word	.LC74
	.word	.LC69
	.word	.LC68
	.word	.LC63
	.word	.LC55
	.word	.LC56
	.word	.LC54
	.size	updateAutomaticMovement2, .-updateAutomaticMovement2
	.section	.rodata.str1.4
	.align	2
.LC77:
	.ascii	"Button sequence2 reset\000"
	.text
	.align	2
	.global	resetButtonSequence2
	.syntax unified
	.arm
	.type	resetButtonSequence2, %function
resetButtonSequence2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{fp, lr}
	mvn	r2, #0
	mvn	fp, #0
	mvn	ip, #0
	mov	r0, #0
	ldr	r3, .L365
	ldr	r1, .L365+4
	str	fp, [r3, #32]
	str	ip, [r3, #36]
	str	r0, [r1, #748]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	ldr	r0, .L365+8
	ldr	r3, .L365+12
	mov	lr, pc
	bx	r3
	pop	{fp, lr}
	bx	lr
.L366:
	.align	2
.L365:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LC77
	.word	mgba_printf
	.size	resetButtonSequence2, .-resetButtonSequence2
	.align	2
	.global	resetCollisionSystem2
	.syntax unified
	.arm
	.type	resetCollisionSystem2, %function
resetCollisionSystem2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #0
	mov	r4, #0
	mov	r2, #0
	ldr	r5, .L374
	ldr	r0, .L374+4
	ldr	r1, .L374+8
	ldr	r7, .L374+12
	ldr	r8, .L374+16
	str	r2, [r5, #768]
	str	r3, [r5, #772]
	str	r2, [r5, #776]
	str	r3, [r5, #780]
	str	r4, [r1]
	mov	r2, #40
	mov	r1, r4
	str	r4, [r0]
	add	r0, r5, #392
	mov	r6, #512
	str	r4, [r5, #752]
	str	r4, [r5, #756]
	str	r4, [r5, #760]
	str	r4, [r5, #784]
	str	r4, [r5, #744]
	str	r4, [r5, #52]
	str	r4, [r5, #40]
	str	r4, [r5, #388]
	str	r4, [r5, #28]
	str	r4, [r5, #32]
	str	r4, [r5, #36]
	str	r4, [r5, #788]
	str	r4, [r5, #792]
	str	r4, [r5, #436]
	str	r4, [r5, #440]
	str	r4, [r5, #732]
	str	r4, [r5, #736]
	str	r4, [r5, #740]
	str	r4, [r5, #44]
	str	r4, [r5, #60]
	str	r4, [r5, #48]
	mov	lr, pc
	bx	r8
	mov	r3, r7
	strh	r6, [r3], #8	@ movhi
	mov	r2, #96
	mov	r1, r4
	add	r0, r5, #636
	strh	r6, [r3]	@ movhi
	strh	r6, [r7, #16]	@ movhi
	strh	r6, [r7, #40]	@ movhi
	str	r4, [r5, #796]
	str	r4, [r5, #800]
	str	r4, [r5, #64]
	str	r4, [r5, #432]
	str	r4, [r5, #56]
	mov	lr, pc
	bx	r8
	mov	r2, #96
	mov	r1, r4
	add	r0, r5, #444
	mov	lr, pc
	bx	r8
	mov	r2, #96
	mov	r1, r4
	add	r0, r5, #540
	mov	lr, pc
	bx	r8
	mvn	r2, #0
	add	r0, r5, #368
	sub	ip, r7, #720
	mov	lr, r0
	mov	r7, r0
	ldr	r3, .L374+20
	add	r1, r5, #348
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	add	r2, r5, #68
.L368:
	ldrb	r3, [r2, #52]	@ zero_extendqisi2
	str	r4, [r1], #4
	add	r3, ip, r3, lsl #3
	cmp	lr, r1
	str	r4, [r0], #4
	strh	r6, [r3, #40]	@ movhi
	add	r2, r2, #56
	bne	.L368
	ldr	r3, .L374+24
	str	r4, [r5, #748]
	mov	lr, pc
	bx	r3
	mov	ip, #40
	mov	r0, #41
	mov	r1, #42
	mov	r2, #43
	mov	r3, #44
	str	r4, [r5, #368]
	str	r4, [r5, #348]
	strb	ip, [r5, #120]
	strb	r0, [r5, #176]
	strb	r1, [r5, #232]
	strb	r2, [r5, #288]
	strb	r3, [r5, #344]
	str	r4, [r5, #352]
	str	r4, [r5, #356]
	str	r4, [r5, #360]
	str	r4, [r5, #364]
	str	r4, [r7, #4]
	str	r4, [r7, #8]
	str	r4, [r7, #12]
	str	r4, [r7, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L375:
	.align	2
.L374:
	.word	.LANCHOR0
	.word	emCameraActive
	.word	isCameraMoving
	.word	shadowOAM+720
	.word	memset
	.word	.LANCHOR1
	.word	resetButtonEffects
	.size	resetCollisionSystem2, .-resetCollisionSystem2
	.section	.rodata.str1.4
	.align	2
.LC78:
	.ascii	"Added button2 %d to sequence. Length: %d\000"
	.text
	.align	2
	.global	addButtonToSequence2
	.syntax unified
	.arm
	.type	addButtonToSequence2, %function
addButtonToSequence2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L381
	ldr	r2, [r4, #748]
	cmp	r2, #5
	mov	r5, r0
	sub	sp, sp, #8
	bgt	.L379
	ldr	r3, .L381+4
	ldr	r6, .L381+8
.L377:
	add	r3, r3, r2, lsl #2
	mov	r1, r5
	add	r2, r2, #1
	ldr	r0, .L381+12
	str	r5, [r3, #16]
	str	r2, [r4, #748]
	mov	lr, pc
	bx	r6
	mov	r2, #1
	mov	r3, #30
	add	r4, r4, r5, lsl #2
	str	r2, [r4, #348]
	str	r3, [r4, #368]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L379:
	mvn	r0, #0
	mvn	r1, #0
	ldr	r3, .L381+4
	mvn	r2, #0
	str	r0, [r3, #32]
	str	r1, [r3, #36]
	mov	r1, #0
	ldr	r0, .L381+16
	ldr	r6, .L381+8
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r3, [sp, #4]
	str	r1, [r4, #748]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #748]
	ldr	r3, [sp, #4]
	b	.L377
.L382:
	.align	2
.L381:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	mgba_printf
	.word	.LC78
	.word	.LC77
	.size	addButtonToSequence2, .-addButtonToSequence2
	.section	.rodata.str1.4
	.align	2
.LC79:
	.ascii	"Collision2 with button %d\000"
	.align	2
.LC80:
	.ascii	"Isosceles Triangle pattern2 detected with %d steps\000"
	.align	2
.LC81:
	.ascii	"4-button loop sequence but no isosceles pattern mat"
	.ascii	"ched - ERROR!\000"
	.align	2
.LC82:
	.ascii	"Right Triangle pattern2 detected with %d steps\000"
	.align	2
.LC83:
	.ascii	"Level 2: Loop sequence but no pattern matched - sho"
	.ascii	"wing error effect\000"
	.align	2
.LC84:
	.ascii	"=== CHECKING 7-BUTTON EM PATTERN ===\000"
	.align	2
.LC85:
	.ascii	"PATTERN_EM constant value is: %d\000"
	.align	2
.LC86:
	.ascii	"Full 7-button sequence:\000"
	.align	2
.LC87:
	.ascii	"  [%d] = %d\000"
	.align	2
.LC88:
	.ascii	"Calling setupPatternMovement2 with PATTERN_EM=%d\000"
	.align	2
.LC89:
	.ascii	"After setupPatternMovement2, movementLen = %d\000"
	.align	2
.LC90:
	.ascii	"7-Button EM pattern2 detected with %d steps\000"
	.align	2
.LC91:
	.ascii	"6-button loop sequence but no EM pattern matched - "
	.ascii	"ERROR!\000"
	.align	2
.LC92:
	.ascii	"No EM pattern2 detected. Resetting.\000"
	.text
	.align	2
	.global	checkButtonPatterns2
	.syntax unified
	.arm
	.type	checkButtonPatterns2, %function
checkButtonPatterns2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L420
	ldr	r4, [r5, #64]
	cmp	r4, #0
	sub	sp, sp, #28
	bne	.L402
	mov	r1, r4
	ldr	lr, [r0, #8]
	mov	r6, r0
	ldr	r2, .L420+4
	ldr	r0, [r0, #12]
	add	lr, lr, #32
	add	r0, r0, #32
	add	ip, r2, #20
.L401:
	ldr	r3, [r2]
	sub	r3, lr, r3
	add	r3, r3, #7
	cmp	r3, #46
	add	r2, r2, #4
	bhi	.L385
	ldr	r3, [ip]
	sub	r3, r0, r3
	add	r3, r3, #7
	cmp	r3, #46
	bls	.L412
.L385:
	add	r1, r1, #1
	cmp	r1, #5
	add	ip, ip, #4
	bne	.L401
.L402:
	mov	r0, #0
.L383:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L412:
	ldr	r2, [r5, #748]
	cmp	r2, #0
	beq	.L386
	ldr	r3, .L420+8
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #12]
	cmp	r3, r1
	beq	.L402
.L386:
	ldr	r0, .L420+12
	mov	r8, r6
	ldr	r6, .L420+16
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r0, [sp, #12]
	bl	addButtonToSequence2
	ldr	r2, [r5, #748]
	cmp	r2, #4
	beq	.L413
.L387:
	cmp	r2, #5
	beq	.L414
.L392:
	cmp	r2, #6
	bne	.L402
	ldr	r0, .L420+20
	mov	lr, pc
	bx	r6
	mov	r1, #3
	ldr	r0, .L420+24
	mov	lr, pc
	bx	r6
	ldr	r0, .L420+28
	mov	lr, pc
	bx	r6
	ldr	r3, .L420+32
.L396:
	ldr	r2, [r3, #4]!
	mov	r1, r4
	ldr	r0, .L420+36
	add	r4, r4, #1
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r4, #6
	ldr	r3, [sp, #12]
	bne	.L396
	mov	r3, #0
	mov	r1, #3
	ldr	r0, .L420+40
	str	r3, [sp, #20]
	str	r3, [r5, #744]
	str	r3, [r5, #52]
	str	r3, [r5, #388]
	str	r3, [r5, #40]
	mov	lr, pc
	bx	r6
	ldr	r2, .L420+44
	str	r2, [sp]
	add	r3, r2, #192
	add	r2, sp, #20
	str	r2, [sp, #4]
	ldr	r4, .L420+8
	mov	r0, #3
	ldr	r2, [r5, #748]
	add	r1, r4, #16
	bl	setupPatternMovement2
	ldr	r3, [sp, #20]
	ldr	r0, .L420+48
	mov	r1, r3
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bgt	.L415
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #36]
	cmp	r2, r3
	beq	.L416
	ldr	r0, .L420+52
	mov	lr, pc
	bx	r6
	mov	r3, #0
	mvn	r1, #0
	mvn	r2, #0
	str	r3, [r5, #748]
	mvn	r3, #0
	ldr	r0, .L420+56
	str	r1, [r4, #32]
	str	r2, [r4, #36]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r6
	b	.L402
.L413:
	ldr	r3, .L420+44
	add	r1, sp, #20
	str	r3, [sp]
	str	r1, [sp, #4]
	ldr	ip, .L420+8
	ldr	r7, [ip, #16]
	ldr	r9, [ip, #28]
	add	r1, ip, #16
	mov	ip, #0
	add	r3, r3, #192
	mov	r0, #2
	str	ip, [r5, #744]
	str	ip, [r5, #52]
	str	ip, [r5, #388]
	str	ip, [sp, #20]
	bl	setupPatternMovement2
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bgt	.L417
	moveq	r3, #1
	movne	r3, #0
	cmp	r7, r9
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	ldrne	r0, .L420+60
	bne	.L411
	ldr	r2, [r5, #748]
	b	.L387
.L414:
	mov	ip, #0
	ldr	r3, .L420+44
	add	r1, sp, #20
	str	r3, [sp]
	str	r1, [sp, #4]
	add	r3, r3, #192
	mov	r0, #1
	ldr	r1, .L420+64
	str	ip, [r5, #744]
	str	ip, [r5, #52]
	str	ip, [r5, #388]
	str	ip, [sp, #20]
	bl	setupPatternMovement2
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bgt	.L418
	ldr	r3, .L420+8
	ldr	r2, [r3, #16]
	ldr	r3, [r3, #32]
	cmp	r2, r3
	beq	.L419
.L395:
	ldr	r2, [r5, #748]
	b	.L392
.L415:
	mov	r1, r3
	ldr	r0, .L420+68
	mov	lr, pc
	bx	r6
	mov	r2, #1
	ldr	r1, .L420+72
	str	r2, [r5, #40]
	str	r2, [r5, #388]
	mov	lr, pc
	bx	r1
	ldr	r1, [r5, #748]
	add	r0, r4, #16
	ldr	r2, .L420+76
	mov	lr, pc
	bx	r2
	mov	r0, r8
	ldr	r1, [sp, #12]
	bl	startAutomaticMovement2
.L410:
	mov	r3, #0
	mvn	r1, #0
	mvn	r2, #0
	str	r3, [r5, #748]
	mvn	r3, #0
	ldr	r0, .L420+56
	str	r1, [r4, #32]
	str	r2, [r4, #36]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r6
.L391:
	mov	r0, #1
	b	.L383
.L416:
	ldr	r0, .L420+80
	mov	lr, pc
	bx	r6
	ldr	r3, .L420+84
	ldr	r1, [r5, #748]
	add	r0, r4, #16
	mov	lr, pc
	bx	r3
	b	.L410
.L417:
	mov	r1, r3
	ldr	r0, .L420+88
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r6
	mov	r2, #1
	ldr	r1, .L420+72
	str	r2, [r5, #52]
.L409:
	ldr	r7, .L420+8
	str	r2, [r5, #388]
	mov	lr, pc
	bx	r1
	ldr	r2, .L420+76
	ldr	r1, [r5, #748]
	add	r0, r7, #16
	mov	lr, pc
	bx	r2
	mov	r0, r8
	ldr	r1, [sp, #12]
	bl	startAutomaticMovement2
	mov	r3, #0
	mvn	r4, #0
	str	r3, [r5, #748]
	mvn	r3, #0
	mvn	r5, #0
	ldr	r0, .L420+56
	str	r4, [r7, #32]
	str	r5, [r7, #36]
	str	r3, [r7, #16]
	str	r3, [r7, #20]
	str	r3, [r7, #24]
	str	r3, [r7, #28]
	mov	lr, pc
	bx	r6
	b	.L391
.L418:
	mov	r1, r3
	ldr	r0, .L420+92
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r6
	mov	r2, #1
	ldr	r1, .L420+72
	str	r2, [r5, #744]
	b	.L409
.L419:
	ldr	r3, [r5, #744]
	ldr	r2, [r5, #52]
	orrs	r3, r3, r2
	bne	.L395
	ldr	r0, .L420+96
.L411:
	mov	lr, pc
	bx	r6
	ldr	r3, .L420+84
	ldr	r1, [r5, #748]
	ldr	r0, .L420+64
	mov	lr, pc
	bx	r3
	bl	resetButtonSequence2
	b	.L391
.L421:
	.align	2
.L420:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	.LANCHOR1
	.word	.LC79
	.word	mgba_printf
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LANCHOR1+12
	.word	.LC87
	.word	.LC88
	.word	.LANCHOR0+444
	.word	.LC89
	.word	.LC92
	.word	.LC77
	.word	.LC81
	.word	.LANCHOR1+16
	.word	.LC90
	.word	resetButtonEffects
	.word	startButtonSuccessEffect
	.word	.LC91
	.word	startButtonErrorEffect
	.word	.LC80
	.word	.LC82
	.word	.LC83
	.size	checkButtonPatterns2, .-checkButtonPatterns2
	.align	2
	.global	checkTileCollision2
	.syntax unified
	.arm
	.type	checkTileCollision2, %function
checkTileCollision2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	checkButtonPatterns2
	.size	checkTileCollision2, .-checkTileCollision2
	.align	2
	.global	isAutomaticMovementFinished2
	.syntax unified
	.arm
	.type	isAutomaticMovementFinished2, %function
isAutomaticMovementFinished2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L424
	ldr	r0, [r3, #56]
	bx	lr
.L425:
	.align	2
.L424:
	.word	.LANCHOR0
	.size	isAutomaticMovementFinished2, .-isAutomaticMovementFinished2
	.align	2
	.global	isAutomaticMovementActive2
	.syntax unified
	.arm
	.type	isAutomaticMovementActive2, %function
isAutomaticMovementActive2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L427
	ldr	r0, [r3, #64]
	bx	lr
.L428:
	.align	2
.L427:
	.word	.LANCHOR0
	.size	isAutomaticMovementActive2, .-isAutomaticMovementActive2
	.section	.rodata.str1.4
	.align	2
.LC93:
	.ascii	"PATTERN COMPLETED2 CHANGED: %d -> %d\000"
	.align	2
.LC94:
	.ascii	"ISOSCELES ACTIVE2 CHANGED: %d -> %d\000"
	.text
	.align	2
	.global	debugIsoscelesSpriteState2
	.syntax unified
	.arm
	.type	debugIsoscelesSpriteState2, %function
debugIsoscelesSpriteState2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L433
	ldr	r4, .L433+4
	ldr	r2, [r5, #28]
	ldr	r1, [r4, #40]
	cmp	r2, r1
	beq	.L430
	ldr	r3, .L433+8
	ldr	r0, .L433+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #28]
	str	r3, [r4, #40]
.L430:
	ldr	r2, [r5, #52]
	ldr	r1, [r4, #44]
	cmp	r2, r1
	beq	.L429
	ldr	r3, .L433+8
	ldr	r0, .L433+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #52]
	str	r3, [r4, #44]
.L429:
	pop	{r4, r5, r6, lr}
	bx	lr
.L434:
	.align	2
.L433:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	mgba_printf
	.word	.LC93
	.word	.LC94
	.size	debugIsoscelesSpriteState2, .-debugIsoscelesSpriteState2
	.section	.rodata.str1.4
	.align	2
.LC95:
	.ascii	"=== AUTO MOVEMENT2 DEBUG ===\000"
	.align	2
.LC96:
	.ascii	"Active: %d, Finished: %d, CurrentStep: %d\000"
	.align	2
.LC97:
	.ascii	"Step2 %d: Movement=%d, Duration=%d, Timer=%d\000"
	.align	2
.LC98:
	.ascii	"NO MOVEMENT2 SEQUENCE FOUND!\000"
	.align	2
.LC99:
	.ascii	"===========================\000"
	.text
	.align	2
	.global	debugAutomaticMovementState2
	.syntax unified
	.arm
	.type	debugAutomaticMovementState2, %function
debugAutomaticMovementState2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #0
	ldr	r7, .L442
	ldr	r0, .L442+4
	ldr	r8, .L442+8
	sub	sp, sp, #12
	mov	lr, pc
	bx	r8
	ldr	r2, [r7, #56]
	ldr	r3, [r7, #432]
	ldr	r1, [r7, #64]
	ldr	r0, .L442+12
	mov	lr, pc
	bx	r8
	mov	r2, r4
	add	r5, r7, #440
	add	r6, r7, #536
	add	r9, r7, #636
	add	r7, r7, #540
.L437:
	ldr	r3, [r5, #4]!
	cmp	r3, #0
	ble	.L436
	ldr	ip, [r7, r4, lsl #2]
	ldr	r2, [r9, r4, lsl #2]
	mov	r1, r4
	ldr	r0, .L442+16
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	mov	r2, #1
.L436:
	cmp	r5, r6
	add	r4, r4, #1
	bne	.L437
	cmp	r2, #0
	beq	.L441
.L438:
	ldr	r0, .L442+20
	mov	lr, pc
	bx	r8
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L441:
	ldr	r0, .L442+24
	mov	lr, pc
	bx	r8
	b	.L438
.L443:
	.align	2
.L442:
	.word	.LANCHOR0
	.word	.LC95
	.word	mgba_printf
	.word	.LC96
	.word	.LC97
	.word	.LC99
	.word	.LC98
	.size	debugAutomaticMovementState2, .-debugAutomaticMovementState2
	.section	.rodata.str1.4
	.align	2
.LC100:
	.ascii	"=== PLAYER2 COLLISION BOX ===\000"
	.align	2
.LC101:
	.ascii	"Player2 pos: (%d,%d)\000"
	.align	2
.LC102:
	.ascii	"Collision2 box: (%d,%d) to (%d,%d) size %dx%d\000"
	.align	2
.LC103:
	.ascii	"Collision2 box colors: [TL:%d, TR:%d, BL:%d, BR:%d]"
	.ascii	"\000"
	.align	2
.LC104:
	.ascii	"============================\000"
	.text
	.align	2
	.global	debugPlayerCollisionBox2
	.syntax unified
	.arm
	.type	debugPlayerCollisionBox2, %function
debugPlayerCollisionBox2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r8, r0
	sub	sp, sp, #20
	ldr	r5, .L446
	ldr	r0, .L446+4
	ldr	r9, [r8, #8]
	ldr	r7, [r8, #12]
	mov	lr, pc
	bx	r5
	add	r1, r8, #8
	ldm	r1, {r1, r2}
	ldr	r0, .L446+8
	mov	lr, pc
	bx	r5
	mov	r3, #32
	mov	r2, #16
	add	r6, r9, #24
	add	r4, r7, #16
	add	r9, r9, #40
	add	r7, r7, #48
	mov	r1, r6
	str	r3, [sp, #8]
	str	r2, [sp, #4]
	mov	r3, r9
	mov	r2, r4
	str	r7, [sp]
	ldr	r0, .L446+12
	mov	lr, pc
	bx	r5
	lsl	r2, r4, #8
	ldr	lr, .L446+16
	add	r1, r2, #8192
	add	ip, r9, r1
	ldrb	ip, [lr, ip]	@ zero_extendqisi2
	add	r4, r6, r1
	add	r6, r6, r2
	add	r2, r9, r2
	ldrb	r3, [lr, r4]	@ zero_extendqisi2
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	ldrb	r1, [lr, r6]	@ zero_extendqisi2
	ldr	r0, .L446+20
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldr	r0, .L446+24
	mov	lr, pc
	bx	r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L447:
	.align	2
.L446:
	.word	mgba_printf
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	tempCol2Bitmap
	.word	.LC103
	.word	.LC104
	.size	debugPlayerCollisionBox2, .-debugPlayerCollisionBox2
	.section	.rodata.str1.4
	.align	2
.LC105:
	.ascii	"DOWN\000"
	.align	2
.LC106:
	.ascii	"UP\000"
	.align	2
.LC107:
	.ascii	"LEFT\000"
	.align	2
.LC108:
	.ascii	"RIGHT\000"
	.align	2
.LC109:
	.ascii	"DIAG_DOWN_RIGHT\000"
	.align	2
.LC110:
	.ascii	"DIAG_DOWN_LEFT\000"
	.align	2
.LC111:
	.ascii	"DIAG_UP_RIGHT\000"
	.align	2
.LC112:
	.ascii	"DIAG_UP_LEFT\000"
	.align	2
.LC113:
	.ascii	"PAUSE_LEFT\000"
	.align	2
.LC114:
	.ascii	"PAUSE_RIGHT\000"
	.align	2
.LC115:
	.ascii	"PAUSE_UP\000"
	.align	2
.LC116:
	.ascii	"PAUSE_DOWN\000"
	.global	BUTTON_POSITIONS_Y2
	.global	BUTTON_POSITIONS_X2
	.global	bgVOff2
	.global	bgHOff2
	.global	buttonAnimationTimer2
	.global	buttonAnimated2
	.global	gameButtons2
	.global	buttonSequence2
	.global	lastPauseWasUp
	.global	lastPauseType
	.global	emPauseTypes
	.global	emPatternSpriteIndex
	.global	showEmPatternSprite2
	.global	emPatternSpriteTimer2
	.global	isEMPauseActive
	.global	savedCameraY
	.global	savedCameraX
	.global	emPauseOriginalCameraY
	.global	emPauseCameraY
	.global	savedPlayerY
	.global	savedPlayerX
	.global	automaticMovementFinished2
	.global	movementTimers2
	.global	movementDurations2
	.global	movementSequence2
	.global	currentMovementStep2
	.global	automaticMovementActive2
	.global	patternSpriteOAMIndex
	.global	patternSpriteTimer2
	.global	showPatternSprite2
	.global	patternSpritePosY2
	.global	patternSpritePosX2
	.global	patternCompleted2
	.global	sequenceComplete2
	.global	buttonsCollected2
	.global	spriteChanged2
	.global	currentCollisionStep2
	.global	showAccessory2
	.global	emPatternActive2
	.global	isoscelesTrianglePatternActive2
	.global	rightTrianglePatternActive2
	.data
	.align	3
	.set	.LANCHOR1,. + 0
	.type	patternSpriteOAMIndex, %object
	.size	patternSpriteOAMIndex, 12
patternSpriteOAMIndex:
	.word	90
	.word	91
	.word	92
	.space	4
	.type	buttonSequence2, %object
	.size	buttonSequence2, 24
buttonSequence2:
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.type	lastPatternCompleted.1, %object
	.size	lastPatternCompleted.1, 4
lastPatternCompleted.1:
	.word	-1
	.type	lastIsoscelesActive.0, %object
	.size	lastIsoscelesActive.0, 4
lastIsoscelesActive.0:
	.word	-1
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	patternSpritePosX2, %object
	.size	patternSpritePosX2, 12
patternSpritePosX2:
	.space	12
	.space	4
	.type	patternSpritePosY2, %object
	.size	patternSpritePosY2, 12
patternSpritePosY2:
	.space	12
	.type	patternCompleted2, %object
	.size	patternCompleted2, 4
patternCompleted2:
	.space	4
	.type	showPatternSprite2, %object
	.size	showPatternSprite2, 4
showPatternSprite2:
	.space	4
	.type	patternSpriteTimer2, %object
	.size	patternSpriteTimer2, 4
patternSpriteTimer2:
	.space	4
	.type	emPatternActive2, %object
	.size	emPatternActive2, 4
emPatternActive2:
	.space	4
	.type	showEmPatternSprite2, %object
	.size	showEmPatternSprite2, 4
showEmPatternSprite2:
	.space	4
	.type	emPatternSpriteIndex, %object
	.size	emPatternSpriteIndex, 4
emPatternSpriteIndex:
	.space	4
	.type	isoscelesTrianglePatternActive2, %object
	.size	isoscelesTrianglePatternActive2, 4
isoscelesTrianglePatternActive2:
	.space	4
	.type	automaticMovementFinished2, %object
	.size	automaticMovementFinished2, 4
automaticMovementFinished2:
	.space	4
	.type	emPatternSpriteTimer2, %object
	.size	emPatternSpriteTimer2, 4
emPatternSpriteTimer2:
	.space	4
	.type	automaticMovementActive2, %object
	.size	automaticMovementActive2, 4
automaticMovementActive2:
	.space	4
	.type	gameButtons2, %object
	.size	gameButtons2, 280
gameButtons2:
	.space	280
	.type	buttonAnimated2, %object
	.size	buttonAnimated2, 20
buttonAnimated2:
	.space	20
	.type	buttonAnimationTimer2, %object
	.size	buttonAnimationTimer2, 20
buttonAnimationTimer2:
	.space	20
	.type	showAccessory2, %object
	.size	showAccessory2, 4
showAccessory2:
	.space	4
	.type	emPauseTypes, %object
	.size	emPauseTypes, 40
emPauseTypes:
	.space	40
	.type	currentMovementStep2, %object
	.size	currentMovementStep2, 4
currentMovementStep2:
	.space	4
	.type	savedPlayerX, %object
	.size	savedPlayerX, 4
savedPlayerX:
	.space	4
	.type	savedPlayerY, %object
	.size	savedPlayerY, 4
savedPlayerY:
	.space	4
	.type	movementDurations2, %object
	.size	movementDurations2, 96
movementDurations2:
	.space	96
	.type	movementTimers2, %object
	.size	movementTimers2, 96
movementTimers2:
	.space	96
	.type	movementSequence2, %object
	.size	movementSequence2, 96
movementSequence2:
	.space	96
	.type	savedCameraX, %object
	.size	savedCameraX, 4
savedCameraX:
	.space	4
	.type	savedCameraY, %object
	.size	savedCameraY, 4
savedCameraY:
	.space	4
	.type	isEMPauseActive, %object
	.size	isEMPauseActive, 4
isEMPauseActive:
	.space	4
	.type	rightTrianglePatternActive2, %object
	.size	rightTrianglePatternActive2, 4
rightTrianglePatternActive2:
	.space	4
	.type	buttonSequenceLength2, %object
	.size	buttonSequenceLength2, 4
buttonSequenceLength2:
	.space	4
	.type	currentCollisionStep2, %object
	.size	currentCollisionStep2, 4
currentCollisionStep2:
	.space	4
	.type	spriteChanged2, %object
	.size	spriteChanged2, 4
spriteChanged2:
	.space	4
	.type	sequenceComplete2, %object
	.size	sequenceComplete2, 4
sequenceComplete2:
	.space	4
	.space	4
	.type	buttonsCollected2, %object
	.size	buttonsCollected2, 20
buttonsCollected2:
	.space	20
	.type	emPauseCameraY, %object
	.size	emPauseCameraY, 4
emPauseCameraY:
	.space	4
	.type	emPauseOriginalCameraY, %object
	.size	emPauseOriginalCameraY, 4
emPauseOriginalCameraY:
	.space	4
	.type	lastPauseType, %object
	.size	lastPauseType, 4
lastPauseType:
	.space	4
	.type	lastPauseWasUp, %object
	.size	lastPauseWasUp, 4
lastPauseWasUp:
	.space	4
	.type	bgVOff2, %object
	.size	bgVOff2, 4
bgVOff2:
	.space	4
	.type	bgHOff2, %object
	.size	bgHOff2, 4
bgHOff2:
	.space	4
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	BUTTON_POSITIONS_X2, %object
	.size	BUTTON_POSITIONS_X2, 20
BUTTON_POSITIONS_X2:
	.word	193
	.word	39
	.word	192
	.word	39
	.word	117
	.type	BUTTON_POSITIONS_Y2, %object
	.size	BUTTON_POSITIONS_Y2, 20
BUTTON_POSITIONS_Y2:
	.word	47
	.word	223
	.word	219
	.word	49
	.word	128
	.type	CSWTCH.208, %object
	.size	CSWTCH.208, 32
CSWTCH.208:
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.type	CSWTCH.211, %object
	.size	CSWTCH.211, 48
CSWTCH.211:
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.ident	"GCC: (devkitARM release 66) 15.1.0"
