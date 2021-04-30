#!/usr/bin/env basih
SRLPATH="data/srl"
TAGGERPATH="."
DATAPATH="data/srl"
EMBPATH="data/glove"
DEVICE=0

export PYTHONPATH=$TAGGERPATH:$PYTHONPATH
export PERL5LIB="$SRLPATH/lib:$PERL5LIB"
export PATH="$SRLPATH/bin:$PATH"

python $TAGGERPATH/tagger/bin/predictor.py \
  --input $DATAPATH/conll2012.test.txt \
  --checkpoint train/best \
  --model deepatt \
  --vocab $DATAPATH/deep_srl/word_dict $DATAPATH/deep_srl/label_dict \
  --parameters=device=$DEVICE,embedding=$EMBPATH/glove.6B.100d.txt \
  --output tmp.txt
