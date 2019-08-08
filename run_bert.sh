# ::::::::::::::
# run_bert.sh
# ::::::::::::::
# Train model

export BERT_BASE_DIR=./multi_cased_L-12_H-768_A-12

for TRAIN_SIZE in 100 500 1000 1500 2000 2500 3000 3500

do
	rm bert_output/checkpoint
	rm bert_output/model.ckpt*

	python run_multilabels_classifier.py \
	--task_name=multilabel \
	--do_train=true \
	--do_eval=true \
	--data_dir=./data \
	--vocab_file=$BERT_BASE_DIR/vocab.txt \
	--bert_config_file=$BERT_BASE_DIR/bert_config.json \
	-init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
	--max_seq_length=128 \
	--train_batch_size=32 \
	--learning_rate=2e-5 \
	--num_train_epochs=3.0 \
	--output_dir=./bert_output/ \
	--do_lower_case=False \
	--num_train_rows=$TRAIN_SIZE \
	--test_out_filename="test_out_$TRAIN_SIZE.csv" \
	--do_predict=true \
	--predict_on_train=true

done
