#!/bin/bash
#
# GitHub : yakisyst3m 	
# 2022_03_26 v1.11
#

rouge='\e[1;31m'
vert='\e[1;32m'
jaune='\e[1;33m'
bleu='\e[1;34m' 
violet='\e[1;35m'
neutre='\e[0;m'
souligne="\e[4m"

if [[ "$1" == '--help' ]] || [[ "$1" == "-h"  ]] || [[ "$#" == "0" ]] ; then
	echo -e "\n${souligne}Aide pour utiliser la commande :${neutre}"
	echo -e "** La recherche se déroule de façon récursive depuis le dossier source.\n"
        echo -e	"\t./evtx2Log.sh [dossier source chemin_evtx] [dossier destination chemin_log_to_export]\n"
fi



if [[ ! -d "$1" ]] ; then
	echo -e "${rouge}Chemin source invalide${neutre}\n"
	elif [[ ! -d "$2" ]]
	then
		echo -e "${rouge}Chemin destination invalide${neutre}\n"
fi

if [[ "$#" -ge 1 ]] && [[ -d "$1" ]] && [[ -d "$2"  ]] ; then
	# Renommage des logs
	sudo chmod -R 750 "$1"
	sudo chown -R $USER "$1"
	rename 's/\%4|\ /_/g' "$1"/* 

	# Recherche de tous les fichiers .evtx de façon récursive du dossier source + faire une liste dans /tmp/list
	find "$1" -name "*.evtx" -exec ls {} \; > /tmp/list

	# Conversion evtx en log
	for log in $(cat /tmp/list)
		do
		nomLog=$(basename "$log")			      # Récup du nom de fichier
		evtxexport -f text "$1"/"$nomLog" > "$2"/"$nomLog".log 2>/dev/null      # conversion .evtx vers .log
		done

	rm /tmp/list
fi

echo -e "${vert}[ OK ] - La recherche et le parsing est terminé, vos logs \".evtx\"ont été converti en \".log\"${neutre}"

exit 0
