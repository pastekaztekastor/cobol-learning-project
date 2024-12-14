      ******************************************************************
      * Nom du Projet   : Inversion d'une chaîne de caractères
      * Description     : 
      *
      * Date de création: 13/12/2024
      * Auteur          : Champémont Mathurin
      ******************************************************************
       identification division.
       program-id. 06_inversion-dune-ch.

       data division.
       working-storage section.
       01 ws-chaine pic x(20) value "Ceci est une chaine."

       procedure division.
           display "chaine :" ws-chaine
           reversed()
           goback.

