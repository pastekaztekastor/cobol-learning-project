       IDENTIFICATION DIVISION.
       PROGRAM-ID. ParseJSON.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT JSON-FILE ASSIGN TO "src/data.json"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  JSON-FILE.
       01  JSON-RECORD   PIC X(1000).

       WORKING-STORAGE SECTION.
       01  WS-JSON-CONTENT   PIC X(100) VALUE SPACES.
       01  WS-END-OF-FILE    PIC X VALUE 'N'.
       01  WS-KEYWORD        PIC X(9) VALUE '"elem1":"'.
       01  GUILLEMET         PIC X VALUE '"'.
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
                       STRING WS-JSON-CONTENT DELIMITED BY SPACES
                              JSON-RECORD DELIMITED BY SIZE
                              INTO WS-JSON-CONTENT
               END-READ
           END-PERFORM
           CLOSE JSON-FILE

           display WS-JSON-CONTENT
           INSPECT WS-JSON-CONTENT 
               TALLYING WS-KEY-POS FOR ALL WS-KEYWORD.
           
           display WS-KEY-POS" occurance de " WS-KEYWORD 

           IF WS-KEY-POS > 0
               ADD LENGTH OF WS-KEYWORD TO WS-KEY-POS
               ADD 1 TO WS-KEY-POS
               MOVE WS-KEY-POS TO WS-VALUE-START

               INSPECT WS-JSON-CONTENT
                   TALLYING WS-VALUE-END FOR characters
                   after initial WS-KEYWORD
                   before initial '"'
               
               display "début "WS-VALUE-START" longeur "WS-VALUE-END

               MOVE WS-JSON-CONTENT(WS-VALUE-START:WS-VALUE-END)
                   TO WS-ELEM1-VALUE

               DISPLAY "Valeur de elem1 : " WS-ELEM1-VALUE
           ELSE
               DISPLAY "Clé 'elem1' non trouvée dans le JSON."
           END-IF

           STOP RUN.
