# Sentence A and Sentence B are separated by the ||| delimiter for sentence
# pair tasks like question answering and entailment.
# For single sentence inputs, put one sentence per line and DON'T use the
# delimiter.


export BERT_BASE_DIR=./multi_cased_L-12_H-768_A-12

echo 'Who was Jim Henson ? ||| Jim Henson was a puppeteer' > /tmp/input.txt

python extract_features.py \
  --input_file=train_all_july.csv \
  --output_file=/tmp/output_all_july.jsonl \
  --data_dir=./data \
  --num_train_rows=10 \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --layers=-1 \
  --max_seq_length=128 \
  --batch_size=8