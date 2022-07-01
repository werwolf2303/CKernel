;(x86) mode
[BITS 32]
;Define initKernel method
[EXTERN initKernel]

;Define callKeyboard method
[EXTERN callKeyboard]

;Define idtp method
[EXTERN idtp]

global _start
global irq1
global idt_load

_start:
	sti
	
	;Call initKernel in kernel.c
	call initKernel

	jmp $
	RET

idt_load:
	lidt [idtp]
	RET

; ##### IRQS ####
irq1:
        ;Call function callKeyboard in C
	call callKeyboard
	mov al, 0x20
	out 0x20, al
	iret
