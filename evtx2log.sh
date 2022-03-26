#!/bin/bash
#
# GitHub : yakisyst3m 	
# 2022_03_26 v1.11
#
if [[ "$1" == '--help' ]] || [[ "$#" == 0 ]] ; then
	echo -e "\nAide pour utiliser la commande :\n"
        echo -e	"\t./evtx2Log.sh [dossier source chemin_evtx] [dossier destination chemin_log_to_export]\n"
fi



if [[ ! -d "$1" ]] ; then
	echo "Chemin source invalide"
	elif [[ ! -d "$2" ]]
	then
		echo -e "Chemin destination invalide \n"
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

exit 0
