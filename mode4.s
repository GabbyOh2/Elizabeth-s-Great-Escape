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
	.file	"mode4.c"
	.text
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L6
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	sub	sp, sp, #8
	strh	r3, [sp, #6]	@ movhi
	ldrh	r3, [sp, #6]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	strhne	r3, [sp, #6]	@ movhi
	strheq	r3, [sp, #6]	@ movhi
	ldrhne	r3, [sp, #6]
	ldrheq	r3, [sp, #6]
	orrne	r3, r3, r2, lsl #8
	orreq	r3, r3, r2
	strh	r3, [sp, #6]	@ movhi
	ldrh	r3, [sp, #6]
	strh	r3, [ip, r1]	@ movhi
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L7:
	.align	2
.L6:
	.word	videoBuffer
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldrb	lr, [sp, #64]	@ zero_extendqisi2
	ldrb	r4, [sp, #64]	@ zero_extendqisi2
	cmp	r3, #0
	orr	lr, lr, r4, lsl #8
	strh	lr, [sp, #22]	@ movhi
	ble	.L8
	cmp	r2, #1
	mov	r10, r1
	mov	r8, r2
	mov	fp, r0
	mov	r4, r1
	add	r7, r3, r1
	beq	.L10
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	orr	r3, r3, #16777216
	str	r3, [sp, #12]
	sub	r3, r2, #2
	asr	r3, r3, #1
	orr	r3, r3, #16777216
	str	r3, [sp, #8]
	rsb	r6, r1, r1, lsl #4
	and	r3, r2, #1
	cmp	r8, #2
	ldr	r9, .L34
	str	r3, [sp, #4]
	add	r6, r0, r6, lsl #4
	beq	.L22
.L31:
	and	r5, fp, #1
.L13:
	cmp	r5, #0
	ldr	r3, [sp, #4]
	ldr	r2, [r9]
	beq	.L15
	cmp	r3, #0
	add	r3, r6, #1
	add	r5, r2, r3
	bne	.L30
	mov	r1, r10
	mov	r0, fp
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bl	setPixel4
	mov	r2, r5
	mov	r0, #3
	ldr	r3, [sp, #8]
	ldr	ip, .L34+4
	add	r1, sp, #22
	mov	lr, pc
	bx	ip
	add	r0, r8, fp
	mov	r1, r10
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	sub	r0, r0, #1
	add	r4, r4, #1
	bl	setPixel4
	cmp	r7, r4
	beq	.L8
.L17:
	cmp	r8, #2
	mov	r10, r4
	add	r6, r6, #240
	bne	.L31
	b	.L22
.L32:
	mov	r1, r4
.L10:
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r4, r7
	bne	.L32
.L8:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	mov	r10, r4
.L22:
	mov	r1, r10
	mov	r0, fp
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bl	setPixel4
	add	r4, r4, #1
	mov	r1, r10
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	add	r0, fp, #1
	bl	setPixel4
	cmp	r7, r4
	bne	.L14
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	cmp	r3, #0
	add	r2, r2, r6
	bne	.L33
	mov	r0, #3
	ldr	r3, [sp, #12]
	ldr	ip, .L34+4
	add	r1, sp, #22
	add	r4, r4, #1
	mov	lr, pc
	bx	ip
	cmp	r7, r4
	beq	.L8
.L19:
	mov	r10, r4
	add	r6, r6, #240
	b	.L13
.L30:
	mov	r1, r10
	mov	r0, fp
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bl	setPixel4
	sub	r3, r8, #1
	asr	r3, r3, #1
	mov	r0, #3
	mov	r2, r5
	ldr	ip, .L34+4
	add	r1, sp, #22
	orr	r3, r3, #16777216
	add	r4, r4, #1
	mov	lr, pc
	bx	ip
	cmp	r7, r4
	bne	.L17
	b	.L8
.L33:
	sub	r3, r8, #1
	asr	r3, r3, #1
	mov	r0, #3
	ldr	ip, .L34+4
	orr	r3, r3, #16777216
	add	r1, sp, #22
	mov	lr, pc
	bx	ip
	add	r0, r8, fp
	mov	r1, r10
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	sub	r0, r0, #1
	add	r4, r4, #1
	bl	setPixel4
	cmp	r7, r4
	bne	.L19
	b	.L8
.L35:
	.align	2
.L34:
	.word	videoBuffer
	.word	DMANow
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	push	{r4, lr}
	sub	sp, sp, #16
	strb	ip, [sp, #7]
	ldr	r2, .L38
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldrb	lr, [sp, #7]	@ zero_extendqisi2
	mov	r0, #3
	orr	ip, ip, lr, lsl #8
	ldr	r3, .L38+4
	ldr	r2, [r2]
	ldr	r4, .L38+8
	add	r1, sp, #14
	strh	ip, [sp, #14]	@ movhi
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	videoBuffer
	.word	16796416
	.word	DMANow
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r7, r3, #0
	ble	.L40
	mov	r5, #0
	add	r6, r2, r2, lsr #31
	rsb	r1, r1, r1, lsl #4
	ldr	fp, [sp, #40]
	ldr	r9, .L45
	ldr	r8, .L45+4
	asr	r10, r6, #1
	add	r4, r0, r1, lsl #4
	bic	r6, r6, #1
.L42:
	ldr	ip, [r9]
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	mov	r1, fp
	mov	r3, r10
	mov	r0, #3
	add	r2, ip, r2
	add	r5, r5, #1
	mov	lr, pc
	bx	r8
	cmp	r7, r5
	add	r4, r4, #240
	add	fp, fp, r6
	bne	.L42
.L40:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	videoBuffer
	.word	DMANow
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L49
	mov	r1, r0
	ldr	r4, .L49+4
	mov	r3, #19200
	mov	r0, #3
	ldr	r2, [r2]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	videoBuffer
	.word	DMANow
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	flipPages
	.syntax unified
	.arm
	.type	flipPages, %function
flipPages:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r0, [r3]
	tst	r0, #16
	ldr	r2, .L54
	moveq	r2, #100663296
	ldr	r1, .L54+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L55:
	.align	2
.L54:
	.word	100704256
	.word	videoBuffer
	.size	flipPages, .-flipPages
	.ident	"GCC: (devkitARM release 66) 15.1.0"
