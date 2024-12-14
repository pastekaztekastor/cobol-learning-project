       identification division.
       program-id. exo04.

       data division.
       working-storage section.
       01 ws-nombre    pic 9(2) value 0.
       01 ws-resultat  pic 9(4) value 0.
       01 ws-fin       pic X value 'y'.

       procedure division.
           perform until ws-fin = 'n'
               display 'Entrer un nombre à 2 chiffre :'
               accept ws-nombre
               compute ws-resultat = ws-nombre * ws-nombre
               display 'Le carré de 'ws-nombre' est 'ws-resultat
               display "Continuer ? [Y/n]"
               accept ws-fin
           end-perform
       stop run.
       