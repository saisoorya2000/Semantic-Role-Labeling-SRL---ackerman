#!/usr/bin/env bash
SRLPATH="data/srl"
TAGGERPATH="."
DATAPATH="data/srl"
EMBPATH="data/glove"
DEVICE=[0]

export PYTHONPATH=$TAGGERPATH:$PYTHONPATH
export PERL5LIB="$SRLPATH/lib:$PERL5LIB"
export PATH="$SRLPATH/bin:$PATH"

python $TAGGERPATH/tagger/bin/trainer.py \
  --model deepatt \
  --input $DATAPATH/conll2012.train.txt \
  --output train \
  --vocabulary $DATAPATH/deep_srl/word_dict $DATAPATH/deep_srl/label_dict \
  --parameters="save_summary=false,feature_size=100,hidden_size=200,filter_size=800,"`
               `"residual_dropout=0.2,num_hidden_layers=10,attention_dropout=0.1,"`
               `"relu_dropout=0.1,batch_size=8196,optimizer=adadelta,initializer=orthogonal,"`
               `"initializer_gain=1.0,train_steps=600000,"`
               `"learning_rate_schedule=piecewise_constant_decay,"`
               `"learning_rate_values=[1.0,0.5,0.25,],"`
               `"learning_rate_boundaries=[400000,50000],device_list=$DEVICE,"`
               `"clip_grad_norm=1.0,embedding=$EMBPATH/glove.6B.100d.txt,script=run.sh"
