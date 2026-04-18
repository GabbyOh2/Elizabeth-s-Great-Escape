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
	.file	"collision.c"
	.text
	.align	2
	.global	initPatternPositions
	.syntax unified
	.arm
	.type	initPatternPositions, %function
initPatternPositions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{fp, lr}
	mov	ip, #100
	mov	fp, #100
	mov	r0, #145
	mov	r1, #145
	ldr	r3, .L4
	mov	r2, #0
	mov	lr, #100
	stm	r3, {fp-ip}
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	mov	ip, #50
	mov	r0, #512
	ldr	r1, .L4+4
	str	lr, [r3, #8]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	ip, [r3, #24]
	strh	r0, [r1]	@ movhi
	pop	{fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	shadowOAM+480
	.size	initPatternPositions, .-initPatternPositions
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"  Timer expired - hiding THIS sprite only\000"
	.align	2
.LC1:
	.ascii	"  HIDING sprite - conditions not met\000"
	.align	2
.LC2:
	.ascii	"  Pattern %d at world coords: (%d, %d)\000"
	.align	2
.LC3:
	.ascii	"  Screen coords: (%d, %d)\000"
	.align	2
.LC4:
	.ascii	"  HIDING sprite - off screen\000"
	.text
	.align	2
	.global	drawPatternSprite
	.syntax unified
	.arm
	.type	drawPatternSprite, %function
drawPatternSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L22
	ldr	r2, [r3, #36]
	cmp	r2, #0
	sub	sp, sp, #8
	ble	.L21
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L9
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L9
	ldr	r2, .L22+4
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L9
	ldr	r2, [r0, #12]
	ldr	ip, [r0, #8]
	sub	r2, r2, #48
	sub	r0, ip, #88
	bic	r6, r2, r2, asr #31
	sub	r2, r1, #1
	bic	r5, r0, r0, asr #31
	add	r0, r3, r2, lsl #2
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r0, #16]
	ldr	r4, .L22+8
	ldr	r0, .L22+12
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	lr, pc
	bx	r4
	ldr	r2, [sp, #4]
	ldr	r3, [sp]
	cmp	r5, #16
	suble	r1, r2, r5
	subgt	r1, r2, #16
	cmp	r6, #96
	suble	r2, r3, r6
	subgt	r2, r3, #96
	ldr	r0, .L22+16
	stm	sp, {r1, r2}
	mov	lr, pc
	bx	r4
	ldr	r1, [sp]
	add	r3, r1, #64
	cmp	r3, #304
	bhi	.L11
	ldr	r2, [sp, #4]
	add	r3, r2, #64
	cmp	r3, #224
	bhi	.L11
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #18
	mvn	r1, r1, lsr #18
	ldr	r3, .L22+20
	ldr	r0, .L22+24
	and	r2, r2, #255
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	ldr	r0, .L22+28
.L20:
	ldr	r3, .L22+8
	mov	lr, pc
	bx	r3
	mov	r2, #512
	ldr	r3, .L22+20
	strh	r2, [r3]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	ldr	r0, .L22+32
	b	.L20
.L21:
	ldr	r0, .L22+36
	ldr	r2, .L22+8
	mov	lr, pc
	bx	r2
	mov	r0, #512
	mov	r2, #0
	ldr	r1, .L22+20
	ldr	r3, .L22
	strh	r0, [r1]	@ movhi
	str	r2, [r3, #32]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	isoscelesTrianglePatternActive
	.word	mgba_printf
	.word	.LC2
	.word	.LC3
	.word	shadowOAM+480
	.word	29304
	.word	.LC1
	.word	.LC4
	.word	.LC0
	.size	drawPatternSprite, .-drawPatternSprite
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"Pattern timer: %d\000"
	.align	2
.LC6:
	.ascii	"TIMER EXPIRED - Hiding sprite\000"
	.text
	.align	2
	.global	updatePatternSpriteTimer
	.syntax unified
	.arm
	.type	updatePatternSpriteTimer, %function
updatePatternSpriteTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	ldr	r1, [r3, #36]
	cmp	r1, #0
	bxle	lr
	sub	r1, r1, #1
	push	{r4, lr}
	ldr	r2, .L33+4
	ldr	r0, .L33+8
	str	r1, [r3, #36]
	mov	lr, pc
	bx	r2
	ldr	r3, .L33
	ldr	r1, [r3, #36]
	cmp	r1, #0
	ldr	r2, .L33+4
	ble	.L32
	pop	{r4, lr}
	bx	lr
.L32:
	ldr	r0, .L33+12
	mov	lr, pc
	bx	r2
	mov	r2, #0
	mov	ip, #512
	ldr	r0, .L33+16
	ldr	r1, .L33+20
	ldr	r3, .L33
	strh	ip, [r0]	@ movhi
	str	r2, [r3, #32]
	str	r2, [r1]
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC5
	.word	.LC6
	.word	shadowOAM+480
	.word	isoscelesTrianglePatternActive
	.size	updatePatternSpriteTimer, .-updatePatternSpriteTimer
	.align	2
	.global	initButtons
	.syntax unified
	.arm
	.type	initButtons, %function
initButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #40
	mov	lr, #512
	mov	r1, #0
	ldr	r0, .L39
	ldr	r3, .L39+4
.L36:
	add	ip, r2, #1
	strb	r2, [r0, #52]
	and	r2, ip, #255
	cmp	r2, #45
	strh	lr, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	add	r0, r0, #56
	add	r3, r3, #8
	bne	.L36
	ldr	r3, .L39+8
	str	r1, [r3, #320]
	str	r1, [r3, #324]
	str	r1, [r3, #328]
	str	r1, [r3, #332]
	str	r1, [r3, #336]
	str	r1, [r3, #340]
	str	r1, [r3, #344]
	str	r1, [r3, #348]
	str	r1, [r3, #352]
	str	r1, [r3, #356]
	ldr	lr, [sp], #4
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0+40
	.word	shadowOAM+360
	.word	.LANCHOR0
	.size	initButtons, .-initButtons
	.align	2
	.global	updateButtons
	.syntax unified
	.arm
	.type	updateButtons, %function
updateButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L48
	add	r2, r3, #20
	mov	ip, #0
	mov	r0, r2
.L45:
	ldr	r1, [r3], #4
	cmp	r1, #0
	beq	.L43
	ldr	r1, [r2]
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r2]
	strle	ip, [r3, #-4]
.L43:
	cmp	r3, r0
	add	r2, r2, #4
	bne	.L45
	bx	lr
.L49:
	.align	2
.L48:
	.word	.LANCHOR0+320
	.size	updateButtons, .-updateButtons
	.align	2
	.global	drawButtons
	.syntax unified
	.arm
	.type	drawButtons, %function
drawButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, [r0, #8]
	ldr	r3, [r0, #12]
	sub	r9, r9, #88
	bic	r9, r9, r9, asr #31
	sub	fp, r3, #48
	cmp	r9, #16
	bic	fp, fp, fp, asr #31
	movge	r9, #16
	cmp	fp, #96
	mov	r5, #0
	movge	fp, #96
	ldr	r10, .L59
	ldr	r7, .L59+4
	ldr	r2, .L59+8
	add	r8, r10, #20
.L55:
	ldr	r4, [r10], #4
	sub	r4, r4, r9
	add	r0, r4, #32
	cmp	r0, #272
	mov	ip, r8
	add	r8, r8, #4
	bhi	.L51
	ldr	r6, [ip]
	sub	r6, r6, fp
	add	r0, r6, #32
	cmp	r0, #192
	bhi	.L51
	lsl	r4, r4, #23
	lsr	r4, r4, #23
	mvn	r4, r4, lsl #17
	mov	r0, r5
	ldr	r3, .L59+12
	mov	lr, pc
	bx	r3
	ldr	r1, .L59+16
	ldr	ip, [r1, r5, lsl #2]
	cmp	ip, #0
	moveq	ip, #776
	movne	ip, #780
	mvn	r4, r4, lsr #17
	ldr	r2, .L59+8
	orr	ip, ip, r0, lsl #12
	ldrb	r0, [r7, #52]	@ zero_extendqisi2
	and	r6, r6, #255
	add	lr, r2, r0, lsl #3
	orr	ip, ip, #1024
	lsl	r0, r0, #3
	strh	ip, [lr, #4]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	r6, [r2, r0]	@ movhi
.L53:
	add	r5, r5, #1
	cmp	r5, #5
	add	r7, r7, #56
	bne	.L55
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L51:
	mov	ip, #512
	ldrb	r0, [r7, #52]	@ zero_extendqisi2
	lsl	lr, r0, #3
	add	r0, r2, r0, lsl #3
	strh	ip, [r2, lr]	@ movhi
	strh	ip, [r0, #40]	@ movhi
	b	.L53
.L60:
	.align	2
.L59:
	.word	.LANCHOR1
	.word	.LANCHOR0+40
	.word	shadowOAM
	.word	getButtonPaletteRow
	.word	.LANCHOR0+320
	.size	drawButtons, .-drawButtons
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"Button indices: [%d,%d,%d,%d,%d]\000"
	.align	2
.LC8:
	.ascii	"Pattern 0,3,1,2,0 - Left, Down, Right, Up\000"
	.align	2
.LC9:
	.ascii	"Pattern 0,2,1,3,0 - Down, Left, Up, Right\000"
	.align	2
.LC10:
	.ascii	"Pattern 3,1,2,0,3 - Down, Right, Up, Left\000"
	.align	2
.LC11:
	.ascii	"Step %d: MOVEMENT_PAUSE_DOWN = %d\000"
	.align	2
.LC12:
	.ascii	"Step %d: MOVEMENT_DOWN = %d\000"
	.align	2
.LC13:
	.ascii	"Pattern 3,0,2,1,3 - Right, Down, Left, Up\000"
	.text
	.align	2
	.global	setupSquareFromSequence
	.syntax unified
	.arm
	.type	setupSquareFromSequence, %function
setupSquareFromSequence:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	mov	r7, r3
	ldr	r3, [r4, #16]
	sub	sp, sp, #24
	str	r3, [sp, #4]
	ldr	r3, [r4, #12]
	str	r3, [sp]
	mov	r6, r2
	ldr	r0, .L72
	ldm	r4, {r1, r2, r3}
	ldr	r5, .L72+4
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, .L72+8
	str	r3, [r2]
	mov	r2, #1
	ldr	r1, .L72+12
	str	r3, [r1]
	ldr	r3, .L72+16
	str	r2, [r3]
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L62
	ldr	r3, [r4, #4]
	cmp	r3, #3
	beq	.L69
	cmp	r3, #2
	bne	.L61
	ldr	r2, [r4, #8]
	cmp	r2, #1
	bne	.L61
	ldr	r1, [r4, #12]
	cmp	r1, #3
	beq	.L70
.L61:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L62:
	cmp	r3, #3
	bne	.L61
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L71
	cmp	r3, #0
	bne	.L61
	ldr	r2, [r4, #8]
	cmp	r2, #2
	bne	.L61
	ldr	r1, [r4, #12]
	cmp	r1, #1
	bne	.L61
	ldr	r4, [r4, #16]
	cmp	r4, #3
	bne	.L61
	ldr	r0, .L72+20
	str	r1, [sp, #20]
	str	r2, [sp, #16]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	ip, #9
	mov	r0, #20
	mov	r5, #17
	ldr	r3, [sp, #56]
	ldr	r2, [r3]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r1, [r2]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [sp, #56]
	ldr	ip, [r1]
	add	ip, ip, #1
	str	ip, [r1]
	ldr	r3, [sp, #56]
	str	r4, [r6, ip, lsl #2]
	ldr	r4, [r3]
	str	r5, [r7, r4, lsl #2]
	ldr	r4, [r3]
	add	r4, r4, #1
	str	r4, [r3]
	mov	r3, #11
	str	r3, [r6, r4, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r4, [r3]
	str	r0, [r7, r4, lsl #2]
	ldr	r4, [r3]
	add	r4, r4, #1
	str	r4, [r3]
	ldr	r3, [sp, #12]
	str	r3, [r6, r4, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r5, [r7, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	ldr	r2, [sp, #56]
	add	r3, r3, #1
	str	r3, [r2]
	mov	lr, #10
	mov	r2, #8
	b	.L68
.L69:
	ldr	r2, [r4, #8]
	cmp	r2, #1
	bne	.L61
	ldr	r1, [r4, #12]
	cmp	r1, #2
	bne	.L61
	ldr	r4, [r4, #16]
	cmp	r4, #0
	bne	.L61
	ldr	r0, .L72+24
	str	r1, [sp, #20]
	str	r2, [sp, #16]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	lr, #8
	mov	r0, #20
	mov	ip, #17
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	lr, [r6, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	lr, [r3]
	ldr	r1, [sp, #56]
	str	r0, [r7, lr, lsl #2]
	ldr	lr, [r1]
	add	lr, lr, #1
	str	lr, [r1]
	ldr	r1, [sp, #20]
	str	r1, [r6, lr, lsl #2]
	ldr	r1, [sp, #56]
	ldr	r1, [r1]
	ldr	r3, [sp, #56]
	str	ip, [r7, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	mov	r3, #11
	str	r3, [r6, r1, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r1, [r3]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	str	r4, [r6, r1, lsl #2]
	ldr	r1, [r3]
	mov	r3, #15
	str	r3, [r7, r1, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	mov	r3, #9
	str	r3, [r6, r1, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r1, [r3]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	ldr	r3, [sp, #12]
	str	r3, [r6, r1, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	ldr	r1, [sp, #56]
	add	r3, r3, #1
	str	r3, [r1]
	mov	r1, #10
	mov	r5, #12
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	ldr	r1, [sp, #56]
	ldr	r2, [sp, #16]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r5, [r7, r3, lsl #2]
	b	.L67
.L71:
	ldr	r2, [r4, #8]
	cmp	r2, #2
	mov	r10, r2
	bne	.L61
	ldr	r2, [r4, #12]
	subs	r9, r2, #0
	bne	.L61
	ldr	r4, [r4, #16]
	cmp	r4, #3
	bne	.L61
	ldr	r0, .L72+28
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r2, #11
	mov	r8, #20
	ldr	r3, [sp, #56]
	ldr	r1, [r3]
	str	r2, [r6, r1, lsl #2]
	ldr	r1, [r3]
	str	r8, [r7, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	ldr	r0, .L72+32
	mov	lr, pc
	bx	r5
	ldr	r3, [sp, #56]
	ldr	r2, [r3]
	str	r9, [r6, r2, lsl #2]
	mov	r2, r9
	mov	r9, #17
	ldr	r3, [sp, #56]
	ldr	r1, [r3]
	str	r9, [r7, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	ldr	r0, .L72+36
	mov	lr, pc
	bx	r5
	mov	lr, #9
	mov	ip, #10
	ldr	r3, [sp, #56]
	ldr	r2, [r3]
	str	lr, [r6, r2, lsl #2]
	ldr	r2, [r3]
	str	r8, [r7, r2, lsl #2]
	mov	r0, #8
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [r3]
	str	r9, [r7, r2, lsl #2]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	str	ip, [r6, r2, lsl #2]
	mov	r1, #12
	ldr	r2, [r3]
	str	r8, [r7, r2, lsl #2]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	ldr	r3, [sp, #12]
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r9, [r7, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	ldr	r2, [sp, #56]
	add	r3, r3, #1
	str	r3, [r2]
	str	r0, [r6, r3, lsl #2]
	ldr	r3, [r2]
	str	r8, [r7, r3, lsl #2]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	str	r10, [r6, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r1, [r7, r3, lsl #2]
.L67:
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	ldr	r2, [sp, #56]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L61
.L70:
	ldr	r4, [r4, #16]
	cmp	r4, #0
	bne	.L61
	ldr	r0, .L72+40
	str	r1, [sp, #20]
	str	r2, [sp, #16]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	ip, #11
	mov	r0, #20
	mov	r5, #17
	ldr	r3, [sp, #56]
	ldr	r2, [r3]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [sp, #56]
	ldr	r1, [r2]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [sp, #56]
	ldr	ip, [r1]
	add	ip, ip, #1
	str	ip, [r1]
	ldr	r3, [sp, #56]
	str	r4, [r6, ip, lsl #2]
	ldr	r4, [r3]
	str	r5, [r7, r4, lsl #2]
	ldr	r4, [r3]
	add	r4, r4, #1
	str	r4, [r3]
	mov	r3, #8
	str	r3, [r6, r4, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r4, [r3]
	str	r0, [r7, r4, lsl #2]
	ldr	r4, [r3]
	add	r4, r4, #1
	str	r4, [r3]
	ldr	r3, [sp, #12]
	str	r3, [r6, r4, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r5, [r7, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	ldr	r2, [sp, #56]
	add	r3, r3, #1
	str	r3, [r2]
	mov	lr, #9
	mov	r2, #10
.L68:
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	ldr	r2, [sp, #56]
	add	r3, r3, #1
	str	r3, [r2]
	ldr	r2, [sp, #16]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r5, [r7, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	ldr	r2, [sp, #56]
	add	r3, r3, #1
	str	r3, [r2]
	str	lr, [r6, r3, lsl #2]
	ldr	r3, [r2]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	mov	r2, #12
	ldr	r1, [sp, #20]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	str	r2, [r7, r3, lsl #2]
	b	.L67
.L73:
	.align	2
.L72:
	.word	.LC7
	.word	mgba_printf
	.word	rightTrianglePatternActive
	.word	isoscelesTrianglePatternActive
	.word	squarePatternActive
	.word	.LC13
	.word	.LC8
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC9
	.size	setupSquareFromSequence, .-setupSquareFromSequence
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"Right Triangle - Button indices: [%d,%d,%d,%d,%d]\000"
	.align	2
.LC15:
	.ascii	"Pattern 3,4,2,1,3 - DIAG_DOWN_RIGHT x2, RIGHT, UP\000"
	.align	2
.LC16:
	.ascii	"Pattern 3,1,2,4,3 - DOWN, RIGHT, DIAG_DOWN_RIGHT x2"
	.ascii	"\000"
	.align	2
.LC17:
	.ascii	"Pattern 4,2,1,3,4 - DIAG_DOWN_RIGHT, LEFT, UP, DIAG"
	.ascii	"_DOWN_RIGHT\000"
	.align	2
.LC18:
	.ascii	"Pattern 4,3,1,2,4 - DIAG_DOWN_RIGHT, DOWN, RIGHT, D"
	.ascii	"IAG_DOWN_RIGHT\000"
	.align	2
.LC19:
	.ascii	"Pattern 2,1,3,4,2 - LEFT, UP, DIAG_DOWN_RIGHT x2\000"
	.align	2
.LC20:
	.ascii	"Pattern 2,4,3,1,2 - DIAG_DOWN_RIGHT x2, DOWN, RIGHT"
	.ascii	"\000"
	.align	2
.LC21:
	.ascii	"Pattern 1,3,4,2,1 - RIGHT, DIAG_DOWN_RIGHT x2, DOWN"
	.ascii	"\000"
	.align	2
.LC22:
	.ascii	"Pattern 1,2,4,3,1 - UP, DIAG_DOWN_RIGHT x2, LEFT\000"
	.align	2
.LC23:
	.ascii	"Pattern 0,2,4,3,0 - LEFT, DIAG_DOWN_RIGHT x2, UP\000"
	.align	2
.LC24:
	.ascii	"Pattern 0,3,4,2,0 - DOWN, DIAG_DOWN_RIGHT x2, RIGHT"
	.ascii	"\000"
	.align	2
.LC25:
	.ascii	"Pattern 2,4,3,0,2 - DIAG_DOWN_RIGHT x2, UP, LEFT\000"
	.align	2
.LC26:
	.ascii	"Pattern 2,0,3,4,2 - RIGHT, DOWN, DIAG_DOWN_RIGHT x2"
	.ascii	"\000"
	.align	2
.LC27:
	.ascii	"Pattern 4,2,0,3,4 - DIAG_DOWN_RIGHT, UP, LEFT, DIAG"
	.ascii	"_DOWN_RIGHT\000"
	.align	2
.LC28:
	.ascii	"Pattern 4,3,0,2,4 - DIAG_DOWN_RIGHT, RIGHT, DOWN, D"
	.ascii	"IAG_DOWN_RIGHT\000"
	.align	2
.LC29:
	.ascii	"Pattern 3,0,2,4,3 - UP, LEFT, DIAG_DOWN_RIGHT x2\000"
	.align	2
.LC30:
	.ascii	"Pattern 3,4,2,0,3 - DIAG_DOWN_RIGHT x2, RIGHT, DOWN"
	.ascii	"\000"
	.align	2
.LC31:
	.ascii	"Pattern 3,0,4,1,3 - RIGHT, DIAG_DOWN_LEFT x2, UP\000"
	.align	2
.LC32:
	.ascii	"Pattern 3,1,4,0,3 - DOWN, DIAG_DOWN_LEFT x2, LEFT\000"
	.align	2
.LC33:
	.ascii	"Pattern 0,4,1,3,0 - DIAG_DOWN_LEFT x2, UP, RIGHT\000"
	.align	2
.LC34:
	.ascii	"Pattern 0,3,1,4,0 - LEFT, DOWN, DIAG_DOWN_LEFT x2\000"
	.align	2
.LC35:
	.ascii	"Pattern 4,1,3,0,4 - DIAG_DOWN_LEFT, UP, RIGHT, DIAG"
	.ascii	"_DOWN_LEFT\000"
	.align	2
.LC36:
	.ascii	"Pattern 4,0,3,1,4 - DIAG_DOWN_LEFT, LEFT, DOWN, DIA"
	.ascii	"G_DOWN_LEFT\000"
	.align	2
.LC37:
	.ascii	"Pattern 1,4,0,3,1 - DIAG_DOWN_LEFT x2, LEFT, DOWN\000"
	.align	2
.LC38:
	.ascii	"Pattern 1,3,0,4,1 - UP, RIGHT, DIAG_DOWN_LEFT x2\000"
	.text
	.align	2
	.global	setupRightTriangleFromSequence
	.syntax unified
	.arm
	.type	setupRightTriangleFromSequence, %function
setupRightTriangleFromSequence:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r7, r3
	ldr	r3, [r4, #16]
	sub	sp, sp, #28
	str	r3, [sp, #4]
	ldr	r3, [r4, #12]
	str	r3, [sp]
	mov	r6, r2
	ldr	r0, .L191
	ldm	r4, {r1, r2, r3}
	ldr	r5, .L191+4
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L191+8
	str	r2, [r3]
	ldr	r3, .L191+12
	str	r2, [r3]
	ldr	r3, .L191+16
	str	r2, [r3]
	ldr	r3, [r4]
	cmp	r3, #3
	beq	.L173
	cmp	r3, #4
	bne	.L83
	ldr	r3, [r4, #4]
	cmp	r3, #2
	beq	.L174
	cmp	r3, #3
	beq	.L175
	cmp	r3, #1
	bne	.L118
	ldr	r2, [r4, #8]
	cmp	r2, #3
	beq	.L176
.L74:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L83:
	cmp	r3, #2
	bne	.L90
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L177
	cmp	r3, #4
	beq	.L178
	cmp	r3, #0
	bne	.L74
	ldr	r3, [r4, #8]
	cmp	r3, #3
	bne	.L74
	ldr	r3, [r4, #12]
	cmp	r3, #4
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #2
	bne	.L74
	ldr	r0, .L191+20
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	lr, #1
	mov	r1, #15
	mov	ip, #10
	ldr	r3, [sp, #48]
	ldr	r2, [r3]
	str	lr, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r5, [sp, #48]
	add	r2, r2, #1
	str	r2, [r5]
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [r5]
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [r5]
	ldr	r3, [sp, #12]
	add	r2, r2, #1
	str	r2, [r5]
	str	r3, [r6, r2, lsl #2]
	ldr	r2, [r5]
	str	ip, [r7, r2, lsl #2]
	ldr	r2, [r5]
	add	r2, r2, #1
	mov	r0, #7
	str	r2, [r5]
	b	.L170
.L90:
	cmp	r3, #1
	bne	.L100
	ldr	r3, [r4, #4]
	cmp	r3, #3
	beq	.L179
	cmp	r3, #2
	beq	.L103
	cmp	r3, #4
	bne	.L74
	ldr	r1, [r4, #8]
	cmp	r1, #0
	bne	.L74
	ldr	r3, [r4, #12]
	cmp	r3, #3
	bne	.L74
	ldr	r3, [r4, #16]
	cmp	r3, #1
	bne	.L74
	ldr	r0, .L191+24
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r0, #6
	mov	r2, #10
	mov	r1, r6
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r0, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	mov	r4, #2
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r6, [sp, #48]
	add	r3, r3, #1
	mov	lr, #15
	str	r3, [r6]
	str	r0, [r1, r3, lsl #2]
	ldr	r3, [r6]
	str	r2, [r7, r3, lsl #2]
	mov	r2, r1
	mov	ip, #12
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
	str	r4, [r1, r3, lsl #2]
	ldr	r3, [r6]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [r6]
	ldr	r1, [sp, #12]
	add	r3, r3, #1
	str	r3, [r6]
	str	r1, [r2, r3, lsl #2]
	ldr	r3, [r6]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
	b	.L74
.L173:
	ldr	r3, [r4, #4]
	cmp	r3, #4
	beq	.L180
	cmp	r3, #1
	beq	.L181
	cmp	r3, #0
	bne	.L74
	ldr	r1, [r4, #8]
	cmp	r1, #2
	beq	.L182
	cmp	r1, #4
	bne	.L74
	ldr	r3, [r4, #12]
	cmp	r3, #1
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #3
	bne	.L74
	ldr	r0, .L191+28
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	lr, #15
	mov	r0, #5
	b	.L172
.L181:
	ldr	r1, [r4, #8]
	cmp	r1, #2
	beq	.L183
	cmp	r1, #4
	bne	.L74
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L74
	ldr	r2, [r4, #16]
	cmp	r2, #3
	bne	.L74
	ldr	r0, .L191+32
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	lr, #15
	mov	r1, #6
	mov	r2, #10
	mov	ip, #2
	ldr	r3, [sp, #48]
	ldr	r4, [r3]
	ldr	r3, [sp, #12]
	mov	r0, #12
	str	r3, [r6, r4, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	lr, [sp, #48]
	add	r3, r3, #1
	str	r3, [lr]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [lr]
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r4, [sp, #48]
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
	b	.L74
.L175:
	ldr	r1, [r4, #8]
	cmp	r1, #1
	beq	.L184
	cmp	r1, #0
	bne	.L74
	ldr	r2, [r4, #12]
	cmp	r2, #2
	bne	.L74
	ldr	r2, [r4, #16]
	cmp	r2, #4
	bne	.L74
	ldr	r0, .L191+36
	str	r1, [sp, #16]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	ip, #7
	mov	r0, #15
	ldr	r3, [sp, #48]
	ldr	r2, [r3]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [r3]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	ldr	r3, [sp, #12]
	str	r3, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r1, [sp, #48]
	add	r2, r2, #1
	str	r2, [r1]
	ldr	r1, [sp, #16]
	str	r1, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r1, [sp, #48]
	add	r2, r2, #1
	str	r2, [r1]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [r1]
	str	r3, [r7, r2, lsl #2]
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	b	.L74
.L178:
	ldr	r3, [r4, #8]
	cmp	r3, #3
	bne	.L74
	ldr	r1, [r4, #12]
	cmp	r1, #1
	beq	.L97
	cmp	r1, #0
	bne	.L74
	ldr	r2, [r4, #16]
	cmp	r2, #2
	bne	.L74
	ldr	r0, .L191+40
	str	r1, [sp, #16]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	ip, #7
	mov	r0, #10
	mov	r4, #15
	ldr	r3, [sp, #48]
	mov	lr, #12
	ldr	r2, [r3]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [r3]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r5, [sp, #48]
	add	r2, r2, #1
	str	r2, [r5]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [r5]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [r5]
	ldr	r3, [sp, #12]
	add	r2, r2, #1
	str	r2, [r5]
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [r5]
	str	r4, [r7, r3, lsl #2]
	ldr	r3, [r5]
	ldr	r1, [sp, #16]
	add	r3, r3, #1
	str	r3, [r5]
	str	r1, [r6, r3, lsl #2]
.L168:
	ldr	r3, [r5]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	b	.L74
.L103:
	ldr	r2, [r4, #8]
	cmp	r2, #4
	bne	.L74
	ldr	r2, [r4, #12]
	cmp	r2, #3
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #1
	bne	.L74
	ldr	r0, .L191+44
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r5, #15
	mov	lr, #7
	mov	r1, #10
	mov	ip, #5
	ldr	r3, [sp, #48]
	mov	r0, #12
	ldr	r2, [r3]
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r5, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r5, [sp, #48]
	add	r2, r2, #1
	str	r2, [r5]
	str	lr, [r6, r2, lsl #2]
	ldr	r2, [r5]
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [r5]
	add	r2, r2, #1
	str	r2, [r5]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [r5]
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [r5]
	add	r2, r2, #1
	str	r2, [r5]
	ldr	r3, [sp, #12]
.L170:
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [r5]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	b	.L74
.L100:
	cmp	r3, #0
	bne	.L74
	ldr	r3, [r4, #4]
	cmp	r3, #2
	beq	.L185
	cmp	r3, #3
	beq	.L186
	cmp	r3, #4
	bne	.L74
	ldr	r3, [r4, #8]
	cmp	r3, #1
	bne	.L74
	ldr	r3, [r4, #12]
	cmp	r3, #3
	bne	.L74
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bne	.L74
	ldr	r0, .L191+48
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r0, #5
	mov	r1, #10
	ldr	r3, [sp, #48]
	mov	r4, #1
	ldr	r2, [r3]
	mov	r3, r6
	str	r0, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r6, [sp, #48]
	add	r2, r2, r4
	mov	lr, #15
	str	r2, [r6]
	str	r0, [r3, r2, lsl #2]
	ldr	r2, [r6]
	str	r1, [r7, r2, lsl #2]
	mov	r1, r3
	ldr	r2, [r6]
	add	r2, r2, r4
	str	r2, [r6]
	str	r4, [r3, r2, lsl #2]
	ldr	r2, [r6]
	str	lr, [r7, r2, lsl #2]
	ldr	r2, [r6]
	ldr	r3, [sp, #12]
	add	r2, r2, r4
	str	r2, [r6]
	mov	ip, #12
	str	r3, [r1, r2, lsl #2]
	b	.L171
.L180:
	ldr	r1, [r4, #8]
	cmp	r1, #2
	bne	.L74
	ldr	r2, [r4, #12]
	cmp	r2, #1
	beq	.L187
.L149:
	ldr	r2, [r4, #12]
	cmp	r2, #0
	bne	.L74
	ldr	r2, [r4, #16]
	cmp	r2, #3
	bne	.L74
	ldr	r0, .L191+52
	str	r1, [sp, #16]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r0, #10
	mov	r4, #1
	mov	r1, r6
	ldr	r3, [sp, #48]
	ldr	r2, [r3]
	ldr	r3, [sp, #12]
	str	r3, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	mov	lr, #15
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r6, [sp, #48]
	add	r2, r2, r4
	str	r2, [r6]
	str	r3, [r1, r2, lsl #2]
	mov	r2, r1
	mov	ip, #12
	ldr	r3, [r6]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [r6]
	add	r3, r3, r4
	str	r3, [r6]
	str	r4, [r1, r3, lsl #2]
	ldr	r3, [r6]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [r6]
	ldr	r1, [sp, #16]
	add	r3, r3, r4
	str	r3, [r6]
	str	r1, [r2, r3, lsl #2]
.L171:
	ldr	r3, [r6]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r6]
	add	r3, r3, r4
	str	r3, [r6]
	b	.L74
.L174:
	ldr	r1, [r4, #8]
	cmp	r1, #1
	beq	.L188
	cmp	r1, #0
	bne	.L74
	ldr	r2, [r4, #12]
	cmp	r2, #3
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #4
	bne	.L74
	ldr	r0, .L191+56
	str	r3, [sp, #16]
	str	r2, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	lr, #10
	mov	ip, #1
	mov	r0, #15
	ldr	r3, [sp, #48]
	ldr	r1, [r3]
	str	r4, [r6, r1, lsl #2]
	ldr	r1, [r3]
	str	lr, [r7, r1, lsl #2]
	ldr	r1, [sp, #48]
	ldr	r1, [r1]
	ldr	lr, [sp, #48]
	add	r1, r1, ip
	str	r1, [lr]
	str	ip, [r6, r1, lsl #2]
	ldr	r1, [lr]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [lr]
	ldr	r3, [sp, #16]
	add	r1, r1, #1
	str	r1, [lr]
	str	r3, [r6, r1, lsl #2]
	ldr	r3, [lr]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [lr]
	add	r3, r3, #1
	str	r3, [lr]
	str	r4, [r6, r3, lsl #2]
	ldr	r2, [sp, #12]
	ldr	r3, [lr]
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [lr]
	add	r3, r3, #1
	str	r3, [lr]
	b	.L74
.L177:
	ldr	r1, [r4, #8]
	cmp	r1, #3
	bne	.L74
	ldr	r2, [r4, #12]
	cmp	r2, #4
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #2
	bne	.L74
	ldr	r0, .L191+60
	str	r3, [sp, #16]
	str	r2, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r0, #15
	mov	lr, #10
	ldr	r3, [sp, #48]
	ldr	r1, [r3]
	str	r4, [r6, r1, lsl #2]
	mov	ip, #7
	ldr	r1, [r3]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	ldr	r3, [sp, #16]
	str	r3, [r6, r1, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #48]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r0, [sp, #48]
	add	r3, r3, #1
	str	r3, [r0]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [r0]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r0]
	add	r3, r3, #1
	str	r3, [r0]
	b	.L74
.L179:
	ldr	r1, [r4, #8]
	cmp	r1, #4
	beq	.L189
	cmp	r1, #0
	bne	.L74
	ldr	r2, [r4, #12]
	cmp	r2, #4
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #1
	bne	.L74
	ldr	r0, .L191+64
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r0, #15
	mov	r1, #5
	mov	lr, #10
	ldr	r3, [sp, #48]
	ldr	r2, [r3]
	mov	ip, #7
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r3, [sp, #12]
	ldr	r4, [sp, #48]
	add	r2, r2, #1
	str	r2, [r4]
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r2, [sp, #48]
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
	b	.L74
.L186:
	ldr	r1, [r4, #8]
	cmp	r1, #4
	beq	.L190
	cmp	r1, #1
	bne	.L74
	ldr	r3, [r4, #12]
	cmp	r3, #4
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #0
	bne	.L74
	ldr	r0, .L191+68
	mov	lr, pc
	bx	r5
	mov	lr, #2
	mov	r1, #15
	mov	r2, #6
	mov	ip, #10
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	mov	r0, #7
	str	lr, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r1, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	lr, [sp, #48]
	add	r3, r3, #1
	str	r3, [lr]
	str	r4, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r1, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r1, [sp, #48]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	ip, [sp, #48]
	add	r3, r3, #1
	str	r3, [ip]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [ip]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [ip]
	add	r3, r3, #1
	str	r3, [ip]
	b	.L74
.L185:
	ldr	r1, [r4, #8]
	cmp	r1, #4
	bne	.L74
	ldr	r3, [r4, #12]
	cmp	r3, #3
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #0
	bne	.L74
	ldr	r0, .L191+72
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	lr, #15
	mov	r0, #7
.L172:
	mov	r1, #10
	mov	ip, #12
	ldr	r3, [sp, #48]
	ldr	r2, [r3]
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	lr, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	lr, [sp, #48]
	add	r2, r2, #1
	str	r2, [lr]
	str	r0, [r6, r2, lsl #2]
	ldr	r2, [lr]
	str	r1, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r4, [sp, #48]
	add	r2, r2, #1
	str	r2, [r4]
	str	r0, [r6, r2, lsl #2]
	ldr	r2, [r4]
	str	r1, [r7, r2, lsl #2]
.L169:
	ldr	r2, [r4]
	ldr	r3, [sp, #12]
	add	r2, r2, #1
	str	r2, [r4]
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [r4]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	b	.L74
.L182:
	ldr	r2, [r4, #12]
	cmp	r2, #4
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #3
	bne	.L74
	ldr	r0, .L191+76
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r0, #15
	mov	r1, #7
	mov	ip, #10
	ldr	r3, [sp, #48]
	ldr	r2, [r3]
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [r3]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	ldr	r3, [sp, #12]
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r2, [sp, #48]
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r2]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r2]
	str	r1, [r7, r3, lsl #2]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L74
.L176:
	ldr	r1, [r4, #12]
	cmp	r1, #0
	bne	.L74
	ldr	r1, [r4, #16]
	cmp	r1, #4
	bne	.L74
	ldr	r0, .L191+80
	str	r3, [sp, #16]
	str	r2, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	ip, #5
	mov	r0, #15
	ldr	r3, [sp, #48]
	ldr	r1, [r3]
	str	ip, [r6, r1, lsl #2]
	ldr	r1, [r3]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r3]
	add	r1, r1, #1
	str	r1, [r3]
	ldr	r3, [sp, #16]
	str	r3, [r6, r1, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #48]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r0, [sp, #48]
	add	r3, r3, #1
	str	r3, [r0]
	str	ip, [r6, r3, lsl #2]
	ldr	r3, [r0]
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [r0]
	add	r3, r3, #1
	str	r3, [r0]
	b	.L74
.L188:
	ldr	r2, [r4, #12]
	cmp	r2, #3
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #4
	bne	.L74
	ldr	r0, .L191+84
	str	r1, [sp, #20]
	str	r3, [sp, #16]
	str	r2, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	lr, #10
	mov	ip, #15
	ldr	r3, [sp, #48]
	ldr	r0, [r3]
	str	r4, [r6, r0, lsl #2]
	ldr	r0, [r3]
	str	lr, [r7, r0, lsl #2]
	ldr	r0, [r3]
	add	r0, r0, #1
	str	r0, [r3]
	ldr	r3, [sp, #16]
	str	r3, [r6, r0, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r1, [sp, #48]
	add	r3, r3, #1
	str	r3, [r1]
	ldr	r1, [sp, #20]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r1, [sp, #48]
	add	r3, r3, #1
	str	r3, [r1]
	str	r4, [r6, r3, lsl #2]
	ldr	r2, [sp, #12]
	ldr	r3, [r1]
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	b	.L74
.L189:
	ldr	r3, [r4, #12]
	cmp	r3, #2
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #1
	bne	.L74
	ldr	r0, .L191+88
	str	r1, [sp, #16]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	lr, #15
	mov	r0, #10
	ldr	r3, [sp, #48]
	ldr	r2, [r3]
	str	r4, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	lr, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r1, [sp, #48]
	add	r2, r2, #1
	str	r2, [r1]
	ldr	r1, [sp, #16]
	str	r1, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r4, [sp, #48]
	add	r2, r2, #1
	str	r2, [r4]
	str	r1, [r6, r2, lsl #2]
	ldr	r2, [r4]
	mov	ip, #12
	str	r0, [r7, r2, lsl #2]
	b	.L169
.L190:
	ldr	r3, [r4, #12]
	cmp	r3, #2
	bne	.L74
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L74
	mov	r4, #2
	ldr	r0, .L191+92
	mov	lr, pc
	bx	r5
	mov	lr, #15
	mov	ip, #1
	mov	r1, #4
	mov	r2, #10
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	mov	r0, #12
	str	r4, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	lr, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	lr, [sp, #48]
	add	r3, r3, ip
	str	r3, [lr]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r5, [sp, #48]
	add	r3, r3, ip
	str	r3, [r5]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r5]
	str	r2, [r7, r3, lsl #2]
	ldr	r3, [r5]
	add	r3, r3, ip
	str	r3, [r5]
	str	ip, [r6, r3, lsl #2]
	ldr	r3, [r5]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [r5]
	add	r3, r3, ip
	str	r3, [r5]
	b	.L74
.L192:
	.align	2
.L191:
	.word	.LC14
	.word	mgba_printf
	.word	rightTrianglePatternActive
	.word	squarePatternActive
	.word	isoscelesTrianglePatternActive
	.word	.LC26
	.word	.LC37
	.word	.LC31
	.word	.LC32
	.word	.LC28
	.word	.LC25
	.word	.LC22
	.word	.LC33
	.word	.LC30
	.word	.LC27
	.word	.LC19
	.word	.LC38
	.word	.LC34
	.word	.LC23
	.word	.LC29
	.word	.LC35
	.word	.LC17
	.word	.LC21
	.word	.LC24
	.word	.LC16
	.word	.LC18
	.word	.LC15
	.word	.LC20
	.word	.LC36
.L183:
	ldr	r3, [r4, #12]
	cmp	r3, #4
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #3
	bne	.L74
	ldr	r0, .L191+96
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r0, #15
	mov	r1, #7
	mov	ip, #10
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r2, [r6, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r5, [sp, #48]
	add	r3, r3, #1
	str	r3, [r5]
	str	r4, [r6, r3, lsl #2]
	ldr	r3, [r5]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r5]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r5]
	str	r1, [r7, r3, lsl #2]
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	b	.L74
.L184:
	ldr	r1, [r4, #12]
	cmp	r1, #2
	bne	.L74
	ldr	r1, [r4, #16]
	cmp	r1, #4
	bne	.L74
	ldr	r0, .L191+100
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	ip, #7
	mov	r0, #15
	ldr	r3, [sp, #48]
	ldr	r1, [r3]
	ldr	r2, [sp, #48]
	str	ip, [r6, r1, lsl #2]
	ldr	r1, [r2]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r2]
	add	r1, r1, #1
	str	r1, [r2]
	mov	r2, #0
	str	r2, [r6, r1, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r3, [sp, #12]
	ldr	r1, [sp, #48]
	add	r2, r2, #1
	str	r2, [r1]
	str	r3, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r0, [sp, #48]
	add	r2, r2, #1
	str	r2, [r0]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [r0]
	str	r3, [r7, r2, lsl #2]
	ldr	r3, [r0]
	add	r3, r3, #1
	str	r3, [r0]
	b	.L74
.L187:
	ldr	r0, [r4, #16]
	cmp	r0, #3
	bne	.L149
	ldr	r0, .L191+104
	str	r1, [sp, #20]
	str	r3, [sp, #16]
	str	r2, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	ip, #10
	mov	r4, #15
	ldr	r3, [sp, #48]
	ldr	r0, [r3]
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #48]
	str	r3, [r6, r0, lsl #2]
	ldr	r0, [r1]
	str	ip, [r7, r0, lsl #2]
	ldr	r0, [sp, #48]
	ldr	r0, [r0]
	ldr	r5, [sp, #48]
	add	r0, r0, #1
	str	r0, [r5]
	str	r3, [r6, r0, lsl #2]
	ldr	r3, [r5]
	str	ip, [r7, r3, lsl #2]
	ldr	r3, [r5]
	ldr	r1, [sp, #20]
	add	r3, r3, #1
	str	r3, [r5]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r5]
	str	r4, [r7, r3, lsl #2]
	ldr	r3, [r5]
	ldr	r2, [sp, #12]
	add	r3, r3, #1
	str	r3, [r5]
	mov	lr, #12
	str	r2, [r6, r3, lsl #2]
	b	.L168
.L97:
	ldr	r1, [r4, #16]
	cmp	r1, #2
	bne	.L74
	ldr	r0, .L191+108
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	ip, #7
	mov	r0, #10
	ldr	r3, [sp, #48]
	ldr	r1, [r3]
	ldr	r2, [sp, #48]
	str	ip, [r6, r1, lsl #2]
	ldr	r1, [r2]
	mov	r2, #0
	mov	r4, #15
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [sp, #48]
	ldr	r1, [r1]
	ldr	r5, [sp, #48]
	add	r1, r1, #1
	str	r1, [r5]
	str	ip, [r6, r1, lsl #2]
	ldr	r1, [r5]
	str	r0, [r7, r1, lsl #2]
	ldr	r1, [r5]
	add	r1, r1, #1
	str	r1, [r5]
	str	r2, [r6, r1, lsl #2]
	ldr	r2, [r5]
	str	r4, [r7, r2, lsl #2]
	ldr	r2, [r5]
	ldr	r3, [sp, #12]
	add	r2, r2, #1
	str	r2, [r5]
	mov	lr, #12
	str	r3, [r6, r2, lsl #2]
	b	.L168
.L118:
	cmp	r3, #0
	bne	.L74
	ldr	r2, [r4, #8]
	cmp	r2, #3
	bne	.L74
	ldr	r2, [r4, #12]
	cmp	r2, #1
	bne	.L74
	ldr	r4, [r4, #16]
	cmp	r4, #4
	bne	.L74
	ldr	r0, .L191+112
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r1, #6
	mov	lr, #10
	mov	ip, #2
	mov	r0, #15
	ldr	r3, [sp, #48]
	ldr	r2, [r3]
	str	r1, [r6, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	str	lr, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	lr, [sp, #48]
	add	r2, r2, #1
	str	r2, [lr]
	str	ip, [r6, r2, lsl #2]
	ldr	r2, [lr]
	str	r0, [r7, r2, lsl #2]
	ldr	r2, [sp, #48]
	ldr	r2, [r2]
	ldr	r3, [sp, #12]
	ldr	ip, [sp, #48]
	add	r2, r2, #1
	str	r2, [ip]
	str	r3, [r6, r2, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	str	r0, [r7, r3, lsl #2]
	ldr	r3, [sp, #48]
	ldr	r3, [r3]
	ldr	r2, [sp, #48]
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [r6, r3, lsl #2]
	ldr	r3, [r2]
	str	r4, [r7, r3, lsl #2]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L74
	.size	setupRightTriangleFromSequence, .-setupRightTriangleFromSequence
	.section	.rodata.str1.4
	.align	2
.LC39:
	.ascii	"Level 1: Isosceles pattern %d completed\000"
	.text
	.align	2
	.global	setupIsoscelesTriangleMovement
	.syntax unified
	.arm
	.type	setupIsoscelesTriangleMovement, %function
setupIsoscelesTriangleMovement:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, .L202
	sub	sp, sp, #8
	mov	r5, r3
	str	r1, [ip]
	ldr	lr, .L202+4
	ldr	ip, .L202+8
	ldr	r3, .L202+12
	str	r1, [lr]
	str	r1, [ip]
	str	r1, [r3, #28]
	ldr	ip, [r0]
	cmp	ip, #1
	mov	r4, r2
	beq	.L199
	cmp	ip, #4
	beq	.L200
	cmp	ip, #0
	bne	.L193
	ldr	r2, [r0, #4]
	cmp	r2, #4
	beq	.L201
.L193:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L200:
	ldr	r2, [r0, #4]
	cmp	r2, #2
	bne	.L193
	ldr	r1, [r0, #8]
	cmp	r1, #1
	bne	.L193
	ldr	r0, [r0, #12]
	cmp	r0, #4
	mov	r7, r0
	bne	.L193
	ldr	r3, .L202+16
	ldr	r0, .L202+20
	stm	sp, {r1, r2}
	mov	r6, r3
	mov	lr, pc
	bx	r3
	mov	r0, #10
	ldr	r3, [sp, #32]
	ldr	r2, [r3]
	str	r7, [r4, r2, lsl #2]
	ldr	r2, [sp, #32]
	ldr	r2, [r2]
	str	r0, [r5, r2, lsl #2]
	ldr	r2, [sp, #32]
	ldr	r0, [r2]
	add	r0, r0, #1
	str	r0, [r2]
	ldr	r2, [sp, #4]
	mov	r3, r4
	str	r2, [r4, r0, lsl #2]
	mov	r4, #15
	mov	lr, #6
	mov	ip, #7
	ldr	r0, [sp, #32]
	ldr	r0, [r0]
	str	r4, [r5, r0, lsl #2]
	ldr	r0, [sp, #32]
	ldr	r0, [r0]
	ldr	r4, [sp, #32]
	add	r0, r0, #1
	str	r0, [r4]
	str	lr, [r3, r0, lsl #2]
	ldr	r0, [r4]
	str	ip, [r5, r0, lsl #2]
	ldr	r0, [r4]
	ldr	r1, [sp]
	ldr	r3, .L202+12
	add	r0, r0, #1
	b	.L196
.L199:
	ldr	r2, [r0, #4]
	cmp	r2, #4
	mov	r7, r2
	bne	.L193
	ldr	r2, [r0, #8]
	cmp	r2, #2
	mov	r8, r2
	bne	.L193
	ldr	r2, [r0, #12]
	cmp	r2, #1
	bne	.L193
	ldr	r3, .L202+16
	ldr	r0, .L202+24
	mov	r6, r3
	str	r2, [sp]
	mov	lr, pc
	bx	r3
	mov	r0, #6
	mov	lr, #10
	ldr	r3, [sp, #32]
	ldr	r2, [r3]
	mov	r3, r4
	mov	ip, #12
	mov	r1, #0
	str	r0, [r4, r2, lsl #2]
	ldr	r2, [sp, #32]
	ldr	r0, [r2]
	str	lr, [r5, r0, lsl #2]
	ldr	r0, [sp, #32]
	ldr	r0, [r0]
	ldr	r4, [sp, #32]
	add	r0, r0, #1
	str	r0, [r4]
	str	r7, [r3, r0, lsl #2]
	ldr	r0, [sp, #32]
	ldr	r0, [r0]
	str	lr, [r5, r0, lsl #2]
	ldr	r0, [sp, #32]
	ldr	r0, [r0]
	ldr	lr, [sp, #32]
	add	r0, r0, #1
	str	r0, [lr]
	str	r8, [r3, r0, lsl #2]
	ldr	r3, [sp, #32]
	ldr	r0, [r3]
	str	ip, [r5, r0, lsl #2]
	ldr	r0, [r3]
	ldr	r2, [sp]
	ldr	r3, .L202+12
	add	r0, r0, #1
.L196:
	mov	lr, #1
	ldr	ip, [sp, #32]
	str	r0, [ip]
	add	ip, r3, r1, lsl #2
	ldr	r0, .L202+28
	mov	r1, r2
	str	r2, [r3, #28]
	str	lr, [ip, #360]
	mov	lr, pc
	bx	r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L201:
	ldr	r2, [r0, #8]
	cmp	r2, #3
	bne	.L193
	ldr	r1, [r0, #12]
	cmp	r1, #0
	bne	.L193
	ldr	r3, .L202+16
	ldr	r0, .L202+20
	mov	r6, r3
	str	r2, [sp]
	mov	lr, pc
	bx	r3
	mov	r0, #5
	mov	ip, #10
	ldr	r3, [sp, #32]
	ldr	r2, [r3]
	str	r0, [r4, r2, lsl #2]
	ldr	r2, [sp, #32]
	ldr	r0, [r2]
	str	ip, [r5, r0, lsl #2]
	ldr	r0, [r2]
	add	r0, r0, #1
	str	r0, [r2]
	mov	r2, #7
	mov	lr, #12
	str	r2, [r4, r0, lsl #2]
	ldr	r2, [sp, #32]
	ldr	r0, [r2]
	str	ip, [r5, r0, lsl #2]
	ldr	r0, [r2]
	add	r0, r0, #1
	str	r0, [r2]
	ldr	r2, [sp]
	ldr	r3, [sp, #32]
	str	r2, [r4, r0, lsl #2]
	ldr	r0, [r3]
	str	lr, [r5, r0, lsl #2]
	ldr	r0, [r3]
	mov	r1, #2
	ldr	r3, .L202+12
	add	r0, r0, #1
	b	.L196
.L203:
	.align	2
.L202:
	.word	isoscelesTrianglePatternActive
	.word	squarePatternActive
	.word	rightTrianglePatternActive
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC16
	.word	.LC15
	.word	.LC39
	.size	setupIsoscelesTriangleMovement, .-setupIsoscelesTriangleMovement
	.section	.rodata.str1.4
	.align	2
.LC40:
	.ascii	"UNKNOWN\000"
	.align	2
.LC41:
	.ascii	"Setting up pattern movement for type: %d\000"
	.align	2
.LC42:
	.ascii	"Complete button sequence:\000"
	.align	2
.LC43:
	.ascii	"Final movement sequence length: %d\000"
	.align	2
.LC44:
	.ascii	"  Button %d: %d\000"
	.align	2
.LC45:
	.ascii	"=== MOVEMENT SETUP COMPLETE ===\000"
	.align	2
.LC46:
	.ascii	"Movement sequence length: %d\000"
	.align	2
.LC47:
	.ascii	"Movement %d: %s for %d frames\000"
	.align	2
.LC48:
	.ascii	"Step %d: dir=%d, dur=%d\000"
	.text
	.align	2
	.global	setupPatternMovement
	.syntax unified
	.arm
	.type	setupPatternMovement, %function
setupPatternMovement:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r0
	mov	r7, r2
	mov	r10, r1
	sub	sp, sp, #28
	mov	r1, r9
	ldr	r0, .L225
	ldr	r4, .L225+4
	str	r3, [sp, #12]
	ldr	r8, [sp, #68]
	mov	lr, pc
	bx	r4
	ldr	r0, .L225+8
	mov	lr, pc
	bx	r4
	cmp	r7, #0
	movgt	r6, #0
	subgt	fp, r10, #4
	ble	.L211
.L210:
	mov	r1, r6
	ldr	r0, .L225+12
	ldr	r2, [fp, #4]!
	add	r6, r6, #1
	mov	lr, pc
	bx	r4
	cmp	r7, r6
	bne	.L210
.L211:
	mov	r1, #0
	cmp	r9, #1
	str	r1, [sp, #20]
	beq	.L206
	cmp	r9, #2
	beq	.L207
	cmp	r9, r1
	bne	.L224
	add	r3, sp, #20
	str	r3, [sp]
	mov	r1, r7
	mov	r0, r10
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #12]
	bl	setupSquareFromSequence
	ldr	r5, [sp, #20]
.L212:
	mov	r1, r5
	str	r5, [r8]
	ldr	r0, .L225+16
	mov	lr, pc
	bx	r4
	cmp	r5, #0
	ble	.L209
	mov	fp, #0
	ldr	r3, [sp, #12]
	sub	r7, r3, #4
	ldr	r3, [sp, #64]
	ldr	r10, .L225+20
	ldr	r9, .L225+24
	sub	r6, r3, #4
.L217:
	ldr	r3, [r7, #4]!
	cmp	r3, #7
	add	r3, r9, r3, lsl #2
	ldrls	r2, [r3, #40]
	movhi	r2, r10
	mov	r1, fp
	ldr	r0, .L225+28
	ldr	r3, [r6, #4]!
	add	fp, fp, #1
	mov	lr, pc
	bx	r4
	cmp	fp, r5
	bne	.L217
.L209:
	ldr	r0, .L225+32
	mov	lr, pc
	bx	r4
	ldr	r0, .L225+36
	ldr	r1, [r8]
	mov	lr, pc
	bx	r4
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L204
	mov	r6, #0
	ldr	r3, [sp, #12]
	sub	r5, r3, #4
	ldr	r3, [sp, #64]
	sub	r7, r3, #4
.L218:
	mov	r1, r6
	ldr	r3, [r7, #4]!
	ldr	r0, .L225+40
	ldr	r2, [r5, #4]!
	mov	lr, pc
	bx	r4
	ldr	r3, [r8]
	add	r6, r6, #1
	cmp	r3, r6
	bgt	.L218
.L204:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L224:
	str	r1, [r8]
	ldr	r0, .L225+16
	mov	lr, pc
	bx	r4
	b	.L209
.L207:
	add	r3, sp, #20
	str	r3, [sp]
	mov	r1, r7
	mov	r0, r10
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #12]
	bl	setupIsoscelesTriangleMovement
	ldr	r5, [sp, #20]
	b	.L212
.L206:
	add	r3, sp, #20
	str	r3, [sp]
	mov	r1, r7
	mov	r0, r10
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #12]
	bl	setupRightTriangleFromSequence
	ldr	r5, [sp, #20]
	b	.L212
.L226:
	.align	2
.L225:
	.word	.LC41
	.word	mgba_printf
	.word	.LC42
	.word	.LC44
	.word	.LC43
	.word	.LC40
	.word	.LANCHOR1
	.word	.LC47
	.word	.LC45
	.word	.LC46
	.word	.LC48
	.size	setupPatternMovement, .-setupPatternMovement
	.section	.rodata.str1.4
	.align	2
.LC49:
	.ascii	"startAutomaticMovement: Starting with length=%d\000"
	.align	2
.LC50:
	.ascii	"startAutomaticMovement: Flags - active=%d, finished"
	.ascii	"=%d, step=%d\000"
	.align	2
.LC51:
	.ascii	"Step %d: Timer set to %d (from movementDurations)\000"
	.align	2
.LC52:
	.ascii	"Automatic movement started with %d steps\000"
	.text
	.align	2
	.global	startAutomaticMovement
	.syntax unified
	.arm
	.type	startAutomaticMovement, %function
startAutomaticMovement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, .L235
	ldr	r7, .L235+4
	mov	r5, r1
	mov	lr, pc
	bx	r7
	mov	r3, #0
	mov	r2, r3
	ldr	r1, .L235+8
	add	ip, r1, #96
	add	r0, r1, #192
.L229:
	cmp	r5, r3
	strle	r2, [r1, r3, lsl #2]
	strle	r2, [ip, r3, lsl #2]
	strle	r2, [r0, r3, lsl #2]
	add	r3, r3, #1
	cmp	r3, #24
	bne	.L229
	mov	r4, #0
	mov	r2, #512
	mov	r1, #1
	ldr	r3, .L235+12
	ldr	r6, .L235+16
	strh	r2, [r3]	@ movhi
	ldr	r0, .L235+20
	mov	r3, r4
	mov	r2, r4
	str	r1, [r6, #660]
	str	r4, [r6, #664]
	str	r4, [r6, #668]
	str	r4, [r6, #32]
	str	r4, [r6, #36]
	mov	lr, pc
	bx	r7
	ldr	r3, .L235+24
	mov	lr, pc
	bx	r3
	cmp	r5, r4
	ble	.L230
	add	r8, r6, #464
	add	r6, r6, #560
.L231:
	ldr	r2, [r8, #4]!
	mov	r1, r4
	ldr	r0, .L235+28
	str	r2, [r6, #4]!
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r5, r4
	bne	.L231
.L230:
	mov	r1, r5
	ldr	r0, .L235+32
	mov	lr, pc
	bx	r7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L236:
	.align	2
.L235:
	.word	.LC49
	.word	mgba_printf
	.word	.LANCHOR0+372
	.word	shadowOAM+480
	.word	.LANCHOR0
	.word	.LC50
	.word	playWhooshSound
	.word	.LC51
	.word	.LC52
	.size	startAutomaticMovement, .-startAutomaticMovement
	.section	.rodata.str1.4
	.align	2
.LC53:
	.ascii	"updateAutoMove: NOT ACTIVE, returning\000"
	.align	2
.LC54:
	.ascii	"updateAutoMove: ENTER - step=%d\000"
	.align	2
.LC55:
	.ascii	"updateAutoMove: totalSteps=%d\000"
	.align	2
.LC56:
	.ascii	"updateAutoMove: Timer expired for step %d\000"
	.align	2
.LC57:
	.ascii	"updateAutoMove: Incremented to step %d\000"
	.align	2
.LC58:
	.ascii	"updateAutoMove: SETTING SPRITE TIMER = 300 frames\000"
	.align	2
.LC59:
	.ascii	"updateAutoMove: patternSpriteTimer=%d, showPatternS"
	.ascii	"prite=%d\000"
	.align	2
.LC60:
	.ascii	"updateAutoMove: Not isosceles pattern - hiding spri"
	.ascii	"te\000"
	.align	2
.LC61:
	.ascii	"updateAutoMove: Starting timer for step %d\000"
	.align	2
.LC62:
	.ascii	"Movement step %d: %s (timer: %d)\000"
	.text
	.align	2
	.global	updateAutomaticMovement
	.syntax unified
	.arm
	.type	updateAutomaticMovement, %function
updateAutomaticMovement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L274
	ldr	r3, [r5, #660]
	cmp	r3, #0
	beq	.L271
	mov	r6, r0
	ldr	r1, [r5, #664]
	ldr	r0, .L274+4
	ldr	r7, .L274+8
	mov	lr, pc
	bx	r7
	mov	r4, #0
	add	r3, r5, #464
	b	.L241
.L272:
	add	r4, r4, #1
	cmp	r4, #24
	beq	.L240
.L241:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	bgt	.L272
.L240:
	mov	r1, r4
	ldr	r0, .L274+12
	mov	lr, pc
	bx	r7
	ldr	r1, [r5, #664]
	add	r3, r5, r1, lsl #2
	ldr	r3, [r3, #564]
	cmp	r3, #0
	lsl	r2, r1, #2
	ble	.L273
.L242:
	add	r2, r5, r2
	ldr	r2, [r2, #372]
	cmp	r2, #11
	ldrls	r0, .L274+16
	addls	r2, r0, r2, lsl #2
	ldrls	r2, [r2, #72]
	ldrhi	r2, .L274+20
	ldr	r0, .L274+24
	mov	lr, pc
	bx	r7
	ldr	r2, [r5, #664]
	add	r3, r5, r2, lsl #2
	ldr	r1, .L274+28
	ldr	r3, [r3, #372]
	cmp	r3, #11
	bhi	.L250
	ldrb	r3, [r1, r3]
	add	pc, pc, r3, lsl #2
.Lrtx252:
	nop
	.section	.rodata
.L252:
	.byte	(.L263-.Lrtx252-4)/4
	.byte	(.L262-.Lrtx252-4)/4
	.byte	(.L261-.Lrtx252-4)/4
	.byte	(.L260-.Lrtx252-4)/4
	.byte	(.L259-.Lrtx252-4)/4
	.byte	(.L258-.Lrtx252-4)/4
	.byte	(.L257-.Lrtx252-4)/4
	.byte	(.L256-.Lrtx252-4)/4
	.byte	(.L255-.Lrtx252-4)/4
	.byte	(.L254-.Lrtx252-4)/4
	.byte	(.L253-.Lrtx252-4)/4
	.byte	(.L251-.Lrtx252-4)/4
	.text
	.p2align 2
.L261:
	mvn	r1, #3
	mov	r3, #0
	mov	r0, #2
.L268:
	str	r3, [r6, #20]
	mov	r3, #1
	str	r0, [r6, #36]
	str	r1, [r6, #16]
	str	r3, [r6, #44]
.L250:
	add	r5, r5, r2, lsl #2
	ldr	r3, [r5, #564]
	sub	r3, r3, #1
	str	r3, [r5, #564]
.L237:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L271:
	ldr	r0, .L274+32
	ldr	r3, .L274+8
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L273:
	ldr	r0, .L274+36
	mov	lr, pc
	bx	r7
	ldr	r1, [r5, #664]
	ldr	r0, .L274+40
	add	r1, r1, #1
	str	r1, [r5, #664]
	mov	lr, pc
	bx	r7
	ldr	r1, [r5, #664]
	cmp	r1, r4
	blt	.L243
	mov	r3, #0
	mov	r4, #1
	ldr	r2, [r5, #28]
	cmp	r2, r3
	str	r3, [r6, #16]
	str	r3, [r6, #20]
	str	r3, [r6, #44]
	str	r3, [r6, #40]
	str	r3, [r5, #660]
	str	r4, [r5, #668]
	ble	.L244
	mov	r6, #10
	ldr	r3, .L274+44
	ldr	r3, [r3]
	cmp	r3, #0
	str	r4, [r5, #32]
	str	r6, [r5, #36]
	ldreq	r4, .L274+48
	beq	.L246
	ldr	r0, .L274+52
	mov	lr, pc
	bx	r7
	mov	r2, r4
	mov	r1, r6
	ldr	r0, .L274+56
	str	r6, [r5, #36]
	str	r4, [r5, #32]
	mov	lr, pc
	bx	r7
	b	.L247
.L244:
	mov	r2, #512
	ldr	r4, .L274+48
	str	r3, [r5, #32]
	str	r3, [r5, #36]
	strh	r2, [r4]	@ movhi
.L246:
	ldr	r0, .L274+60
	mov	lr, pc
	bx	r7
	mov	r3, #0
	mov	r2, #512
	str	r3, [r5, #32]
	str	r3, [r5, #36]
	strh	r2, [r4]	@ movhi
.L247:
	mov	r3, #0
	ldr	r1, .L274+64
	ldr	r2, .L274+68
	str	r3, [r1]
	str	r3, [r2]
	b	.L237
.L243:
	ldr	r0, .L274+72
	mov	lr, pc
	bx	r7
	ldr	r1, [r5, #664]
	add	r2, r5, r1, lsl #2
	ldr	r3, [r2, #468]
	cmp	r3, #0
	str	r3, [r2, #564]
	lsl	r2, r1, #2
	bgt	.L242
	add	r1, r1, #1
	cmp	r1, r4
	str	r1, [r5, #664]
	bge	.L248
	add	r0, r5, r1, lsl #2
	ldr	r3, [r0, #468]
	lsl	r2, r1, #2
	str	r3, [r0, #564]
	b	.L242
.L248:
	mov	r3, #0
	mov	r2, #1
	str	r3, [r6, #16]
	str	r3, [r6, #20]
	str	r3, [r5, #660]
	str	r2, [r5, #668]
	b	.L237
.L251:
	mov	r3, #0
	mov	r1, #1
	str	r3, [r6, #16]
	str	r3, [r6, #20]
	str	r3, [r6, #36]
	str	r1, [r6, #44]
	str	r3, [r6, #40]
	b	.L250
.L263:
	mov	r3, #0
	mov	r1, #4
	mov	r0, #2
	str	r3, [r6, #16]
	str	r0, [r6, #44]
	str	r1, [r6, #20]
	str	r3, [r6, #36]
	b	.L250
.L262:
	mov	r3, #1
	mov	r1, #0
	mvn	r0, #3
	str	r1, [r6, #16]
	str	r0, [r6, #20]
	str	r3, [r6, #36]
	str	r3, [r6, #44]
	b	.L250
.L260:
	mov	r1, #4
	mov	r3, #0
	mov	r0, #3
	b	.L268
.L259:
	mov	r3, #3
	mov	r1, #4
.L269:
	mov	r0, #1
	str	r3, [r6, #16]
	str	r0, [r6, #44]
	str	r3, [r6, #20]
	str	r1, [r6, #36]
	b	.L250
.L258:
	mvn	r1, #2
	mov	r3, #3
	mov	r0, #5
	b	.L268
.L257:
	mov	r1, #3
	mvn	r3, #2
	mov	r0, #6
	b	.L268
.L256:
	mvn	r3, #2
	mov	r1, #7
	b	.L269
.L255:
	mov	r3, #0
	mov	r1, #2
.L270:
	mov	r0, #1
	str	r3, [r6, #16]
	str	r0, [r6, #44]
	str	r3, [r6, #20]
	str	r1, [r6, #36]
	str	r3, [r6, #40]
	b	.L250
.L254:
	mov	r3, #0
	mov	r1, #3
	b	.L270
.L253:
	mov	r3, #0
	mov	r1, #1
	str	r3, [r6, #16]
	str	r3, [r6, #20]
	str	r1, [r6, #36]
	str	r1, [r6, #44]
	str	r3, [r6, #40]
	b	.L250
.L275:
	.align	2
.L274:
	.word	.LANCHOR0
	.word	.LC54
	.word	mgba_printf
	.word	.LC55
	.word	.LANCHOR1
	.word	.LC40
	.word	.LC62
	.word	.L252
	.word	.LC53
	.word	.LC56
	.word	.LC57
	.word	isoscelesTrianglePatternActive
	.word	shadowOAM+480
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	squarePatternActive
	.word	rightTrianglePatternActive
	.word	.LC61
	.size	updateAutomaticMovement, .-updateAutomaticMovement
	.section	.rodata.str1.4
	.align	2
.LC64:
	.ascii	"Button sequence reset\000"
	.text
	.align	2
	.global	resetButtonSequence
	.syntax unified
	.arm
	.type	resetButtonSequence, %function
resetButtonSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mvn	r1, #0
	mvn	r2, #0
	mov	lr, #0
	mvn	ip, #0
	ldr	r3, .L278
	ldr	r0, .L278+4
	stm	r3, {r1-r2}
	str	lr, [r0, #672]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #16]
	ldr	r0, .L278+8
	ldr	r3, .L278+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L279:
	.align	2
.L278:
	.word	.LANCHOR2
	.word	.LANCHOR0
	.word	.LC64
	.word	mgba_printf
	.size	resetButtonSequence, .-resetButtonSequence
	.align	2
	.global	resetCollisionSystem
	.syntax unified
	.arm
	.type	resetCollisionSystem, %function
resetCollisionSystem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	mov	r7, #512
	ldr	r4, .L284
	str	r2, [r4, #688]
	str	r3, [r4, #692]
	str	r2, [r4, #696]
	str	r3, [r4, #700]
	ldr	r3, .L284+4
	ldr	r1, .L284+8
	str	r5, [r3]
	ldr	r6, .L284+12
	ldr	r3, .L284+16
	ldr	r8, .L284+20
	mov	r2, #96
	str	r5, [r1]
	add	r0, r4, #372
	mov	r1, r5
	str	r5, [r3]
	str	r5, [r4, #676]
	str	r5, [r4, #680]
	str	r5, [r4, #684]
	str	r5, [r4, #28]
	str	r5, [r4, #32]
	str	r5, [r4, #36]
	str	r5, [r4, #704]
	str	r5, [r4, #660]
	str	r5, [r4, #664]
	str	r5, [r4, #668]
	strh	r7, [r6]	@ movhi
	mov	lr, pc
	bx	r8
	mov	r2, #96
	mov	r1, r5
	add	r0, r4, #468
	mov	lr, pc
	bx	r8
	mov	r2, #96
	mov	r1, r5
	add	r0, r4, #564
	mov	lr, pc
	bx	r8
	mvn	r2, #0
	ldr	r3, .L284+24
	str	r5, [r4, #320]
	str	r5, [r4, #340]
	str	r5, [r4, #344]
	str	r5, [r4, #348]
	str	r5, [r4, #352]
	str	r5, [r4, #356]
	str	r5, [r4, #324]
	str	r5, [r4, #328]
	str	r5, [r4, #332]
	str	r5, [r4, #336]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	add	r0, r4, #320
	add	r3, r4, #40
	sub	r1, r6, #480
.L281:
	ldrb	r2, [r3, #52]	@ zero_extendqisi2
	add	r3, r3, #56
	add	r2, r1, r2, lsl #3
	cmp	r3, r0
	strh	r7, [r2, #40]	@ movhi
	bne	.L281
	mov	r2, #0
	ldr	r3, .L284+28
	str	r2, [r4, #672]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	b	initButtons
.L285:
	.align	2
.L284:
	.word	.LANCHOR0
	.word	rightTrianglePatternActive
	.word	squarePatternActive
	.word	shadowOAM+480
	.word	isoscelesTrianglePatternActive
	.word	memset
	.word	.LANCHOR2
	.word	resetButtonEffects
	.size	resetCollisionSystem, .-resetCollisionSystem
	.section	.rodata.str1.4
	.align	2
.LC65:
	.ascii	"Added button %d to sequence. Length: %d\000"
	.text
	.align	2
	.global	addButtonToSequence
	.syntax unified
	.arm
	.type	addButtonToSequence, %function
addButtonToSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L291
	ldr	r2, [r4, #672]
	cmp	r2, #4
	mov	r5, r0
	sub	sp, sp, #8
	bgt	.L289
	ldr	r3, .L291+4
	ldr	r6, .L291+8
.L287:
	str	r5, [r3, r2, lsl #2]
	mov	r1, r5
	add	r2, r2, #1
	ldr	r0, .L291+12
	str	r2, [r4, #672]
	mov	lr, pc
	bx	r6
	mov	r2, #1
	mov	r3, #30
	add	r4, r4, r5, lsl #2
	str	r2, [r4, #320]
	str	r3, [r4, #340]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L289:
	mvn	r2, #0
	ldr	r3, .L291+4
	mvn	r0, #0
	mvn	r1, #0
	str	r2, [r3, #16]
	mov	r2, #0
	stm	r3, {r0-r1}
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	ldr	r6, .L291+8
	ldr	r0, .L291+16
	str	r3, [sp, #4]
	str	r2, [r4, #672]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #672]
	ldr	r3, [sp, #4]
	b	.L287
.L292:
	.align	2
.L291:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	mgba_printf
	.word	.LC65
	.word	.LC64
	.size	addButtonToSequence, .-addButtonToSequence
	.section	.rodata.str1.4
	.align	2
.LC66:
	.ascii	"Collision with button %d\000"
	.align	2
.LC67:
	.ascii	"4-button loop sequence but no isosceles pattern mat"
	.ascii	"ched - ERROR!\000"
	.align	2
.LC68:
	.ascii	"Square pattern detected with %d steps\000"
	.align	2
.LC69:
	.ascii	"Right Triangle pattern detected with %d steps\000"
	.align	2
.LC70:
	.ascii	"5-button loop sequence but no pattern matched - ERR"
	.ascii	"OR!\000"
	.align	2
.LC71:
	.ascii	"No pattern detected for 5-button sequence. Resettin"
	.ascii	"g.\000"
	.text
	.align	2
	.global	checkButtonPatterns
	.syntax unified
	.arm
	.type	checkButtonPatterns, %function
checkButtonPatterns:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L324
	ldr	r1, [r4, #660]
	cmp	r1, #0
	sub	sp, sp, #28
	bne	.L307
	mov	r3, r0
	ldr	lr, [r0, #8]
	ldr	r2, .L324+4
	ldr	r0, [r0, #12]
	mov	r5, r3
	add	r3, r0, #32
	mov	r0, r2
	add	lr, lr, #32
	add	ip, r2, #20
.L306:
	ldr	r2, [r0]
	sub	r2, lr, r2
	add	r2, r2, #7
	cmp	r2, #46
	add	r0, r0, #4
	bhi	.L295
	ldr	r2, [ip]
	sub	r2, r3, r2
	add	r2, r2, #7
	cmp	r2, #46
	bls	.L317
.L295:
	add	r1, r1, #1
	cmp	r1, #5
	add	ip, ip, #4
	bne	.L306
.L307:
	mov	r0, #0
.L293:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L317:
	ldr	r2, [r4, #672]
	cmp	r2, #0
	mov	r3, r5
	beq	.L296
	ldr	r0, .L324+8
	sub	r2, r2, #1
	ldr	r2, [r0, r2, lsl #2]
	cmp	r2, r1
	beq	.L307
.L296:
	ldr	r0, .L324+12
	mov	r8, r3
	ldr	r3, .L324+16
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r3
	ldr	r0, [sp, #12]
	bl	addButtonToSequence
	mov	r3, #0
	ldr	r2, .L324+20
	str	r3, [r2]
	ldr	r2, .L324+24
	str	r3, [r2]
	ldr	r2, .L324+28
	str	r3, [r2]
	ldr	r2, [r4, #672]
	cmp	r2, #4
	beq	.L318
.L297:
	cmp	r2, #5
	bne	.L307
	mov	r6, #0
	ldr	r3, .L324+32
	add	r1, sp, #20
	str	r3, [sp]
	str	r1, [sp, #4]
	ldr	r1, .L324+8
	sub	r3, r3, #96
	mov	r0, r6
	mov	r5, r1
	ldr	r7, [r1]
	ldr	r9, [r1, #16]
	str	r6, [sp, #20]
	bl	setupPatternMovement
	ldr	r3, [sp, #20]
	cmp	r3, r6
	bgt	.L319
	mov	r2, #0
	add	r3, sp, #20
	str	r3, [sp, #4]
	ldr	r3, .L324+32
	str	r3, [sp]
	str	r2, [sp, #20]
	sub	r3, r3, #96
	mov	r0, #1
	ldr	r1, .L324+8
	ldr	r2, [r4, #672]
	bl	setupPatternMovement
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bgt	.L320
	cmp	r7, r9
	bne	.L304
	ldr	r3, .L324+20
	ldr	r2, .L324+24
	ldr	r3, [r3]
	ldr	r2, [r2]
	orrs	r3, r3, r2
	beq	.L321
.L304:
	ldr	r0, .L324+36
	ldr	r5, .L324+16
	mov	lr, pc
	bx	r5
	mvn	r2, #0
	mvn	r3, #0
	ldr	r0, .L324+8
	mvn	r1, #0
	stm	r0, {r2-r3}
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	mov	r3, #0
	str	r1, [r0, #16]
	ldr	r0, .L324+40
	str	r3, [r4, #672]
	mov	lr, pc
	bx	r5
	b	.L307
.L318:
	str	r3, [sp, #20]
	ldr	r3, .L324+32
	add	r1, sp, #20
	str	r3, [sp]
	str	r1, [sp, #4]
	ldr	r1, .L324+8
	sub	r3, r3, #96
	mov	r0, #2
	ldr	r5, [r1]
	ldr	r6, [r1, #12]
	bl	setupPatternMovement
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bgt	.L322
	moveq	r3, #1
	movne	r3, #0
	cmp	r5, r6
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L323
.L300:
	ldr	r2, [r4, #672]
	b	.L297
.L319:
	mov	r1, r3
	ldr	r0, .L324+44
	ldr	r7, .L324+16
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r7
	mov	r2, #1
	ldr	r3, .L324+20
	ldr	r1, .L324+48
	str	r2, [r3]
	str	r2, [r1]
	ldr	r2, .L324+52
	mov	lr, pc
	bx	r2
	ldr	r2, .L324+56
	mov	r0, r5
	ldr	r1, [r4, #672]
	mov	lr, pc
	bx	r2
	mov	r0, r8
	ldr	r1, [sp, #12]
	bl	startAutomaticMovement
	mvn	r2, #0
	mvn	r3, #0
	mvn	r1, #0
	ldr	r0, .L324+40
	stm	r5, {r2-r3}
	str	r2, [r5, #8]
	str	r3, [r5, #12]
	str	r6, [r4, #672]
	str	r1, [r5, #16]
	mov	lr, pc
	bx	r7
.L299:
	mov	r0, #1
	b	.L293
.L322:
	mov	r2, #1
	str	r3, [sp, #12]
	ldr	r1, .L324+48
	ldr	r3, .L324+28
	str	r2, [r1]
	str	r2, [r3]
	ldr	r2, .L324+52
	mov	lr, pc
	bx	r2
	ldr	r2, .L324+56
	ldr	r1, [r4, #672]
	ldr	r0, .L324+8
	mov	lr, pc
	bx	r2
	mov	r0, r8
	ldr	r1, [sp, #12]
	bl	startAutomaticMovement
	mov	r3, #0
	mvn	r2, #0
	str	r3, [r4, #672]
	mvn	r3, #0
	mvn	r1, #0
	ldr	ip, .L324+8
	ldr	r0, .L324+40
	stm	ip, {r2-r3}
	str	r2, [ip, #8]
	str	r3, [ip, #12]
	ldr	r3, .L324+16
	str	r1, [ip, #16]
	mov	lr, pc
	bx	r3
	b	.L299
.L320:
	mov	r1, r3
	ldr	r0, .L324+60
	ldr	r5, .L324+16
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	ldr	r3, .L324+24
	ldr	r1, .L324+48
	str	r2, [r3]
	str	r2, [r1]
	ldr	r2, .L324+52
	mov	lr, pc
	bx	r2
	ldr	r2, .L324+56
	ldr	r0, .L324+8
	ldr	r1, [r4, #672]
	mov	lr, pc
	bx	r2
	mov	r0, r8
	ldr	r1, [sp, #12]
	bl	startAutomaticMovement
	mov	r3, #0
.L316:
	mvn	r2, #0
	mvn	r1, #0
	str	r3, [r4, #672]
	mvn	r3, #0
	ldr	ip, .L324+8
	ldr	r0, .L324+40
	stm	ip, {r2-r3}
	str	r2, [ip, #8]
	str	r3, [ip, #12]
	str	r1, [ip, #16]
	mov	lr, pc
	bx	r5
	b	.L299
.L321:
	ldr	r0, .L324+64
	ldr	r5, .L324+16
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	ldr	r2, .L324+68
	ldr	r1, [r4, #672]
	ldr	r0, .L324+8
	mov	lr, pc
	bx	r2
	ldr	r3, [sp, #12]
	b	.L316
.L323:
	ldr	r0, .L324+72
	ldr	r3, .L324+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L324+68
	ldr	r0, .L324+8
	ldr	r1, [r4, #672]
	mov	lr, pc
	bx	r3
	b	.L300
.L325:
	.align	2
.L324:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.word	.LC66
	.word	mgba_printf
	.word	squarePatternActive
	.word	rightTrianglePatternActive
	.word	isoscelesTrianglePatternActive
	.word	.LANCHOR0+468
	.word	.LC71
	.word	.LC64
	.word	.LC68
	.word	showAccessory
	.word	resetButtonEffects
	.word	startButtonSuccessEffect
	.word	.LC69
	.word	.LC70
	.word	startButtonErrorEffect
	.word	.LC67
	.size	checkButtonPatterns, .-checkButtonPatterns
	.align	2
	.global	checkTileCollision
	.syntax unified
	.arm
	.type	checkTileCollision, %function
checkTileCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	checkButtonPatterns
	.size	checkTileCollision, .-checkTileCollision
	.align	2
	.global	isAutomaticMovementFinished
	.syntax unified
	.arm
	.type	isAutomaticMovementFinished, %function
isAutomaticMovementFinished:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L328
	ldr	r0, [r3, #668]
	bx	lr
.L329:
	.align	2
.L328:
	.word	.LANCHOR0
	.size	isAutomaticMovementFinished, .-isAutomaticMovementFinished
	.align	2
	.global	isAutomaticMovementActive
	.syntax unified
	.arm
	.type	isAutomaticMovementActive, %function
isAutomaticMovementActive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L331
	ldr	r0, [r3, #660]
	bx	lr
.L332:
	.align	2
.L331:
	.word	.LANCHOR0
	.size	isAutomaticMovementActive, .-isAutomaticMovementActive
	.section	.rodata.str1.4
	.align	2
.LC72:
	.ascii	"COLLISION_1 (Horizontal Path)\000"
	.align	2
.LC73:
	.ascii	"Color Index %d (%s) at location (%d, %d)\000"
	.text
	.align	2
	.global	debugCollisionPaletteColors
	.syntax unified
	.arm
	.type	debugCollisionPaletteColors, %function
debugCollisionPaletteColors:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L344
	ldr	r3, [r7, #708]
	add	r3, r3, #1
	cmp	r3, #59
	sub	sp, sp, #12
	str	r3, [r7, #708]
	ble	.L333
	ldr	r1, .L344+4
	ldr	r3, [r1, #24]
	ldr	r2, [r1, #28]
	ldr	r5, [r1, #8]
	ldr	r4, [r1, #12]
	ldr	r6, .L344+8
	add	r3, r3, r3, lsr #31
	add	r2, r2, r2, lsr #31
	add	r4, r4, r2, asr #1
	add	r5, r5, r3, asr #1
	ldr	fp, .L344+12
	add	r9, r4, #24
	add	r6, r6, r4, lsl #8
	sub	r8, r5, #16
	sub	r4, r4, #16
	add	r5, r5, #24
.L335:
	mov	r10, r8
.L338:
	orr	r3, r4, r10
	cmp	r3, #255
	bls	.L343
.L336:
	add	r10, r10, #8
	cmp	r5, r10
	bne	.L338
	add	r4, r4, #8
	cmp	r9, r4
	add	r6, r6, #2048
	bne	.L335
	mov	r3, #0
	str	r3, [r7, #708]
.L333:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L343:
	ldrb	r1, [r6, r10]	@ zero_extendqisi2
	sub	r2, r1, #1
	sub	r3, r1, #2
	cmp	r2, #11
	and	r3, r3, #255
	bhi	.L336
	ldr	r2, .L344+16
	cmp	r3, #10
	add	r3, r2, r3, lsl #2
	ldrls	r2, [r3, #120]
	ldrhi	r2, .L344+20
	mov	r3, r10
	str	r4, [sp]
	ldr	r0, .L344+24
	mov	lr, pc
	bx	fp
	b	.L336
.L345:
	.align	2
.L344:
	.word	.LANCHOR0
	.word	player
	.word	tempCol2Bitmap-4096
	.word	mgba_printf
	.word	.LANCHOR1
	.word	.LC72
	.word	.LC73
	.size	debugCollisionPaletteColors, .-debugCollisionPaletteColors
	.section	.rodata.str1.4
	.align	2
.LC74:
	.ascii	"=== AUTO MOVEMENT DEBUG ===\000"
	.align	2
.LC75:
	.ascii	"Active: %d, Finished: %d, CurrentStep: %d\000"
	.align	2
.LC76:
	.ascii	"Step %d: Movement=%d, Duration=%d, Timer=%d\000"
	.align	2
.LC77:
	.ascii	"NO MOVEMENT SEQUENCE FOUND!\000"
	.align	2
.LC78:
	.ascii	"===========================\000"
	.text
	.align	2
	.global	debugAutomaticMovementState
	.syntax unified
	.arm
	.type	debugAutomaticMovementState, %function
debugAutomaticMovementState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #0
	ldr	r7, .L353
	ldr	r0, .L353+4
	ldr	r8, .L353+8
	sub	sp, sp, #12
	mov	lr, pc
	bx	r8
	ldr	r2, [r7, #668]
	ldr	r3, [r7, #664]
	ldr	r1, [r7, #660]
	ldr	r0, .L353+12
	mov	lr, pc
	bx	r8
	mov	r2, r4
	add	r5, r7, #464
	add	r6, r7, #560
	add	r9, r7, #372
	add	r7, r7, #564
.L348:
	ldr	r3, [r5, #4]!
	cmp	r3, #0
	ble	.L347
	ldr	ip, [r7, r4, lsl #2]
	ldr	r2, [r9, r4, lsl #2]
	mov	r1, r4
	ldr	r0, .L353+16
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	mov	r2, #1
.L347:
	cmp	r5, r6
	add	r4, r4, #1
	bne	.L348
	cmp	r2, #0
	beq	.L352
.L349:
	ldr	r0, .L353+20
	mov	lr, pc
	bx	r8
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L352:
	ldr	r0, .L353+24
	mov	lr, pc
	bx	r8
	b	.L349
.L354:
	.align	2
.L353:
	.word	.LANCHOR0
	.word	.LC74
	.word	mgba_printf
	.word	.LC75
	.word	.LC76
	.word	.LC78
	.word	.LC77
	.size	debugAutomaticMovementState, .-debugAutomaticMovementState
	.section	.rodata.str1.4
	.align	2
.LC79:
	.ascii	"COLLISION_2 (Horizontal Path)\000"
	.align	2
.LC80:
	.ascii	"COLLISION_3 (Vertical Path)\000"
	.align	2
.LC81:
	.ascii	"COLLISION_4 (Vertical Path)\000"
	.align	2
.LC82:
	.ascii	"COLLISION_5 (Horizontal Path)\000"
	.align	2
.LC83:
	.ascii	"COLLISION_6 (Horizontal Path)\000"
	.align	2
.LC84:
	.ascii	"COLLISION_7 (Vertical Path)\000"
	.align	2
.LC85:
	.ascii	"COLLISION_8 (Vertical Path)\000"
	.align	2
.LC86:
	.ascii	"COLLISION_9 (Vertical Path)\000"
	.align	2
.LC87:
	.ascii	"COLLISION_10 (Vertical Path)\000"
	.align	2
.LC88:
	.ascii	"COLLISION_11 (Vertical Path)\000"
	.align	2
.LC89:
	.ascii	"COLLISION_12 (Vertical Path)\000"
	.align	2
.LC90:
	.ascii	"DOWN\000"
	.align	2
.LC91:
	.ascii	"UP\000"
	.align	2
.LC92:
	.ascii	"LEFT\000"
	.align	2
.LC93:
	.ascii	"RIGHT\000"
	.align	2
.LC94:
	.ascii	"DIAG_DOWN_RIGHT\000"
	.align	2
.LC95:
	.ascii	"DIAG_DOWN_LEFT\000"
	.align	2
.LC96:
	.ascii	"DIAG_UP_RIGHT\000"
	.align	2
.LC97:
	.ascii	"DIAG_UP_LEFT\000"
	.align	2
.LC98:
	.ascii	"PAUSE_LEFT\000"
	.align	2
.LC99:
	.ascii	"PAUSE_RIGHT\000"
	.align	2
.LC100:
	.ascii	"PAUSE_UP\000"
	.align	2
.LC101:
	.ascii	"PAUSE_DOWN\000"
	.global	BUTTON_POSITIONS_Y
	.global	BUTTON_POSITIONS_X
	.global	bgVOff
	.global	bgHOff
	.global	buttonAnimationTimer
	.global	buttonAnimated
	.global	gameButtons
	.global	buttonSequence
	.global	automaticMovementFinished
	.global	movementTimers
	.global	movementDurations
	.global	movementSequence
	.global	currentMovementStep
	.global	automaticMovementActive
	.global	isoscelesPatternsCompleted
	.global	patternSpriteTimer
	.global	showPatternSprite
	.global	patternSpritePosY
	.global	patternSpritePosX
	.global	patternCompleted
	.global	sequenceComplete
	.global	buttonsCollected
	.global	spriteChanged
	.global	currentCollisionStep
	.data
	.align	3
	.set	.LANCHOR2,. + 0
	.type	buttonSequence, %object
	.size	buttonSequence, 20
buttonSequence:
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	patternSpritePosX, %object
	.size	patternSpritePosX, 12
patternSpritePosX:
	.space	12
	.space	4
	.type	patternSpritePosY, %object
	.size	patternSpritePosY, 12
patternSpritePosY:
	.space	12
	.type	patternCompleted, %object
	.size	patternCompleted, 4
patternCompleted:
	.space	4
	.type	showPatternSprite, %object
	.size	showPatternSprite, 4
showPatternSprite:
	.space	4
	.type	patternSpriteTimer, %object
	.size	patternSpriteTimer, 4
patternSpriteTimer:
	.space	4
	.type	gameButtons, %object
	.size	gameButtons, 280
gameButtons:
	.space	280
	.type	buttonAnimated, %object
	.size	buttonAnimated, 20
buttonAnimated:
	.space	20
	.type	buttonAnimationTimer, %object
	.size	buttonAnimationTimer, 20
buttonAnimationTimer:
	.space	20
	.type	isoscelesPatternsCompleted, %object
	.size	isoscelesPatternsCompleted, 12
isoscelesPatternsCompleted:
	.space	12
	.type	movementSequence, %object
	.size	movementSequence, 96
movementSequence:
	.space	96
	.type	movementDurations, %object
	.size	movementDurations, 96
movementDurations:
	.space	96
	.type	movementTimers, %object
	.size	movementTimers, 96
movementTimers:
	.space	96
	.type	automaticMovementActive, %object
	.size	automaticMovementActive, 4
automaticMovementActive:
	.space	4
	.type	currentMovementStep, %object
	.size	currentMovementStep, 4
currentMovementStep:
	.space	4
	.type	automaticMovementFinished, %object
	.size	automaticMovementFinished, 4
automaticMovementFinished:
	.space	4
	.type	buttonSequenceLength, %object
	.size	buttonSequenceLength, 4
buttonSequenceLength:
	.space	4
	.type	currentCollisionStep, %object
	.size	currentCollisionStep, 4
currentCollisionStep:
	.space	4
	.type	spriteChanged, %object
	.size	spriteChanged, 4
spriteChanged:
	.space	4
	.type	sequenceComplete, %object
	.size	sequenceComplete, 4
sequenceComplete:
	.space	4
	.type	buttonsCollected, %object
	.size	buttonsCollected, 20
buttonsCollected:
	.space	20
	.type	debugTimer.0, %object
	.size	debugTimer.0, 4
debugTimer.0:
	.space	4
	.type	bgVOff, %object
	.size	bgVOff, 4
bgVOff:
	.space	4
	.type	bgHOff, %object
	.size	bgHOff, 4
bgHOff:
	.space	4
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	BUTTON_POSITIONS_X, %object
	.size	BUTTON_POSITIONS_X, 20
BUTTON_POSITIONS_X:
	.word	196
	.word	37
	.word	198
	.word	39
	.word	118
	.type	BUTTON_POSITIONS_Y, %object
	.size	BUTTON_POSITIONS_Y, 20
BUTTON_POSITIONS_Y:
	.word	48
	.word	178
	.word	178
	.word	47
	.word	110
	.type	CSWTCH.99, %object
	.size	CSWTCH.99, 32
CSWTCH.99:
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.type	CSWTCH.102, %object
	.size	CSWTCH.102, 48
CSWTCH.102:
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.type	CSWTCH.111, %object
	.size	CSWTCH.111, 44
CSWTCH.111:
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.ident	"GCC: (devkitARM release 66) 15.1.0"
