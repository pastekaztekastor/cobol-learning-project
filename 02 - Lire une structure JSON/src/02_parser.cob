       IDENTIFICATION DIVISION.
       PROGRAM-ID. ParseJSON.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT json_file ASSIGN TO "src/data.json"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD json_file
       01 json_lecture     PIC X(1000).

       working-storage section.
       01 json_contenu     PIC X(1000).
           05 jscnt_id     PIC 9(2).
           05 jscnt_nom    PIC X(20).
           05 jscnt_prenom PIC X(20).
           05 jscnt_dep    PIC X(20).
           05 jscnt_rol    PIC X(20).

       01 char_debut       PIC 9(4).
       01 longeur          PIC 9(2).

       01 fin_fichier      PIC X value 'N'
       
       procedure division.
      
      * Lecture du fichier 
           open input json_file                                         
           perform until fin_fichier = 'Y'
               read json_file into json_lecture
                   at end 
                       move 'Y' to fin_fichier
                   not at end
                       string json_contenu delimited by space
                              json_lecture delimited by size
                              into json_contenu
                       end-string
               end-read
           end-perform

      * Récupération des variables
      * variable Id
       inspect json_contenu tallying char_debut for all '"id":'


                       



