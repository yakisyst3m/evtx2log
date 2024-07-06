#!/bin/bash
#
# GitHub : yakisyst3m 	
# 2024_07_06 v0.01
#

rouge='\e[1;31m'
vert='\e[1;32m'
jaune='\e[1;33m'
bleu='\e[1;34m'
violet='\e[1;35m'
neutre='\e[0;m'
souligne="\e[4m"

if [[ "$1" == '--help' || "$1" == "-h" || "$#" == "0" ]]; then
    echo -e "\n${souligne}Aide pour utiliser la commande :${neutre}"
    echo -e "** La recherche se déroule de façon récursive depuis le dossier source.\n"
    echo -e "\t./evtx2Xml.sh [dossier source chemin_evtx] [dossier destination chemin_xml_to_export]\n"
    exit 0
fi

if [[ ! -d "$1" ]]; then
    echo -e "${rouge}Chemin source invalide${neutre}\n"
    exit 1
elif [[ ! -d "$2" ]]; then
    echo -e "${rouge}Chemin destination invalide${neutre}\n"
    exit 1
fi

if [[ "$#" -ge 1 ]] && [[ -d "$1" ]] && [[ -d "$2" ]]; then
    # Renommage des logs
    sudo chmod -R 750 "$1"
    sudo chown -R $USER "$1"
    rename 's/\%4|\ /_/g' "$1"/*

    # Recherche de tous les fichiers .evtx de façon récursive du dossier source + faire une liste dans /tmp/list
    find "$1" -name "*.evtx" -exec ls {} \; > /tmp/list

    # Conversion evtx en xml
    for log in $(cat /tmp/list); do
        nomLog=$(basename "$log")  # Récup du nom de fichier
        evtxexport -f xml "$1"/"$nomLog" > "$2"/"$nomLog".xml 2>/dev/null  # conversion .evtx vers .xml
    done

    rm /tmp/list
fi

echo -e "${vert}[ OK ] - La recherche et le parsing est terminé, vos logs \".evtx\" ont été convertis en \".xml\"${neutre}"

exit 0
