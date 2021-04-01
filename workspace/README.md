# lab-nlp
Bienvenu dans l'espace lab nlp, équipé de GPU, de _pytorch_, _transformers_ et _sentence-tronsformers_.

Le container dans lequel vous travaillez à été génerer automatiquement à chaque release du [dépot](https://github.com/datalab-mi/lab-nlp). L'image docker est stockée [ici](https://github.com/orgs/datalab-mi/packages/container/package/lab-nlp).

# Consignes
Dans cet espace (`/workspace`), vous pouvez sauver des objets, fichiers, dossiers... Ils seront **synchronisés** dans un stockage objet ovh, à **la clôture** de votre job.

Point de montage :
- `/workspace/data` : contient les données d'entraînements, sorties de modèles...
- `/workspace/notebooks` : contient les notebooks. Si vous souhaitez protéger votre notebook, placez le dans un dossier qui porte votre nom.
