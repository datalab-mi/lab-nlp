# lab-nlp
Bienvenue dans l'espace lab nlp, équipé de GPU, de _pytorch_, _transformers_ et _sentence-tronsformers_.

Le container dans lequel vous travaillez à été géneré automatiquement à chaque push sur main du [dépot](https://github.com/datalab-mi/lab-nlp). L'image docker est stockée [ici](https://github.com/orgs/datalab-mi/packages/container/package/lab-nlp).

# Consignes
Dans cet espace (`/workspace`), vous pouvez sauver des objets, fichiers, dossiers... Ils seront **synchronisés** dans un stockage objet ovh, à **la clôture** de votre job.

Point de montage :
- `/workspace/data` : contient les données d'entraînements, sorties de modèles...
- `/workspace/notebook` : contient les notebooks. Si vous souhaitez protéger votre notebook, placez le dans un dossier qui porte votre nom.


# Références

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


# Les modèles Seq2seq 

Les modèles Seq2Seq sont des réseaux de neurones qui transforment une séquences d'éléments (ex: les mots d'une phrase) en une autre séquence. 

Ce type de modèle est performant en traduction où une séquence de mots en une langue est transformée en une séquence de mots d'une autre langue.

![Schéma seq2seq](https://miro.medium.com/max/1600/1*5QBBmJ8QIh6R2bEHXrPvdg.png)

Les modèles seq2seq sont constuits sur la base d'un Encoder et d'un Decoder.
1. L'encoder prend l'input (ex : une phrase) et le transforme en un vecteur en *n* dimensions. 
2. Ce vecteur est envoyé vers le décodeur qui le transforme en un output (ex : une phrase dans une autre langue).


Ce type de modèles a été introduit en 2014 et propulsé en 2015 avec la construction de la notion d'*attention*.
Les LSTM (Long-Short-Term-Memory) font partie de ces modèles. 



## Le mécanisme d'attention

Cette architecture d'encodeur-décodeur est performante dans de nombreuses applications. Elle impose néanmoins une contrainte très forte : les séquences doivent être encodées sous la forme d'un vecteur de taille fixe ! 

L'idée derrière le mécanisme d'attention est de "libérer" l'architecture encodeur / décodeur de cette contrainte. Comment ? En apprenant au modèle à reconnaitre les éléments de la séquence les plus importants (attention sélective).



## Le mécanisme des Seq2seq à base de RNN
Le site [Analytics Vidhya](https://www.analyticsvidhya.com/blog/2019/06/understanding-transformers-nlp-state-of-the-art-models/) résume les grandes étapes de ce type de modèles.

Exemple : traduction d'une phrase de l'anglais vers l'allemand.

![Mécanisme seq2seq](https://cdn.analyticsvidhya.com/wp-content/uploads/2019/06/seq2seq.gif)


1. L'encodeur est un RNN. Le décodeur est un RNN.
2. A chaque étape de l'encoding, le RNN prend le vecteur d'un mot x_i de la phrase et un état caché (*hidden stage*) Hi de l'étape précédente (le fonctionnement est séquentiel/temporel). 
3. Le *hidden state* est mis à jour à chaque étape. L'*hidden state* de l'étape précédente est appelé le contexte (*context vector*). Il contient les informations sur la phrase initiale. 
4. Ce *context vector* est passé au décodeur pour générer la phrase de sortie. Si il y a un mécanisme d'attention, alors le contexte est en fait une somme pondérée des *hidden states*. 


## Les limites des seq2seq type LSTM

1. Le sujet des phrases longues, même en utilisant le concept d'attention, est toujours un problème. 
2. La nature séquentielle de ce types de modèles empêche la parallélisation. C'est là que se situe le gros avantage des Transformers.


## Ressources sur le LSTM
* [Du RNN au LSTM](https://blog.octo.com/les-reseaux-de-neurones-recurrents-des-rnn-simples-aux-lstm/)




# Les transformers

Les transformers ont pour ambition de résoudre les limites des seq2seq en conservant l'idée de dépendance entre l'input et l'output. L'article introduisant les LSTM est [Attention is all you need](https://arxiv.org/abs/1706.03762)

## L'apport du BERT de Google AI
La puissance du framework BERT réside dans l'utilisation de modèles pré-entraînés puis fine-tunés pour créer des modèles adaptés à un large panel de tâches en NLP : question-réponse, analyse de sentiments, etc.

BERT, pour *Bidirectional Encoder representations from transformers*, utilise un encodeur de type transformeur bi-directionnel et multicouche. BERT est pré-entraîné à la réalisation de 2 tâches non supervisées : 
* *Masked language modeling* (MLM) : une partie des inputs de la séquece est cachée à l'apprentissage pour que le modèle apprenne à les deviner uniquement à partir du contexte. Contrairement aux modèles séquentiels précédents, le contexte est issu de mots provenant des deux côtés.

* *Next sentence prediction* (NSP) : BERT capture la relation entre deux phrases qui se suivent en apprenant à partir de paires de phrases.


## Ressources sur les transformers et BERT
* [Transformers paper : Attention is all you need](https://arxiv.org/abs/1706.03762))
* [Blog analytics vidhya](https://www.analyticsvidhya.com/blog/2019/06/understanding-transformers-nlp-state-of-the-art-models/)
* [BERT paper](https://arxiv.org/pdf/1810.04805.pdf)
* [BERT explained](https://towardsdatascience.com/bert-explained-state-of-the-art-language-model-for-nlp-f8b21a9b6270)
* [SBERT  paper](https://arxiv.org/pdf/1908.10084.pdf)

