#!/bin/bash

# Répertoire source et répertoire pour les exécutables
SRC_DIR="src"
EXE_DIR="exe"
SRC_FCT_DIR="src/sous-programmes"
EXE_FCT_DIR="exe/sous-programmes"

LISTE_FCT=""

# Vérification si les répertoires existent
if [ ! -d "$SRC_DIR" ]; then
  echo "Erreur : Le répertoire source ($SRC_DIR) n'existe pas."
  exit 1
fi
# if [ ! -d "$SRC_FCT_DIR" ]; then
#   echo "Erreur : Le répertoire source ($SRC_FCT_DIR) n'existe pas."
#   exit 1
# fi

if [ ! -d "$EXE_DIR" ]; then
  echo "Création du répertoire des exécutables ($EXE_DIR)."
  mkdir -p "$EXE_DIR"
fi
# if [ ! -d "$EXE_FCT_DIR" ]; then
#   echo "Création du répertoire des exécutables ($EXE_FCT_DIR)."
#   mkdir -p "$EXE_FCT_DIR"
# fi

# # Lister toutes les foncitons dans le répertoire fonciton
# FILES=($(ls "$SRC_FCT_DIR"/*.cob 2>/dev/null))
# if [ ${#FILES[@]} -eq 0 ]; then
#   echo "Aucun fichier COBOL trouvé dans le répertoire source ($SRC_FCT_DIR)."
#   exit 0
# fi

# # Compiler toutes les fonctions
# echo "COMPILATION DES FONCITONS/SOUS-PROGRAMMES"
# for FILE in ${FILES[@]}; do
#   BASENAME=$(basename "$FILE" .cob)
#   EXE_FILE="$EXE_FCT_DIR/$BASENAME.exe"

#   echo "Compilation du fichier : $FILE"
#   cobc -w -c -o "$EXE_FILE" "$FILE"

#   LISTE_FCT="$LISTE_FCT $EXE_FILE"

#   if [ $? -ne 0 ]; then
#     echo "Erreur : Échec de la compilation du fichier $FILE."
#     exit 1
#   fi
# done

# Lister tous les fichiers COBOL dans le répertoire source
FILES=($(ls "$SRC_DIR"/*.cob 2>/dev/null))
if [ ${#FILES[@]} -eq 0 ]; then
  echo "Aucun fichier COBOL trouvé dans le répertoire source ($SRC_DIR)."
  exit 0
fi

# Vérifier si un paramètre a été passé
if [ $# -eq 1 ]; then
  if [[ $1 =~ ^[0-9]+$ ]] && [ $1 -le ${#FILES[@]} ] && [ $1 -ge 1 ]; then
    INDEX=$(($1 - 1))
    FILE=${FILES[$INDEX]}
    BASENAME=$(basename "$FILE" .cob)
    EXE_FILE="$EXE_DIR/$BASENAME.exe"

    echo "Compilation du fichier : $FILE"
    cobc -x -o "$EXE_FILE" "$FILE"

    if [ $? -ne 0 ]; then
      echo "Erreur : Échec de la compilation du fichier $FILE."
      exit 1
    fi

    echo "Exécution de : $EXE_FILE"
    ./$EXE_FILE

    if [ $? -ne 0 ]; then
      echo "Erreur : Échec de l'exécution de $EXE_FILE."
      exit 1
    fi

    echo "Le fichier spécifié a été compilé et exécuté avec succès."
    exit 0
  else
    echo "Erreur : Paramètre invalide. Veuillez fournir un chiffre entre 1 et ${#FILES[@]} correspondant à un fichier."
    exit 1
  fi
fi

# Compilation de chaque fichier COBOL
echo "COMPILATION DES PROGRAMMES"
for FILE in ${FILES[@]}; do
  BASENAME=$(basename "$FILE" .cob)
  EXE_FILE="$EXE_DIR/$BASENAME.exe"

  echo "Compilation du fichier : $FILE"
  cobc -w -x -o "$EXE_FILE" "$FILE"

  if [ $? -ne 0 ]; then
    echo "Erreur : Échec de la compilation du fichier $FILE."
    exit 1
  fi

done

# Exécution des fichiers compilés
echo "EXECUTION DES PROGRAMMES"
for FILE in ${FILES[@]}; do
  BASENAME=$(basename "$FILE" .cob)
  EXE_FILE="$EXE_DIR/$BASENAME.exe"

  echo "Exécution de : $EXE_FILE"
  ./$EXE_FILE

  if [ $? -ne 0 ]; then
    echo "Erreur : Échec de l'exécution de $EXE_FILE."
    exit 1
  fi

done

echo "Tous les fichiers ont été compilés et exécutés avec succès."