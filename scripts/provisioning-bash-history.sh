#! /bin/bash

shopt -s histappend 
# Ne pas enregistrer les commandes qui commencent par un espace
export HISTCONTROL="ignorespace"
# Ne pas afficher les commandes dupliquées qui se suivent
export HISTCONTROL="ignoredups"
# A le même effet que les deux commandes précédente
export HISTCONTROL="ignoreboth"
# Supprime toutes les commandes dupliquées (même celles qui ne se suivent pas)
export HISTCONTROL="erasedups"
# Efface les commandes dupliquées, n'enregistre pas les commandes qui commencent par un espace
export HISTCONTROL="erasedups:ignorespace"
export HISTSIZE = 1000
export HISTFILESIZE = 10000
# On ignore les commandes ls et cd de l'historique
export HISTIGNORE="ls*:cd*"