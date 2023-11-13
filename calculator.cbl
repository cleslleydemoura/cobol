******************************************************************
      * Author: CLESLLEY DE MOURA
      * Date: 02/10/2023
      * Purpose: COBOL CALCULATOR
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. calculator.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-MODE                  PIC X(01).

       77 WS-NUM-1                 PIC 9(02).
       77 WS-NUM-2                 PIC 9(02).

       77 WS-RESULT                PIC 9(03).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            INITIALISE WS-MODE
                       WS-NUM-1
                       WS-NUM-2
                       WS-RESULT

            DISPLAY "------------------------------------------"
            DISPLAY "TYPE THE OPERATION TO BE CALCULATED:"
            DISPLAY "[1] ADDITION"
            DISPLAY "[2] SUBTRACTION"
            DISPLAY "[3] MULTIPLICATION"
            DISPLAY "[4] DIVISION"
            DISPLAY "------------------------------------------"
            ACCEPT WS-MODE

            DISPLAY "THE FIRST NUMBER: "
            ACCEPT WS-NUM-1

            DISPLAY "THE SECOND NUMBER: "
            ACCEPT WS-NUM-2


            EVALUATE WS-MODE
                   WHEN "1"
                       PERFORM PROC-ADD
                               THRU PROC-ADD-END
                   WHEN "2"
                       PERFORM PROC-SUB
                               THRU PROC-SUB-END
                   WHEN "3"
                       PERFORM PROC-DIV
                               THRU PROC-DIV-END
                   WHEN "4"
                       PERFORM PROC-MULT
                               THRU PROC-MULT-END
                   WHEN OTHER
                       DISPLAY "THE VALUE IS NOT VALID"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
            END-EVALUATE

                DISPLAY "------------------------------------------"
                DISPLAY "DO YOU WANT TO USE THE CALCULATOR AGAIN?"
                DISPLAY "[Y] TO CONTINUE USING THE CALCULATOR"
                DISPLAY "[ANY KEY] TO LEAVE"
                DISPLAY "------------------------------------------"
            ACCEPT WS-MODE

            EVALUATE WS-MODE
                   WHEN "Y"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
                   WHEN "y"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
                   WHEN OTHER
                       PERFORM PROC-ENC

            END-EVALUATE

            .
       MAIN-PROCEDURE-END.

       PROC-ADD.
            COMPUTE WS-RESULT = WS-NUM-1 + WS-NUM-2.
           DISPLAY "THE RESULT OF " WS-NUM-1 " + " WS-NUM-2
                                            " = " WS-RESULT.
       PROC-ADD-END.

       PROC-SUB.
            COMPUTE WS-RESULT = WS-NUM-1 - WS-NUM-2.
           DISPLAY "THE RESULT OF " WS-NUM-1 " - " WS-NUM-2
                                            " = " WS-RESULT.
       PROC-SUB-END.

       PROC-MULT.
            COMPUTE WS-RESULT = WS-NUM-1 * WS-NUM-2.
           DISPLAY "THE RESULT OF " WS-NUM-1 " * " WS-NUM-2
                                            " = " WS-RESULT.
       PROC-MULT-END.

       PROC-DIV.
            COMPUTE WS-RESULT = WS-NUM-1 / WS-NUM-2.
           DISPLAY "THE RESULT OF " WS-NUM-1 " / " WS-NUM-2
                                            " = " WS-RESULT.
       PROC-DIV-END.

       PROC-ENC.
            STOP RUN.
       END PROGRAM calculator.