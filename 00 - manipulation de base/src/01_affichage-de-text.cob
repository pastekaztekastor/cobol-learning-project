      ******************************************************************
      * Nom du Projet   : Affichage de texte simple
      * Description     : Affiche "Hello World, Mathurin" avec un variab
      *    le pour le nom.
      *
      * Date de création: 13/12/2024
      * Auteur          : Champémont Mathurin
      ******************************************************************
       identification division.
       program-id. 01_affichage-de-text.

       data division.
       working-storage section.
       01 ws-var pic x(8) value "Mathurin".

       procedure division.
       display "Hello World " ws-var
           goback.

