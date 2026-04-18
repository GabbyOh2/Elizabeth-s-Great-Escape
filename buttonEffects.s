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
	.file	"buttonEffects.c"
	.text
	.align	2
	.global	initButtonEffects
	.syntax unified
	.arm
	.type	initButtonEffects, %function
initButtonEffects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	mov	r1, #0
	ldr	r3, .L6
	add	r2, r3, #80
.L2:
	str	r0, [r3, #-16]
	str	r1, [r3, #-12]
	stmdb	r3, {r0-r1}
	add	r3, r3, #16
	cmp	r2, r3
	bne	.L2
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0+16
	.size	initButtonEffects, .-initButtonEffects
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Button %d: ERROR effect expired\000"
	.align	2
.LC1:
	.ascii	"Button %d: SUCCESS effect expired\000"
	.text
	.align	2
	.global	updateButtonEffects
	.syntax unified
	.arm
	.type	updateButtonEffects, %function
updateButtonEffects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L44
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, r2
	mov	r6, #1
	mov	r8, r2
	mov	r4, #0
	mov	r5, #0
	mov	r7, r1
	sub	sp, sp, #16
.L16:
	ldr	r0, [r3, #8]
	cmp	r0, #0
	beq	.L15
	ldr	r0, [r3, #4]
	sub	r0, r0, #1
	cmp	r0, #0
	str	r0, [r3, #4]
	ble	.L41
.L10:
	ldr	r0, [r3, #12]
	cmp	r0, #2
	bne	.L15
	ldr	r0, [r3, #4]
	cmp	r0, #0
	movgt	r6, #0
	andle	r6, r6, #1
.L15:
	add	r1, r1, #1
	cmp	r1, #5
	add	r3, r3, #16
	bne	.L16
	cmp	r6, #0
	beq	.L17
	ldr	r0, .L44+4
	sub	r3, r0, #80
.L19:
	ldr	r1, [r3, #12]
	cmp	r1, #2
	add	r3, r3, #16
	beq	.L18
	cmp	r3, r0
	bne	.L19
	ldr	r3, [r8, #80]
	cmp	r3, #0
	bne	.L42
.L20:
	mov	r6, #0
.L18:
	str	r6, [r8, #80]
.L17:
	ldr	r3, .L44+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L8
	mov	r0, #0
	mov	r4, #0
	mov	r5, #0
	ldr	r1, .L44+4
.L23:
	ldr	r3, [r2, #12]
	cmp	r3, #1
	bne	.L22
	str	r4, [r2, #8]
	str	r5, [r2, #12]
	str	r0, [r2]
.L22:
	add	r2, r2, #16
	cmp	r2, r1
	bne	.L23
.L8:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L41:
	ldr	r0, [r3, #12]
	cmp	r0, #2
	str	r4, [r3, #8]
	str	r5, [r3, #12]
	str	r7, [r3]
	beq	.L43
	cmp	r0, #1
	bne	.L15
	stmib	sp, {r1, r2, r3}
	ldr	r0, .L44+12
	ldr	r3, .L44+16
	mov	lr, pc
	bx	r3
	ldmib	sp, {r1, r2, r3}
	b	.L10
.L43:
	stmib	sp, {r1, r2, r3}
	ldr	r0, .L44+20
	ldr	r3, .L44+16
	mov	lr, pc
	bx	r3
	ldmib	sp, {r1, r2, r3}
	b	.L10
.L42:
	ldr	r3, .L44+24
	str	r2, [sp, #4]
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #4]
	b	.L20
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.word	.LANCHOR0+80
	.word	automaticMovementFinished
	.word	.LC1
	.word	mgba_printf
	.word	.LC0
	.word	resetButtonSequence
	.size	updateButtonEffects, .-updateButtonEffects
	.align	2
	.global	startButtonSuccessEffect
	.syntax unified
	.arm
	.type	startButtonSuccessEffect, %function
startButtonSuccessEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	bxle	lr
	push	{r4, r5, fp}
	mov	ip, #300
	mov	fp, #7
	mov	r4, #1
	mov	r5, #1
	sub	r0, r0, #4
	ldr	r2, .L55
	add	r1, r0, r1, lsl #2
.L49:
	ldr	r3, [r0, #4]!
	cmp	r3, #4
	bhi	.L48
	add	r3, r2, r3, lsl #4
	stm	r3, {fp-ip}
	str	r4, [r3, #8]
	str	r5, [r3, #12]
.L48:
	cmp	r0, r1
	bne	.L49
	pop	{r4, r5, fp}
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.size	startButtonSuccessEffect, .-startButtonSuccessEffect
	.align	2
	.global	startButtonErrorEffect
	.syntax unified
	.arm
	.type	startButtonErrorEffect, %function
startButtonErrorEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	bxle	lr
	push	{r4, r5, fp}
	mov	ip, #30
	mov	fp, #1
	mov	r4, #1
	mov	r5, #2
	sub	r0, r0, #4
	ldr	r2, .L66
	add	r1, r0, r1, lsl #2
.L60:
	ldr	r3, [r0, #4]!
	cmp	r3, #4
	bhi	.L59
	add	r3, r2, r3, lsl #4
	stm	r3, {fp-ip}
	str	r4, [r3, #8]
	str	r5, [r3, #12]
.L59:
	cmp	r0, r1
	bne	.L60
	pop	{r4, r5, fp}
	bx	lr
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.size	startButtonErrorEffect, .-startButtonErrorEffect
	.align	2
	.global	resetButtonEffects
	.syntax unified
	.arm
	.type	resetButtonEffects, %function
resetButtonEffects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	mov	r1, #0
	ldr	r3, .L72
	add	r2, r3, #80
.L69:
	str	r0, [r3, #-16]
	str	r1, [r3, #-12]
	stmdb	r3, {r0-r1}
	add	r3, r3, #16
	cmp	r2, r3
	bne	.L69
	bx	lr
.L73:
	.align	2
.L72:
	.word	.LANCHOR0+16
	.size	resetButtonEffects, .-resetButtonEffects
	.align	2
	.global	shouldUseEffectPalette
	.syntax unified
	.arm
	.type	shouldUseEffectPalette, %function
shouldUseEffectPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #4
	ldrls	r3, .L77
	addls	r3, r3, r0, lsl #4
	ldrls	r0, [r3, #8]
	movhi	r0, #0
	bx	lr
.L78:
	.align	2
.L77:
	.word	.LANCHOR0
	.size	shouldUseEffectPalette, .-shouldUseEffectPalette
	.align	2
	.global	getButtonPaletteRow
	.syntax unified
	.arm
	.type	getButtonPaletteRow, %function
getButtonPaletteRow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #4
	ldrls	r3, .L82
	ldrls	r0, [r3, r0, lsl #4]
	movhi	r0, #0
	bx	lr
.L83:
	.align	2
.L82:
	.word	.LANCHOR0
	.size	getButtonPaletteRow, .-getButtonPaletteRow
	.global	BUTTON_DEFAULT_COLORS
	.global	buttonEffects
	.section	.rodata
	.align	2
	.type	BUTTON_DEFAULT_COLORS, %object
	.size	BUTTON_DEFAULT_COLORS, 16
BUTTON_DEFAULT_COLORS:
	.short	0
	.short	32767
	.short	31
	.short	992
	.short	31744
	.short	1023
	.short	31775
	.short	32736
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	buttonEffects, %object
	.size	buttonEffects, 80
buttonEffects:
	.space	80
	.type	lastHadErrors.0, %object
	.size	lastHadErrors.0, 4
lastHadErrors.0:
	.space	4
	.ident	"GCC: (devkitARM release 66) 15.1.0"
