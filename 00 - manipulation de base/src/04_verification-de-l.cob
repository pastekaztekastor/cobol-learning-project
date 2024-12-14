      ******************************************************************
      * Nom du Projet   : Vérification de la parité
      * Description     : 
      *
      * Date de création: 13/12/2024
      * Auteur          : Champémont Mathurin
      ******************************************************************
       identification division.
       program-id. 04_verification-de-l.

       data division.
       working-storage section.
       01 ws-nombre pic 9(5) value 0.
       01 ws-modulo pic 9 value 0.

       procedure division.
           display 'Veuillez saisir un nombre : '
           accept ws-nombre
           compute ws-modulo = function mod(ws-nombre 2)
           if ws-modulo = 0 then
              display 'pair'
           else
              display 'impair'
           end-if
           
           goback .
