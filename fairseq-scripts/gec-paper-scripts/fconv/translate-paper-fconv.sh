PROJECT_ROOT='../../..'
DATASET='gec-paper'
MODEL=fconv
MODEL_DIR=$PROJECT_ROOT/checkpoints/$DATASET/$MODEL

python $PROJECT_ROOT/fairseq/generate.py \
    $PROJECT_ROOT/data-bin/$DATASET/ \
    --path $MODEL_DIR/checkpoint_best.pt \
    --batch-size 128 \
    --beam 5
