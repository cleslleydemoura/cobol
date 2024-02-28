      ******************************************************************
      * Author: CLESLLEY DE MOURA
      * Date: 17/03/2023
      * Purpose: APRESENTAR TRABALHO COM VARIAVEIS
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGVAR.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-AUX-NOME      PIC X(10).
       77 WS-AUX-DIVIDA    PIC X(13).
       77 WS-AUX-TOTAL     PIC 9(08)V99.
       77 WS-ED-TOTAL      PIC $$,$$$,$$9.99.
       01 WS-REG.
           03 WS-NOME.
              05 WS-PRIM-NOME PIC X(05).
              05 WS-ULTM-NOME PIC X(05).
           03 WS-TELEFONE     PIC X(09).
           03 WS-DIVIDA.
              05 WS-VLR-PARC  PIC 9(05)V99.
              05 WS-QTD-PARC  PIC 9(03).
              05 WS-PARC-PAG  PIC 9(03).
           03 WS-STS-DIVIDA   PIC X.
              88 WS-PG        VALUE "S".
              88 WS-N-PG      VALUE "N".

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY "INFORME O NOME DO CLIENTE: "
            ACCEPT WS-AUX-NOME

            DISPLAY "INFORME O VALOR PARC. + QTD PARC. + QTD PARC. PG: "
            ACCEPT WS-AUX-DIVIDA

            DISPLAY "INFORME O TELEFONE DO CLIENTE: "
            ACCEPT WS-TELEFONE

            MOVE WS-AUX-NOME    TO WS-NOME
            MOVE WS-AUX-DIVIDA  TO WS-DIVIDA

            DISPLAY "O PRIMEIRO NOME DO CLIENTE: "        WS-PRIM-NOME
            DISPLAY "O ULTIMO NOME DO CLIENTE: "          WS-ULTM-NOME
            DISPLAY "O VALOR DAS PARCELAS: "              WS-VLR-PARC
            DISPLAY "A QUANTIDADE DE PARCELAS: "          WS-QTD-PARC
            DISPLAY "A QUANTIDADE DE PARCELAS PAGAS: "    WS-PARC-PAG
            DISPLAY "O NUMERO DE TELEFONE DO CLIENTE: "   WS-TELEFONE

            COMPUTE   WS-AUX-TOTAL = WS-QTD-PARC * WS-VLR-PARC
            MOVE      WS-AUX-TOTAL              TO WS-ED-TOTAL
            DISPLAY "O VALOR TOTAL DA DIVIDA: "    WS-ED-TOTAL

            MOVE ZEROS TO WS-AUX-TOTAL

            COMPUTE    WS-AUX-TOTAL = WS-PARC-PAG * WS-VLR-PARC
            MOVE       WS-AUX-TOTAL              TO WS-ED-TOTAL
            DISPLAY "O VALOR PAGO ATE O MOMENTO: "  WS-ED-TOTAL

            COMPUTE    WS-AUX-TOTAL = (WS-QTD-PARC * WS-VLR-PARC) -
                       WS-AUX-TOTAL
            MOVE       WS-AUX-TOTAL              TO WS-ED-TOTAL
            DISPLAY "FALTAM PAGAR: "                WS-ED-TOTAL

            IF WS-AUX-TOTAL NOT EQUAL ZEROS THEN
               MOVE       "N"                       TO WS-STS-DIVIDA
            ELSE
               MOVE       "S"                       TO WS-STS-DIVIDA
            END-IF

            IF WS-PG THEN
                DISPLAY "A DIVIDA ESTA PAGA"
            ELSE
                DISPLAY "A DIVIDA NAO ESTA PAGA"
            END-IF
            GOBACK.
