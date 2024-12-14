#!/bin/bash

# Tableau des noms de projets
projets=(
  "Affichage de texte simple"
  "Calcul de la somme de deux nombres"
  "Conversion Celsius-Fahrenheit"
  "Vérification de la parité"
  "Calcul de la factorielle"
  "Inversion d'une chaîne de caractères"
  "Recherche du plus grand nombre"
  "Tri à bulles"
  "Calcul du nombre de voyelles"
  "Vérification de palindrome"
  "Conversion numérique en mots"
  "Calcul de la moyenne"
  "Recherche dichotomique"
  "Calcul des nombres premiers"
  "Simulation d'une file d'attente"
  "Calcul de la suite de Fibonacci"
  "Conversion de bases numériques"
  "Gestion d'un carnet d'adresses"
  "Analyse de texte"
  "Calcul de l'écart-type"
  "Gestion des stocks"
  "Calculatrice basique"
  "Gestion des étudiants"
  "Système de paie"
  "Gestion des prêts de bibliothèque"
  "Analyse des ventes"
  "Planification des rendez-vous"
  "Jeu du nombre mystère"
  "Gestion des réservations"
  "Système bancaire simplifié"
)

# Fonction pour supprimer les accents
supprimer_accents() {
  echo "$1" | iconv -f UTF-8 -t ASCII//TRANSLIT | sed 's/[^a-zA-Z0-9 -]//g'
}

# Création des fichiers avec en-tête personnalisé
for i in "${!projets[@]}"; do
  # Numéro du projet avec zéro initial pour les numéros inférieurs à 10
  num=$(printf "%02d" $((i + 1)))
  # Remplacement des espaces par des tirets et conversion en minuscules
  nom_fichier=$(echo "${projets[$i]}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  # Supprimer les accents et caractères non désirés
  nom_fichier=$(supprimer_accents "$nom_fichier")
  # Troncature du nom pour ne pas dépasser 20 caractères
  nom_fichier=$(echo "$nom_fichier" | cut -c1-17)
  # Suppression des tirets en début ou fin de chaîne
  nom_fichier=$(echo "$nom_fichier" | sed 's/^-*//;s/-*$//')
  # Ajout du préfixe numérique et de l'extension
  mon_programme="${num}_${nom_fichier}"
  nom_fichier="${num}_${nom_fichier}.cob"
  
  # Vérification si le fichier existe
  if [[ -e "$nom_fichier" ]]; then
    echo "Le fichier existe déjà : $nom_fichier (aucune modification apportée)"
    continue
  fi

  # Création du fichier avec en-tête
  {
    echo "      ******************************************************************"
    echo "      * Nom du Projet   : ${projets[$i]}"
    echo "      * Description     : "
    echo "      *"
    echo "      * Date de création: $(date +%d/%m/%Y)"
    echo "      * Auteur          : Champémont Mathurin"
    echo "      ******************************************************************"
    echo "       identification division."
    echo "       program-id. ${mon_programme}."
    echo ""
    echo "       data division."
    echo "       working-storage section."
    echo ""
    echo "       procedure division."
    echo "           goback."
    echo ""
  } > "$nom_fichier"
  echo "Fichier créé : $nom_fichier"
done
