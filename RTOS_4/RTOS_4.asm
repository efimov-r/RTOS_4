            .include "m32def.inc"      ;ATMega32


.equ        T0_sist_sravn=117                        ;регистр сравнения системного таймера


.equ        DSEG_nach=$0060                          ;начало ОЗУ
.equ        DSEG_pol=128                             ;пользовательское допространство
.equ        DSEG_beg_os=(DSEG_nach+DSEG_pol)         ;начало стеков задачь

.equ        DSEG_t0s=64                              ;размер стека задачи 0
.equ        DSEG_t1s=64                              ;размер стека задачи 1
.equ        DSEG_t2s=64                              ;размер стека задачи 2
.equ        DSEG_t3s=64                              ;размер стека задачи 3
.equ        DSEG_t4s=64                              ;размер стека задачи 4
.equ        DSEG_t5s=64                              ;размер стека задачи 5
.equ        DSEG_t6s=64                              ;размер стека задачи 6
.equ        DSEG_t7s=64                              ;размер стека задачи 7
.equ        DSEG_t8s=64                              ;размер стека задачи 8
.equ        DSEG_t9s=64                              ;размер стека задачи 9
.equ        DSEG_t10s=64                             ;размер стека задачи 10
.equ        DSEG_t11s=64                             ;размер стека задачи 11

.equ        DSEG_beg_t0s=DSEG_beg_os                 ;начало стека каждой задачи
.equ        DSEG_beg_t1s=DSEG_beg_t0s+DSEG_t0s+6+32
.equ        DSEG_beg_t2s=DSEG_beg_t1s+DSEG_t1s+6+32
.equ        DSEG_beg_t3s=DSEG_beg_t2s+DSEG_t2s+6+32
.equ        DSEG_beg_t4s=DSEG_beg_t3s+DSEG_t3s+6+32
.equ        DSEG_beg_t5s=DSEG_beg_t4s+DSEG_t4s+6+32
.equ        DSEG_beg_t6s=DSEG_beg_t5s+DSEG_t5s+6+32
.equ        DSEG_beg_t7s=DSEG_beg_t6s+DSEG_t6s+6+32
.equ        DSEG_beg_t8s=DSEG_beg_t7s+DSEG_t7s+6+32
.equ        DSEG_beg_t9s=DSEG_beg_t8s+DSEG_t8s+6+32
.equ        DSEG_beg_t10s=DSEG_beg_t9s+DSEG_t9s+6+32
.equ        DSEG_beg_t11s=DSEG_beg_t10s+DSEG_t10s+6+32

.equ        DSEG_buf0=DSEG_beg_t11s+DSEG_t11s+6+32
.equ        DSEG_buf1=DSEG_beg_t11s+DSEG_t11s+6+32+1
.equ        DSEG_buf2=DSEG_beg_t11s+DSEG_t11s+6+32+2
.equ        DSEG_buf3=DSEG_beg_t11s+DSEG_t11s+6+32+3
.equ        ocher=DSEG_beg_t11s+DSEG_t11s+6+32+4

.equ        DSEG_st_t0s=DSEG_beg_t0s+DSEG_t0s-1       ;конец стека каждой задачи
.equ        DSEG_st_t1s=DSEG_beg_t1s+DSEG_t1s-1
.equ        DSEG_st_t2s=DSEG_beg_t2s+DSEG_t2s-1
.equ        DSEG_st_t3s=DSEG_beg_t3s+DSEG_t3s-1
.equ        DSEG_st_t4s=DSEG_beg_t4s+DSEG_t4s-1
.equ        DSEG_st_t5s=DSEG_beg_t5s+DSEG_t5s-1
.equ        DSEG_st_t6s=DSEG_beg_t6s+DSEG_t6s-1
.equ        DSEG_st_t7s=DSEG_beg_t7s+DSEG_t7s-1
.equ        DSEG_st_t8s=DSEG_beg_t8s+DSEG_t8s-1
.equ        DSEG_st_t9s=DSEG_beg_t9s+DSEG_t9s-1
.equ        DSEG_st_t10s=DSEG_beg_t10s+DSEG_t10s-1
.equ        DSEG_st_t11s=DSEG_beg_t11s+DSEG_t11s-1

.equ        DSEG_sreg_t0s=DSEG_beg_t0s+DSEG_t0s        ;SREG каждой задачи
.equ        DSEG_sreg_t1s=DSEG_beg_t1s+DSEG_t1s
.equ        DSEG_sreg_t2s=DSEG_beg_t2s+DSEG_t2s
.equ        DSEG_sreg_t3s=DSEG_beg_t3s+DSEG_t3s
.equ        DSEG_sreg_t4s=DSEG_beg_t4s+DSEG_t4s
.equ        DSEG_sreg_t5s=DSEG_beg_t5s+DSEG_t5s
.equ        DSEG_sreg_t6s=DSEG_beg_t6s+DSEG_t6s
.equ        DSEG_sreg_t7s=DSEG_beg_t7s+DSEG_t7s
.equ        DSEG_sreg_t8s=DSEG_beg_t8s+DSEG_t8s
.equ        DSEG_sreg_t9s=DSEG_beg_t9s+DSEG_t9s
.equ        DSEG_sreg_t10s=DSEG_beg_t10s+DSEG_t10s
.equ        DSEG_sreg_t11s=DSEG_beg_t11s+DSEG_t11s

.equ        DSEG_spl_t0s=DSEG_beg_t0s+DSEG_t0s+1        ;SPL каждой задачи
.equ        DSEG_spl_t1s=DSEG_beg_t1s+DSEG_t1s+1
.equ        DSEG_spl_t2s=DSEG_beg_t2s+DSEG_t2s+1
.equ        DSEG_spl_t3s=DSEG_beg_t3s+DSEG_t3s+1
.equ        DSEG_spl_t4s=DSEG_beg_t4s+DSEG_t4s+1
.equ        DSEG_spl_t5s=DSEG_beg_t5s+DSEG_t5s+1
.equ        DSEG_spl_t6s=DSEG_beg_t6s+DSEG_t6s+1
.equ        DSEG_spl_t7s=DSEG_beg_t7s+DSEG_t7s+1
.equ        DSEG_spl_t8s=DSEG_beg_t8s+DSEG_t8s+1
.equ        DSEG_spl_t9s=DSEG_beg_t9s+DSEG_t9s+1
.equ        DSEG_spl_t10s=DSEG_beg_t10s+DSEG_t10s+1
.equ        DSEG_spl_t11s=DSEG_beg_t11s+DSEG_t11s+1

.equ        DSEG_sph_t0s=DSEG_beg_t0s+DSEG_t0s+2        ;SPH каждой задачи
.equ        DSEG_sph_t1s=DSEG_beg_t1s+DSEG_t1s+2
.equ        DSEG_sph_t2s=DSEG_beg_t2s+DSEG_t2s+2
.equ        DSEG_sph_t3s=DSEG_beg_t3s+DSEG_t3s+2
.equ        DSEG_sph_t4s=DSEG_beg_t4s+DSEG_t4s+2
.equ        DSEG_sph_t5s=DSEG_beg_t5s+DSEG_t5s+2
.equ        DSEG_sph_t6s=DSEG_beg_t6s+DSEG_t6s+2
.equ        DSEG_sph_t7s=DSEG_beg_t7s+DSEG_t7s+2
.equ        DSEG_sph_t8s=DSEG_beg_t8s+DSEG_t8s+2
.equ        DSEG_sph_t9s=DSEG_beg_t9s+DSEG_t9s+2
.equ        DSEG_sph_t10s=DSEG_beg_t10s+DSEG_t10s+2
.equ        DSEG_sph_t11s=DSEG_beg_t11s+DSEG_t11s+2

.equ        DSEG_tl_t0s=DSEG_beg_t0s+DSEG_t0s+3        ;TL каждой задачи
.equ        DSEG_tl_t1s=DSEG_beg_t1s+DSEG_t1s+3
.equ        DSEG_tl_t2s=DSEG_beg_t2s+DSEG_t2s+3
.equ        DSEG_tl_t3s=DSEG_beg_t3s+DSEG_t3s+3
.equ        DSEG_tl_t4s=DSEG_beg_t4s+DSEG_t4s+3
.equ        DSEG_tl_t5s=DSEG_beg_t5s+DSEG_t5s+3
.equ        DSEG_tl_t6s=DSEG_beg_t6s+DSEG_t6s+3
.equ        DSEG_tl_t7s=DSEG_beg_t7s+DSEG_t7s+3
.equ        DSEG_tl_t8s=DSEG_beg_t8s+DSEG_t8s+3
.equ        DSEG_tl_t9s=DSEG_beg_t9s+DSEG_t9s+3
.equ        DSEG_tl_t10s=DSEG_beg_t10s+DSEG_t10s+3
.equ        DSEG_tl_t11s=DSEG_beg_t11s+DSEG_t11s+3

.equ        DSEG_th_t0s=DSEG_beg_t0s+DSEG_t0s+4        ;TH каждой задачи
.equ        DSEG_th_t1s=DSEG_beg_t1s+DSEG_t1s+4
.equ        DSEG_th_t2s=DSEG_beg_t2s+DSEG_t2s+4
.equ        DSEG_th_t3s=DSEG_beg_t3s+DSEG_t3s+4
.equ        DSEG_th_t4s=DSEG_beg_t4s+DSEG_t4s+4
.equ        DSEG_th_t5s=DSEG_beg_t5s+DSEG_t5s+4
.equ        DSEG_th_t6s=DSEG_beg_t6s+DSEG_t6s+4
.equ        DSEG_th_t7s=DSEG_beg_t7s+DSEG_t7s+4
.equ        DSEG_th_t8s=DSEG_beg_t8s+DSEG_t8s+4
.equ        DSEG_th_t9s=DSEG_beg_t9s+DSEG_t9s+4
.equ        DSEG_th_t10s=DSEG_beg_t10s+DSEG_t10s+4
.equ        DSEG_th_t11s=DSEG_beg_t11s+DSEG_t11s+4

.equ        DSEG_fl_t0s=DSEG_beg_t0s+DSEG_t0s+5        ;флаги каждой задачи
.equ        DSEG_fl_t1s=DSEG_beg_t1s+DSEG_t1s+5
.equ        DSEG_fl_t2s=DSEG_beg_t2s+DSEG_t2s+5
.equ        DSEG_fl_t3s=DSEG_beg_t3s+DSEG_t3s+5
.equ        DSEG_fl_t4s=DSEG_beg_t4s+DSEG_t4s+5
.equ        DSEG_fl_t5s=DSEG_beg_t5s+DSEG_t5s+5
.equ        DSEG_fl_t6s=DSEG_beg_t6s+DSEG_t6s+5
.equ        DSEG_fl_t7s=DSEG_beg_t7s+DSEG_t7s+5
.equ        DSEG_fl_t8s=DSEG_beg_t8s+DSEG_t8s+5
.equ        DSEG_fl_t9s=DSEG_beg_t9s+DSEG_t9s+5
.equ        DSEG_fl_t10s=DSEG_beg_t10s+DSEG_t10s+5
.equ        DSEG_fl_t11s=DSEG_beg_t11s+DSEG_t11s+5

.equ        DSEG_ron_t0s=DSEG_beg_t0s+DSEG_t0s+6        ;начало РОН каждой задачи
.equ        DSEG_ron_t1s=DSEG_beg_t1s+DSEG_t1s+6
.equ        DSEG_ron_t2s=DSEG_beg_t2s+DSEG_t2s+6
.equ        DSEG_ron_t3s=DSEG_beg_t3s+DSEG_t3s+6
.equ        DSEG_ron_t4s=DSEG_beg_t4s+DSEG_t4s+6
.equ        DSEG_ron_t5s=DSEG_beg_t5s+DSEG_t5s+6
.equ        DSEG_ron_t6s=DSEG_beg_t6s+DSEG_t6s+6
.equ        DSEG_ron_t7s=DSEG_beg_t7s+DSEG_t7s+6
.equ        DSEG_ron_t8s=DSEG_beg_t8s+DSEG_t8s+6
.equ        DSEG_ron_t9s=DSEG_beg_t9s+DSEG_t9s+6
.equ        DSEG_ron_t10s=DSEG_beg_t10s+DSEG_t10s+6
.equ        DSEG_ron_t11s=DSEG_beg_t11s+DSEG_t11s+6






; = RAM ===================================================
            .DSEG                      ; сегмент ОЗУ



		


; = FLASH =================================================
            .CSEG                      ; сегмент памяти программ

;*** INTERRUPT VECTORS ************************************************
.ORG $000   ; Сброс
RJMP start
.ORG $002	; Внешнее прерывание INT0
RETI
.ORG $004	; Внешнее прерывание INT1
RETI
.ORG $006	; внешнее прерывание INT2
RETI
.ORG $008	; Таймер/Счетчик2 совпадение
RETI
.ORG $00a	; Таймер/Счетчик2 переполнение
RETI
.ORG $00c	; Таймер/Cчетчик1 Capture Event
RETI
.ORG $00e	; Таймер/Cчетчик1 совпадение A
RETI
.ORG $010	; Таймер/Cчетчик1 совпадение B
RETI
.ORG $012	; Таймер/Cчетчик1 переполнение
RETI
.ORG $014	; Таймер/Cчетчик0 совпадение
RJMP plan
.ORG $016	; Tаймер/Счетчик0 переполнение
RETI
.ORG $018	; SPI
RETI
.ORG $01a	; USART, завершение приема
RETI
.ORG $01c	; USART, регистр передачи пуст
RETI
.ORG $01e	; USART, завершение передачи
RETI
.ORG $020	; АЦП
RETI
.ORG $022	; EEPROM Ready
RETI
.ORG $024	; Компаратор
RETI
.ORG $026	; TWI
RETI
.ORG $028	; Store Program Memory Ready
RETI

.ORG   INT_VECTORS_SIZE        ; Конец таблици прерываний
                
start:      IN      r16,TIMSK               ; Разрешаем прерывание по совпадению
            ORI     r16,1<<OCIE0
			OUT     TIMSK,r16

			IN      r16,TCCR0               ; Режим СТС, преддел. 1024
			ORI     r16,1<<WGM01|1<<CS02|1<<CS00
			OUT     TCCR0,r16

			LDI     r16,T0_sist_sravn       ; В регистр сравнения
			OUT     OCR0,r16
       
      
            LDI     ZL,Low(SRAM_START)      ; Адрес начала ОЗУ в индекс
			LDI     ZH,High(SRAM_START) 
			CLR     R16                     ; Очищаем R16
Flush:      ST      Z+,R16                  ; Сохраняем 0 в ячейку памяти
            CPI     ZH,High(RAMEND)         ; Достигли конца оперативки?
			BRNE    Flush                   ; Нет? Крутимся дальше! 
            CPI     ZL,Low(RAMEND)          ; А младший байт достиг конца?
			BRNE    Flush 

            CLR     ZL                      ; Очищаем индекс
			CLR     ZH                
			CLR     R0                
			CLR     R1                
			CLR     R2                
			CLR     R3                
			CLR     R4                
			CLR     R5                
			CLR     R6                
			CLR     R7                
			CLR     R8                
			CLR     R9                
			CLR     R10                
			CLR     R11                
			CLR     R12                
			CLR     R13                
			CLR     R14                
			CLR     R15                
			CLR     R16                
			CLR     R17                
			CLR     R18                
			CLR     R19                
			CLR     R20                
			CLR     R21                
			CLR     R22                
			CLR     R23                
			CLR     R24                
			CLR     R25                
			CLR     R26                
			CLR     R27                
			CLR     R28                
			CLR     R29
			OUT     SPL,R29
			OUT     SPH,R29			

			SEI

m232:		RJMP M232


plan:       STS    DSEG_buf0,r16
            STS    DSEG_buf1,r17
			STS    DSEG_buf2,r30
			STS    DSEG_buf3,r31
            LDI    ZL,Low(dispecher)
			LDI    ZH,High(dispecher)

			LDS     r16,DSEG_fl_t0s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t0s,r16
			BREQ    save_task0
			RJMP    save_1
save_task0: STS     ocher,r16

            STS  DSEG_ron_t0s,r0
  		    STS  DSEG_ron_t0s+1,r1
		    STS  DSEG_ron_t0s+2,r2
		    STS  DSEG_ron_t0s+3,r3
		    STS  DSEG_ron_t0s+4,r4
		    STS  DSEG_ron_t0s+5,r5
		    STS  DSEG_ron_t0s+6,r6
		    STS  DSEG_ron_t0s+7,r7
		    STS  DSEG_ron_t0s+8,r8
		    STS  DSEG_ron_t0s+9,r9
		    STS  DSEG_ron_t0s+10,r10
		    STS  DSEG_ron_t0s+11,r11
		    STS  DSEG_ron_t0s+12,r12
		    STS  DSEG_ron_t0s+13,r13
		    STS  DSEG_ron_t0s+14,r14
		    STS  DSEG_ron_t0s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t0s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t0s+17,r17
		    STS  DSEG_ron_t0s+18,r18
		    STS  DSEG_ron_t0s+19,r19
		    STS  DSEG_ron_t0s+20,r20
		    STS  DSEG_ron_t0s+21,r21
		    STS  DSEG_ron_t0s+22,r22
		    STS  DSEG_ron_t0s+23,r23
		    STS  DSEG_ron_t0s+24,r24
		    STS  DSEG_ron_t0s+25,r25
		    STS  DSEG_ron_t0s+26,r26
		    STS  DSEG_ron_t0s+27,r27
		    STS  DSEG_ron_t0s+28,r28
		    STS  DSEG_ron_t0s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t0s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t0s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t0s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t0s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t0s,r16

            IJMP
			

save_1:		LDS     r16,DSEG_fl_t1s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t1s,r16
			BREQ    save_task1
			RJMP    save_2
save_task1: LDI     r16,1
            STS     ocher,r16
            
			STS  DSEG_ron_t1s,r0
  		    STS  DSEG_ron_t1s+1,r1
		    STS  DSEG_ron_t1s+2,r2
		    STS  DSEG_ron_t1s+3,r3
		    STS  DSEG_ron_t1s+4,r4
		    STS  DSEG_ron_t1s+5,r5
		    STS  DSEG_ron_t1s+6,r6
		    STS  DSEG_ron_t1s+7,r7
		    STS  DSEG_ron_t1s+8,r8
		    STS  DSEG_ron_t1s+9,r9
		    STS  DSEG_ron_t1s+10,r10
		    STS  DSEG_ron_t1s+11,r11
		    STS  DSEG_ron_t1s+12,r12
		    STS  DSEG_ron_t1s+13,r13
		    STS  DSEG_ron_t1s+14,r14
		    STS  DSEG_ron_t1s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t1s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t1s+17,r17
		    STS  DSEG_ron_t1s+18,r18
		    STS  DSEG_ron_t1s+19,r19
		    STS  DSEG_ron_t1s+20,r20
		    STS  DSEG_ron_t1s+21,r21
		    STS  DSEG_ron_t1s+22,r22
		    STS  DSEG_ron_t1s+23,r23
		    STS  DSEG_ron_t1s+24,r24
		    STS  DSEG_ron_t1s+25,r25
		    STS  DSEG_ron_t1s+26,r26
		    STS  DSEG_ron_t1s+27,r27
		    STS  DSEG_ron_t1s+28,r28
		    STS  DSEG_ron_t1s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t1s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t1s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t1s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t1s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t1s,r16

            IJMP 

save_2:		LDS     r16,DSEG_fl_t2s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t2s,r16
			BREQ    save_task2
			RJMP    save_3
save_task2: LDI     r16,2
            STS     ocher,r16
            
			STS  DSEG_ron_t2s,r0
  		    STS  DSEG_ron_t2s+1,r1
		    STS  DSEG_ron_t2s+2,r2
		    STS  DSEG_ron_t2s+3,r3
		    STS  DSEG_ron_t2s+4,r4
		    STS  DSEG_ron_t2s+5,r5
		    STS  DSEG_ron_t2s+6,r6
		    STS  DSEG_ron_t2s+7,r7
		    STS  DSEG_ron_t2s+8,r8
		    STS  DSEG_ron_t2s+9,r9
		    STS  DSEG_ron_t2s+10,r10
		    STS  DSEG_ron_t2s+11,r11
		    STS  DSEG_ron_t2s+12,r12
		    STS  DSEG_ron_t2s+13,r13
		    STS  DSEG_ron_t2s+14,r14
		    STS  DSEG_ron_t2s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t2s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t2s+17,r17
		    STS  DSEG_ron_t2s+18,r18
		    STS  DSEG_ron_t2s+19,r19
		    STS  DSEG_ron_t2s+20,r20
		    STS  DSEG_ron_t2s+21,r21
		    STS  DSEG_ron_t2s+22,r22
		    STS  DSEG_ron_t2s+23,r23
		    STS  DSEG_ron_t2s+24,r24
		    STS  DSEG_ron_t2s+25,r25
		    STS  DSEG_ron_t2s+26,r26
		    STS  DSEG_ron_t2s+27,r27
		    STS  DSEG_ron_t2s+28,r28
		    STS  DSEG_ron_t2s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t2s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t2s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t2s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t2s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t2s,r16

            IJMP 
			

save_3:		LDS     r16,DSEG_fl_t3s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t3s,r16
			BREQ    save_task3
			RJMP    save_4
save_task3: LDI     r16,3
            STS     ocher,r16

            STS  DSEG_ron_t3s,r0
  		    STS  DSEG_ron_t3s+1,r1
		    STS  DSEG_ron_t3s+2,r2
		    STS  DSEG_ron_t3s+3,r3
		    STS  DSEG_ron_t3s+4,r4
		    STS  DSEG_ron_t3s+5,r5
		    STS  DSEG_ron_t3s+6,r6
		    STS  DSEG_ron_t3s+7,r7
		    STS  DSEG_ron_t3s+8,r8
		    STS  DSEG_ron_t3s+9,r9
		    STS  DSEG_ron_t3s+10,r10
		    STS  DSEG_ron_t3s+11,r11
		    STS  DSEG_ron_t3s+12,r12
		    STS  DSEG_ron_t3s+13,r13
		    STS  DSEG_ron_t3s+14,r14
		    STS  DSEG_ron_t3s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t3s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t3s+17,r17
		    STS  DSEG_ron_t3s+18,r18
		    STS  DSEG_ron_t3s+19,r19
		    STS  DSEG_ron_t3s+20,r20
		    STS  DSEG_ron_t3s+21,r21
		    STS  DSEG_ron_t3s+22,r22
		    STS  DSEG_ron_t3s+23,r23
		    STS  DSEG_ron_t3s+24,r24
		    STS  DSEG_ron_t3s+25,r25
		    STS  DSEG_ron_t3s+26,r26
		    STS  DSEG_ron_t3s+27,r27
		    STS  DSEG_ron_t3s+28,r28
		    STS  DSEG_ron_t3s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t3s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t3s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t3s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t3s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t3s,r16

            IJMP 
		

save_4:		LDS     r16,DSEG_fl_t4s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t4s,r16
			BREQ    save_task4
			RJMP    save_5
save_task4: LDI     r16,4
            STS     ocher,r16
            
			STS  DSEG_ron_t4s,r0
  		    STS  DSEG_ron_t4s+1,r1
		    STS  DSEG_ron_t4s+2,r2
		    STS  DSEG_ron_t4s+3,r3
		    STS  DSEG_ron_t4s+4,r4
		    STS  DSEG_ron_t4s+5,r5
		    STS  DSEG_ron_t4s+6,r6
		    STS  DSEG_ron_t4s+7,r7
		    STS  DSEG_ron_t4s+8,r8
		    STS  DSEG_ron_t4s+9,r9
		    STS  DSEG_ron_t4s+10,r10
		    STS  DSEG_ron_t4s+11,r11
		    STS  DSEG_ron_t4s+12,r12
		    STS  DSEG_ron_t4s+13,r13
		    STS  DSEG_ron_t4s+14,r14
		    STS  DSEG_ron_t4s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t4s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t4s+17,r17
		    STS  DSEG_ron_t4s+18,r18
		    STS  DSEG_ron_t4s+19,r19
		    STS  DSEG_ron_t4s+20,r20
		    STS  DSEG_ron_t4s+21,r21
		    STS  DSEG_ron_t4s+22,r22
		    STS  DSEG_ron_t4s+23,r23
		    STS  DSEG_ron_t4s+24,r24
		    STS  DSEG_ron_t4s+25,r25
		    STS  DSEG_ron_t4s+26,r26
		    STS  DSEG_ron_t4s+27,r27
		    STS  DSEG_ron_t4s+28,r28
		    STS  DSEG_ron_t4s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t4s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t4s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t4s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t4s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t4s,r16

            IJMP 
			

save_5:		LDS     r16,DSEG_fl_t5s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t5s,r16
			BREQ    save_task5
			RJMP    save_6
save_task5: LDI     r16,5
            STS     ocher,r16  
            
			STS  DSEG_ron_t5s,r0
  		    STS  DSEG_ron_t5s+1,r1
		    STS  DSEG_ron_t5s+2,r2
		    STS  DSEG_ron_t5s+3,r3
		    STS  DSEG_ron_t5s+4,r4
		    STS  DSEG_ron_t5s+5,r5
		    STS  DSEG_ron_t5s+6,r6
		    STS  DSEG_ron_t5s+7,r7
		    STS  DSEG_ron_t5s+8,r8
		    STS  DSEG_ron_t5s+9,r9
		    STS  DSEG_ron_t5s+10,r10
		    STS  DSEG_ron_t5s+11,r11
		    STS  DSEG_ron_t5s+12,r12
		    STS  DSEG_ron_t5s+13,r13
		    STS  DSEG_ron_t5s+14,r14
		    STS  DSEG_ron_t5s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t5s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t5s+17,r17
		    STS  DSEG_ron_t5s+18,r18
		    STS  DSEG_ron_t5s+19,r19
		    STS  DSEG_ron_t5s+20,r20
		    STS  DSEG_ron_t5s+21,r21
		    STS  DSEG_ron_t5s+22,r22
		    STS  DSEG_ron_t5s+23,r23
		    STS  DSEG_ron_t5s+24,r24
		    STS  DSEG_ron_t5s+25,r25
		    STS  DSEG_ron_t5s+26,r26
		    STS  DSEG_ron_t5s+27,r27
		    STS  DSEG_ron_t5s+28,r28
		    STS  DSEG_ron_t5s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t5s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t5s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t5s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t5s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t5s,r16

            IJMP
			

save_6:		LDS     r16,DSEG_fl_t6s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t6s,r16
			BREQ    save_task6
			RJMP    save_7
save_task6: LDI     r16,6 
            STS     ocher,r16
            
            STS  DSEG_ron_t6s,r0
  		    STS  DSEG_ron_t6s+1,r1
		    STS  DSEG_ron_t6s+2,r2
		    STS  DSEG_ron_t6s+3,r3
		    STS  DSEG_ron_t6s+4,r4
		    STS  DSEG_ron_t6s+5,r5
		    STS  DSEG_ron_t6s+6,r6
		    STS  DSEG_ron_t6s+7,r7
		    STS  DSEG_ron_t6s+8,r8
		    STS  DSEG_ron_t6s+9,r9
		    STS  DSEG_ron_t6s+10,r10
		    STS  DSEG_ron_t6s+11,r11
		    STS  DSEG_ron_t6s+12,r12
		    STS  DSEG_ron_t6s+13,r13
		    STS  DSEG_ron_t6s+14,r14
		    STS  DSEG_ron_t6s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t6s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t6s+17,r17
		    STS  DSEG_ron_t6s+18,r18
		    STS  DSEG_ron_t6s+19,r19
		    STS  DSEG_ron_t6s+20,r20
		    STS  DSEG_ron_t6s+21,r21
		    STS  DSEG_ron_t6s+22,r22
		    STS  DSEG_ron_t6s+23,r23
		    STS  DSEG_ron_t6s+24,r24
		    STS  DSEG_ron_t6s+25,r25
		    STS  DSEG_ron_t6s+26,r26
		    STS  DSEG_ron_t6s+27,r27
		    STS  DSEG_ron_t6s+28,r28
		    STS  DSEG_ron_t6s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t6s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t6s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t6s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t6s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t6s,r16

            IJMP
			

save_7:		LDS     r16,DSEG_fl_t7s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t7s,r16
			BREQ    save_task7
			RJMP    save_8
save_task7: LDI     r16,7
            STS     ocher,r16
            
			STS  DSEG_ron_t7s,r0
  		    STS  DSEG_ron_t7s+1,r1
		    STS  DSEG_ron_t7s+2,r2
		    STS  DSEG_ron_t7s+3,r3
		    STS  DSEG_ron_t7s+4,r4
		    STS  DSEG_ron_t7s+5,r5
		    STS  DSEG_ron_t7s+6,r6
		    STS  DSEG_ron_t7s+7,r7
		    STS  DSEG_ron_t7s+8,r8
		    STS  DSEG_ron_t7s+9,r9
		    STS  DSEG_ron_t7s+10,r10
		    STS  DSEG_ron_t7s+11,r11
		    STS  DSEG_ron_t7s+12,r12
		    STS  DSEG_ron_t7s+13,r13
		    STS  DSEG_ron_t7s+14,r14
		    STS  DSEG_ron_t7s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t7s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t7s+17,r17
		    STS  DSEG_ron_t7s+18,r18
		    STS  DSEG_ron_t7s+19,r19
		    STS  DSEG_ron_t7s+20,r20
		    STS  DSEG_ron_t7s+21,r21
		    STS  DSEG_ron_t7s+22,r22
		    STS  DSEG_ron_t7s+23,r23
		    STS  DSEG_ron_t7s+24,r24
		    STS  DSEG_ron_t7s+25,r25
		    STS  DSEG_ron_t7s+26,r26
		    STS  DSEG_ron_t7s+27,r27
		    STS  DSEG_ron_t7s+28,r28
		    STS  DSEG_ron_t7s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t7s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t7s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t7s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t7s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t7s,r16

            IJMP
			

save_8:		LDS     r16,DSEG_fl_t8s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t8s,r16
			BREQ    save_task8
			RJMP    save_9
save_task8: LDI     r16,8
            STS     ocher,r16
            
			STS  DSEG_ron_t8s,r0
  		    STS  DSEG_ron_t8s+1,r1
		    STS  DSEG_ron_t8s+2,r2
		    STS  DSEG_ron_t8s+3,r3
		    STS  DSEG_ron_t8s+4,r4
		    STS  DSEG_ron_t8s+5,r5
		    STS  DSEG_ron_t8s+6,r6
		    STS  DSEG_ron_t8s+7,r7
		    STS  DSEG_ron_t8s+8,r8
		    STS  DSEG_ron_t8s+9,r9
		    STS  DSEG_ron_t8s+10,r10
		    STS  DSEG_ron_t8s+11,r11
		    STS  DSEG_ron_t8s+12,r12
		    STS  DSEG_ron_t8s+13,r13
		    STS  DSEG_ron_t8s+14,r14
		    STS  DSEG_ron_t8s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t8s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t8s+17,r17
		    STS  DSEG_ron_t8s+18,r18
		    STS  DSEG_ron_t8s+19,r19
		    STS  DSEG_ron_t8s+20,r20
		    STS  DSEG_ron_t8s+21,r21
		    STS  DSEG_ron_t8s+22,r22
		    STS  DSEG_ron_t8s+23,r23
		    STS  DSEG_ron_t8s+24,r24
		    STS  DSEG_ron_t8s+25,r25
		    STS  DSEG_ron_t8s+26,r26
		    STS  DSEG_ron_t8s+27,r27
		    STS  DSEG_ron_t8s+28,r28
		    STS  DSEG_ron_t8s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t8s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t8s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t8s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t8s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t8s,r16

            IJMP
			

save_9:		LDS     r16,DSEG_fl_t9s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t8s,r16
			BREQ    save_task9
			RJMP    save_10
save_task9: LDI     r16,9 
            STS     ocher,r16
            
			STS  DSEG_ron_t9s,r0
  		    STS  DSEG_ron_t9s+1,r1
		    STS  DSEG_ron_t9s+2,r2
		    STS  DSEG_ron_t9s+3,r3
		    STS  DSEG_ron_t9s+4,r4
		    STS  DSEG_ron_t9s+5,r5
		    STS  DSEG_ron_t9s+6,r6
		    STS  DSEG_ron_t9s+7,r7
		    STS  DSEG_ron_t9s+8,r8
		    STS  DSEG_ron_t9s+9,r9
		    STS  DSEG_ron_t9s+10,r10
		    STS  DSEG_ron_t9s+11,r11
		    STS  DSEG_ron_t9s+12,r12
		    STS  DSEG_ron_t9s+13,r13
		    STS  DSEG_ron_t9s+14,r14
		    STS  DSEG_ron_t9s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t9s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t9s+17,r17
		    STS  DSEG_ron_t9s+18,r18
		    STS  DSEG_ron_t9s+19,r19
		    STS  DSEG_ron_t9s+20,r20
		    STS  DSEG_ron_t9s+21,r21
		    STS  DSEG_ron_t9s+22,r22
		    STS  DSEG_ron_t9s+23,r23
		    STS  DSEG_ron_t9s+24,r24
		    STS  DSEG_ron_t9s+25,r25
		    STS  DSEG_ron_t9s+26,r26
		    STS  DSEG_ron_t9s+27,r27
		    STS  DSEG_ron_t9s+28,r28
		    STS  DSEG_ron_t9s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t9s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t9s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t9s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t9s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t9s,r16

            IJMP


save_10:	LDS     r16,DSEG_fl_t10s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t10s,r16
			BREQ    save_task10
			RJMP    save_11
save_task10:LDI     r16,10 
            STS     ocher,r16
            
			STS  DSEG_ron_t10s,r0
  		    STS  DSEG_ron_t10s+1,r1
		    STS  DSEG_ron_t10s+2,r2
		    STS  DSEG_ron_t10s+3,r3
		    STS  DSEG_ron_t10s+4,r4
		    STS  DSEG_ron_t10s+5,r5
		    STS  DSEG_ron_t10s+6,r6
		    STS  DSEG_ron_t10s+7,r7
		    STS  DSEG_ron_t10s+8,r8
		    STS  DSEG_ron_t10s+9,r9
		    STS  DSEG_ron_t10s+10,r10
		    STS  DSEG_ron_t10s+11,r11
		    STS  DSEG_ron_t10s+12,r12
		    STS  DSEG_ron_t10s+13,r13
		    STS  DSEG_ron_t10s+14,r14
		    STS  DSEG_ron_t10s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t10s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t10s+17,r17
		    STS  DSEG_ron_t10s+18,r18
		    STS  DSEG_ron_t10s+19,r19
		    STS  DSEG_ron_t10s+20,r20
		    STS  DSEG_ron_t10s+21,r21
		    STS  DSEG_ron_t10s+22,r22
		    STS  DSEG_ron_t10s+23,r23
		    STS  DSEG_ron_t10s+24,r24
		    STS  DSEG_ron_t10s+25,r25
		    STS  DSEG_ron_t10s+26,r26
		    STS  DSEG_ron_t10s+27,r27
		    STS  DSEG_ron_t10s+28,r28
		    STS  DSEG_ron_t10s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t10s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t10s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t10s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t10s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t10s,r16

            IJMP


save_11:	LDS     r16,DSEG_fl_t11s
			CPI     r16,1
			LDI     r16,0
            STS     DSEG_fl_t11s,r16
			BREQ    save_task11
			RJMP    dispecher
save_task11:LDI     r16,11 
            STS     ocher,r16
            
			STS  DSEG_ron_t11s,r0
  		    STS  DSEG_ron_t11s+1,r1
		    STS  DSEG_ron_t11s+2,r2
		    STS  DSEG_ron_t11s+3,r3
		    STS  DSEG_ron_t11s+4,r4
		    STS  DSEG_ron_t11s+5,r5
		    STS  DSEG_ron_t11s+6,r6
		    STS  DSEG_ron_t11s+7,r7
		    STS  DSEG_ron_t11s+8,r8
		    STS  DSEG_ron_t11s+9,r9
		    STS  DSEG_ron_t11s+10,r10
		    STS  DSEG_ron_t11s+11,r11
		    STS  DSEG_ron_t11s+12,r12
		    STS  DSEG_ron_t11s+13,r13
		    STS  DSEG_ron_t11s+14,r14
		    STS  DSEG_ron_t11s+15,r15
			 LDS  r16,DSEG_buf0
		    STS  DSEG_ron_t11s+16,r16
			 LDS  r17,DSEG_buf1
		    STS  DSEG_ron_t11s+17,r17
		    STS  DSEG_ron_t11s+18,r18
		    STS  DSEG_ron_t11s+19,r19
		    STS  DSEG_ron_t11s+20,r20
		    STS  DSEG_ron_t11s+21,r21
		    STS  DSEG_ron_t11s+22,r22
		    STS  DSEG_ron_t11s+23,r23
		    STS  DSEG_ron_t11s+24,r24
		    STS  DSEG_ron_t11s+25,r25
		    STS  DSEG_ron_t11s+26,r26
		    STS  DSEG_ron_t11s+27,r27
		    STS  DSEG_ron_t11s+28,r28
		    STS  DSEG_ron_t11s+29,r29
			 LDS  r16,DSEG_buf2
		    STS  DSEG_ron_t11s+30,r16
			 LDS  r16,DSEG_buf3
		    STS  DSEG_ron_t11s+31,r16

			LDS  r16,SREG
			STS  DSEG_sreg_t11s,r16
			LDS  r16,SPL
			STS  DSEG_spl_t11s,r16
			LDS  r16,SPH
			STS  DSEG_sph_t11s,r16

            IJMP



dispecher:  LDS     r16,ocher
            CPI     r16,9
			BREQ    dis_1
			INC     r16
			RJMP    dis_2
dis_1:      LDS     r16,0
dis_2:      STS     ocher,r16

            CPI     r16,0
			BREQ    load_task0
		    RJMP    lo_1
			IJMP
load_task0: TASK_load 0             
            

lo_1:		CPI     r16,1
			BREQ    load_task1
			RJMP    lo_2
			IJMP
load_task1: TASK_load 1            
            

lo_2:		CPI     r16,2
			BREQ    load_task2
			RJMP    lo_3
			IJMP
load_task2: TASK_load 2           
            

lo_3:		CPI     r16,3
			BREQ    load_task3
			RJMP    lo_4
			IJMP
load_task3: TASK_load 3            
            

lo_4:		CPI     r16,4
			BREQ    load_task4
			RJMP    lo_5
			IJMP
load_task4: TASK_load 4            
            

lo_5:		CPI     r16,5
			BREQ    load_task5
			RJMP    lo_6
			IJMP
load_task5: TASK_load 5            
            

lo_6:		CPI     r16,6
			BREQ    load_task6
			RJMP    lo_7
			IJMP
load_task6: TASK_load 6            
            

lo_7:		CPI     r16,7
			BREQ    load_task7
			RJMP    lo_8
			IJMP
load_task7: TASK_load 7            

            

lo_8:		CPI     r16,8
			BREQ    load_task8
			RJMP    lo_9
			IJMP
load_task8: TASK_load 8            


lo_9:		CPI     r16,9
			BREQ    load_task9
			RJMP    lo_10
			IJMP
load_task9: TASK_load 9            

            

lo_10:		CPI     r16,10
			BREQ    load_task10
			RJMP    lo_11
			IJMP
load_task8: TASK_load 10           

            

lo_11:		CPI     r16,11
			BREQ    load_task11			
			LDI     ZL,0             ;защита
			LDI     ZH,0
			IJMP 
load_task9: TASK_load 11
