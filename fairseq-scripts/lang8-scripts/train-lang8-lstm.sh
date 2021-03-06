PROJECT_ROOT='../..'

python $PROJECT_ROOT/fairseq/train.py \
    $PROJECT_ROOT/data-bin/lang-8-fairseq \
    --save-dir $PROJECT_ROOT/checkpoints/lang8/lstm \
    --lr 0.25 \
    --clip-norm 0.1 \
    --dropout 0.2 \
    --max-tokens 2000 \
    --max-sentences 32 \
    --arch lstm \
