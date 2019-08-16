# Get predicted scores

export BERT_BASE_DIR=./multi_cased_L-12_H-768_A-12

for TRAIN_SIZE in 100 200 #500 1000 1500 2000 2500 3000 3500

do
	python run_multilabels_classifier.py \
	--do_train=false \
	--train_filename=train_all_july.csv \
	--do_eval=false \
	--data_dir=./data \
	--vocab_file=$BERT_BASE_DIR/vocab.txt \
	--bert_config_file=$BERT_BASE_DIR/bert_config.json \
	-init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
	--max_seq_length=128 \
	--output_dir=./bert_output_$TRAIN_SIZE/ \
	--do_lower_case=False \
	--num_train_rows=$TRAIN_SIZE \
	--do_predict=true \
	--predict_on_train=true
	--test_out_filename="pred_train_$TRAIN_SIZE.csv" \
done
