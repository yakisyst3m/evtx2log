# Convertir les journaux .evtx en .log lisibles
![GitHub last commit](https://img.shields.io/github/last-commit/yakisyst3m/evtx2log) ![GitHub release-date](https://img.shields.io/github/release-date/yakisyst3m/evtx2log)

Pré-requis : Veuiller installer "exiftool" + rename :
```
sudo apt install rename libevtx-utils -y
```
#

:radio_button:  Convert EVTX files in TEXT files :
```
sudo ./evtx2log.sh <dossier source chemin_evtx> <dossier destination chemin_destination>
```
- Le programme fait une recherche récurive à partir du dossier source, donc pas besoin d'aller jusqu'au chemin où se trouve les ".evtx".
- The program does a recursive search from the source folder, so no need to go to the path where the ".evtx" are located.  

 #
:radio_button:  Convert EVTX files in XML files :
```
sudo ./evtx2xml.sh <dossier source chemin_evtx> <dossier destination chemin_destination>
```
- Le programme fait une recherche récurive à partir du dossier source, donc pas besoin d'aller jusqu'au chemin où se trouve les ".evtx".
- The program does a recursive search from the source folder, so no need to go to the path where the ".evtx" are located.
