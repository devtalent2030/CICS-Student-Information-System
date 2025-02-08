       IDENTIFICATION DIVISION.
       PROGRAM-ID. UUMENF2A.
       AUTHOR. TALENT NTOTA.
       DATE-WRITTEN. 04/10/2024.
      *PROGRAM DESCRIPTION:
      *
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
       COPY MENSF2A.
      *
       LINKAGE SECTION.
      *
       01 DFHCOMMAREA                       PIC X.
      *
       PROCEDURE DIVISION.
      *
       000-MAIN.
      *
           EXEC CICS
               HANDLE CONDITION
                   MAPFAIL(100-FIRST-TIME)
           END-EXEC.
      *
           EXEC CICS
               RECEIVE MAP   ('MENMF2A')
                       MAPSET('MENSF2A')
           END-EXEC.
      *
           GO TO 200-MAIN-LOGIC.
      *
       100-FIRST-TIME.
      * SEND MAP AND RETURN CONTROL TO USER
           MOVE LOW-VALUES                  TO MENMF2AO.
      *
           EXEC CICS
               SEND MAP   ('MENMF2A')
                    MAPSET('MENSF2A')
                    ERASE
           END-EXEC.
      *
           EXEC CICS
               RETURN TRANSID('UF2A')
           END-EXEC.
      *
       200-MAIN-LOGIC.


           IF CHOICEI = '1'
                GO TO 300-CHOICE-ONE
           ELSE IF CHOICEI = '2'
                GO TO 400-CHOICE-TWO
           ELSE IF CHOICEI = '3'
                GO TO 500-CHOICE-THREE
           ELSE IF CHOICEI = '4'
                GO TO 600-CHOICE-FOUR
           ELSE IF CHOICEI = '9'
                GO TO 900-EXIT
           ELSE
                GO TO 700-INVALID-CHOICE
           END-IF.

      *
       300-CHOICE-ONE.

           MOVE LOW-VALUES                  TO MENMF2AO.
           MOVE 'CHOICE 1 IS NOT AVAILABLE' TO MSGO.

           EXEC CICS
               SEND MAP   ('MENMF2A')
                    MAPSET('MENSF2A')
           END-EXEC.

           EXEC CICS
               RETURN TRANSID('UF2A')
           END-EXEC.

       400-CHOICE-TWO.
           MOVE LOW-VALUES                  TO MENMF2AO.
           MOVE 'CHOICE 2 IS NOT READY'     TO MSGO.

           EXEC CICS
               SEND MAP   ('MENMF2A')
                    MAPSET('MENSF2A')
           END-EXEC.

           EXEC CICS
               RETURN TRANSID('UF2A')
           END-EXEC.


       500-CHOICE-THREE.
           MOVE LOW-VALUES                  TO MENMF2AO.
           MOVE 'CHOICE 3 IS BEING TESTED'  TO MSGO.

           EXEC CICS
               SEND MAP   ('MENMF2A')
                    MAPSET('MENSF2A')
           END-EXEC.

           EXEC CICS
               RETURN TRANSID('UF2A')
           END-EXEC.



       600-CHOICE-FOUR.
           MOVE LOW-VALUES                  TO MENMF2AO.
           MOVE 'CHOICE 4 IS NOT WORKING'   TO MSGO.

           EXEC CICS
               SEND MAP   ('MENMF2A')
                    MAPSET('MENSF2A')
           END-EXEC.

           EXEC CICS
               RETURN TRANSID('UF2A')
           END-EXEC.




       700-INVALID-CHOICE.
      *
           MOVE LOW-VALUES                  TO MENMF2AO.
      *
           MOVE 'INVALID INPUT - KC03F2A'
             TO MSGO.
      *
           EXEC CICS
               SEND MAP   ('MENMF2A')
                    MAPSET('MENSF2A')
           END-EXEC.
      *
           EXEC CICS
               RETURN TRANSID('UF2A')
           END-EXEC.



      *
       900-EXIT.
      *
           MOVE LOW-VALUES                  TO MENMF2AO.
      *
           MOVE 'APPLICATION ENDING'        TO MSGO.
      *
           EXEC CICS
               SEND MAP   ('MENMF2A')
                    MAPSET('MENSF2A')
           END-EXEC.
      *
           EXEC CICS
               RETURN
           END-EXEC.
      *
       END PROGRAM UUMENF2A.
