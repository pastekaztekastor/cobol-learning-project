      ******************************************************************
      * Nom du Projet   : Conversion Celsius-Fahrenheit
      * Description     : Convertie les degres celsius en fahrenheit jus
      *    qu'a ce qu'on lui dise de ne plus le faire
      *
      * Date de création: 13/12/2024
      * Auteur          : Champémont Mathurin
      ******************************************************************
       identification division.
       program-id. 03_conversion-celsiu.

       data division.
       working-storage section.
       01 ws-fin pic x value 'y'.
       01 ws-cel pic s99v99.
       01 ws-far pic s99v99.

       procedure division.
       perform until ws-fin = 'n'
           display "Celsius : "
           accept ws-cel
           compute ws-far = ws-cel * (9/5) + 32
           display "Fahrenheit : "ws-far
           display "Continue ? [Y/n]"
           accept ws-fin
           end-perform
           goback.

