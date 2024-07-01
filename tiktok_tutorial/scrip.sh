#!/bin/bash

DB_NAME="BD_ESGI3"
DB_USER="root"
DB_PASS="votre_mot_de_passe"

function connect_mysql {
    mysql -u $DB_USER -p$DB_PASS $DB_NAME
}

function Client {
    local nom="$1"
    local mot_de_passe="$2"
    connect_mysql -e "SELECT * FROM client WHERE nom='$nom' AND mot_de_passe='$mot_de_passe';"
}

function Commande {
    local ref_commande="$1"
    connect_mysql -e "SELECT * FROM commande WHERE ref_commande='$ref_commande';"
}

function menu {
    echo "Choisissez une option:"
    echo "1. Rechercher un client"
    echo "2. Rechercher une commande"
    echo "3. Quitter"
    read -p "Votre choix : " choix

    case $choix in
        1)
            read -p "Entrez le nom du client : " nom
            read -sp "Entrez le mot de passe du client : " mot_de_passe
            echo ""
            Client "$nom" "$mot_de_passe"
            ;;
        2)
            read -p "Entrez la référence de la commande : " ref_commande
            Commande "$ref_commande"
            ;;
        3)
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Choix invalide. Réessayez."
            menu
            ;;
    esac
}

menu
