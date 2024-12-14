       identification division.
       program-id. 07_fonciton-nombre-triangle.

       data division.
       working-storage section.
       01 ws-nombre    pic 9 value 0.
       01 ws-resulta   pic 99 value 0.

       procedure division.
           display "Nombre : "
           accept ws-nombre
           call SPTRIGL using ws-nombre returning ws-resu
      -    lta
           display "Triangle : " ws-resulta
           goback.
