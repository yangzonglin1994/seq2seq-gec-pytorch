PROJECT_ROOT='../..'
MODEL_DIR=$PROJECT_ROOT/checkpoints/lang8/transformer

python $PROJECT_ROOT/fairseq/generate.py \
    $PROJECT_ROOT/data-bin/lang-8-fairseq/ \
    --path $MODEL_DIR/checkpoint_best.pt \
    --batch-size 128 \
    --beam 5
