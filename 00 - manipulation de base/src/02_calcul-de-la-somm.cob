      ******************************************************************
      * Nom du Projet   : Calcul de la somme de deux nombres
      * Description     : Demande deux nombre et retourne la somme des d
      *    eux
      *
      * Date de création: 13/12/2024
      * Auteur          : Champémont Mathurin
      ******************************************************************
       identification division.
       program-id. 02_calcul-de-la-somm.

       data division.
       working-storage section.
       01 ws-nombre-1 pic 99.
       01 ws-nombre-2 pic 99.
       01 ws-resulta pic 999.

       procedure division.
       display "Nombre 1 :"
       accept ws-nombre-1
       display "Nombre 2 :"
       accept ws-nombre-2
       compute ws-resulta = ws-nombre-1 + ws-nombre-2
       display ws-nombre-1" + "ws-nombre-2" = "ws-resulta
           goback.

