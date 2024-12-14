       identification division.
       program-id. 05_fonction_compute.

       data division.
       working-storage section.
       01 ws-table.
           05 ws-nombre    pic 99 value 0 occurs 5 times.
       01 ws-moyenne   pic 999v99 value 0.
       01 ws-medianne  pic 99v99 value 0.
       01 ws-min       pic 99 value 0.
       01 ws-max       pic 99 value 0.
       01 i            pic 9 value 1.

       procedure division.
           display "entrer 5 nombres"
           perform 1000-remplire-table
           display "Tableau : " ws-table
           perform 1050-calcul-moyenne
           perform 1100-calcul-max
           perform 1150-calcul-min
           perform 1200-calcul-med
           display "Moyenne : " ws-moyenne
           display "Médianne : " ws-medianne
           display "Min : " ws-min
           display "Max : " ws-max
           stop run.
           
       1000-remplire-table.
           perform varying i from 1 by 1 until i > 5
               display "element "i
               accept ws-nombre(i)
           end-perform 
           .

       1050-calcul-moyenne.
           move ws-nombre(1) to ws-moyenne
           perform varying i from 2 by 1 until i > 5
               compute ws-moyenne = ws-moyenne + ws-nombre(i)
           end-perform 
           compute ws-moyenne = ws-moyenne / 5
           .
           
       1100-calcul-max.
      *    move 0 to ws-max
      *    perform varying i from 1 by 1 until i > 5
      *        if ws-max < ws-nombre(i) 
      *            move ws-nombre(i) to ws-max
      *        end-if
      *    end-perform 
      *    .
           sort ws-nombre descending
           move ws-nombre(1) to ws-max
           .
       
       1150-calcul-min.
      *    perform 1100-calcul-max
      *    move ws-max to ws-min
      *    perform varying i from 1 by 1 until i > 5
      *        if ws-min > ws-nombre(i) 
      *            move ws-nombre(i) to ws-min
      *        end-if
      *    end-perform 
      *    .
           sort ws-nombre ascending
           move ws-nombre(1) to ws-min
           .
       
       1200-calcul-med.
           sort ws-nombre ascending
           move ws-nombre(3) to ws-medianne
           .
