#!/bin/bash
# ::::::::::::::
# test_bert.sh
# ::::::::::::::

# Need to specify trained classifier to be used based on last (=best) model created during training
# Use a trained model to classify test data
# First, get id of trained classifier model from checkpoint file.
MODEL=$(sed -n 's/^model_checkpoint_path.*"\(.*\)"/\1/p' bert_output/checkpoint)

export TRAINED_CLASSIFIER="./bert_output/$MODEL"
export BERT_BASE_DIR=./multi_cased_L-12_H-768_A-12

echo "Using model: $TRAINED_CLASSIFIER  on top of BERT base $BERT_BASE_DIR"

python run_multilabels_classifier.py \
--task_name=multilabel \
--do_predict=true \
--data_dir=./data \
--vocab_file=$BERT_BASE_DIR/vocab.txt \
--bert_config_file=$BERT_BASE_DIR/bert_config.json \
--init_checkpoint=$TRAINED_CLASSIFIER \
--max_seq_length=128 \
--output_dir=./bert_output/
