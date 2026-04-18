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
	.file	"analogSound.c"
	.text
	.align	2
	.global	initSound
	.syntax unified
	.arm
	.type	initSound, %function
initSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mvn	r1, #170
	mov	r2, #2
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
	.size	initSound, .-initSound
	.align	2
	.global	playNoteWithDuration
	.syntax unified
	.arm
	.type	playNoteWithDuration, %function
playNoteWithDuration:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	cmp	r3, #0
	beq	.L4
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	ldr	r3, .L6
	lsl	r2, r2, #8
	smull	ip, r2, r3, r2
	lsl	r1, r1, #6
	asr	r3, r2, #6
	and	r1, r1, #255
	rsb	r3, r3, #64
	orr	r3, r3, r1
	mvn	r3, r3, lsl #20
	mvn	r3, r3, lsr #20
	mov	ip, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [ip, #104]	@ movhi
	ldrh	r3, [r0]
	orr	r3, r3, #49152
	strh	r3, [ip, #108]	@ movhi
	bx	lr
.L4:
	mov	r2, #67108864
	strh	r3, [r2, #104]	@ movhi
	strh	r3, [r2, #108]	@ movhi
	bx	lr
.L7:
	.align	2
.L6:
	.word	274877907
	.size	playNoteWithDuration, .-playNoteWithDuration
	.align	2
	.global	playChannel1
	.syntax unified
	.arm
	.type	playChannel1, %function
playChannel1:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	mov	r6, r0
	ldrb	r0, [sp, #24]	@ zero_extendqisi2
	ldr	r2, .L12
	cmp	r0, #0
	ldr	ip, .L12+4
	lsl	r0, r3, #4
	movne	ip, r2
	ldrb	r4, [sp, #16]	@ zero_extendqisi2
	and	r0, r0, #112
	and	r3, r5, #7
	orr	r3, r3, r0
	mov	r2, #67108864
	cmp	r4, #0
	moveq	r0, r3
	orrne	r0, r3, #1
	ldrb	lr, [sp, #28]	@ zero_extendqisi2
	ldrb	r3, [sp, #20]	@ zero_extendqisi2
	lsl	lr, lr, #6
	and	lr, lr, #255
	and	r1, r1, #63
	lsl	r3, r3, #8
	orr	r1, r1, lr
	and	r3, r3, #1792
	orr	r1, r1, r3
	orr	ip, ip, r1
	lsl	ip, ip, #16
	orr	lr, r6, #49152
	lsr	ip, ip, #16
	strh	ip, [r2, #98]	@ movhi
	strh	lr, [r2, #100]	@ movhi
	strh	r0, [r2, #96]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	-4095
	.word	-4096
	.size	playChannel1, .-playChannel1
	.align	2
	.global	playDrumSound
	.syntax unified
	.arm
	.type	playDrumSound, %function
playDrumSound:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r2, #0
	movne	r2, #1
	str	lr, [sp, #-4]!
	mov	lr, #67108864
	ldrb	ip, [sp, #4]	@ zero_extendqisi2
	lsl	r1, r1, #4
	lsl	ip, ip, #8
	and	r1, r1, #255
	and	r0, r0, #7
	and	ip, ip, #1792
	orr	r0, r0, r1
	and	r3, r3, #63
	orr	r3, r3, ip
	orr	r0, r0, r2, lsl #3
	orr	r3, r3, #61440
	orr	r0, r0, #49152
	strh	r3, [lr, #120]	@ movhi
	strh	r0, [lr, #124]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
	.size	playDrumSound, .-playDrumSound
	.align	2
	.global	playAnalogSound
	.syntax unified
	.arm
	.type	playAnalogSound, %function
playAnalogSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L38
	cmp	r0, #17
	bhi	.L16
	ldrb	r0, [r3, r0]
	add	pc, pc, r0, lsl #2
.Lrtx19:
	nop
	.section	.rodata
.L19:
	.byte	(.L36-.Lrtx19-4)/4
	.byte	(.L35-.Lrtx19-4)/4
	.byte	(.L34-.Lrtx19-4)/4
	.byte	(.L33-.Lrtx19-4)/4
	.byte	(.L32-.Lrtx19-4)/4
	.byte	(.L31-.Lrtx19-4)/4
	.byte	(.L30-.Lrtx19-4)/4
	.byte	(.L29-.Lrtx19-4)/4
	.byte	(.L28-.Lrtx19-4)/4
	.byte	(.L27-.Lrtx19-4)/4
	.byte	(.L26-.Lrtx19-4)/4
	.byte	(.L25-.Lrtx19-4)/4
	.byte	(.L24-.Lrtx19-4)/4
	.byte	(.L23-.Lrtx19-4)/4
	.byte	(.L22-.Lrtx19-4)/4
	.byte	(.L21-.Lrtx19-4)/4
	.byte	(.L20-.Lrtx19-4)/4
	.byte	(.L18-.Lrtx19-4)/4
	.text
	.p2align 2
.L18:
	mov	r3, #67108864
	mov	r2, #117
	ldr	r0, .L38+4
	ldr	r1, .L38+8
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
.L16:
	bx	lr
.L36:
	mov	r3, #67108864
	mov	r2, #49152
	ldr	r1, .L38+12
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L35:
	mov	r3, #67108864
	ldr	r1, .L38+16
	ldr	r2, .L38+20
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L34:
	mov	r3, #67108864
	ldr	r1, .L38+24
	ldr	r2, .L38+28
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L33:
	mov	r3, #67108864
	ldr	r1, .L38+24
	ldr	r2, .L38+32
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L32:
	mov	r3, #67108864
	mov	r1, #61696
	ldr	r2, .L38+36
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L31:
	mov	r3, #67108864
	ldr	r1, .L38+40
	ldr	r2, .L38+44
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L30:
	mov	r3, #67108864
	ldr	r1, .L38+48
	ldr	r2, .L38+52
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L29:
	mov	r3, #67108864
	ldr	r1, .L38+56
	ldr	r2, .L38+60
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L28:
	mov	r3, #67108864
	mov	r0, #61696
	mov	r2, #55
	ldr	r1, .L38+64
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L27:
	mov	r3, #67108864
	mov	r0, #61696
	mov	r2, #53
	ldr	r1, .L38+8
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L26:
	mov	r3, #67108864
	mov	r2, #53
	ldr	r0, .L38+68
	ldr	r1, .L38+72
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L25:
	mov	r3, #67108864
	mov	r2, #23
	ldr	r0, .L38+76
	ldr	r1, .L38+64
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L24:
	mov	r3, #67108864
	mov	r2, #23
	ldr	r0, .L38+80
	ldr	r1, .L38+84
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L23:
	mov	r3, #67108864
	mov	r2, #39
	ldr	r0, .L38+80
	ldr	r1, .L38+64
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L22:
	mov	r3, #67108864
	mov	r2, #36
	ldr	r0, .L38+88
	ldr	r1, .L38+84
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L21:
	mov	r3, #67108864
	mov	r2, #36
	ldr	r0, .L38+92
	ldr	r1, .L38+96
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L20:
	mov	r3, #67108864
	mov	r2, #117
	ldr	r0, .L38+88
	ldr	r1, .L38+64
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L39:
	.align	2
.L38:
	.word	.L19
	.word	-2879
	.word	-14634
	.word	-3820
	.word	-3552
	.word	-16327
	.word	-2786
	.word	-16272
	.word	-16264
	.word	-16232
	.word	-3810
	.word	-16325
	.word	-4064
	.word	-16353
	.word	-3296
	.word	-16240
	.word	-14670
	.word	-3712
	.word	-14782
	.word	-3445
	.word	-2943
	.word	-14734
	.word	-3455
	.word	-3451
	.word	-14757
	.size	playAnalogSound, .-playAnalogSound
	.ident	"GCC: (devkitARM release 66) 15.1.0"
