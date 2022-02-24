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
	.file	"HW03Lib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	ip, r3, #0
	ldr	r4, [sp, #8]
	ble	.L5
	ldr	lr, .L13
	add	r3, r1, r4
	rsb	r3, r3, r3, lsl #4
	ldr	r1, [lr]
	add	r3, r0, r3, lsl #4
	sub	lr, r4, r4, lsl #4
	add	ip, ip, r0
	add	r1, r1, r3, lsl #1
	lsl	lr, lr, #5
.L7:
	cmp	r4, #0
	addgt	r3, r1, lr
	ble	.L10
.L8:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L8
.L10:
	add	r0, r0, #1
	cmp	r0, ip
	add	r1, r1, #2
	bne	.L7
.L5:
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawHorizontalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	ip, r2, #0
	bxle	lr
	ldr	r2, .L19
	rsb	r1, r1, r1, lsl #4
	ldr	r2, [r2]
	add	r0, r0, r1, lsl #4
	add	r1, r0, ip
	add	r1, r2, r1, lsl #1
	add	r2, r2, r0, lsl #1
.L17:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L17
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawVerticalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r2, #0
	bxle	lr
	ldr	r2, .L29
	add	ip, r1, ip
	ldr	r2, [r2]
	str	lr, [sp, #-4]!
	rsb	ip, ip, ip, lsl #4
	rsb	lr, r1, r1, lsl #4
	add	r1, r0, ip, lsl #4
	add	r0, r0, lr, lsl #4
	add	r1, r2, r1, lsl #1
	add	r2, r2, r0, lsl #1
.L23:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L23
	ldr	lr, [sp], #4
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L35
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L37
.L35:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L37:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L35
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	mov	r0, #0
	ldr	r3, .L43
	ldr	r2, [r3]
	add	r2, r2, #76800
.L39:
	sub	r3, r2, #76800
.L40:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L40
	add	r0, r0, #1
	cmp	r0, #240
	add	r2, r3, #2
	bne	.L39
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	drawFish
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFish, %function
drawFish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L69
	ldm	r2, {r0, r3, ip}
	rsb	ip, ip, ip, lsl #4
	add	r7, r3, ip, lsl #4
	add	r1, r0, #18
	sub	sp, sp, #20
	ldr	lr, .L69+4
	str	r1, [sp, #8]
	lsl	ip, ip, #4
	add	r2, r0, r7, lsl #1
	add	r1, r1, r7, lsl #1
.L46:
	strh	lr, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L46
	sub	r2, r3, #1
	add	r8, ip, #240
	str	r2, [sp, #4]
	add	r4, r8, r3
	add	r2, r2, r8
	add	r1, r0, #20
	ldr	lr, .L69+4
	add	r2, r0, r2, lsl #1
	add	r1, r1, r4, lsl #1
.L47:
	strh	lr, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L47
	add	r9, ip, #480
	sub	r2, r3, #2
	add	r1, r2, r9
	add	fp, r9, r3
	add	lr, r0, #26
	ldr	r4, .L69+4
	add	r1, r0, r1, lsl #1
	add	r5, lr, fp, lsl #1
.L48:
	strh	r4, [r1], #2	@ movhi
	cmp	r1, r5
	bne	.L48
	add	r6, ip, #720
	add	r1, r2, r6
	add	r5, r6, r3
	add	r4, r0, #28
	ldr	r10, .L69+4
	add	r1, r0, r1, lsl #1
	add	r5, r4, r5, lsl #1
.L49:
	strh	r10, [r1], #2	@ movhi
	cmp	r1, r5
	bne	.L49
	add	r10, ip, #960
	add	r1, r2, r10
	add	r1, r0, r1, lsl #1
	str	r1, [sp, #12]
	add	r1, r10, r3
	add	r4, r4, r1, lsl #1
	ldr	r5, .L69+4
	ldr	r1, [sp, #12]
.L50:
	strh	r5, [r1], #2	@ movhi
	cmp	r1, r4
	bne	.L50
	add	r4, ip, #1200
	add	r2, r2, r4
	ldr	r1, .L69+4
	add	r4, r4, r3
	add	r2, r0, r2, lsl #1
	add	lr, lr, r4, lsl #1
.L51:
	strh	r1, [r2], #2	@ movhi
	cmp	r2, lr
	bne	.L51
	ldr	r2, [sp, #4]
	add	r1, ip, #1440
	add	r2, r2, r1
	add	r4, r1, r3
	ldr	lr, .L69+4
	add	r1, r0, #22
	add	r2, r0, r2, lsl #1
	add	r1, r1, r4, lsl #1
.L52:
	strh	lr, [r2], #2	@ movhi
	cmp	r1, r2
	bne	.L52
	ldr	r1, [sp, #8]
	add	r2, ip, #1680
	add	r2, r3, r2
	ldr	lr, .L69+4
	add	r1, r1, r2, lsl #1
	add	r2, r0, r2, lsl #1
.L53:
	strh	lr, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L53
	mov	r1, #0
	add	r2, r3, #17
	add	r6, r2, r6
	add	r10, r2, r10
	lsl	r6, r6, #1
	add	r2, r3, #18
	lsl	r10, r10, #1
	add	r9, r2, r9
	strh	lr, [r0, r6]	@ movhi
	ldr	r2, .L69+4
	strh	lr, [r0, r10]	@ movhi
	add	r9, r0, r9, lsl #1
.L54:
	add	r1, r1, #1
	cmp	r1, #3
	strh	r2, [r9]	@ movhi
	add	r9, r9, #480
	bne	.L54
	add	r2, r3, #19
	add	r1, r0, #2912
	add	r8, r2, r8
	add	r1, r1, #6
	ldr	lr, .L69+4
	add	r2, r1, r7, lsl #1
	add	r8, r0, r8, lsl #1
	lsl	r7, r7, #1
.L55:
	strh	lr, [r8]	@ movhi
	add	r8, r8, #480
	cmp	r2, r8
	bne	.L55
	add	r3, r3, #20
	add	r2, r0, #3392
	add	ip, r3, ip
	add	r2, r2, #8
	ldr	r3, .L69+4
	add	ip, r0, ip, lsl #1
	add	r7, r2, r7
.L56:
	strh	r3, [ip]	@ movhi
	add	ip, ip, #480
	cmp	r7, ip
	bne	.L56
	mov	r2, #0
	lsl	r3, fp, #1
	strh	r2, [r0, r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	.LANCHOR0
	.word	18367
	.size	drawFish, .-drawFish
	.align	2
	.global	drawStarfish
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStarfish, %function
drawStarfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	lr, #41216
	ldr	r1, .L107
	add	r2, r1, #12
	ldm	r2, {r2, r3}
	ldr	r1, [r1]
	rsb	r3, r3, r3, lsl #4
	add	r7, r2, r3, lsl #4
	add	ip, r1, #48
	sub	sp, sp, #12
	lsl	r3, r3, #4
	add	r0, r1, r7, lsl #1
	add	ip, ip, r7, lsl #1
.L72:
	strh	lr, [r0], #2	@ movhi
	cmp	r0, ip
	bne	.L72
	mvn	lr, #41216
	add	ip, r3, #240
	add	r0, r2, #1
	add	r0, r0, ip
	add	r4, ip, r2
	add	ip, r1, #46
	add	r0, r1, r0, lsl #1
	add	ip, ip, r4, lsl #1
.L73:
	strh	lr, [r0], #2	@ movhi
	cmp	r0, ip
	bne	.L73
	mvn	lr, #41216
	add	ip, r3, #480
	add	r6, r2, #3
	add	r0, r6, ip
	add	r4, ip, r2
	add	ip, r1, #42
	add	r0, r1, r0, lsl #1
	add	ip, ip, r4, lsl #1
.L74:
	strh	lr, [r0], #2	@ movhi
	cmp	r0, ip
	bne	.L74
	mvn	r5, #41216
	add	r4, r3, #720
	add	r0, r2, #5
	add	ip, r0, r4
	add	lr, r1, #38
	add	r4, r4, r2
	add	ip, r1, ip, lsl #1
	add	r4, lr, r4, lsl #1
.L75:
	strh	r5, [ip], #2	@ movhi
	cmp	ip, r4
	bne	.L75
	mvn	r5, #41216
	add	r4, r3, #960
	add	ip, r2, #6
	add	ip, ip, r4
	add	r8, r4, r2
	add	r4, r1, #36
	add	ip, r1, ip, lsl #1
	add	r4, r4, r8, lsl #1
.L76:
	strh	r5, [ip], #2	@ movhi
	cmp	ip, r4
	bne	.L76
	mvn	r4, #41216
	add	r5, r3, #1200
	add	ip, r0, r5
	add	r5, r5, r2
	add	ip, r1, ip, lsl #1
	add	lr, lr, r5, lsl #1
.L77:
	strh	r4, [ip], #2	@ movhi
	cmp	ip, lr
	bne	.L77
	mvn	r4, #41216
	add	lr, r3, #1440
	add	r0, r0, lr
	add	ip, r1, #40
	add	lr, lr, r2
	add	r0, r1, r0, lsl #1
	add	lr, ip, lr, lsl #1
.L78:
	strh	r4, [r0], #2	@ movhi
	cmp	r0, lr
	bne	.L78
	mvn	r5, #41216
	add	r0, r3, #1680
	add	r9, r0, r2
	add	r8, r2, #4
	lsl	r10, r9, #1
	add	lr, r8, r0
	add	r4, r1, #20
	str	r10, [sp, #4]
	add	lr, r1, lr, lsl #1
	add	r4, r4, r9, lsl #1
.L79:
	strh	r5, [lr], #2	@ movhi
	cmp	lr, r4
	bne	.L79
	mvn	lr, #41216
	add	r10, r3, #1920
	add	r9, r10, r2
	lsl	fp, r9, #1
	add	r4, r6, r10
	add	r5, r1, #14
	str	fp, [sp]
	add	r4, r1, r4, lsl #1
	add	r5, r5, r9, lsl #1
.L80:
	strh	lr, [r4], #2	@ movhi
	cmp	r4, r5
	bne	.L80
	mvn	r4, #41216
	add	r5, r3, #2160
	add	fp, r6, r5
	lsl	fp, fp, #1
	strh	lr, [r1, fp]	@ movhi
	add	r9, r3, #2400
	add	fp, r2, #2
	add	r8, r8, r5
	add	r6, r6, r9
	add	fp, fp, r9
	lsl	r8, r8, #1
	lsl	r6, r6, #1
	lsl	fp, fp, #1
	strh	lr, [r1, r8]	@ movhi
	strh	lr, [r1, fp]	@ movhi
	add	r8, r2, #14
	strh	lr, [r1, r6]	@ movhi
	ldr	lr, [sp, #4]
	add	r0, r8, r0
	add	lr, ip, lr
	add	r0, r1, r0, lsl #1
.L81:
	strh	r4, [r0], #2	@ movhi
	cmp	lr, r0
	bne	.L81
	mvn	r4, #41216
	ldr	r0, [sp]
	add	ip, ip, r0
	add	r0, r2, #16
	add	r10, r0, r10
	add	r10, r1, r10, lsl #1
.L82:
	strh	r4, [r10], #2	@ movhi
	cmp	r10, ip
	bne	.L82
	mvn	ip, #41216
	add	lr, r2, #18
	add	lr, lr, r5
	add	r0, r2, #19
	lsl	lr, lr, #1
	strh	r4, [r1, lr]	@ movhi
	add	r5, r0, r5
	add	lr, r2, #20
	add	r0, r0, r9
	lsl	r5, r5, #1
	lsl	r0, r0, #1
	add	r9, lr, r9
	strh	r4, [r1, r5]	@ movhi
	sub	lr, r3, #240
	strh	r4, [r1, r0]	@ movhi
	lsl	r9, r9, #1
	add	r0, r2, #8
	strh	r4, [r1, r9]	@ movhi
	add	r0, r0, lr
	add	r5, lr, r2
	add	r4, r1, #32
	add	r0, r1, r0, lsl #1
	add	r4, r4, r5, lsl #1
.L83:
	strh	ip, [r0], #2	@ movhi
	cmp	r4, r0
	bne	.L83
	mvn	r4, #41216
	sub	ip, r3, #480
	add	r0, r2, #9
	add	r0, r0, ip
	add	r5, ip, r2
	add	ip, r1, #30
	add	r0, r1, r0, lsl #1
	add	ip, ip, r5, lsl #1
.L84:
	strh	r4, [r0], #2	@ movhi
	cmp	ip, r0
	bne	.L84
	mov	r5, #0
	mvn	r6, #41216
	add	ip, r2, #10
	sub	r4, r3, #1200
	add	r0, r4, ip
	add	r0, r1, r0, lsl #1
.L85:
	add	r5, r5, #1
	cmp	r5, #3
	strh	r6, [r0]	@ movhi
	add	r0, r0, #480
	bne	.L85
	mvn	r6, #41216
	add	r0, r2, r3
	sub	r0, r0, #1664
	sub	r5, r1, #936
	sub	r0, r0, #5
	sub	r9, r5, #2
	add	r9, r9, r7, lsl #1
	add	r0, r1, r0, lsl #1
	lsl	r7, r7, #1
.L86:
	strh	r6, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r9, r0
	bne	.L86
	mvn	r0, #41216
	add	r3, r2, r3
	sub	r3, r3, #1904
	sub	r3, r3, #4
	add	r3, r1, r3, lsl #1
	add	r7, r5, r7
.L87:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r7, r3
	bne	.L87
	mov	r3, #0
	mvn	r0, #41216
	add	r2, r2, #13
	add	r2, r2, r4
	add	r2, r1, r2, lsl #1
.L88:
	add	r3, r3, #1
	cmp	r3, #3
	strh	r0, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L88
	mov	r3, #0
	add	ip, ip, lr
	add	r8, r8, lr
	lsl	ip, ip, #1
	lsl	r8, r8, #1
	strh	r3, [r1, ip]	@ movhi
	strh	r3, [r1, r8]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	.LANCHOR0
	.size	drawStarfish, .-drawStarfish
	.global	videoBuffer
	.global	starRow
	.global	starCol
	.global	fishRow
	.global	fishCol
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	fishCol, %object
	.size	fishCol, 4
fishCol:
	.word	50
	.type	fishRow, %object
	.size	fishRow, 4
fishRow:
	.word	10
	.type	starCol, %object
	.size	starCol, 4
starCol:
	.word	20
	.type	starRow, %object
	.size	starRow, 4
starRow:
	.word	10
	.ident	"GCC: (devkitARM release 53) 9.1.0"
