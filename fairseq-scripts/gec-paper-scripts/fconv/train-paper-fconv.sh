PROJECT_ROOT='../../..'
DATASET='gec-paper'
MODEL=fconv
CHECKPOINT_DIR=$PROJECT_ROOT/checkpoints/$DATASET/$MODEL

test ! -e $CHECKPOINT_DIR && mkdir -p $CHECKPOINT_DIR

python $PROJECT_ROOT/fairseq/train.py \
    $PROJECT_ROOT/data-bin/$DATASET/ \
    --save-dir $CHECKPOINT_DIR/ \
    --arch fconv \
    --encoder-embed-dim 500 \
    --decoder-embed-dim 500 \
    --decoder-out-embed-dim 500 \
    --encoder-layers "[(1024, 3)] * 7" \
    --decoder-layers "[(1024, 3)] * 7" \
    --optimizer nag --momentum 0.99 --lr 0.25 --min-lr '1e-04' \
    --dropout 0.2 --clip-norm 0.1 \
    --max-tokens 1000 --max-sentences 10
