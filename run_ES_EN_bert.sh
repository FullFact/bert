# ::::::::::::::
# Use a series of 'enhanced' training sets; each has
# ::::::::::::::
# Train model

export BERT_BASE_DIR=./multi_cased_L-12_H-768_A-12

FILES="train_*ESar*ENgb.csv"
<<<<<<< HEAD
# FILES="train_*.csv"
=======
>>>>>>> 042d421d2ae5f8271c9fc21d1733bdb04cff8270
for f in data/$FILES
do
    echo $f
    TRAIN=${f##data/}
    echo $TRAIN
    TEST=test${f/data\/train/}
    echo $TEST

<<<<<<< HEAD
    cp bert_output/checkpoint_0 bert_output/checkpoint  # reset to clean model
=======
#    cp bert_output_enhanced/checkpoint_0 bert_output_enhanced/checkpoint  # reset to clean model
>>>>>>> 042d421d2ae5f8271c9fc21d1733bdb04cff8270

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
<<<<<<< HEAD
    --output_dir=./bert_output/ \
=======
    --output_dir=./bert_output_enhanced_$TEST/ \
>>>>>>> 042d421d2ae5f8271c9fc21d1733bdb04cff8270
    --do_lower_case=False \
    --do_predict=true \
    --test_filename=test_chequeado.csv \
    --test_out_filename=$TEST \
    --predict_on_train=false

<<<<<<< HEAD
=======

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
    --output_dir=./bert_output_enhanced_$TEST/ \
    --do_lower_case=False \
    --do_predict=true \
    --test_filename=test_chequeado.csv \
    --test_out_filename=$TEST \
    --predict_on_train=false


>>>>>>> 042d421d2ae5f8271c9fc21d1733bdb04cff8270
done
