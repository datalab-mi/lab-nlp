# lab-nlp
_Dépot qui permet de construire une image docker boîte à outil en NLP, avec une sur-couche ovh pour profiter du service ai-training (notebook, gestion mémoire...)._

# Prérequis

- Avoir des identifiants de connexion à ovh ai training

- Installer la [CLI ovh](https://docs.ovh.com/gb/en/ai-training/install-client/).

- Installer Make pour makefile

- Installer [docker](https://docs.docker.com/engine/install/)


# Fonctionnement

En tant qu'utilisateur:

1. Lancer un job (= 1 container): `make deploy-job`

2. Voir les logs et les jobs en cours [(docs)](https://docs.ovh.com/gb/en/ai-training/usage-client/). Par exemple, suivre le lien url de `ovhai job list`

3. Arrêter le job (Pour ne pas faire exploser la facturation) `ovhai job stop <id>`
