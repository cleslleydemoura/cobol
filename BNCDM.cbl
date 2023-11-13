
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BNCDM.
       AUTHOR. "CLESLLEY DE MOURA".
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           77 WS-OPCAO PIC X(2).
           77 WS-SALDO PIC 9(10)V99 VALUE ZERO.
           77 WS-DEPOSITO PIC 9(10)V99 VALUE ZERO.
           77 WS-SAQUE PIC 9(10)V99 VALUE ZERO.

       PROCEDURE DIVISION.
           P001-MENU1.

               DISPLAY "==============================================".
               DISPLAY "               BANCO D'MOURA                  ".
               DISPLAY "==============================================".
               DISPLAY " 1 - DEPOSITO".
               DISPLAY " 2 - SAQUE".
               DISPLAY " 3 - CONSULTAR SALDO".
               DISPLAY " 4 - SAIR".
               ACCEPT WS-OPCAO.

           EVALUATE WS-OPCAO
               WHEN '1'
               DISPLAY "=============================================="
               DISPLAY "               BANCO D'MOURA                  "
               DISPLAY "=============================================="
               DISPLAY "DIGITE O VALOR DO DEPOSITO: "

               ACCEPT WS-DEPOSITO

               COMPUTE WS-SALDO = WS-SALDO + WS-DEPOSITO
               DISPLAY "DEPÓSITO EFETIVADO"

               PERFORM P001-MENU1


               WHEN '2'
               DISPLAY "=============================================="
               DISPLAY "               BANCO D'MOURA                  "
               DISPLAY "=============================================="
               DISPLAY "DIGITE O VALOR DO SAQUE: "

               ACCEPT WS-SAQUE

               IF WS-SAQUE > WS-SALDO
                   THEN
                           DISPLAY "SALDO INSUFICIENTE PARA OPERACAO"
               ELSE
                   COMPUTE WS-SALDO = WS-SALDO - WS-SAQUE
               END-IF
               PERFORM P001-MENU1

               WHEN '3'
               DISPLAY "=============================================="
               DISPLAY "               BANCO D'MOURA                  "
               DISPLAY "=============================================="
               DISPLAY "O SALDO DISPONIVEL E DE: " WS-SALDO
               PERFORM P001-MENU1

               WHEN '4'
               DISPLAY "OBRIGADO POR UTILIZAR NOSSO SISTEMA"
               CONTINUE

               WHEN OTHER
                   PERFORM P001-MENU1
           END-EVALUATE.
           STOP RUN.
           END PROGRAM BNCDM.
