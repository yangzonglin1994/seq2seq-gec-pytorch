PROJECT_ROOT='../../..'
MODEL_DIR=$PROJECT_ROOT/checkpoints/gec-paper/lstm

python $PROJECT_ROOT/fairseq/generate.py \
    $PROJECT_ROOT/data-bin/gec-paper/ \
    --path $MODEL_DIR/checkpoint_best.pt \
    --batch-size 128 \
    --beam 5 | ../sort.py ./conll-2014-test.out
# | grep ^H | cut -f3- > ./conll-2014-test.out
