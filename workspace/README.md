# lab-nlp
Bienvenu dans l'espace lab nlp, équipé de GPU, de _pytorch_, _transformers_ et _sentence-tronsformers_.

Le container dans lequel vous travaillez à été génerer automatiquement à chaque push sur main du [dépot](https://github.com/datalab-mi/lab-nlp). L'image docker est stockée [ici](https://github.com/orgs/datalab-mi/packages/container/package/lab-nlp).

# Consignes
Dans cet espace (`/workspace`), vous pouvez sauver des objets, fichiers, dossiers... Ils seront **synchronisés** dans un stockage objet ovh, à **la clôture** de votre job.

Point de montage :
- `/workspace/data` : contient les données d'entraînements, sorties de modèles...
- `/workspace/notebook` : contient les notebooks. Si vous souhaitez protéger votre notebook, placez le dans un dossier qui porte votre nom.


# Références

[Sbert paper](https://arxiv.org/pdf/1908.10084.pdf)

## NLI (Natural Language Inference)
Étant donné 2 phrases, la tâche NLI consiste à décider si la première phrase entraîne la seconde, la contredit ou est neutre.
Les datasets de réferences sont SNLI et MultiNLI.

## Semantic Textual Similarity
Étant donné 2 phrases, la tâche STS consiste à scorer la similarité sémantique entre 2 phrases, selon 5 degrés. 5 = équivalent, 0=complètement different.
STS benchmark dataset 8628 pairs de phrases, tiré de la presse, de forum et de sous-titre.

## Semantic search
La recherche sémantique consiste à répondre à une requête utilisateur en s'appuyant sur une base de connaissance. Le corpus est découpé en petit bouts (paragraphes...) puis est plongé dans un espace vectoriel. On applique aussi ce plongement lexical à la requête. Enfin, on cherche l'élément le plus proche de la requête, pour fournir une réponse à l'utilisateur.
Il faut distinguer 2 approches:
1. Recherche symétrique: longueur requête ~= entrée du corpus
Entraînement avec Quora dataset.
2. Recherche asymétrique: longueur requête < entrée du corpus
Entraînement avec msmarco ou [Natural Questions](https://ai.google.com/research/NaturalQuestions/visualization) datasets.
