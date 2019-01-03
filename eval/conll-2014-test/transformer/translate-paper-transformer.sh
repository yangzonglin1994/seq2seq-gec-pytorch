PROJECT_ROOT='../../..'
MODEL_DIR=$PROJECT_ROOT/checkpoints/gec-paper/transformer

python $PROJECT_ROOT/fairseq/generate.py \
    $PROJECT_ROOT/data-bin/gec-paper/ \
    --path $MODEL_DIR/checkpoint_best.pt \
    --batch-size 128 \
    --beam 5 | awk -F'\t' '/^H/{print $3}' > ./conll-2014-test.out
