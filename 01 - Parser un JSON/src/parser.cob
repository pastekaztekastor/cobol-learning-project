       IDENTIFICATION DIVISION.
       PROGRAM-ID. ParseJSON.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT JSON-FILE ASSIGN TO "test.json"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  JSON-FILE.
       01  JSON-RECORD   PIC X(1000).

       WORKING-STORAGE SECTION.
       01  WS-JSON-CONTENT   PIC X(10000) VALUE SPACES.
       01  WS-END-OF-FILE    PIC X VALUE 'N'.
       01  WS-KEYWORD        PIC X(7) VALUE '"elem1"'.
       01  WS-KEY-POS        PIC 9(5) VALUE 0.
       01  WS-VALUE-START    PIC 9(5) VALUE 0.
       01  WS-VALUE-END      PIC 9(5) VALUE 0.
       01  WS-ELEM1-VALUE    PIC X(50) VALUE SPACES.

       PROCEDURE DIVISION.
           OPEN INPUT JSON-FILE
           PERFORM UNTIL WS-END-OF-FILE = 'Y'
               READ JSON-FILE INTO JSON-RECORD
                   AT END
                       MOVE 'Y' TO WS-END-OF-FILE
                   NOT AT END
                       STRING WS-JSON-CONTENT DELIMITED BY SPACE
                              JSON-RECORD DELIMITED BY SIZE
                              INTO WS-JSON-CONTENT
               END-READ
               display WS-JSON-CONTENT
           END-PERFORM
           CLOSE JSON-FILE

           INSPECT WS-JSON-CONTENT
               TALLYING WS-KEY-POS FOR LEADING SPACES
               BEFORE INITIAL WS-KEYWORD

           IF WS-KEY-POS > 0
               ADD LENGTH OF WS-KEYWORD TO WS-KEY-POS
               ADD 2 TO WS-KEY-POS
               MOVE WS-KEY-POS TO WS-VALUE-START

               INSPECT WS-JSON-CONTENT
                   TALLYING WS-VALUE-END FOR CHARACTERS
                   AFTER INITIAL WS-KEYWORD
                   BEFORE INITIAL '"'

               SUBTRACT WS-VALUE-START FROM WS-VALUE-END
               ADD 1 TO WS-VALUE-END

               MOVE WS-JSON-CONTENT(WS-VALUE-START:WS-VALUE-END)
                   TO WS-ELEM1-VALUE

               DISPLAY "Valeur de elem1 : " WS-ELEM1-VALUE
           ELSE
               DISPLAY "Clé 'elem1' non trouvée dans le JSON."
           END-IF

           STOP RUN.
