# ::::::::::::::
# Use a series of 'enhanced' training sets; each has
# ::::::::::::::
# Train model

export BERT_BASE_DIR=./multi_cased_L-12_H-768_A-12

FILES="train_*ESar*ENgb.csv"
# FILES="train_*.csv"
for f in data/$FILES
do
    echo $f
    TRAIN=${f##data/}
    echo $TRAIN
    TEST=test${f/data\/train/}
    echo $TEST

    cp bert_output/checkpoint_0 bert_output/checkpoint  # reset to clean model

    python run_multilabels_classifier.py \
    --task_name=multilabel \
    --do_train=true \
    --train_filename=$TRAIN \
    --do_eval=true \
    --dev_filename=dev_chequeado.csv\
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
    --do_predict=true \
    --test_filename=test_chequeado.csv \
    --test_out_filename=$TEST \
    --predict_on_train=false

done
