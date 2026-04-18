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
	.file	"digitalSound.c"
	.text
	.align	2
	.global	setupSounds
	.syntax unified
	.arm
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.align	2
	.global	setupSoundInterrupts
	.syntax unified
	.arm
	.type	setupSoundInterrupts, %function
setupSoundInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r1, #67108864
	ldr	r2, .L6
	ldrh	r3, [r2]
	orr	r3, r3, r0
	strh	r3, [r2]	@ movhi
	ldr	ip, .L6+4
	ldr	r3, .L6+8
	str	r3, [ip, #4092]
	ldrh	r3, [r1, #4]
	orr	r3, r3, #8
	strh	r0, [r2, #8]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L7:
	.align	2
.L6:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupSoundInterrupts, .-setupSoundInterrupts
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	mov	r6, r1
	mov	r8, r2
	mov	r1, r7
	mov	r3, #910163968
	mov	r0, #1
	ldr	r2, .L10+8
	ldr	r4, .L10+12
	mov	lr, pc
	bx	r4
	mov	r5, #0
	mov	r2, #128
	mvn	r1, #1520
	mov	r0, #1
	ldr	r4, .L10+16
	ldr	r3, .L10+20
	str	r0, [r4, #8]
	str	r8, [r4, #12]
	mov	r0, r6
	strh	r5, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	str	r6, [r4, #4]
	ldr	r3, .L10+24
	str	r7, [r4]
	mov	lr, pc
	bx	r3
	ldr	r6, .L10+28
	adr	r3, .L10
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r6, .L10+32
	ldr	r3, .L10+36
	mov	lr, pc
	bx	r6
	ldr	r3, .L10+40
	mov	lr, pc
	bx	r3
	str	r5, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L11:
	.align	3
.L10:
	.word	1443109011
	.word	1078844686
	.word	67109024
	.word	DMANow
	.word	.LANCHOR0
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #67108864
	mov	r7, r0
	mov	r5, #0
	mov	r6, r1
	str	r5, [ip, #208]
	mov	r8, r2
	mov	r1, r7
	mov	r3, #910163968
	mov	r0, #2
	ldr	r2, .L14+8
	ldr	r4, .L14+12
	mov	lr, pc
	bx	r4
	mov	r2, #128
	mvn	r1, #1520
	mov	r0, #1
	ldr	r4, .L14+16
	ldr	r3, .L14+20
	str	r0, [r4, #32]
	str	r7, [r4, #24]
	str	r8, [r4, #36]
	mov	r0, r6
	strh	r5, [r3, #6]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	str	r6, [r4, #28]
	ldr	r3, .L14+24
	mov	lr, pc
	bx	r3
	ldr	r6, .L14+28
	adr	r3, .L14
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r6, .L14+32
	ldr	r3, .L14+36
	mov	lr, pc
	bx	r6
	ldr	r3, .L14+40
	mov	lr, pc
	bx	r3
	str	r5, [r4, #44]
	str	r0, [r4, #40]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	.align	3
.L14:
	.word	1443109011
	.word	1078844686
	.word	67109028
	.word	DMANow
	.word	.LANCHOR0
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, #0
	ldr	r3, .L31+8
	ldrh	r2, [r3, #2]
	tst	r2, #1
	sub	sp, sp, #12
	strh	r5, [r3, #8]	@ movhi
	beq	.L18
	ldr	r4, .L31+12
	ldr	r3, [r4, #8]
	cmp	r3, r5
	beq	.L20
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #20]
	ble	.L20
	ldr	r3, [r4, #12]
	cmp	r3, r5
	mov	r7, r3
	bne	.L29
	mov	r2, #67108864
	ldr	r3, .L31+16
	str	r7, [r4, #8]
	str	r7, [r2, #196]
	strh	r7, [r3, #2]	@ movhi
.L20:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L18
	add	r2, r4, #40
	ldm	r2, {r2, r3}
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #44]
	ble	.L18
	ldr	r2, [r4, #36]
	cmp	r2, #0
	bne	.L30
	mov	r1, #67108864
	ldr	r3, .L31+16
	str	r2, [r4, #32]
	str	r2, [r1, #208]
	strh	r2, [r3, #6]	@ movhi
.L18:
	mov	r1, #1
	ldr	r3, .L31+8
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L29:
	ldm	r4, {r1, r6}
	mov	r3, #910163968
	mov	r0, #1
	ldr	r2, .L31+20
	ldr	ip, .L31+24
	str	r1, [sp, #4]
	mov	lr, pc
	bx	ip
	mov	r3, #1
	mvn	ip, #1520
	mov	r2, #128
	str	r3, [r4, #8]
	ldr	r1, [sp, #4]
	ldr	r3, .L31+16
	str	r7, [r4, #12]
	str	r6, [r4, #4]
	mov	r0, r6
	strh	r5, [r3, #2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L31+28
	str	r1, [r4]
	mov	lr, pc
	bx	r3
	adr	r3, .L31
	ldmia	r3, {r2-r3}
	ldr	ip, .L31+32
	mov	lr, pc
	bx	ip
	mov	r2, #0
	ldr	r3, .L31+36
	ldr	ip, .L31+40
	mov	lr, pc
	bx	ip
	ldr	r3, .L31+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #20]
	str	r0, [r4, #16]
	b	.L20
.L30:
	add	r0, r4, #24
	ldm	r0, {r0, r1}
	bl	playSoundB
	b	.L18
.L32:
	.align	3
.L31:
	.word	1443109011
	.word	1078844686
	.word	67109376
	.word	.LANCHOR0
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	1086687360
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSounds
	.syntax unified
	.arm
	.type	pauseSounds, %function
pauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L34
	ldr	r2, .L34+4
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	67109120
	.size	pauseSounds, .-pauseSounds
	.align	2
	.global	unpauseSounds
	.syntax unified
	.arm
	.type	unpauseSounds, %function
unpauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r2, #128
	ldr	r1, .L37
	ldr	r3, .L37+4
	str	r0, [r1, #8]
	strh	r2, [r3, #2]	@ movhi
	str	r0, [r1, #32]
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.word	67109120
	.size	unpauseSounds, .-unpauseSounds
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r2, #67108864
	ldr	r0, .L40
	ldr	r1, .L40+4
	str	r3, [r0, #8]
	strh	r3, [r1, #2]	@ movhi
	str	r3, [r0, #32]
	str	r3, [r2, #196]
	strh	r3, [r1, #6]	@ movhi
	str	r3, [r2, #208]
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	67109120
	.size	stopSounds, .-stopSounds
	.global	soundB
	.global	soundA
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	soundA, %object
	.size	soundA, 24
soundA:
	.space	24
	.type	soundB, %object
	.size	soundB, 24
soundB:
	.space	24
	.global	__aeabi_d2iz
	.global	__aeabi_ddiv
	.global	__aeabi_dmul
	.global	__aeabi_i2d
	.ident	"GCC: (devkitARM release 66) 15.1.0"
