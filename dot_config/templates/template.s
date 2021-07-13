@ vim:ft=arm
/**************************************************************************
 **
 **  Target      : Cortex-M3
 **
 **  Environment : GNU Tools
 **
 **************************************************************************/
    .syntax unified
    .thumb

    .global pfnVectors
    .global Default_Handler

    .equ Top_Of_Stack, 0x20004000    /* end of 16K RAM */

/****************************************************************************
 *
 * The minimal vector table for a Cortex M3.  Note that the proper constructs
 * must be placed on this to ensure that it ends up at physical address
 * 0x0000.0000.
 *
 ****************************************************************************/
    .text

pfnVectors:
    .word Top_Of_Stack          @ msp = 0x20004000
    .word _start                @ Starting Program address
    .word Default_Handler       @ NMI_Handler
    .word Default_Handler       @ HardFault_Handler
    .word Default_Handler       @ MemManage_Handler
    .word Default_Handler       @ BusFault_Handler
    .word Default_Handler       @ UsageFault_Handler
    .word 0                     @ 7
    .word 0                     @ To
    .word 0                     @ 10
    .word 0                     @ Reserved
    .word Default_Handler       @ SVC_Handler
    .word Default_Handler       @ DebugMon_Handler
    .word 0                     @ Reserved
    .word Default_Handler       @ PendSV_Handler
    .word Default_Handler       @ SysTick_Handler
    .word Default_Handler       @ IRQ_Handler
    .word Default_Handler       @ IRQ_andler

/**
 * This is the code that gets called when the processor first
 * starts execution following a reset.
 */
    .type _start, %function

_start:                     @ _start label is required by the linker

@ PUT ASSEMBLY CODE HERE

stop:
    BL stop

.data
SIZE:
    .word 0x00000005
ARRAY:
    .word 0x00000004, 0x00000001, 0x00000001, 0x00000001, 0x00000001

/**
 * This is the code that gets called when the processor receives an
 * unexpected interrupt.  This simply enters an infinite loop, preserving
 * the system state for examination by a debugger.
 *
 */
.type Default_Handler, %function

Default_Handler:
Infinite_Loop:
    b Infinite_Loop

.end
