# Semantic Role Labelling ( English ) 

Semantic Role Labeling is a task based on identifying the role of a word or a group of words in a sentence. Semantic role labeling is a very useful idea and is used intrinsically in a number of downstream tasks such as question-answering, inference, knowledge graph creation and participant detection.

## A Span Selection Model for Semantic Role Labeling​

### Abstract

A simple and accurate span-based model that considers all possible argument spans and scores them for each label.​ Provides enough room for us to design and exploit the span-level features, that are difficult to use in token-based BIO tagging approaches.​ [Paper](https://arxiv.org/abs/1810.02245)

Our complete code is in the [span_srl.ipynb](https://github.com/saisoorya2000/Semantic-Role-Labeling-SRL---ackerman/blob/main/span_selection_model/span_srl.ipynb) file and you can check our results in the output [log file](https://github.com/saisoorya2000/Semantic-Role-Labeling-SRL---ackerman/blob/main/span_selection_model/results/outputstats.txt)

### Prerequisites

* Python 3
* Theano
* h5py

### Parameters set for the training model

1. No. of BiLSTM layers = 4
2. Batch size = 32
3. drop_rate = 0.1
4. hidden_dim  = 300 (The hidden layer dimension in the BiLSTM) 
5. Adam optimizer

## Deep Semantic Role Labeling with Self-Attention

### Abstract

End-to-end SRL with recurrent neural networks (RNN) has gained increasing attention. However, it remains a major challenge for RNNs to handle structural information and long range dependencies. This model is based on self-attention which can directly capture the relationships between two tokens regardless of their distance. 

We preprocessed the data as said in the paper, the GloVe embeddings and srlconll scripts generated using the file [fetch_required_data.sh](https://github.com/saisoorya2000/Semantic-Role-Labeling-SRL---ackerman/blob/main/deep_semantic_role_labelling/data_processing/fetch_required_data.sh). After preprocessing the data by following the procedures, the processed data has the following format:

```
2 My cats love hats . ||| B-A0 I-A0 B-V B-A1 O
```

### Prerequisites

* Python 3
* PyTorch
* TensorFlow-2.0 (CPU version)
* GloVe embeddings and srlconll scripts

### Parameters set for the training model

1. No. of hidden layers = 10
2. Batch size = 8196
3. drop_rate = 0.2
4. hidden_dim  = 200 (The hidden layer dimension in the BiLSTM) 
5. adadelta optimizer
6. After training 400K steps, we halve the learning rate every 100K steps.
7. feature_size = 100

## Results

All the results and experiments done in the context of both the papers are presented in a detailed manner in the project report.​

## Dataset

We have used the CoNLL-2012 dataset that is extracted from the OntoNotes v5.0 corpus.Since the files in the selected dataset were in _skel files, we have used centain scripts to convert them into _conll format. 

Data that we used can be found in this [Link](https://drive.google.com/drive/folders/1YRzFhwzPmxISgB-Ub7h60nkpW6xMYk1b?usp=sharing).