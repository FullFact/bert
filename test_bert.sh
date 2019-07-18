# ::::::::::::::
# test_bert.sh
# ::::::::::::::

# Use a trained model to classify test data

# Need to specify trained classifier to be used based on last (=best) model created during training
export TRAINED_CLASSIFIER=./bert_output/model.ckpt-231
export BERT_BASE_DIR=./multi_cased_L-12_H-768_A-12


python run_multilabels_classifier.py \
--task_name=multilabel \
--do_predict=true \
--data_dir=./data \
--vocab_file=$BERT_BASE_DIR/vocab.txt \
--bert_config_file=$BERT_BASE_DIR/bert_config.json \
--init_checkpoint=$TRAINED_CLASSIFIER \
--max_seq_length=128 \
--output_dir=./bert_output/
