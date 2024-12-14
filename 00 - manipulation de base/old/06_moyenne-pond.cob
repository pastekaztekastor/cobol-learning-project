       identification division.
       program-id. 06_moyenne_pond.

       data division.
       working-storage section.
       01 ws-table.
           05 ws-nombre    pic 99 occurs 5 times.
           05 ws-poid      pic 99 occurs 5 times.

       01 ws-moyen pic 99999v99 value 0.
       01 ws-somme-poid pic 999 value 0.
       01 i pic 9 value 0.

       procedure division.
           perform 1000-remplire-table
           display "table : " ws-table
           perform 1050-calcul-moyenne-pond
           display "moyenne pondéré = "ws-moyen
           goback.

       1000-remplire-table.
           perform varying i from 1 by 1 until i > 5
               display "nombre ?"
               accept ws-nombre(i)
               display "poid ?"
               accept ws-poid(i)
           end-perform
           .

       1050-calcul-moyenne-pond.
           perform varying i from 1 by 1 until i > 5
               compute ws-moyen = ws-moyen + (ws-nombre(i)*ws-poid(i))
               add ws-poid(i) to ws-somme-poid
           end-perform
           compute ws-moyen = ws-moyen / ws-somme-poid
           .
              