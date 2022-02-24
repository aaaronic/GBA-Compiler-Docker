	.cpu arm7tdmi
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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r0, #67108864
	ldr	ip, .L3
	ldr	r1, .L3+4
	ldr	r2, .L3+8
	strh	ip, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	1027
	.word	oldButtons
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	fillScreen1
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen1, %function
fillScreen1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #0
	ldr	r3, .L7
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	fillScreen
	.size	fillScreen1, .-fillScreen1
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r0, #67108864
	ldr	ip, .L12
	ldr	r1, .L12+4
	ldr	r2, .L12+8
	push	{r4, lr}
	ldr	r5, .L12+12
	strh	ip, [r0]	@ movhi
	ldr	r4, .L12+16
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
.L10:
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	b	.L10
.L13:
	.align	2
.L12:
	.word	1027
	.word	oldButtons
	.word	buttons
	.word	drawFish
	.word	drawStarfish
	.size	main, .-main
	.ident	"GCC: (devkitARM release 53) 9.1.0"
